Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94B3C02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 12:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7JNNbye2Jx6lFf2lxoBu55fdeKcWPLslM1larUajW8=; b=y6RGDCEkwmCtF4
	ZAspBBriyw+xBhPAmYebA3A1v9a/Z2aWdO6mC6ZiWaZG3mRzdXzRao6xmZdr/OfbnLFiYx5yi3x2b
	VV0k8zj7eizfi2wRT6Ohzg1aASAy8wam+/J1aO3JosLt8ql7uuzvKM02JZjHQjqUm4wZLalhQrOon
	lByflGmRFajxeY4boRzTnJnb5i4rVAuLWBu3ov4wBnJE3uBcsY3loZoO5AwraKxkoq5U0Axry6d3h
	TmprctNBzNc1XV8vFQaNIrDm9odGRyMAwj9gAvA5PeCYGJRctVdGJm4VBXmrvxJQL2XbitNgMpbcB
	l1xshUQkLCIKH3JdYlqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0t3-00000006GE8-03vS;
	Thu, 06 Feb 2025 12:21:41 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0pJ-00000006FfR-0q4x
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 12:17:50 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30761be8fa8so7145181fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 04:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738844267; x=1739449067; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVaPm6svnrZmjjZXaQ6INFYIHurE1c31ambChU45jvE=;
        b=B3ih57ZLZ00iPhPTdVw27m6qTDsdgnCSsw9xLlUMTv6NW73quEWeam9hHJE+LWwLc6
         +DWvScrswwGL3fto7ewVIvQbV1nesut7BwMbUAqCOsaf5awFuafvEQUJDZvcEG+9xyV0
         DALv+FbBTs2rh1ceYoqBAVEeXWQPMxQ6qGZmF+3UIq+EPYhMQWVwOfNYxHcchis+Xp77
         /3efb39JniBBvJCrh4/rXTJaiiYf9Bq1HhsAW45riOKEgGexbzSDl+KwvDNN0Q2FVWzC
         BswLmWpb1VNLz9thDY8kntY+O2UL8t/re89JZQIzCAqE1DebXJGdBFOmoGDs00am5Ze/
         U67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844267; x=1739449067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVaPm6svnrZmjjZXaQ6INFYIHurE1c31ambChU45jvE=;
        b=GNBTfqJqctfoQ9KNfoQJZPZXwtSzJFMmTJaB/tJWxBaowcDkSNkLe1YoRIpyoaGlg8
         7u4ooic3UzDcVwTCx3fWhVDGtERpJ7HQnJ/oTz56NoQZgBwWcmC+OttZhFPlNUcR/OC7
         R9l0urg+RHMAPF6U6alTbIUTGWuaTp8XVGM69Nzd+bS4lGk2qmBKi5/lVoD3sMS8yjdE
         RQGj+B1mZLjoj0BS/pgdLuUdagMSkvnmIXQXSRqhw/pTATpwP0IPcwogp9jB7N2uY+n6
         tLoVBTpLwAxSsaFK2K1nebOsEiZH+h6yjljlvhLLlSezOern2oAJRX680qxl4AV1acM9
         duAw==
X-Forwarded-Encrypted: i=1; AJvYcCUtEY9QgtB6NFrc1psjeCw6nPYCwS+qIRc69GqbmKanoZGKu3JCsGiCeu+zPkL+YYCTSFV3BVxh+pq5kA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDIViF0Tt4D0KGx4eWUmGxaM+DkzS+WJ6P9qZsDgt59euelcao
	7KZf8F3Kvq7rbmRR0vGA8e3RGAHMcb/s9zQHDrQSC2tCRFtURtyrlpSbhqiJ7hS63tFgglwonga
	2HYLAf3nw9msUwxfyfellAidvtZEgGsLxGxEFVw==
X-Gm-Gg: ASbGncvD1V5YsynTlqlLebUJwjWOWmWRl47aGWAO7DnpzTtwKLn1KxRJiyaG7DdXQQp
	KiD5rxjvxZ5hanKl3Y0xGKJCTSQHPoBcYRlm+CRuatsinca3RzKTgrkBSqYkSFCuTtF1zMzbAKQ
	==
X-Google-Smtp-Source: AGHT+IEdOcygqBJ9zpwt9AnW8YGVVzGNtNdwXSyeVHKPWBPAI82GsWsII++eZWvLHpNnJrehz+aGVI+bK2PH2gmRR6A=
X-Received: by 2002:a05:651c:b08:b0:2ff:c242:29c8 with SMTP id
 38308e7fff4ca-307cf386eaamr25840471fa.35.1738844267233; Thu, 06 Feb 2025
 04:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-12-apatel@ventanamicro.com> <871pwfp272.ffs@tglx>
In-Reply-To: <871pwfp272.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 6 Feb 2025 17:47:34 +0530
X-Gm-Features: AWEUYZnkWoBjjXJZwQi6NEV8e_1cUvMnkW_wF5FuGhI66P5vlROSq0JSDO_qX_Y
Message-ID: <CAK9=C2U537LvffPLGad=LsFsN27uW2UB2X=Oxrub9v2U5vneYQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/17] irqchip: Add driver for the RISC-V RPMI
 system MSI service group
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_041749_241145_9A21A94A 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atishp@atishpatra.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgVGhvbWFzLAoKT24gTW9uLCBGZWIgMywgMjAyNSBhdCA3OjIw4oCvUE0gVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBGZWIgMDMgMjAyNSBh
dCAxNDoxOSwgQW51cCBQYXRlbCB3cm90ZToKPiA+ICsKPiA+ICtzdHJ1Y3QgcnBtaV9zeXNtc2lf
cHJpdiB7Cj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gPiArICAgICBzdHJ1Y3QgbWJv
eF9jbGllbnQgY2xpZW50Owo+ID4gKyAgICAgc3RydWN0IG1ib3hfY2hhbiAqY2hhbjsKPiA+ICsg
ICAgIHUzMiBucl9pcnFzOwo+ID4gKyAgICAgdTMyIGdzaV9iYXNlOwo+ID4gK307Cj4KPiBBUyBy
ZXF1ZXN0ZWQgYmVmb3JlIHBsZWFzZSB1c2UgdGFidWxhciBsYXlvdXQgZm9yIHN0cnVjdHM6Cj4K
PiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL21haW50YWlu
ZXItdGlwLmh0bWwjc3RydWN0LWRlY2xhcmF0aW9ucy1hbmQtaW5pdGlhbGl6ZXJzCj4KPiA+ICtz
dGF0aWMgaW50IHJwbWlfc3lzbXNpX3NldF9tc2lfc3RhdGUoc3RydWN0IHJwbWlfc3lzbXNpX3By
aXYgKnByaXYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBzeXNf
bXNpX2luZGV4LCB1MzIgc3lzX21zaV9zdGF0ZSkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgcnBt
aV9zeXNtc2lfc2V0X21zaV9zdGF0ZV90eCB0eDsKPiA+ICsgICAgIHN0cnVjdCBycG1pX3N5c21z
aV9zZXRfbXNpX3N0YXRlX3J4IHJ4Owo+ID4gKyAgICAgc3RydWN0IHJwbWlfbWJveF9tZXNzYWdl
IG1zZzsKPiA+ICsgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAgICB0eC5zeXNfbXNpX2luZGV4
ID0gc3lzX21zaV9pbmRleDsKPiA+ICsgICAgIHR4LnN5c19tc2lfc3RhdGUgPSBzeXNfbXNpX3N0
YXRlOwo+ID4gKyAgICAgcnBtaV9tYm94X2luaXRfc2VuZF93aXRoX3Jlc3BvbnNlKCZtc2csIFJQ
TUlfU1lTTVNJX1NSVl9TRVRfTVNJX1NUQVRFLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZ0eCwgc2l6ZW9mKHR4KSwgJnJ4LCBzaXplb2YocngpKTsKPiA+ICsg
ICAgIHJldCA9IHJwbWlfbWJveF9zZW5kX21lc3NhZ2UocHJpdi0+Y2hhbiwgJm1zZyk7Cj4gPiAr
ICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAgaWYg
KHJ4LnN0YXR1cykKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJwbWlfdG9fbGludXhfZXJyb3Io
cnguc3RhdHVzKTsKPiA+ICsKPiA+ICsgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICsj
ZGVmaW5lIHJwbWlfc3lzbXNpX21hc2soX19wcml2LCBfX21zaV9pbmRleCkgICAgICAgICAgICAg
ICAgXAo+ID4gKyAgICAgcnBtaV9zeXNtc2lfc2V0X21zaV9zdGF0ZShfX3ByaXYsIF9fbXNpX2lu
ZGV4LCAwKQo+ID4gKyNkZWZpbmUgcnBtaV9zeXNtc2lfdW5tYXNrKF9fcHJpdiwgX19tc2lfaW5k
ZXgpICAgICAgICAgICAgICBcCj4gPiArICAgICBycG1pX3N5c21zaV9zZXRfbXNpX3N0YXRlKF9f
cHJpdiwgX19tc2lfaW5kZXgsIFJQTUlfU1lTTVNJX01TSV9TVEFURV9FTkFCTEUpCj4KPiBUaGVz
ZSBtYWNyb3MgYXJlIG5vdCByZWFsbHkgcHJvdmlkaW5nIGFueSB2YWx1ZS4KPgo+ID4gK3N0YXRp
YyB2b2lkIHJwbWlfc3lzbXNpX2lycV9tYXNrKHN0cnVjdCBpcnFfZGF0YSAqZCkKPiA+ICt7Cj4g
PiArICAgICBzdHJ1Y3QgcnBtaV9zeXNtc2lfcHJpdiAqcHJpdiA9IGlycV9kYXRhX2dldF9pcnFf
Y2hpcF9kYXRhKGQpOwo+ID4gKyAgICAgaW50IHJldDsKPiA+ICsKPiA+ICsgICAgIHJldCA9IHJw
bWlfc3lzbXNpX21hc2socHJpdiwgZC0+aHdpcnEpOwo+ID4gKyAgICAgaWYgKHJldCkKPiA+ICsg
ICAgICAgICAgICAgZGV2X3dhcm4ocHJpdi0+ZGV2LCAiRmFpbGVkIHRvIG1hc2sgaHdpcnEgJWQg
KGVycm9yICVkKVxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgKHUzMilkLT5od2lycSwg
cmV0KTsKPgo+ICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICAuLi4uCj4gICAg
ICAgICB9Cj4KPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNz
L21haW50YWluZXItdGlwLmh0bWwjYnJhY2tldC1ydWxlcwo+Cj4gPiArICAgICBpcnFfY2hpcF9t
YXNrX3BhcmVudChkKTsKPiA+ICt9Cj4KPiBPdGhlciB0aGFuIHRob3NlIG5pdHMsIHRoaXMgbG9v
a3MgcmVhc29uYWJsZS4KCkkgd2lsbCBhZGRyZXNzIGFsbCBhYm92ZSBjb21tZW50cyBpbiB0aGUg
bmV4dCByZXZpc2lvbi4KClRoYW5rcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
