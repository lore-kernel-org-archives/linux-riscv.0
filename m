Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772E0CA101F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTFLqdvGtZvIAsAo9XfyMr4KLFDzJ9QUpkthrNbQ/Pg=; b=NKvDYCh5TWCNC3
	PV8uQZ3QsoI2wxwdgT2Vlhx0awiPUmDnV03BTyWqzP4d8TLyWTI1gr9HaRtUZGR1UE0jNJFGpWkw0
	7LM8SnXT1Yr/hm8kAr+3SE6ALLwlwfHPurYhBrvT1lp3kmWvZ25kVKnQD/1eP0CTJ3IAi5PLDYoUy
	nwoI9M/Z8ZAw1v66/TsC0catVrofsxZ+FPE33IK3MUYPrqta1g95Pe2WCAuSQgNQ57/yUWRRUyLyT
	Sdv6suVYXNclbcllfX465wMUhL7zzUYJqQiP7Ix79Bow5B2heioL3bPz++nbn3PqhsQYgGmOsrR6r
	1ZtjJGdP8vOQFnlqOtrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyHh-00000007fgH-2Qiu;
	Fri, 12 Sep 2025 07:33:29 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyHe-00000007fe1-17zn
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 07:33:28 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55f753ec672so1757664e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 00:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757662404; x=1758267204; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kg3BU9cKfGHe7tGgdAiZsc5JB/dKxlDiQ/R4O8eZPV4=;
        b=XJEhRkZZHUTGWtpWeDW4/w5LKzuyb3SO0MvuwewMb9hA9qIXvD9oW+0DXUm/FfJX5o
         /Q1bx7lJ6mhFjcWBlohgXM8GYt5B8IExLANyDtU+PZfFYUEb4szkXCETnF8KqJS30mol
         yJxPTSyPxy+U1wJgnVgN/xYEP6qm97adVEsqfn8T+uXSyzIB6rOXxThPwpbJBLj3d4yR
         +VZAYBebu8J/XamF30gBMHGvnBa0skPC434Oih+P5WA77YrJ1nFynXp4xaWRwqz1iZyi
         cSykjEErKEfQes5nmAF6Wwv7HrEVQVc25nprSm4shuogygSje7qY8kWrM1jN5ajIaboa
         ePIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662404; x=1758267204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kg3BU9cKfGHe7tGgdAiZsc5JB/dKxlDiQ/R4O8eZPV4=;
        b=NS8YWlmRBgRU68kT4rK/GxPqJ9MNweMGEHIKkZFQrT7oRC69d6LCSJZqGGIlbqT4IG
         1APgo3ei6uciI1ZgPDkdwgoYcA67WzYzqYia0/z0PvURagYMFoV0XQS85BPi4kM3QBLe
         dvJc2PqZ+L21H8lnBjSkAyZICJmjbsGmbUxBUNA5bmC6mRZUcGjDeISe1mOPO7PMMHkY
         ETNwgGOIEMBFES44M6QZeyhkIsqUJJ3QqZO46DoXcf+hxHnRKpIbtPO191dS2txB+6Gu
         t+GbYIJW+erIj5By1B0cl1Znc+qPHQInQmGK2LhaCccYi9Y1de35aE05Ekmo7jLka0fl
         45bw==
X-Forwarded-Encrypted: i=1; AJvYcCVzGMqgYP5D2W7zgK8UjYXPrPEfOuy8oDTeZkjy8tsQA+/3j35D1JsBR+Do05jEFnJ0yoxbH+Rg8baJeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaRQv6N1aGZVlX6hK5xVqlUE5vMUkIqInNmR+a2Dbn/k0xUr7O
	+m4UUpqkVjVudd9t6yrYb/4dhPdKcJYD+7tpeEFAsvvgyHX4Kx86XFqJHjeeA7x9Ep0C8ZRTBfs
	Yx7i8JCbIsjZkkpphwyGJocEsOGA7pdrPU46jwKJYVA==
X-Gm-Gg: ASbGncsCwTCdIjUQye4qbihtX6cnsQZssKLIwg2up7XvnkrB2iOmy654FCAquUJwI1r
	oxbKCTvzDGREbTneDL/AmUaITwsW4XwdsJpnFLXpebqnvQoFA67iOnyocgu9t64VOI9veswXCVq
	ZR2TVOGhf8JKrSgYA2qK52NaHvRCYsxy1t1h9EhGLn2vSypR3Jo4MZEA2fxUuKAGH4BrjV7t74p
	JmN1bI/IC7gaoB9qg==
X-Google-Smtp-Source: AGHT+IFqJ3rG4VGz2N4HeDjhdE1zZXrIjMGRIFcSDQMQTPILLpM42VNVO1ib5uwXHA7KeYqbyezpYRqeKhIIV796t/0=
X-Received: by 2002:a05:6512:3693:b0:569:a257:c6d6 with SMTP id
 2adb3069b0e04-57050fe351amr473063e87.49.1757662403635; Fri, 12 Sep 2025
 00:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com> <CAMRc=McbadZx1yK1jGeyUnXAFZgfA8YpLwacmqC0eMonS-c-9A@mail.gmail.com>
In-Reply-To: <CAMRc=McbadZx1yK1jGeyUnXAFZgfA8YpLwacmqC0eMonS-c-9A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 09:33:12 +0200
X-Gm-Features: Ac12FXxWiwLmhQls14nNfaQvMLfIJjlBZAsZhTSA6_U4hnix-0Aq3t1bNNwFxXE
Message-ID: <CACRpkdbSp6ScZrzUtdP0ojP10yOTsbnd33HqgEVdiSwPRomuAg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_003326_323496_8D9AE246 
X-CRM114-Status: GOOD (  13.07  )
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

T24gVGh1LCBTZXAgMTEsIDIwMjUgYXQgOTozOOKAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgo+IE9uIFdlZCwgU2VwIDEwLCAyMDI1IGF0IDExOjMy4oCvUE0g
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKCj4gPiBJIHdv
dWxkIG1lcmdlIHRoZSBmaXJzdCAxNCBhbmQga2VlcCB0aGUgbGFzdCBmb3IgdGhlIGxhdGVyIHBh
cnQKPiA+IG9mIHRoZSBtZXJnZSB3aW5kb3cgd2hlbiBhbGwgb3RoZXIgdHJlZXMgd2l0aCBjb252
ZXJzaW9ucwo+ID4gYXJlIG1lcmdlZC4KPiA+Cj4gPiAoWW91IHByb2JhYmx5IGFscmVhZHkgdGhv
dWdodCBvZiB0aGlzLikKPiA+Cj4gPiBZb3VycywKPiA+IExpbnVzIFdhbGxlaWoKPgo+IEkgYWxy
ZWFkeSBoYXZlIGJvdGggcGluY3RybCBhbmQgbWZkIGNoYW5nZXMgaW4gbXkgdHJlZSBmcm9tIExl
ZSdzIGFuZAo+IHlvdXIgaW1tdXRhYmxlIGJyYW5jaGVzLiBJIHB1c2hlZCB0aGlzIGludG8gZ3Bp
by9kZXZlbCBhbmQgaXQgYnVpbHQKPiBqdXN0IGZpbmUuCgpBaCwgZXhjZWxsZW50IHBsYW5uaW5n
LiBTbWFydGVyIHRoYW4gYW55dGhpbmcgSSdkIGJlIGFibGUgdG8KbG9naXN0aWNpemUgaW4gbXkg
aGVhZCEKCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
