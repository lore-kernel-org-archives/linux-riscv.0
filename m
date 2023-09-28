Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D49E732DE
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jE9mCW6topsMPoOzfFqJKeyLFNB7uFNCRiVTNkJMAw=; b=hmlg10Q+klbdm2
	otBjpzab+xf7ROkKNXtzWVKTYRh3k1o94iliGi2cQCw9UvAnGITROBaSXsUNxuQ2aGMW2x3CBZl/U
	R40Zz3tIU7gqek/ZLXpmvUKB1SbD7VCrk1b5/76g2H+pLAXEGKKUIR64IiZXpdb0w8kNH1y0BZNFv
	MhHuA+lUs7IyjZ1O/log/+qgx2q5zvaCspdyUVuebyZv0rTNk8aZD3U8Un5n1TSSOZEEdzKZV3GJI
	FqPJE0Da0GIq5t5YUpnpM+4p5v+u5V9VYFDwuiifzLTbjCOWuXXVmBOnY4Llw+NxTFJAWmcNNU94T
	oeDBDWzBb8KvgSSlCfKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsBd-004yXR-1l;
	Thu, 28 Sep 2023 14:40:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsBZ-004yTH-0O
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 14:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28B7D61CAD
	for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 14:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBEC4C433C8
	for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695912010;
	bh=h8H/O+3tGg84I9dup0h1f947gtwyQA+AfL2cSRNnujU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wa0mTny93UweF9pZUlIFlDUFDzcjYo3FsAsBkIOCjJEoDU9FhRvkugHar5nswMYyb
	 4JDy07td7zUbJmTHWyEpN4ScjjiF5G6wbBSYNC+Tqrufj1ZF8Z7h1zSg1qwCjLEgKH
	 nZB0xMPlsgGQxey23F+xsgK58Us8nTC/6l7hs87KuabLd8Douy2ynB1AJCg807VpG3
	 Zy2veVf1fABy23uBTtbSIcpPPsSLyZUr07NVkMDCJEvoCUg24+AEoJPQL0wSPejYsB
	 Bst6eCetr8R+env9V2MHLQuTkfhkVSbWdiCmkEhLSmgXnT4JFSoW0+mFKQJf7nqCOB
	 UfT60zd1x/pcg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50308217223so20621735e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 07:40:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YyHGE7bf86tRY0Kf/stBbsmJyqM/25W4Mph0iHhz7dFT3XogTpi
	Rrd/gsS+EN1P2opZ2azRXCDX2UbAnqSZl3C4kA==
X-Google-Smtp-Source: AGHT+IHlFRYNH1yT+cBQYKts0sQSWJ7V+SRU+AQ/TMhseplKK1kk/v3dI6NbdzsUpFxr/xM9/FfvMcO6JNQuqwhidDE=
X-Received: by 2002:a05:6512:2807:b0:4fd:fc36:68a2 with SMTP id
 cf7-20020a056512280700b004fdfc3668a2mr1554384lfb.1.1695912009035; Thu, 28 Sep
 2023 07:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230928061207.1841513-1-apatel@ventanamicro.com> <20230928061207.1841513-3-apatel@ventanamicro.com>
In-Reply-To: <20230928061207.1841513-3-apatel@ventanamicro.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 28 Sep 2023 09:39:56 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL6LvfQQi4AqJpDPKwC76Xap4Re4o+bzviyb--dUOG7vQ@mail.gmail.com>
Message-ID: <CAL_JsqL6LvfQQi4AqJpDPKwC76Xap4Re4o+bzviyb--dUOG7vQ@mail.gmail.com>
Subject: Re: [PATCH v9 02/15] of: property: Add fw_devlink support for msi-parent
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_074013_227522_8A17E0F1 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBTZXAgMjgsIDIwMjMgYXQgMToxMuKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgYWxsb3dzIGZ3X2RldmxpbmsgdG8gY3JlYXRl
IGRldmljZSBsaW5rcyBiZXR3ZWVuIGNvbnN1bWVycyBvZgo+IGEgTVNJIGFuZCB0aGUgc3VwcGxp
ZXIgb2YgdGhlIE1TSS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL29mL3Byb3BlcnR5LmMgfCAyICsrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
