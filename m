Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CEAC388F7
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 09:00:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCAC02076E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 09:00:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ny39nn6K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yg7i0U8I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCAC02076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nTma5kUXZIwYdgupBswfUtTlnsQjPqcTtpas0sOOpKU=; b=ny39nn6K9bQD9tmFbgEaDql/2
	pyFPfiSt8E3M/ej6jOPuxcBwH9uVwoaZRF00R6rQhBCFnvTRXB3MsKwvUMEr9Fp8o0F4L9T2PC7UY
	z8gjFHKrOb4Q1zPJ6mcCrwzwXrY0jtcPUK0wjORLKrYk9324saur2B4HJNi7RBZvU9/6BiJ2TBzIu
	F7Bus8ojPaijXhd6r845ug/wdQcYhpWuPct1K7cfa83uhuXyYHSVyS2MfUc6GFdlO/Hqgj48B1Ocn
	pATv0TRU59hy+MgeyodJEucLtorpDDjl71zWb1PlqcXEyeevT7KZ1e5a5a7pNuMVKhlSsgFXuXiS6
	1WEaDPaJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdUwj-0006qr-W8; Fri, 13 Nov 2020 09:00:42 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdUwh-0006qG-Ly
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 09:00:40 +0000
Received: by mail-ej1-x644.google.com with SMTP id y17so6600650ejh.11
 for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2020 01:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=excD4cp3O4ACeckeKCo0xXDfnsFfAYE0sjV9B/u/mho=;
 b=yg7i0U8I0QbLXjYORw9rlpXwOpm5e9gz9XZZrRF4p45pBrnpsZVb57vvYOdXWQnsE/
 qtckK2EG+JqNE/NNddiMoskNTzDmb39a7UA3db8PoMVqGqJe3PzlreMzHYQwilhjJ2eD
 UVCvGZcvLczczyfRrAAeeyad4UW06nMtze1W/kRolre/cNJy3bEv0vkSBFqF9A9gEfV8
 iz3wNZRD7jMKW74gaLDLFGr4kNjzo4fr0a4Umw8UU6n3mlHcqPJa9uR6c3IQHCYSczUK
 x/gO5wqG3zw6HUWzVEQxSHQYQeHAPUwVQLs0QtacIc1bSSq70iPQlriH+qSixA+oXbmk
 hCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=excD4cp3O4ACeckeKCo0xXDfnsFfAYE0sjV9B/u/mho=;
 b=K9DumfjDrv9uoKVjr6jedbDPqNUMuc0bb4QHC+sy/UVFodCgx+B8+7Edmb3fx4OOJw
 0mRiCQ+aFI4J/5+dRty1s4yEmkodZkRWYb4ZvgON2yY6QO8Iu5wLkzroa9/azNdEoCRI
 zSis3ljgZW2FaGb/JBdqWwm53kDekhPCnw4J/8Iz+jhaMJgS0LjE/EvO9WIjj8NugtGj
 +N0oKOyRjaGjbmAzsQBxzgSLKxc1dvk+7Lxgg8nqtkvph9YTUuSaQ8s4yMrMffzChB1s
 jNwjFtMO46jA/f6XmVeOafzFu5ha+IW5FSeGKJ10NWjDU4dh8zEW80PypDJkc9sIibHT
 0ieg==
X-Gm-Message-State: AOAM533+g7ngBqqW4bFl45zqkYbCpMbbzPApwBivkIGwmkOp6ofs4f7I
 G5+U14BsNvdu9R+LJIaiM84degoVfQmdOh105NOZtA==
X-Google-Smtp-Source: ABdhPJzLjkClTJB/MB9vkSlquLDXsB1sQDBPgaHx9ehM6qKyouTSRmGGqwJfA19Yb5DirukswltpZ+iD+NjKGC8Oi8s=
X-Received: by 2002:a17:907:420d:: with SMTP id
 oh21mr966361ejb.429.1605258038318; 
 Fri, 13 Nov 2020 01:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20201113023355.43406-1-greentime.hu@sifive.com>
In-Reply-To: <20201113023355.43406-1-greentime.hu@sifive.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 13 Nov 2020 10:00:27 +0100
Message-ID: <CAMpxmJVZ8OHnGrkC_5TZdZUg004p1=90KqOxpOTgi4036BGWfQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sifive: To get gpio irq offset from device tree
 data
To: Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_040039_864574_924A2A84 
X-CRM114-Status: GOOD (  10.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Yash Shah <yash.shah@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 13, 2020 at 3:34 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> We can get hwirq number of the gpio by its irq_data->hwirq so that we don't
> need to add more macros for different platforms. This patch is tested in
> SiFive Unleashed board and SiFive Unmatched board.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---

Please list the changes between versions of patches. What has changed since v2?

Bartosz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
