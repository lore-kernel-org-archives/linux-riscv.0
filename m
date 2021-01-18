Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C589C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 12:28:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 082E82225C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 12:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 082E82225C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=10OOtWEm0i2ZOqTnhkL8P19yT0Yq5H+TqBwo2ms9cHE=; b=BnAHTpv53vyWpC/auK1Etd8XU
	dSJ6eoMdtZJepUtZdLYK/Gfcp90K1eegA+tga1wch9xsBTi1pnt9Rw+61VYxk4q85c6Bxk8xeH42b
	CYslor8cD1LxlhJ1i2MaZ1TwkexCINQgaoMJSQq1u2Eho0F4r5ebVV9bC8SgLbhJx0Y1ctXoGscd2
	3mYLH9KADAeRRQJfWrO7v9IaZtlG5LEuQV22JIyts3CgTv+VC6/XvvgXTwW3ohSB+uFNpaq6Ys72z
	wwhvN5qp+NO40na/DRBCol5t1vEy1+3VjeYy/PbSPMFQtakTNjOG+Wg2xWJpbB7p8zF4r2EKCpe+E
	MMfnfPQTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1TdM-0002dW-De; Mon, 18 Jan 2021 12:27:48 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1TdI-0002cq-Nx
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 12:27:45 +0000
Received: by mail-oi1-f172.google.com with SMTP id n186so9626865oia.5
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 04:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gaIQafbLKqUO8DmT84Dip1Hdgpm2ABLHEOu0dotUJU8=;
 b=bGRul/ylXF4jf0c7dn2G0VdLABzcIcNg1UyCokAAtCBOVjVir8l3QLL25FNC3V5ptY
 RMnRSOqAdvq+cQ6A0d75OelgcpI4+aaFNC0HcwWCOL6C0bk+MPC/fX8hK/NmDLIw9SlW
 ANFGQb7OCQrptKZnfXAtrWvtdQ5duvjF1/u11Llc1fol2yFbZEivv+kZp7hOYZCBBeJn
 T/c+E7fmmSMSCEaHSn1ugdqhZW5kh62IP4+1KboEXOw+l+Rr78fKraNEIYNzs/rIusks
 gEjNjz8ETMbnK4zf80kltUduP6Z1FtjEv87RaNQGYjK+EM0pGDTItcNRwXZGm9w2Krd1
 cp3g==
X-Gm-Message-State: AOAM532us5jogyS6nFlWCUos/xVpbQiSzShFS7Y34fRHLOw/f4zMQk/q
 tHgh90EeDcRiEH5BaBjp34VpulCkkwB2z2muvKw=
X-Google-Smtp-Source: ABdhPJz1GwiXU+qWm//9EYtjp1S5Xk44DKAOE51qMOGR9tXIV7MeqE7Ob/7JcwZKUurBwZ/zWL7Lg0u4zmzzhoyyCe0=
X-Received: by 2002:aca:31d5:: with SMTP id x204mr5249304oix.153.1610972863647; 
 Mon, 18 Jan 2021 04:27:43 -0800 (PST)
MIME-Version: 1.0
References: <20210104164500.1311091-1-geert@linux-m68k.org>
 <CAMuHMdXG_B-3y1MWh64T6LU3Gmo6UQGGWU8EbLApjDeXVLL3GQ@mail.gmail.com>
 <20210114020311.GE2002709@lianli.shorne-pla.net>
 <CAMuHMdWnrPBAh_U43C7jA8wDvyAegqCM3OP++NkkiT1Co5yjkQ@mail.gmail.com>
 <20210118114331.GF2002709@lianli.shorne-pla.net>
In-Reply-To: <20210118114331.GF2002709@lianli.shorne-pla.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Jan 2021 13:27:32 +0100
Message-ID: <CAMuHMdUxAEE2A=dyhdH5Tscin_=m_b61WfRpLvj6pJfdPjd1nA@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/soc/litex: Add restart handler
To: Stafford Horne <shorne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_072745_147739_376865BC 
X-CRM114-Status: GOOD (  21.73  )
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

On Mon, Jan 18, 2021 at 12:43 PM Stafford Horne <shorne@gmail.com> wrote:
> On Thu, Jan 14, 2021 at 02:48:49PM +0100, Geert Uytterhoeven wrote:
> > On Thu, Jan 14, 2021 at 3:03 AM Stafford Horne <shorne@gmail.com> wrote:
> > > On Mon, Jan 04, 2021 at 05:49:03PM +0100, Geert Uytterhoeven wrote:
> > > > On Mon, Jan 4, 2021 at 5:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > Let the LiteX SoC Controller a register a restart handler, which resets
> > > > > the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > ---
> > > > > Tested with linux-on-litex-vexriscv.
> > > > >
> > > > > This patch is based on upstream, i.e. not on top of Gabriel Somlo's
> > > > > "[PATCH v5 0/4] drivers/soc/litex: support 32-bit subregisters, 64-bit
> > > > > CPUs"
> > > > > (https://lore.kernel.org/lkml/20201227161320.2194830-1-gsomlo@gmail.com/)
> > > >
> > > > Bummer, and that's why the RESET_REG_* definitions are no longer
> > > > next to the SCRATCH_REG_* definitions :-(
> > >
> > > If it helps I have accepted Gabriel's patches and put them onto for-next.
> > >
> > >   https://github.com/openrisc/linux/commits/for-next
> > >
> > > I am happy to take and test a patch based on that.  Or I can do the adjustments
> > > to base the patch on that myself.  Let me know.
> >
> > Thanks for letting me know! V3 sent.
>
> Hi Geert,
>
> I don't seem to see v3 anywhere.  Where did you send it and what is the subject?

https://lore.kernel.org/linux-riscv/20210114134813.2238587-1-geert@linux-m68k.org/

So "b4 am 20210114134813.2238587-1-geert@linux-m68k.org" should give you
a copy.

Thanks!

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
