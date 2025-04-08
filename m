Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDD3C3600C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 09:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hJMK7PeDTI9cUBmJhCTk/Aoq5dLdYpGyyYPn6SgvYU=; b=TwtAVIK2zsGQ52
	UaMCD1bSuRJAc+wWakhsTtaKaQgajg1edHtcKHvwCdiFjspvDF+EjsMXMUPbs6dpxHP0XU/9Mt7q7
	StnA0tQxl0Pknlh6ffzMtM+DCJ6sk2BVNATD3PrpI/YqNemgj+wM9vgJIXNhybJ1xBWCuFicMRA+w
	9vO115OTP5thHhNkD57mAE1m5p6SJedLMMtllyW/3fjwdS40u7VprAy3k2Q87G/CbWGm0S+y7JLcL
	gLDd5CU0SN08gleukkd7pmitRYAPT9pLKf31C/GGMgFTasVwuY3eWRIska3D5FcUrYpqhFOvklpXc
	+Ve9pmKL8y6zSv7j6FGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u256N-00000003Pj8-0vsl;
	Tue, 08 Apr 2025 09:18:39 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24sO-00000003N5B-2SvV
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 09:04:13 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5499bd3084aso5019317e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744103051; x=1744707851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtKT5PB+I8jgGburlz5n6UrHfPzs2dxAk/yRT6NP0dQ=;
        b=vsNyv0XXXwRGaHUm3IjoYzwmiCbTUanWuTMJCuPSCZGUlXhVIE32dMSbELA6YTn+bf
         4thIV+UWzQoNdInc+N1DoEXsUgAzfLGIRF2cA/pWqc/8zi2M+Cd7+fj6/XeRW9dVO3IT
         Ip2wxlkDLcF2vRw3DVYGqYYDE7aFjVCkpBg2/kcTwhjvjrv9pzT4YEbNoS+giAH8nf8M
         oShLEYFLqIWbLKSgbgJu5vw+jpTbR3fNT3wKZG5A7axOG9+LqDNfmq1j6RSNzPWl6/Z8
         Y9mamcKl6HbfiW8uhuu3HRFRPdN9LEhnTtI7abNn/qm6ALWRZ7N/TjMZyXPmCJfYxL1e
         FfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103051; x=1744707851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtKT5PB+I8jgGburlz5n6UrHfPzs2dxAk/yRT6NP0dQ=;
        b=w0Q9Zz1AxfLS2yZSMw5mxZvk7RSIi18+FlatwckI5aobGisvJzpTYYXHsIFHSYyRK7
         btK6rLXWR8LALGR9/par8KsK+2U84YOWrckmuoOFOmc+Rwd5DiMh/jYMcXYBgUS7HB2D
         g8IQAJcaBP7UnXZ9jEggVSRbodhPpykLEqQNWD/M0nUWtGAwNUNOrwH1OQlk7ovZUXIE
         Q/rBE0yAkR/KNCR9mRwfLP4Ixa96K6U+d3LltvFOj5rEbxcAdRe1Gpco9atWfVNHPsO1
         /oPUjjTsvb6LHEEjvhEab91uH1RWVzJxZhdqv7fEHKVzGH9HeW5Lk8l87YqDzVjGIAD8
         fzqw==
X-Forwarded-Encrypted: i=1; AJvYcCWcdNFuAze59uk65g3QFyT0+Kn6EGivbyPrInpEtYTAq8BuJGMRVxaBnJqwNTRYhUuAjlWLq9qHbLARFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIf4O6XwmJwoZw9WGLI6+lv4iXAUF39l1Y7DHBMereBfiC2U9X
	11VvFZ/jxelzg1hmQSquISvM8zmH7MrUgdWt/unxC6ygm+W+snODfQn+JnY7bifRm+homOMIUBe
	5A2J/GezFb2Ixve5rvRvMnXaHfoiLWloG7U1eCQ==
X-Gm-Gg: ASbGnctPEslyxFfhKo9BRoTke57dVy7aT+2VXvQoi0reVZWcvvneoYuPDW56cFGTO1w
	X/0i1IjVaI25b+AcXDPWiHfaQM3gaBpTkJLLsH1JbQbzbXVN7YwMfE1Le7Rq8ykcTacCzwhtAZj
	TwfKL+kEnRLNMS+/IJUe9hajQ8712Hn4MXeE8Ljvzi1d5fnCpSZ994KGdAEA==
X-Google-Smtp-Source: AGHT+IF2WUkxm68ddIms01ocssUC4e0WNcZHFUed8nlsJd3SMfdqBt0sV6DP/H5TRFqdUI/lrkaIskfxxDirqwxdZyw=
X-Received: by 2002:a05:6512:3f16:b0:549:8c86:9bf6 with SMTP id
 2adb3069b0e04-54c227dc869mr4261598e87.39.1744103050753; Tue, 08 Apr 2025
 02:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org> <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 11:03:59 +0200
X-Gm-Features: ATxdqUGccJrFjcEWKyhVa646awyIsRz2HGjGAguvah1n6zT984GzRInZSF_52-w
Message-ID: <CAMRc=McnW0YRMmikwu6qWSdWD5Zu227dBRwd4VeWZcfcEFUMDg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_020412_629398_CDE40981 
X-CRM114-Status: UNSURE (   9.99  )
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

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMTE6MDjigK9QTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4gd3JvdGU6Cj4KPiBncGlvIGlycSB3aGljaCB1c2luZyB0aHJlZS1jZWxsIHNjaGVtZSBz
aG91bGQgYWx3YXlzIGNhbGwKPiBpbnN0YW5jZV9tYXRjaCgpIGZ1bmN0aW9uIHRvIGZpbmQgdGhl
IGNvcnJlY3QgaXJxZG9tYWluLgo+Cj4gVGhlIHNlbGVjdCgpIGZ1bmN0aW9uIHdpbGwgYmUgY2Fs
bGVkIHdpdGggIURPTUFJTl9CVVNfQU5ZLAo+IHNvIGZvciBzcGVjaWZpYyBncGlvIGlycSBkcml2
ZXIsIGl0IG5lZWQgdG8gc2V0IGJ1cyB0b2tlbgo+IGV4cGxpY2l0bHksIHNvbWV0aGluZyBsaWtl
Ogo+ICAgaXJxX2RvbWFpbl91cGRhdGVfYnVzX3Rva2VuKGdpcnEtPmRvbWFpbiwgRE9NQUlOX0JV
U19XSVJFRCk7Cj4KPiBTaWduZWQtb2ZmLWJ5OiBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4K
PiAtLS0KClRoaXMgZG9lc24ndCBhcHBseSBvbiB0b3Agb2YgbXkgZ3Bpby9mb3ItbmV4dCBicmFu
Y2guIFBsZWFzZSByZWJhc2UKeW91ciBwYXRjaCBhbmQgcmVzZW5kLiBQYXRjaCAxLzIgaXMgYWxy
ZWFkeSBvbiB0aGF0IGJyYW5jaC4KCkJhcnRvc3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
