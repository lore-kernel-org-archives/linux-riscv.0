Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE32C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 06:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xrJPC9JgVAwQrXPlXNiayfcFnwoG6CGeRmLAZxmBECA=; b=fLVPkoU42GRS79
	BCkiXhUPm9nDTyrE5h6b04zNZTQjFXs1FDKVKnHgO1esE0cAUL6Py/i9vLNqp1cs6Fw/hbDR4YCCV
	AjVOWwSbMhs8hOB3QZ01VGo1/8ajW9msmHRnFM0gXxu5HpuHDlWX0CbZjg+ybiT5lRwPPXZwzTjcq
	Qz+PKI8sHD2be06m3lN1FDg+N+pV6NN9COrmxDoKV/+1XHvp+O67YQXcSF1nADwWSPjZk2WrLRNKt
	/uS6jkhgDKgnarsVPqukncZz4fYvvXPdvCegAgH1mHMWppMxF7VxWmoBAJ5V6skC7WqqY6l6XFRKc
	bqldzbC3/XLiJw9NRulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mplPQ-003ydY-3N; Wed, 24 Nov 2021 06:05:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mplPN-003ycg-Qf
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 06:05:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CFF9460F5D;
 Wed, 24 Nov 2021 06:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637733928;
 bh=/HbIf68YRKbhDZe5rHyxTQRnyZBZEnswWOQLwFovXW0=;
 h=From:To:Cc:Subject:Date:From;
 b=khivtZLGQQs8U72VVKoiEYN0lS0NNBU95NQO93UA+Ajjb8zG4UQHLMQFy2bof7woh
 1YL5viroYHJgmpfqha9kEJ3Ov9yLiqueSWBPNuba1lhVCRtCFG9DQDkey99fnBYNY/
 Jf8MDr1Azi/TjLjBeCGS0MUoX6W+lAXlLw9an4EwcApCdmZ6uHfWYiGfz2Bl+9xHJm
 7Au7Z8GAuciFdMmh/6eLnbDwtdgwEkTd6fqiG7BcM6HD/2V9PVcVYCU43dTE8XfH6P
 ScvPwO0jOqk0dXFQ7KzEFMxlR1+vQAAX4XT7r4V6CWiR+BO1n6mhzhmZZjATneqylU
 uMTjTKCBEFVTQ==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>
Subject: [PATCH] riscv: Fixup one-page wasting
Date: Wed, 24 Nov 2021 14:05:21 +0800
Message-Id: <20211124060521.614015-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_220529_910593_4C5E76D6 
X-CRM114-Status: UNSURE (   7.02  )
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

From: Guo Ren <guoren@linux.alibaba.com>

For small memory systems(Allwinner D1s/F133), one page size memory
cannot be ignored.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <Atish.Patra@wdc.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 24b2b8044602..097bb3bc4020 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -241,9 +241,9 @@ unsigned long riscv_pfn_base __ro_after_init;
 EXPORT_SYMBOL(riscv_pfn_base);
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
-pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
 
+pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
