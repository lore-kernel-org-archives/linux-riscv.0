Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4E7C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 14:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgJ+/VTRpX0ScZeC5DVduRiuVWdIt6KGCOQr8I/LzUc=; b=sq2AT9/56CszBG
	rKMV8CQFxjo4rkGDsOrmH64wC2a3wob5eNdfNdtVdQTgxE2VZ0Pyvn4zPYemqspjUdSw/samyDNeC
	BIeUhqkdgUfyVTGHvQX8qU74JCnpBeuXINvQsDx8kkeiV5Mx83EZSmaKdKksSC+CKPTVC2b+3uCb4
	ZgHb9Aju6SE4+NyOKKUrx2Htz85CN5b/jAQSJWkCZEEg5bE/4yPKAVsbO6ap6KpRUoEBkaXSi97b4
	ylAHm3kYfPUp9SByViB+lHTl/KRLB8i/k1Kd3H4xFJ18NPzYWwEeOeq80fiBVjG5QHlNBYKb5vmHF
	jFt6djv49cEvwrGQVbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGve-00AMRt-5c; Thu, 09 Mar 2023 14:07:34 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGuh-00ALyj-NK
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 14:06:39 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B206041B6A
	for <linux-riscv@lists.infradead.org>; Thu,  9 Mar 2023 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678370791;
	bh=TgMelgrb/VLkpH6kwv9lPEQ4dt1XAT9+KiTGTm5i5/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=oQhP4d/aTVjemMxUqdUrZOJZaRjhSaQnjzPDlMeQLa4AvSW4p+aJUw0UGLR6gZXag
	 DomxUjSGcdITRYb6bch48hcl8fa7mUrrV38NxI1n6Y1zCMsNRBRSFIbmcxeaeiBRQ0
	 D9XboMbizS9EudQFJ3w8/KwlsLayKFOuk0pVBmhdmFqr9VQhOsyv7ogV8KXH8uLXFN
	 ihlIhlqWqEZFpeijNoBG0yben8VjJ7A1dW09Mchf/RheZTdnbSkQucBbLLl/m1N1xM
	 /g9xOhnzKYhgAmHi2m2jbawIpQwobtJYU/F7EN//kOqs483pzgANWUjZF1mbprA6WJ
	 spvlFmHliqiAQ==
Received: by mail-qk1-f198.google.com with SMTP id b22-20020ae9eb16000000b007427f9339c0so1208886qkg.17
        for <linux-riscv@lists.infradead.org>; Thu, 09 Mar 2023 06:06:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678370790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgMelgrb/VLkpH6kwv9lPEQ4dt1XAT9+KiTGTm5i5/c=;
        b=veGeQUe/VX0iv6tLmMxeXJkLl2VNJpSC4RiyGiA5oAE6cGndGSZXCmWR6MmXJ7+V0z
         RKccvLCSiDQtDYwbwi+CYXq9lEpa4nrdf1oYJ8Kd7ZzmCbzjvJfsvenhBzVRE1MGrApj
         ZnNZ8tHOQAWndmhZCZhqdCtOYKkkemvWkettAnIQVm5WxuLQsC8FoYnlicv4IxLU4IXJ
         AnCZPvpGUvRCYCDbGH3zEVxW634WBkjAFkz3EUw/SD7JdH1vcSA44grlHgZXiZMC93uN
         bLPGUKcI6dLofu2vJ3hIQLt1vi3Zek+uclO+S6qah6JwtfM39e5Jba5CwC51ebYJK2/h
         Dpag==
X-Gm-Message-State: AO0yUKVha49OaWwFDRBn6cmcTjF8MPa+9AxyqGNEKSOsIm0jSIHdi3Sy
	4+dEHBO/xqvwAsUV2nHOy7M0Q3R2ZDzXwsCkAAGgAlPHBJa9RQZQZizLOR4baWuyayfNmJDqfwN
	s+lxR+nKLnDEwB0LEGA7UB+NWgfP3XbyuK2GTvB4UCGntknz797b1KiTAWdml4g==
X-Received: by 2002:a05:620a:d4d:b0:742:83ee:f569 with SMTP id o13-20020a05620a0d4d00b0074283eef569mr4858482qkl.13.1678370789722;
        Thu, 09 Mar 2023 06:06:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+ABJAfbsKbyBYTfNj8osraItDCdyOTOpNmYDJbKIB/zNyDVGBmaDT/KnGUKXMOamd6DWcbCpCildmbTpuYCcw=
X-Received: by 2002:a05:620a:d4d:b0:742:83ee:f569 with SMTP id
 o13-20020a05620a0d4d00b0074283eef569mr4858475qkl.13.1678370789479; Thu, 09
 Mar 2023 06:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-13-hal.feng@starfivetech.com> <CAJM55Z8H4qmy_BiD0SHW-w5ifzhzokdO-QxpUUz9aeUd+htrZg@mail.gmail.com>
 <8c30220a-abef-7518-cb44-abcea91408e2@starfivetech.com> <49ab1072-98ba-f364-9b66-68658566e732@starfivetech.com>
In-Reply-To: <49ab1072-98ba-f364-9b66-68658566e732@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 9 Mar 2023 15:06:13 +0100
Message-ID: <CAJM55Z9YGjD+1haWcXEZNkHnWNRZckdBmTTykTt7QZV_LUohgQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/19] clk: starfive: Add StarFive JH7110 always-on
 clock driver
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_060636_141324_54AE4589 
X-CRM114-Status: GOOD (  25.23  )
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

 On Thu, 9 Mar 2023 at 10:44, Hal Feng <hal.feng@starfivetech.com> wrote:
> On Tue, 28 Feb 2023 10:42:35 +0800, Hal Feng wrote:
> > On Sun, 26 Feb 2023 18:34:52 +0100, Emil Renner Berthing wrote:
> >> On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wrote:
> >>> From: Emil Renner Berthing <kernel@esmil.dk>
> >>>
> >>> Add driver for the StarFive JH7110 always-on clock controller
> >>> and register an auxiliary device for always-on reset controller
> >>> which is named as "reset-aon".
> >>>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >>> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> >>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >>> ---
> >>>  drivers/clk/starfive/Kconfig                  |  11 ++
> >>>  drivers/clk/starfive/Makefile                 |   1 +
> >>>  .../clk/starfive/clk-starfive-jh7110-aon.c    | 156 ++++++++++++++++++
> >>>  3 files changed, 168 insertions(+)
> >>>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-aon.c
> >>>
> >>> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> >>> index 4640d0665d1c..2aa664f2cdee 100644
> >>> --- a/drivers/clk/starfive/Kconfig
> >>> +++ b/drivers/clk/starfive/Kconfig
> >>> @@ -31,3 +31,14 @@ config CLK_STARFIVE_JH7110_SYS
> >>>         help
> >>>           Say yes here to support the system clock controller on the
> >>>           StarFive JH7110 SoC.
> >>> +
> >>> +config CLK_STARFIVE_JH7110_AON
> >>> +       tristate "StarFive JH7110 always-on clock support"
> >>> +       depends on CLK_STARFIVE_JH7110_SYS
> >>> +       select AUXILIARY_BUS
> >>> +       select CLK_STARFIVE_JH71X0
> >>> +       select RESET_STARFIVE_JH7110
> >>> +       default CLK_STARFIVE_JH7110_SYS
> >>
> >> As far as I can tell the JH7110 boots fine without this driver and it
> >> already depends on the _SYS driver above, so please do
> >>
> >> default m if SOC_STARFIVE
> >
> > OK. Will fix it.
>
> Hi, Emil,
>
> The AON clock driver provides clocks for gmac0 which is used frequently.
> So I think it would be more convenient if we set "default y" here.

You're right that if we default y for the ethernet driver then the aon
clock/reset should also default y. Personally I don't think we should
default y for every ethernet driver that might be used on some
supported risc-v platform, but I see now that
arch/riscv/config/defconfig already contains CONFIG_MACB=y,
CONFIG_E1000E=y, CONFIG_R8169=y and CONFIG_MICROSEMI_PHY=y, so maybe
I'm wrong or just too late.

> Best regards,
> Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
