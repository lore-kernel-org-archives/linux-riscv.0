Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77B7E937E4
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Apr 2026 14:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cYOliUi+cV1s/F5sPV2yq0JHvIv+CMB2ITSaowHXbco=; b=SQ0viMbvemPXCV
	JzDm3X3ODX/wjhRhZu177aRqIcFdfTnSAEU18k4USSTANQ0KA+yvD8D1hT50PIMLmCG3B3mkUL1NS
	KBXlFavsfNlTqfywIMitTZqqWBr8x7vFVsyTVAXwWDq9ZbHRur9WJM1vxfXBYo20xwYuvYFBvzEt5
	RtntEnTZWwo+4RmfJwRduBX6PSNFfNNsfAgvzBai8iJUeZ3G9CAbsUKDNEcVuydl+yMJFRdeiDoBt
	x3JRb+ZQZVYMpYsZNmLlUIGGjkhv2Vwhy/nr76HVGVFM+tcsqQR9gdEUGBhTqkveMY5aJ1hx3JTtX
	u+fCfXZDLgikH343tQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvqf-0000000EODB-0zJK;
	Sun, 12 Apr 2026 14:31:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvqd-0000000EOD2-2ipn
	for linux-riscv@lists.infradead.org;
	Sun, 12 Apr 2026 14:31:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2E456014B;
	Sun, 12 Apr 2026 14:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9DFC19424;
	Sun, 12 Apr 2026 14:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776004298;
	bh=SF5gRZTiQIKtAwMND3nOchDORDvcOkpMM3V6FGK1+co=;
	h=From:To:Cc:Subject:Date:From;
	b=nzNF/iha/Vbvzp81e8LDFFUr+2OWcZKJcO7MwA0L1kKuBCKKtloT+/tqqcPcVC7aT
	 R0nsQ5ozsrevY8rlDBkchY7w+f1pBuv2HRHu8QD8DlbDai+gcjEApZwp1KIvaGJUTa
	 253fTLraFQceDsu26MnA07HtvdsiPt/cmCEf+O6R+XcKrwt52M+pctP6IWr0kIf/IB
	 ga/RkAhl/B/h3Jbfi3sRAN00pOL8Rxs9bJ4yL3uPhPIbRbrqNR7zvPr6LQdkOVE7qM
	 6Sck+G7QetBdpjmaZ1z0b+jsBmIGD82+ZTutIJOtWQCpY6XztpPFXtyuLD7uWIl2vm
	 Ze7Frgqi1fI+Q==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	alex@ghiti.fr,
	leobras@redhat.com,
	djordje.todorovic@htecgroup.com,
	aleksa.paunovic@htecgroup.com,
	arnd@arndb.de,
	rabenda.cn@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <me@ziyao.cc>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>,
	Paul Walmsley <pjw@kernel.org>
Subject: [PATCH V4] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
Date: Sun, 12 Apr 2026 10:31:16 -0400
Message-Id: <20260412143116.1445893-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

The early version of XuanTie C910 core has a store merge buffer
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Han Gao <gaohan@iscas.ac.cn>
Tested-by: Yao Zi <me@ziyao.cc>
Cc: Chen Wang <unicorn_wang@outlook.com>
Cc: Inochi Amaoto <inochiama@gmail.com>
Cc: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: Paul Walmsley <pjw@kernel.org>
Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
Changelog

v4:
 - Add Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
   (https://lore.kernel.org/linux-riscv/1cfdf6c1-a384-43ad-9588-284335d073f7@ghiti.fr/)
 - Add Tested-by: Yao Zi <me@ziyao.cc>
 - Rebase on v7.0-rc7

v3:
https://lore.kernel.org/linux-riscv/20260125063941.443777-1-guoren@kernel.org/
 - Rebase on 6.19-rc6.
 - Remove errata_list_vendors patch which has been merged.
 - Add Tested-by tag.

v2:
https://lore.kernel.org/linux-riscv/20250713155321.2064856-1-guoren@kernel.org/
 - Add new header file for errata_list_vendors.
 - Rebase newest kernel version.

v1:
https://lore.kernel.org/all/20241214143039.4139398-1-guoren@kernel.org/
---
 arch/riscv/Kconfig.errata                    | 17 ++++++++++
 arch/riscv/errata/thead/errata.c             | 20 ++++++++++++
 arch/riscv/include/asm/errata_list_vendors.h |  3 +-
 arch/riscv/include/asm/rwonce.h              | 34 ++++++++++++++++++++
 include/asm-generic/rwonce.h                 |  2 ++
 5 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/rwonce.h

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3c945d086c7d..4d3f13522da6 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -154,4 +154,21 @@ config ERRATA_THEAD_GHOSTWRITE
 
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
 endmenu # "CPU errata selection"
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 0b942183f708..fbe46f2fa8fb 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -168,6 +168,23 @@ static bool errata_probe_ghostwrite(unsigned int stage,
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
@@ -183,6 +200,9 @@ static u32 thead_errata_probe(unsigned int stage,
 
 	errata_probe_ghostwrite(stage, archid, impid);
 
+	if (errata_probe_write_once(stage, archid, impid))
+		cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
+
 	return cpu_req_errata;
 }
 
diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
index ec7eba373437..8fd7c36307e2 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -18,7 +18,8 @@
 #define	ERRATA_THEAD_MAE 0
 #define	ERRATA_THEAD_PMU 1
 #define	ERRATA_THEAD_GHOSTWRITE 2
-#define	ERRATA_THEAD_NUMBER 3
+#define	ERRATA_THEAD_WRITE_ONCE 3
+#define	ERRATA_THEAD_NUMBER 4
 #endif
 
 #ifdef CONFIG_ERRATA_MIPS
diff --git a/arch/riscv/include/asm/rwonce.h b/arch/riscv/include/asm/rwonce.h
new file mode 100644
index 000000000000..081793d4d772
--- /dev/null
+++ b/arch/riscv/include/asm/rwonce.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_RWONCE_H
+#define __ASM_RWONCE_H
+
+#include <linux/compiler_types.h>
+#include <asm/alternative-macros.h>
+#include <asm/vendorid_list.h>
+#include <asm/errata_list_vendors.h>
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
diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index 52b969c7cef9..4e2d941f15a1 100644
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
