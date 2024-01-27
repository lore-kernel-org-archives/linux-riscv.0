Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E96C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 23:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yesDcKeb0N6/S+Kw2/DQeWNW9uNXteM9bWub3piC7hw=; b=dI+Lr92dkZMG/G
	qs/IaPtKSQLlPP/TT3UW8YWO8rykK3hLdL4XzuDwCRrorJGiWVow5dIlEsYw6uyRAb+h05+uGYPvS
	CBAYEG/OkFBCAC+c/0AraWS7sOPBKcMkaIRwLrITNFJ7yLKfLFx7LRpwvm9ae/OYn+xQcE3FpMGlR
	sdsi0iXW8nl0vKes3UvkBq/IihUlrQK3KNTfWVDHCtirkQREhUm6ssg8zpyTtKBUiNj7lkqWuXM0z
	4DuSiGNZuZ3R58DM/ppXCtY/qWfexi35yRLtWU6iVwetpID987CqorMFmg8qb1MgxAc3OnssetaNV
	Aqn75g47p+hInhnN9YSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTrhJ-00000008LQ1-3sYW;
	Sat, 27 Jan 2024 23:02:49 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTrhH-00000008LPb-0bpC
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 23:02:48 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-602d0126e80so14420507b3.3
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 15:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706396565; x=1707001365; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OI/DYxsJSWBx+d25tKtsRfVL4GAUVdxqmdpn8lShZf4=;
        b=VTSDEN/mbevpOCBbXY5O3ql1SRRhwlP+wsSXc6tDOrlp14fO0ZWTFN0RIVF0gV8jbt
         3HxKVw4L96ujat9WDthII8CFUs812/v9Jw5Q/7AH9IM50ORBPTQO44z0FaOm/XzYcu45
         mLp0ivuUL1cC9volet4mXLzZC+hpr7cpEjjeW6UUkCQ/yF69OqemJ4BzsTaynaPpGeSE
         vCv6UIEZoLfwy3E6P3b7p4LRqf3azLmGe6ixJhPpTSbeRDq/mdH+Ji0ikLEsFLLgRXM5
         WVawhYt3zcLhA/LWVKYRo7Cl7uIGKDayHiWzKeLTvaT64w98Sge3twzlakEJVyj3aMLR
         m1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706396565; x=1707001365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OI/DYxsJSWBx+d25tKtsRfVL4GAUVdxqmdpn8lShZf4=;
        b=TezbPL0e6LRRUzDcUqXRg4RLmTLOLYFmJdnv0GS7tEFvRZeLOQobdxiohkaT5EOmS0
         lGyWNLFfvUQxiOQdCJXo8Whme3WT2/d69SFV7N7e/NCHBqA8G/U/FxagiUxWpo5qMglL
         hLE1TJmNxMYSXEK7x+Mu/zTdNxO3tWe1Ge4Jds0dt1HY0InL4oEyYpDkfX9Ugu1eAyDh
         K0RFU9gO75GbHMKqcM25QF68uBcn5Q/2gx/octcKbDUG2lkDGebXP45ETVV27w9psrKv
         ZLSqaxVt5nK+l0yMdz72ESLLfjUXL6quzor+ba8NGzZTVkIQ9SragtZU39MSF2ZhCsjr
         KnAQ==
X-Gm-Message-State: AOJu0Yxo5Fyv7BAHE88og4OrmRrXgknNps013xFKt3CAUdW+Xi9Nq93C
	uLkV13A1d27Se2dl4XjVrFOjB4MBCY2erg18um8tqW6oiKTSEKuNDh4nqkNTx/e9YQI5Nq3u9TX
	FGDGkLWm161LRwKIfrPii60QDhTKhssrT65AtxQQ6jg3iRo4L
X-Google-Smtp-Source: AGHT+IGyjw9LIiDDoT2S5tGsoR6J36rkT7VTljb52lUEVS87VMLK8vJpNqzNYIdeGvFGjm5XifyDw3lPWoEfckgnn6c=
X-Received: by 2002:a81:a709:0:b0:5ff:6173:e98e with SMTP id
 e9-20020a81a709000000b005ff6173e98emr1920073ywh.63.1706396565671; Sat, 27 Jan
 2024 15:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com> <20240103132852.298964-3-emil.renner.berthing@canonical.com>
In-Reply-To: <20240103132852.298964-3-emil.renner.berthing@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 00:02:34 +0100
Message-ID: <CACRpkdZhzC_4ZFV6cpA5=tHfzyv+NjFBoFC3=jenS2x0-0DZmg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_150247_221476_24092A8C 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBKYW4gMywgMjAyNCBhdCAyOjI54oCvUE0gRW1pbCBSZW5uZXIgQmVydGhpbmcKPGVt
aWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgoKPiBBZGQgcGluY3RybCBk
cml2ZXIgZm9yIHRoZSBULUhlYWQgVEgxNTIwIFJJU0MtViBTb0MuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNv
bT4KClRoaXMgZHJpdmVyIGxvb2tzIG1vc3RseSBmaW5lIGJ1dCBJIGFtIHdhaXRpbmcgZm9yIHRo
ZSBiaW5kaW5ncwp0byBiZSBoYXNoZWQgb3V0LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
