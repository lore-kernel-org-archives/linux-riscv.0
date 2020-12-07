Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81742C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 08:44:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6B8F2151B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 08:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6B8F2151B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fQWl8ing3Uhplfzwl7VXreFqzcGp1YJGcjEfVJ6e+50=; b=pvMttCKZXbEfmWz8PDc0NLX60
	Ad8zrvnJSlJrW+xwO0Rok4av/1TACbujHxCHvBepWrEx4NUFh8lK6FQEwe5h2ibfNjvdK9eDMxnew
	xlw1kj7ejE65SU15XCFLy52e0gDoX264LN8PT+mdUHA8D+OKUrFV/iTtfQy1bJsAHlwEb/VDCkMBq
	ZooUYcFfOBrzwMKAbzhPcNRI5x0melqJmUwXncxDKuN+iCDr1E4A5P7K1qzFPE+zXBuiiTDeWpRXZ
	7Vbyg5EH3hd7qaEye+5zFofrI5fnPwP9nFk1WkSoGI68KRNlm/WRoJ+dltKAuzi1wq6lAB0ePJ65a
	O92/YNPIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmC7u-0004IP-5G; Mon, 07 Dec 2020 08:44:10 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmC7n-0004Hn-6p
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 08:44:04 +0000
Received: by mail-ot1-f68.google.com with SMTP id d8so3860555otq.6
 for <linux-riscv@lists.infradead.org>; Mon, 07 Dec 2020 00:44:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lDfLeyiGUVNCa3NdIdBr2x/jMgSf/H+Z78nqjlzXWBM=;
 b=SdBiSOzZxcXk+3j9OjLajUMvQE8DobbQw9eJceKKpqaRBywyh91C1rBEIflJ53XfDZ
 MRRS9eyeVuUBxx0AjK+Q1LyXvBc/6ZYz1Mz3/d852JXUQeJDtisJE/4+0NNW/YOFzm67
 umAuNQmmxXky33y+pOs2GY6e/p4+oadHZwJBOyj6LCTbKQY1bjLl0Vh5IngP+UtE8QnQ
 vPpDbMwlrwJNd4zpCUYVqfRLg0lr0yI05GT/q/woL2GF2Rz2RxHhjkF0icJJoa+7sElV
 lkuADrazTmfg4KS4BWbBbOGVQ9yaXPlOw4/mIRmfAOEdJphtZPiuvdA/Bx8SxpwmF/hv
 gPfg==
X-Gm-Message-State: AOAM531+HwGbdkPCZcri434h2n2inRMcs9JP8pmVcnexCBfjhEDSF/z9
 Ano/TQbDXl4pS6XjRMiSXMH4RXBwfyH9hYcwTUw=
X-Google-Smtp-Source: ABdhPJz3F618tGQ+G8xttqsIo3X7QtPrBpfqy0tddGagSvKa3lbHtQAsUEeeyRDDYw11Hf5ZojwaoyzWHaAY0bkCXD0=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr12384022oth.250.1607330640141; 
 Mon, 07 Dec 2020 00:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-12-damien.lemoal@wdc.com>
 <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
 <b5eb9c289fe58119185550bff7228501d95b730e.camel@wdc.com>
In-Reply-To: <b5eb9c289fe58119185550bff7228501d95b730e.camel@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Dec 2020 09:43:49 +0100
Message-ID: <CAMuHMdX+grQf=naU76Edvhbjap3BEayjDs_Rhkoy4FFfOZcTZw@mail.gmail.com>
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_034403_295715_27E5E635 
X-CRM114-Status: GOOD (  17.40  )
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

On Mon, Dec 7, 2020 at 4:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> I prepared a v5 series addressing your comments (and other comments).
> I will post that later today after some more tests.

Thanks, already looking at k210-sysctl-v18...

> On Fri, 2020-12-04 at 22:19 -0800, Stephen Boyd wrote:
> > > --- /dev/null
> > > +++ b/drivers/clk/clk-k210.c

> > > +       in0_clk = of_clk_get(np, 0);
> > > +       if (IS_ERR(in0_clk)) {
> > > +               pr_warn("%pOFP: in0 oscillator not found\n", np);
> > > +               hws[K210_CLK_IN0] =
> > > +                       clk_hw_register_fixed_rate(NULL, "in0", NULL,
> > > +                                                  0, K210_IN0_RATE);
> > > +       } else {
> > > +               hws[K210_CLK_IN0] = __clk_get_hw(in0_clk);
> > > +       }
> > > +       if (IS_ERR(hws[K210_CLK_IN0])) {
> > > +               pr_err("%pOFP: failed to get base oscillator\n", np);
> > > +               goto err;
> > > +       }
> > > +
> > > +       in0 = clk_hw_get_name(hws[K210_CLK_IN0]);
> > > +       aclk_parents[0] = in0;
> > > +       pll_parents[0] = in0;
> > > +       mux_parents[0] = in0;
> >
> > Can we use the new way of specifying clk parents so that we don't have
> > to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully
> > the core can handl that all instead of this driver.
>
> I removed all this by adding:
>
> clock-output-names = "in0";
>
> to the DT fixed-rate oscillator clock node (and documented that too). Doing so,
> clk_hw_get_name(), __clk_get_hw() and of_clk_get() are not needed anymore and
> the parents clock names arrays do not need run-time update.

"clock-output-names" is deprecated for clocks with a single output:
the clock name will be taken from the node name.
However, relying on a clock name like this is fragile.
Instead, your driver should use the phandle from the clocks property,
using of_clk_get_by_name() or of_clk_get().

Stephen: I'm a bit puzzled, as you suggest _not_ using of_clk_get()?

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
