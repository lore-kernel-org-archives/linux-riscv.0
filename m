Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFBEC8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 07:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaUiaCfmgvZst4Sg7xCOZZuKcZ2yTfWITVSgDmZ5pDE=; b=5Ah9VGl+qG1utA
	blK4HHkGfIF+IPL5y+JSrbNwczAHkdwSHyuKp6d50c3pfJe8Rv/ljz6t/UsNS6mCy7S2B8VPgH3ur
	OFzgRS3/9W+JfNp1rf3thcVu8186Js5BfnSUm4Yh/xIVQdT/r5iiF5JlXZc+XIsBY1j6enxcqTmOY
	12BfBO/dagCnTROLDB1G/7UZJVzNHmoGYNDeZXspxrmPvLJ+IkVmXwot0L0WkShS2lpr79ePqqk2z
	tKsdEyuyoNAdLQNNgzh+qL3MTBfWzkTUt1GoLvdZq9DPIVbzE3XgVanMq2m9P7VSoauJ461zkWzYh
	6lmBX6jWZwxucwj7eCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVSh-00000004H7a-1vcs;
	Tue, 01 Jul 2025 07:31:27 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUp6-00000004Coc-4122
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 06:50:34 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-32cd499007aso37504521fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 23:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751352631; x=1751957431; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWPXFIhjTb/V6V1DQLHOJ4YlKbwSK1c4xU/yQWq9blU=;
        b=d722lz0hfyktFlfJdciMoCUGpXgNJMHKLI4cX0FNZlqw6KoNT7qzzSrjW1itZo4BrJ
         rHuH0Aj/NqF3LFTVnclRcG5VMJHoUSjfGDxcun/Ya/U1X2VO21kRQFlS231fu7aVmj8A
         EQvA1llucU7B9LKE8absW6mtaIAW0Z5RE85nd5CrFhu8F/GF798vHMMEg23xM9ynH4D+
         ohbPBT6iVr7Ywze5y160n+u1tWavUsgBOrvronSPVVvg48kNEtsSjXT1gW+lYDtl92Zz
         3LP+9DN+sCmnQRZ9H1x0Lwh01v2gxSuRhl++T2oNZe1k7ieKtWiEmgd2dI0ba7amyb2j
         6MgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352631; x=1751957431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWPXFIhjTb/V6V1DQLHOJ4YlKbwSK1c4xU/yQWq9blU=;
        b=UWnpBGiyDwSiXxd3ubYOp2kyA35EXrdW8hSlcOOy4k7/5fJS1Ph/Z4Q09bslMZW+nY
         /C/6d63W9fnM1oyS8v1yEtN6Z9fhhk8/68Y04Qb2Uhjdhhn69WaKFlib5+Gadh980q/0
         m+DAfoQOrUaVP0gsC5fmQwcZRgWLEq5D/VfM5dIWCgn4GH6yz4/TPH52/nK1IS+UoAhe
         XYIufQws/DnBDrsQ2oxOpZPANdE0K/+/YgwiQE519gtkA16X7ZHv1A0oBjLEDBy9CjMo
         i0QMejvUhAfA4vbiey/JLVsQvx9Zz8hLr2DppH2mlaYz5fo2krLUswm31ygOWQO0Ip4o
         PjxA==
X-Forwarded-Encrypted: i=1; AJvYcCUqLiTxofBJ6BCbJkfA0plwku7rkcYokVHZYaWdJLFoXedfhU9Z3iVHXlMcWRL3CUT5bl0XZYPoQsWxFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvnrFJQw0uwKTo4ZiYNiP55FiW7tLfHK6ePzOkAb9Eg/xQDqi2
	V3DXC8uhjoquDsyzEMhN2zwrdSe3FW17qft9eehd+Hr5au2dvpe2OxAF9KrxZm1PLLj1R2WqALa
	RoI1tW+IvdxQA+ZwC/BbO72w2wpsg9/VDtW98eCHcMg==
X-Gm-Gg: ASbGnctYS/SxitaSmWh8QySw4OczlKvOZBaIqj7heJTZyASJCeAmOoTPNwIBDPsJKft
	Jl9GRnGhNAkeaaw9SYgJ8fO5/1WusEJ/Xnofo6+QFHznQYIm5wPPLZQ+wR0IPUYHvCf6qOQGS9I
	08EWN0HmF3fljpTjSYiMFM1FbS2fWRrPXgiCFqhsrW4iNDPDefjB2ogFs=
X-Google-Smtp-Source: AGHT+IFzkBl1xaxBMxsvzjYcnTTImtOa41K69LoWO7vhOCRunctW7uRpVxNN5kP1lrGeGDNRGiHQb4LGbb+eDUYPLaE=
X-Received: by 2002:a2e:bc1c:0:b0:32c:ef7a:d84b with SMTP id
 38308e7fff4ca-32cef7ad8c6mr27641281fa.13.1751352631111; Mon, 30 Jun 2025
 23:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-6-apatel@ventanamicro.com> <aFkUETH_R30-CNOX@smile.fi.intel.com>
In-Reply-To: <aFkUETH_R30-CNOX@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 1 Jul 2025 12:20:18 +0530
X-Gm-Features: Ac12FXx2G23C94_L44JHbdLekj9g5IUE1GEONeTER1Z3bkY9Y3w5bcaCPjCbmV4
Message-ID: <CAK9=C2WpN2_+wi-0AOZ_2xOK8z9oZk_dD__uRCu+E8iccjyC=Q@mail.gmail.com>
Subject: Re: [PATCH v6 05/23] mailbox: Allow controller specific mapping using fwnode
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_235032_995593_94A4CB27 
X-CRM114-Status: GOOD (  18.56  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgMjoxNeKAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDE4LCAy
MDI1IGF0IDA1OjQzOjQwUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBJbnRyb2R1Y2Ug
b3B0aW9uYWwgZndfbm9kZSgpIGNhbGxiYWNrIHdoaWNoIGFsbG93cyBhIG1haWxib3ggY29udHJv
bGxlcgo+ID4gZHJpdmVyIHRvIHByb3ZpZGUgY29udHJvbGxlciBzcGVjaWZpYyBtYXBwaW5nIHVz
aW5nIGZ3bm9kZS4KPiA+Cj4gPiBUaGUgTGludXggT0YgZnJhbWV3b3JrIGFscmVhZHkgaW1wbGVt
ZW50cyBmd25vZGUgb3BlcmF0aW9ucyBmb3IgdGhlCj4gPiBMaW51eCBERCBmcmFtZXdvcmsgc28g
dGhlIGZ3X3hsYXRlKCkgY2FsbGJhY2sgd29ya3MgZmluZSB3aXRoIGRldmljZQo+ID4gdHJlZSBh
cyB3ZWxsLgo+Cj4gLi4uCj4KPiA+ICsgICAgIGZ3bm9kZSA9IGRldl9md25vZGUoZGV2KTsKPiA+
ICsgICAgIGlmICghZndub2RlKSB7Cj4gPiArICAgICAgICAgICAgIGRldl9kYmcoZGV2LCAiTm8g
b3duZXIgZndub2RlXG4iKTsKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT0RF
Vik7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICByZXQgPSBmd25vZGVfcHJvcGVydHlfZ2V0
X3JlZmVyZW5jZV9hcmdzKGRldl9md25vZGUoZGV2KSwgIm1ib3hlcyIsCj4KPiBXaHkgbm90IHVz
aW5nIGZ3bm9kZSBkaXJlY3RseSBoZXJlPwoKQXJnaCwgSSBtaXNzZWQgcmVwbGFjaW5nIGRldl9m
d25vZGUoKSBvdmVyIGhlcmUuIFRoYW5rcyBmb3IgY2F0Y2hpbmcgaXQsCkkgd2lsbCB1cGRhdGUg
aW4gdGhlIG5leHQgcmV2aXNpb24uCgo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICIjbWJveC1jZWxscyIsIDAsIGluZGV4LCAmZndzcGVjKTsKPiA+
ICAgICAgIGlmIChyZXQpIHsKPiA+IC0gICAgICAgICAgICAgZGV2X2VycihkZXYsICIlczogY2Fu
J3QgcGFyc2UgXCJtYm94ZXNcIiBwcm9wZXJ0eVxuIiwgX19mdW5jX18pOwo+ID4gKyAgICAgICAg
ICAgICBkZXZfZXJyKGRldiwgIiVzOiBjYW4ndCBwYXJzZSBcIiVzXCIgcHJvcGVydHlcbiIsIF9f
ZnVuY19fLCAibWJveGVzIik7Cj4gPiAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKHJldCk7
Cj4gPiAgICAgICB9Cj4KPiAuLi4KPgo+IE90aGVyd2lzZSBsb29rcyBsaWtlIGEgZ29vZCBzb2x1
dGlvbiB0byBnZXQgcmlkIG9mIE9GLWNlbnRyaWMgY29kZSBmcm9tIG1haWxib3gKPiBpbiB0aGUg
ZnV0dXJlLgo+Cj4gLS0KPiBXaXRoIEJlc3QgUmVnYXJkcywKPiBBbmR5IFNoZXZjaGVua28KPgo+
CgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
