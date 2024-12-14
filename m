Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD260E77180
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0B2m4pBWEBHczCgBz2fJBAuGQRisx78JfwNqmUvE20=; b=4GdbwgHiUWyv8b
	/7kBjYtaAcjS6VpVviwwMsvPJyqOYUIy8/wIxsBi8dGPfWl90K61mBa446WvwJbPZouKPaWeWYY00
	1K5mfOZoOjixf1S6feAfbEnnM6EAUVIcSgjECsA89RuovhR4S8KsfuT+6kM3eV316Hy4uxKCuJRTW
	hg647E9YqOtrzbOuvwPyl+aMBNZm83MLQbEDRZp15tz10jnmAn34Aob71IdVJjMYRDPEGH4DdiudF
	4nFw7woKqT97mv4iXK1DNYII5JPlrTsU1eO+NbB9TSzH4G8buHI2bhu65HuC2o8m2CpUHu/zqE3XX
	zLHXpgrm9P2sRLYXzB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTAr-00000006TcO-0bMO;
	Sat, 14 Dec 2024 14:31:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTAn-00000006TbA-46ey
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 14:31:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC8F65C5417;
	Sat, 14 Dec 2024 14:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2003C4CEDD;
	Sat, 14 Dec 2024 14:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734186671;
	bh=XWUteO3SqMG/DN0BQHorRffvVPXz/LZp5O3E/i63ktg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bUB6iXb6cbmAWcen6sVFe3VD2gazkdFV/uki2HBxmK3ZHR2T9oyz3agBpuoA2ToMC
	 /6rsDJCMKS1cFGAsMcl8A7zeCowp3Bk4OqJ05BqgXz5R2cvZ4wAhLerRcbbhQ9MW0h
	 wSzoJyeAt3AwqFPB011i2iujgh4xuYAaPaXA5RMSev/AgJcVUlpOPq6fml0YILXyBC
	 w7di9suHC8rrKUigPKPnJ0JfIcT5tyTCbNKoDL70bv5jkrm5CI48XDC+ubstOmZ/qE
	 0F/IhtJgc1s6YKwLxugv3q+v7hWole8k9PGnwkGg06iGuUAfa7TTAkZM3O5D3zgMwQ
	 e/Lym/7x67HrA==
From: guoren@kernel.org
To: guoren@kernel.org,
	conor@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	bjorn@rivosinc.com,
	leobras@redhat.com,
	corbet@lwn.net,
	peterlin@andestech.com,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 2/2] riscv: qspinlock: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
Date: Sat, 14 Dec 2024 09:30:39 -0500
Message-Id: <20241214143039.4139398-3-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241214143039.4139398-1-guoren@kernel.org>
References: <20241214143039.4139398-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_063114_103200_1ACBB111 
X-CRM114-Status: GOOD (  18.87  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The early version of T-Head C9xx cores has a store merge buffer
delay problem. The store merge buffer could improve the store queue
performance by merging multi-store requests, but when there are not
continued store requests, the prior single store request would be
waiting in the store queue for a long time. That would cause
significant problems for communication between multi-cores. This
problem was found on sg2042 & th1520 platforms with the qspinlock
lock torture test.

So appending a fence w.o could immediately flush the store merge
buffer and let other cores see the write result.

This will apply the WRITE_ONCE errata to handle the non-standard
behavior via appending a fence w.o instruction for WRITE_ONCE().

This problem is only observed on the sg2042 hardware platform by
running the lock_torture test program for half an hour. The problem
was not found in the user space application, because interrupt can
break the livelock.

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig.errata              | 19 +++++++++++++++
 arch/riscv/errata/thead/errata.c       | 20 ++++++++++++++++
 arch/riscv/include/asm/rwonce.h        | 33 ++++++++++++++++++++++++++
 arch/riscv/include/asm/vendorid_list.h |  3 ++-
 include/asm-generic/rwonce.h           |  2 ++
 5 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/rwonce.h

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 2acc7d876e1f..fd6ba85b7a72 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -119,4 +119,23 @@ config ERRATA_THEAD_PMU
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_THEAD_WRITE_ONCE
+	bool "Apply T-Head WRITE_ONCE errata"
+	depends on ERRATA_THEAD
+	default y
+	help
+	  The early version of T-Head C9xx cores of sg2042 & th1520 have a store
+	  merge buffer delay problem. The store merge buffer could improve the
+	  store queue performance by merging multi-store requests, but when there
+	  are no continued store requests, the prior single store request would be
+	  waiting in the store queue for a long time. That would cause signifi-
+	  cant problems for communication between multi-cores. Appending a
+	  fence w.o could immediately flush the store merge buffer and let other
+	  cores see the write result.
+
+	  This will apply the WRITE_ONCE errata to handle the non-standard beh-
+	  avior via appending a fence w.o instruction for WRITE_ONCE().
+
+	  If you don't know what to do here, say "Y".
+
 endmenu # "CPU errata selection"
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index e24770a77932..dd41f0221fe9 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -142,6 +142,23 @@ static bool errata_probe_pmu(unsigned int stage,
 	return true;
 }
 
+static bool errata_probe_write_once(unsigned int stage,
+				    unsigned long arch_id, unsigned long impid)
+{
+	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_WRITE_ONCE))
+		return false;
+
+	/* target-c9xx cores report arch_id and impid as 0 */
+	if (arch_id != 0 || impid != 0)
+		return false;
+
+	if (stage == RISCV_ALTERNATIVES_BOOT ||
+	    stage == RISCV_ALTERNATIVES_MODULE)
+		return true;
+
+	return false;
+}
+
 static u32 thead_errata_probe(unsigned int stage,
 			      unsigned long archid, unsigned long impid)
 {
@@ -155,6 +172,9 @@ static u32 thead_errata_probe(unsigned int stage,
 	if (errata_probe_pmu(stage, archid, impid))
 		cpu_req_errata |= BIT(ERRATA_THEAD_PMU);
 
+	if (errata_probe_write_once(stage, archid, impid))
+		cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
+
 	return cpu_req_errata;
 }
 
diff --git a/arch/riscv/include/asm/rwonce.h b/arch/riscv/include/asm/rwonce.h
new file mode 100644
index 000000000000..756586746a4f
--- /dev/null
+++ b/arch/riscv/include/asm/rwonce.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_RWONCE_H
+#define __ASM_RWONCE_H
+
+#include <linux/compiler_types.h>
+#include <asm/alternative-macros.h>
+#include <asm/vendorid_list.h>
+
+#if defined(CONFIG_ERRATA_THEAD_WRITE_ONCE) && !defined(NO_ALTERNATIVE)
+
+#define write_once_fence()				\
+do {							\
+	asm volatile(ALTERNATIVE(			\
+		"nop",					\
+		"fence w, o",				\
+		THEAD_VENDOR_ID,			\
+		ERRATA_THEAD_WRITE_ONCE,		\
+		CONFIG_ERRATA_THEAD_WRITE_ONCE)		\
+		: : : "memory");			\
+} while (0)
+
+#define __WRITE_ONCE(x, val)				\
+do {							\
+	*(volatile typeof(x) *)&(x) = (val);		\
+	write_once_fence();				\
+} while (0)
+
+#endif /* defined(CONFIG_ERRATA_THEAD_WRITE_ONCE) && !defined(NO_ALTERNATIVE) */
+
+#include <asm-generic/rwonce.h>
+
+#endif	/* __ASM_RWONCE_H */
diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 7a387368633a..d5a6e3963feb 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -23,7 +23,8 @@
 #ifdef CONFIG_ERRATA_THEAD
 #define	ERRATA_THEAD_MAE 0
 #define	ERRATA_THEAD_PMU 1
-#define	ERRATA_THEAD_NUMBER 2
+#define	ERRATA_THEAD_WRITE_ONCE 2
+#define	ERRATA_THEAD_NUMBER 3
 #endif
 
 #endif
diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index 8d0a6280e982..fb07fe8c6e45 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -50,10 +50,12 @@
 	__READ_ONCE(x);							\
 })
 
+#ifndef __WRITE_ONCE
 #define __WRITE_ONCE(x, val)						\
 do {									\
 	*(volatile typeof(x) *)&(x) = (val);				\
 } while (0)
+#endif
 
 #define WRITE_ONCE(x, val)						\
 do {									\
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
