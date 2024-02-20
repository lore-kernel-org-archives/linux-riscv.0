Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08138C5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5fP+CPJp1so9Qe6vrbt4h2dwgZjqf6I/wwZofO51PY=; b=VNyEeO5T1ZMGal
	cTo+naaiUhtoNlrCEh93z7POPtKwApUOOmvUr23X7nBaULxb5slS7sQVvXTeFLx88vXK/vIat2dkv
	5kIqKj027ThaDU2pTwuBbJd0Fsc0T7HBmoWJKxvGISLrO/Wu0l7ov/bvGsnclGwDW1uoa0vN8dcaS
	ig1ckDn0dnUYkuXoOijBoRBRJ4y/+0QqKctLKN9YcBigobtFH+RrbUOvPG+peVlR61ExLcOwqPT8p
	W9AkA5k6aHZJfsar/TY0XVixIeWv05KiSbFQ4aAogzhSHF5K/RrA88YRs4iHhgpqbiVfiF2jA1yoL
	vkXaWDZgxqOPMEt0gI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcTfl-0000000FaUT-3nGe;
	Tue, 20 Feb 2024 17:12:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcTfh-0000000FaTO-1YxL;
	Tue, 20 Feb 2024 17:12:47 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708449162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSHAfYIgTOaEzn4d0Y9lfsKjNJQSBoDQ7KhW/iaFfb4=;
	b=A2fWMjB1JjQPtT1dSVxjD+FBAizT/AOYIkLhHJP4m2JnRw0E4Qb9bBrBlQnxy2fWBQMpWR
	7Apwn1AMbyR517PEwMC9+K4ePwHYVoU+aCtOWWiX/3VgYXDUc0MXcC0vZDmLYG/LChTibe
	hEFR7LGGNiziY9NHM39vIFlSQJmPNQNHpsosbrLLSrn88bK+JVo+kZojWGbdW8+ZZ/apdg
	HAwZMZQaRZsFEszqyBElRvVYfcLmZPE0u86PK/tMd9C5XcPxaCPwar555zcilXIUdXuQRZ
	JMDGvZhyS2ceh5rPZa6r+o38lr+B6I41E3QYBjd5AHnnq+2krsxtY+jRxtTMuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708449162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSHAfYIgTOaEzn4d0Y9lfsKjNJQSBoDQ7KhW/iaFfb4=;
	b=zXskBNwpTlyCapqr81po5bvbMgoWyomCGNp6X1ypT2UybdZ24qQN5BRov2Mvl3dWK+/Gwj
	PqXrEsIBOCvzzlDQ==
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v13 07/13] irqchip/riscv-imsic: Add device MSI domain
 support for platform devices
In-Reply-To: <CAK9=C2V3hQnpibHgHUpwRXWn4LSuGue0a7Sh9NFYPB6XOizjoA@mail.gmail.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-8-apatel@ventanamicro.com> <875xyji7mc.ffs@tglx>
 <CAK9=C2V3hQnpibHgHUpwRXWn4LSuGue0a7Sh9NFYPB6XOizjoA@mail.gmail.com>
Date: Tue, 20 Feb 2024 18:12:41 +0100
Message-ID: <87msrvgiuu.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_091245_571912_0457F19A 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMjAgMjAyNCBhdCAyMjoyMiwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBUdWUs
IEZlYiAyMCwgMjAyNCBhdCA3OjAy4oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+IHdyb3RlOgo+Pgo+PiBPbiBUdWUsIEZlYiAyMCAyMDI0IGF0IDExOjM3LCBBbnVwIFBh
dGVsIHdyb3RlOgo+PiA+ICsjaWZkZWYgQ09ORklHX1NNUAo+PiA+ICtzdGF0aWMgdm9pZCBpbXNp
Y19tc2lfdXBkYXRlX21zZyhzdHJ1Y3QgaXJxX2RhdGEgKmQsIHN0cnVjdCBpbXNpY192ZWN0b3Ig
KnZlYykKPj4gPiArewo+PiA+ICsgICAgIHN0cnVjdCBtc2lfbXNnIG1zZ1syXSA9IHsgWzFdID0g
eyB9LCB9Owo+Pgo+PiBUaGF0J3MgYSB3ZWlyZCBpbml0aWFsaXplciBhbmQgd2h5IGRvIHlvdSBu
ZWVkIGFuIGFycmF5IGhlcmU/Cj4+Cj4+ICAgICAgICBzdHJ1Y3QgbXNpX21zZyBtc2cgPSB7IH07
Cj4+Cj4+IFNob3VsZCBiZSBzdWZmaWNpZW50LCBubz8KPgo+IEkgaGFkIHRha2VuIHJlZmVyZW5j
ZSBmcm9tIGlycV9tc2lfdXBkYXRlX21zZygpIGluCj4gYXJjaC94ODYva2VybmVsL2FwaWMvbXNp
LmMKCldoaWNoIGlzIGVxdWFsbHkgYm9ndXMgOikKClRoZSBjaGFybSBvZiBjb3B5IGFuZCBwYXN0
YS4uLgoKVGhhbmtzLAoKICAgICAgICB0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
