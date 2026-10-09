Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BDDCA6012
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SWt3vVFNVjYqqp/dd8szh6V/w2I5UCAvRxz7eNbV2r4=; b=jylwD+frAdXp14
	krPFI2KqlD9BgD7t2KMLav+lPIu7K9+72lRGNvxvIsZs8pfEjPAfVcPUu6Myg4ZAgWHojpyqe4qo9
	aGuslCXNj41Kt0LJgnewaAg6rB/o4uwHvw09/MXQxHWbnjrpIKYj/oYTX4gWsCIL4R4HIRw/skBUW
	EvwdfCJDn+SaWhxawA3EsQD1hRj++vwI/mE+E/IB2RhmXp1DBvNLhmSnZda51y6mMtOrjk4LfMYIf
	FwD63gUx7nHVGmPLn3AjYY6FxSiG+1tc5CbXEm2O2X3AXF8QRO6sIxONWRtciDJejbxojRUVkhoe6
	lCvaA+Rg078601NakrHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6Bo-00000005qLu-3d7L;
	Fri, 09 Oct 2026 08:42:52 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6Bm-00000005qK8-0pgf
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 08:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791535368; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=5AY+qxPktrH798J79id4Fdk8qu63plCfc1VdTFiH2aU=;
	b=i3aRsb/yTYxexiBoRJpUcE1sfF/Jk+dzTH9XJ5AAWEwi01NnwFXFhBK9d7hqMAWKFcbpO0cZPzi8v9OkJnh+jtOWunCtc3N9M9QtjvwUVy3ZkVBa022ZZ3EgnUwLqU338WpfGTKM87TdoMC1RxkzqadB7O+yNkgEbGXHgO36nIg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R661e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XCSo3lo_1791535349;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XCSo3lo_1791535349 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 16:42:47 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Support inlined clocksource reads for the time counter
Date: Fri,  9 Oct 2026 16:42:28 +0800
Message-ID: <20261009084228.3240-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_014250_403005_16CE90F3 
X-CRM114-Status: GOOD (  17.47  )
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

The commit 2e27beeb66e4 ("timekeeping: Allow inlining clocksource::read()")
lets an architecture inline the clocksource read behind a static branch, so
that a read which is a single instruction stops paying for the indirect
call in front of it. The branch is only enabled for a clocksource
advertising CLOCK_SOURCE_CAN_INLINE_READ. The commit b27801189f7f ("x86:
Inline TSC reads in timekeeping") wired x86 up to it.

The overhead matters for consumers that need accurate timestamps and take
them very often: 1PPS edge timestamps, PTP stamping, and polling mode PPS
drivers all end up in the timekeeping fast path.

RISC-V has the same shape. In S-mode the counter is the time CSR, so on
64-bit a read is a single csr_read(CSR_TIME), and
riscv_clocksource.read() is a wrapper whose whole body is that one
instruction. Every fast path timestamp therefore pays an indirect call
and a return to reach a single CSR read. Letting timekeeping inline the
read issues that instruction at the call site and drops the call, which
is where the gain comes from.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
A few notes:

- The gain is in instructions executed per read. Without inlining, a
  read is a function pointer load, an indirect call, and a frame around
  the rdtime - 11 instructions in all; inlined it is a jump-label branch
  and the rdtime - 2. The read is no longer shared, so each fast path
  function in timekeeping.o grows by 11 instructions (438 bytes).

- RV32 is left out on purpose. There the read is a retry sequence
  (rdtimeh, rdtime, rdtimeh) rather than one instruction, so the saving
  is much smaller while the sequence is duplicated at every read site,
  which is the wrong trade on the small in-order cores with tight
  I-caches that run 32-bit Linux. rv32 depends on NONPORTABLE and
  nobody has asked for it; if hardware data says otherwise, enabling it
  is a one-line Kconfig change.

- M-mode is left out because RISCV_TIMER is not built there and the
  CLINT clocksource reads MMIO, so there is no cheap counter read to
  inline.

 arch/riscv/Kconfig                     |  1 +
 arch/riscv/include/asm/clock_inlined.h | 14 ++++++++++++++
 drivers/clocksource/timer-riscv.c      |  3 ++-
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/clock_inlined.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455c..f5d314ef37b8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -90,6 +90,7 @@ config RISCV
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
+	select ARCH_WANTS_CLOCKSOURCE_READ_INLINE if !RISCV_M_MODE && 64BIT
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS
diff --git a/arch/riscv/include/asm/clock_inlined.h b/arch/riscv/include/asm/clock_inlined.h
new file mode 100644
index 000000000000..450add2436e4
--- /dev/null
+++ b/arch/riscv/include/asm/clock_inlined.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_CLOCK_INLINED_H
+#define _ASM_RISCV_CLOCK_INLINED_H
+
+#include <asm/timex.h>
+
+struct clocksource;
+
+static __always_inline u64 arch_inlined_clocksource_read(struct clocksource *cs)
+{
+	return get_cycles64();
+}
+
+#endif
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index b310e6721fac..768e0d0eaeb0 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -96,7 +96,8 @@ static struct clocksource riscv_clocksource = {
 	.name		= "riscv_clocksource",
 	.rating		= 400,
 	.mask		= CLOCKSOURCE_MASK(64),
-	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
+	.flags		= CLOCK_SOURCE_IS_CONTINUOUS |
+			  CLOCK_SOURCE_CAN_INLINE_READ,
 	.read		= riscv_clocksource_rdtime,
 	.vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER,
 };
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
