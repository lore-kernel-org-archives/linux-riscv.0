Return-Path: <SRS0=TXXs=E5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369C8C63798
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2020 07:17:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B9E420727
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2020 07:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xDkzQiyK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cJi+sHIc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B9E420727
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iipcwTTspw/QRgU0wyIQnelCtG4eb4c9CHy50POzZF0=; b=xDkzQiyKBjYka6O2i6fByIIcc
	VXbJvmzDR3GmLmQ3L9AAPhH2u0SXxe3ieWSjxgpjJCWpnWSqwcqdjsUAZupmW0Htge1B4nn37ukNf
	FQUWgTjBw7I3mHADlrgEy/79rMso1BjKSd4VjQr9SK/zoR9A8r3cpJecroitypHC1sIPaZJ5R5qjT
	AZvzXSk1EN69YCSDaaRdXdXU5fSFENqq6fbPCW9Mbrsr/D5hYj1u95a+GhQL7F0Md+jX/AZkoPb5H
	Ay392HjeuywDiNHcKmSD0tyNSSr/7j7nz9GLcyDyAXmvRhZ3s/mHE90pHfArEYyKef4mSGJX81KZq
	nahPmyjag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh65q-000228-7O; Mon, 23 Nov 2020 07:16:58 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh65m-00021d-Nk
 for linux-riscv@lists.infradead.org; Mon, 23 Nov 2020 07:16:56 +0000
Received: by mail-ot1-x341.google.com with SMTP id l36so15028124ota.4
 for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2020 23:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wLXgsyTqO2RarUvyH8ZTTAYF4WDtQk4zjdGgRXC7rCg=;
 b=cJi+sHIc9PIFYzVrxZIJR6TBDveCOPoJo7R9h9i35/0I1WcDW0tCvgyKeQNWpFHauV
 H1YjIY8kRymMFlnofU0cW6rqxYuTIw1VRpSCRiL36LNItAs2MfpGnwmTt+RMg5tY4XLg
 ciAXADVti0dmblXhg00sub5IbraSwBVnEfIyF7NizMX6kKjTbsv50O3SRm6+3FJx1qG6
 WnZEa7whuIHVCP2Kzz5OJuO2BLi+dEKi2ZV1CQxsmjh3viQ+bS0KKeKpey/gRXqdND+q
 mTsaphypJz0oRNOr2CqFWneCcMqa5zptoQYzGXRQvx7YTrhaCoTW5KvrTngH8glCvWSb
 pWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wLXgsyTqO2RarUvyH8ZTTAYF4WDtQk4zjdGgRXC7rCg=;
 b=RfNGKla7Kqu7848ko2V2f2qX1uLY95jTYZSC6O5vyJEiuOFMAD0QAWa0+74N9npCi0
 JfUJdiwRHhymw3ESRnc/v6rDxX77HFnLdEbK+I9dMXxi5xcyIRbStjU9PISsVg9F8pnW
 e7i6b6f3ES1grWOJ3qR0RUdW1pUTVX//17XF+5M2Gf1AIFSLREOJuUmqpLw3fIMOmx0L
 VDLnQNWZyoLTTAMDEzd+VT/Sr8PmmtV9X4fuGrB0HM2HrFLzwsqG7AszQp82/faNgFim
 T4ymNMX7HfSBY9QJnqSIDgYO4vffkK9AWUh8lI3D6udKdQcLl5JFZRfIpnUAqhaD+/7O
 2c4g==
X-Gm-Message-State: AOAM532Inwd+IJqjrqZ1S+0VGRtiFQQTDdcgafmRZJVeycut/e68aUzs
 +rR+PfFxQayDXTcAoUkKVBGpA5uKzT8UbhEX9lN1RA==
X-Google-Smtp-Source: ABdhPJzVm9yG9nWXa/SZbEw2G6kXq7rqr9EqAzpThBAB7CTo/wwfjZlLxIvi+xA2Iol2Cfd/oLqW1289GKRfVU/RQNE=
X-Received: by 2002:a9d:6f8f:: with SMTP id h15mr22425313otq.166.1606115809393; 
 Sun, 22 Nov 2020 23:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20201111100608.108842-3-zong.li@sifive.com>
 <mhng-ca3ea720-b6b1-4b6e-a58f-43fadd7f1c18@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-ca3ea720-b6b1-4b6e-a58f-43fadd7f1c18@palmerdabbelt-glaptop1>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 23 Nov 2020 15:16:39 +0800
Message-ID: <CANXhq0r+TOu_=c+KpNYFu3xzFtfmORoyDR+8mRrXwRCgpGWe8A@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] clk: sifive: Use common name for prci configuration
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_021655_071322_C728DC64 
X-CRM114-Status: GOOD (  23.29  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Pragnesh Patel <pragnesh.patel@openfive.com>, Yash Shah <yash.shah@sifive.com>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org,
 Pragnesh Patel <Pragnesh.patel@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 21, 2020 at 9:29 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 11 Nov 2020 02:06:06 PST (-0800), zong.li@sifive.com wrote:
> > Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
> > patch is prepared for fu740 support.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
> > ---
> >  arch/riscv/Kconfig.socs     | 2 +-
> >  drivers/clk/sifive/Kconfig  | 6 +++---
> >  drivers/clk/sifive/Makefile | 2 +-
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 8a55f6156661..3284d5c291be 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -5,7 +5,7 @@ config SOC_SIFIVE
> >       select SERIAL_SIFIVE if TTY
> >       select SERIAL_SIFIVE_CONSOLE if TTY
> >       select CLK_SIFIVE
> > -     select CLK_SIFIVE_FU540_PRCI
> > +     select CLK_SIFIVE_PRCI
> >       select SIFIVE_PLIC
> >       help
> >         This enables support for SiFive SoC platform hardware.
> > diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
> > index f3b4eb9cb0f5..ab48cf7e0105 100644
> > --- a/drivers/clk/sifive/Kconfig
> > +++ b/drivers/clk/sifive/Kconfig
> > @@ -8,12 +8,12 @@ menuconfig CLK_SIFIVE
> >
> >  if CLK_SIFIVE
> >
> > -config CLK_SIFIVE_FU540_PRCI
> > -     bool "PRCI driver for SiFive FU540 SoCs"
> > +config CLK_SIFIVE_PRCI
> > +     bool "PRCI driver for SiFive SoCs"
> >       select CLK_ANALOGBITS_WRPLL_CLN28HPC
> >       help
> >         Supports the Power Reset Clock interface (PRCI) IP block found in
> > -       FU540 SoCs.  If this kernel is meant to run on a SiFive FU540 SoC,
> > +       FU540 SoCs. If this kernel is meant to run on a SiFive FU540 SoC,
>
> This just removes the double-space.  Presumably in should also remove the
> "FU540", as this clock driver will now function for multiple SiFive SOCs?
>

I'd like to list the support SoCs here, so in the third patch, I list
the FU740 in the description as well. I would remove the SoC names if
it is better by using a generic term. What do you think about that?

> >         enable this driver.
> >
> >  endif
> > diff --git a/drivers/clk/sifive/Makefile b/drivers/clk/sifive/Makefile
> > index 627effe2ece1..fe3e2cb4c4d8 100644
> > --- a/drivers/clk/sifive/Makefile
> > +++ b/drivers/clk/sifive/Makefile
> > @@ -1,4 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-y += sifive-prci.o
> >
> > -obj-$(CONFIG_CLK_SIFIVE_FU540_PRCI)  += fu540-prci.o
> > +obj-$(CONFIG_CLK_SIFIVE_PRCI)        += fu540-prci.o
>
> Probably best to rename the source file as well.

I added fu740-prci.c in the third patch, these two files fu740-prci.c
and fu540-prci.c hold the soc-dependent code, and sifive-prci.c is the
core of this driver.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
