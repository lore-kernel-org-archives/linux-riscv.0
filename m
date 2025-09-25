Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0748CAC5AA
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 05:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09PFAw5ag497nqsD4s7o+ovEAFUIFENtPhX8O1iW42c=; b=bTGFX3jOiv6fsB
	xpOSBFzPO7SWccLGnBR8ICOCnGbApI6f028YA2iAItAcYHIPK6QCIbOS70N2P9gU7mpd4I1UgyNTJ
	ebVYXw6bzglK0gUbAAraMDdDsCtIirDFSq7ut+rlkGi+0mGamnhoeruWgONoLheq7HDmxyZLuO1pm
	zldc+flhopieCLNxikeI1Tz9eaURYypKTi48e6WO6YO6C2lJQFjvMhsuvDtzbIWFjQZEcqg8x7KKw
	z6QnGM+8zrEx7AfmEIeljfsaiP2qC1wRaVBaSggJMKgz3qiEjPlCnLCe8rvj4++/AWJ8V7WBQoZJn
	ZyPypVA5NV8fPoFxnZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1eH9-00000005lrZ-0i8j;
	Thu, 25 Sep 2025 05:12:15 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1eH6-00000005lpJ-2eLw
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 05:12:13 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-57bd7f0e5baso499367e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 22:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758777130; x=1759381930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PI+7onH5XvxEzfPDOfe7phWFijmEPWLyir8RpU4z3xc=;
        b=dG4PPZSGANSyTMARIQYBoNDNuRJkQ4JUMzbtQgtAHblIZDRUAlYFOrGadu5nETJHqd
         mE7xexGTh5zxZHJwcO0ftEBagRQJwdKuQXq3gJx42UjBAAymKxZD0p/g2TE/7Epmu3+l
         5sgZ7q/jzTMCNfpLZuiob975z7PCidXOZXaDSH37GYg/6qTRZ1TITz/vDSZREFBWRQlu
         feX/IEyhAg1/iI4LBy9eAI79cCvMKACaQMmGjWbawpmIGSgJSFLC0802wFp2i2C8+vSj
         4eOxcd8iwD2oXIjAdqciVltBXqYhLnyzPbcBPl9mpF/Qro6X7bUwSBO4DjwfTWu9wrG6
         diCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758777130; x=1759381930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PI+7onH5XvxEzfPDOfe7phWFijmEPWLyir8RpU4z3xc=;
        b=cEt4iv/y5ZcszhxAtTIB1yKCJMbN2EEeysdGI2BjQv0ePDnC/4wXCjGa95toF2HpKP
         FXw/wsSLJ7AXT+iwj9E8xjWmFXOk7hmn8D2nA5nYpZabjH+lK3lD+TNfH35E1zpdtncT
         8UyuGoKyef8zFxVDX9TFVRzBR084APXWaAboNLfWH+aQX+erZud2N+8t0zBXf3ayIT+Z
         Nd9nyD0Zkzc472sgueAgLntydiTC3MSlfHlntaS9TaCLrfcATE+9L7HYjYUqG/7EAdfv
         2uaBoCPqWJ/pnBY+pJccfNAMKl8vICS/+shCmRSrv+MxVzx6CBB8YmEu4Jknkzn1QepV
         9P5w==
X-Forwarded-Encrypted: i=1; AJvYcCWhgZ2OGFu0t8mXvmIGyYqlyD1xtHHJGazgsFlcHqGCAqHu1WQKWSsSXJzmGY4i6gGcNp2td4VPutpq1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6l06AuY7BbAOoPrUH2xuxXem6H13CeU1QIXqk1e8gNUHM+Hds
	dqW5zVPGrxI5kGE8Vg4lPr9RpRbMO4l/VS9pspBn7eT9XyujPBlY8L5COku+HG4Wy2amjcLp9y5
	qGbkdiiJEz+L4nFvJd7o3apxvxd3BN9607ey9OQpoQA==
X-Gm-Gg: ASbGnctwLs1+Sxc0MCWjXxuJkktHI7sSpZTFhrYvTOA0ZBZ9zDT4rhKkRRJQXOfcdaQ
	llsVo/d4TTHEnSz1SRAU+2Gcrczwv3ypXOMX3cl6NOMiZDX35M+jOeTjCEireFiQptiC/qz41gz
	nDgT2O0LMyiyZL84M8h0SOM7xsm1uxZSFV3XIdJHFhc5knJgXETdcHTihDgabnUFi3406Wro45n
	3nWybSn
X-Google-Smtp-Source: AGHT+IEktZxYjboDWNx3pIVxQ7MOelyp8TNGnFov7A2S6wtkwb7jZL+tldrXK8Tjm4TA2xHmbLoncH4PXr9GUwjTepk=
X-Received: by 2002:a05:6512:2c08:b0:579:f4b3:bd2d with SMTP id
 2adb3069b0e04-582d406c4f6mr540270e87.57.1758777129874; Wed, 24 Sep 2025
 22:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250818040920.272664-1-apatel@ventanamicro.com>
 <20250818040920.272664-8-apatel@ventanamicro.com> <405a78ce-de03-382b-cab9-bb086e28505b@kernel.org>
In-Reply-To: <405a78ce-de03-382b-cab9-bb086e28505b@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 25 Sep 2025 10:41:58 +0530
X-Gm-Features: AS18NWCrNThCby3qXMZJBv9AykyLw-ADGqc2ECmLSjZN6XRRbEa6InFMj8l_zYI
Message-ID: <CAK9=C2Vr4rgj8wfT+Ogow1H-7Lu=6XdWA2Qe++6523P76pMZzQ@mail.gmail.com>
Subject: Re: [PATCH v10 07/24] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
To: Paul Walmsley <pjw@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, 
	linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, 
	linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
	Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, 
	Rahul Pathak <rpathak@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_221212_689676_7799219F 
X-CRM114-Status: GOOD (  20.09  )
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

SGkgUGF1bCwKCk9uIFRodSwgU2VwIDI1LCAyMDI1IGF0IDU6NTfigK9BTSBQYXVsIFdhbG1zbGV5
IDxwandAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIDE4IEF1ZyAyMDI1LCBBbnVwIFBh
dGVsIHdyb3RlOgo+Cj4gPiBBZGQgYSBtYWlsYm94IGNvbnRyb2xsZXIgZHJpdmVyIGZvciB0aGUg
bmV3IFNCSSBtZXNzYWdlIHByb3h5IGV4dGVuc2lvbgo+ID4gd2hpY2ggaXMgcGFydCBvZiB0aGUg
U0JJIHYzLjAgc3BlY2lmaWNhdGlvbi4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbWFpbGJveC9LY29u
ZmlnICAgICAgICAgICAgICAgfCAgMTEgKwo+ID4gIGRyaXZlcnMvbWFpbGJveC9NYWtlZmlsZSAg
ICAgICAgICAgICAgfCAgIDIgKwo+ID4gIGRyaXZlcnMvbWFpbGJveC9yaXNjdi1zYmktbXB4eS1t
Ym94LmMgfCA5OTQgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAzIGZpbGVzIGNoYW5n
ZWQsIDEwMDcgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21h
aWxib3gvcmlzY3Ytc2JpLW1weHktbWJveC5jCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWFpbGJveC9yaXNjdi1zYmktbXB4eS1tYm94LmMgYi9kcml2ZXJzL21haWxib3gvcmlzY3Ytc2Jp
LW1weHktbWJveC5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAw
MDAwLi4yMTQwNGJhYTZkZjAKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2RyaXZlcnMvbWFp
bGJveC9yaXNjdi1zYmktbXB4eS1tYm94LmMKPgo+IFsgLi4uIF0KPgo+ID4gKwo+ID4gK3N0YXRp
YyBpbnQgbXB4eV9tYm94X3BvcHVsYXRlX2NoYW5uZWxzKHN0cnVjdCBtcHh5X21ib3ggKm1ib3gp
Cj4gPiArewo+ID4gKyAgICAgdTMyIGksICpjaGFubmVsX2lkcyBfX2ZyZWUoa2ZyZWUpID0gTlVM
TDsKPiA+ICsgICAgIHN0cnVjdCBtcHh5X21ib3hfY2hhbm5lbCAqbWNoYW47Cj4gPiArICAgICBp
bnQgcmM7Cj4gPiArCj4gPiArICAgICAvKiBGaW5kLW91dCBvZiBudW1iZXIgb2YgY2hhbm5lbHMg
Ki8KPiA+ICsgICAgIHJjID0gbXB4eV9nZXRfY2hhbm5lbF9jb3VudCgmbWJveC0+Y2hhbm5lbF9j
b3VudCk7Cj4gPiArICAgICBpZiAocmMpCj4gPiArICAgICAgICAgICAgIHJldHVybiBkZXZfZXJy
X3Byb2JlKG1ib3gtPmRldiwgcmMsICJmYWlsZWQgdG8gZ2V0IG51bWJlciBvZiBNUFhZIGNoYW5u
ZWxzXG4iKTsKPiA+ICsgICAgIGlmICghbWJveC0+Y2hhbm5lbF9jb3VudCkKPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUobWJveC0+ZGV2LCAtRU5PREVWLCAibm8gTVBYWSBj
aGFubmVscyBhdmFpbGFibGVcbiIpOwo+ID4gKwo+ID4gKyAgICAgLyogQWxsb2NhdGUgYW5kIGZl
dGNoIGFsbCBjaGFubmVsIElEcyAqLwo+ID4gKyAgICAgY2hhbm5lbF9pZHMgPSBrY2FsbG9jKG1i
b3gtPmNoYW5uZWxfY291bnQsIHNpemVvZigqY2hhbm5lbF9pZHMpLCBHRlBfS0VSTkVMKTsKPgo+
IFNob3VsZCB0aGlzIGJlIGRldm1fa2NhbGxvYygpID8KPgoKVGhlIHVzYWdlIG9mIGNoYW5uZWxf
aWRzIGFycmF5IGlzIGxpbWl0ZWQgb25seSB0byB0aGlzIGZ1bmN0aW9uCihtcHh5X21ib3hfcG9w
dWxhdGVfY2hhbm5lbHMoKSkgaGVuY2Ugd2UgYXJlIHVzaW5nIHNjb3BlZAprY2FsbG9jKCkgc28g
dGhhdCBjaGFubmVsX2lkcyB3aWxsIGJlIGF1dG9tYXRpY2FsbHkgZnJlZWQgd2hlbgptcHh5X21i
b3hfcG9wdWxhdGVfY2hhbm5lbHMoKSByZXR1cm5zLgooUmVmZXIsICJfX2ZyZWUoa2ZyZWUpIiBh
dHRyaWJ1dGUgaW4gdGhlIGNoYW5uZWxfaWRzIGRlY2xhcmF0aW9uKQoKVGhlIHNjb3BlIG9mIG1l
bW9yeSBhbGxvY2F0ZWQgdXNpbmcgZGV2bV9rY2FsbG9jKCkgaXMgdGhlIGVudGlyZQpsaWZlc3Bh
biBvZiB0aGUgZGV2aWNlIHdoaWNoIGlzIG5vdCBuZWVkZWQgZm9yIGNoYW5uZWxfaWRzLgoKUmVn
YXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
