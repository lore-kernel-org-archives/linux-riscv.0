Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C82C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 06:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52iNrrI/z67vz5aAxGCEePgtDbrAaKsd8Ri/lTPIPC0=; b=j+5jVGozZrNVve
	TzmrnO5KLw7gTqzORyhCRZTrzv315bGEur9P12EO3s20W9BHvGdjTjH2RskSlcQT4A6czNChVXp0G
	DDyNpMnZANi4Mx6j+mRiSFekKmSc/rm/akkGF47ieg+hWlo5/SV6LRi16tkYVlToAh/X3OGWKC+Ss
	KXHt+JSmdfK2d42pN8DPpUQ7bf2NODdqnwQu/cS9PCurbLdzqVfLywb8PqgvwDGr+z7CA+jgdU/DB
	N56jZ+exIhLEj9yrwC/d8qLWL46w65R8zMcFKbsqGaLc0tq64Hf6yfuMO1d2uBePYDuUH4Q7jQhwh
	+2pBgs7xDf30VCHHIC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaszX-009DIy-4n; Wed, 21 Sep 2022 06:13:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaszR-009DHG-FK
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 06:13:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1DEE62F29
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 06:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D160C4347C
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 06:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663740824;
	bh=w3qEuPEMK42CM+j8IWHYWqhiE1xDCn4992EpvD8JZYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g3rOtcdSxXPlKYNEoxqrdKk6KuhJTBTPnK45f9q9UUSwra/VhAMykg42NI1mKaSvJ
	 8RAe60HX5+L/oX8wxsc8QTT3U8Vsvz06WXJVyp/Im1bVVuEsYR3ayPqCKsGdCGBpP2
	 6zEMih1oX7JdT9tyu587G8m3NSTT4IEE0EsauJudHlOQbv4i6+hqB1LHqG4FP4qZb3
	 dV5y/nDh4xfGp3PLYijEDHbYrQPhioKBeTJUQ6G60qTAYQyy6cSR2l9pi/EsKC+N6I
	 aG/XRDfALXrjwXTQGY7HH3tt0hgp6b90PaqFBF90DGcRqS8OZflbBmSR+sjON785Eq
	 RDNRN+TyqJsNw==
Received: by mail-oi1-f182.google.com with SMTP id d64so3767231oia.9
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 23:13:44 -0700 (PDT)
X-Gm-Message-State: ACrzQf0SkJVmaZ25H0dt8ybHswRc/bKTu+qMfrlbSmzHMaZNg2MvDC//
	v6QekHhprd8KNvUexXcEoEXQD3dONsTjiVrT7NM=
X-Google-Smtp-Source: AMsMyM5q2IJn/8Vtp+x/+Cdu+aYFrFtl/v1b04akIxkpyjyvBd8H1TM4s7Rvi1PoBc+lSa31XLS6/X4u2yjvlCRUdvc=
X-Received: by 2002:a05:6808:201f:b0:34f:9fdf:dbbf with SMTP id
 q31-20020a056808201f00b0034f9fdfdbbfmr3112979oiw.19.1663740823509; Tue, 20
 Sep 2022 23:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220908022506.1275799-1-guoren@kernel.org> <20220908022506.1275799-9-guoren@kernel.org>
 <4babce64-e96d-454c-aa35-243b3f2dc315@www.fastmail.com> <CAJF2gTQAMCjNyqrSOvqDAKR5Z-PZiTVxmoK9cvNAVQs+k2fZBg@mail.gmail.com>
 <8817af55-de0d-4e8f-a41b-25d01d5fa968@www.fastmail.com> <CAJF2gTRoKfJ25brnA=_CqNw9DPt8XKhcyNzmCbD6wX1q-jiR1w@mail.gmail.com>
 <CAJF2gTRVH6pVqBn+n+wbccBcMWraRP3m4CbXz4g_y+=nPEU=Yw@mail.gmail.com> <7a2379cf-c1cf-46af-9172-334d2b9b88d5@www.fastmail.com>
In-Reply-To: <7a2379cf-c1cf-46af-9172-334d2b9b88d5@www.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 21 Sep 2022 14:13:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSvaNh_m_hrub5Z=kqLAYJfRbpYzB1Mc5aOgdN+Bm8bag@mail.gmail.com>
Message-ID: <CAJF2gTSvaNh_m_hrub5Z=kqLAYJfRbpYzB1Mc5aOgdN+Bm8bag@mail.gmail.com>
Subject: Re: [PATCH V4 8/8] riscv: Add config of thread stack size
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Jisheng Zhang <jszhang@kernel.org>, lazyparser@gmail.com, falcon@tinylab.org, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_231345_626359_F30E91EF 
X-CRM114-Status: GOOD (  19.65  )
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

On Tue, Sep 20, 2022 at 3:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Sep 20, 2022, at 2:46 AM, Guo Ren wrote:
>
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index dfe600f3526c..8def456f328c 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -442,6 +442,16 @@ config IRQ_STACKS
> >           Add independent irq & softirq stacks for percpu to prevent
> > kernel stack
> >           overflows. We may save some memory footprint by disabling IRQ_STACKS.
> >
> > +config THREAD_SIZE
> > +       int "Kernel stack size (in bytes)" if EXPERT
> > +       range 4096 65536
> > +       default 8192 if 32BIT && !KASAN
> > +       default 32768 if 64BIT && KASAN
> > +       default 16384
> > +       help
> > +         Specify the Pages of thread stack size (from 4KB to 64KB), which also
> > +         affects irq stack size, which is equal to thread stack size.
>
> I still think this should be guarded in a way that prevents
> setting the stack to smaller than default values unless VMAP_STACK
> is set as well.
Current VMAP_STACK would double THREAD_SIZE. Let me see how to reduce
the VMAP_STACK.

>
>     Arnd



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
