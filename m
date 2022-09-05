Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D243BECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 18:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cGCJ6PR7Bdc4WgmKF5/sdt3tC5RxDQVNR70no4Y0J4=; b=YL47wjrOwHPzyL
	FfmvnvZ36aBgDoebkZZYusIM0EleakgRIZjT4qviurNs3m5MSJ0Gp80vWgTioQfSGKvYMTxM1Eh7p
	XOMje2gGeU+tq3yYHNXTZjWzlPHN562l7XgS/UC+1ZNmMFzOIjHzMiDDakUviu764LESblDUFUTat
	wglXRCurNUsO84s0QYXQtqj3IfnXYEJCIYS4TtNYRnz1E/Vg3NNG3KLWKtwJQrVqz5nBYAPCPJ+hm
	gPItabAnxFX3SW0a2DjXD1/XqPqA6U+zK28rtN2mvfKuH3gttLfCGQ+0HtbFBvNRY4qp1u0f7PaL6
	9+xF7256XDZthXemyQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGdx-008FXL-7V; Mon, 05 Sep 2022 18:16:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVC8O-003AwN-LF
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 13:27:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 99B79B811A2;
	Mon,  5 Sep 2022 13:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A847EC433D6;
	Mon,  5 Sep 2022 13:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662384440;
	bh=FhrsajGQQIMz9z7n/XSvu9LOzvT3rIds+CNm2LlWuAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QlEXsJuD6yKRFA2zpqB08a91w2o064RANecRM8htACkXyOzCYwv3hTFbYDn1ZYM7m
	 BiV01d18Eq2We60S2jv2iGajjbE3w0JcEEEB/L/DKOUvLbaJtha7bVk58Xnoamvs1X
	 5VgJtzHJ3E0lHsZCtjTD62iHnylBcCmU6tVsxkvcsTeedmhWk6SS7b2KqY7d9RRmNI
	 PYhCRlN8m6uduMYYJTWHO9IZitkiVjLAJYT1CD+p+hih1HSLL/UlVjuj9SdXHdjCnw
	 SyTGsImzi09L3HxcFVNjJSoe2ENcmxhWwskL2hvCClR2fFuoSFpPG/Jq36C1hs5R0H
	 mjBKKSC6OlZ/w==
Date: Mon, 5 Sep 2022 21:18:01 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, lazyparser@gmail.com, falcon@tinylab.org,
	chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2 0/6] riscv: Add GENERIC_ENTRY, IRQ_STACKS support
Message-ID: <YxX3CZQEe86u052D@xhacker>
References: <20220904072637.8619-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904072637.8619-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_062729_053416_E18FED6D 
X-CRM114-Status: GOOD (  15.76  )
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

On Sun, Sep 04, 2022 at 03:26:31AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The patches convert riscv to use the generic entry infrastructure from
> kernel/entry/*. Add independent irq stacks (IRQ_STACKS) for percpu to

Amazing! You read my mind. I planed to do similar series this week, as
can be seen, I didn't RESEND the riscv irqstack patch, I planed to add
irqstack after generic entry. Thanks for this series.

Will read and test your patches soon. A minor comments below.

> prevent kernel stack overflows. Add the HAVE_SOFTIRQ_ON_OWN_STACK
> feature for the IRQ_STACKS config. You can try it directly with [1].
> 
> [1] https://github.com/guoren83/linux/tree/generic_entry_v2
> 
> Changes in V2:
>  - Fixup compile error by include "riscv: ptrace: Remove duplicate
>    operation"
>    https://lore.kernel.org/linux-riscv/20220903162328.1952477-2-guoren@kernel.org/T/#u
>  - Fixup compile warning
>    Reported-by: kernel test robot <lkp@intel.com>
>  - Add test repo link in cover letter
> 
> Guo Ren (6):
>   riscv: ptrace: Remove duplicate operation
>   riscv: convert to generic entry
>   riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
>   riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
>   riscv: elf_kexec: Fixup compile warning
>   riscv: compat_syscall_table: Fixup compile warning

It's better to move these two patches ahead of patch2.

> 
>  arch/riscv/Kconfig                    |  10 +
>  arch/riscv/include/asm/csr.h          |   1 -
>  arch/riscv/include/asm/entry-common.h |   8 +
>  arch/riscv/include/asm/irq.h          |   3 +
>  arch/riscv/include/asm/ptrace.h       |  10 +-
>  arch/riscv/include/asm/stacktrace.h   |   5 +
>  arch/riscv/include/asm/syscall.h      |   6 +
>  arch/riscv/include/asm/thread_info.h  |  15 +-
>  arch/riscv/include/asm/vmap_stack.h   |  28 +++
>  arch/riscv/kernel/Makefile            |   1 +
>  arch/riscv/kernel/elf_kexec.c         |   4 +
>  arch/riscv/kernel/entry.S             | 255 +++++---------------------
>  arch/riscv/kernel/irq.c               |  75 ++++++++
>  arch/riscv/kernel/ptrace.c            |  41 -----
>  arch/riscv/kernel/signal.c            |  21 +--
>  arch/riscv/kernel/sys_riscv.c         |  26 +++
>  arch/riscv/kernel/traps.c             |  11 ++
>  arch/riscv/mm/fault.c                 |  12 +-
>  18 files changed, 250 insertions(+), 282 deletions(-)
>  create mode 100644 arch/riscv/include/asm/entry-common.h
>  create mode 100644 arch/riscv/include/asm/vmap_stack.h
> 
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
