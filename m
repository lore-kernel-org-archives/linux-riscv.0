Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06354C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 07:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mx8sEO8iIRi48i5W+LacD8zOAANDS6ovx/Z4jpVVDw=; b=mAl0yhrXfqfoBU
	KLFEfWNYY2GMJUvgd+PCGDgoB4cPdYXvT/KyvOt2EXTo1RJZLBUVmGqh3w1ybFtRmeWD/AOX+4ltB
	ouCsLkA5ogwWdEY2mzWoHChIL7m4tnnZWpiDGYqDRSUv+Gtv1hIVhSpxRl4XfKN4tSzRrmds1XWnn
	OIM4MGDZJr4gLp79CcdIuYq3e2ZCQWmZBtfaHQ5dt1gwZS7LNq8gp5LGeZ4uAT9y6FRuYYFs32Z5Z
	Xnd1+eoV3Pg4maxbLLY55URqV5B3St/mbcDG986RdLv62RdjxlFJEiQVoDMau4AS5Jxv0JuMhTVzx
	Am/dJbdUA4iNcQqnfwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzu1I-00G0SH-0P;
	Mon, 06 Nov 2023 07:27:36 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzu1E-00G0Qi-2E
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 07:27:35 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id BC38A24DE73;
	Mon,  6 Nov 2023 15:26:48 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Nov
 2023 15:26:48 +0800
Received: from [192.168.120.47] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Nov
 2023 15:26:47 +0800
Message-ID: <6b57eb4b-241f-4530-b639-5a2e2c55cfd3@starfivetech.com>
Date: Mon, 6 Nov 2023 15:26:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] pwm: opencores: Add PWM driver support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Hal Feng <hal.feng@starfivetech.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
References: <20231020103741.557735-1-william.qiu@starfivetech.com>
 <20231020103741.557735-3-william.qiu@starfivetech.com>
 <20231020112539.gctx5uj2rrhryulo@pengutronix.de>
 <7d64ea1d-b573-4a69-ba0c-4cbfab638c5e@starfivetech.com>
 <20231102113016.jgsh7jru6vjv4vsp@pengutronix.de>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20231102113016.jgsh7jru6vjv4vsp@pengutronix.de>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_232733_050883_38F5B0D1 
X-CRM114-Status: GOOD (  17.94  )
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

CgpPbiAyMDIzLzExLzIgMTk6MzAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEhlbGxvIFdp
bGxpYW0sCj4gCj4gT24gV2VkLCBOb3YgMDEsIDIwMjMgYXQgMTA6MjI6NDRBTSArMDgwMCwgV2ls
bGlhbSBRaXUgd3JvdGU6Cj4+IAo+PiAKPj4gT24gMjAyMy8xMC8yMCAxOToyNSwgVXdlIEtsZWlu
ZS1Lw7ZuaWcgd3JvdGU6Cj4+ID4+ICsJdm9pZCBfX2lvbWVtICpiYXNlID0gcHdtLT5kYXRhLT5n
ZXRfY2hfYmFzZSA/Cj4+ID4+ICsJCQkgICAgIHB3bS0+ZGF0YS0+Z2V0X2NoX2Jhc2UocHdtLT5y
ZWdzLCBkZXYtPmh3cHdtKSA6IHB3bS0+cmVnczsKPj4gPj4gKwl1MzIgcGVyaW9kX2RhdGEsIGR1
dHlfZGF0YSwgY3RybF9kYXRhOwo+PiA+PiArCj4+ID4+ICsJcGVyaW9kX2RhdGEgPSByZWFkbChS
RUdfT0NQV01fTFJDKGJhc2UpKTsKPj4gPj4gKwlkdXR5X2RhdGEgPSByZWFkbChSRUdfT0NQV01f
SFJDKGJhc2UpKTsKPj4gPj4gKwljdHJsX2RhdGEgPSByZWFkbChSRUdfT0NQV01fQ1RSTChiYXNl
KSk7Cj4+ID4+ICsKPj4gPj4gKwlzdGF0ZS0+cGVyaW9kID0gRElWX1JPVU5EX0NMT1NFU1RfVUxM
KCh1NjQpcGVyaW9kX2RhdGEgKiBOU0VDX1BFUl9TRUMsIHB3bS0+Y2xrX3JhdGUpOwo+PiA+PiAr
CXN0YXRlLT5kdXR5X2N5Y2xlID0gRElWX1JPVU5EX0NMT1NFU1RfVUxMKCh1NjQpZHV0eV9kYXRh
ICogTlNFQ19QRVJfU0VDLCBwd20tPmNsa19yYXRlKTsKPj4gPiAKPj4gPiBQbGVhc2UgdGVzdCB5
b3VyIGRyaXZlciB3aXRoIFBXTV9ERUJVRyBlbmFibGVkLiBUaGUgcm91bmRpbmcgaXMgd3JvbmcK
Pj4gPiBoZXJlLgo+PiAKPj4gVGhlIGNvbmNsdXNpb24gYWZ0ZXIgY2hlY2tpbmcgaXM6IHdoZW4g
dGhlIHBlcmlvZCBvciBkdXR5X2N5Y2xlIHZhbHVlIHNldAo+PiBieSB0aGUgdXNlciBpcyBub3Qg
ZGl2aXNpYmxlICgxMDAwMDAwMDAwLzQ5LjVNKSwgdGhlcmUgd2lsbCBiZSBhbiBlcnJvci4KPj4g
VGhpcyBlcnJvciBpcyBkdWUgdG8gaGFyZHdhcmUgYWNjdXJhY3kuIFNvIHdoeSBpcyByb3VuZGlu
ZyBpcyB3cm9uZz8KPj4gcm9ja2NoaXAgYWxzbyBoYXMgYSBzaW1pbGFyIGltcGxlbWVudGF0aW9u
IGRyaXZlcnMvcHdtLyBwd20tcm9ja2NoaXAuYwo+IAo+IEkgZmFpbCB0byBmb2xsb3cuIFdoZXJl
IGlzIGFuIGVycm9yPwo+IAo+IFRoZSBnZW5lcmFsIHBvbGljeSAoZm9yIG5ldyBkcml2ZXJzIGF0
IGxlYXN0KSBpcyB0byBpbXBsZW1lbnQgdGhlCj4gYmlnZ2VzdCBwZXJpb2QgcG9zc2libGUgbm90
IGJpZ2dlciB0aGFuIHRoZSByZXF1ZXN0ZWQgcGVyaW9kLiBUaGF0IG1lYW5zCj4gdGhhdCAuYXBw
bHkgbXVzdCByb3VuZCBkb3duIGFuZCB0byBtYWtlIC5hcHBseSDiiJggLmdldF9zdGF0ZSBpZGVt
cG90ZW50Cj4gLmdldF9zdGF0ZSBtdXN0IHJvdW5kIHVwIHRvIG1hdGNoLgo+IAo+IEFzc3VtaW5n
IGEgY2xrcmF0ZSBvZiA0OTUwMDAwMCBIeiB0aGUgYWN0dWFsIHBlcmlvZCBmb3IgUkVHX09DUFdN
X0xSQyA9Cj4gNDAwIGlzIDgwODAuODA4bnMgYW5kIGZvciBSRUdfT0NQV01fTFJDID0gNDAxIGlz
IDgxMDEuMDEwLgo+IAo+IFNvIHdpdGggUkVHX09DUFdNX0xSQyA9IDQwMSAuZ2V0X3N0YXRlIHNo
b3VsZCByZXBvcnQgc3RhdGUucGVyaW9kID0gODEwMgo+IFtuc10gYmVjYXVzZSBpZiB5b3UgY2Fs
bCAuYXBwbHkgd2l0aCAucGVyaW9kID0gODEwMSBbbnNdIHlvdSdyZSBzdXBwb3NlZAo+IHRvIHVz
ZSBSRUdfT0NQV01fTFJDID0gNDAwLgo+IAo+IFJvdW5kaW5nIHVzaW5nIERJVl9ST1VORF9DTE9T
RVNUIGRvZXNuJ3QgZ2l2ZSBjb25zaXN0ZW50IGJlaGF2aW91ciBpbgo+IHNvbWUgY2FzZXMuIENv
bnNpZGVyIGEgUFdNIHRoYXQgY2FuIGltcGxlbWVudCB0aGUgZm9sbG93aW5nIHBlcmlvZHMgKGFu
ZAo+IG5vbmUgaW4gYmV0d2Vlbik6Cj4gCj4gCTIwLjEgbnMKPiAJMjAuNCBucwo+IAkyMS43IG5z
Cj4gCj4gV2l0aCByb3VuZC10by1uZWFyZXN0IGEgcmVxdWVzdCB0byBjb25maWd1cmUgMjEgbnMg
d2lsbCB5aWVsZCAyMC40IG5zLgo+IElmIHlvdSBjYWxsIC5nZXRfc3RhdGUgdGhlcmUgdGhlIGRy
aXZlciB3aWxsIHJldHVybiAyMCBucy4gSG93ZXZlcgo+IGNvbmZpZ3VyaW5nIDIwIG5zIHJlc3Vs
dHMgaW4gYSBwZXJpb2Qgb2YgMjAuMSBucy4KPiAKPiBXaXRoIHJvdW5kaW5nIGFzIHJlcXVlc3Rl
ZCBhYm92ZSB5b3UgZ2V0IGEgY29uc2lzdGVudCBiZWhhdmlvdXIuIEFmdGVyCj4gLmFwcGx5X3N0
YXRlKHBlcmlvZD0yMSkgLmdldF9zdGF0ZSgpIHJldHVybnMgcGVyaW9kPTIxLgo+IAo+IEJlc3Qg
cmVnYXJkcwo+IFV3ZQo+IApJIHNlZSwgdGhlbiB3ZSdsbCB1c2UgRElWX1JPVU5EX0RPV05fVUxM
IGZvciAuYXBwbHkoKSBhbmQgRElWX1JPVU5EX1VQX1VMTApmb3IgLmdldF9zdGF0ZSgpLgpUaGFu
ayB5b3UgZm9yIHlvdXIgYW5zd2VyLgoKQmVzdCByZWdhcmRzLApXaWxsaWFtCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
