Return-Path: <SRS0=IYIb=EF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AE9C55179
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 08:49:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 200E222241
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 08:49:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HLZgt2hy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyTuCSvu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 200E222241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IjtIaWBtzcKrU8sQ2X9PgN3cpfo4b6alb4keb98ePjk=; b=HLZgt2hynpAXnPZ2Bb21BrGKc
	sFYrLMKrQilDvSM95tk7GJfazdsCk/l7U4bSbgZ3CDMTVffkbo0b7HK0PI/FHf/47Pg1EYCkzYkqI
	FH+N19kbDw03LeJ0aoHSDs4/jHBNN6Hd78I6h/FMjiqRuo5rutTV5GOrfP/5LpOe4gl9saEVsaDdi
	vLBM7gBlfs2Yif3LQ85xJ0v5Ph2qoplxcO4pv73OXWnx1WIC49DstlRcq40ZyYbkGs55dYjVOsfZv
	JB2R+rjYIecbxMaFndEaaQW415FeYWxs7TJrmCQ0oWWFtRrUByWTNgBV/mSb0kdUfvZvi5V0XATZF
	TkZlInmcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYQ6C-0008R0-Cy; Fri, 30 Oct 2020 08:49:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYQ69-0008Pz-Cj
 for linux-riscv@lists.infradead.org; Fri, 30 Oct 2020 08:49:26 +0000
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7885920704;
 Fri, 30 Oct 2020 08:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604047764;
 bh=mcLTP/QKhISeWPTXAoLh2yNXnj7pzzsU5p8f1Fl3iUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kyTuCSvuHuxINxet+LAyjCko+K5bljkFPLhXMsMcDvnyWh89/s7a7aoOYzQrK/9sj
 sB0L8Wo2Zzk7lvpWgRns+G1VCiKZpfAn7DWTMcqmX1uMek+4ItmXtenbBsPcbLTnmk
 IdPKFEMqY6yS37o2pBuhaxHHa2TMf9nNa2T4xk+M=
Date: Fri, 30 Oct 2020 10:49:15 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v2 5/6] RISC-V: Protect .init.text & .init.data
Message-ID: <20201030084915.GB4319@kernel.org>
References: <20201026230254.911912-1-atish.patra@wdc.com>
 <20201026230254.911912-6-atish.patra@wdc.com>
 <20201027104545.GM1154158@kernel.org>
 <CAOnJCULsowob2sgs9qFyUDBRUcuci6e4HEMoE_JuucCX082LCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCULsowob2sgs9qFyUDBRUcuci6e4HEMoE_JuucCX082LCA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_044925_613612_C1D996E1 
X-CRM114-Status: GOOD (  32.23  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 12:21:41PM -0700, Atish Patra wrote:
> On Tue, Oct 27, 2020 at 3:46 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Mon, Oct 26, 2020 at 04:02:53PM -0700, Atish Patra wrote:
> > > Currently, .init.text & .init.data are intermixed which makes it impossible
> > > apply different permissions to them. .init.data shouldn't need exec
> > > permissions while .init.text shouldn't have write permission.
> > >
> > > Keep them in separate sections so that different permissions are applied to
> > > each section. This improves the kernel protection under
> > > CONFIG_STRICT_KERNEL_RWX. We also need to restore the permissions for the
> > > entire _init section after it is freed so that those pages can be used for
> > > other purpose.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > ---
> > >  arch/riscv/include/asm/sections.h   |  2 ++
> > >  arch/riscv/include/asm/set_memory.h |  2 ++
> > >  arch/riscv/kernel/setup.c           |  9 +++++
> > >  arch/riscv/kernel/vmlinux.lds.S     | 51 ++++++++++++++++-------------
> > >  arch/riscv/mm/init.c                |  8 ++++-
> > >  arch/riscv/mm/pageattr.c            |  6 ++++
> > >  6 files changed, 54 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> > > index 3a9971b1210f..1595c5b60cfd 100644
> > > --- a/arch/riscv/include/asm/sections.h
> > > +++ b/arch/riscv/include/asm/sections.h
> > > @@ -9,5 +9,7 @@
> > >
> > >  extern char _start[];
> > >  extern char _start_kernel[];
> > > +extern char __init_data_begin[], __init_data_end[];
> > > +extern char __init_text_begin[], __init_text_end[];
> > >
> > >  #endif /* __ASM_SECTIONS_H */
> > > diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> > > index 4cc3a4e2afd3..913429c9c1ae 100644
> > > --- a/arch/riscv/include/asm/set_memory.h
> > > +++ b/arch/riscv/include/asm/set_memory.h
> > > @@ -15,6 +15,7 @@ int set_memory_ro(unsigned long addr, int numpages);
> > >  int set_memory_rw(unsigned long addr, int numpages);
> > >  int set_memory_x(unsigned long addr, int numpages);
> > >  int set_memory_nx(unsigned long addr, int numpages);
> > > +int set_memory_default(unsigned long addr, int numpages);
> > >  void protect_kernel_text_data(void);
> > >  #else
> > >  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
> > > @@ -22,6 +23,7 @@ static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
> > >  static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
> > >  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
> > >  static inline void protect_kernel_text_data(void) {};
> > > +static inline int set_memory_default(unsigned long addr, int numpages) { return 0; }
> > >  #endif
> > >
> > >  int set_direct_map_invalid_noflush(struct page *page);
> > > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > > index b722c5bf892c..abfbdc8cfef3 100644
> > > --- a/arch/riscv/kernel/setup.c
> > > +++ b/arch/riscv/kernel/setup.c
> > > @@ -123,3 +123,12 @@ static int __init topology_init(void)
> > >       return 0;
> > >  }
> > >  subsys_initcall(topology_init);
> > > +
> > > +void free_initmem(void)
> > > +{
> > > +     unsigned long init_begin = (unsigned long)__init_begin;
> > > +     unsigned long init_end = (unsigned long)__init_end;
> > > +
> > > +     set_memory_default(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
> >
> > And what does "default" imply?
> > Maybe set_memory_rw() would better name ...
> >
> > > +     free_initmem_default(POISON_FREE_INITMEM);
> > > +}
> >
> > ...
> >
> > > diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> > > index 19fecb362d81..04f3fc16aa9c 100644
> > > --- a/arch/riscv/mm/pageattr.c
> > > +++ b/arch/riscv/mm/pageattr.c
> > > @@ -128,6 +128,12 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
> > >       return ret;
> > >  }
> > >
> > > +int set_memory_default(unsigned long addr, int numpages)
> > > +{
> > > +     return __set_memory(addr, numpages, __pgprot(_PAGE_KERNEL),
> > > +                         __pgprot(_PAGE_EXEC));
> >
> > ... because you'd need to find what _PAGE_KERNEL is, do bitwise ops and
> > than find out that default is apparently RW :)
> >
> 
> Yeah. But We have explicitly disable the EXECUTE bit as these pages were marked
> with RWX earlier. set_memory_rw makes sure that RW bits are set but
> doesn't disable
> the X bit.

Maybe set_memory_rw_nx() then?
Then there will be no ambiguity about what this function does.

Besides, having set_memory_default() and set_direct_map_default() with
different masks would be confusing :)

> > > +}
> > > +
> > >  int set_memory_ro(unsigned long addr, int numpages)
> > >  {
> > >       return __set_memory(addr, numpages, __pgprot(_PAGE_READ),
> > > --
> > > 2.25.1
> > >
> >
> > --
> > Sincerely yours,
> > Mike.
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 
> 
> -- 
> Regards,
> Atish

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
