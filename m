Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179CEC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wRZ2cN5pNXz8gH220AEyBfxYb809nKMvooFCyWZlFw8=; b=NzJyeUxuudvtdo
	iKhbTgN0et9Byzh3sFR8DlqdMVAHsiRmDmCYHcvBkcI4AzQk6dNSF3RjlOQX3tpB+2K8vhSzmL5SU
	8CGN3oALB/e81P8RMOnDuss4WNtMnhVgo8J6fG2Ztu1vtQEZ3I319UlJ8qrSsyDISGa5xZsXYpgwh
	oYKS9dajoAQkwLbfZewehPFYBb/HaYryBs+gTAk+cvujiQcVLZEIXm8qRjJgIobkmoPI4W1jzXLyU
	rneuJW5nO+4oEYzuQcx11G5J/aurxC1hppHPNabqGpBOpS9Je7G/Ckyu8x8WSbgDU73p/7DyIYGOO
	EcCRIAqKb9Z53LXhVnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6tLl-0067FF-07;
	Wed, 07 Jun 2023 13:37:21 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6tLi-0067DX-1h
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 13:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1686145002;
	bh=BPguxngCcatQFXlBdF+cO4v4EYUu4CjSbAh+qgMu1hI=;
	h=From:To:Cc:Subject:Date;
	b=HGFYRNnynM4+R8XRpOzxNtHpcDgz1GbhTUPZEBWdoFMQeh8KaeXCZV/un7v3IHV+V
	 kQCZGyUJzzPD6Z9oB498gMi1iaHkRRApALbELqlRKaGSLp8KGUab85m5NNsZAHdXn5
	 yAxdBmAwem3H2MT5r8EvfLW4sVpm2Imdk5+nk5LY=
Received: from localhost ([101.224.149.128])
	by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
	id 928874E8; Wed, 07 Jun 2023 21:36:40 +0800
X-QQ-mid: xmsmtpt1686145000tb1eyu550
Message-ID: <tencent_B15C0F1F3105597D0DCE7DADC96C5EB5CF0A@qq.com>
X-QQ-XMAILINFO: NioaTWkRhWwaYWTxZeEaVMvYT+6+8WBXxjru4PK5DK6okfUQA1P7v2En+zPoE5
	 1z2hnrATIIcrCuuKw/AznibA2SzpN7O3IfFjLKOySd5ejj03Pxk8w1pZjsUaZnJrwbZ5AW/EbbcG
	 a90pH9d6d6woHq6WHb24b77J0mciKoDab6wKeYEx/hyy7vMdmqhocNJGCMWaZfKUfhNq+o4FT7GC
	 jYcT+QmzbY8XnyB2+g5RsKnVevJecvqymIQONDidDQPY7x62h8xgJp6JNyNB4iNISOsAGQ4lRGwn
	 4zv6yH9Z71tLcLrrk9lBE6geVDESfMc+gyN+4iYiyVzRddH4AujsPKOFLZeKfhxiW3NR1nd2RWI4
	 sJIjWvjtPLFCF0Xzk/ZuB7IjByv7ZWdGQN2osyyHnVcRzCBpgS9QpWHgvHBqlE72dQGybw8y4I4a
	 2x4NfozxHwGMVjk8yCKxug4SVOp1OQiCzBDf4ujU11UQXhk3vHCeOiDb4HMYbmy5trXZAR0l5Ebl
	 QpTjD6shVS3GgNgmHpmHCPAZW2mTsiQzWaYyYUkHySFrQ8nYOiuRN/YhOYwn/COs0tLwsVTEHcqs
	 GCouN6JX+hopwcLkPi3kmY9qyATKAha4WFEcDj11X9ob87AuHlF8g1FhUGEBlO2jfHgw+Vw0cOie
	 NxsY08ofqoVLiws8bDxLNYQeLNEGRbQHcOzK8SgIhJuQEXGpBr0M5p5TrZWlg+zK3W1gzg8f9YuQ
	 9+fuOuw8FvLTILBeZB+SUbtJVkzF2l/+V33p2q/+ySyJ7FFCcQSwc+r39vRdtTf39lxhrhAfD0tK
	 tsNheMtt+YMjKZS2i+7qIkGhfjFtZEijis50o0Hupr7hqqUXxBbyajaqsKRuCpeaYhUaFI5p0fom
	 KrZXXKX0sEbADejJWLTbfpK3EvqfNouJvZqtPGQCI2Va5jPl6ZT5b7SUKkiOVM3Y+dsC/4FCN9V8
	 5OOc4af7zAERcA1+hs/nVYu2XgQ6wEhhWEgL0Zpnw=
From: Woody Zhang <woodylab@foxmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Woody Zhang <woodylab@foxmail.com>
Subject: [PATCH] riscv: reserve DTB before possible memblock allocation
Date: Wed,  7 Jun 2023 21:35:19 +0800
X-OQ-MSGID: <20230607133518.2472995-1-woodylab@foxmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_063719_085956_E70FBF31 
X-CRM114-Status: GOOD (  11.67  )
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

It's possible that early_init_fdt_scan_reserved_mem() allocates memory
from memblock for dynamic reserved memory in `/reserved-memory` node.
Any fixed reservation must be done before that to avoid potential
conflicts.

Reserve the DTB in memblock just after early scanning it.

Signed-off-by: Woody Zhang <woodylab@foxmail.com>
---
 arch/riscv/kernel/setup.c | 10 ++++++++++
 arch/riscv/mm/init.c      |  9 ---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 36b026057503..c147fa8da929 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -16,6 +16,7 @@
 #include <linux/console.h>
 #include <linux/screen_info.h>
 #include <linux/of_fdt.h>
+#include <linux/libfdt.h>
 #include <linux/sched/task.h>
 #include <linux/smp.h>
 #include <linux/efi.h>
@@ -256,6 +257,15 @@ static void __init parse_dtb(void)
 		pr_err("No DTB passed to the kernel\n");
 	}
 
+	/*
+	 * If DTB is built in, no need to reserve its memblock.
+	 * Otherwise, do reserve it but avoid using
+	 * early_init_fdt_reserve_self() since __pa() does
+	 * not work for DTB pointers that are fixmap addresses
+	 */
+	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
+		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
+
 #ifdef CONFIG_CMDLINE_FORCE
 	strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 	pr_info("Forcing kernel command line to: %s\n", boot_command_line);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c6bb966e4123..f8c9a79acd94 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -254,15 +254,6 @@ static void __init setup_bootmem(void)
 	 */
 	early_init_fdt_scan_reserved_mem();
 
-	/*
-	 * If DTB is built in, no need to reserve its memblock.
-	 * Otherwise, do reserve it but avoid using
-	 * early_init_fdt_reserve_self() since __pa() does
-	 * not work for DTB pointers that are fixmap addresses
-	 */
-	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
-		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
-
 	dma_contiguous_reserve(dma32_phys_limit);
 	if (IS_ENABLED(CONFIG_64BIT))
 		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
