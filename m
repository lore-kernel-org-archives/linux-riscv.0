Return-Path: <SRS0=n1sQ=GK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1801CC433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 09:10:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A62FE22CF8
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 09:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A62FE22CF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Ifr6uXoB4UbJiJULEBc2g4Q/dcaD9dyFs18CEiDg/c=; b=KRSoVhn+MpT33gCJdni+E0pW4
	VKqsvtiGzrgaYhbF554M3PgwEAynz1brc0WznQ7eHf/riNBXJ4paoLHYcSkeyVv6crGZTPp3h2TMy
	VaaEcqaZsh6pziCX1RsjApNfUyD2bPMgaDbDrVXiyadUAl4zw1UgW9VniuLBQmQoWcz8nrLirPl6I
	ncC1RR16k4fiC51qFMmymJN89pAdV9tiD5DazpwAkkw/r4fLRlWihzbx3r06y+dON0jrJvXZymOT3
	cSjxt3RzpJ1SVSz2hEUE86g94BWUjyxKEfNzvMCAQ12deSsj6O846jtgK5/K8jqunSxZ5QoZmhYBv
	HiBsBT4qA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxRJJ-0006TQ-T9; Thu, 07 Jan 2021 09:10:25 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxRJE-0006RU-Kz
 for linux-riscv@lists.infradead.org; Thu, 07 Jan 2021 09:10:22 +0000
Received: by mail-lf1-x134.google.com with SMTP id 23so12896421lfg.10
 for <linux-riscv@lists.infradead.org>; Thu, 07 Jan 2021 01:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T+iZKNW1gmpT+HQqIiqmRRpQMcaG8pgogUVWa/pKYOM=;
 b=cyz7QwbTfHcC+qnorIFVkv7DnbL/oyA5L+VJJAN8XWkNMg42oKdig8X5tU4xa7X7pN
 01zspKzmEcVvu5fY2nzlSr3geA/q2812tr8Wz0sUieGMHhvg1aGrsz+m0J4b8Wmr2jr4
 Bxuqd5E5gXQb8ARkFssKYAOK0W62M412pmNUBd9NwRQD04zf23syAxjzcLmFBod8VeLt
 Wkczn2W4OJkxg0o6mQ3tRUOpKTABRCCUpHtxAiPQFjxJEJCf/WQ1QzYZHEZTgGgMtnu2
 jNC0bNdR63+2S3cfHE4fDoxHLsYIWb3l6Ja+q5Vt8aM4kBs1TbyhYMIEDY91gB4GZfH3
 2CvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T+iZKNW1gmpT+HQqIiqmRRpQMcaG8pgogUVWa/pKYOM=;
 b=MWeFXZBhUxrrfgZzRlYkMlLCyz67cDZV0dpFx/vKKW+Y9oMRM7DYt7tA4qDVj/L7fC
 1h+7/L3JZ8N0zxu2MCWSnBJznUJJJC63ELAQjj6iFJ/EbZmeLDYLHJmY1oF89itTNoLK
 Xw+qPZH7U8sY6CSNC3Nyu6K6NdnRe2KdP7ZemNulPvIX5QwZPcusmNXvBjSxA9+7368f
 zGcRP5Z2q+F9KYJaxCMYwNtFtZQCCk/0iWgnKvfZYWnyTvGdApXRrGxTMbAuRMIYamr1
 KK6sVbCuOjBMIYPksSMJF4hrWHvmG0Iec9qVDdypRb58kWACpq7WtFRGBvS1WElhO5Yl
 MFxg==
X-Gm-Message-State: AOAM533GiB5grJVDctoC0HmPHJM5Csq7Rp0481DW8Sl2uYuAeq1RbOt9
 pRc7d0zE7VRL5kC/tYgNOQXpg7Zre9XcwOL/UX7r3A==
X-Google-Smtp-Source: ABdhPJz6FNuZKYGADUxlk9Tv8Rh/lJVu/2CmZBJO3UIrMaB/edLmB9ZlsVBcuBoQ7GbjgHsRrGXCE/gOnIldpK4OwK0=
X-Received: by 2002:a19:495d:: with SMTP id l29mr3392190lfj.465.1610010618615; 
 Thu, 07 Jan 2021 01:10:18 -0800 (PST)
MIME-Version: 1.0
References: <20210104230253.2805217-1-robh@kernel.org>
In-Reply-To: <20210104230253.2805217-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Jan 2021 10:10:07 +0100
Message-ID: <CACRpkdZVC8RE-DTes+p6g-1EAHxQWpu2u+sBCX2ei32cvaCrDA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing array size constraints
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_041021_499302_5FD8457A 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb <linux-usb@vger.kernel.org>,
 linux-iio <linux-iio@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 netdev <netdev@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Marc Zyngier <maz@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 5, 2021 at 12:03 AM Rob Herring <robh@kernel.org> wrote:

> DT properties which can have multiple entries need to specify what the
> entries are and define how many entries there can be. In the case of
> only a single entry, just 'maxItems: 1' is sufficient.
>
> Add the missing entry constraints. These were found with a modified
> meta-schema. Unfortunately, there are a few cases where the size
> constraints are not defined such as common bindings, so the meta-schema
> can't be part of the normal checks.
>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Rob Herring <robh@kernel.org>

This is good. The stricter the better.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
