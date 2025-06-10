Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A6FC677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 00:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cM4SlH8aAVWZEVfyU/99HdwbYaoqcNd6mBqGPgs3/4=; b=X7lGtC1wbfm304
	uxQ7lgXnzYJBBjcYUYzt43FeHqST4fCtrXuPFLkDe18lLAVL08NJfFB5JvhSp2xhJ056h0m9Mo/cF
	thqP0hbWrp6oA7/svBICOlDyNnTe0K1upKur+iEyL3Tm4Ag2+ZL6CNFlxDAkIkQs7XsreSW6cl6kN
	qwN8YoxkPR0nMrKbFZG7q3BX5qs6a3mJmj1fVv5YXOCo7vyRL7NEL1XygqqTTf3nlk73M6U/f2+R+
	ZYTdri+Zv6Hnlx6FB6K3M1BvMyuy7FduJJs7R0V4SiZsH3stqHN/e4O5KPYm7NhwOtiYJrmmDQuGd
	3eRYySzj8A/cVsknlnRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9j9-00000008Vby-32fC;
	Wed, 11 Jun 2025 00:54:03 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP72f-00000008ALn-319z
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 22:02:03 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5535e35b059so300016e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749592920; x=1750197720; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=fivpXqDnEwMYYCaDwwn3qaiLgkoEsadMB9SX2YN0Wy/jMw4Q0mDKIAQRRk3mHiNV8f
         ea+tLXxxojx8ZCcec05SXdQEsq0EgqPwjLAHQqwuA1UUYDu8HBtvdOyQO+65Y43YS8W0
         xKI5aTqgcJaC6/oc1UZ5w5wEC6oLVfjFhi6fgPAMCMJGuUTg3HiLEDh4C0VtGlORyNGb
         X7ykJj6JAyTeUB+Xjgw9SmZEqPfn+ymfJ08R3GkjSa/IidSa4tchqb2O1tSZUchIkdhu
         kxpL5ujgU8TP6zHIP6ryxST3W0NLPBZfBdmh3V1zbc1qYxB5PTHH05rT0GCE4UHLbSkK
         FvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749592920; x=1750197720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=vrF4aWuGZ5or+oxw/gN56uiMySvV5HzJ7K+IXuuYrHidxgyRdFKOcfs5uiLb7y6Ns0
         68+GuiCArVdrxDjNPwqPqFXRI2fZYJ+ldyNcsMWoVrTY2QBz4cLMWHF4aWrS2BmfryZj
         Zqd+Vjc9UT5G+34181J1WpkeLhrWXB5iW1sgeluODu+ToMegsYqpDaqGlvx9XLe3GmE5
         /+Ttk/z4soRAgovaYvj1NYOxGOIhvzB2S1e2+61RW0Kt4OtXvrCTUVfnCg+M2GUYWLf/
         2L8cS08mYkM1eToLCat+TBqfbDaE+VGWA9H940FoIw+QVh9Rpc3qIznVxfmDH5NCU+1Q
         6wSw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Yf0iyaTtEjN94t9Xnr04VOzXHw8g+S10m9L06HXYECUA5XI6e/M05NrpSqaf+/318BSfxcc5EkdN/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZTDowbMj+JTUgCV0M4wq/J5UKajHKhHJjy1w3108CbjTciGW7
	qHZrsu3/CZJN5z502j+YgaX1kZRXDy5bEid5fVMHK1whM0FZniHjg6xb7Zbsn5z0YxYRC0kectl
	2nSQG4HTeNIAfnaqsADg92T90gKhutritbdHV+q0EYg==
X-Gm-Gg: ASbGncsQuRAGSdEgzoNioSNwaWhH6dWdImBmjc5jF9lIVwo/pb4LbPkmxmn5oqkPP80
	xCv3DUADT/WXA829IYUEGU9d9AtAzcQeYpOpkpB4PnNN2qw+MsCkJ+KWyq7jP1YpblLmBb61Vun
	ZHgD886j5ckFbdUYIV56r2qfe2Q2bnwZyDDALonObehTY=
X-Google-Smtp-Source: AGHT+IHHOhOUj30OWDDSx+2F42g2fLc3I9bcRSXhW2UcQzuablZdDsnZ46Wc3GihsOmkn7ZczCyHo2K03K0tk80OU04=
X-Received: by 2002:a05:6512:1504:10b0:551:f166:bbb with SMTP id
 2adb3069b0e04-5539c5ff09amr174150e87.13.1749592919907; Tue, 10 Jun 2025
 15:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:01:49 +0200
X-Gm-Features: AX0GCFufuH4LiWDSgWF_9h-zk6BcvJ0Do0hqFlGAZPq_9bZnp7tz4BcqtgZHIfw
Message-ID: <CACRpkdaK=Ua0=Jgnff4xXxVx9W=LcLg7RykR7CozhqtAb+8XQw@mail.gmail.com>
Subject: Re: [PATCH 02/12] gpio: mm-lantiq: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150201_771108_60371348 
X-CRM114-Status: UNSURE (   7.85  )
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgMjozM+KAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgoKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4KPiBzdHJ1Y3QgZ3Bpb19jaGlwIG5vdyBoYXMgY2Fs
bGJhY2tzIGZvciBzZXR0aW5nIGxpbmUgdmFsdWVzIHRoYXQgcmV0dXJuCj4gYW4gaW50ZWdlciwg
YWxsb3dpbmcgdG8gaW5kaWNhdGUgZmFpbHVyZXMuIENvbnZlcnQgdGhlIGRyaXZlciB0byB1c2lu
Zwo+IHRoZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
