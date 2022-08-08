Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B48C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 08:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/uf12JHst5C/m21xzJq7//WvXWJUyVccPKuE5/jwlE=; b=xj+0dlfW16sg7Y
	s9mYMQW9PSgs+kbmBYFWo9xVl9fXV+Q5dfhkIJz5ZKmIZQFAbYg9flkr0qeJ0yJsLLKN4gKwxalv5
	rGUiJtrnREsSLDAPOxLjDQ8m94Yx+085b4O6vhxVM0RRj+CbS9heOPwyOw8hEwyvH0DEKtxepla18
	YeEX3MazXnH+RTTelc9cWhbgBaVs41KpzNylSxRCkSH7ta/4Lm/Q/TX48U1DxFXFOeY8MTeMHHdUE
	p3WemuEP5cIObeD9P6KIJwmmHAniw/NhkJGBfUuh/CHXtqvHj6RsdV+9p4YpnsVDxLqktqTDlLalp
	ARiCex6ObCRic0ORDang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxmT-00CIow-26; Mon, 08 Aug 2022 08:06:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxmQ-00CImr-Df
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 08:06:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54E9160E2D;
	Mon,  8 Aug 2022 08:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C072DC433C1;
	Mon,  8 Aug 2022 08:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659945987;
	bh=O8oJK7US06ctrbwrFK6AhnyYDVDe+qcc6oGaVuVbZgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ucjfa6QfVZzSkAjPgs+tH771FrLQURJA+lcfQx6r7YbD4/+oWwzq9VqbkDhxMtwpK
	 M4PQGbG9i9IrK4C4ChmTS4G1RxftMkmtv+4DPkPXeyMRy6mGr0g9hTpi9pVm4oPLBF
	 2VBprduojP+o/X10wgiUPiiGuTuRr5E0du2iCpuUnjFCKhFMAxAZp9E95f0X7OMEld
	 UDMFlZGorX/8I81qppDNYpfJnEVKmX2T9U7Rg4KI0L7QxH8n6SSsc85degeud2H7xx
	 NPxf9DwuyYqcgXaP2tca9Gm+PAByQH5Jlt6ZZaiKfUCOSUsXpOEk0SCiumE8caJhVy
	 L8mCL/mnosJuw==
From: guoren@kernel.org
To: tj@kernel.org,
	cl@linux.com,
	palmer@dabbelt.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	peterz@infradead.org,
	arnd@arndb.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [RFC PATCH 3/4] riscv: percpu: Implement this_cpu operations
Date: Mon,  8 Aug 2022 04:05:59 -0400
Message-Id: <20220808080600.3346843-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808080600.3346843-1-guoren@kernel.org>
References: <20220808080600.3346843-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_010630_565765_76A5B964 
X-CRM114-Status: GOOD (  13.37  )
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

This patch provides riscv specific implementations for the this_cpu
operations. We use atomic operations as appropriate (32 & 64 width).

Use AMO instructions listed below for percpu, others are generic:
 - amoadd.w/d
 - amoand.w/d
 - amoor.w/d
 - amoswap.w/d

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/percpu.h | 104 ++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 000000000000..f41d339c41f3
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _ASM_RISCV_PERCPU_H
+#define _ASM_RISCV_PERCPU_H
+
+#include <asm/cmpxchg.h>
+
+#define __PERCPU_OP_CASE(asm_type, name, sz, asm_op)			\
+static inline void							\
+__percpu_##name##_case_##sz(void *ptr, ulong val)			\
+{									\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op "." #asm_type " zero, %1, (%0)"	\
+		:							\
+		: "r" (ptr), "r" (val)					\
+		: "memory");						\
+}
+
+#define __PERCPU_RET_OP_CASE(asm_type, name, sz, asm_op, c_op)		\
+static inline u##sz							\
+__percpu_##name##_return_case_##sz(void *ptr, ulong val)		\
+{									\
+	u##sz ret;							\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op "." #asm_type " %0, %2, (%1)"	\
+		: "=r" (ret)						\
+		: "r" (ptr), "r" (val)					\
+		: "memory");						\
+									\
+	return ret c_op val;						\
+}
+
+#ifdef CONFIG_64BIT
+#define PERCPU_OP(name, asm_op)						\
+	__PERCPU_OP_CASE(w, name, 32, asm_op)				\
+	__PERCPU_OP_CASE(d, name, 64, asm_op)
+
+#define PERCPU_RET_OP(name, asm_op, c_op)				\
+	__PERCPU_RET_OP_CASE(w, name, 32, asm_op, c_op)			\
+	__PERCPU_RET_OP_CASE(d, name, 64, asm_op, c_op)
+#else  /* CONFIG_32BIT */
+#define PERCPU_OP(name, asm_op)						\
+	__PERCPU_OP_CASE(w, name, 32, asm_op)
+
+#define PERCPU_RET_OP(name, asm_op, c_op)				\
+	__PERCPU_RET_OP_CASE(w, name, 32, asm_op, c_op)
+#endif /* CONFIG_64BIT */
+
+PERCPU_OP(add, add)
+PERCPU_OP(and, and)
+PERCPU_OP(or, or)
+PERCPU_RET_OP(add, add, +)
+
+#undef __PERCPU_OP_CASE
+#undef __PERCPU_RET_OP_CASE
+#undef PERCPU_OP
+#undef PERCPU_RET_OP
+
+#define _pcp_protect(op, pcp, ...)					\
+({									\
+	preempt_disable_notrace();					\
+	op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);				\
+	preempt_enable_notrace();					\
+})
+
+#define _pcp_protect_return(op, pcp, args...)				\
+({									\
+	typeof(pcp) __retval;						\
+	preempt_disable_notrace();					\
+	if (__native_word(pcp)) 					\
+		__retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);\
+	else								\
+		BUILD_BUG();						\
+	preempt_enable_notrace();					\
+	__retval;							\
+})
+
+#define this_cpu_add_4(pcp, val)	\
+	_pcp_protect(__percpu_add_case_32, pcp, val)
+#define this_cpu_add_return_4(pcp, val)	\
+	_pcp_protect_return(__percpu_add_return_case_32, pcp, val)
+#define this_cpu_and_4(pcp, val)	\
+	_pcp_protect(__percpu_and_case_32, pcp, val)
+#define this_cpu_or_4(pcp, val)		\
+	_pcp_protect(__percpu_or_case_32, pcp, val)
+#define this_cpu_xchg_4(pcp, val)	\
+	_pcp_protect_return(xchg_relaxed, pcp, val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_add_8(pcp, val)	\
+	_pcp_protect(__percpu_add_case_64, pcp, val)
+#define this_cpu_add_return_8(pcp, val)	\
+	_pcp_protect_return(__percpu_add_return_case_64, pcp, val)
+#define this_cpu_and_8(pcp, val)	\
+	_pcp_protect(__percpu_and_case_64, pcp, val)
+#define this_cpu_or_8(pcp, val)		\
+	_pcp_protect(__percpu_or_case_64, pcp, val)
+#define this_cpu_xchg_8(pcp, val)	\
+	_pcp_protect_return(xchg_relaxed, pcp, val)
+#endif /* CONFIG_64BIT */
+
+#include <asm-generic/percpu.h>
+
+#endif /* _ASM_RISCV_PERCPU_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
