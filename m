Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF37606A320
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 01:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lKEqSTyg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mliWifsE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+mU3+80NaRgl//KQXo/F0mGBMQPEb3/wHaT6ZD3+ZuU=; b=lKEqSTygGlNAgmHBpN6r3nytRi
	IFlzUD2TLDdu82YOAZoQZ4VjdJ6KsT7agbiOnCLRh0JV7Yx/fh4RoozkxE0ZvqENxKkPA14rB8wnA
	aUkTgmUawqa6vfk0cJAu+mbxXCb1M4rUqtIayPqSraQSUTslUjhWnu7BFw+5JrF3JdDG2Wt2UBNio
	4Q+lOKVh5iIIhW5ZSvA9e2uSS+5uTCSXs9m9Y0124okJPARouJvQGBFL8rdeoAwtiCcNEv4o4VcxX
	EmeLVnW83ASPcncWzK5qlz1KFV2COCfx/j/WC2BadcPPwV1eHo9kFChX4uiUJqr6MwklVRv+P7sNF
	Jd6/kTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDPc-0000000Dps1-1aFq;
	Fri, 20 Nov 2026 01:27:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDPb-0000000Dprr-0mgn
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 01:27:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 914C544866;
	Fri, 20 Nov 2026 01:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16211F000C4;
	Fri, 20 Nov 2026 01:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795138054;
	bh=uP51RJdgbbJaC7Ut67HTzDX7rHk2rGZZvFLYY2qw35k=;
	h=From:To:Cc:Subject:Date;
	b=mliWifsEoWZE1zqpx1Vu6OK+OXeR4QCj7U+ybaknK6U6MJaApyMqlQYXo2O1fi5E5
	 vaiykFvTNEQcvzoV+B5yUYF4zPCQM/yny41BWJoW6X/wUmp4Uvia910Z34LEQcQtTD
	 6Gwa9V2ROSE2xvRhMpLIEFyUAEQI3CrjOmk8Ve5zkz0t9ry6EEu8BJBacSaTg0ihPO
	 9f1gCJF0SxplACtA6HAj+3IsBG1g+1GkV0BlNzCP/H13y+25eZdpqCyNu/R14b++YX
	 q+MgkmoYa0q+6O+z5nysAE/bEjC4OGR1rKBEh6uEO5CUcVPqJHgDQhUGvN9Z2gL3Iu
	 Mr66+NFO9AJDA==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	arnd@arndb.de,
	fustini@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Leonardo Bras <leobras@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <me@ziyao.cc>,
	Chen Wang <unicorn_wang@outlook.com>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>,
	Paul Walmsley <pjw@kernel.org>
Subject: [PATCH V6] riscv: errata: Add ERRATA WRITE_ONCE fixup
Date: Thu, 19 Nov 2026 20:27:12 -0500
Message-Id: <20261120012712.1957564-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

The early version of XuanTie C910 core has a store merge buffer
delay problem. The store merge buffer could improve the store queue
performance by merging multi-store requests, but when there are not
continued store requests, the prior single store request would be
waiting in the store queue for a long time. That would cause
significant problems for communication between multi-cores. This
problem was found on sg2042 platform with the qspinlock lock torture
test.

So appending a fence w.o could immediately flush the store merge
buffer and let other cores see the write result.

This will apply the WRITE_ONCE errata to handle the non-standard
behavior via appending a fence w.o instruction for WRITE_ONCE().

This problem is only observed on the sg2042 hardware platform by
running the lock_torture test program for half an hour. The problem
was not found in the user space application, because interrupt can
break the livelock.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <gaohan@iscas.ac.cn>
Tested-by: Yao Zi <me@ziyao.cc>
Cc: Chen Wang <unicorn_wang@outlook.com>
Cc: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: Paul Walmsley <pjw@kernel.org>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
Changelog

v6:
 - Refine the title
 - Focus on SG2042 fixup
 - Rebase on v7.4-rc3

v5:
https://lore.kernel.org/linux-riscv/20260421143154.1590156-1-guoren@kernel.org/
 - Add Acked-by: Arnd Bergmann <arnd@arndb.de> for asm/generic
 - Add Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
 - Rebase on v7.0

v4:
https://lore.kernel.org/linux-riscv/20260412143116.1445893-1-guoren@kernel.org/
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
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 arch/riscv/Kconfig.errata                    | 17 ++++++++++
 arch/riscv/errata/thead/errata.c             | 20 ++++++++++++
 arch/riscv/include/asm/errata_list_vendors.h |  3 +-
 arch/riscv/include/asm/rwonce.h              | 34 ++++++++++++++++++++
 include/asm-generic/rwonce.h                 |  2 ++
 5 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/rwonce.h

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 4f77b3c6d7fd..331438bb5e0a 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -179,4 +179,21 @@ config ERRATA_THEAD_GHOSTWRITE
 
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
index 6f1c683f0ec0..64683882d50b 100644
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
index 02b5ab0d23a8..678cd0d42b42 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -19,7 +19,8 @@
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
