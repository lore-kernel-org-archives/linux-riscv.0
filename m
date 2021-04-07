Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E718CC43460
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 08:43:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C48561154
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 08:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C48561154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OnZvUUsPirs5OufvR5YiNe8zabCxx1oB9ZuQwn1pF+Q=; b=IADrmj29OijQ1TJliQoBPV3px
	KRunqv8pwCeUdQ2ZC0tOnqa11SpdgfFV4Yw2w/Q6DsnClLCf6JZiF5CWUsuKWfl8W5I6RqHmooR7b
	2sLTf72kkOGb2b6b67nnvHU/yj3NpSMsdvGqQbdER5yKFpWgAtul30voSCCn4H0KWLO5R3iEOI+zP
	OJFHCP128JtmKkL2/4jeCD8rqwzLayyB3APQHtOfYORm9qwFk7hZhtJvyXXI1yzfVbAHJZ0p9qDVa
	AB0NsiHxCNdOGX6EvGlWiuNjNDrtFtQZPpXeG/1ZvkepA+As2SbvZQ9RkL7AJ3RV7P5/ZmizzPuFS
	bFQr3k34g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU3mR-004WM3-27; Wed, 07 Apr 2021 08:43:19 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU3mJ-004WLN-MK
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 08:43:13 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MwPfX-1lkMEz0FMr-00sRXD for <linux-riscv@lists.infradead.org>; Wed, 07
 Apr 2021 10:43:08 +0200
Received: by mail-ot1-f53.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so17314104otb.7
 for <linux-riscv@lists.infradead.org>; Wed, 07 Apr 2021 01:43:07 -0700 (PDT)
X-Gm-Message-State: AOAM5312YjTEECU8igSyNouq7jpuf2w+iseYIbg/8MXK8StRu+crsufa
 pjsavdIaGDgkX5SYyoQXeLxL2laUPf7fpxhFqP4=
X-Google-Smtp-Source: ABdhPJyEzzeePiTksGgoW6JxcSZ73Zq5OLkAoMy2RnSW8XEgaIbyDDdmoeKSyjV9qiGXc17VtYYeor2UEEylyRze7MQ=
X-Received: by 2002:a9d:758b:: with SMTP id s11mr2061872otk.305.1617784986795; 
 Wed, 07 Apr 2021 01:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
 <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
 <20210330223514.GE1171117@lianli.shorne-pla.net>
 <CAK8P3a0hj2pYr-CuNJkjO==RafZ=J+6kCo4HTWEwvvRXPcngJA@mail.gmail.com>
 <CAJF2gTRxPMURTE3M5WMQ_0q1yZ6K8nraGsFjGLUmpG9nYS_hng@mail.gmail.com>
 <20210406085626.GE3288043@lianli.shorne-pla.net>
In-Reply-To: <20210406085626.GE3288043@lianli.shorne-pla.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Apr 2021 10:42:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Pf3TbGoVP7JP7gfPV-WDM8MHV_hdqSwNKKFDr1Sb3zQ@mail.gmail.com>
Message-ID: <CAK8P3a3Pf3TbGoVP7JP7gfPV-WDM8MHV_hdqSwNKKFDr1Sb3zQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Stafford Horne <shorne@gmail.com>
Cc: Guo Ren <guoren@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Anup Patel <anup@brainfault.org>
X-Provags-ID: V03:K1:dTWOJaRm/7FSOIqJ72U6AfTFj8Zdyslb9XDCNzDaGDUYa/KNCYt
 fU3pXVVyvlh45O6eAzEB+bnc6aFdjnJpmLgqrj/qzor7QhMQT8D8PbnHXGzHQaoDhrJ+RpS
 Ow0I74SkwiZ/pDBjmNJk3ysmT+i23On+NlgNa9ZgH/r28GRq4GWjXovJ8m9IJAxfdqTaU14
 q7N7xr2gHuYbJfPbbn0kA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ubCAIJj3vCg=:dx0U+2JzPE7gxv1Ep25f9g
 sj5C2IEfSAj61cMc1euuTGX5x0puzaRuwnJrPoJEuYKochJ8SMwOsGi+hwp2Fp+OvmT87eKlq
 CKuCpCYtWBiblbSKW8/KOgGPJ47FtPN6tOX3FqEaovYsCjjAeWBkGbNQz1pdaNzPALDMi6ixa
 9QSJtw717cEMfbXZcXNHh5W9Dbey9E5J6DBV4sCVWjK8dLmB36dWT7mhNoMBsRg0qlmcXa7ye
 013O17F1eIMEkd48IJwfq+YowSdks+YxPKffqflPtHboWRkxiNpEzjgXprOiNgpkgMYKyFM6d
 lXPcjmM5OsFv6GmTIt2xCLkkR0FbfqyfEKtxCfsNAg4psRY/VdVQjsu8OpmjK8aouHXTmGgXv
 xVcl60GlOyCi2Shq5c/gBiVUofTJOLL9htwq7qUYK1Ra77xWk8CopW4Aqi57C1k9TWj2HRDb6
 dicavapKa3pE3WQ+wwTx7SVd5auCwjhte6ahVvQeDcJkOqYRad3B6ylvewKEgQ066F8D7RqVC
 /rusJe3TjeS72mpjBHLE+w7vTIqsR4aa/w3IG3Ewk+odnAR6APCPLL4mKnX6n13DT+mfDqe2u
 K4dIbzydZkKLjLdfHDrdA/048dxbT666wP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_094312_036872_A3E73AC5 
X-CRM114-Status: GOOD (  20.79  )
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

On Tue, Apr 6, 2021 at 10:56 AM Stafford Horne <shorne@gmail.com> wrote:
> On Tue, Apr 06, 2021 at 11:50:38AM +0800, Guo Ren wrote:
> > On Wed, Mar 31, 2021 at 3:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Wed, Mar 31, 2021 at 12:35 AM Stafford Horne <shorne@gmail.com> wrote:
> >
> > We shouldn't export xchg16/cmpxchg16(emulated by lr.w/sc.w) in riscv,
> > We should forbid these sub-word atomic primitive and lets the
> > programmers consider their atomic design.
>
> Fair enough, having the generic sub-word emulation would be something that
> an architecture can select to use/export.

I still have the feeling that we should generalize and unify the exact behavior
across architectures as much as possible here, while possibly also trying to
simplify the interface a little.

Looking through the various xchg()/cmpxchg() implementations, I find eight
distinct ways to do 8-bit and 16-bit atomics:

Full support:
      ia64, m68k (Atari only), x86, arm32 (v6k+), arm64

gcc/clang __sync_{val,bool}_compare_and_swap:
     s390

Emulated through ll/sc:
      alpha, powerpc

Emulated through cmpxchg loop:
      mips, openrisc, xtensa (xchg but not cmpxchg), sparc64 (cmpxchg_u8,
      xchg_u16 but not cmpxchg_u16 and xchg_u8!)

Emulated through local_irq_save (non SMP only):
        h8300, m68k (most), microblaze, mips, nds32, nios2

Emulated through hashed spinlock:
        parisc (8-bit only added in 2020, 16-bit still missing)

Forced compile-time error:
       arm32 (v4/v5/v6 non-SMP), arc, csky, riscv, parisc (16 bit), sparc32,
       sparc64, xtensa (cmpxchg)

Silently broken:
        hexagon

Since there are really only a handful of instances in the kernel
that use the cmpxchg() or xchg() on u8/u16 variables, it would seem
best to just disallow those completely and have a separate set of
functions here, with only 64-bit architectures using any variable-type
wrapper to handle both 32-bit and 64-bit arguments.

Interestingly, the s390 version using __sync_val_compare_and_swap()
seems to produce nice output on all architectures that have atomic
instructions, with any supported compiler, to the point where I think
we could just use that to replace most of the inline-asm versions except
for arm64:

#define cmpxchg(ptr, o, n)                                              \
({                                                                      \
        __typeof__(*(ptr)) __o = (o);                                   \
        __typeof__(*(ptr)) __n = (n);                                   \
        (__typeof__(*(ptr))) __sync_val_compare_and_swap((ptr),__o,__n);\
})

Not how gcc's acquire/release behavior of __sync_val_compare_and_swap()
relates to what the kernel wants here.

The gcc documentation also recommends using the standard
__atomic_compare_exchange_n() builtin instead, which would allow
constructing release/acquire/relaxed versions as well, but I could not
get it to produce equally good output. (possibly I was using it wrong)

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
