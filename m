Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90360C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOsIqfuZKm40jALep8BNCSrerszxJStW0jCYcTQTOm8=; b=diUwivCqMZCzSP
	CECjqwqy4v/E4t6kfQ5t7RFV/X0iWsBXLc/ma18e3oUqwcB3Mlx+7A/1bA2E+8r02WP/3/WhcHb6P
	OVR5BbNUqiW8h7UQG1fhFhfYpSQeS+qlw9D+ivlhdQp+VNnld20cTgQP4rZDg+RcPbFTRPV5jvgyU
	Yj0QNxmQSNQhFGj2nWzHswYwq8/LqcgQjG7H5PwzJPgdIKRtEc9FixNeWpnbCOff52glV2pfE7Jm2
	BeV9ktD7Xq0krpxx+a0S68ZkF45QW/JuWFlJMR0wfKS6DQpxV7AhZMleRm3y7+/3JMTV5xI9+QDQU
	poZN0urtewIUman8pfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGaa-005iNQ-0x; Wed, 15 Feb 2023 12:08:44 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGaV-005iL4-VD
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 12:08:42 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 4B3F524E313;
	Wed, 15 Feb 2023 20:08:16 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 20:08:16 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 20:08:15 +0800
Message-ID: <9ef960ae-7b61-9ed3-5bab-822e6d7d5a76@starfivetech.com>
Date: Wed, 15 Feb 2023 20:08:14 +0800
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
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <TY3P286MB26111053410F3F96C9C71D2798A39@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_040840_495560_5E1A3C23 
X-CRM114-Status: GOOD (  11.96  )
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

CgpPbiAyMDIzLzIvMTUgMTk6NTksIFNoZW5neXUgUXUgd3JvdGU6Cj4gSGVsbG8gV2lsbGlhbSwK
PiAKPiBBcmUgeW91IHN1cmUgY2hhbmdpbmcgZHJpdmVyIGlzIGJldHRlciB0aGFuIGNoYW5naW5n
IHlhbWwgYmluZGluZ3M/IEFsbAo+IAo+IHByZXZpb3VzIHZlcnNpb24gc2VudCB3YXMgc3lzY29u
IGFuZCBzeXNyZWcgc2VlbXMgbm90IGNvbnNpc3RlbnQgd2l0aAo+IAo+IG90aGVyIGNvZGVzLgo+
IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBTaGVuZ3l1Cj4KCkhpIFNoZW5neXUsCgpBZnRlciBkaXNj
dXNzaW5nIHdpdGggY29sbGVhZ3Vlcywgd2UgZGVjaWRlZCB0byByZXN0b3JlIHRoZSBsYWJsZSBu
YW1lIHRvIApzeXNfc3lzY29uLCBhbmQgc3lzcmVnIHdhcyBqdXN0IGEgdW5pcXVlIG5hbWUgZm9y
IHRoZSBmdW5jdGlvbmFsaXR5IG9mIE1NQywKd2hpY2ggd2lsbCBiZSB1c2VkIGluIGFsbCBmdXR1
cmUgdmVyc2lvbnMuCgpUaGFua3MgZm9yIHRha2luZyB0aW1lIHJldmlld2luZyB0aGlzIHBhdGNo
IHNlcmllcy4KCkJlc3QgUmVnYXJkcwpXaWxsaWFtCgo+PiBBZGQgZG9jdW1lbnRhdGlvbiB0byBk
ZXNjcmliZSBTdGFyRml2ZSBkZXNpZ253YXJlIG1vYmlsZSBzdG9yYWdlCj4+IGhvc3QgY29udHJv
bGxlciBkcml2ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFdpbGxpYW0gUWl1IDx3aWxsaWFtLnFp
dUBzdGFyZml2ZXRlY2guY29tPgo+PiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+PiAtLS0KPj4gwqAgLi4uL2JpbmRpbmdz
L21tYy9zdGFyZml2ZSxqaDcxMTAtbW1jLnlhbWzCoMKgwqDCoCB8IDc3ICsrKysrKysrKysrKysr
KysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvc3RhcmZp
dmUsamg3MTEwLW1tYy55YW1sCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbW1jL3N0YXJmaXZlLGpoNzExMC1tbWMueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvc3RhcmZpdmUsamg3MTEwLW1tYy55YW1sCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTFlMWIwNGU3OTlmCj4+
IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21tYy9zdGFyZml2ZSxqaDcxMTAtbW1jLnlhbWwKPj4gQEAgLTAsMCArMSw3NyBAQAo+PiArIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQo+PiAr
JVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
bW1jL3N0YXJmaXZlLGpoNzExMC1tbWMueWFtbCMKPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICt0aXRsZTogU3RhckZpdmUg
RGVzaWdud2FyZSBNb2JpbGUgU3RvcmFnZSBIb3N0IENvbnRyb2xsZXIKPj4gKwo+PiArZGVzY3Jp
cHRpb246Cj4+ICvCoCBTdGFyRml2ZSB1c2VzIHRoZSBTeW5vcHN5cyBkZXNpZ253YXJlIG1vYmls
ZSBzdG9yYWdlIGhvc3QgY29udHJvbGxlcgo+PiArwqAgdG8gaW50ZXJmYWNlIGEgU29DIHdpdGgg
c3RvcmFnZSBtZWRpdW0gc3VjaCBhcyBlTU1DIG9yIFNEL01NQyBjYXJkcy4KPj4gKwo+PiArYWxs
T2Y6Cj4+ICvCoCAtICRyZWY6IHN5bm9wc3lzLWR3LW1zaGMtY29tbW9uLnlhbWwjCj4+ICsKPj4g
K21haW50YWluZXJzOgo+PiArwqAgLSBXaWxsaWFtIFFpdSA8d2lsbGlhbS5xaXVAc3RhcmZpdmV0
ZWNoLmNvbT4KPj4gKwo+PiArcHJvcGVydGllczoKPj4gK8KgIGNvbXBhdGlibGU6Cj4+ICvCoMKg
wqAgY29uc3Q6IHN0YXJmaXZlLGpoNzExMC1tbWMKPj4gKwo+PiArwqAgcmVnOgo+PiArwqDCoMKg
IG1heEl0ZW1zOiAxCj4+ICsKPj4gK8KgIGNsb2NrczoKPj4gK8KgwqDCoCBpdGVtczoKPj4gK8Kg
wqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogYml1IGNsb2NrCj4+ICvCoMKgwqDCoMKgIC0gZGVzY3Jp
cHRpb246IGNpdSBjbG9jawo+PiArCj4+ICvCoCBjbG9jay1uYW1lczoKPj4gK8KgwqDCoCBpdGVt
czoKPj4gK8KgwqDCoMKgwqAgLSBjb25zdDogYml1Cj4+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IGNp
dQo+PiArCj4+ICvCoCBpbnRlcnJ1cHRzOgo+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+ICsKPj4g
K8KgIHN0YXJmaXZlLHN5c3JlZzoKPj4gK8KgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5Cj4+ICvCoMKgwqAgaXRlbXM6Cj4+ICvCoMKgwqDC
oMKgIC0gaXRlbXM6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogcGhhbmRs
ZSB0byBTeXN0ZW0gUmVnaXN0ZXIgQ29udHJvbGxlciBzeXNjb24gbm9kZQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IG9mZnNldCBvZiBTWVNfU1lTQ09OU0FJRl9fU1lTQ0ZH
IHJlZ2lzdGVyIGZvciBNTUMgY29udHJvbGxlcgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZGVz
Y3JpcHRpb246IHNoaWZ0IG9mIFNZU19TWVNDT05TQUlGX19TWVNDRkcgcmVnaXN0ZXIgZm9yIE1N
QyBjb250cm9sbGVyCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogbWFzayBv
ZiBTWVNfU1lTQ09OU0FJRl9fU1lTQ0ZHIHJlZ2lzdGVyIGZvciBNTUMgY29udHJvbGxlcgo+PiAr
wqDCoMKgIGRlc2NyaXB0aW9uOgo+PiArwqDCoMKgwqDCoCBTaG91bGQgYmUgZm91ciBwYXJhbWV0
ZXJzLCB0aGUgcGhhbmRsZSB0byBTeXN0ZW0gUmVnaXN0ZXIgQ29udHJvbGxlcgo+PiArwqDCoMKg
wqDCoCBzeXNjb24gbm9kZSBhbmQgdGhlIG9mZnNldC9zaGlmdC9tYXNrIG9mIFNZU19TWVNDT05T
QUlGX19TWVNDRkcgcmVnaXN0ZXIKPj4gK8KgwqDCoMKgwqAgZm9yIE1NQyBjb250cm9sbGVyLgo+
PiArCj4+ICtyZXF1aXJlZDoKPj4gK8KgIC0gY29tcGF0aWJsZQo+PiArwqAgLSByZWcKPj4gK8Kg
IC0gY2xvY2tzCj4+ICvCoCAtIGNsb2NrLW5hbWVzCj4+ICvCoCAtIGludGVycnVwdHMKPj4gK8Kg
IC0gc3RhcmZpdmUsc3lzcmVnCj4+ICsKPj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UK
Pj4gKwo+PiArZXhhbXBsZXM6Cj4+ICvCoCAtIHwKPj4gK8KgwqDCoCBtbWNAMTYwMTAwMDAgewo+
PiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMTAtbW1jIjsKPj4g
K8KgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDE2MDEwMDAwIDB4MTAwMDA+Owo+PiArwqDCoMKgwqDC
oMKgwqAgY2xvY2tzID0gPCZzeXNjcmcgOTE+LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPCZzeXNjcmcgOTM+Owo+PiArwqDCoMKgwqDCoMKgwqAgY2xvY2stbmFtZXMgPSAi
Yml1IiwiY2l1IjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlc2V0cyA9IDwmc3lzY3JnIDY0PjsKPj4g
K8KgwqDCoMKgwqDCoMKgIHJlc2V0LW5hbWVzID0gInJlc2V0IjsKPj4gK8KgwqDCoMKgwqDCoMKg
IGludGVycnVwdHMgPSA8NzQ+Owo+PiArwqDCoMKgwqDCoMKgwqAgZmlmby1kZXB0aCA9IDwzMj47
Cj4+ICvCoMKgwqDCoMKgwqDCoCBmaWZvLXdhdGVybWFyay1hbGlnbmVkOwo+PiArwqDCoMKgwqDC
oMKgwqAgZGF0YS1hZGRyID0gPDA+Owo+PiArwqDCoMKgwqDCoMKgwqAgc3RhcmZpdmUsc3lzcmVn
ID0gPCZzeXNfc3lzY29uIDB4MTQgMHgxYSAweDdjMDAwMDAwPjsKPj4gK8KgwqDCoCB9OwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
