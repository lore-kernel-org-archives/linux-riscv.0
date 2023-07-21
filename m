Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C04EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 14:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UCPNNM/OH2ymMxQCg6hVuk8kzm5AKw6Ufr3wLuoVxwU=; b=MVwXZEk+/rgu3A
	WL76uwBHwHhV882g+SqE5YEQFRoOWDVlENpPNX8sEtGATi7y2zcsGSCs4+XfmP4C+6KF5GECjXPSO
	Im8/Z1kZD/VJ1093lTmUcERbJssGxY5VdefTGoe1HorjvM82tq5lfes4siMsCLSTEJSn5aqKd7RLl
	1MawkHycY7E2b2b98UVEKYDBlBLGyeZE+wX6du9o+m1o1UuIqgr5UpuZ/eaT+gMW/dGoSsDiPVgL9
	tzcKP2oajRwW6HzZ9gNbOwZfMuGu2R5pybLMVVXDKPOKW6X3dDzmJJ6L7V7oO8jqSwK92gzROE4lz
	L8AH7Qzwem21YjjUvf0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrTf-00ELFU-2k;
	Fri, 21 Jul 2023 14:51:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrTd-00ELF3-2k
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 14:51:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 521E5617C0;
	Fri, 21 Jul 2023 14:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546FEC433C7;
	Fri, 21 Jul 2023 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689951088;
	bh=teEmtYEsH6k5Iwt6X7YjCMB9QeYgw9y0NVMCGBaKrl4=;
	h=From:To:Cc:Subject:Date:From;
	b=Xz2t5+4X9HazUHd9/xryPgURXzr38k9iRATggk0gJ3d1QbDQZGv/2kMj02DOVSLVs
	 LRNUqA3v+aRwQ6NuqcRsLxVhBSocmLaLHcx/T3MOoywstOkT85YlM9BKmiReS0kx28
	 IcH8igEhid+qNWvhewXoS+PDRQNrVS/yEsVDKJWCyrkC63qgIy8AAt2qHFGVUUGdlH
	 XnLxLKT/5VwE30ZbODFZspOJOO8Aspgxitv0xga9tXcSjMvAEEu3tamVi8e8Tilzqn
	 nj/YJmKytqtaEl98gISwPPwM3Ha6Iwl+h3vYvGtAcRBECmDKcNrFHLjhUFQYUe8SiR
	 EFi5MTUTuNkeA==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	falcon@tinylab.org,
	bjorn@kernel.org,
	conor.dooley@microchip.com,
	alex@ghiti.fr
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: mm: Fixup spurious fault of kernel vaddr
Date: Fri, 21 Jul 2023 10:51:21 -0400
Message-Id: <20230721145121.1854104-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_075129_929529_47BA14F8 
X-CRM114-Status: GOOD (  10.51  )
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

RISC-V specification permits the caching of PTEs whose V (Valid)
bit is clear. Operating systems must be written to cope with this
possibility, but implementers are reminded that eagerly caching
invalid PTEs will reduce performance by causing additional page
faults.

So we must keep vmalloc_fault for the spurious page faults of kernel
virtual address from an OoO machine.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/mm/fault.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 85165fe438d8..f662c9eae7d4 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -258,8 +258,7 @@ void handle_page_fault(struct pt_regs *regs)
 	 * only copy the information from the master page table,
 	 * nothing more.
 	 */
-	if ((!IS_ENABLED(CONFIG_MMU) || !IS_ENABLED(CONFIG_64BIT)) &&
-	    unlikely(addr >= VMALLOC_START && addr < VMALLOC_END)) {
+	if (unlikely(addr >= TASK_SIZE)) {
 		vmalloc_fault(regs, code, addr);
 		return;
 	}
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
