Return-Path: <SRS0=qf9j=BX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224D6C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 06:45:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5469205CB
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 06:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rNjZE4H7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="AkUXHOBK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5469205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1PWP2XIVZk2Y02l38KximZlOby6cGyxrIZbsRZ2XQBM=; b=rNjZE4H7nw7FNDjRH+jxOrGlN
	KvON1VqPPL76Oi+ZisMd+k225h0/uCxNEmXx0H9A5/Qu+jbc14d3ww4UjZB4ERsfLJO84V90Qc63V
	F0B9WxBymY8rRmRkj6wc4JgFVfwa7i7YlGVtCthDzDeqkWLP9EE94pNX8O1I204tsujYPJAav9zXd
	68WPaVN/rQXKUrMABX9a5PlLrwNYsTkrpaYTC5xOykQYVEHFZgUQKWCsbcB+Vzkq7dt7DqTMBS3ao
	atdSyrXq76Traxjur4IHsAMX+tDdvFJSEzsJmxqqZDX4W+Atgrku2TtHOEX8rY/ZMeU5gbuPj744A
	ZnA9Druyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k66zM-0005BD-OZ; Thu, 13 Aug 2020 06:45:24 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k66zK-00059s-AI
 for linux-riscv@lists.infradead.org; Thu, 13 Aug 2020 06:45:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id g8so3741774wmk.3
 for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2020 23:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=15/mwsQoBEuD1UnQg0WuQ5I0KeUnjP+2eB9N9GgL8EQ=;
 b=AkUXHOBKHkEJbIl8DXGc+JE/8Q+P3+MPn2+ghNpogZBAlbVu83PZnqRAjk6ld34dpo
 H398Iy2p5q7orn9oKHCWeBpd07JymChd2v8bDjaQ89t6j+H9MEXoSrG1cqpmTXim7WT8
 8Z7GGanzTaBc1OSLTocvV4QR75gsL+txbYnxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15/mwsQoBEuD1UnQg0WuQ5I0KeUnjP+2eB9N9GgL8EQ=;
 b=r18Y8jd8nk9SoKfS1VMg3RhXbI0nRzXBz4oLxlwwMC2FJp9C8LNT/tgnUfyd3mLYDv
 PUkizSoyGA8KOibtsPHeTWj3Api/kQPPX77oYmcM0Zv41p+sGNzhCH8wA1Xwtaz5Ze8g
 5PYtiSmHGvTprtAGB1B7Yk4YUM2kUmUxli1toac8E4zcXhtyKHfSNBVUGy9MHoAjyIhF
 NNSGqg2fAH+pLpXyU5bwWXxdheCtBko35KTymd3Ow607nXk8GW2hLiONHMLKwZtqXo5Q
 GDvvJ8SrZAw+Z9GzIUBqRQmpdKywbVG9kTs0OztPRXoj8DyykelxPKy0og7ho8lx+Sed
 qGeg==
X-Gm-Message-State: AOAM533tl1YhHgMIgzfADyY/SfLcaoVi3n6wgDkFF0eGgmAm1V/A1JvS
 0r8AW+ieSwt2p+4RNosSJF4vkTH3TlyEoARM/ErcbM0=
X-Google-Smtp-Source: ABdhPJxtTMvTIOuyXnTDOzi8O0hbnzjAJe/bIvZreckJCf7i0Tl/K4mmhwfObr+Wqzr7pbVb8Ow7xHg/HWrcMsHfljI=
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr2880135wmh.55.1597301120774; 
 Wed, 12 Aug 2020 23:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200813033807.19556-1-qiuwenbo@phytium.com.cn>
 <CY4PR04MB3751ECCFBE6B590E9D0850B0E7430@CY4PR04MB3751.namprd04.prod.outlook.com>
In-Reply-To: <CY4PR04MB3751ECCFBE6B590E9D0850B0E7430@CY4PR04MB3751.namprd04.prod.outlook.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 12 Aug 2020 23:45:09 -0700
Message-ID: <CAOnJCUJTR_FEmjvs+L1KV6UJNbsZKrrVr7noWHUi8gG6qoWHxA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Setup exception vector for nommu platform
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_024522_470341_E5A500FC 
X-CRM114-Status: GOOD (  19.04  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Qiu Wenbo <qiuwenbo@phytium.com.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Greentime Hu <greentime.hu@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 12, 2020 at 10:44 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> On 2020/08/13 12:40, Qiu Wenbo wrote:
> > Exception vector is missing on nommu platform and that is an issue.
> > This patch is tested in Sipeed Maix Bit Dev Board.
> >
> > Fixes: 79b1feba5455 ("RISC-V: Setup exception vector early")
> > Suggested-by: Anup Patel <anup@brainfault.org>
> > Suggested-by: Atish Patra <atishp@atishpatra.org>
> > Signed-off-by: Qiu Wenbo <qiuwenbo@phytium.com.cn>
>
> Please add a cc stable #5.8 tag. Kendryte support is in 5.8 stable.
>

That won't be necessary as the patch that broke nommu (79b1feba5455) was
part of the 1st PR sent towards 5.9-rc1.


> > ---
> >  arch/riscv/kernel/head.S | 25 +++++++++++++++++--------
> >  1 file changed, 17 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index d0c5c316e9bb..0a4e81b8dc79 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -77,16 +77,10 @@ relocate:
> >       csrw CSR_SATP, a0
> >  .align 2
> >  1:
> > -     /* Set trap vector to exception handler */
> > -     la a0, handle_exception
> > +     /* Set trap vector to spin forever to help debug */
> > +     la a0, .Lsecondary_park
> >       csrw CSR_TVEC, a0
> >
> > -     /*
> > -      * Set sup0 scratch register to 0, indicating to exception vector that
> > -      * we are presently executing in kernel.
> > -      */
> > -     csrw CSR_SCRATCH, zero
> > -
> >       /* Reload the global pointer */
> >  .option push
> >  .option norelax
> > @@ -144,9 +138,23 @@ secondary_start_common:
> >       la a0, swapper_pg_dir
> >       call relocate
> >  #endif
> > +     call setup_trap_vector
> >       tail smp_callin
> >  #endif /* CONFIG_SMP */
> >
> > +.align 2
> > +setup_trap_vector:
> > +     /* Set trap vector to exception handler */
> > +     la a0, handle_exception
> > +     csrw CSR_TVEC, a0
> > +
> > +     /*
> > +      * Set sup0 scratch register to 0, indicating to exception vector that
> > +      * we are presently executing in kernel.
> > +      */
> > +     csrw CSR_SCRATCH, zero
> > +     ret
> > +
> >  .Lsecondary_park:
> >       /* We lack SMP support or have too many harts, so park this hart */
> >       wfi
> > @@ -240,6 +248,7 @@ clear_bss_done:
> >       call relocate
> >  #endif /* CONFIG_MMU */
> >
> > +     call setup_trap_vector
> >       /* Restore C environment */
> >       la tp, init_task
> >       sw zero, TASK_TI_CPU(tp)
> >
>
>
> --
> Damien Le Moal
> Western Digital Research



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
