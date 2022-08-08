Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AF2C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZEWfx5f/YDeiXy62kQyOLZvwKnGyX7zi5MGPLnxpQg=; b=jXvPaq4TK/aKhL
	ZLxF/wHoXKoiDpHmufFhv1qlQjYGOtI7Vu2jU7GVe2LSXKlSVhgrUoJwzRewO1VwbLEREiSraoq/4
	RxX7MUpamAZjr3RSpvGV8hxvjlgMe5EpeUSVj5AfGaMGjsAGgbiPSHpjj+EwgFSI53poDM3vT/Lo7
	mgbanC5c5Zqydhmibwejwd3ztJNPCAZBWtNxbJ9V5WhAWSmklf9QM0aggOU9nSOxBTU/AS5wUNnHp
	NPn1ELDdKr6nsn45dcedoUgySX61BRCUl72cK3hDaeFaCk1AV2cPytfylCLRD2UxTdqDYBC0pWogm
	2ZRk78IxPVaPlUZ1CxVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKx8v-00C76w-Ip; Mon, 08 Aug 2022 07:25:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKx8r-00C736-D3
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 07:25:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0103EB80E06
	for <linux-riscv@lists.infradead.org>; Mon,  8 Aug 2022 07:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3813C4347C
	for <linux-riscv@lists.infradead.org>; Mon,  8 Aug 2022 07:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659943534;
	bh=LF418aOF6Ob6gloAT5R9P5nGzwV/BElbsYz712Z9b+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JtNueuqYf47ZpkR8iO5Hx8j1ADO1GsQb8zHJvgVgI513m2MGuJw4ICPXZyGW4RBOL
	 pWm+ea6nK9QIeY4l86sxSct1m85YBXoNBpWQPNXnszk6pyACVicRqPuUvwKN9bZhnt
	 UPQbHhMZm+B/wjrNIePRJ0jobF9NtYmEK+yCouhlSK+N1huJTLUm0RxAaKJ+FodRV5
	 vU7axRg11SRfM3RjtwVNbwqgIaVLTiMn/gcc66lV1WuGL8SmUPR6fn+92gqDVWyQVt
	 acLu4UHi7fuRCwjo6ulMpdj6SYgn/i7qRaMyiVfFQ9gvtZYIwplPmb9QYPAnLKrmid
	 sc39tF4ITwltA==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-10edfa2d57dso9703693fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 00:25:34 -0700 (PDT)
X-Gm-Message-State: ACgBeo39fd70TBrTs9CjsXLPnzYfbWMJuE9BS4G9d1B9aSY+jTbJLUlm
	cWXrpP3Kc0GGXbtiS43Vqt0PHKr4+k7+JQynW24=
X-Google-Smtp-Source: AA6agR5eZRG38OuD86wzH2bZz2iWtGbDbq644XdywLdTekdRUdLjfEHttbFMfTkjfxb6umk6Ro+3bDaMVFrI4DYWnCw=
X-Received: by 2002:a05:6870:c596:b0:101:6409:ae62 with SMTP id
 ba22-20020a056870c59600b001016409ae62mr11378931oab.112.1659943533771; Mon, 08
 Aug 2022 00:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220808071318.3335746-1-guoren@kernel.org>
In-Reply-To: <20220808071318.3335746-1-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 8 Aug 2022 15:25:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQLjBnAaouDBWzuWfj5MnMVvHdkO-iKnBDv5jWZ6U-TPw@mail.gmail.com>
Message-ID: <CAJF2gTQLjBnAaouDBWzuWfj5MnMVvHdkO-iKnBDv5jWZ6U-TPw@mail.gmail.com>
Subject: Re: [PATCH V9 00/15] arch: Add qspinlock support and atomic cleanup
To: palmer@rivosinc.com, heiko@sntech.de, hch@infradead.org, arnd@arndb.de, 
	peterz@infradead.org, will@kernel.org, boqun.feng@gmail.com, 
	longman@redhat.com, shorne@gmail.com, conor.dooley@microchip.com
Cc: linux-csky@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_002537_769545_AAC69F10 
X-CRM114-Status: GOOD (  22.77  )
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

Sorry, here is the Changelog:

Changes in V9:
 - Fixup xchg16 compile warning
 - Keep ticket-lock the same semantic with qspinlock
 - Remove unused xchg32 and xchg64
 - Forbid arch_cmpxchg64 for 32-bit
 - Add openrisc qspinlock support

Changes in V8:
 - Coding convention ticket fixup
 - Move combo spinlock into riscv and simply asm-generic/spinlock.h
 - Fixup xchg16 with wrong return value
 - Add csky qspinlock
 - Add combo & qspinlock & ticket-lock comparison
 - Clean up unnecessary riscv acquire and release definitions
 - Enable ARCH_INLINE_READ*/WRITE*/SPIN* for riscv & csky

Changes in V7:
 - Add combo spinlock (ticket & queued) support
 - Rename ticket_spinlock.h
 - Remove unnecessary atomic_read in ticket_spin_value_unlocked

Changes in V6:
 - Fixup Clang compile problem Reported-by: kernel test robot
   <lkp@intel.com>
 - Cleanup asm-generic/spinlock.h
 - Remove changelog in patch main comment part, suggested by
   Conor.Dooley@microchip.com
 - Remove "default y if NUMA" in Kconfig

Changes in V5:
 - Update comment with RISC-V forward guarantee feature.
 - Back to V3 direction and optimize asm code.

Changes in V4:
 - Remove custom sub-word xchg implementation
 - Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32 in locking/qspinlock

Changes in V3:
 - Coding convention by Peter Zijlstra's advices

Changes in V2:
 - Coding convention in cmpxchg.h
 - Re-implement short xchg
 - Remove char & cmpxchg implementations



On Mon, Aug 8, 2022 at 3:14 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> In this series:
>  - Cleanup generic ticket-lock code, (Using smp_mb__after_spinlock as RCsc)
>  - Add qspinlock and combo-lock for riscv
>  - Add qspinlock to openrisc
>  - Use generic header in csky
>  - Optimize cmpxchg & atomic code
>
> Enable qspinlock and meet the requirements mentioned in a8ad07e5240c9
> ("asm-generic: qspinlock: Indicate the use of mixed-size atomics").
>
> RISC-V LR/SC pairs could provide a strong/weak forward guarantee that
> depends on micro-architecture. And RISC-V ISA spec has given out
> several limitations to let hardware support strict forward guarantee
> (RISC-V User ISA - 8.3 Eventual Success of Store-Conditional
> Instructions).
>
> eg:
> Some riscv hardware such as BOOMv3 & XiangShan could provide strict &
> strong forward guarantee (The cache line would be kept in an exclusive
> state for Backoff cycles, and only this core's interrupt could break
> the LR/SC pair).
> Qemu riscv give a weak forward guarantee by wrong implementation
> currently [1].
>
> So we Add combo spinlock (ticket & queued) support for riscv. Thus different
> kinds of memory model micro-arch processors could use the same Image
>
> The first try of qspinlock for riscv was made in 2019.1 [2].
>
> [1] https://github.com/qemu/qemu/blob/master/target/riscv/insn_trans/trans_rva.c.inc
> [2] https://lore.kernel.org/linux-riscv/20190211043829.30096-1-michaeljclark@mac.com/#r
>
> Guo Ren (15):
>   asm-generic: ticket-lock: Remove unnecessary atomic_read
>   asm-generic: ticket-lock: Use the same struct definitions with qspinlock
>   asm-generic: ticket-lock: Move into ticket_spinlock.h
>   asm-generic: ticket-lock: Keep ticket-lock the same semantic with qspinlock
>   asm-generic: spinlock: Add queued spinlock support in common header
>   riscv: atomic: Clean up unnecessary acquire and release definitions
>   riscv: cmpxchg: Remove xchg32 and xchg64
>   riscv: cmpxchg: Forbid arch_cmpxchg64 for 32-bit
>   riscv: cmpxchg: Optimize cmpxchg64
>   riscv: Enable ARCH_INLINE_READ*/WRITE*/SPIN*
>   riscv: Add qspinlock support
>   riscv: Add combo spinlock support
>   openrisc: cmpxchg: Cleanup unnecessary codes
>   openrisc: Move from ticket-lock to qspinlock
>   csky: spinlock: Use the generic header files
>
>  arch/csky/include/asm/Kbuild           |   2 +
>  arch/csky/include/asm/spinlock.h       |  12 --
>  arch/csky/include/asm/spinlock_types.h |   9 --
>  arch/openrisc/Kconfig                  |   1 +
>  arch/openrisc/include/asm/Kbuild       |   2 +
>  arch/openrisc/include/asm/cmpxchg.h    | 192 ++++++++++---------------
>  arch/riscv/Kconfig                     |  49 +++++++
>  arch/riscv/include/asm/Kbuild          |   3 +-
>  arch/riscv/include/asm/atomic.h        |  19 ---
>  arch/riscv/include/asm/cmpxchg.h       | 177 +++++++----------------
>  arch/riscv/include/asm/spinlock.h      |  77 ++++++++++
>  arch/riscv/kernel/setup.c              |  22 +++
>  include/asm-generic/spinlock.h         |  94 ++----------
>  include/asm-generic/spinlock_types.h   |  12 +-
>  include/asm-generic/ticket_spinlock.h  |  93 ++++++++++++
>  15 files changed, 384 insertions(+), 380 deletions(-)
>  delete mode 100644 arch/csky/include/asm/spinlock.h
>  delete mode 100644 arch/csky/include/asm/spinlock_types.h
>  create mode 100644 arch/riscv/include/asm/spinlock.h
>  create mode 100644 include/asm-generic/ticket_spinlock.h
>
> --
> 2.36.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
