using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using System.Text;

/// <summary>
/// AppHelper 的摘要说明
/// </summary>
public class AppHelper
{
    public AppHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public static List<string> splitString(string originString, string splitString)
    {
        int curIndex = 0;
        int preIndex = 0;
        int spiltStringLen = splitString.Length;
        List<string> indexes = new List<string>();
        while (true)
        {
            curIndex = originString.IndexOf(splitString, curIndex);
            if (curIndex == -1) break;
            indexes.Add(originString.Substring(preIndex, curIndex - preIndex));
            curIndex += spiltStringLen;
            preIndex = curIndex;
        }
        return indexes;
    }

    /// <summary>
    /// 传入单个字符的ASCII码，得到ASCII码对应的字符（含双字节）
    /// </summary>
    /// <param name="asc">-13120</param>
    /// <returns>汤</returns>
    public static string Chr(int asc)
    {
        //asc = asc + 65536;
        Encoding asciiEncoding = Encoding.GetEncoding("GB18030");
        Byte[] chrByte = BitConverter.GetBytes((short)asc);
        string strCharacter = string.Empty;
        if (asc < 0 || asc > 255)
        {
            Byte[] chrByteStr = new byte[2];
            chrByteStr[0] = chrByte[1];
            chrByteStr[1] = chrByte[0];
            strCharacter = asciiEncoding.GetString(chrByteStr);
        }
        else
        {
            Byte[] chrByteStr = new byte[1];
            chrByteStr[0] = chrByte[0];
            strCharacter = asciiEncoding.GetString(chrByteStr);
        }
        return (strCharacter);
    }

    public static string GetSafeSQLString(string value)
    {
        if (string.IsNullOrEmpty(value))
            return string.Empty;
        value = Regex.Replace(value, ";", "；");
        value = Regex.Replace(value, "--", "——");
        value = Regex.Replace(value, "%20", "");
        value = Regex.Replace(value, "==", "");
        value = Regex.Replace(value, ">", ">");
        value = Regex.Replace(value, "<", "<");
        value = Regex.Replace(value, Chr(32), " ");
        value = Regex.Replace(value, Chr(9), " ");
        value = Regex.Replace(value, Chr(34), "\"");
        value = Regex.Replace(value, Chr(39), "'");
        value = Regex.Replace(value, Chr(13), "");
        //value = Regex.Replace(value, Chr(10) & Chr(10), "</P><P> ");
        value = Regex.Replace(value, Chr(10), "<BR> ");
        value = "\"" + value + "\"";
        return value;
    }
}