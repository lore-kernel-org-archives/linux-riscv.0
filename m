Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1BAC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 11:42:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F6560234
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 11:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53F6560234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r5FXtqPYUMuNsh1yCJOGb6N7YpXS5p7q0iIBJVJHMBs=; b=iFCOT2den2cvGo
	8peMHTx90ksW0elEZ8a455GjLXKLJh0oFWvGHHR+oh0dgU5ni1yQdpJE0kxt8FMuebkBE3fe9JjWk
	5tCQIP+OSxGRBIVmabzXiD1zLFYGIqspna1rozkA2upaLG1gW3PCi0Vr8Tkg8yhsrC+xX5XzNq/xP
	ZYv4Pqee3wFEVUZWUzcrQTUZMh8eeNzi6IbdoWPTI9J5d7IPcB/NnZJqv9Pr7ycYYtJCseHFeDCJx
	d0pGBdT27qfo5cCJMRrVgG3Zwn17WH2tOcpaeBIt/GomFHRg145F6yshc64mHLCrp4qXFTZej1Fvz
	8HfJ95U1WcS5txpwxrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE96S-009rfa-Mp; Thu, 12 Aug 2021 11:42:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE96P-009reh-Pv
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 11:42:27 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gll7j1kPNzb0Nt;
 Thu, 12 Aug 2021 19:38:41 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 12 Aug 2021 19:42:21 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 12 Aug 2021 19:42:20 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmerdabbelt@google.com>, "Kefeng
 Wang" <wangkefeng.wang@huawei.com>, Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH] riscv: Improve stack randomisation on RV64
Date: Thu, 12 Aug 2021 19:47:02 +0800
Message-ID: <20210812114702.44936-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_044226_060571_374BEBEB 
X-CRM114-Status: UNSURE (   9.58  )
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

54c95a11cc1b ("riscv: make mmap allocation top-down by default") support
ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT, which will select ARCH_HAS_ELF_RANDOMIZE
from commit e7142bf5d231 ("arm64, mm: make randomization selected by generic
topdown mmap layout"), so riscv has support ELF ASLR feature, update the
documentation.

And enlarge STACK_RND_MASK from 8M to 1G to increase stack randomisation
on RV64 like x86/arm64 does.

Cc: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 Documentation/features/vm/ELF-ASLR/arch-support.txt | 2 +-
 arch/riscv/include/asm/elf.h                        | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/vm/ELF-ASLR/arch-support.txt b/Documentation/features/vm/ELF-ASLR/arch-support.txt
index 99cb6d7f5005..2949c99fbb2f 100644
--- a/Documentation/features/vm/ELF-ASLR/arch-support.txt
+++ b/Documentation/features/vm/ELF-ASLR/arch-support.txt
@@ -22,7 +22,7 @@
     |    openrisc: | TODO |
     |      parisc: |  ok  |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index f4b490cd0e5d..f53c40026c7a 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -42,6 +42,9 @@
  */
 #define ELF_ET_DYN_BASE		((TASK_SIZE / 3) * 2)
 
+#ifdef CONFIG_64BIT
+#define STACK_RND_MASK		(0x3ffff >> (PAGE_SHIFT - 12))
+#endif
 /*
  * This yields a mask that user programs can use to figure out what
  * instruction set this CPU supports.  This could be done in user space,
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
