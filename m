Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E207C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HnP9iLS2tIm8qvY4zf/vRk1ONRYjhsL789B+PcENgU=; b=Aw+iA7rsh6RBPC
	PMyLPYGVBu4STIm5g4q9PtRoGFX1HZL8e90RygNhXu8JGFMkrfzxceDDMzePrDUxyY3JIYfoITvpD
	6K4evYg4XrQt4mNj/oVzTUUpikO6ZbJJK1ju886cZPh0CDfpcguY+jmkpE008Rhlzy8q4v0co5KJM
	Ig1WDfWM2unAEfCJQ4Jqk24zVjEu4F5Fro/38j5yobLqRngirtwEFlsTF6rzrZ2uy45vSWjlPdI+C
	ShrHmsrxRF2Z6FheMj06/yAFuZko+psYDhWaGenbw9RU1318ukkUEmZGGRQFZ3wrSfqHJJisQJIb1
	ACEIAD91O6Cy/EenK9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqtX-00BM3P-2P;
	Mon, 22 Jan 2024 09:47:07 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqtR-00BLyp-2E;
	Mon, 22 Jan 2024 09:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705916822; x=1737452822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XjbRb6KLhs3MMD3Cdz5D4prMhpH/m5EAMfKa/Xyq4Ak=;
  b=fuWFVtWJjp0hxeOF7qSKNxZysDfToApMIx+fEJ1283vIBi0xnqf4/Wfp
   dIiTDTmys8IhILgmlfl6qBZyAYrt14R7vP4sK7f0CEcsFF1t69rF1LKQs
   lehPR3bMmc5aEaCgTXwZ7X5J3eo5OvXFdSRh2WIFPJAjBgvMgYQQXDSbi
   Hk9IxmmpGbV6aW4A0Q7EIRn+RJZFlLxGaaK3VY3HUet+2UX48L5LDZvxZ
   f039jDtBpJT/O8I6pyZYIGjPJfh/rI1rEylPEV4vhFduEGgf800BfaDUt
   NKPfKBYscioNOrgAlh0zIxuVPbljLre89+zYEuL8vq2NWB0qTk4LvHzO2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22641855"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="22641855"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:47:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="778535468"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="778535468"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:46:52 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	ajones@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Samuel Holland <samuel@sholland.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Like Xu <likexu@tencent.com>,
	Peter Xu <peterx@redhat.com>,
	Vipin Sharma <vipinsh@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Thomas Huth <thuth@redhat.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v5 07/12] tools: riscv: Add header file vdso/processor.h
Date: Mon, 22 Jan 2024 17:58:37 +0800
Message-Id: <212d0d848e54c887944ec38bd9f9729df8d1a27f.1705916069.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705916069.git.haibo1.xu@intel.com>
References: <cover.1705916069.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_014701_763267_EA1896B3 
X-CRM114-Status: GOOD (  10.20  )
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

Borrow the cpu_relax() definitions from kernel's
arch/riscv/include/asm/vdso/processor.h to tools/ for riscv.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/arch/riscv/include/asm/vdso/processor.h | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 tools/arch/riscv/include/asm/vdso/processor.h

diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
new file mode 100644
index 000000000000..662aca039848
--- /dev/null
+++ b/tools/arch/riscv/include/asm/vdso/processor.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_VDSO_PROCESSOR_H
+#define __ASM_VDSO_PROCESSOR_H
+
+#ifndef __ASSEMBLY__
+
+#include <asm-generic/barrier.h>
+
+static inline void cpu_relax(void)
+{
+#ifdef __riscv_muldiv
+	int dummy;
+	/* In lieu of a halt instruction, induce a long-latency stall. */
+	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
+#endif
+
+#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
+	/*
+	 * Reduce instruction retirement.
+	 * This assumes the PC changes.
+	 */
+	__asm__ __volatile__ ("pause");
+#else
+	/* Encoding of the pause instruction */
+	__asm__ __volatile__ (".4byte 0x100000F");
+#endif
+	barrier();
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ASM_VDSO_PROCESSOR_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
