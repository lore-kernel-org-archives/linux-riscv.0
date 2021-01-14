Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D36C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 13:49:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E53A23A60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 13:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E53A23A60
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WbbyFmSjrKvBQM+lFUQHsEMyzO1TYjQZW17mfJ/6fso=; b=yL3Q1KYe6bh2oIJNzjgyoW3WZ
	xYHYUiHhdpfCvZUSorURo+KM3npiScVYqaEHwkSJgQFNIxRTiXCsA5DSlqJfL7avpYE1Rc/yQQhAa
	l6Ui/a+npMQG/BNm/Qsb5Prtg3xDGLav7nzuMeDaSnK+wRBH4nUbMBCCfaQarC5snGWsyfsNio6EK
	vSA+evJaXZa4bfGe8l15s+40woHvYSPPIzQkFNZ10rB4A9QpImOhtyh9Tr/lE26GUY56WM7MsEawy
	j0gDcj35nU9zM0nxbY2U+weJ+M9Yyac5E1ovXt4JWDoZgQKoeUjeiWeVWipib6IXXPMpR5Mt25Xzj
	qrkXqADHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l02zq-0003nc-1e; Thu, 14 Jan 2021 13:49:06 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l02zn-0003n7-Vb
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 13:49:04 +0000
Received: by mail-qk1-f176.google.com with SMTP id 186so7799227qkj.3
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 05:49:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zgOQR0ROatSAdWiCA9RFh4hh92+P9x5T4fMU/ADXeio=;
 b=lDtjNtr17OPzfFvawFAW4oCnYXd90zrsfqLVr5vAfNPzbaiGVqUVtBUhjhAKV08ISM
 +mlhYhbCUYO/NLQM2wX8IxDfKanXgHwMhGLL07nGnmOrJFDdQdeAE2PvPgOpAFYh/ml2
 CuTEMb1DMOIYNa+WqZdvGoLRKWrfEZnLZwJZ8axvgKBfabwPZfFw3wvFgna+uGPDOoUs
 LMwpmJJ6GMuAexwMCyC5+Wzbbsw4YtoZglTbNKzAut8M94siDhMEDJWZuSiUCrfDIgi/
 SBe5pHF+IrEKuMMbY3Yaqm4U1LWzA5QJO2RevhBZJ5CkiFw+V2If2dKE7fzVAMdfooFX
 EOYA==
X-Gm-Message-State: AOAM533KkU/0p1BUGr4ju1JAt1IWxFXfjGibciKWMakV3AxI6gB01KP/
 sVVG1IZsv5AR/4H1IFoft0lt7X8k3xrRb6HKI9o=
X-Google-Smtp-Source: ABdhPJzNRR0ADJSP8ugt+v1di48mmLOOlzIZrSX/WuzhPkSewYII3Y6I2ljXxsm6yxEZR14d+rHun6XCbBLF87TnyJ4=
X-Received: by 2002:a37:a950:: with SMTP id s77mr7219663qke.122.1610632140676; 
 Thu, 14 Jan 2021 05:49:00 -0800 (PST)
MIME-Version: 1.0
References: <20210104164500.1311091-1-geert@linux-m68k.org>
 <CAMuHMdXG_B-3y1MWh64T6LU3Gmo6UQGGWU8EbLApjDeXVLL3GQ@mail.gmail.com>
 <20210114020311.GE2002709@lianli.shorne-pla.net>
In-Reply-To: <20210114020311.GE2002709@lianli.shorne-pla.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Jan 2021 14:48:49 +0100
Message-ID: <CAMuHMdWnrPBAh_U43C7jA8wDvyAegqCM3OP++NkkiT1Co5yjkQ@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/soc/litex: Add restart handler
To: Stafford Horne <shorne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_084904_044087_376B0BC2 
X-CRM114-Status: GOOD (  18.98  )
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
Cc: Gabriel Somlo <gsomlo@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Mateusz Holenko <mholenko@antmicro.com>, Karol Gugala <kgugala@antmicro.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Stafford,

On Thu, Jan 14, 2021 at 3:03 AM Stafford Horne <shorne@gmail.com> wrote:
> On Mon, Jan 04, 2021 at 05:49:03PM +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 4, 2021 at 5:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > Let the LiteX SoC Controller a register a restart handler, which resets
> > > the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > Tested with linux-on-litex-vexriscv.
> > >
> > > This patch is based on upstream, i.e. not on top of Gabriel Somlo's
> > > "[PATCH v5 0/4] drivers/soc/litex: support 32-bit subregisters, 64-bit
> > > CPUs"
> > > (https://lore.kernel.org/lkml/20201227161320.2194830-1-gsomlo@gmail.com/)
> >
> > Bummer, and that's why the RESET_REG_* definitions are no longer
> > next to the SCRATCH_REG_* definitions :-(
>
> If it helps I have accepted Gabriel's patches and put them onto for-next.
>
>   https://github.com/openrisc/linux/commits/for-next
>
> I am happy to take and test a patch based on that.  Or I can do the adjustments
> to base the patch on that myself.  Let me know.

Thanks for letting me know! V3 sent.

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
