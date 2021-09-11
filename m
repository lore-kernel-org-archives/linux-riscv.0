Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20128C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 13:12:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D159661205
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 13:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D159661205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdjY9w29Zac3dPw3HbXVGwKaCDWWXuCYThE2psD9zEY=; b=kSJapVCs3LkOqV
	e17i8vfs7vaa4XXXIeKuJ1v49ygYn9PcWxJ49rtoqL5sq1UkEh3kuLGMpf/djoPF0CxiONRgrwKAl
	BXCXlLTj+eUeAApv/oB+kW6HS2XyZ2EZe9mH82pz1TE9SvLpASe51Hh4TzF/JM+2S++vXDrBFWTAG
	UJ+5G1pZ76UMXD7Mwdar3kvqmpXmnbgmSB+CclK8Gev2PBYdbSAobi+rpJIKR6fuqbwNKuAZzFKhK
	9CB/Rsg/Gy7wZcIjpyOMAJxNnA4gPQdgF6ktjsI9OC/HPBIXREyyqr8XcqIJFyriwgZqD/nxJJ5jH
	2sLusH/WeKP6EAnjA34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mP2oA-00EqvR-DW; Sat, 11 Sep 2021 13:12:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mP2nd-00Eqlr-EN
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 13:12:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8676061208;
 Sat, 11 Sep 2021 13:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631365925;
 bh=walABZlX11JaDQYOkSKG4JpsE8wTH7I7GPEVcS8ooGA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sqmwiRyAlDLDVY+7+kt0x5vnJ6JAlvVn9KqTQZ1xX7XTHSGb3Yv4nxUdUtvm6vzSN
 eJC1wmKDX1AWVLkK06/Xig1BRhsl2MeB1Mnzr9IubJJkOUGYwjYZLBRvq+B4LtnsJu
 rsGmPHHn5HdVmAPifArankln8f58pSDHsrvh6yK2ikMY4nXsXV2IUtnUXlfxzHCSyW
 6JpqBSp7inb0cjRXp4dMia91Tz6iq9TmvUr4L9rSTdEU8iP/39dxGvrUSybnG/1tEQ
 rUhfKX6Kozy2jnviwdwC8tKTd+s+jFmQDVD906tx68peC7PP0WgrCpMY7jvpfwc3HL
 CoxJS1EykGiag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kenneth Lee <liguozhu@hisilicon.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.14 11/32] riscv: fix the global name pfn_base
 confliction error
Date: Sat, 11 Sep 2021 09:11:28 -0400
Message-Id: <20210911131149.284397-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210911131149.284397-1-sashal@kernel.org>
References: <20210911131149.284397-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_061205_540415_78EAC252 
X-CRM114-Status: GOOD (  10.52  )
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

From: Kenneth Lee <liguozhu@hisilicon.com>

[ Upstream commit fb31f0a499332a053477ed57312b214e42476e6d ]

RISCV uses a global variable pfn_base for page/pfn translation. But this
is a common name and will be used elsewhere. In those cases, the
page-pfn macros which refer to this name will be referred to the
local/input variable instead. (such as in vfio_pin_pages_remote). This
make everything wrong.

This patch changes the name from pfn_base to riscv_pfn_base to fix
this problem.

Signed-off-by: Kenneth Lee <liguozhu@hisilicon.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/page.h | 4 ++--
 arch/riscv/mm/init.c          | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index b0ca5058e7ae..767852ae5e84 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -79,8 +79,8 @@ typedef struct page *pgtable_t;
 #endif
 
 #ifdef CONFIG_MMU
-extern unsigned long pfn_base;
-#define ARCH_PFN_OFFSET		(pfn_base)
+extern unsigned long riscv_pfn_base;
+#define ARCH_PFN_OFFSET		(riscv_pfn_base)
 #else
 #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 7cb4f391d106..9786100f3a14 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -234,8 +234,8 @@ static struct pt_alloc_ops _pt_ops __initdata;
 #define pt_ops _pt_ops
 #endif
 
-unsigned long pfn_base __ro_after_init;
-EXPORT_SYMBOL(pfn_base);
+unsigned long riscv_pfn_base __ro_after_init;
+EXPORT_SYMBOL(riscv_pfn_base);
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
@@ -579,7 +579,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 #endif
 
-	pfn_base = PFN_DOWN(kernel_map.phys_addr);
+	riscv_pfn_base = PFN_DOWN(kernel_map.phys_addr);
 
 	/*
 	 * Enforce boot alignment requirements of RV32 and
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
