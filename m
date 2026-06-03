Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4999CD6E64
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 09:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4t7bOv0eC2nyM0haSQegILgEOKoCAKj5qRQLXMuLjBE=; b=G/zMrs2bRq67IW
	r2aqrc3qajMyJ+kDy25FmAgf01dtF4FiYoNt3rrzYtiQ3OyR3KpPHaA2ISRDuwYgEsmcJuiz125cW
	zz++7IMEh27itfwjzff5NqDdqxS2Ba4TlBb9Rs20rGMUm/9xGYa40GZ5cSD3BHmKDR2oULas1HWUd
	kPVnyWpptuNL2/UtXd0ywP/SqSYZfD3NeTIxMBESsB0FqQfvfMXLfYQclmPgv/39FDdbmN3sI/I2o
	gt1brgyKFbZK20ftNogGhoP4RKNlI/4Ark8eKZOLRUHAVwpQelU12q9OZ7AWSfPNVtKq+uEMrnjKx
	eMKOPoMzMRzYZOGBgifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhyd-0000000EiTm-3GTq;
	Wed, 03 Jun 2026 09:33:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhyb-0000000EiTa-2Bfn
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Jun 2026 09:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=nXWOtMPLwLRV+GvbbdhZX/wwWE7Pl1XYnW0R8qtnR1U=; b=MIt6JnAFy3ZucSwhikmPHJSDKC
	3s7fThZMJxRLooZE63zUEaWJ5AMX3+rFezJM+Bd/Dlht4S0CQYdA/gfiHH5ZIsqnKkf8ME9CN3aoB
	q30lqO+l19jfQUfXqX1Mu/1N/5PqSIZj/3YN2zs+66Isv4BKgV/q9ec12PISJ3nC2rxpoqksZcUa5
	1AeEzwzitP6/PyJNxfs8u2F84HRsgbOARHMYc/W7EBuuNUVycFJmT/G/CSqi7FqqX7KRGgP3CkUUT
	NNkofhvn8tyj90wlUDc8QzUuOgcon8RbERsJPo4kEKi8pPbdxO8BR9Z8rcuzoJssvi3onx9+xPBW2
	0/OBNqCw==;
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUhyW-0000000Bj4R-49Jc
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 09:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780479195; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=nXWOtMPLwLRV+GvbbdhZX/wwWE7Pl1XYnW0R8qtnR1U=;
	b=T+850De/gY36tnz+ADHIRK/Phe4shOr5AuqX+tfhkmjX0sw6yJN4HiiZjTcPT0/022+6m9I49jE70eLaOIeR4ACCLIZe9Wi28+vX6XJgS9s/INllVcS80AYUbMNkz170RkIruLburbx08V0imrW6//5VCRfxttqygOLxAsIfzcM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0X46xjpy_1780479189;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X46xjpy_1780479189 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 17:33:14 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pjw@kernel.org,
	alexghiti@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] riscv: cpufeature: Validate H extension via CSR_HGATP probe
Date: Wed,  3 Jun 2026 17:33:01 +0800
Message-ID: <20260603093301.89430-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_103325_968450_4105E7CA 
X-CRM114-Status: GOOD (  13.81  )
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

The H extension is advertised to S-mode through three channels --
the DT "riscv,isa" string, the DT "riscv,isa-extensions" list, and
the ACPI RHCT ISA string -- all of which converge in
riscv_resolve_isa().  The H entry has no validate callback today,
so the kernel trusts the description unconditionally.

When firmware advertises H but the hardware does not actually
implement it (common during early bring-up, e.g. QEMU), kvm.ko
reaches kvm_riscv_gstage_mode_detect() and oopses on the first
CSR_HGATP access with an illegal instruction.

Add a validate callback for H that probes CSR_HGATP under an
exception-table fixup.  If the read traps, the H bit is cleared
during ISA resolution and the rest of the kernel sees H as
unavailable.  Because the probe runs in riscv_resolve_isa(), it
covers all three advertisement sources.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/kernel/cpufeature.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602d74..b34dd789e94e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -17,9 +17,11 @@
 #include <linux/of.h>
 #include <asm/acpi.h>
 #include <asm/alternative.h>
+#include <asm/asm-extable.h>
 #include <asm/bugs.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
+#include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/text-patching.h>
 #include <asm/hwprobe.h>
@@ -163,6 +165,32 @@ static int riscv_ext_d_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_h_validate(const struct riscv_isa_ext_data *data,
+				const unsigned long *isa_bitmap)
+{
+	unsigned long val, ret = 1;
+
+	/*
+	 * The H extension may be advertised by firmware (DT/ACPI) even
+	 * when the underlying hardware does not implement it, or when
+	 * M-mode firmware has not delegated hypervisor CSR access to
+	 * S-mode.  Probe CSR_HGATP under an exception-table fixup: if
+	 * the read traps with an illegal instruction, ret stays 1.
+	 */
+	asm volatile(
+		"1:	csrr	%0, " __stringify(CSR_HGATP) "\n"
+		"	li	%1, 0\n"
+		"2:\n"
+		_ASM_EXTABLE(1b, 2b)
+		: "=r" (val), "+r" (ret));
+
+	if (ret) {
+		pr_err("H detected in ISA string, disabling as CSR_HGATP is not accessible\n");
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int riscv_ext_vector_x_validate(const struct riscv_isa_ext_data *data,
 				       const unsigned long *isa_bitmap)
 {
@@ -498,7 +526,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
-	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
+	__RISCV_ISA_EXT_DATA_VALIDATE(h, RISCV_ISA_EXT_h, riscv_ext_h_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
