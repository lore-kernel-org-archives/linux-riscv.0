Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3B7C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tX7FhTMirTGwpKblL9V0QvYaVWkeFXF4V8FzfgZ8V1c=; b=pHL9avuUY9l0+i
	dEqBFXMBsoywVo4NP2h5BHnBSnBXRf3Fr/AKMdtv/Z+yeoUD/OCrb4Jqar1kAkRN1rh7CJsK18DTT
	1pFxNTMJxD3N09u/vNTaZa0dlYvxvCEtjMOyF9QHa/4L7yovnY3IELMmMDlsB557hk7dfkRBu31U1
	AARJXUVIhPxXqS0gHkgEySD/eqgOE3+Kcd63pCR60CW79EWiANFVXiJzVjTdF+lVugK7iX3Hi+oFq
	RlXOvcCtvVbXrwDhPpdkD5sGL8Kt+NiGwbeD3+6jgZ/Qb9S3uZXWE39j+A2Jss9wCrgr8xIP4AaTB
	dUT2Pr5EPxNXReG+yBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0zwR-005YZB-2h;
	Thu, 09 Nov 2023 07:59:07 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0zwN-005YVl-0n
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 07:59:06 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id AC0898086;
	Thu,  9 Nov 2023 15:57:59 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Nov
 2023 15:57:59 +0800
Received: from [192.168.125.131] (113.72.144.54) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Nov
 2023 15:57:59 +0800
Message-ID: <7c2e9b70-201c-45f8-9871-a823cc2ded16@starfivetech.com>
Date: Thu, 9 Nov 2023 15:51:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clocksource: Add JH7110 timer driver
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Walker Chen
	<walker.chen@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
References: <20231019053501.46899-1-xingyu.wu@starfivetech.com>
 <20231019053501.46899-3-xingyu.wu@starfivetech.com>
 <3f76f965-7c7b-109e-2ee0-3033e332e84b@linaro.org>
 <bb819333-52d3-49fc-9bb9-1a227bd5ca8f@starfivetech.com>
 <d0e70434-e273-4799-c5ec-bbee1b3f5cc7@linaro.org>
 <540136d4-6f8f-49a6-80ff-cc621f2f462b@starfivetech.com>
 <65c38717-3e0c-46d3-a124-29cae48f1a2e@linaro.org>
 <72ad5029-42b2-481a-887f-8f6079d8859b@starfivetech.com>
 <a8f0011c-5689-4071-b5e0-90bd6b7c66bc@linaro.org>
 <b402eb4d-a770-4988-8274-8a2544362229@starfivetech.com>
 <1dd3d765-c583-4db9-a0aa-303bfcf871db@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <1dd3d765-c583-4db9-a0aa-303bfcf871db@linaro.org>
X-Originating-IP: [113.72.144.54]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_235903_597209_7B6D2007 
X-CRM114-Status: GOOD (  16.99  )
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

T24gMjAyMy8xMS84IDE3OjEwLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBPbiAwOC8xMS8yMDIz
IDA0OjQ1LCBYaW5neXUgV3Ugd3JvdGU6Cj4+IE9uIDIwMjMvMTEvMiAyMjoyOSwgRGFuaWVsIExl
emNhbm8gd3JvdGU6Cj4gCj4gWyAuLi4gXQo+IAo+PiBUaGFua3MuIFRoZSByaXNjdi10aW1lciBo
YXMgYSBjbG9ja3NvdXJjZSB3aXRoIGEgaGlnaGVyIHJhdGluZyBidXQgYQo+PiBjbG9ja2V2ZW50
IHdpdGggbG93ZXIgcmF0aW5nWzFdIHRoYW4gamg3MTEwLXRpbWVyLiBJIHRlc3RlZCB0aGUKPj4g
amg3MTEwLXRpbWVyIGFzIGNsb2NrZXZlbnQgYW5kIGZsYWdnZWQgYXMgb25lIHNob3QsIHdoaWNo
IGNvdWxkIGRvCj4+IHNvbWUgb2YgdGhlIHdvcmtzIGluc3RlYWQgb2YgcmlzY3YtdGltZXIuIEFu
ZCB0aGUgY3VycmVudF9jbG9ja2V2ZW50Cj4+IGNoYW5nZWQgdG8gamg3MTEwLXRpbWVyLgo+Pgo+
PiBCZWNhdXNlIHRoZSBqaDcxMTAtdGltZXIgd29ya3MgYXMgY2xvY2tzb3VyY2Ugd2l0aCBsb3dl
ciByYXRpbmcgYW5kCj4+IG9ubHkgd2lsbCBiZSB1c2VkIGFzIGdsb2JhbCB0aW1lciBhdCBDUFUg
aWRsZSB0aW1lLiBJcyBpdCBuZWNlc3NhcnkKPj4gdG8gYmUgcmVnaXN0ZXJlZCBhcyBjbG9ja3Nv
dXJjZT8gSWYgbm90LCBzaG91bGQgaXQganVzdCBiZSByZWdpc3RlcmVkCj4+IGFzIGNsb2NrZXZl
bnQ/Cj4gCj4gWWVzLCB5b3UgY2FuIHJlZ2lzdGVyIHRoZSBjbG9ja2V2ZW50IHdpdGhvdXQgdGhl
IGNsb2Nrc291cmNlLgo+IAo+IFlvdSBtZW50aW9uZWQgdGhlIEpINzExMCBoYXMgYSBiZXR0ZXIg
cmF0aW5nIHRoYW4gdGhlIENQVSBhcmNoaXRlY3RlZCB0aW1lcnMuIFRoZSByYXRpbmcgaXMgdGhl
cmUgdG8gImNob29zZSIgdGhlIGJlc3QgdGltZXIsIHNvIGl0IGlzIHVwIHRvIHRoZSBhdXRob3Ig
b2YgdGhlIGRyaXZlciBjaGVjayBhZ2FpbnN0IHdoaWNoIHRpbWVycyBpdCBjb21wYXJlcyBvbiB0
aGUgcGxhdGZvcm0uCj4gCj4gVXN1YWxseSwgQ1BVIHRpbWVycyBhcmUgdGhlIGJlc3QuCj4gCj4g
SXQgaXMgc3VycHJpc2luZyB0aGUgdGltZXItcmlzY3YgaGFzIGEgc28gbG93IHJhdGluZy4gWW91
IG1heSBkb3VibGUgY2hlY2sgaWYgamg3MTEwIGlzIHJlYWxseSBiZXR0ZXIuIElmIGl0IGlzIHRo
ZSBjYXNlLCB0aGVuIGltcGxlbWVudGluZyBhIGNsb2NrZXZlbnQgcGVyIGNwdSB3b3VsZCBtYWtl
IG1vcmUgc2Vuc2UsIG90aGVyd2lzZSBvbmUgY2xvY2tldmVudCBhcyBhIGdsb2JhbCB0aW1lciBp
cyBlbm91Z2guCj4gCj4gVW51c2VkIGNsb2Nrc291cmNlLCBjbG9ja2V2ZW50cyBzaG91bGQgYmUg
c3RvcHBlZCBpbiBjYXNlIHRoZSBmaXJtd2FyZSBsZXQgdGhlbSBpbiBhIHVuZGV0ZXJtaW5lZCBz
dGF0ZS4KPiAKPiAKClRoZSBpbnRlcnJ1cHRzIG9mIGpoNzExMC10aW1lciBlYWNoIGNoYW5uZWwg
YXJlIGdsb2JhbCBpbnRlcnJ1cHRzIGxpa2UgU1BJKFNoYXJlZCBQZXJpcGhlcmFsIEludGVycnVw
dCkgbm90IFBQSSAoUHJpdmF0ZSBQZXJpcGhlcmFsIEludGVycnVwdCkuIFRoZXkgYXJlIHVwIHRv
IFBMSUMgdG8gc2VsZWN0IHdoaWNoIGNvcmUgdG8gcmVzcG9uZCB0by4gU28gaXQgaXMgaGFyZCB0
byBpbXBsZW1lbnQgYSBjbG9ja2V2ZW50IHBlciBjcHUgY29yZS4gSSB0ZXN0ZWQgdGhpcyB3aXRo
IHJlcXVlc3RfcGVyY3B1X2lycSgpIGFuZCBpdCBmYWlsZWQuCgpJIHRoaW5rIGl0IGlzIGVub3Vn
aCB0byBpbXBsZW1lbnQgYSBjbG9ja2V2ZW50IGFzIGEgZ2xvYmFsIHRpbWVyLiBUaGFuayB5b3Ug
Zm9yIHlvdXIgYWR2aWNlLgoKQmVzdCByZWdhcmRzLApYaW5neXUgV3UKCj4+IFsxCj4+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RoZXJtYWwvbGludXgu
Z2l0L3RyZWUvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jI240NQo+Pgo+PiDCoFRo
YW5rcywgWGluZ3l1IFd1Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
