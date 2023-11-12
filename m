Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717A4C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 09:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IekL3fz+IvT0mIWiZDO2Dp3qSXE6QRfXW47Zqx4HXuo=; b=YtEj5KNh+uyiWD
	3KqIkW50aoQCzq/bWTZmS4UhalBrwdLNBqpmWWr4qef3DjSJizzpbLFt/NurdrS8jxXK+POYIvJkk
	86wm52ah5VEonTciqGmPvUc4r0ZDXFi0fxYGrRtMoiikQKn38+5k8vjFlfqO9T3Trc/JkFlNAzibD
	rajE/S5bkqRtvk95Q/ieRt3mlg47aPpDM0zNEeHy27ffVrGeu0SZtSPxy9H1uKGXeNxLg5Q8pVun3
	D8qHlx7nFa9MSaUYXXBjbLbsw7MddcSc3XOzMhMKNrBRQhGEU66sg95xxKP3u1C2aDwkPvRkZ2tac
	j4XGpAeol+VN7dN2trCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r26zc-00Bvs7-1P;
	Sun, 12 Nov 2023 09:43:00 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r26zZ-00Bvrg-22
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 09:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699782177; x=1731318177;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dE0hghh+wuYV8oKVl43s7OS4ftZk66STgAdHkYO/4fw=;
  b=NaCebm40VgNDzxSf/X11YVs4DsdpQbPxeYlEx+7e0UffwoHdr+ZSsOx7
   VF7UwcCgkb3nXu1SjGPj2tDNbF9iWJZFUvdAX4gNl9Dl6nGTcGCNrXE5o
   DKLovac9dlQ8ZRjSvfzs0jiEZdhBw9DYSrCe0Qx/UitegVIgSqDin3FhJ
   9W8j2pz05KMYPOgt6RQDGHcQfKTok037k+RZASP6OBYk0lDczsnax29Gd
   Rs498Iv9E52KjQAHShBzHcjL/v922sCrtrBlO9hMPJmW2LMVG3Uffpafg
   iC8ckU0fiAhU+9HQBmpR9BLM6xny5AmX8f91D6+u9mHrFKoHCSQcbTvU6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="421418574"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="421418574"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 01:42:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="907800337"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="907800337"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmsmga001.fm.intel.com with ESMTP; 12 Nov 2023 01:42:54 -0800
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: anup@brainfault.org,
	haicheng.li@intel.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH] riscv: Optimize hweight API with Zbb extension
Date: Sun, 12 Nov 2023 17:52:44 +0800
Message-Id: <20231112095244.4015351-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_014257_736689_CDE24AB8 
X-CRM114-Status: GOOD (  15.35  )
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

The Hamming Weight of a number is the total number of bits set in it, so
the cpop/cpopw instruction from Zbb extension can be used to accelerate
hweight() API.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/include/asm/arch_hweight.h | 78 +++++++++++++++++++++++++++
 arch/riscv/include/asm/bitops.h       |  4 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/arch_hweight.h

diff --git a/arch/riscv/include/asm/arch_hweight.h b/arch/riscv/include/asm/arch_hweight.h
new file mode 100644
index 000000000000..c20236a0725b
--- /dev/null
+++ b/arch/riscv/include/asm/arch_hweight.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Based on arch/x86/include/asm/arch_hweight.h
+ */
+
+#ifndef _ASM_RISCV_HWEIGHT_H
+#define _ASM_RISCV_HWEIGHT_H
+
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
+
+#if (BITS_PER_LONG == 64)
+#define CPOPW	"cpopw "
+#elif (BITS_PER_LONG == 32)
+#define CPOPW	"cpop "
+#else
+#error "Unexpected BITS_PER_LONG"
+#endif
+
+static __always_inline unsigned int __arch_hweight32(unsigned int w)
+{
+#ifdef CONFIG_RISCV_ISA_ZBB
+	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBB, 1)
+			  : : : : legacy);
+
+	asm (".option push\n"
+	     ".option arch,+zbb\n"
+	     CPOPW "%0, %0\n"
+	     ".option pop\n"
+	     : "+r" (w) : :);
+
+	return w;
+
+legacy:
+#endif
+	return __sw_hweight32(w);
+}
+
+static inline unsigned int __arch_hweight16(unsigned int w)
+{
+	return __arch_hweight32(w & 0xffff);
+}
+
+static inline unsigned int __arch_hweight8(unsigned int w)
+{
+	return __arch_hweight32(w & 0xff);
+}
+
+#if BITS_PER_LONG == 64
+static __always_inline unsigned long __arch_hweight64(__u64 w)
+{
+# ifdef CONFIG_RISCV_ISA_ZBB
+	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBB, 1)
+			  : : : : legacy);
+
+	asm (".option push\n"
+	     ".option arch,+zbb\n"
+	     "cpop %0, %0\n"
+	     ".option pop\n"
+	     : "+r" (w) : :);
+
+	return w;
+
+legacy:
+# endif
+	return __sw_hweight64(w);
+}
+#else /* BITS_PER_LONG == 64 */
+static inline unsigned long __arch_hweight64(__u64 w)
+{
+	return  __arch_hweight32((u32)w) +
+		__arch_hweight32((u32)(w >> 32));
+}
+#endif /* !(BITS_PER_LONG == 64) */
+
+#endif /* _ASM_RISCV_HWEIGHT_H */
diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index b212c2708cda..f7c167646460 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -271,7 +271,9 @@ static __always_inline int variable_fls(unsigned int x)
 #include <asm-generic/bitops/fls64.h>
 #include <asm-generic/bitops/sched.h>
 
-#include <asm-generic/bitops/hweight.h>
+#include <asm/arch_hweight.h>
+
+#include <asm-generic/bitops/const_hweight.h>
 
 #if (BITS_PER_LONG == 64)
 #define __AMO(op)	"amo" #op ".d"
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
