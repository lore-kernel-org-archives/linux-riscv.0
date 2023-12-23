Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47AAC47073
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYyT0ArHY5mFSORIb6giAiTlTdpTTXu09TQrSUe8ZLA=; b=gSiN18LVDGzPt6
	Zb2lm0A4MVDo1p8VcqIW5OOL1NOWe01pRwdgqfJZ4sN+5YIlc4CAjk9AIUNYi2nkkr4YHOuk2Vvba
	xMrAzzyoHpds9c7V0PE0le9kF85I7B7H6wGHUgthVyS8GOWv1qtbCx5JuTU4YurLHfsClciM48WvE
	4/KqiVmxUpFm2btzdGVMXRciJHVNp3cc3jVF97hstVRPeyE3v+8ZyRRphB6jUvb5abe45dn3qGDfv
	yPofksSTrze0LdRQsBLWeCJYYNsQ11zHL3IM1cjdgfYX/xaOt+stqEJMmYUB/kUgZAvQ7rXUKGnZ9
	fae/4MDu0zPwQklwgaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rH4V1-0088RR-32;
	Sat, 23 Dec 2023 16:05:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rH4Ux-0088Pv-1K
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 16:05:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC8B560B72;
	Sat, 23 Dec 2023 16:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAA3C433C8;
	Sat, 23 Dec 2023 16:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703347510;
	bh=9PwrcihFF5i7bY070ZxIROnCJMVZyvc9x7nf1yDV/Tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QTsd1xdhj0LqRZ2MgmYoGjWEEqLJbmKVgowayVJ83RFEE38PjtAEf+44jZP8EzkQG
	 Jjb9v+dvlONiF5uYgot39N5ERitQlH/cXWEdABAPR2sz8pudoLyzuxJtoOm6HnIPQk
	 a5W7QqkC+8oX/fjaJESoJeEHnv9X6osE2Mu9gIDMjFw7GUX0q9xVaqkuabOgH+Vd8z
	 lx1DXV3tTIDLOLBi7/jVN1TyRhOLgO6AOqBPqbJZgiXn6FIkKVAn7DnsgfsD4vwEOa
	 j0U/SW8P9Vuy+EvLOfUnfFFN0+6sOVyRBbStdXZc9Vffw7cdbbJln8FEd6vPeJE76b
	 OqctVbxiijVKA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qingfang DENG <dqfext@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Date: Sat, 23 Dec 2023 23:52:25 +0800
Message-Id: <20231223155226.4050-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231223155226.4050-1-jszhang@kernel.org>
References: <20231223155226.4050-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_080511_532180_6052F946 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

Some riscv implementations such as T-HEAD's C906, C908, C910 and C920
support efficient unaligned access, for performance reason we want
to enable HAVE_EFFICIENT_UNALIGNED_ACCESS on these platforms. To
avoid performance regressions on other non efficient unaligned access
platforms, HAVE_EFFICIENT_UNALIGNED_ACCESS can't be globally selected.

To solve this problem, runtime code patching based on the detected
speed is a good solution. But that's not easy, it involves lots of
work to modify vairous subsystems such as net, mm, lib and so on.
This can be done step by step.

So let's take an easier solution: add support to efficient unaligned
access and hide the support under NONPORTABLE.

Now let's introduce RISCV_EFFICIENT_UNALIGNED_ACCESS which depends on
NONPORTABLE, if users know during config time that the kernel will be
only run on those efficient unaligned access hw platforms, they can
enable it. Obviously, generic unified kernel Image shouldn't enable it.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig  | 12 ++++++++++++
 arch/riscv/Makefile |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 24c1799e2ec4..b91094ea53b7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -651,6 +651,18 @@ config RISCV_MISALIGNED
 	  load/store for both kernel and userspace. When disable, misaligned
 	  accesses will generate SIGBUS in userspace and panic in kernel.
 
+config RISCV_EFFICIENT_UNALIGNED_ACCESS
+	bool "Use unaligned access for some functions"
+	depends on NONPORTABLE
+	select HAVE_EFFICIENT_UNALIGNED_ACCESS
+	default n
+	help
+	  Say Y here if you want the kernel only run on hardware platforms which
+	  support efficient unaligned access, then unaligned access will be used
+	  in some functions for optimized performance.
+
+	  If unsure what to do here, say N.
+
 endmenu # "Platform type"
 
 menu "Kernel features"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index a74be78678eb..ebbe02628a27 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -108,7 +108,9 @@ KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
 # unaligned accesses.  While unaligned accesses are explicitly allowed in the
 # RISC-V ISA, they're emulated by machine mode traps on all extant
 # architectures.  It's faster to have GCC emit only aligned accesses.
+ifneq ($(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS),y)
 KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
+endif
 
 ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
 prepare: stack_protector_prepare
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
