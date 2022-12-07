Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD0EC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJ8m8M+en4eyBAx+1tFxxvwmDLypb+PlPWVyUz76ucc=; b=zJ6vuiQe/HYdHo
	L4vL8bhbfUXGctr9Dspu8N7LlVpqpXHwa/+lnj/Gs8ZVJ6TkrR1x0HIfimzd1KO+t6+xb7797D7tN
	Bgr+70nESC9DWosb14+EIl6Opki6MlKBYXjgv+uBLTn0IPcmTco3zcucimME0iu9GgSngA+yIw5CC
	KGhRNyETaQg72aNV6/RJVEkKOCISdQ1969zGx/K4hn352O7HiBs+wxpPlqcMqdAvr8k5jRoMJyQdk
	0vP+gO7X6b1qmZPbFT3iN8URl/3KN2OhgDeb0e4OSoz5uYqVhEui0/dxiIDdLBxEtrZh4MKGgYupH
	foLLshZBfWf3K3T5wVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rxq-0000vY-PE; Wed, 07 Dec 2022 10:47:46 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rxn-0000kw-NP
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 10:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1670410055; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mBtk1g3a7Q1rismQYQWGRJkcALrsuKhh4yvLL8CeyRqRdk9enQD2KRoOeJMpeJlrg927BvWeMyyJr5aGsw5VWpi8ji/iq5V6D8sDQp4c6qe8GIlNH7gkf83pwkNf48nU3kCmq8Xn2EQKChN9s6Nsr0Eh3OV+SX4dzaTPCnBgr5Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670410055; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=1JCTlL48DT3zfL4rO5+nUh4+FmToPbXqE2w5MYGFziQ=; 
	b=I86dJHbw6Gg+WK9G7fEtSjh9xf5/Q5BKzAGMPfh249ALQQn417It3xum7gcsUwamh+NoA2FZ4Exkysnhlzs1/Lu/fIHJHWPHzYMZerRlp9yv9QxvKkX+8cnxlAljDlM3ReDUf5+Pv8JUQcH89xD59w2LoTW9mdO2DUS0L14mEeA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670410055;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=1JCTlL48DT3zfL4rO5+nUh4+FmToPbXqE2w5MYGFziQ=;
	b=evjAeK9ZnmkLF9u2/Jh/+ayHl4FANQIIndJCGtwgRpNkPApxo2x5OTrg+lI7cW/0
	RX992Lx+SjGoY1R4Xhxp3cVMrBHZ6ycoJLHQQuEODfWgne0mEzLRJqAirLW5lyCh8oB
	1IupoqBpExbx7iZgQXVwSF5DzeoJq1jwvSXgNAIo=
Received: from edelgard.fodlan.icenowy.me (120.85.99.143 [120.85.99.143]) by mx.zohomail.com
	with SMTPS id 1670410054297195.35225821177994; Wed, 7 Dec 2022 02:47:34 -0800 (PST)
Message-ID: <34fe4161718e395f5e9890f9358a25f697af9e24.camel@icenowy.me>
Subject: Re: [PATCH 1/3] dt-bindings: timer: sifive,clint: add comaptibles
 for T-Head's C9xx
From: Icenowy Zheng <uwu@icenowy.me>
To: Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>,  Jisheng Zhang <jszhang@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Wed, 07 Dec 2022 18:47:26 +0800
In-Reply-To: <20221121041757.418645-2-uwu@icenowy.me>
References: <20221121041757.418645-1-uwu@icenowy.me>
	 <20221121041757.418645-2-uwu@icenowy.me>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_024743_838376_5E1837E7 
X-CRM114-Status: GOOD (  13.57  )
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

5ZyoIDIwMjItMTEtMjHmmJ/mnJ/kuIDnmoQgMTI6MTcgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ
6YGT77yaCj4gVC1IZWFkIEM5MDYvQzkxMCBDTElOVCBpcyBub3QgY29tcGxpYW50IHRvIFNpRml2
ZSBvbmVzIChhbmQgZXZlbiBub3QKPiBjb21wbGlhbnQgdG8gdGhlIG5ld2NvbWluZyBBQ0xJTlQg
c3BlYykgYmVjYXVzZSBvZiBsYWNrIG9mIG10aW1lCj4gcmVnaXN0ZXIuCj4gCj4gQWRkIGEgY29t
cGF0aWJsZSBzdHJpbmcgZm9ybWF0dGVkIGxpa2UgdGhlIEM5eHgtc3BlY2lmaWMgUExJQwo+IGNv
bXBhdGlibGUsIGFuZCBkbyBub3QgYWxsb3cgYSBTaUZpdmUgb25lIGFzIGZhbGxiYWNrIGJlY2F1
c2UgdGhleSdyZQo+IG5vdCByZWFsbHkgY29tcGxpYW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IElj
ZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgoKSGksIGNvdWxkIHRoaXMgcGF0Y2ggYmUgcGlj
a2VkIEFTQVA/IEJlY3Vhc2UgaXQgd2lsbCBiZSB1c2VkIHRoZW4gaW4KZnVydGhlciBPcGVuU0JJ
IHBhdGNoZXMgdG8gZW5hYmxlIHByb3BlciBvcGVyYXRpb24gb2YgVC1IZWFkIHRpbWVyLgoKSSBr
bm93IHRoZSBmb2xsb3dpbmcgMiBwYXRjaGVzIGFyZSBpbiBkb3VidCBhbmQgZnVydGhlciByZXdv
cmsgZm9yIHRoZW0KYXJlIG5lZWRlZC4KCj4gLS0tCj4gwqBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwgfCA4Cj4gKysrKysrKysKPiDCoDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0Cj4gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+
IGluZGV4IGJiYWQyNDE2NTgzNy4uYWFkYTY5NTcyMTZjIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFt
bAo+IEBAIC0yMCw2ICsyMCwxMCBAQCBkZXNjcmlwdGlvbjoKPiDCoMKgIHByb3BlcnR5IG9mICIv
Y3B1cyIgRFQgbm9kZS4gVGhlICJ0aW1lYmFzZS1mcmVxdWVuY3kiIERUIHByb3BlcnR5Cj4gaXMK
PiDCoMKgIGRlc2NyaWJlZCBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvY3B1cy55YW1sCj4gwqAKPiArwqAgVC1IZWFkIEM5MDYvQzkxMCBDUFUgY29yZXMgaW5jbHVk
ZSBhbiBpbXBsZW1lbnRhdGlvbiBvZiBDTElOVCB0b28sCj4gaG93ZXZlcgo+ICvCoCB0aGVpciBp
bXBsZW1lbnRhdGlvbiBsYWNrcyBhIG1lbW9yeS1tYXBwZWQgTVRJTUUgcmVnaXN0ZXIsIHRodXMK
PiBub3QKPiArwqAgY29tcGF0aWJsZSB3aXRoIFNpRml2ZSBvbmVzLgo+ICsKPiDCoHByb3BlcnRp
ZXM6Cj4gwqDCoCBjb21wYXRpYmxlOgo+IMKgwqDCoMKgIG9uZU9mOgo+IEBAIC0yOSw2ICszMywx
MCBAQCBwcm9wZXJ0aWVzOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBzdGFyZml2
ZSxqaDcxMDAtY2xpbnQKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY2FuYWFuLGsy
MTAtY2xpbnQKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzaWZpdmUsY2xpbnQwCj4g
K8KgwqDCoMKgwqAgLSBpdGVtczoKPiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbGx3aW5uZXIsc3VuMjBpLWQxLWNsaW50Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiB0aGVhZCxjOTAwLWNsaW50Cj4gwqDCoMKgwqDCoMKg
IC0gaXRlbXM6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogc2lmaXZlLGNsaW50MAo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHJpc2N2LGNsaW50MAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
