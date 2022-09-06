Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33F2C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 12:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hh+VCfuMDjaO97AeT25b2qJy/oLZtjRMzuu6QUrqWCY=; b=FNQkxH5uW08NVu
	30NBFHradkBLlyol7lImzOLy5cGSvOZz4zt50CZibwV3t2uMSHTDyyAE7/CNwwa9OfGBrNJtq0WxK
	mYYRZjvUKghiTYZjWB7BigL1fqmZkIVu8Z7imD8f8m/752W85ydA/KfnOC1+kjjPVyWxacWIxN5Ni
	KHUZ3Zwj9jWn1xtP1ntYsnH2gEOM2DbtclVyK7hkuS2ODPjuqUhrsMKu8GBhfudyy/4Dc7R1aF/oI
	t5s+w1cCp6ZUfORuJVAHt3Y7ec1ZsyehGWZtidkN/Sy6vWpcS4Tuki/iUPBh4+1jaxLnFGM4P9rJ2
	U1N/kJSx0FQbxgXt41VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXZH-00DGxg-0N; Tue, 06 Sep 2022 12:20:39 +0000
Received: from m12-17.163.com ([220.181.12.17])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXZD-00DGug-PW
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 12:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ABlJF
	eYOIQ1yMO4RgFSt8TOjiYFH1v4bYER/CMetTR8=; b=Lu6vgE9UhNP6WbYwomcKj
	K18e/JS0PdkV1sXt5seLfKV7ChMGqeig1pMxxOSPr6+3LeessyB9HibdL9s0mVkB
	ajf6Ax8BMAxz8EaKj79cBqOrXkpimagkeQglsNF0ApHsEjhGn0r1BZU9D4XGLLfO
	Q6SPsegjECfKTkx7wyflOQ=
Received: from whoami-VirtualBox.. (unknown [223.72.91.155])
	by smtp13 (Coremail) with SMTP id EcCowABn1lLLOhdjrfx8aQ--.20577S2;
	Tue, 06 Sep 2022 20:19:24 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: paul.walmsley@sifive.com,
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
Subject: [PATCH v1] riscv : support update_mmu_tlb() for riscv
Date: Tue,  6 Sep 2022 20:19:21 +0800
Message-Id: <20220906121921.8355-1-tjytimi@163.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CM-TRANSID: EcCowABn1lLLOhdjrfx8aQ--.20577S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF45JFW8XFyftFyfXrWrXwb_yoWfGrc_W3
	WxCw4vgryvqF4xua1DXF1fWr45K34rAF1DXrs2qa13tF98JanrJ3ykta15Jr4UuanIvF4I
	kr95GryFgFy2kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREuWlUUUUUU==
X-Originating-IP: [223.72.91.155]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiTgx0eFUDRgjDigAAsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_052036_265515_E95B8018 
X-CRM114-Status: UNSURE (   6.85  )
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
---
 arch/riscv/include/asm/pgtable.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7ec936910a96..84a791d54f95 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -418,6 +418,9 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 	local_flush_tlb_page(address);
 }
 
+#define	__HAVE_ARCH_UPDATE_MMU_TLB
+#define update_mmu_tlb	update_mmu_cache
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
