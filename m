Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB52FCC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sIpOqQmHsWj5PIY9GTZJXJaXBrOtZR0zShgz616X90M=; b=PFfLrtDe/ra0yw
	HTIPas1ynNO/qM6h/BooRFIrYFgyT/7D/6y3ic06PWv4iOXk7ujts0p11Lo6US1h7II2RLHdA2cr3
	FcmANP7WXH9SQQgJgMLP3A4/gQ+WC0OTNrTErfqSLCy/YqD9CdG3Xr8puVtr5iSH3sSsmNFpTJJ4B
	1Jwep1iLzkiNGoAou+6hSoVx0fU1M87lzvapJIqHS12K5rlzJrafGNBIJ1LM4bvCmkG8jsBtDEbbP
	iHvQNgnyzdaNQ7yxGV68I86wTwT36YrCDCGH1UECEnaMEmjbN5Cpe1+IhIk8lKyFzJbJGsd5pAiSS
	UzapfEFsytE+exZXfysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIgH-0000000HRDB-3D6t;
	Thu, 15 Oct 2026 10:27:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIgG-0000000HRCx-1PAf
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 10:27:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73FE560120;
	Thu, 15 Oct 2026 10:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A510F1F000C4;
	Thu, 15 Oct 2026 10:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060043;
	bh=/pmYFn6zvtg65n/LRagsFD1DUQ/dRzO+djamzOQldVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=StbseA9xux3foYF5yPtH9XAZidusm8q96oX4WaO31F+gaODduDrdf4zzGf0YF4UCe
	 mM4m0o4t0Jc7ES+hWA9VxKtv0L0nx4MeHX8irb/+I7MsCysbWJlfN0oVT10s9FC9+T
	 QDxC1b/rcKXsprpZC4pVjJPanTRFc0/ABG5e7FHPhJBvY4NOGx/+ciHfzOPlTWQSbX
	 /UlBoq+MDEdewJne66Gb9qq9i9vgg4YmwT7R+oFjKpapKtZSdtP4Zj4yK7K8J7MKXu
	 X9ReuCpt4zeeBSnReATh7Cw/cn8Q53jjcATRbyB5h0l3HSzIAV6S08qsvHrjT/05mm
	 RpI1ZbBTFLZKA==
Date: Thu, 15 Oct 2026 12:27:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v23 1/2] dt-bindings: pwm: opencores: Update compatibles,
 examples and maintainers
Message-ID: <20261015-poised-modest-leech-4decf5@quoll>
References: <20261014110429.52762-1-hal.feng@starfivetech.com>
 <20261014110429.52762-2-hal.feng@starfivetech.com>
 <9c0737d8-455d-4025-8482-950b64029f35@kernel.org>
 <atCos9UIaZoRs4N8@monoceros>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atCos9UIaZoRs4N8@monoceros>
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

T24gVGh1LCBPY3QgMTUsIDIwMjYgYXQgMTI6MjA6NTRQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gSGVsbG8gS3J6eXN6dG9mLAo+IAo+IE9uIFRodSwgT2N0IDE1LCAyMDI2IGF0
IDExOjAxOjI5QU0gKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiBPbiAxNC8x
MC8yMDI2IDEzOjA0LCBIYWwgRmVuZyB3cm90ZToKPiA+ID4gUmVtb3ZlIHRoZSBqaDgxMDAgY29t
cGF0aWJsZSBzaW5jZSB0aGUgSkg4MTAwIFNvQyBoYXMgYmVlbiBjYW5jZWxlZCBhbmQKPiA+ID4g
d2lsbCBub3QgYmUgcmVsZWFzZWQuCj4gPiA+IAo+ID4gPiBDaGFuZ2UgdGhlIHJlZ2lzdGVyIHNp
emUgaW4gZXhhbXBsZXMgdG8gMHgxMCwgc2luY2UgYW4gT3BlbkNvcmVzIFBUQyBJUAo+ID4gPiBo
YXMgb25seSA0IDMyLWJpdCByZWdpc3RlcnM6IENOVFIsIEhSQywgTFJDIGFuZCBDVFJMLgo+ID4g
PiAKPiA+ID4gSSB3aWxsIG1haW50YWluIHRoaXMgcHdtIG1vZHVsZSBpbiBwbGFjZSBvZiBXaWxs
aWFtLgo+ID4gPiAKPiA+ID4gVGVzdGVkLWJ5OiBNYXVkIFNwaWVyaW5ncyA8bWF1ZF9zcGllcmlu
Z3NAaG90bWFpbC5jb20+Cj4gPiAKPiA+IERyb3AsIGRpZCBub3QgaGFwcGVuLiBJcyBpdCBzbyB0
cmlja3kgdG8gcmVzcG9uZCB0byB0aGUgb25lIHBhdGNoIGhlcmUsCj4gPiB3aGVyZSB0aGUgdGFn
IHdvdWxkIGJlIGFwcGxpY2FibGUsIGluc3RlYWQgb2YgcmVwbHlpbmcgdG8gY292ZXIgbGV0dGVy
Pwo+IAo+IEkgZG9uJ3Qga25vdyB3aGF0IE1hdWQgZGlkLCBidXQgaWYgdGhleSBjaGVja2VkIHRo
YXQgdGhlIHZhcmlvdXMgZHQKPiBsaW50ZXJzIGFyZSBzdGlsbCBoYXBweSwgdGhhdCBkb2Vzbid0
IGRlc2VydmUgYSBUZXN0ZWQtYnk6Pwo+IAoKTm8uIFdoeSB3b3VsZCBjb21waWxhdGlvbiBiZSBj
YWxsZWQgdGVzdGluZz8gU2luY2Ugd2hlbj8gSSBhbHNvIGNvbXBpbGVkCmRyaXZlciBhbmQgdGhl
IG90aGVyIGNvZGUsIGp1c3QgbGlrZSBldmVyeSBvdGhlciBib290IGRpZCwgYnV0IG5vIHRhZ3MK
Zm9yIHVzLi4uCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
