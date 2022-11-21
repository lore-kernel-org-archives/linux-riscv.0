Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427E2C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 00:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W4Z8X6aRSlAuKDjLftyA3fadr6wMvAo06pqggKduuH8=; b=QSoRtAsQE2l2ab
	fAN+1xqwjzG6bDv6ZTesNe3zcm19hfdk+cxt4ab3SaT3HftjwW83XilXfP9bbSB6KxeWOf15BicfH
	i326ZaVt9Jga0ne2ZXPbgBaGyV9x8YRRNVrgPgvo8HI1jN/ugJ5ajer3vgYZ62zdROA9/W2aP8OQM
	17ujHsDA2wawG25HJgmScfsgm7iyoF8wHoOUS1AWLxru9SJ3oD3NuW9pUPqPrNadulI/j0Q2nuHV9
	8w+Enh0P+xhPusiG+YLpnfsFAGEARrl259Wv9xDM0UzJsHj5OsdDHr90/E73bnsFXCdICtdg9wC1W
	F25ME877ZIf1OOcjP/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owutY-007xg2-F8; Mon, 21 Nov 2022 00:42:44 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owutT-007xYJ-LQ; Mon, 21 Nov 2022 00:42:41 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NFpRh3525zFqRN;
	Mon, 21 Nov 2022 08:39:12 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 08:42:25 +0800
Received: from huawei.com (10.67.174.169) by dggpemm500001.china.huawei.com
 (7.185.36.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 21 Nov
 2022 08:42:25 +0800
From: Chen Lifu <chenlifu@huawei.com>
To: <anup@brainfault.org>, <atishp@atishpatra.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <chenlifu@huawei.com>
Subject: [PATCH -next] RISC-V: KVM: optimize kvm_arch_hardware_enable()
Date: Mon, 21 Nov 2022 08:39:15 +0800
Message-ID: <20221121003915.2817102-1-chenlifu@huawei.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.169]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_164239_913995_0927452B 
X-CRM114-Status: UNSURE (   6.39  )
X-CRM114-Notice: Please train this message.
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

The values of CSR_HEDELEG and CSR_HIDELEG registers are constants,
so change them from variables to macros.

Signed-off-by: Chen Lifu <chenlifu@huawei.com>
---
 arch/riscv/kvm/main.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index df2d8716851f..70196b03b6f9 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -12,10 +12,21 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/sbi.h>
 
+#define EXC_HEDELEG ((1UL << EXC_INST_MISALIGNED) | \
+		     (1UL << EXC_BREAKPOINT)      | \
+		     (1UL << EXC_SYSCALL)         | \
+		     (1UL << EXC_INST_PAGE_FAULT) | \
+		     (1UL << EXC_LOAD_PAGE_FAULT) | \
+		     (1UL << EXC_STORE_PAGE_FAULT))
+
+#define IRQ_HIDELEG ((1UL << IRQ_VS_SOFT)  | \
+		     (1UL << IRQ_VS_TIMER) | \
+		     (1UL << IRQ_VS_EXT))
+
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg)
 {
 	return -EINVAL;
 }
@@ -30,29 +41,13 @@ int kvm_arch_hardware_setup(void *opaque)
 	return 0;
 }
 
 int kvm_arch_hardware_enable(void)
 {
-	unsigned long hideleg, hedeleg;
-
-	hedeleg = 0;
-	hedeleg |= (1UL << EXC_INST_MISALIGNED);
-	hedeleg |= (1UL << EXC_BREAKPOINT);
-	hedeleg |= (1UL << EXC_SYSCALL);
-	hedeleg |= (1UL << EXC_INST_PAGE_FAULT);
-	hedeleg |= (1UL << EXC_LOAD_PAGE_FAULT);
-	hedeleg |= (1UL << EXC_STORE_PAGE_FAULT);
-	csr_write(CSR_HEDELEG, hedeleg);
-
-	hideleg = 0;
-	hideleg |= (1UL << IRQ_VS_SOFT);
-	hideleg |= (1UL << IRQ_VS_TIMER);
-	hideleg |= (1UL << IRQ_VS_EXT);
-	csr_write(CSR_HIDELEG, hideleg);
-
+	csr_write(CSR_HEDELEG, EXC_HEDELEG);
+	csr_write(CSR_HIDELEG, IRQ_HIDELEG);
 	csr_write(CSR_HCOUNTEREN, -1UL);
-
 	csr_write(CSR_HVIP, 0);
 
 	return 0;
 }
 
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
