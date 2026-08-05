Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9539BC55ABA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 15:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qtmS3EwPnFp7+BdOlnUra8Bgw2Hy9iFusFiwCZhy0rM=; b=iiicMJWZftWjQe
	pMv01Y/e+802hVxREoBjmVMU6i8njDz644UQRAaSx4zlZql1na5xJnUq7AUhCljZUrZNMHCaIOc2N
	dgQlznxz80QkGDI6PCuR6wd3/aai7mKTCd6KpA5aUXRz6YNIHljWyKSCCGtIe920Ls0AJsZBHiPAv
	t2ZZ3yStcbFMnKxrGPW0QCq8mN+wuZILegZMcU2TEwqcrFAlefhTTxNKS88FdcMiqYrR17f155jj0
	qZ94Jm9wIN5TwIvnUiMMDncsXBDVC0Jggr22tcZOPKuBlz/sL+RgqDGY2OALNJXIsUEBMtOaYle/n
	QOrRo1rXi2vfRpPoReaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdd3-00000004BwT-3TTt;
	Wed, 05 Aug 2026 15:34:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdd0-00000004Bvv-04ci
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 15:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785944036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gDZaNAIyY1wwg59zDW3cS7Pf2kAQ2ym8y0epvkerQsQ=;
	b=U+GrxUB+xqEZ7rMcmat8OxBi31N1eWqxqJsswGLBHLbLH5hSWLXBmnuu4Aov5IWlFUMd6B
	zVJ3QFu+BBd+3WX8URZbQb89/J9en8tL+TTVXcc0SROfaqQPNy6PdZjcj8GBspXcoc0WOx
	YaUgSgeRhEuV7vXhvzZztWRCmqgA0EQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-ZCapzm7eMPC30mHR00lnjA-1; Wed,
 05 Aug 2026 11:33:52 -0400
X-MC-Unique: ZCapzm7eMPC30mHR00lnjA-1
X-Mimecast-MFC-AGG-ID: ZCapzm7eMPC30mHR00lnjA_1785944031
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C65E819560B4;
	Wed,  5 Aug 2026 15:33:49 +0000 (UTC)
Received: from jtaubepe-thinkpadx1carbongen12.ibmlowe.csb (unknown [10.17.17.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0791B3000239;
	Wed,  5 Aug 2026 15:33:47 +0000 (UTC)
From: Jesse Taube <jtaubepe@redhat.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	linux-kernel@vger.kernel.org,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	thecharlesjenkins@gmail.com,
	Jesse Taube <jtaubepe@redhat.com>
Subject: [PATCH v4] RISC-V: hwprobe: Use BIT macro to avoid warnings
Date: Wed,  5 Aug 2026 11:33:46 -0400
Message-ID: <20260805153346.1036988-1-jtaubepe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: NRAHFQSLPKKFfzUXzNvgA1-meL1gjkGK382BbJPuCx8_1785944031
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_083358_132969_582E3728 
X-CRM114-Status: GOOD (  10.24  )
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

In uapi/asm/hwprobe.h file, (1 << N) is used to define the bit field
which causes checkpatch to warn. Use _BITUL(N) and _BITULL(N) to avoid
these warnings.

Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
---
V1 -> V2:
 - Reword commit message
 - https://patchwork.kernel.org/project/linux-riscv/patch/20240822203913.2306574-1-jesse@rivosinc.com/
V2 -> V3:
 - Rebase
 - Use _BITULL instead of BIT_ULL
 - https://patchwork.kernel.org/project/linux-riscv/patch/20250205204129.10639-2-palmer@rivosinc.com/
V3 -> V4:
 - Rebase on riscv/for-next
 - Reword commit message
 - Use _BITUL instead of BIT
---
 arch/riscv/include/uapi/asm/hwprobe.h | 147 +++++++++++++-------------
 1 file changed, 74 insertions(+), 73 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9139edba0aec..109922c759ed 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -7,6 +7,7 @@
 #define _UAPI_ASM_HWPROBE_H
 
 #include <linux/types.h>
+#include <linux/const.h>
 
 /*
  * Interface for probing hardware capabilities from userspace, see
@@ -21,80 +22,80 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	_BITULL(0)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
-#define		RISCV_HWPROBE_IMA_FD		(1 << 0)
-#define		RISCV_HWPROBE_IMA_C		(1 << 1)
-#define		RISCV_HWPROBE_IMA_V		(1 << 2)
-#define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
-#define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
-#define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
-#define		RISCV_HWPROBE_EXT_ZICBOZ	(1 << 6)
-#define		RISCV_HWPROBE_EXT_ZBC		(1 << 7)
-#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 8)
-#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 9)
-#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 10)
-#define		RISCV_HWPROBE_EXT_ZKND		(1 << 11)
-#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 12)
-#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 13)
-#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 14)
-#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 15)
-#define		RISCV_HWPROBE_EXT_ZKT		(1 << 16)
-#define		RISCV_HWPROBE_EXT_ZVBB		(1 << 17)
-#define		RISCV_HWPROBE_EXT_ZVBC		(1 << 18)
-#define		RISCV_HWPROBE_EXT_ZVKB		(1 << 19)
-#define		RISCV_HWPROBE_EXT_ZVKG		(1 << 20)
-#define		RISCV_HWPROBE_EXT_ZVKNED	(1 << 21)
-#define		RISCV_HWPROBE_EXT_ZVKNHA	(1 << 22)
-#define		RISCV_HWPROBE_EXT_ZVKNHB	(1 << 23)
-#define		RISCV_HWPROBE_EXT_ZVKSED	(1 << 24)
-#define		RISCV_HWPROBE_EXT_ZVKSH		(1 << 25)
-#define		RISCV_HWPROBE_EXT_ZVKT		(1 << 26)
-#define		RISCV_HWPROBE_EXT_ZFH		(1 << 27)
-#define		RISCV_HWPROBE_EXT_ZFHMIN	(1 << 28)
-#define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 29)
-#define		RISCV_HWPROBE_EXT_ZVFH		(1 << 30)
-#define		RISCV_HWPROBE_EXT_ZVFHMIN	(1ULL << 31)
-#define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
-#define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
-#define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
-#define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
-#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
-#define		RISCV_HWPROBE_EXT_ZVE32X	(1ULL << 37)
-#define		RISCV_HWPROBE_EXT_ZVE32F	(1ULL << 38)
-#define		RISCV_HWPROBE_EXT_ZVE64X	(1ULL << 39)
-#define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
-#define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
-#define		RISCV_HWPROBE_EXT_ZIMOP		(1ULL << 42)
-#define		RISCV_HWPROBE_EXT_ZCA		(1ULL << 43)
-#define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 44)
-#define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
-#define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
-#define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
-#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
-#define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
-#define		RISCV_HWPROBE_EXT_ZICNTR	(1ULL << 50)
-#define		RISCV_HWPROBE_EXT_ZIHPM		(1ULL << 51)
-#define		RISCV_HWPROBE_EXT_ZFBFMIN	(1ULL << 52)
-#define		RISCV_HWPROBE_EXT_ZVFBFMIN	(1ULL << 53)
-#define		RISCV_HWPROBE_EXT_ZVFBFWMA	(1ULL << 54)
-#define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 55)
-#define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
-#define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
-#define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
-#define		RISCV_HWPROBE_EXT_ZALASR	(1ULL << 59)
-#define		RISCV_HWPROBE_EXT_ZICBOP	(1ULL << 60)
-#define		RISCV_HWPROBE_EXT_ZILSD		(1ULL << 61)
-#define		RISCV_HWPROBE_EXT_ZCLSD		(1ULL << 62)
-#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 63)
+#define		RISCV_HWPROBE_IMA_FD		_BITULL(0)
+#define		RISCV_HWPROBE_IMA_C		_BITULL(1)
+#define		RISCV_HWPROBE_IMA_V		_BITULL(2)
+#define		RISCV_HWPROBE_EXT_ZBA		_BITULL(3)
+#define		RISCV_HWPROBE_EXT_ZBB		_BITULL(4)
+#define		RISCV_HWPROBE_EXT_ZBS		_BITULL(5)
+#define		RISCV_HWPROBE_EXT_ZICBOZ	_BITULL(6)
+#define		RISCV_HWPROBE_EXT_ZBC		_BITULL(7)
+#define		RISCV_HWPROBE_EXT_ZBKB		_BITULL(8)
+#define		RISCV_HWPROBE_EXT_ZBKC		_BITULL(9)
+#define		RISCV_HWPROBE_EXT_ZBKX		_BITULL(10)
+#define		RISCV_HWPROBE_EXT_ZKND		_BITULL(11)
+#define		RISCV_HWPROBE_EXT_ZKNE		_BITULL(12)
+#define		RISCV_HWPROBE_EXT_ZKNH		_BITULL(13)
+#define		RISCV_HWPROBE_EXT_ZKSED		_BITULL(14)
+#define		RISCV_HWPROBE_EXT_ZKSH		_BITULL(15)
+#define		RISCV_HWPROBE_EXT_ZKT		_BITULL(16)
+#define		RISCV_HWPROBE_EXT_ZVBB		_BITULL(17)
+#define		RISCV_HWPROBE_EXT_ZVBC		_BITULL(18)
+#define		RISCV_HWPROBE_EXT_ZVKB		_BITULL(19)
+#define		RISCV_HWPROBE_EXT_ZVKG		_BITULL(20)
+#define		RISCV_HWPROBE_EXT_ZVKNED	_BITULL(21)
+#define		RISCV_HWPROBE_EXT_ZVKNHA	_BITULL(22)
+#define		RISCV_HWPROBE_EXT_ZVKNHB	_BITULL(23)
+#define		RISCV_HWPROBE_EXT_ZVKSED	_BITULL(24)
+#define		RISCV_HWPROBE_EXT_ZVKSH		_BITULL(25)
+#define		RISCV_HWPROBE_EXT_ZVKT		_BITULL(26)
+#define		RISCV_HWPROBE_EXT_ZFH		_BITULL(27)
+#define		RISCV_HWPROBE_EXT_ZFHMIN	_BITULL(28)
+#define		RISCV_HWPROBE_EXT_ZIHINTNTL	_BITULL(29)
+#define		RISCV_HWPROBE_EXT_ZVFH		_BITULL(30)
+#define		RISCV_HWPROBE_EXT_ZVFHMIN	_BITULL(31)
+#define		RISCV_HWPROBE_EXT_ZFA		_BITULL(32)
+#define		RISCV_HWPROBE_EXT_ZTSO		_BITULL(33)
+#define		RISCV_HWPROBE_EXT_ZACAS		_BITULL(34)
+#define		RISCV_HWPROBE_EXT_ZICOND	_BITULL(35)
+#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	_BITULL(36)
+#define		RISCV_HWPROBE_EXT_ZVE32X	_BITULL(37)
+#define		RISCV_HWPROBE_EXT_ZVE32F	_BITULL(38)
+#define		RISCV_HWPROBE_EXT_ZVE64X	_BITULL(39)
+#define		RISCV_HWPROBE_EXT_ZVE64F	_BITULL(40)
+#define		RISCV_HWPROBE_EXT_ZVE64D	_BITULL(41)
+#define		RISCV_HWPROBE_EXT_ZIMOP		_BITULL(42)
+#define		RISCV_HWPROBE_EXT_ZCA		_BITULL(43)
+#define		RISCV_HWPROBE_EXT_ZCB		_BITULL(44)
+#define		RISCV_HWPROBE_EXT_ZCD		_BITULL(45)
+#define		RISCV_HWPROBE_EXT_ZCF		_BITULL(46)
+#define		RISCV_HWPROBE_EXT_ZCMOP		_BITULL(47)
+#define		RISCV_HWPROBE_EXT_ZAWRS		_BITULL(48)
+#define		RISCV_HWPROBE_EXT_SUPM		_BITULL(49)
+#define		RISCV_HWPROBE_EXT_ZICNTR	_BITULL(50)
+#define		RISCV_HWPROBE_EXT_ZIHPM		_BITULL(51)
+#define		RISCV_HWPROBE_EXT_ZFBFMIN	_BITULL(52)
+#define		RISCV_HWPROBE_EXT_ZVFBFMIN	_BITULL(53)
+#define		RISCV_HWPROBE_EXT_ZVFBFWMA	_BITULL(54)
+#define		RISCV_HWPROBE_EXT_ZICBOM	_BITULL(55)
+#define		RISCV_HWPROBE_EXT_ZAAMO		_BITULL(56)
+#define		RISCV_HWPROBE_EXT_ZALRSC	_BITULL(57)
+#define		RISCV_HWPROBE_EXT_ZABHA		_BITULL(58)
+#define		RISCV_HWPROBE_EXT_ZALASR	_BITULL(59)
+#define		RISCV_HWPROBE_EXT_ZICBOP	_BITULL(60)
+#define		RISCV_HWPROBE_EXT_ZILSD		_BITULL(61)
+#define		RISCV_HWPROBE_EXT_ZCLSD		_BITULL(62)
+#define		RISCV_HWPROBE_EXT_ZICFILP	_BITULL(63)
 
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
-#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_SLOW		(2 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	0
+#define		RISCV_HWPROBE_MISALIGNED_EMULATED	1
+#define		RISCV_HWPROBE_MISALIGNED_SLOW		2
+#define		RISCV_HWPROBE_MISALIGNED_FAST		3
+#define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	4
+#define		RISCV_HWPROBE_MISALIGNED_MASK		7
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
 #define RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS	7
 #define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
@@ -115,11 +116,11 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0	14
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
-#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
+#define		RISCV_HWPROBE_EXT_ZICFISS	_BITULL(0)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
-#define RISCV_HWPROBE_WHICH_CPUS	(1 << 0)
+#define RISCV_HWPROBE_WHICH_CPUS	_BITUL(0)
 
 #endif
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
