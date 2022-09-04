Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988A7ECAAD4
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0fgmYH1La4KGQKbGcX+KYzo2b1De1xYO6W24W1jtfU=; b=RkcbPlhRBY2yOl
	3oeax/p/HaJyxSdMq2BqqpJnpZtECqhK4QjrCsBRcrmySZh1hNDR1+K2yLFAraDKiGgNEog5jPVY6
	Gcbby3+VNc7SbLG+aC/bTFwvAw4TK5oTKcNZKVZ+AWGIaIc8/B7L5TIdFocXEVygRshxpwuQHt6m7
	hG4ePDE3cdGOqfrMZrRCEXhkCoYLbrGqRxFWJvT7w+eUs88u9OPwRo3/EAD/RIY6arDLf6kRidwCR
	kAmaG09xd7XJ5b7Eg8bfB7KzIQk/9CFATIvqBwbCxm2LR5+6O7U34B5/fwWx6Ujn+lTQZyddrjbD9
	YHjJ+RkE6liCaKisAP4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUnRY-00410d-Ef; Sun, 04 Sep 2022 11:05:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUnRW-0040vc-1U
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 11:05:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D70B60F6F
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 11:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECF0C433B5
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662289532;
	bh=K4+vScggM2EV2pgo7YlzZVyHFKhrScIEqSPeoPwXFmg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qEbp8Y1rPsMAPQEHmx3Iqc8skXgGHkWIu4d8pizi/7MYtcpj4RE4U3bC0uG0Gv+LX
	 fJRNTCVGmRfEfT6PhSsiyLGxHYkNAtZl/umdVaMiT0v1qL+meNyWTuurP17//TbZSu
	 PWAQ/Nu+qPipNEDmyn9Rb0xpf0kfkeorStcamYXdlfpOOPwqSJVIOeGdoX3zR1vlrr
	 hf6mchIX3nuOO9nxTUy+Dn/SynzFo3bfNrJuQNJvORtL+LoPnYU0EQVf/RqD8wWb7F
	 nEQ3ejUgLvV8ruCeJa3hx2M/MpLW47yXgsPDUAaGl0YRrfAgzL1SIw8LP4rmBjOGiF
	 p3R89Jak14kPA==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-11f34610d4aso15628263fac.9
        for <linux-riscv@lists.infradead.org>; Sun, 04 Sep 2022 04:05:32 -0700 (PDT)
X-Gm-Message-State: ACgBeo0P326g+YPkf1UuI4dBCuVgpkc9eDzPXYRKpo+KgdGJWJeurXt8
	xNYc75zMS47/V9E/R9VLs2gh5iU4kZqrex8wCvo=
X-Google-Smtp-Source: AA6agR5em28Nke+ymvWJLH5tNCVE9mGs7sOBHIp9Y9/1hyIoiIOMyGS3DYeVmncLqQ00+S/CpLllRUFRYkewJP0d+Yw=
X-Received: by 2002:a05:6870:7092:b0:11e:ff3a:d984 with SMTP id
 v18-20020a056870709200b0011eff3ad984mr6156094oae.19.1662289531884; Sun, 04
 Sep 2022 04:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220904072637.8619-1-guoren@kernel.org> <bdac65bd-175f-3f09-ae46-97d4fcc77d6f@microchip.com>
In-Reply-To: <bdac65bd-175f-3f09-ae46-97d4fcc77d6f@microchip.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 4 Sep 2022 19:05:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTvsWycqjx9joy6mRq_M4pgAPDy30ZhwKCsMC8HF6pKSQ@mail.gmail.com>
Message-ID: <CAJF2gTTvsWycqjx9joy6mRq_M4pgAPDy30ZhwKCsMC8HF6pKSQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220904_040534_182090_47032644 
X-CRM114-Status: GOOD (  25.17  )
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
My name is written in Guo Ren / guoren. Don't separate them. In China,
no one calls me Guo or Ren separately, it makes me strange.

>
> This series seems to introduce a build warning:
>
> arch/riscv/kernel/irq.c:17:1: warning: symbol 'irq_stack_ptr' was not declared. Should it be static?
I don't have that warning. But you are right, it should be static.
Thank you. I will fix it in the next version of the patch.

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
> >    https://lore.kernel.org/linux-riscv/20220903162328.1952477-2-guoren@kernel.org/T/#u
>
> I find this really confusing. The same patch is in two different series?
> Is the above series no longer required & this is a different approach?
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
