Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06978C47073
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 04:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/kzLxNo6GEupESKE6nMX6BB6P++jJo3wGDJhppa5EU=; b=HB2npeKLOtzm3C
	oFNr9a0kUDQBPHMRj/TgiZtooSi7KTEIqhJvnCzE14Xub/JThk4G4NN4PNz8Pne37IrNLURWQkCFJ
	F92r6BDe2J7UtrD8gY8Y31K566GWSqhhsiFw2lcukXq8qJ/L3IkwBp/mR1jhLtm8SYUuaOz0iJUSa
	bl4E48YidJSawQQ6qi9169lqRTGK0DI2JbAsBB1N/xbYCYeJaOH712pEmo5i7H0lnfEZO7hPaRBzP
	JVNbYwZeD0XR+w/tiLm1sQdxr4b0pzlfSYLZn/jne3raLNz3WYghDYTgMapEwlZPle1LgBlkIXvbg
	FZuJQQUm+0M8Z3xpjpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHczX-00ADBA-2O;
	Mon, 25 Dec 2023 04:55:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHczT-00AD96-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 25 Dec 2023 04:55:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1C5F1B80B13;
	Mon, 25 Dec 2023 04:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D88DC433C9;
	Mon, 25 Dec 2023 04:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703480094;
	bh=joYODQQgM8OQwgZYoqPwgCmKzSHGbsW2er2Qt7q5rp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ApSX89aVjmgqbdkXyq2u5pLTi4jiZQPcbWieu08zEKDV+Dph9ImzxtwcsGt5gy8wr
	 /TPfe/Cqs8k7g5QxPltEkToGICEHusdBwH+BW/P4QGyTWlikiQ+KV91UxOhnGwtY3c
	 62T/Ms8cCCjpthMdr1c7uRPwAwhn6ga8kJFq/mbyljdf+t9cOOAkO4wdcsp6ehWHg1
	 eLDPnILHE/41GJwESFN4SoIiwr26rVqsjG9I4d/50ZVfoarK04qEswNR7OvVSUPl3x
	 ORk0R8hDtobKogJ4ISI9Ei8kZKGWfBcjKtMXq0H6NRCViLC1l6L9fSyImDeQ/TOicW
	 AbSrAHslZGDZA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Qingfang DENG <dqfext@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Date: Mon, 25 Dec 2023 12:42:06 +0800
Message-Id: <20231225044207.3821-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231225044207.3821-1-jszhang@kernel.org>
References: <20231225044207.3821-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_205500_149623_CBDBAA50 
X-CRM114-Status: GOOD (  11.55  )
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
 arch/riscv/Kconfig  | 13 +++++++++++++
 arch/riscv/Makefile |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 24c1799e2ec4..afcc5fdc16f7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -651,6 +651,19 @@ config RISCV_MISALIGNED
 	  load/store for both kernel and userspace. When disable, misaligned
 	  accesses will generate SIGBUS in userspace and panic in kernel.
 
+config RISCV_EFFICIENT_UNALIGNED_ACCESS
+	bool "Assume the CPU supports fast unaligned memory accesses"
+	depends on NONPORTABLE
+	select HAVE_EFFICIENT_UNALIGNED_ACCESS
+	help
+	  Say Y here if you want the kernel to assume that the CPU supports
+	  efficient unaligned memory accesses.  When enabled, this option
+	  improves the performance of the kernel on such CPUs.  However, the
+	  kernel will run much more slowly, or will not be able to run at all,
+	  on CPUs that do not support efficient unaligned memory accesses.
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
