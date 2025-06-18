Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBF7C71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 05:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pc85L4T2/msm8t15m4kaYZPOWYL+DxORxqZVda8actw=; b=Cf+sBl5isof3OC
	DwLaCRd1sow6rEOZB277NfqajTTmi+t2TMpJyn7tUFMDFcdUzehXw2ZhX9sVxV2R68YWNTc89Qchz
	C9dcVi5mJ0yzH/aU9VKNDB8set9rQbHWpsM2/mKSLACG/b9t7Fsxa6sG1SWJgwZNONcjGJoNYpLbd
	vpSSNebDSFdCUY4IhT9rcR2m8BYUkRZKf/Tr7N05DO1XlMv7VbsTnmJJsCUjHd5vTSapQNffmVFD6
	q/pkGdjQGaLHQpG8LDc16TDzr+IEUWc2qBcz65QCha88OijNDC3FNruforonVsq7Hz5sdjzrfeboN
	a8ctOxit1fJ3VPnlZrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRlHY-000000095JT-0zD0;
	Wed, 18 Jun 2025 05:24:20 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRlHV-000000095Ih-30FU
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 05:24:18 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553b3316160so4060827e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 22:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750224255; x=1750829055; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Z4TSLN8JZPIMvLRhF9VLnkxWZBX3eFV9ERu7o6ArDg=;
        b=UzauM682mr2yKwFrOdNH3+9AuBmADdZai/WeSk/Qlen6chDG4/FSeiwe2o9LvioXkK
         /gzcqWVbrcqnXfr2M04ug+LSFoEd2zR6lBHHaoyOCUjGhFTJCgGxz1LY3ijsT7Sn9u6z
         pr+hq/sXqSSNXvrj96EScLFSWXConRFXeyzIc6hybxFboqjOY9mbJHbPJR4riJSHiemJ
         JCqzUor23TbTPZUyv6jjtEXBz8nQb5I6UBAR69rBhpar1YFyJydUhS1t+ZtS+ZvU78Ww
         i/iyr2XEZmbjUR4GetgiOMXbLaOiR9gt878gl4iZ8BVge4v2L1YAwDbsdtD+EqZNnTb4
         36gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750224255; x=1750829055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Z4TSLN8JZPIMvLRhF9VLnkxWZBX3eFV9ERu7o6ArDg=;
        b=LYplGcaXcNArlMrg7muDW03j0TYGWPsQ5pIySUCgmr6DMJm2BRmWBFLriNN0HPmeK8
         se4pZVSgYcxvhb8lmdpR14zTC9yO4oWcqTgTERBhV0HYleie/Joh2HbH/xubPgkFneqQ
         89XI3jWId2OhYtOSr7wt6a5rJAOIvBDi1M+kkixK3HU4mc2FWoVBbYd/Dw1jlMEWycLv
         v9K3i91cnWNci5F9ts2t469v6wbc/2I7HgXLwPKavzZMR5m1qTEb9PcXtHfKS9JqaPsr
         4hbElSwvrft3YSyP3MlIhHcrhCkI61eA2HSpKJGrJQl9rAf43T0wQGSEAgaJcYK2Y7cL
         CV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUva2JnZlvySE5DvKtZqk0na1B3GKY2YgDP1DZF/f8diuh6PJ6WVPty/6EzFpI4UZQ/U1WxTuxjK81ojA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTEEu3apVUSwGpb0q1JpbNb7uq5J7YRxSKZxWmRz8yFpgOsWXA
	U5pp+6z29eHxZ924snSVmk2jusGRAgXOLDhfPhSse/c5/3Gu8IjMBjcgGNOeDah9n1jnGI0K2xy
	MXGhoTqz4jqS7mJXNlpy2jWFZ2/4zSNnThM3dP7ftmQ==
X-Gm-Gg: ASbGncsIqw4ONNohUVdKxWYIUtyKUN9ety8AeiozuV7G0FoVQqS3TeTKpZNeHjMgv6O
	YWAA7GzHJycfzI5zbwP7OAdXIALMrOiqKrVaNfVYVoI1CKg3hN5PXUtena2rLEBKy9AdF4Zuj1O
	MOq4xC38D/YfJ/WQYEJjPq/n1PB1w+qPnkmB+85bf/hg==
X-Google-Smtp-Source: AGHT+IFwL9G1DHBfI/lVr74bMBkL3ROv8/Gb0OUH3lB+sHfgk3+LXmQwxwY2JVd0OZNae9e8E+jgY8I9Gk7tR0VNm6E=
X-Received: by 2002:a05:6512:3b0f:b0:553:abbb:c530 with SMTP id
 2adb3069b0e04-553b6f49986mr4356712e87.56.1750224255114; Tue, 17 Jun 2025
 22:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-13-apatel@ventanamicro.com> <87ldpvirl2.ffs@tglx>
In-Reply-To: <87ldpvirl2.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 18 Jun 2025 10:54:02 +0530
X-Gm-Features: AX0GCFuqAwxb7NkJo6ROc36kRxrpGi8zqYIq4k-XKsi8PzPM1EcP4vkMM19V2qo
Message-ID: <CAK9=C2UCpth4GQ_q2OMwndBeZKf9e_bsoHXaKJW0cNzTWggNUg@mail.gmail.com>
Subject: Re: [PATCH v5 12/23] irqchip: Add driver for the RPMI system MSI
 service group
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_222417_759320_9D8FB23C 
X-CRM114-Status: GOOD (  13.46  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgOTowM+KAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDExIDIwMjUgYXQgMTE6NTIsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiArICAgICByZXQgPSBycG1pX3N5c21zaV9zZXRfbXNpX3Rhcmdl
dChwcml2LCBod2lycSwgbXNnKTsKPiA+ICsgICAgIGlmIChyZXQpIHsKPiA+ICsgICAgICAgICAg
ICAgZGV2X3dhcm4ocHJpdi0+ZGV2LCAiRmFpbGVkIHRvIHNldCB0YXJnZXQgZm9yIGh3aXJxICVs
dSAoZXJyb3IgJWQpXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICBod2lycSwgcmV0KTsK
Pgo+IEp1c3QgbGV0IHN0aWNrIGl0IG91dC4gWW91IGhhdmUgMTAwIGNoYXJhY3RlcnMgLi4uCgpP
a2F5LCBJIHdpbGwgdXBkYXRlLgoKPgo+ID4gKyAgICAgfQo+ID4gK30KPgo+IE90aGVyIHRoYW4g
dGhhdDoKPgo+IFJldmlld2VkLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5k
ZT4KPgo+IHVuZGVyIHRoZSBhc3N1bXB0aW9uIHRoYXQgdGhpcyBnb2VzIGFsbCB0aHJvdWdoIGVp
dGhlciB0aGUgUklTQy1WIG9yIHRoZQo+IG1haWxib3ggdHJlZS4KPgoKSU1PLCB0aGlzIHNlcmll
cyBzaG91bGQgZ28gdGhyb3VnaCB0aGUgUklTQy1WIHRyZWUgYnV0IEkgYW0gZmluZQp3aXRoIHRo
ZSBtYWlsYm94IHRyZWUgYXMgd2VsbC4KCkJlc3QgUmVnYXJkcywKQW51cAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
