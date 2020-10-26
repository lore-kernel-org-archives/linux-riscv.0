Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0425C4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 12:32:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 399A12222C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 12:32:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="onMcaA/c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 399A12222C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YGOdQ+NzJPCGyfMJ6Y+nUjQ+pyduq2fdHFsxsk4aE7Y=; b=onMcaA/c/6JnGgC+AnDDK80pJ7
	aX0s5RPXCb5Cz6ZqJy0lDTjKpcXbUp1+FeUm7RCDF4yUlYUdJPn5ZkxuhN40aBTnUIgKgeSI4aXrR
	sbB3W4kuUhdG+pSs6fhFNcAmCEoJ3ReTIJ1SoyCswUaMG4KaNCMP2312nzDl30YRay21h+PByhGuh
	UdEuz6ytMNYZjpcHDvAnDK/DXEO9W3wtKLQ/09PiQu/AiGwUivNiGZYgRsP2i+K9dS0FstwBCJyg5
	/Oeji4rupvlFTZ5JZQGtbT8pF1JQK641IRFl6KYhsapcdgPMyEDqGf5iCida4VQGlODBJ3YoeNn4/
	88w5FWVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX1fs-00079G-GF; Mon, 26 Oct 2020 12:32:32 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX1fm-00078B-L0
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 12:32:31 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08011946|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0174674-0.00699969-0.975533;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=liush@allwinnertech.com; NM=1;
 PH=DS; RN=11; RT=11; SR=0; TI=SMTPD_---.Iode2WR_1603715216; 
Received: from localhost.localdomain(mailfrom:liush@allwinnertech.com
 fp:SMTPD_---.Iode2WR_1603715216) by smtp.aliyun-inc.com(10.147.40.7);
 Mon, 26 Oct 2020 20:27:01 +0800
From: liush <liush@allwinnertech.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 penberg@kernel.org, akpm@linux-foundation.org, peterx@redhat.com,
 vbabka@suse.cz, walken@google.com
Subject: [PATCH v3] riscv: fix pfn_to_virt err in do_page_fault().
Date: Mon, 26 Oct 2020 20:26:54 +0800
Message-Id: <1603715214-29082-1-git-send-email-liush@allwinnertech.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_083227_496346_075AA8A2 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Liu Shaohua <liush@allwinnertech.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Liu Shaohua <liush@allwinnertech.com>

The argument to pfn_to_virt() should be pfn not the value of CSR_SATP.

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: liush <liush@allwinnertech.com>
---
 arch/riscv/mm/fault.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 1359e21..3c8b9e4 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -86,6 +86,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 	pmd_t *pmd, *pmd_k;
 	pte_t *pte_k;
 	int index;
+	unsigned long pfn;
 
 	/* User mode accesses just cause a SIGSEGV */
 	if (user_mode(regs))
@@ -100,7 +101,8 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 	 * of a task switch.
 	 */
 	index = pgd_index(addr);
-	pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
+	pfn = csr_read(CSR_SATP) & SATP_PPN;
+	pgd = (pgd_t *)pfn_to_virt(pfn) + index;
 	pgd_k = init_mm.pgd + index;
 
 	if (!pgd_present(*pgd_k)) {
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
