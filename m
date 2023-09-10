Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AE1EE57DF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoGZR26dfmmxgbDw9dkgx5ljCWayUbHyTP3uAdGmJ3s=; b=4e7TjvrqeueuJe
	yS7GPKcB2c0My33WAWxdKHARMKiAWDxbEJuxOBDB861BEvQYLQrGMKRmhy5dPCRCYIlGd9ICIb/gw
	EuEcpb828S3tbNc65MC6EW0Stgc0pneoJYLpU1VZDgShMVAls3jxzZuSM7SaALGEDXumE+QAHe1hM
	cs/8CJqIi5bVe7R5/0Gep3KX4Mb1K6QKCfetg5gG2s86KewY4L2qKRbMGjhyX7wKBugb+UhhfFbBJ
	l+0Y1z6Er/cOrtqe2F4r/xqQgaUN16WNLK3MGrC8hKeRmZvrSyDREKhFxd5NQjBmf1YqS2uwZ17HW
	5m6xLEra4onwdTmfD/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqa-00GHxM-0o;
	Sun, 10 Sep 2023 08:31:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqX-00GHs3-0R
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 08:31:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8789CCE0A28;
	Sun, 10 Sep 2023 08:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA79C43395;
	Sun, 10 Sep 2023 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694334662;
	bh=3murlTvGUwbnyKtHCIZhxZPJhHjJerN3MgRLx0eVQ7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSYpp5ajmtaC1ah1CnQFUyhv+4DzJG5aRRFple1r1te7W7gYezMHBYFQm96quOKmJ
	 Kt9xrYZkiICPPMf9RCONHwdEe74PP0agYfojznBtsRenXfwJP/BjM45e86IGakjq5s
	 qCQVTr4ZgFzMzBSrNJuXnFoqrcmHV3u6DKwF10hZ7RO0HIHjbfgSkMcR7mPsBmVJSe
	 gZYRKdNdsKpW3ZZxXCVJe1/j1ZnGIqWmhOc8KN65rLumWFNOr1WGxpIEhYT4Csn4qm
	 pS/0vY+vjU2WoBXUZ+DqdzBOCvehB/RFYvqI7xSvSZ0eDQAQqyc5SVb6n2vFzN35+A
	 kqdARpTOsJNCQ==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	anup@brainfault.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	palmer@rivosinc.com,
	longman@redhat.com,
	boqun.feng@gmail.com,
	tglx@linutronix.de,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	rdunlap@infradead.org,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	keescook@chromium.org,
	greentime.hu@sifive.com,
	ajones@ventanamicro.com,
	jszhang@kernel.org,
	wefu@redhat.com,
	wuwei2016@iscas.ac.cn,
	leobras@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V11 09/17] riscv: qspinlock: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
Date: Sun, 10 Sep 2023 04:29:03 -0400
Message-Id: <20230910082911.3378782-10-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230910082911.3378782-1-guoren@kernel.org>
References: <20230910082911.3378782-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_013109_534128_67AED150 
X-CRM114-Status: GOOD (  18.82  )
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

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig.errata              | 19 +++++++++++++++++++
 arch/riscv/errata/thead/errata.c       | 20 ++++++++++++++++++++
 arch/riscv/include/asm/errata_list.h   | 13 -------------
 arch/riscv/include/asm/rwonce.h        | 24 ++++++++++++++++++++++++
 arch/riscv/include/asm/vendorid_list.h | 14 ++++++++++++++
 include/asm-generic/rwonce.h           |  2 ++
 6 files changed, 79 insertions(+), 13 deletions(-)
 create mode 100644 arch/riscv/include/asm/rwonce.h

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 1aa85a427ff3..c919cc3f1a3a 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -77,4 +77,23 @@ config ERRATA_THEAD_PMU
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_THEAD_WRITE_ONCE
+	bool "Apply T-Head WRITE_ONCE errata"
+	depends on ERRATA_THEAD
+	default y
+	help
+	  The early version of T-Head C9xx cores has a store merge buffer
+	  delay problem. The store merge buffer could improve the store queue
+	  performance by merging multi-store requests, but when there are no
+	  continued store requests, the prior single store request would be
+	  waiting in the store queue for a long time. That would cause
+	  significant problems for communication between multi-cores. Appending
+	  a fence w.o could immediately flush the store merge buffer and let
+	  other cores see the write result.
+
+	  This will apply the WRITE_ONCE errata to handle the non-standard
+	  behavior via appending a fence w.o instruction for WRITE_ONCE().
+
+	  If you don't know what to do here, say "Y".
+
 endmenu # "CPU errata selection"
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index be84b14f0118..751eb5a7f614 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -69,6 +69,23 @@ static bool errata_probe_pmu(unsigned int stage,
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
@@ -83,6 +100,9 @@ static u32 thead_errata_probe(unsigned int stage,
 	if (errata_probe_pmu(stage, archid, impid))
 		cpu_req_errata |= BIT(ERRATA_THEAD_PMU);
 
+	if (errata_probe_write_once(stage, archid, impid))
+		cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
+
 	return cpu_req_errata;
 }
 
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 712cab7adffe..fbb2b8d39321 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -11,19 +11,6 @@
 #include <asm/hwcap.h>
 #include <asm/vendorid_list.h>
 
-#ifdef CONFIG_ERRATA_SIFIVE
-#define	ERRATA_SIFIVE_CIP_453 0
-#define	ERRATA_SIFIVE_CIP_1200 1
-#define	ERRATA_SIFIVE_NUMBER 2
-#endif
-
-#ifdef CONFIG_ERRATA_THEAD
-#define	ERRATA_THEAD_PBMT 0
-#define	ERRATA_THEAD_CMO 1
-#define	ERRATA_THEAD_PMU 2
-#define	ERRATA_THEAD_NUMBER 3
-#endif
-
 #ifdef __ASSEMBLY__
 
 #define ALT_INSN_FAULT(x)						\
diff --git a/arch/riscv/include/asm/rwonce.h b/arch/riscv/include/asm/rwonce.h
new file mode 100644
index 000000000000..be0b8864969d
--- /dev/null
+++ b/arch/riscv/include/asm/rwonce.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_RWONCE_H
+#define __ASM_RWONCE_H
+
+#include <linux/compiler_types.h>
+#include <asm/alternative-macros.h>
+#include <asm/vendorid_list.h>
+
+#define __WRITE_ONCE(x, val)				\
+do {							\
+	*(volatile typeof(x) *)&(x) = (val);		\
+	asm volatile(ALTERNATIVE(			\
+		__nops(1),				\
+		"fence w, o\n\t",			\
+		THEAD_VENDOR_ID,			\
+		ERRATA_THEAD_WRITE_ONCE,		\
+		CONFIG_ERRATA_THEAD_WRITE_ONCE)		\
+		: : : "memory");			\
+} while (0)
+
+#include <asm-generic/rwonce.h>
+
+#endif	/* __ASM_RWONCE_H */
diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index cb89af3f0704..73078cfe4029 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -8,4 +8,18 @@
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
+#ifdef CONFIG_ERRATA_SIFIVE
+#define	ERRATA_SIFIVE_CIP_453 0
+#define	ERRATA_SIFIVE_CIP_1200 1
+#define	ERRATA_SIFIVE_NUMBER 2
+#endif
+
+#ifdef CONFIG_ERRATA_THEAD
+#define	ERRATA_THEAD_PBMT 0
+#define	ERRATA_THEAD_CMO 1
+#define	ERRATA_THEAD_PMU 2
+#define	ERRATA_THEAD_WRITE_ONCE 3
+#define	ERRATA_THEAD_NUMBER 4
+#endif
+
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
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
