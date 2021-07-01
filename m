Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7A7C11F6A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 02:25:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C5B61582
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 02:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10C5B61582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AChYlHFvp6P9Zt5G5sc0gypnwztQ1nZhZkgt5163X+g=; b=MR372bYXhkOxkh
	n0dv7fK4V18l7iNz1d/caDm1+ZPEyYiKIUSKamz6LW0Jm5Q85mbOuiBt+jEUANRmsO8UrJpwijKBC
	ziWoRexquVOchxLxO68qhe+S7G9jo6icPPdAUCWZkXtqP3eMU0nuUW99HTrmDSJaZc17UqCCmkO/C
	W6TJur5DRDZUrCOmmfiBcUXogWsTTA+oa8CuyrlB016MWPlmH10TBMTguU/voFbcWxre71anSBVDT
	NOo1P1AR+3YmCYiy9apvD+sFe10D8xCGnzqdE+4Ho/Z4EDt56uKlNiuXj2KT8qoRBDTopkaYqobvw
	hCZ8NiM5mHV9oUNjA5wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lymOO-00FtWv-9E; Thu, 01 Jul 2021 02:25:28 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lymOL-00FtWL-VN
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 02:25:27 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id g19so8317527ybe.11
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 19:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EZ5joYeT1vWGOdC639vm4xzdrB9GYQUWOsxh2Cw62fs=;
 b=BkB0e4A4lqcB9HHNA2CIuOXjjNW9v8VDOmenRqaJ781r8n/0x+dsT0IBYHzX3rQweN
 BISCfVoYeGNeT0Y/7Amc1ZmdM13+MLVVny00hy8YUXVvf7njRGBYJeIlS3kJebNG9/DS
 dQLrtToWKbw0tikxx+0n9EZ3a5ePESjLiPPUsKLTpObgT+t/+C3uqepOCYfSdJ8ZI8a6
 Zg3jWh+72spwkqxwgS6IfiYRiuvY1A2Lf0u/xNrvu60BnWfuxylNrUvAuvmyDhfl7wYT
 A611/g308s2p7vtfQG+FOLghXJzgMTSg4u/pl5ZSvR/F4aoKqIsFQP7yAopDZOrHbZm9
 E9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EZ5joYeT1vWGOdC639vm4xzdrB9GYQUWOsxh2Cw62fs=;
 b=DFdDr50Ei8ElW3fk9cCx/fz8TnCnc3su6SpOAN6C8f6sHQDlXNvSlHmCQSWdRJ3Vhy
 5geOaMhlsavJv92DNlokvxWief6O3yKtHlqgN/iR/sPzAPD0bXHuOqEi9SOTuPJztUFH
 KlGiS9QuG6NSuV7IR/eYFI0GcCszXE3nXdMgI4LL8Oq77IiB6V8MVJat/ZXhHbCCiYBd
 RByolaBnD0MKtnFCs2RuwQCWTyUiRJZ7tuvmgPw1UeNQYbCLOArwLH/7DAd2ElaEq+bb
 LtFVZohDMMHsu29Eu3zhP9smCf/LMPt20D7IH0pjo0sTmKiBqSYofGa+BPyO+oUwpWk4
 fIpA==
X-Gm-Message-State: AOAM531mYlxRw4hT2T16iuZvc/IXZ8LeCLl3q49kPxmi9CF13mHZqOqx
 5TnwUBOh6VS8sKjPKMay2wfeLaypWah97nWmtyE=
X-Google-Smtp-Source: ABdhPJxpBls7pzAWN/Mwft/OqHg/7WX7iWrNpIvnEjCOGwEJubVbMovb1/Y4YrI++b13jH9vqJQvtaCGu7A4SMdBtkQ=
X-Received: by 2002:a25:6c04:: with SMTP id h4mr50224689ybc.122.1625106324052; 
 Wed, 30 Jun 2021 19:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
In-Reply-To: <20210701002037.912625-3-drew@beagleboard.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 1 Jul 2021 10:25:12 +0800
Message-ID: <CAEUhbmXuxSePo22y_keGsqPWyCSAoUdTQPqCRJmYXS7rT4DhZA@mail.gmail.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
To: Drew Fustini <drew@beagleboard.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Fu Wei <tekkamanninja@gmail.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_192526_050748_C7952A93 
X-CRM114-Status: GOOD (  14.28  )
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

On Thu, Jul 1, 2021 at 8:23 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> BeagleV Starlight JH7100 board [2].
>
> [1] https://github.com/starfive-tech/beaglev_doc/
> [2] https://github.com/beagleboard/beaglev-starlight
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  MAINTAINERS                         |   8 +
>  drivers/gpio/Kconfig                |   8 +
>  drivers/gpio/Makefile               |   1 +
>  drivers/gpio/gpio-starfive-jh7100.c | 425 ++++++++++++++++++++++++++++
>  4 files changed, 442 insertions(+)
>  create mode 100644 drivers/gpio/gpio-starfive-jh7100.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bc0ceef87b73..04fccc2ceffa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17423,6 +17423,14 @@ S:     Supported
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>  F:     drivers/staging/
>
> +SIFVE JH7100 SOC GPIO DRIVER

typo of SIFIVE, but it should be STARFIVE

> +M:     Drew Fustini <drew@beagleboard.org>
> +M:     Huan Feng <huan.feng@starfivetech.com>
> +L:     linux-riscv@lists.infradead.org
> +L:     linux-gpio@vger.kernel.org
> +F:     Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
> +F:     drivers/gpio/gpio-starfive-jh7100.c
> +

[snip]

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
