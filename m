Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A655C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 11:44:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF4C522DA9
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 11:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF4C522DA9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QUZTCQ54OtPyFC25wUG8sGX3ZEz182Ln/g69aOIOIIM=; b=VVHZT0Fb4RfxWV1D0cq0Bh71q
	HSUnk/OHUV8CBxNoA3CjLC1r4R2lNa/VMgXlskOygTnH4me8ZdzEWhc7B0gK8wAU+7c2ETcbThuv+
	7ZpByMFjdHqqnbhq/BMkRt4OdrDVTHV8NNJZ0buxe1IBEQ19KweQpCNW/KHEiRHwEoeCFeOejyamC
	Ej86zTPU9ChzCZCeTQRxdetpK9p2SfYdFb7jxgO2sUJdT9NvowBu2RK08j+3SCyX+2MmnyRgqoSds
	bYhUYc2m9LrtKNV9GlCIbhppMuhWKnVjpfjZ79UXeY2KIZm8wa3dP4zWRJ+Chddm5vx/eG9NDy3in
	lCDX7b8WQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Swf-0007kl-GU; Mon, 18 Jan 2021 11:43:41 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Swd-0007jS-0d
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 11:43:39 +0000
Received: by mail-pf1-x432.google.com with SMTP id m6so10048404pfm.6
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 03:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ipwUR8PxhfU+Q1ZYePZ+2uiR+ifyi9sSeLsGzpWteYI=;
 b=OHKSFORq3aPYGXkNol6QFJwUarkQu0y4jqiN55AZhYAk4QEd6YLrfzcLgHPB5tPKXC
 yeysszVwrjRPmRmSSCZ5M9PisvELHCllPwNsS5H4MQ9RedwFcXzyZHBN6jRVTdpyAVo0
 83yyJR2bTfTtyrW++Vk+fst4cxW1vBzu48YzELoTTRLnCaID56mrpGpaltyUdma8GvVI
 ndSrDGFCBdsv3Jr/PxGkEEyFfTidTBfWlX7/yT2woQMykTe0WCMGjlwj7HJqpATO3ijE
 erOZzHEWp2LJbskJMRMuRzgn5lhZ3oaJplrPwlAy2u36PHG9qWMRIxnlIeRnvHBwuXYx
 h1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ipwUR8PxhfU+Q1ZYePZ+2uiR+ifyi9sSeLsGzpWteYI=;
 b=nfMfgxcG0XkyFz29ZGGhXx0maLJDqpVzOCPdKfsX5u04wjG0IOLYLqDocPyVmGFUsV
 cQ0mPzJriwshI9UnKfXwODwI0xm3aSE/5+m+dKQlNAR20TKfFp0P8FWs7S0eDzE3MHBJ
 jsUKxjPR+zn432pvq1+XHc8JSD7HZ5aWYqFOZKgqrTi+duIIkPx1AiqEZqiyKcs5y4o3
 9Ag8nRn8gUNIM7GNktetQpV/k9BEVEO//2Njjd0yFPFODYOw/mk2LfTXAWdRRDJvksIE
 sOAmKms7SqiKPnrubm9Y+Ts939UHdVi7XoaTitcdLnwjC+gGyZWOOBvURBNzUVL8BAiM
 YGOQ==
X-Gm-Message-State: AOAM533wAUqm6cGhqy5XzUUB4aoS//+YV2bPq2JDmpy68H5E1F4kQBtA
 2TgnQtXe87qH8EX6Fl4hR9w=
X-Google-Smtp-Source: ABdhPJyRWp0u0IfEBMogxiAcjrN+/YzGe+K9aa50ZJwZvou9FRGAuFZUe70rTLST1fnFWgA9yxTTgw==
X-Received: by 2002:a63:c205:: with SMTP id b5mr25375887pgd.281.1610970215062; 
 Mon, 18 Jan 2021 03:43:35 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 s21sm15439461pga.12.2021.01.18.03.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 03:43:34 -0800 (PST)
Date: Mon, 18 Jan 2021 20:43:31 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] drivers/soc/litex: Add restart handler
Message-ID: <20210118114331.GF2002709@lianli.shorne-pla.net>
References: <20210104164500.1311091-1-geert@linux-m68k.org>
 <CAMuHMdXG_B-3y1MWh64T6LU3Gmo6UQGGWU8EbLApjDeXVLL3GQ@mail.gmail.com>
 <20210114020311.GE2002709@lianli.shorne-pla.net>
 <CAMuHMdWnrPBAh_U43C7jA8wDvyAegqCM3OP++NkkiT1Co5yjkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWnrPBAh_U43C7jA8wDvyAegqCM3OP++NkkiT1Co5yjkQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_064339_117881_C19137EE 
X-CRM114-Status: GOOD (  20.64  )
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

On Thu, Jan 14, 2021 at 02:48:49PM +0100, Geert Uytterhoeven wrote:
> Hi Stafford,
> 
> On Thu, Jan 14, 2021 at 3:03 AM Stafford Horne <shorne@gmail.com> wrote:
> > On Mon, Jan 04, 2021 at 05:49:03PM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Jan 4, 2021 at 5:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > Let the LiteX SoC Controller a register a restart handler, which resets
> > > > the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > ---
> > > > Tested with linux-on-litex-vexriscv.
> > > >
> > > > This patch is based on upstream, i.e. not on top of Gabriel Somlo's
> > > > "[PATCH v5 0/4] drivers/soc/litex: support 32-bit subregisters, 64-bit
> > > > CPUs"
> > > > (https://lore.kernel.org/lkml/20201227161320.2194830-1-gsomlo@gmail.com/)
> > >
> > > Bummer, and that's why the RESET_REG_* definitions are no longer
> > > next to the SCRATCH_REG_* definitions :-(
> >
> > If it helps I have accepted Gabriel's patches and put them onto for-next.
> >
> >   https://github.com/openrisc/linux/commits/for-next
> >
> > I am happy to take and test a patch based on that.  Or I can do the adjustments
> > to base the patch on that myself.  Let me know.
> 
> Thanks for letting me know! V3 sent.

Hi Geert,

I don't seem to see v3 anywhere.  Where did you send it and what is the subject?

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
