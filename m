Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FC2C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 13:23:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA97D23DE5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 13:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA97D23DE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NDV+jWQJg0UgeHO5mPS9PdrOfcBqAv0WZsl0Lp4fOKA=; b=GuSo0OeVLrX/Pkf/ij7lf07T9
	Z+CsjPx1bwQrAgw9lHPE+ur2vzAvD8fzNnCK9VteePw0IbttIQ5grOIWeUX5IoFuxPmPgf3pJj3J+
	VMvYg0TPW6pVjRNbyESUsFwCMN7CB2Lav/c5Ge88Fm2Zb7QEQoLsGZ9Ry/L8sXseYyXZ8SdtYs/si
	TcbKLAIEd7JCnP/m2ckLr9+AgF2NCI++jCx9k0Gtv6T1TEDV/g2pJodhkxPKAEREmrHQDByvBmKxb
	jRdxk6u0mRG2eqtSqHHkEkV43cIGMy7y2H5cftQwuwhkYg1Ok+ru1msJqqiqeH83yfcTX0YlAiTTG
	Se+5rcQJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knLuN-0007zd-2y; Thu, 10 Dec 2020 13:22:59 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knLuL-0007zE-4p
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 13:22:58 +0000
Received: by mail-oi1-f195.google.com with SMTP id k2so5648116oic.13
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 05:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5YrrmDGBtPB40xWq8Xs0g2ZWc20nUchgMGGf+8yx/xg=;
 b=D2YGZNrf0XKq+xgOXLDpXLxZsyf+AtB0pNNCri73rk9/M+jwQsgt5Tzw92CETVXqt7
 cBpPhcKQUjbpMurZ4stmwVQG/q+TIzdZiWdVXTMwuKGR0GBesfHXwW+zzff5YvSVfdEI
 KqeTS73neTM61E1ZBuQ0BgixDN8KCE69UVnq98EmnAyrATkJclmMntNLvpAvk4ogELHa
 InUHn7CiqqRXECelcVsltUkzYDCF0h6LdskVWFahwv+WbfloOJTv7zqXx8PgQL0nUm69
 kbwkyYvh8KWykOSSBqZASNc6/OhrkCW+Omv2XmGi2u5CVtt4nwjl54G8AwnlCWY+jAhp
 7doQ==
X-Gm-Message-State: AOAM532KcIW6ywQeTPvyLtSQTGY2zgxeVzIMHNLdb/S/vFdzdfClqsDN
 GZq/rDhCchrBtQ/NJUPp9NPHipjy49QsVDJdnbU=
X-Google-Smtp-Source: ABdhPJyqGfuC/drmAWDcS+9KsCPX7gcqJAznxiSfiFBUXqkMzi0Y9Mgi8ZYjpvm4VhAa0RHtEVcG55I8rIitOVjYj3s=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr5296436oia.148.1607606574747; 
 Thu, 10 Dec 2020 05:22:54 -0800 (PST)
MIME-Version: 1.0
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
 <CAMuHMdVbU2kjKU3EVN5kszPc=VQcgzYLemV6AOyg+YyZBfc31Q@mail.gmail.com>
 <5389e421f884c43ff6a806ac4ec95b43a93d02f7.camel@wdc.com>
In-Reply-To: <5389e421f884c43ff6a806ac4ec95b43a93d02f7.camel@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Dec 2020 14:22:43 +0100
Message-ID: <CAMuHMdVnR2E6+ANYuZLvsTW8Od4Sa=wDtjnio4h3z=W2ePPGGw@mail.gmail.com>
Subject: Re: [PATCH v7 00/22] RISC-V Kendryte K210 support improvements
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_082257_197979_ED0100C9 
X-CRM114-Status: GOOD (  21.30  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "seanga2@gmail.com" <seanga2@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Thu, Dec 10, 2020 at 1:36 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On Thu, 2020-12-10 at 11:04 +0100, Geert Uytterhoeven wrote:
> > On Thu, Dec 10, 2020 at 4:41 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> > > Changes from v6:
> > > * Annotate struct platform_driver variables with __refdata to avoid
> > >   section mismatch compilation errors
> >
> > Blindly following the advice from kernel test robot <lkp@intel.com> is
> > not always a good idea:
> >
> >     The variable k210_rst_driver references
> >     the function __init set_reset_devices()
> >     If the reference is valid then annotate the
> >     variable with or __refdata (see linux/init.h) or name the variable:
> >
> > If your driver's probe function is annotated with __init, you cannot
> > have a pointer to it in the driver structure, as any binding done after
> > the freeing of initmem will cause a crash.  Adding the __refdata merely
> > suppresses the warning, and won't avoid the crash.
>
> Hmm... I must be misunderstanding something here. free_initmem() is called from
> kernel_init() right before starting the user init process. That is late enough
> that all drivers are already probed and initialized. At least that is what I
> thought, especially considering that none of the k210 drivers can be modules
> and are all builtin. What am I missing here ?

For these specific cases, binding is indeed unlikely to happen after
free_initmem(). In the generic case that is not true.
However, you can still trigger it manually by unbinding and rebinding
the device manually through sysfs.

> So I think I will go with option 2. It is simpler and safer. We can always
> revisit and optimize later. I would prefer this series to land first :)

Right. Correctness first, performance later.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
