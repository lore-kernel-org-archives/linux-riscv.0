Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25136ECAAD4
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 10:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3VhgwE07t1lTpfr4MwLRh1C5+/RBypnYnDBKmMYRcxk=; b=FcpeDzIk4pC9aC
	IfD+bdzZQHtR/p/dklBzDblNevw0jD3ou52XYPI+OmWdThlVAZq6fQzUatZho7kxh/Cn9xHPdvruN
	it8wPlUzef3QENUNP8uBXogRia+SAdZ+j5OuCClfrtVVKzVmpiwhmgbw4zzc+j1IVr/TKxNLxXyDS
	KjpNWkc4yEpuStoXH5ZzwxFoPhIAKmugTURUdfXp3M2MlsfKqpWEbx/r0pOtriqeanH+5txSaC8yD
	GBfTjnvqag6edw98PpF8TDi0JqJfs0dOnS6A6PS7n/L+nqEgFHvuGFGg4jRjdG/wzPX5zTV4Mnbsf
	jIlhNJU8ncalxZ93ckZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUn3K-003Zec-6Q; Sun, 04 Sep 2022 10:40:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUn3G-003ZcA-Nu
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 10:40:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 94339B80D59
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 10:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD13C433D6
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662288027;
	bh=QvekvzTHziUiAlppqzOc2503IrEaR87Amqi+A2N8Wbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lWIFglzecdpNXDWI4IMKk1ezBgmV9MIPsn5+kBZRDzrxI4epuXV+BaX49nWQlFuoQ
	 CzGigb9q83kkFaaH84x1q6lKA6n7vlJ//F7BBdlGOS8ly+vDJ3CVbN4Yi7IgfsV8ml
	 ZhRmETx/9KE5j/l2kRHtXH4D4tfBBtSu+N9hbghGNr8aPVzKxXI7Xceo3tIX9mVxsa
	 mlazkVPe//f3fr4UI/m5/ap9q00k3RTqxVIZtwyDPJlZ4LnIuiJwOrayKT4fJpTEEH
	 rx0LQ5h0YMYCc+pDMqU542E724ROg4Bg1QtmIN8PITAT3BxaKD3Un3T/ubo5LZF/fG
	 HdxQ3iDgX4VZg==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-11e9a7135easo15589212fac.6
        for <linux-riscv@lists.infradead.org>; Sun, 04 Sep 2022 03:40:27 -0700 (PDT)
X-Gm-Message-State: ACgBeo2zTdFI9WZVYMhvk96uULXo8evDbJQ19lq+mLqnlUaD2hfT1f7d
	ENfMpU6Idp4chXMH01qx88PXT2p1LW0sZ6cUaN0=
X-Google-Smtp-Source: AA6agR6sAHYb4ljI9RHXksbswRfpihbmkms10dn4bovNyYlfRGc7CVPKnpnoNgXAoLNEX7VZY1o7Q2k2oR8tSaiBMJA=
X-Received: by 2002:a05:6870:7092:b0:11e:ff3a:d984 with SMTP id
 v18-20020a056870709200b0011eff3ad984mr6115401oae.19.1662288026365; Sun, 04
 Sep 2022 03:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220904072637.8619-1-guoren@kernel.org> <bdac65bd-175f-3f09-ae46-97d4fcc77d6f@microchip.com>
In-Reply-To: <bdac65bd-175f-3f09-ae46-97d4fcc77d6f@microchip.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 4 Sep 2022 18:40:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSOdZCDAk7Gq1-7cxYTXabVbZoarEPk=jh4Ss-L3zAsLQ@mail.gmail.com>
Message-ID: <CAJF2gTSOdZCDAk7Gq1-7cxYTXabVbZoarEPk=jh4Ss-L3zAsLQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/6] riscv: Add GENERIC_ENTRY, IRQ_STACKS support
To: Conor.Dooley@microchip.com
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_034031_103522_661202F8 
X-CRM114-Status: GOOD (  24.48  )
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

On Sun, Sep 4, 2022 at 6:17 PM <Conor.Dooley@microchip.com> wrote:
>
> Hey Guo Ren,
> (off topic: is Guo or Ren your given name?)
>
> This series seems to introduce a build warning:
>
> arch/riscv/kernel/irq.c:17:1: warning: symbol 'irq_stack_ptr' was not declared. Should it be static?
>
> One more comment below:
>
> On 04/09/2022 08:26, guoren@kernel.org wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The patches convert riscv to use the generic entry infrastructure from
> > kernel/entry/*. Add independent irq stacks (IRQ_STACKS) for percpu to
> > prevent kernel stack overflows. Add the HAVE_SOFTIRQ_ON_OWN_STACK
> > feature for the IRQ_STACKS config. You can try it directly with [1].
> >
> > [1] https://github.com/guoren83/linux/tree/generic_entry_v2
> >
> > Changes in V2:
> >  - Fixup compile error by include "riscv: ptrace: Remove duplicate
> >    operation"
> >   https://lore.kernel.org/linux-riscv/20220903162328 .1952477-2-guoren@kernel.org/T/#u
>
> I find this really confusing. The same patch is in two different series?
Generic entry needn't TIF_SYSCALL_TRACE. So it depends on "riscv:
ptrace: Remove duplicate"

> Is the above series no longer required & this is a different approach?
Above series cleanup ptrace_disable, we still need that.

> Thanks,
> Conor.
>
> >  - Fixup compile warning
> >    Reported-by: kernel test robot <lkp@intel.com>
> >  - Add test repo link in cover letter
> >
> > Guo Ren (6):
> >   riscv: ptrace: Remove duplicate operation
> >   riscv: convert to generic entry
> >   riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
> >   riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
> >   riscv: elf_kexec: Fixup compile warning
> >   riscv: compat_syscall_table: Fixup compile warning
> >
> >  arch/riscv/Kconfig                    |  10 +
> >  arch/riscv/include/asm/csr.h          |   1 -
> >  arch/riscv/include/asm/entry-common.h |   8 +
> >  arch/riscv/include/asm/irq.h          |   3 +
> >  arch/riscv/include/asm/ptrace.h       |  10 +-
> >  arch/riscv/include/asm/stacktrace.h   |   5 +
> >  arch/riscv/include/asm/syscall.h      |   6 +
> >  arch/riscv/include/asm/thread_info.h  |  15 +-
> >  arch/riscv/include/asm/vmap_stack.h   |  28 +++
> >  arch/riscv/kernel/Makefile            |   1 +
> >  arch/riscv/kernel/elf_kexec.c         |   4 +
> >  arch/riscv/kernel/entry.S             | 255 +++++---------------------
> >  arch/riscv/kernel/irq.c               |  75 ++++++++
> >  arch/riscv/kernel/ptrace.c            |  41 -----
> >  arch/riscv/kernel/signal.c            |  21 +--
> >  arch/riscv/kernel/sys_riscv.c         |  26 +++
> >  arch/riscv/kernel/traps.c             |  11 ++
> >  arch/riscv/mm/fault.c                 |  12 +-
> >  18 files changed, 250 insertions(+), 282 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/entry-common.h
> >  create mode 100644 arch/riscv/include/asm/vmap_stack.h
> >
> > --
> > 2.36.1
> >
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
