Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F185EC6787C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 20:04:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96BA620868
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 20:04:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hHp6SiJ9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fbSFmjp8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96BA620868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vcHIl86MU4BjWQskS93ziPrnTc9v23ZOBMo2vZh6jEU=; b=hHp
	6SiJ9B8AtaHzuqUiGeGyW44BfGKK0O1DG6LZ6V679ON7jBEk94l36x1KiffrD2LXvExKnmlqxSLeV
	KtZxvEw/Jx7hcAEK+nrHg7GeJ5kON8Gm52cfvoc3Cop2uiLOYPLT0g1iMD9jBhlGp4JKCAKjDNIM/
	jeJaLDjCDJ3ozqfPg7pmbsbD2pSx3o+bb0aTsMK78byXNAXctTnWYM2fnJ6Wd76nYSkDIIRikS5OT
	+U10h02p7oV//kp2DXz8mllKoxoLtjIaaT+wU7BEZ9leTb/jgdkIm3jZtjgYJfOl6eRh0BxXtmF4U
	XYWvh9Iy8KxVrtDHsOfbyPjgxsQiAng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB3fN-0005K2-Kt; Fri, 12 Oct 2018 20:04:09 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB3fK-0005Iq-Od
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 20:04:09 +0000
Received: by mail-pf1-x444.google.com with SMTP id r9-v6so6700096pff.11
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 13:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=ff2lmux7mfrChAsbcFnFTGPnKv6j0pqjQJJW8ppuj3A=;
 b=fbSFmjp8lEu/hgHy5Es96Lla4bTe3KL5a+T6zUmuaYjep3rDL4a49oYmwnmdstTUPS
 p8nHDKT56hyJSeyFtuS1/YTmSQ6UfYY7xWPrVvtiG9bAldTqoEQ+ohivPoMEsJUzMzvO
 Vs5L6xlKa5V4dfYNVJQvrl28N1+PLd1eV07UzbuEkA7iaHA5C8hl6XqSMOhhlHF72wL5
 8vAWxz6uB54+w3N00NM1lX7baQKjfuifBim/iu9sluQwok4JZF2sjXiDK3W3thF0WPng
 EtRI3tT7MwC/dhDqROqii5yLvpuCSqkAKft/pCV6ilgG8i6xRz6+L2lT+OG99Icr8xRI
 3dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ff2lmux7mfrChAsbcFnFTGPnKv6j0pqjQJJW8ppuj3A=;
 b=SoY6mQUgn9OR0yLxVH6o1VqABYXHT9U8TzHeWbkmfZxpwFIkBW4OaoNXkOGvKYdSmu
 j/qfgBglV4YlugnIpSQjt9f4WXHtG5t5RA4QV8EQNos0ueGNmqaa+SbVVWFAyaYHpJ/J
 fNZ9hHyaUYYyC0+lnesXiulyPpSTjVNk8zUNUQExOPn/PvK8mtNxcfkXHymoiKxhJBDT
 LMZ/aU+oSUdTwwyy6Tu7iOglIoUA5ybValbB4TS7HpLAs8tqH6ZLppaEocRAgM7NaNIt
 arfHGgzXv4qgFEebCNnToKuoK1rR0hD2eEfMd33dNKjqBI7zpyU6KunNlZgDrBu0BBfM
 +BjA==
X-Gm-Message-State: ABuFfoi/O9oMC4f12DetA1Ij7i8XBojj5GmRC0hL82A33R2cC8nZSCt1
 H0m1Kg5EhCGtXPSEINAgjXuFnjbqi/Y=
X-Google-Smtp-Source: ACcGV63/fsAnNELAoy09NLuwlUhng+d6kdnpLATDFRvpls/Yi2z33ee1sp3MnhQUR1DkFJO53M6UCA==
X-Received: by 2002:a63:c306:: with SMTP id
 c6-v6mr6792586pgd.133.1539374635368; 
 Fri, 12 Oct 2018 13:03:55 -0700 (PDT)
Received: from rohan.guest.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i5-v6sm2882548pfo.107.2018.10.12.13.03.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Oct 2018 13:03:54 -0700 (PDT)
From: Jim Wilson <jimw@sifive.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: Add futex support.
Date: Fri, 12 Oct 2018 13:03:50 -0700
Message-Id: <20181012200350.5258-1-jimw@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_130406_852170_330E9B7E 
X-CRM114-Status: GOOD (  20.45  )
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
Message-ID: <20181012200350.2QoFJgxMbYF-lnTeGFvywNLRiqOYYEbVGAhJgrwCy_o@z>

Here is an attempt to add the missing futex support.  I started with the MIPS
version of futex.h and modified it until I got it working.  I tested it on
a HiFive Unleashed running Fedora Core 29 using the fc29 4.15 version of the
kernel.  This was tested against the glibc testsuite, where it fixes 14 nptl
related testsuite failures.  That unfortunately only tests the cmpxchg support,
so I also used the testcase at the end of
   https://lwn.net/Articles/148830/
which tests the atomic_op functionality, except that it doesn't verify that
the operations are atomic, which they obviously are.  This testcase runs
successfully with the patch and fails without it.

I'm not a kernel expert, so there could be details I got wrong here.  I wasn't
sure about the memory model support, so I used aqrl which seemed safest, and
didn't add fences which seemed unnecessary.  I'm not sure about the copyright
statements, I left in Ralf Baechle's line because I started with his code.
Checkpatch reports some style problems, but it is the same style as the MIPS
futex.h, and the uses of ENOSYS appear correct even though it complains about
them.  I don't know if any of that matters.

Jim

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 arch/riscv/include/asm/futex.h | 129 +++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 arch/riscv/include/asm/futex.h

diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
new file mode 100644
index 000000000000..f36ccceda762
--- /dev/null
+++ b/arch/riscv/include/asm/futex.h
@@ -0,0 +1,129 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (c) 2006  Ralf Baechle (ralf@linux-mips.org)
+ * Copyright (c) 2018  Jim Wilson (jimw@sifive.com)
+ */
+#ifndef _ASM_FUTEX_H
+#define _ASM_FUTEX_H
+
+#ifdef __KERNEL__
+
+#include <linux/futex.h>
+#include <linux/uaccess.h>
+#include <asm/errno.h>
+#include <asm/asm.h>
+
+#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)		\
+{									\
+	uintptr_t __tmp;						\
+	if (__riscv_atomic) {						\
+		__enable_user_access();					\
+		__asm__ __volatile__ (					\
+		"1:	" insn "				\n"	\
+		"2:						\n"	\
+		"	.section .fixup,\"ax\"			\n"	\
+		"	.balign 4				\n"	\
+		"3:	li %0,%5				\n"	\
+		"	jump 2b,%3				\n"	\
+		"	.previous				\n"	\
+		"	.section __ex_table,\"a\"		\n"	\
+		"	.balign " RISCV_SZPTR "			\n"	\
+		"	" RISCV_PTR " 1b, 3b			\n"	\
+		"	.previous				\n"	\
+		: "+r" (ret), "=&r" (oldval),				\
+		  "+m" (*uaddr), "=&r" (__tmp)				\
+		: "Jr" (oparg), "i" (-EFAULT)				\
+		: "memory");						\
+		__disable_user_access();				\
+	} else {							\
+		ret = -ENOSYS;						\
+	}								\
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
+		__futex_atomic_op("amoswap.w.aqrl %1,%z4,%2",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_ADD:
+		__futex_atomic_op("amoadd.w.aqrl %1,%z4,%2",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_OR:
+		__futex_atomic_op("amoor.w.aqrl %1,%z4,%2",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_ANDN:
+		__futex_atomic_op("amoand.w.aqrl %1,%z4,%2",
+				  ret, oldval, uaddr, ~oparg);
+		break;
+	case FUTEX_OP_XOR:
+		__futex_atomic_op("amoxor.w.aqrl %1,%z4,%2",
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
+	uintptr_t __tmp;
+
+	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(u32)))
+		return -EFAULT;
+
+	if (__riscv_atomic) {
+		__enable_user_access();
+		__asm__ __volatile__ (
+		"1:	lr.w.aqrl %1,%4				\n"
+		"	bne %1,%z5,3f				\n"
+		"2:	sc.w.aqrl %3,%z6,%2			\n"
+		"	bnez %3,1b				\n"
+		"3:						\n"
+		"	.section .fixup,\"ax\"			\n"
+		"	.balign 4				\n"
+		"4:	li %0,%7				\n"
+		"	jump 3b,%3				\n"
+		"	.previous				\n"
+		"	.section __ex_table,\"a\"		\n"
+		"	.balign " RISCV_SZPTR "			\n"
+		"	" RISCV_PTR " 1b, 4b			\n"
+		"	" RISCV_PTR " 2b, 4b			\n"
+		"	.previous				\n"
+		: "+r" (ret), "=&r" (val), "=m" (*uaddr), "=&r" (__tmp)
+		: "m" (*uaddr), "Jr" (oldval), "Jr" (newval),
+		  "i" (-EFAULT)
+		: "memory");
+		__disable_user_access();
+	} else {
+		ret = -ENOSYS;
+	}
+
+	*uval = val;
+	return ret;
+}
+
+#endif
+#endif /* _ASM_FUTEX_H */
-- 
2.19.0.rc0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
