Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E82ACA600C
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 15:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hVE+qSzGbrGZ92EEQLGFHCqS+BE5/yPfjCrhmHBLBDw=; b=3RnWnvCXSkTow3
	euJDW3+xS4O2AJUFy4Lo7L/nFWGqJ5sQyEcj4mpYrZV9Wdi23aZ/nJKmyZ5UnADtA3E7vtbi7Ra5R
	MIRL8YWkRVn4lYwkbpzyvGGLZyL9QwBEpFfdgLs4SEHeriewnz27TmOgcRArx5rtizYb9sN6InV52
	/8CrLXYYUHLAVM332CPxwRBb4dd/vdA2gTDYFJBRIuAosn8xbdTCniXyugNm5sm+rqDFW4mHklVfT
	GSLQVlZtE6u64tZ7SU9EnYAj99AwwvKTvcgvRXeh1KnAbgjsYvBOKlD/qt63/14JYBTt/i+1lLrTp
	OJHumdqqE2/dEGC7SGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpvN-00000004b83-3FVx;
	Thu, 08 Oct 2026 15:20:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpvM-00000004b7h-1dBs
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 15:20:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 90501438FE;
	Thu,  8 Oct 2026 15:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD2B1F000FF;
	Thu,  8 Oct 2026 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791472847;
	bh=1gCy/9v0c6kT0lioqMLqKdZWlosVlffGsFk8sWRvSe8=;
	h=From:To:Cc:Subject:Date;
	b=FaJg/Gc/DsrRwLA+HeQ65GEZRSoPDQlgDI/yR/FYHtoZQUIZGNh6AUYjKqmwmHIzp
	 aEr4M32YrVExf7zV2ZZn6mGci+UjjoNa3P05ffsMSP52qvyMaw/NdB8KO4BpNCKEtr
	 2QDaiig/g6qptaGW0YcRAjb6qJaKWpnAT//9mX5ZV6/nXcks0cRBbk44q180qgFPxA
	 gdZ1C3lK2vkBY1AfsU3NhOi+luvxgMXQgi5aHgFIh8N+cc3Rfjm5lWvxAaD2WbGidt
	 yIe4qXgbbg8NDPGiYHzsgoRgln55Z/Gl18BJCTKEWrxccs2KVui4Z7+/AD7BOtSZKt
	 mV827xp4vn0Ew==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] optimize pgtable_l4|l5_enabled
Date: Thu,  8 Oct 2026 23:00:40 +0800
Message-ID: <20261008150045.28905-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

In 2022, I tried to optimize pgtable_l4|l5_enabled with static branch[3]
But as is known, static branch has some drawbacks. 

This series is another round of optmizing pgtable_l4|l5_enabled, but
with another mechanism. Below the is normal cover-letter.

The pgtable_l4|[l5]_enabled check sits at hot code path, performance
is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
boot, we can use alternative mechanism to optimize them.

So the question is whether we can add RISCV_ISA_EXT_SV48/SV57 and use
riscv_has_extension_*() or not. Per [1] and [2], SV48 and SV57 are ISA
exensions too. From another side, riscv_has_extension_[un]likely() and
other related functions report whether the extension is supported and
enabled on the platform. So SV48 and SV57 can be supported with current
isa extension alternative mechanism.

However, to use it to optimize pgtable_l4|l5_enabled, we have to
support the "early" characteristic, I.E besides risc_isa bitmap
setting, we need to support appling alternative early before MMU on.

After that, use it to optimize pgtable_l4|l5_enabled.

For the typical access_ok(addr, 1);
before the patch:

...
auipc	a5,0xb43
lbu	a5,100(a5) # ffffffff80b51f68 <pgtable_l5_enabled>
bnez	a5,ffffffff8000ef46 <foo+0x56>
auipc	a5,0xb43
lbu	a5,91(a5) # ffffffff80b51f69 <pgtable_l4_enabled>
beqz	a5,ffffffff8000ef5a <foo+0x6a>
...

after the patch:
These memory load and test branch instructions are replaced with only
two j or nop instructions.

Initial test lmbench's lat_syscall write on TH1520 platforms shows that
the write syscall latency is reduced by about 2.38%.

After that, introduce RISCV_ISA_SV48 and RISCV_ISA_SV57, so that the
embedded platforms can choose the best option themselves, while still
keep the feature of unified one kernel Image for all SV39, SV48 and
SV57.

Tested on TH1520 platforms with both RISCV_ISA_SV48 and RISCV_ISA_SV48
disabled, we saved 20 instructions for access_ok(addr, 1)

Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/profiles/profiles.adoc [1]
Link: https://riscv.atlassian.net/wiki/spaces/HOME/pages/16154732/Ratified+ISA+Extensions [2]
Link: https://lore.kernel.org/linux-riscv/20220821140918.3613-1-jszhang@kernel.org/ [3]

Since v4:
  - fix RV32 build error

Since v3:
  - collect Acked-by, Reviewed-by tag
  - Add comment to explain why riscv_isa is being zeroed.

Since v2:
  - simplify isa bitmap filling by the fact that only SV48 and SV57
    needs the "early" feature
  - move RISCV_ISA_SV48 and RISCV_ISA_SV57 out of NONPORTABLE

Since v1:
  - use current isa extension to support SV48/SV57
  - collect Reviewed-by tag
  - add patch4 to introduce RISCV_ISA_SV48 and RISCV_ISA_SV57 under
    NONPORTABLE
  - add patch5 to unexport _pgtable_l4_enabled and _pgtable_l5_enabled



Jisheng Zhang (5):
  riscv: remove RISCV_ALTERNATIVE Kconfig option
  riscv: convert pgtable_l4|l5_enabled to inline function
  riscv: support early isa ext and use it to optimize
    pgtable_l4|l5_enabled
  riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57
  riscv: mm: unexport _pgtable_l4_enabled and _pgtable_l5_enabled

 arch/riscv/Kconfig                          | 48 +++++++------
 arch/riscv/Kconfig.errata                   |  5 +-
 arch/riscv/include/asm/alternative-macros.h | 24 -------
 arch/riscv/include/asm/alternative.h        | 12 +---
 arch/riscv/include/asm/cpufeature-macros.h  | 10 +--
 arch/riscv/include/asm/cpufeature.h         |  8 +--
 arch/riscv/include/asm/hwcap.h              |  2 +
 arch/riscv/include/asm/pgalloc.h            | 14 ++--
 arch/riscv/include/asm/pgtable-32.h         |  4 +-
 arch/riscv/include/asm/pgtable-64.h         | 74 +++++++++++++------
 arch/riscv/include/asm/pgtable.h            |  4 +-
 arch/riscv/include/asm/vendor_extensions.h  | 18 ++---
 arch/riscv/include/asm/vmalloc.h            |  5 +-
 arch/riscv/kernel/Makefile                  |  2 +-
 arch/riscv/kernel/alternative.c             | 24 +++++--
 arch/riscv/kernel/cpu.c                     |  4 +-
 arch/riscv/kernel/cpufeature.c              | 64 ++++++++++++++---
 arch/riscv/mm/init.c                        | 79 ++++++++++++---------
 arch/riscv/mm/kasan_init.c                  | 20 +++---
 arch/riscv/mm/pgtable.c                     |  4 +-
 arch/riscv/mm/ptdump.c                      |  4 +-
 21 files changed, 243 insertions(+), 186 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
