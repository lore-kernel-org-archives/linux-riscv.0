Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABCCC6FA86
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 06:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K4RZCG+1gJft0kkWVFY4QIPz3SQDfpEb6Jxi4ZuAXhI=; b=agvbrmP3FtfscP
	SqcK93yXBPT7sgJtobhbVd+0olsZf7ZxmEupCwpgJHOHLxDezGuCQWz/m9Ka6JfznZz9+rozu6nXq
	sOvSFI4bTCzXoNM7gLNhagnN3kk/ZYLeY5X4h7FzQUXojRih8kyedNKetqPVdhSRL2JYrqTyDB9LJ
	FXwzmqmbiteKGTvVqfHJh1XiIQJg5ay5UpLFGQ36nqAavrQX2R+W9St9z+FST771DTZy3N4QZ1lwN
	TpT3ARQhtIDY1+Tcv+LyEF97xY7QbsqBTjP+NnCfumKrkQGotI1BUfaPT/CKGw3c3mQeNh5x2A662
	5hn7tkGRqJNg4WWEkjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZnN6-00CpdQ-Dm; Sun, 18 Sep 2022 06:01:40 +0000
Received: from m12-16.163.com ([220.181.12.16])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZnN3-00Cpbn-KE
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 06:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yLnzU
	bPovSEiJ0d7dyY6v5Z2f9GIAuRNne5cim6kAUs=; b=Z3DFAypKnXP66QPrWjFVb
	qSvgsAve4wW/hKJBxdoQqr1eljOTlbsoGb435X3KlXFMweumiD9GP6HQb7RL2Dvx
	Jj02g5MY/B9TI3tEWHLW625Rw2vEdhp2Fi5yL+ELGQNIK+noUgJ3zhlp8ERZqy/c
	YSSj7vjnFrENyecv935H1o=
Received: from whoami-VirtualBox.. (unknown [223.72.42.150])
	by smtp12 (Coremail) with SMTP id EMCowACH1IHNsyZjESXTCQ--.16398S2;
	Sun, 18 Sep 2022 13:59:42 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: paul.walmsley@sifive.com,
	ajones@ventanamicro.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	alexandre.ghiti@canonical.com,
	guoren@kernel.org,
	akpm@linux-foundation.org,
	heiko@sntech.de,
	tongtiangen@huawei.com,
	sunnanyong@huawei.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	falcon@tinylab.org,
	tjytimi@163.com
Subject: [PATCH v2] riscv: support update_mmu_tlb() for riscv
Date: Sun, 18 Sep 2022 13:59:40 +0800
Message-Id: <20220918055940.24726-1-tjytimi@163.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CM-TRANSID: EMCowACH1IHNsyZjESXTCQ--.16398S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF45JFyDCF48AFWfWFyrXrb_yoWDXrg_u3
	WxCw4vgrWvqF4xua4UWF1fJr45KwsYyFn8Xrn2qa15tFn8Ja1DA3ykta1UJr4UuanIvF4I
	9F95JryS9F9FkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUD3kDUUUUU==
X-Originating-IP: [223.72.42.150]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiVhOAeFqzt7mStgABs-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_230138_002490_D885CBFD 
X-CRM114-Status: UNSURE (   7.01  )
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

Add macro definition to support updata_mmu_tlb() for riscv,
this function is from commit:7df676974359 ("mm/memory.c:Update
local TLB if PTE entry exists").

Signed-off-by: Jinyu Tang <tjytimi@163.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
v1 -> v2: 

Change the format with the help from Andrew Jones and Conor Dooley.

 arch/riscv/include/asm/pgtable.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7ec936910a96..c61ae83aadee 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -418,6 +418,9 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 	local_flush_tlb_page(address);
 }
 
+#define __HAVE_ARCH_UPDATE_MMU_TLB
+#define update_mmu_tlb update_mmu_cache
+
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp)
 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
