Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66A0C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 02:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYdwF2IrQsy3txsyBd2+0SU9meWpqXwdFpX05qSYaw8=; b=NwACTh+ZlOyZOM
	hm2orTyb9+EPUmyadzI2m6lAWHZCHheekRQej/vsfkl7CkJHjq6mfJMlo8KqiKz5D7xDy6YK7eWDW
	ZL2W/PpLe/jN6zohTRljZggDkUbmEm8Invbxx7QsPhfvhG2Y/C2qWOgLr/cFi0RCZUCVcZ+qZBvti
	D1bqZFk5qY8vk238QRu9pFZY+aZlQDk/ozIBFD6b+9t7eJennn7HFnDMLsBmX+FmnlhHPctK+rJyp
	pMn6Rosthljf0HSaWMq2Q+qutGPwKyTuuX0Ydwi9xGEYUnRM9SzZdHW5vW1mmf/m8zF2Zld3i5Hi/
	vMX2DgoXdeocDwZK4pIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oapHl-008Dvd-6R; Wed, 21 Sep 2022 02:16:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oapHi-008Dtj-6w
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 02:16:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 818A8B81EF6
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 02:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A407C433D6
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 02:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663726579;
	bh=EYEPB7TctVK1MJOFaPpqMASLveB5MBcqgaEPceOISKA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UPgdWs2V0JbFash3XhbsDpjDpCf8Z+AoAs0PuEfcKm6Juh03KDEYySri2S/PGE9eU
	 iZ7/w1RTQ/1sAgOTAD19Mv2MQ23tMeFKOdWszAQQGSOREm6LveUJVoHlNIj2gVG/z4
	 3+RxB6r2eRXQybzONRJgSKkmP40YrmP59SWsVVw7ARVSwBFyle2IF7G0gy/hXHlRfZ
	 AUbzomiQ7JIfN3wxg+QafHkLFamqq934ed94FkLBt3CrQ6it6jIEOmMXS74PLDoYYE
	 Ujjjvs715MFDrdBFW1GCP87ZZqF3/fzL1EUFOHuZTqjRQ+wzudViDEfh+odjCkqCqP
	 maDnu3bPmhgTA==
Received: by mail-oi1-f180.google.com with SMTP id r125so6252150oia.8
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 19:16:19 -0700 (PDT)
X-Gm-Message-State: ACrzQf0SLKH9z1K8EqR8W9VsrqgbACmKHmJ2EnyeD+DfTVJ2QTvclz6w
	q5HlAfbiMpQq4GYRnxLStok+XjFjhWUbK3UfZ0s=
X-Google-Smtp-Source: AMsMyM79uqv3q186U8l25rFsKp6OWiPSshPlAPeAcre5Lg5KA8hmj9fN2O7iIcIDbbomULyKQ8h1AaVqvre1A4I9U2c=
X-Received: by 2002:a05:6808:151f:b0:350:1b5e:2380 with SMTP id
 u31-20020a056808151f00b003501b5e2380mr2991346oiw.112.1663726578207; Tue, 20
 Sep 2022 19:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220920151202.180057-1-chenzhongjin@huawei.com>
 <20220920151202.180057-5-chenzhongjin@huawei.com> <CAJF2gTQ8QjUiRhQiM67SET=bCpppG2opcN3_ch7GEqdAkBnBUA@mail.gmail.com>
In-Reply-To: <CAJF2gTQ8QjUiRhQiM67SET=bCpppG2opcN3_ch7GEqdAkBnBUA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 21 Sep 2022 10:16:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSR5A1vxz_5SSK207SaC-3QHLcKFvcy35VtrKEk4-D9iQ@mail.gmail.com>
Message-ID: <CAJF2gTSR5A1vxz_5SSK207SaC-3QHLcKFvcy35VtrKEk4-D9iQ@mail.gmail.com>
Subject: Re: [PATCH -next 4/7] riscv: syscall: Don't clobber s0 when syscall
To: Chen Zhongjin <chenzhongjin@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, namhyung@kernel.org, jolsa@kernel.org, 
	nsaenzju@redhat.com, frederic@kernel.org, changbin.du@intel.com, 
	vincent.chen@sifive.com, ardb@kernel.org, mhiramat@kernel.org, 
	rostedt@goodmis.org, keescook@chromium.org, catalin.marinas@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_191622_537904_7E1A8DD2 
X-CRM114-Status: GOOD (  23.24  )
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

On Wed, Sep 21, 2022 at 9:30 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Sep 20, 2022 at 11:15 PM Chen Zhongjin <chenzhongjin@huawei.com> wrote:
> >
> > syscall uses s0 to load address of sys_call_table.
> >
> > Since now we uses s0 to save pt_regs for unwinding, clobber
> > s0 can make unwinder treat s0 as pt_regs address. Use s1 for
> > this job.
> This patch does not make sense. Why couldn't we use s1 for pt_regs?
Seems s0->fp can't be replaced. I take back the question.

>
> No need to modify the entry.S here.
>
> >
> > Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
> > ---
> >  arch/riscv/kernel/entry.S | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index ecb15c7430b4..a3b14a649782 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -205,33 +205,33 @@ handle_syscall:
> >  check_syscall_nr:
> >         /* Check to make sure we don't jump to a bogus syscall number. */
> >         li t0, __NR_syscalls
> > -       la s0, sys_ni_syscall
> > +       la s1, sys_ni_syscall
> >         /*
> >          * Syscall number held in a7.
> >          * If syscall number is above allowed value, redirect to ni_syscall.
> >          */
> >         bgeu a7, t0, 3f
> >  #ifdef CONFIG_COMPAT
> > -       REG_L s0, PT_STATUS(sp)
> > -       srli s0, s0, SR_UXL_SHIFT
> > -       andi s0, s0, (SR_UXL >> SR_UXL_SHIFT)
> > +       REG_L s1, PT_STATUS(sp)
> > +       srli s1, s1, SR_UXL_SHIFT
> > +       andi s1, s1, (SR_UXL >> SR_UXL_SHIFT)
> >         li t0, (SR_UXL_32 >> SR_UXL_SHIFT)
> > -       sub t0, s0, t0
> > +       sub t0, s1, t0
> >         bnez t0, 1f
> >
> >         /* Call compat_syscall */
> > -       la s0, compat_sys_call_table
> > +       la s1, compat_sys_call_table
> >         j 2f
> >  1:
> >  #endif
> >         /* Call syscall */
> > -       la s0, sys_call_table
> > +       la s1, sys_call_table
> >  2:
> >         slli t0, a7, RISCV_LGPTR
> > -       add s0, s0, t0
> > -       REG_L s0, 0(s0)
> > +       add s1, s1, t0
> > +       REG_L s1, 0(s1)
> >  3:
> > -       jalr s0
> > +       jalr s1
> >
> >  ret_from_syscall:
> >         /* Set user a0 to kernel a0 */
> > --
> > 2.17.1
> >
>
>
> --
> Best Regards
>  Guo Ren



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
