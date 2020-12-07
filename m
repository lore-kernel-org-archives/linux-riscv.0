Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684D0C4361B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 10:06:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1C852311B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 10:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1C852311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vk6A3S8dXM6yXgxkTbepgHt5eVOL3pV4YJ64q2APHwA=; b=zwryE6RVKVyOCJHgXEAykG/z+
	4uANNIKY+rZWPnLMZJpHHdPiX88Bz+ixJaZimFxLgTLK0GzflFxftD21mB0pSk7Gls7I7+WEOkK2L
	gc+8LDCBFHapsknmzhZSd9J2gBJaiEC/nSwO/oOGQ/bI47MP+GVwOvJQsAlfEr6iL9UAfhW17PXtq
	07+LW4OGHgt35fqp2YVvikx0OqU2FrIs5IhncI0Lf9bNMPezTGStbQIyTP5WhbLU6NZuWygfOeCCD
	jOSDig4klVr2BSHPgqJNSYYg5R5Xnd7WhlRu6QB+3frRQV8KPqelw9tWhHnAFhTNuDYNip6nUWoKC
	Lw0/MZvlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmDPR-0003rp-V5; Mon, 07 Dec 2020 10:06:22 +0000
Received: from mail-oo1-f66.google.com ([209.85.161.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmDPP-0003r2-67
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 10:06:20 +0000
Received: by mail-oo1-f66.google.com with SMTP id t23so3060300oov.4
 for <linux-riscv@lists.infradead.org>; Mon, 07 Dec 2020 02:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3o65lWvKXLx22mP9fGZFAjPDNpAakTg+X2w8WmirPtY=;
 b=SieMdf9N6JR1UQcnCKKQqEUo5bLPmhVm2e0P3Kyp3kTedpt34soak1Y1rvXxSio00C
 3c/GefZRj3yIcWLIC12SfijszYUQKZlQD2bmpX5KudSN5lv3HOW0/f2Z9Qi69acuCmmT
 3euBK9VXYvUUihnVbSu+rr/tCe/MmEOxhbzXibu1PCSZ1SYiR+ftfmuPGQvh/XILHPG7
 Lmcn2ou202o8opGW7SEjWKlgYG8b7rXANw88YqqyLwEaRGN20KvNRcXwqghD55hCK7tL
 NPbs8gXC10XMkz/7p/QF2UEjKUYSlg7XTyj84q4lFku87hHtn6VpoViTpD6F2Tnssopc
 H9pA==
X-Gm-Message-State: AOAM532oJN1/fyfCfwUyS+tlAPxHI4jc5GT7jAIlKNHtv7IolDrDPuKh
 0YidxXSaXbtUs25yfCajKtF57koAaURFUIUL/EQ=
X-Google-Smtp-Source: ABdhPJzTKqcJrThdz/nA6gncybgfM+58Ofe6twXGdz2kRPvH7jqE61lPq8SXKeJwWBaKvSLIyqks6NxqnPlklBKvvH0=
X-Received: by 2002:a4a:abc9:: with SMTP id o9mr12287505oon.1.1607335577695;
 Mon, 07 Dec 2020 02:06:17 -0800 (PST)
MIME-Version: 1.0
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-12-damien.lemoal@wdc.com>
 <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
 <b5eb9c289fe58119185550bff7228501d95b730e.camel@wdc.com>
 <CAMuHMdX+grQf=naU76Edvhbjap3BEayjDs_Rhkoy4FFfOZcTZw@mail.gmail.com>
 <CH2PR04MB652207D253E79755D87F55DAE7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
In-Reply-To: <CH2PR04MB652207D253E79755D87F55DAE7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Dec 2020 11:06:06 +0100
Message-ID: <CAMuHMdUVfaWSY1Ohn-_VtOzG1VeQrDCfhHTtkahXy8HsGOTS1Q@mail.gmail.com>
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_050619_269008_B8FA4283 
X-CRM114-Status: GOOD (  24.96  )
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

On Mon, Dec 7, 2020 at 10:55 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2020/12/07 17:44, Geert Uytterhoeven wrote:
> > On Mon, Dec 7, 2020 at 4:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> >> I prepared a v5 series addressing your comments (and other comments).
> >> I will post that later today after some more tests.
> >
> > Thanks, already looking at k210-sysctl-v18...
> >
> >> On Fri, 2020-12-04 at 22:19 -0800, Stephen Boyd wrote:
> >>>> --- /dev/null
> >>>> +++ b/drivers/clk/clk-k210.c
> >
> >>>> +       in0_clk = of_clk_get(np, 0);
> >>>> +       if (IS_ERR(in0_clk)) {
> >>>> +               pr_warn("%pOFP: in0 oscillator not found\n", np);
> >>>> +               hws[K210_CLK_IN0] =
> >>>> +                       clk_hw_register_fixed_rate(NULL, "in0", NULL,
> >>>> +                                                  0, K210_IN0_RATE);
> >>>> +       } else {
> >>>> +               hws[K210_CLK_IN0] = __clk_get_hw(in0_clk);
> >>>> +       }
> >>>> +       if (IS_ERR(hws[K210_CLK_IN0])) {
> >>>> +               pr_err("%pOFP: failed to get base oscillator\n", np);
> >>>> +               goto err;
> >>>> +       }
> >>>> +
> >>>> +       in0 = clk_hw_get_name(hws[K210_CLK_IN0]);
> >>>> +       aclk_parents[0] = in0;
> >>>> +       pll_parents[0] = in0;
> >>>> +       mux_parents[0] = in0;
> >>>
> >>> Can we use the new way of specifying clk parents so that we don't have
> >>> to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully
> >>> the core can handl that all instead of this driver.
> >>
> >> I removed all this by adding:
> >>
> >> clock-output-names = "in0";
> >>
> >> to the DT fixed-rate oscillator clock node (and documented that too). Doing so,
> >> clk_hw_get_name(), __clk_get_hw() and of_clk_get() are not needed anymore and
> >> the parents clock names arrays do not need run-time update.
> >
> > "clock-output-names" is deprecated for clocks with a single output:
> > the clock name will be taken from the node name.
>
> Arg. I missed that.
>
> > However, relying on a clock name like this is fragile.
> > Instead, your driver should use the phandle from the clocks property,
> > using of_clk_get_by_name() or of_clk_get().
>
> That is what all versions before V5 used. But Stephen mentioned that the driver
> should not, if possible, use of_clk_get()/__clk_get_name(). Hence the change.
> Easy to revert back.
>
> > Stephen: I'm a bit puzzled, as you suggest _not_ using of_clk_get()?
>
> Another solution to this would be to simply remove the fixed-rate clock node
> from the DT and have the k210 clock driver unconditionally create that clock
> (that is one line !). That actually may be even more simple than the previous
> version, albeit at the cost of having the DT not being a perfect description of
> the hardware. I am fine with that though.
>
> Thoughts ?

If there's an external crystal, DT should describe it.
Does the K210 support different crystal frequencies?

Anyway, I'm very interested in what the (new) proper way of handling this
is...

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
