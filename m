Return-Path: <SRS0=K/tH=SZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199A4C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 23:25:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE49218D2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 23:25:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jDpALba0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="qUJf7LJO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE49218D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GR/+/1Hnu6EGdwrQoQxXlbJ/w486Kulw6ELInh/PtSY=; b=jDpALba0pqC5y9
	EPsOaPug4B4UfIB+2xulXxA6ab3POdHbYMxh8BvXAhaUJNhd99CfCfKWyjgs97yiE9W5sb++hdSgo
	+MBH10sVFGJYKjlUBkgC3Ih1tPVxyaLSeULUCb/Vb1Wm2b+uGHh3mbhmvwdwjeJTWxSxDwSRbFiuv
	eEXZ2ml65u9IUEmtrF4k8HJ6eDFIwG6o3KKoC+uxqeJZahfDkID1IdzPAagCQP+kiZfb8VfIwllra
	Yw5xLHXrxqO4js66hMSUnbwDQjRm9LhDOAAqtKUIiSaoVbEhTbkwMAmvbi9mnix4H+znp3q7NAnNk
	1YnXUBc1sUCx0IAShLmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJ4n8-0000bs-Pw; Tue, 23 Apr 2019 23:25:34 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ4mx-00076v-TR
 for linux-riscv@lists.infradead.org; Tue, 23 Apr 2019 23:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556061924; x=1587597924;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l9kLduGgH2CEH7OEe9isFOfe6yfXUj5pwtaHUqeYFhE=;
 b=qUJf7LJO4ey5XL2EZxDQIkdQNtBhHYkPqekJ0Dudyh3Cm48s3xJdH8k+
 gpLvRKP/dbK5EG5oFZPm/w9rJbQbZPWi332F9Umms9OtlMkcwrTFTpQqn
 /bSzUtwa8in1NNrCC2d8cWOb/SCyMvmBR7y+E+CEclXSaEolni9oqUYou
 E5geDaqhF5vLX11R7CegwNEBCssW8IHvdnR5qZDzqLD2HzLlAwKnVKSbk
 i3Xo7+BLqKbcQrZf2uIrSS28SZb5BImC6ekGY0B+J8is4NjArv91j7CkK
 ixd2YhAU1rc0UkWiJQ3Qdk2iz558BxmE6CSGhUwO0l5pVnqAPdjvkl0Hu w==;
X-IronPort-AV: E=Sophos;i="5.60,387,1549900800"; d="scan'208";a="107864432"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2019 07:25:20 +0800
IronPort-SDR: i9QOe+hz9u0h4zHOIUeUeX27HNt4KMls0ZSZQ4a0WPhLyd1ZUaZi28SKqZavGPv9xkLUcvUksZ
 jImhHf2eBbtyOCZ/pp5PUOxh+8r9JyR/uWBhDKz3TZzFjsJEYE7iGznK3NvPbaJGiV9ulfmm1b
 EZZT+KPjnXfHYOpsaLv04z+cF3h+AV+kM/v31OpT4fUAqOQUbIDIwF69KVOeExwkMbLcKpaWYK
 JqNbZmfMzsvdQiOweVLiXewAZeQ1uWRetL4TPeJB6BmFlq8v4+iA6EfhnFUSBx6EFwcV3D6q8j
 j+Ho/FOIDQGaC4sFFocrsr27
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 23 Apr 2019 16:01:51 -0700
IronPort-SDR: Cz9usMlryfriG6lYXvNXQznDlYS1KUnhv6vwtE/cTtzKjynqmNIrmECRkprpZZ5KB8uV/Eyd8b
 2aauPy8BMAX0+k/0KosAhzqvvr2fJk84/zpaJoEq5Jlw4OrsD1JNZt8wu9YpMUXWrO6OAvFk2v
 MDchRTAUMBxaoRGoovjo+UyRmse8FCtgmN01TUqYYYG9N0WkkexVUbjaCuv46Og46T+Elr+Sap
 Ndm6k4dl7EvD8AHZdqZM863QTvbQ5lFHY/KAD3OjaYtC5WhwON8klgnTM5e17TxRzbTBxPqINz
 06o=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2019 16:25:20 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: Add an Image header that boot loader can parse.
Date: Tue, 23 Apr 2019 16:25:06 -0700
Message-Id: <20190423232506.857-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_162524_512848_28E47F5D 
X-CRM114-Status: GOOD (  12.62  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Zong Li <zong@andestech.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, last stage boot loaders such as U-Boot can accept only
uImage which is an unnecessary additional step in automating boot flows.

Add a simple image header that boot loaders can parse and directly
load kernel flat Image. The existing booting methods will continue to
work as it is.

Tested on both QEMU and HiFive Unleashed using OpenSBI + U-Boot + Linux.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/image.h | 32 ++++++++++++++++++++++++++++++++
 arch/riscv/kernel/head.S       | 28 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 arch/riscv/include/asm/image.h

diff --git a/arch/riscv/include/asm/image.h b/arch/riscv/include/asm/image.h
new file mode 100644
index 000000000000..76a7e0d4068a
--- /dev/null
+++ b/arch/riscv/include/asm/image.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_IMAGE_H
+#define __ASM_IMAGE_H
+
+#define RISCV_IMAGE_MAGIC	"RISCV"
+
+#ifndef __ASSEMBLY__
+/*
+ * struct riscv_image_header - riscv kernel image header
+ *
+ * @code0:		Executable code
+ * @code1:		Executable code
+ * @text_offset:	Image load offset
+ * @image_size:		Effective Image size
+ * @reserved:		reserved
+ * @magic:		Magic number
+ * @reserved:		reserved
+ */
+
+struct riscv_image_header {
+	u32 code0;
+	u32 code1;
+	u64 text_offset;
+	u64 image_size;
+	u64 res1;
+	u64 magic;
+	u32 res2;
+	u32 res3;
+};
+#endif /* __ASSEMBLY__ */
+#endif /* __ASM_IMAGE_H */
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fe884cd69abd..154647395601 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -19,9 +19,37 @@
 #include <asm/thread_info.h>
 #include <asm/page.h>
 #include <asm/csr.h>
+#include <asm/image.h>
 
 __INIT
 ENTRY(_start)
+	/*
+	 * Image header expected by Linux boot-loaders. The image header data
+	 * structure is described in asm/image.h.
+	 * Do not modify it without modifying the structure and all bootloaders
+	 * that expects this header format!!
+	 */
+	/* jump to start kernel */
+	j _start_kernel
+	/* reserved */
+	.word 0
+	.balign 8
+#if __riscv_xlen == 64
+	/* Image load offset(2MB) from start of RAM */
+	.dword 0x200000
+#else
+	/* Image load offset(4MB) from start of RAM */
+	.dword 0x400000
+#endif
+	/* Effective size of kernel image */
+	.dword _end - _start
+	.dword 0
+	.asciz RISCV_IMAGE_MAGIC
+	.word 0
+	.word 0
+
+.global _start_kernel
+_start_kernel:
 	/* Mask all interrupts */
 	csrw sie, zero
 
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
