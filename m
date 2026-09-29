Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3FFCA5FAC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 18:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XO66KguBe+inUX4E9juf+UNTKu5IQoCAyDz93H84TQk=; b=Yt1G6j7SjWDLsc
	UpbAty9CfCuFSLM+zFtRwMkt9g/PZZbBRAHgPNOQCopjoPm8kYC4plipv6HT3Bf0iSRWIlS1Jfzvr
	XowzDZVdhnNQ8HXVJ810mFei5M57kRPhAKddrAdz1w713tZqzXjacBdxS3XhADzjxIrZdyV6W3o/C
	mV+y7wR/svQjD9z+LMyhIbqvZrfzYGfXMa1Zv5bW/aGXowQfMwrHMaKJTju9Nm2XT7Z7uAjwLXVnP
	SQgm6+/6pO+EE+ElahuDteDq7VjW2cBtNzfg6bETpdDusGOD4mLwXGX9SUKyUYTn2DU5dvT7tvhMQ
	BjKJ9vcwhLuw54TUZ2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcAw-00000004FMQ-45CX;
	Tue, 29 Sep 2026 18:03:34 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcAt-00000004FLy-3JbS
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 18:03:33 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso12775295e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 11:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790705010; x=1791309810; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0us02vORB4Jz7dlERRWOJMbBxMt7gj0S+kDlcLt7Is=;
        b=ThgWrIvTDXsdeX5fHPfUmdLcaAVW+WIpJQTzCip7m5sl3T90xkoE/RwP4W27/lQ/z2
         8/GebJM9ijMwBFZzMIocuUFb3MBEYqEvlY8RWlPpIr+YtQmX8pejqLeh06AAvGEXu1eI
         Sxd5fNTI/NKcwfmtKeFDvoATbUhcL0VHpKGmRW7CMvA4ZPiapJtEM0k5JxxIlXlL1QtB
         SNnqELsyJve0Qfyr3HdeEMiHsvNPy0muaBlw8gm9yEYJpFy6UeVXAhXoBSVgjvLZQK9H
         FS5uBxt/P3YdPkIOIeTMpP7nICFfK1I1to+oiepsLo35GXhh7KyAwWoT/hSfWWqKAmLg
         nabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790705010; x=1791309810;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t0us02vORB4Jz7dlERRWOJMbBxMt7gj0S+kDlcLt7Is=;
        b=MvRtcfSJtmKVzPQIq6PamxCbKy2wFYNThCXe3vHrZe7MTgtoXmLQ9E5attzl2wZ2Ae
         vMYJnRubEpHIhSFyB6Cm4mAGeFChgpeNVoI31ks9ugz4qp8EQRq3mpuqrGbNsFwGP5Ro
         FituOL81hvpMCkWqKIb0L6eH7DumbhYsuGlq03wG8JA77lxnCaYcTeHBW9Mdmh6j6JQc
         nH8OhO5lZQsDgyOYUhm2gNazRqrO15JiOUsKQuvE1YgLAwvxQ0k/ZWCjTanY+4JdveLj
         Aj6fI4icKeG8dfa8pmd0cN1D4bhbpMiusG/uwYJ7q/AUNSINy259M11p/8+W4FofUFLc
         6GXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxARHk9iUBCaEaFl+kS8PROyo6hUEvyjBdDXppqVatkuj20NsNudn0CZi5IIMJjoahGsf8FTlGvaGqw+g==@lists.infradead.org
X-Gm-Message-State: AFuF++nzbOV86zc3HZvRmYxHvQSiqi1wyG98UUYU7lq1nDQUfax7kmQG
	dRX+wGtcs8U/j8rNnjcAngZdi4o5/PR3ytH/jOynr96RSIjSdMV8EPsQjZhqMnb1aQo=
X-Gm-Gg: AYBFou15jEYAi+v+nFWq5HGs4IjRqzf8MxYOWdueGx3MD1P32gia9OqIOMnWGWAHs4Q
	PP1KHIjtIIAU0Qrq1/cwW2GGCh+zfRyZSddH6kCeizxS1V6NABmQuH3yCLwbQQcdLSFQIaVmr6O
	wgIaQEfw0AshbOxoCwapxW79zwa2v4X+Jse6Fnl1qQa9+WcFN/9Db7fxSuwFLKHLJ45N7G1sr5q
	qAtGzIGhJU80vyIhvsksSx4btn58O+j5vULgDLqBJNGlEc6/j+KP3MccupFfdxptVw/tynoNlYx
	hHl5s84EPRiuL2aTI5mrR/pejGwEsYodAqHdLLewQs0v6W/0+PQ5519Ci64T1H5tCYuLQw9hd0y
	UB7tOHsgBd91k1MLzAn9IPb0PSIplR0VaBgA2UOWnhNZPCBtPRdn4D2uFI8chCZr6q0dpV1ITYW
	Y0U7FXis5Rykh7QqElEByW/Nkzu4wL3byq8NQMMd4JqdVbZXa7qeZi6wzMBxvLrf0XLqLEc2oyo
	VQrrj7uCP0h2Fb30g==
X-Received: by 2002:a05:600c:8b86:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-49fe6701ed1mr295156035e9.34.1790705009663;
        Tue, 29 Sep 2026 11:03:29 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0148b0590sm5696925e9.2.2026.09.29.11.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:03:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Junhui Liu
 <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v5 1/6] clk: correct clk_div_mask() return value for
 width == 32
In-Reply-To: <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
 <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
Date: Tue, 29 Sep 2026 20:03:28 +0200
Message-ID: <1j7bk43pfz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_110331_910245_944F0741 
X-CRM114-Status: GOOD (  10.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On jeu. 14 mai 2026 at 17:27, Junhui Liu <junhui.liu@pigmoral.tech> wrote:

> The macro clk_div_mask() currently wraps to zero when width is 32 due to
> 1 << 32 being undefined behavior. This leads to incorrect mask generation
> and prevents correct retrieval of register field values for 32-bit-wide
> dividers.
>
> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
> on a 32-bit val entry in their div_table to match a div, so providing a
> full 32-bit mask is necessary.
>
> Fix this by using the standard GENMASK() macro. This safely resolves the
> undefined behavior on both 32-bit and 64-bit architectures, while also
> benefiting from the built-in compile-time type and bounds checking
> provided by the GENMASK() macro.
>
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
