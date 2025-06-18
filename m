Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143DCC71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 04:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQ/oud7aZXQzxOwL04PBqoZlaFNNyd7qh7RIaxEzssk=; b=N2H/uAnmCAmx4s
	ziddRmN3WvjOLXBLY/uZkG1bzVHKV4xGiqyKIzAFE2fXpsd86/by0EV7MGcIciCnVb03ukWcT4zdu
	7qju5/8AIxMCi48wYKbv7Aqlh+Hoa1lLfpI6tUmpQuJKQ/gVAZCr6uC3i6JGtmFrI5WsvCGGnxLPt
	OB8l6UgI1roXKUj1f/DE/ugCcXf5b3kmfadG4oKUbH9X5LfRGhoaUIlWjAAI0J17h4t23MOypRqIL
	1RBUu+jA7aRBrpatR/c5hGPN7yXNar2H9wZV1VOX5lps6b0zxO8LnOIV5rNl94OHVJwhzsgvLT3Ib
	xHM7sjmR8wpFeM5YK0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRk6h-00000008yHx-0zpn;
	Wed, 18 Jun 2025 04:09:03 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRk6e-00000008yHZ-0OOD
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 04:09:01 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553bcf41440so3775759e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 21:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750219738; x=1750824538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV+4GdLIPduWvDvm4cyTBr7zE4Nr+cAmACWAXvYhmEQ=;
        b=LyJ51NViCd/dOX+6Quti6WDXNRNntxYEsUQtjLI+gwECkZ4j4b/EQpjjt5wGgQJ36W
         hlq5TtBjjz6mcQ3JKA/ADeppHxXWtA9M0wcPeDwXmv0h2aXM2v/ekdlmIy03mnmEkKux
         c3pg78XQbrxoNfDV1YfPDDHXpdWVKjNHG9p6u3vyQ/g1NR5fYC0jQ0PaaKDD0WUfBgak
         KwFlraZB2TRywe2I1gVQOIeYpV7Uj8u0R6FJVQHZ1CawURBSqKM0k0nfYe5S6MO8Ocjo
         VGJ7J1fE8qBpHnsT5GjExtSeI/gczPXulyjZ/o3X7gs5AkmQA5FoR04mkeZZsCNq/m13
         YV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750219738; x=1750824538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hV+4GdLIPduWvDvm4cyTBr7zE4Nr+cAmACWAXvYhmEQ=;
        b=O5SZPKw5zBGeg67+n1Zi4enEVV5BOspSlNHwbPr13V+x920jwhA+0vQ/rBUDfi6Z1z
         nIkp2MUaJLgfHZoOvYPyefADA5jEJkAE1ufT8L25daSymm6UKXwFTZk+rsnU14YDdDOG
         bXZ5/tH8NmCPjgXlcWHysrpvJcA0RDQzZEuvb/yJjj3lc248qje3kg7oSoGRJusNTIak
         OoLtyz3fOgPZPc7mU9d/hOdJ8WXeLp14VVvAGzXmKo9GbMmjsSkpvRRmthq8bINj6a9W
         hSMRUINDl+uUSg76j2DXWN91WDkXyxcoFbqCFszQT71TDAAMkz11+N4PkQKePGu7Ren/
         5RMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC8ZN2rDlMe2jQStrGLk/AoaU7jHpVXjRr+FUICRlDWYNsX3zUMd4917mkjZWXeon42EFIhRQfbW522w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz852bH9BzBA7suuCc54uSI0aLeDjYhTL1dPYtohIpu60WSe/8/
	kanhpYygngHciBQphehmIgVuPerql/Ksb8FEbThXh8eCKaTSnuiUlwAn2rzVjpQZQy7BLjrTygC
	NWlBQCLhCvjf93STjnili8jfZzyuzYc7nZZwztFjqpA==
X-Gm-Gg: ASbGncur0XWcY4GcmLUDkBfAzKvYIlxNKT0vse0XxSGsUiHzMQgz3NeGfA/blktmJ+a
	QKRbEO2VH51XqEGycedBkVoB5dFgDk05GFypWhL+NENaWe/XxjdzKlTlDzqnjBeqbqt5s69+Ihu
	vkwVScr4Y842zSEY0k404es1X0Peez4wcKwa9V+Mv8lw==
X-Google-Smtp-Source: AGHT+IFnL3eHkaa0AaGa2260XzL4VnwU/UtF89FsaS0XOFT0LH12cqs0j3TtvsOBW7k3zdEpBSYUjjpFngr0GSrWEx8=
X-Received: by 2002:a05:6512:1192:b0:553:addb:ef51 with SMTP id
 2adb3069b0e04-553b6e8c2f5mr3946779e87.18.1750219738106; Tue, 17 Jun 2025
 21:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-6-apatel@ventanamicro.com> <aEmiOFwofEJyXm4R@smile.fi.intel.com>
In-Reply-To: <aEmiOFwofEJyXm4R@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 18 Jun 2025 09:38:46 +0530
X-Gm-Features: AX0GCFuSAGiDE5-KiEpx1v8HnSXue_LepxDvBagpnGvUmEgx8W2v2dqjbNj1zB0
Message-ID: <CAK9=C2Xhkfk4WZeD2gVCoJxeRHAuYjSfwx_zUHvVBqOQPLV7Lg@mail.gmail.com>
Subject: Re: [PATCH v5 05/23] mailbox: Allow controller specific mapping using fwnode
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_210900_134119_D1DF2CE6 
X-CRM114-Status: GOOD (  22.24  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgOTowNeKAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDExLCAy
MDI1IGF0IDExOjUyOjIwQU0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBJbnRyb2R1Y2Ug
b3B0aW9uYWwgZndfbm9kZSgpIGNhbGxiYWNrIHdoaWNoIGFsbG93cyBhIG1haWxib3ggY29udHJv
bGxlcgo+ID4gZHJpdmVyIHRvIHByb3ZpZGUgY29udHJvbGxlciBzcGVjaWZpYyBtYXBwaW5nIHVz
aW5nIGZ3bm9kZS4KPiA+Cj4gPiBUaGUgTGludXggT0YgZnJhbWV3b3JrIGFscmVhZHkgaW1wbGVt
ZW50cyBmd25vZGUgb3BlcmF0aW9ucyBmb3IgdGhlCj4gPiBMaW51eCBERCBmcmFtZXdvcmsgc28g
dGhlIGZ3X3hsYXRlKCkgY2FsbGJhY2sgd29ya3MgZmluZSB3aXRoIGRldmljZQo+ID4gdHJlZSBh
cyB3ZWxsLgo+Cj4gLi4uCj4KPiA+ICBzdHJ1Y3QgbWJveF9jaGFuICptYm94X3JlcXVlc3RfY2hh
bm5lbChzdHJ1Y3QgbWJveF9jbGllbnQgKmNsLCBpbnQgaW5kZXgpCj4gPiAgewo+ID4gKyAgICAg
c3RydWN0IGZ3bm9kZV9yZWZlcmVuY2VfYXJncyBmd3NwZWM7Cj4KPiBEZWZpbmUKPgo+ICAgICAg
ICAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZTsKPgo+Cj4gPiAgICAgICBzdHJ1Y3QgZGV2
aWNlICpkZXYgPSBjbC0+ZGV2Owo+Cj4gVGhpcyBiZXR0ZXIgdG8gYmUganVzdCBhIGRlY2xhcmF0
aW9uLgo+Cj4gPiAgICAgICBzdHJ1Y3QgbWJveF9jb250cm9sbGVyICptYm94Owo+ID4gICAgICAg
c3RydWN0IG9mX3BoYW5kbGVfYXJncyBzcGVjOwo+ID4gICAgICAgc3RydWN0IG1ib3hfY2hhbiAq
Y2hhbjsKPiA+ICsgICAgIHVuc2lnbmVkIGludCBpOwo+ID4gICAgICAgaW50IHJldDsKPgo+IFdp
dGggdGhlIGFib3ZlIHRoZSBiZWxvdyB3aWxsIGxvb2sgbGlrZS4uLgo+Cj4gPiAtICAgICBpZiAo
IWRldiB8fCAhZGV2LT5vZl9ub2RlKSB7Cj4gPiAtICAgICAgICAgICAgIHByX2RlYnVnKCIlczog
Tm8gb3duZXIgZGV2aWNlIG5vZGVcbiIsIF9fZnVuY19fKTsKPiA+ICsgICAgIGlmICghZGV2IHx8
ICFkZXZfZndub2RlKGRldikpIHsKPiA+ICsgICAgICAgICAgICAgcHJfZGVidWcoIk5vIG93bmVy
ICVzXG4iLCBkZXYgPyAiZndub2RlIiA6ICJkZXZpY2UiKTsKPiA+ICAgICAgICAgICAgICAgcmV0
dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4gPiAgICAgICB9Cj4gPgo+ID4gLSAgICAgcmV0ID0gb2Zf
cGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoZGV2LT5vZl9ub2RlLCAibWJveGVzIiwgIiNtYm94LWNl
bGxzIiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZGV4LCAm
c3BlYyk7Cj4gPiArICAgICByZXQgPSBmd25vZGVfcHJvcGVydHlfZ2V0X3JlZmVyZW5jZV9hcmdz
KGRldl9md25vZGUoZGV2KSwgIm1ib3hlcyIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICIjbWJveC1jZWxscyIsIDAsIGluZGV4LCAmZndzcGVjKTsK
PiA+ICAgICAgIGlmIChyZXQpIHsKPiA+ICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICIlczog
Y2FuJ3QgcGFyc2UgXCJtYm94ZXNcIiBwcm9wZXJ0eVxuIiwgX19mdW5jX18pOwo+ID4gICAgICAg
ICAgICAgICByZXR1cm4gRVJSX1BUUihyZXQpOwo+ID4gICAgICAgfQo+Cj4gLi4udGhpcwo+Cj4g
ICAgICAgICBkZXYgPSBjbC0+ZGV2Owo+ICAgICAgICAgaWYgKCFkZXYpIHsKPiAgICAgICAgICAg
ICAgICAgcHJfZGVidWcoIk5vIG93bmVyIGRldmljZVxuIik7Cj4gICAgICAgICAgICAgICAgIHJl
dHVybiBFUlJfUFRSKC1FTk9ERVYpOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBmd25vZGUgPSBk
ZXZfZndub2RlKGRldik7Cj4gICAgICAgICBpZiAoIWZ3bm9kZSkgewo+ICAgICAgICAgICAgICAg
ICBkZXZfZGJnKGRldiwgIk5vIG93bmVyIGZ3bm9kZVxuIik7Cj4gICAgICAgICAgICAgICAgIHJl
dHVybiBFUlJfUFRSKC1FTk9ERVYpOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICByZXQgPSBmd25v
ZGVfcHJvcGVydHlfZ2V0X3JlZmVyZW5jZV9hcmdzKGZ3bm9kZSwgIm1ib3hlcyIsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIjbWJveC1jZWxscyIs
IDAsIGluZGV4LCAmZndzcGVjKTsKPiAgICAgICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAgICAg
ICAgZGV2X2VycihkZXYsICIlczogY2FuJ3QgcGFyc2UgXCJtYm94ZXNcIiBwcm9wZXJ0eVxuIiwg
X19mdW5jX18pOwo+Cj4gWW91IG1heSBzYXZlIGEgZmV3IGJ5dGVzIGJ5IGRvaW5nIGl0IGFzCj4K
PiAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICIlczogY2FuJ3QgcGFyc2UgXCIlc1wiIHBy
b3BlcnR5XG4iLCBfX2Z1bmNfXywgIm1ib3hlcyIpOwo+Cj4gICAgICAgICAgICAgICAgIHJldHVy
biBFUlJfUFRSKHJldCk7Cj4gICAgICAgICB9Cj4KPiA+ICsgICAgIHNwZWMubnAgPSB0b19vZl9u
b2RlKGZ3c3BlYy5md25vZGUpOwo+ID4gKyAgICAgc3BlYy5hcmdzX2NvdW50ID0gZndzcGVjLm5h
cmdzOwo+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IHNwZWMuYXJnc19jb3VudDsgaSsrKQo+ID4g
KyAgICAgICAgICAgICBzcGVjLmFyZ3NbaV0gPSBmd3NwZWMuYXJnc1tpXTsKPiA+ICsKPiA+ICAg
ICAgIHNjb3BlZF9ndWFyZChtdXRleCwgJmNvbl9tdXRleCkgewo+ID4gICAgICAgICAgICAgICBj
aGFuID0gRVJSX1BUUigtRVBST0JFX0RFRkVSKTsKPiA+IC0gICAgICAgICAgICAgbGlzdF9mb3Jf
ZWFjaF9lbnRyeShtYm94LCAmbWJveF9jb25zLCBub2RlKQo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgIGlmIChtYm94LT5kZXYtPm9mX25vZGUgPT0gc3BlYy5ucCkgewo+ID4gKyAgICAgICAgICAg
ICBsaXN0X2Zvcl9lYWNoX2VudHJ5KG1ib3gsICZtYm94X2NvbnMsIG5vZGUpIHsKPgo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIGlmIChtYm94LT5md194bGF0ZSAmJiBkZXZfZndub2RlKG1ib3gt
PmRldikgPT0gZndzcGVjLmZ3bm9kZSkgewo+Cj4gV2UgaGF2ZSBhIGhlbHBlciBkZXZpY2VfbWF0
Y2hfZndub2RlKCkKPgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hhbiA9IG1i
b3gtPmZ3X3hsYXRlKG1ib3gsICZmd3NwZWMpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKCFJU19FUlIoY2hhbikpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSBpZiAobWJv
eC0+b2ZfeGxhdGUgJiYgbWJveC0+ZGV2LT5vZl9ub2RlID09IHNwZWMubnApIHsKPgo+IE5vIG5l
ZWQgdG8gY2hlY2sgT0Ygbm9kZSAoYWdhaW4pLiBJbnN0ZWFkIHJlZmFjdG9yIGFzCj4KPiAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoZGV2aWNlX21hdGNoX2Z3bm9kZSguLi4pKSB7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoZndfeGxhdGUpIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLi4uCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB9IGVsc2UgaWYgKG9mX3hsYXRlKSB7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC4uLgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPgoKT2theSwgSSB3aWxsIHVwZGF0ZSBsaWtl
IHlvdSBzdWdnZXN0ZWQuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
