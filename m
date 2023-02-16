Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEAFC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 05:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUGLsz9BS/7VATLxTljGk5H0N5XZmYH7A6uSSiwl1J0=; b=fZQwMj/jje6DUO
	B1aGilSomThPTEWn7xxjXTd07IhyLt5JLPhZce+s7diLwAvgTqWe2TYffInbJbctFyaZi1qhB3Hfi
	OMRC8lJX8IlmzdIlLm+KWs4ObE/qH6+R9ciLKOq9g20PZfFWlzKca0nhWEo/b/yXVvBsSzkw4iTha
	HxJXhX3jcwOAfYYvuyFBKSGgtGCzrZ9YbiwL8nG1WlWKabvLpOnvSF0e+8RrEVPwpLapBOlMKXb3u
	0EcHuq7QR+2T36NBqLCXtGYqoqF1QmQcBZWmuce5fo3Hzc/I24QzAF8KRRFGEdLkfmbwlfcLAKWfa
	3zjreloYdmVUUKAm/BSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSXCC-008cYj-Ua; Thu, 16 Feb 2023 05:52:40 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSXC8-008cVJ-Oz
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 05:52:39 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A1C3824E1EC;
	Thu, 16 Feb 2023 13:51:51 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Feb
 2023 13:51:51 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Feb
 2023 13:51:50 +0800
Message-ID: <79b6cc69-5f34-9983-58e3-64da9fac5ef3@starfivetech.com>
Date: Thu, 16 Feb 2023 13:51:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/4] dt-bindings: mmc: Add StarFive MMC module
To: Shengyu Qu <wiagn233@outlook.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, <linux-kernel@vger.kernel.org>
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-2-william.qiu@starfivetech.com>
 <TY3P286MB26111053410F3F96C9C71D2798A39@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <9ef960ae-7b61-9ed3-5bab-822e6d7d5a76@starfivetech.com>
 <202302160545.31G5jiuf087662@SH1-CSMTP-DB111.sundns.com>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <202302160545.31G5jiuf087662@SH1-CSMTP-DB111.sundns.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_215237_146890_B717C179 
X-CRM114-Status: GOOD (  12.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIzLzIvMTYgMDo0OSwgU2hlbmd5dSBRdSB3cm90ZToKPiBIZWxsbyBXaWxsaWFtLAo+
IAo+IFRoYW5rcyBmb3IgeW91ciByZXBseS4gU28gdGhlcmUncyB2NSBzZXJpZXM/IEJ0dywgcGxl
YXNlIGZpeCBtYWludGFpbmVyIGluZm9ybWF0aW9uOgo+IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMDIxNTA4MDIwMy4yNzQ0NS0x
LWx1a2FzLmJ1bHdhaG5AZ21haWwuY29tLwo+IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBTaGVuZ3l1
Cj4gCkhpIFNoZW5neXUsCgpIZXJlIGlzIHY0IHNlcmllcywgYW5kIEkgZml4ZWQgdGhlIG1haW50
YWluZXIgaW5mb3JtYXRpb24gaW4gdGhpcyBzZXJpZXMgd2hpY2gKVWZmZSB3b3VsZCBtZXJnZSBp
biBoaXMgbmV4dCBicmFuY2guClRoYW5rcyBmb3IgdGFraW5nIHRpbWUgdG8gcmV2aWV3IHRoaXMg
cGF0Y2ggc2VyaWVzLgoKQmVzdCBSZWdhcmRzCldpbGxpYW0KPj4KPj4gT24gMjAyMy8yLzE1IDE5
OjU5LCBTaGVuZ3l1IFF1IHdyb3RlOgo+Pj4gSGVsbG8gV2lsbGlhbSwKPj4+Cj4+PiBBcmUgeW91
IHN1cmUgY2hhbmdpbmcgZHJpdmVyIGlzIGJldHRlciB0aGFuIGNoYW5naW5nIHlhbWwgYmluZGlu
Z3M/IEFsbAo+Pj4KPj4+IHByZXZpb3VzIHZlcnNpb24gc2VudCB3YXMgc3lzY29uIGFuZCBzeXNy
ZWcgc2VlbXMgbm90IGNvbnNpc3RlbnQgd2l0aAo+Pj4KPj4+IG90aGVyIGNvZGVzLgo+Pj4KPj4+
IEJlc3QgcmVnYXJkcywKPj4+Cj4+PiBTaGVuZ3l1Cj4+Pgo+PiBIaSBTaGVuZ3l1LAo+Pgo+PiBB
ZnRlciBkaXNjdXNzaW5nIHdpdGggY29sbGVhZ3Vlcywgd2UgZGVjaWRlZCB0byByZXN0b3JlIHRo
ZSBsYWJsZSBuYW1lIHRvCj4+IHN5c19zeXNjb24sIGFuZCBzeXNyZWcgd2FzIGp1c3QgYSB1bmlx
dWUgbmFtZSBmb3IgdGhlIGZ1bmN0aW9uYWxpdHkgb2YgTU1DLAo+PiB3aGljaCB3aWxsIGJlIHVz
ZWQgaW4gYWxsIGZ1dHVyZSB2ZXJzaW9ucy4KPj4KPj4gVGhhbmtzIGZvciB0YWtpbmcgdGltZSBy
ZXZpZXdpbmcgdGhpcyBwYXRjaCBzZXJpZXMuCj4+Cj4+IEJlc3QgUmVnYXJkcwo+PiBXaWxsaWFt
Cj4+Cj4+Pj4gQWRkIGRvY3VtZW50YXRpb24gdG8gZGVzY3JpYmUgU3RhckZpdmUgZGVzaWdud2Fy
ZSBtb2JpbGUgc3RvcmFnZQo+Pj4+IGhvc3QgY29udHJvbGxlciBkcml2ZXIuCj4+Pj4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBXaWxsaWFtIFFpdSA8d2lsbGlhbS5xaXVAc3RhcmZpdmV0ZWNoLmNvbT4K
Pj4+PiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBsaW5hcm8ub3JnPgo+Pj4+IC0tLQo+Pj4+IMKgwqAgLi4uL2JpbmRpbmdzL21tYy9zdGFyZml2
ZSxqaDcxMTAtbW1jLnlhbWzCoMKgwqDCoCB8IDc3ICsrKysrKysrKysrKysrKysrKysKPj4+PiDC
oMKgIDEgZmlsZSBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspCj4+Pj4gwqDCoCBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9zdGFyZml2ZSxq
aDcxMTAtbW1jLnlhbWwKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbW1jL3N0YXJmaXZlLGpoNzExMC1tbWMueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvc3RhcmZpdmUsamg3MTEwLW1tYy55YW1sCj4+Pj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjUxZTFiMDRlNzk5
Zgo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbW1jL3N0YXJmaXZlLGpoNzExMC1tbWMueWFtbAo+Pj4+IEBAIC0wLDAgKzEsNzcg
QEAKPj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZQo+Pj4+ICslWUFNTCAxLjIKPj4+PiArLS0tCj4+Pj4gKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvbW1jL3N0YXJmaXZlLGpoNzExMC1tbWMueWFtbCMKPj4+PiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+Pj4g
Kwo+Pj4+ICt0aXRsZTogU3RhckZpdmUgRGVzaWdud2FyZSBNb2JpbGUgU3RvcmFnZSBIb3N0IENv
bnRyb2xsZXIKPj4+PiArCj4+Pj4gK2Rlc2NyaXB0aW9uOgo+Pj4+ICvCoCBTdGFyRml2ZSB1c2Vz
IHRoZSBTeW5vcHN5cyBkZXNpZ253YXJlIG1vYmlsZSBzdG9yYWdlIGhvc3QgY29udHJvbGxlcgo+
Pj4+ICvCoCB0byBpbnRlcmZhY2UgYSBTb0Mgd2l0aCBzdG9yYWdlIG1lZGl1bSBzdWNoIGFzIGVN
TUMgb3IgU0QvTU1DIGNhcmRzLgo+Pj4+ICsKPj4+PiArYWxsT2Y6Cj4+Pj4gK8KgIC0gJHJlZjog
c3lub3BzeXMtZHctbXNoYy1jb21tb24ueWFtbCMKPj4+PiArCj4+Pj4gK21haW50YWluZXJzOgo+
Pj4+ICvCoCAtIFdpbGxpYW0gUWl1IDx3aWxsaWFtLnFpdUBzdGFyZml2ZXRlY2guY29tPgo+Pj4+
ICsKPj4+PiArcHJvcGVydGllczoKPj4+PiArwqAgY29tcGF0aWJsZToKPj4+PiArwqDCoMKgIGNv
bnN0OiBzdGFyZml2ZSxqaDcxMTAtbW1jCj4+Pj4gKwo+Pj4+ICvCoCByZWc6Cj4+Pj4gK8KgwqDC
oCBtYXhJdGVtczogMQo+Pj4+ICsKPj4+PiArwqAgY2xvY2tzOgo+Pj4+ICvCoMKgwqAgaXRlbXM6
Cj4+Pj4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogYml1IGNsb2NrCj4+Pj4gK8KgwqDCoMKg
wqAgLSBkZXNjcmlwdGlvbjogY2l1IGNsb2NrCj4+Pj4gKwo+Pj4+ICvCoCBjbG9jay1uYW1lczoK
Pj4+PiArwqDCoMKgIGl0ZW1zOgo+Pj4+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IGJpdQo+Pj4+ICvC
oMKgwqDCoMKgIC0gY29uc3Q6IGNpdQo+Pj4+ICsKPj4+PiArwqAgaW50ZXJydXB0czoKPj4+PiAr
wqDCoMKgIG1heEl0ZW1zOiAxCj4+Pj4gKwo+Pj4+ICvCoCBzdGFyZml2ZSxzeXNyZWc6Cj4+Pj4g
K8KgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFy
cmF5Cj4+Pj4gK8KgwqDCoCBpdGVtczoKPj4+PiArwqDCoMKgwqDCoCAtIGl0ZW1zOgo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogcGhhbmRsZSB0byBTeXN0ZW0gUmVnaXN0
ZXIgQ29udHJvbGxlciBzeXNjb24gbm9kZQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBkZXNj
cmlwdGlvbjogb2Zmc2V0IG9mIFNZU19TWVNDT05TQUlGX19TWVNDRkcgcmVnaXN0ZXIgZm9yIE1N
QyBjb250cm9sbGVyCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBzaGlm
dCBvZiBTWVNfU1lTQ09OU0FJRl9fU1lTQ0ZHIHJlZ2lzdGVyIGZvciBNTUMgY29udHJvbGxlcgo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogbWFzayBvZiBTWVNfU1lTQ09O
U0FJRl9fU1lTQ0ZHIHJlZ2lzdGVyIGZvciBNTUMgY29udHJvbGxlcgo+Pj4+ICvCoMKgwqAgZGVz
Y3JpcHRpb246Cj4+Pj4gK8KgwqDCoMKgwqAgU2hvdWxkIGJlIGZvdXIgcGFyYW1ldGVycywgdGhl
IHBoYW5kbGUgdG8gU3lzdGVtIFJlZ2lzdGVyIENvbnRyb2xsZXIKPj4+PiArwqDCoMKgwqDCoCBz
eXNjb24gbm9kZSBhbmQgdGhlIG9mZnNldC9zaGlmdC9tYXNrIG9mIFNZU19TWVNDT05TQUlGX19T
WVNDRkcgcmVnaXN0ZXIKPj4+PiArwqDCoMKgwqDCoCBmb3IgTU1DIGNvbnRyb2xsZXIuCj4+Pj4g
Kwo+Pj4+ICtyZXF1aXJlZDoKPj4+PiArwqAgLSBjb21wYXRpYmxlCj4+Pj4gK8KgIC0gcmVnCj4+
Pj4gK8KgIC0gY2xvY2tzCj4+Pj4gK8KgIC0gY2xvY2stbmFtZXMKPj4+PiArwqAgLSBpbnRlcnJ1
cHRzCj4+Pj4gK8KgIC0gc3RhcmZpdmUsc3lzcmVnCj4+Pj4gKwo+Pj4+ICt1bmV2YWx1YXRlZFBy
b3BlcnRpZXM6IGZhbHNlCj4+Pj4gKwo+Pj4+ICtleGFtcGxlczoKPj4+PiArwqAgLSB8Cj4+Pj4g
K8KgwqDCoCBtbWNAMTYwMTAwMDAgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0g
InN0YXJmaXZlLGpoNzExMC1tbWMiOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgxNjAx
MDAwMCAweDEwMDAwPjsKPj4+PiArwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZzeXNjcmcgOTE+
LAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JnN5c2NyZyA5Mz47Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gImJpdSIsImNpdSI7Cj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHJlc2V0cyA9IDwmc3lzY3JnIDY0PjsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmVz
ZXQtbmFtZXMgPSAicmVzZXQiOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHRzID0gPDc0
PjsKPj4+PiArwqDCoMKgwqDCoMKgwqAgZmlmby1kZXB0aCA9IDwzMj47Cj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGZpZm8td2F0ZXJtYXJrLWFsaWduZWQ7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRhdGEt
YWRkciA9IDwwPjsKPj4+PiArwqDCoMKgwqDCoMKgwqAgc3RhcmZpdmUsc3lzcmVnID0gPCZzeXNf
c3lzY29uIDB4MTQgMHgxYSAweDdjMDAwMDAwPjsKPj4+PiArwqDCoMKgIH07CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
