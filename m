Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1623C072A2
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 07:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Or/C2bDEshqLRqd37ADUg92eA6u4Bjq9zNGY9/csjA=; b=TeuyHggB2Pi6qw
	i+JyyNrFGq8D3BFUATqeTcEFcov/DgtryLWa94+uu/omoQ3UC6V4En+HUcdvTMRAdGr94hGNmdaGV
	M7yx8eP2vIWgJCvzecag0FGCsm7rFbZFKMdaQ5uLav9PWIIvUaKAq0di6+YVRli/vXkEYZkaP9TAk
	jABoIxax2Cp6/aq4GkAZokPvf19fd8zN2fyNehOCJIPYXniZDxSyjUYu8+kMxPdTGCwd/Vs6ld0zE
	f7vvSgpNpjWd3Oq8WrrY/ZB1/0sQ+O+CjEpCzG2tdbOYqpitNL2XTt9599rkpJ8j0zprUk3KLaVpM
	WroVrh01oDRiFuaIlYOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5hHg-000sP3-2d;
	Wed, 22 Nov 2023 07:04:28 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5hHb-000sMG-2b
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 07:04:26 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 81E6B8132;
	Wed, 22 Nov 2023 15:03:38 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Nov
 2023 15:03:38 +0800
Received: from [192.168.120.47] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Nov
 2023 15:03:37 +0800
Message-ID: <1ba3e8d1-ed89-4aab-ae27-d8d31ee2f150@starfivetech.com>
Date: Wed, 22 Nov 2023 15:03:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] dt-bindings: pwm: Add OpenCores PWM module
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Hal Feng <hal.feng@starfivetech.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
References: <20231110062039.103339-1-william.qiu@starfivetech.com>
 <20231110062039.103339-2-william.qiu@starfivetech.com>
 <afce202d-6234-4c5f-9018-facd9a56b5eb@linaro.org>
 <f4551a7a-61e6-4d97-94c2-da2e4e9e8cb3@starfivetech.com>
 <824cee7b-e4d3-461a-8bfb-4ad095c240fd@linaro.org>
 <20231113-sprung-tantrum-94659009b9d4@squawk>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20231113-sprung-tantrum-94659009b9d4@squawk>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_230424_645138_DDD53F20 
X-CRM114-Status: GOOD (  15.51  )
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

CgpPbiAyMDIzLzExLzE0IDQ6MTcsIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBNb24sIE5vdiAx
MywgMjAyMyBhdCAwOTowNzoxNVBNICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+
PiBPbiAxMy8xMS8yMDIzIDEwOjQyLCBXaWxsaWFtIFFpdSB3cm90ZToKPj4gPiBXaWxsIHVwZGF0
ZS4KPj4gPj4+ICsKPj4gPj4+ICthbGxPZjoKPj4gPj4+ICsgIC0gJHJlZjogcHdtLnlhbWwjCj4+
ID4+PiArCj4+ID4+PiArcHJvcGVydGllczoKPj4gPj4+ICsgIGNvbXBhdGlibGU6Cj4+ID4+PiAr
ICAgIG9uZU9mOgo+PiA+Pj4gKyAgICAgIC0gaXRlbXM6Cj4+ID4+PiArICAgICAgICAgIC0gZW51
bToKPj4gPj4+ICsgICAgICAgICAgICAgIC0gc3RhcmZpdmUsamg3MTAwLXB3bQo+PiA+Pj4gKyAg
ICAgICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtcHdtCj4+ID4+PiArICAgICAgICAgIC0gY29u
c3Q6IG9wZW5jb3Jlcyxwd20KPj4gPj4KPj4gPj4gVGhhdCdzIGEgdmVyeSwgdmVyeSBnZW5lcmlj
IGNvbXBhdGlibGUuIEFyZSB5b3Ugc3VyZSwgMTAwJSBzdXJlLCB0aGF0Cj4+ID4+IGFsbCBkZXNp
Z25zIGZyb20gT3BlbkNvcmVzIGZyb20gbm93IHRpbGwgbmV4dCAxMDAgeWVhcnMgd2lsbCBiZSAx
MDAlCj4+ID4+IGNvbXBhdGlibGU/Cj4+ID4+Cj4+ID4gTXkgZGVzY3JpcHRpb24gaXMgbm90IGFj
Y3VyYXRlIGVub3VnaCwgdGhpcyBpcyBPcGVuQ29yZXMgUFRDIElQLCBhbmQgUFdNCj4+ID4gaXMg
b25lIG9mIHRob3NlIG1vZGVzLCBzbyBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gcmVwbGFjZSBjb21w
YXRpYmxlIHdpdGgKPj4gPiAib3BlbmNvcmVzLCBwdGMtcHdtIgo+PiA+IAo+PiA+IFdoYXQgZG8g
eW91IHRoaW5rPwo+PiAKPj4gU29ycnksIG1heWJlIHRoaXMgYW5zd2VycyBtYXliZSBkb2Vzbid0
LiBXaGF0IGlzICJQVEMiPwo+IAo+ICJwd20gdGltZXIgY291bnRlciIuIEFGQUlVLCB0aGUgSVAg
Y2FuIGJlIGNvbmZpZ3VyZWQgdG8gcHJvdmlkZSBhbGwgMy4KPiBJIHRoaW5rIHRoYXQgV2lsbGlh
bSBwb2ludGVkIG91dCBvbiBhbiBlYXJsaWVyIHJldmlzaW9uIHRoYXQgdGhleSBoYXZlCj4gb25s
eSBpbXBsZW1lbnRlZCB0aGUgcHdtIG9uIHRoZWlyIGhhcmR3YXJlLgo+IEkgZG9uJ3QgdGhpbmsg
cHV0dGluZyBpbiAicHRjIiBpcyBhIHN1ZmZpY2llbnQgZGlmZmVyZW50aWF0b3IgdGhvdWdoLCBh
cwo+IGNsZWFybHkgdGhlcmUgY291bGQgYmUgc2V2ZXJhbCBkaWZmZXJlbnQgdmVyc2lvbnMgb2Yg
InB0Yy1wd20iIHRoYXQgaGF2ZQo+IHRoZSBzYW1lIGNvbmNlcm4gYWJvdXQgImFsbCBkZXNpZ25z
IGZyb20gT3BlbkNvcmVzIGZvciBub3cgdGlsbCB0aGUgbmV4dAo+IDEwMCB5ZWFycyIgYmVpbmcg
Y29tcGF0aWJsZS4KPiAKPiBDaGVlcnMuCj4gQ29ub3IuCgpIae+8jENvbm9yIGFuZCBLcnp5c3p0
b2YsCgpBZnRlciBkaXNjdXNzaW9uIGFuZCByZXZpZXcgb2YgbWF0ZXJpYWxzLCB3ZSBwbGFuIHRv
IHVzZSAib3BlbmNvcmVzLHB0Yy1wd20tdjEiCmFzIHRoaXMgdmVyc2lvbiBvZiBjb21wYXRpYmxl
LCBzbyB0aGF0IGl0IGNhbiBhbHNvIGJlIGNvbXBhdGlibGUgaW4gdGhlIGZ1dHVyZS4KCldoYXQg
ZG8geW91IHRoaW5rPwoKCkJlc3QgcmVnYXJkcywKV2lsbGlhbQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
