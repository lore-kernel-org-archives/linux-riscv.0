Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8982EC77B7F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrO+C+BTYgar9/XJf4+A30vF8bORW+CekeB6wkRCZLE=; b=TNbk+mBOLMPNDv
	y0NDWfvPl5L8NKvxaPTZJR6YkIPqvBG91WJOsKQ5r6f/0a6TkJs83us1t2yX1551slOQ5/hgY3tn+
	LSz9Dc7yJyk3veERN2IaLgTWe46V/R40/LWjEUiNEYUQoXDX/JjrjKMqEA7L8sCzQdsISasR6/FGV
	P3TyN468MRIjhXzz28NUhXC42Mui+HeebVzHhLHEIJe7ABRpN5WeTuMV8kEr1qJlT1yxywRaKa8CP
	YZIIVV0+lBpVU4bVv/RjsjFI90ev1Wk6IkD/Dt9uac2lZ/j+MQW2NwWBYa0p6GTtabTEEcKXvgw+p
	wmsJUTQPgDpOzaulU7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfPP-00000002Vkb-3uDN;
	Mon, 23 Jun 2025 11:32:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeHl-00000002KRV-3T37
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 10:20:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CB1D6112D
	for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 10:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0716C4CEFC
	for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750674020;
	bh=prOAbia71XOTgGudPMVx0Rcz5wZJl6YGFxom8jlzCYo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JuF9oBa6Afwk1Duy/cL3d0w+NKUqCONwa9cmTcb4bxwcTLpyL1l5DsXDYhsaeQgfo
	 CEiJhAXmJKPUSdkuJjOpWy6XY77QFnfFmopKfez8+Oehhl+KDqtWvepZCe+bYIcvk6
	 iKg41Bn/lHUZL80f/I62hJk/r4ionxua2injEN2obw3qsMmpbRAeVSyK0iSd3eTmos
	 sCNlkFzQ1IdYRSj8RImEs0RxR27ojin+HJPccABzre83TZzo8JllsXaLpqe5sR9Drg
	 Z0oGNcXM+WtFEs419ayMYf48IyRP7ZT0f7sJsS27MNOAafLdA+2F1236AdzdYm5QtP
	 nEqfLKxqtbajQ==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6118b000506so69570eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 03:20:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxfWKeEkHEQCPaFa3ZTPHNZF+wyHFZ0KtikjeuQDN4Zr52SD9xdnUvGQA+66CErSXJijHOPUYmO854TQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm617DL7N/PnChV3103or+GBH6NXiI+cRNQB/LA/QeLeE/Cxmr
	L/3KaBNVyBjqHIHRsCuIGJ6gmi2ktbY4rvi6iVPEfmdALHFETbi3slp7b5FrVs82Yknpu7qfhpV
	XR6gGHifJXrdqY/mf7kEGo6fdTpcXg88=
X-Google-Smtp-Source: AGHT+IEri0Ei3Dwzz6H8TNwA8rGJX2q5j17F8+tFzd6CGT1JN8YEpn3ieZGNEirgnOf1LEjld67SQ5gYMP0WkKFEbCU=
X-Received: by 2002:a05:6820:308e:b0:610:dff3:425a with SMTP id
 006d021491bc7-6115babab7dmr8233773eaf.4.1750674019869; Mon, 23 Jun 2025
 03:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-14-apatel@ventanamicro.com> <aFkZj2QCU2LfTI30@smile.fi.intel.com>
In-Reply-To: <aFkZj2QCU2LfTI30@smile.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Jun 2025 12:20:03 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j9gQE-=HQnzdfATuoYUm8xwKfhm8tR6tUCEZBQ4F9qNQ@mail.gmail.com>
X-Gm-Features: AX0GCFtTCu8RzoqPycmcUo_v8Lu1ClT5rvTpT_yMP45KXqQPNHoS6bspZg_HntU
Message-ID: <CAJZ5v0j9gQE-=HQnzdfATuoYUm8xwKfhm8tR6tUCEZBQ4F9qNQ@mail.gmail.com>
Subject: Re: [PATCH v6 13/23] ACPI: property: Refactor acpi_fwnode_get_reference_args()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgMTE6MDjigK9BTSBBbmR5IFNoZXZjaGVua28KPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxOCwg
MjAyNSBhdCAwNTo0Mzo0OFBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4KPiA+IEN1cnJl
bnRseSBhY3BpX2Z3bm9kZV9nZXRfcmVmZXJlbmNlX2FyZ3MoKSBjYWxscyB0aGUgcHVibGljIGZ1
bmN0aW9uCj4gPiBfX2FjcGlfbm9kZV9nZXRfcHJvcGVydHlfcmVmZXJlbmNlKCkgd2hpY2ggaWdu
b3JlcyB0aGUgbmFyZ3NfcHJvcAo+ID4gcGFyYW1ldGVyLiBUbyBmaXggdGhpcywgbWFrZSBfX2Fj
cGlfbm9kZV9nZXRfcHJvcGVydHlfcmVmZXJlbmNlKCkgdG8KPiA+IGNhbGwgdGhlIHN0YXRpYyBh
Y3BpX2Z3bm9kZV9nZXRfcmVmZXJlbmNlKCkgc28gdGhhdCBjYWxsZXJzIG9mCj4gPiBmd25vZGVf
Z2V0X3JlZmVyZW5jZV9hcmdzKCkgY2FuIHN0aWxsIHBhc3MgYSB2YWxpZCBwcm9wZXJ0eSBuYW1l
IHRvCj4gPiBmZXRjaCB0aGUgbnVtYmVyIG9mIGFyZ3VtZW50cy4KPgo+IExvb2tzIG9rYXkgdG8g
bWUsIGJ1dCBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIGhhdmUgbW9yZSBleWVzIGhlcmUgKE1pa2Es
Cj4gUmFmYWVsPykuCgpJdCB3b3VsZCBoZWxwIGlmIHRoaXMgd2VyZSBDQ2VkIHRvIGxpbnV4LWFj
cGksIGJ1dCB5ZWFoLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
