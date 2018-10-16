Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB64C5ACC6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 21:43:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F020821471
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 21:43:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BbXdYC7I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hMjzKu6d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F020821471
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=u66kTxZVcq18wt4dTa20z+1QH/o2bmk/3Q8J+WjBEK8=; b=BbX
	dYC7Iu6AmooNs8vLHQLuEKSievwv1LVU3iFjnOfK4j9VvYc8Gp8TgjSWjeomjhkod7Ojny9AHebYo
	XH/I8o/WrBETHvxuiHdrVFIzE1XuVk3fDtKFfUZ7RRaz+psiNeyFThEqDWu+7rkgOFLy83YaD8rhw
	n+tvoHyrWE+SCrIJEWiRGaex2hQ+hvT7+jUeotXNa8Fjq8KqC6HKVTgelNJk6/aJMfYg5TYBpye2P
	61HPsk/R0W4VzmoFEYMe6UQJ1A7aLwPwAfr50UlCSaO0bCGFlCHHY1YCMDyNnkktNAHZN96WlxGA7
	VGyYgbAHqABheEQZqz6zbXkHf+tBc+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCX7h-0001bl-Qw; Tue, 16 Oct 2018 21:43:29 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCX7S-0001VD-MJ
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 21:43:26 +0000
Received: by mail-pg1-x543.google.com with SMTP id i4-v6so11456164pgq.9
 for <linux-riscv@lists.infradead.org>; Tue, 16 Oct 2018 14:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=sc8TZtNVp6OYutemi0Wg0uGYkNOhc+TPNYN/HyOmVBM=;
 b=hMjzKu6dH2l6La5VsH66Yao5Y4Xj8SVKlMa6qciZT41dSXt4cCSVmuY2QHyf2HliO2
 OALy3lqq9gP0RJPH6t1JB3BmTI2RECqjEmr1QmhS+NftrDI9B+UK3zl7PrBHE/H6uH0Z
 +4R5iqVWy0UaGiE0vbKB8s5hegfadgIq2xoHwposgFBK/iMidzKxPyvRxQt2NEq7DC1w
 VdZkgZ5rYqLqTFnwQuOCPC5Wpp9FGiJVPoj0isPbKJbw+4CsaDPmMTxME3R5ADoOB1TR
 oomtipF4sINctKRFxV7SDyawq8FtBd69Hkv1VvIUlhTZnlaGKcnKg1BbAhUsrdqeI/qs
 0hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sc8TZtNVp6OYutemi0Wg0uGYkNOhc+TPNYN/HyOmVBM=;
 b=AjNd3LpL3Y1Y4IKNbjVYke07k99ImmwCxSvu9ma7mT3PYot24uF5RinrV8E4yGMJ+B
 zupaUXeSYhTB38Fjs8WZwKJW5H/ivrJUupdO2JUvwKMhIn7o1n12uR8su/T9hx/6rabF
 HSkfbmAWdFabPdEf7b3Gg3hmNPPcAd5zFyq59hz+K4OgvOuh/weNXtjAM1Yh3mwikykG
 S7Xbvq6Bd3x78KT2FTbHI7Im9AZPsoSUrdKueoj4Z8v42LDG/Lx4uKC6M4d4ZGTXU+PY
 x5Eq7sfZkZnqRfupZkEysI0x3xe43hYjB20Xu3AMJYEamzHujnYgHf7GW3q6Llq+ZNjJ
 rCQg==
X-Gm-Message-State: ABuFfoj9ztBf/bN/SMA86T2X4i49P5lmIbWD81PJhr10JmIj9IfSW121
 Gh2JX6tRyMKv9YZVrRxUfM7IaJ+zaPc=
X-Google-Smtp-Source: ACcGV62LGPD0WiyxwmXeJVopykGzfzyyvBftDgwZOFtNCQXc3efrqCFyPN6wE53qH/13XqyhHrqg2A==
X-Received: by 2002:a62:454d:: with SMTP id
 s74-v6mr24528684pfa.136.1539726182788; 
 Tue, 16 Oct 2018 14:43:02 -0700 (PDT)
Received: from rohan.guest.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x20-v6sm25268570pfe.131.2018.10.16.14.43.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Oct 2018 14:43:01 -0700 (PDT)
From: Jim Wilson <jimw@sifive.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH, v2] RISC-V: Add futex support.
Date: Tue, 16 Oct 2018 14:42:59 -0700
Message-Id: <20181016214259.12063-1-jimw@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_144314_836882_34FAAC01 
X-CRM114-Status: GOOD (  15.33  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Jim Wilson <jimw@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016214259.GH-gq1BdQzHfXrBtu3EKU57r5vc4yg6iHcwdJBUatFE@z>

Updated as per sugestions from Christoph Hellwig.  As before, tested on a
HiFive Unleashed running fedora core 29 with a 4.15 based kernel against the
glibc testsuite and the futex wake_op testcase from
    https://lwn.net/Articles/148830/
14 glibc testcase failures are fixed by the patch, and the wake_op testcase
works with the patch.

This is a patch based off of a 4.19 tree.  The 4.15 patch is trivially
different as arch/riscv/Kconfig changed.  This patch was tested on qemu with
the glibc nptl/tst-cond-except testcase, and the wake_op testcase from above.

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 arch/riscv/Kconfig             |   1 +
 arch/riscv/include/asm/Kbuild  |   1 -
 arch/riscv/include/asm/futex.h | 127 +++++++++++++++++++++++++++++++++
 3 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/futex.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980287a5..093361e2298c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -31,6 +31,7 @@ config RISCV
 	select HAVE_MEMBLOCK
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_DMA_CONTIGUOUS
+	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_GENERIC_DMA_COHERENT
 	select HAVE_PERF_EVENTS
 	select IRQ_DOMAIN
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index efdbe311e936..6a646d9ea780 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -13,7 +13,6 @@ generic-y += errno.h
 generic-y += exec.h
 generic-y += fb.h
 generic-y += fcntl.h
-generic-y += futex.h
 generic-y += hardirq.h
 generic-y += hash.h
 generic-y += hw_irq.h
diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
new file mode 100644
index 000000000000..c594db8fd01c
--- /dev/null
+++ b/arch/riscv/include/asm/futex.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2006  Ralf Baechle (ralf@linux-mips.org)
+ * Copyright (c) 2018  Jim Wilson (jimw@sifive.com)
+ */
+
+#ifndef _ASM_FUTEX_H
+#define _ASM_FUTEX_H
+
+#ifndef CONFIG_RISCV_ISA_A
+/*
+ * Use the generic interrupt disabling versions if the A extension
+ * is not supported.
+ */
+#ifdef CONFIG_SMP
+#error "Can't support generic futex calls without A extension on SMP"
+#endif
+#include <asm-generic/futex.h>
+
+#else /* CONFIG_RISCV_ISA_A */
+
+#include <linux/futex.h>
+#include <linux/uaccess.h>
+#include <linux/errno.h>
+#include <asm/asm.h>
+
+#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
+{								\
+	uintptr_t tmp;						\
+	__enable_user_access();					\
+	__asm__ __volatile__ (					\
+	"1:	" insn "				\n"	\
+	"2:						\n"	\
+	"	.section .fixup,\"ax\"			\n"	\
+	"	.balign 4				\n"	\
+	"3:	li %[r],%[e]				\n"	\
+	"	jump 2b,%[t]				\n"	\
+	"	.previous				\n"	\
+	"	.section __ex_table,\"a\"		\n"	\
+	"	.balign " RISCV_SZPTR "			\n"	\
+	"	" RISCV_PTR " 1b, 3b			\n"	\
+	"	.previous				\n"	\
+	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
+	  [u] "+m" (*uaddr), [t] "=&r" (tmp)			\
+	: [op] "Jr" (oparg), [e] "i" (-EFAULT)			\
+	: "memory");						\
+	__disable_user_access();				\
+}
+
+static inline int
+arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
+{
+	int oldval = 0, ret = 0;
+
+	pagefault_disable();
+
+	switch (op) {
+	case FUTEX_OP_SET:
+		__futex_atomic_op("amoswap.w.aqrl %[ov],%z[op],%[u]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_ADD:
+		__futex_atomic_op("amoadd.w.aqrl %[ov],%z[op],%[u]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_OR:
+		__futex_atomic_op("amoor.w.aqrl %[ov],%z[op],%[u]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_ANDN:
+		__futex_atomic_op("amoand.w.aqrl %[ov],%z[op],%[u]",
+				  ret, oldval, uaddr, ~oparg);
+		break;
+	case FUTEX_OP_XOR:
+		__futex_atomic_op("amoxor.w.aqrl %[ov],%z[op],%[u]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	default:
+		ret = -ENOSYS;
+	}
+
+	pagefault_enable();
+
+	if (!ret)
+		*oval = oldval;
+
+	return ret;
+}
+
+static inline int
+futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
+			      u32 oldval, u32 newval)
+{
+	int ret = 0;
+	u32 val;
+	uintptr_t tmp;
+
+	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(u32)))
+		return -EFAULT;
+
+	__enable_user_access();
+	__asm__ __volatile__ (
+	"1:	lr.w.aqrl %[v],%[u]			\n"
+	"	bne %[v],%z[ov],3f			\n"
+	"2:	sc.w.aqrl %[t],%z[nv],%[u]		\n"
+	"	bnez %[t],1b				\n"
+	"3:						\n"
+	"	.section .fixup,\"ax\"			\n"
+	"	.balign 4				\n"
+	"4:	li %[r],%[e]				\n"
+	"	jump 3b,%[t]				\n"
+	"	.previous				\n"
+	"	.section __ex_table,\"a\"		\n"
+	"	.balign " RISCV_SZPTR "			\n"
+	"	" RISCV_PTR " 1b, 4b			\n"
+	"	" RISCV_PTR " 2b, 4b			\n"
+	"	.previous				\n"
+	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
+	: [ov] "Jr" (oldval), [nv] "Jr" (newval), [e] "i" (-EFAULT)
+	: "memory");
+	__disable_user_access();
+
+	*uval = val;
+	return ret;
+}
+
+#endif /* CONFIG_RISCV_ISA_A */
+#endif /* _ASM_FUTEX_H */
-- 
2.19.0.rc0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
