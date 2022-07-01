Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC9CC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 06:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LgWM+XpyAwu/iMqfe2wK2VfE8pimeSIG/kydOI70vgY=; b=0K729+q2ZAy1s3
	OWQgvuAVZH04qAO1R1Lv8QvrdIQ63DrnNt9mBY2DURM6S3mTfTAQ7+zzKAJJDIxh4Pzg3L7GrXpiB
	11cQ5+UivdmEec7QeYcSA/C5KJS+3+fc+lNfjsIxGi+1Fo+Mv7gmDQpGopbRP/gKAcZV4nsFVRix5
	gRmHFi1dnNoOFqLf7sXDzSL6iZ0x+FY4RVnBM0nK29sCqSbFKD4Xu5bs+2yzgbvcnW4cz5u2/tYqv
	og5zMWE8SAzZvXpQjiTxOTmJIBtI8ytQIfhj6K/EkqAdIjBtvzkCtUUsVQk66jFAwCrU/idWlDFc2
	MFYDRX8xIiRGn2aV2DtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7ABU-003BSN-MJ; Fri, 01 Jul 2022 06:31:20 +0000
Received: from [2400:dd01:100f:2:72e2:84ff:fe10:5f45] (helo=mail.nfschina.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7A9C-003A8L-Gc; Fri, 01 Jul 2022 06:29:01 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id A67D61E80D21;
	Fri,  1 Jul 2022 14:27:19 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1r7Sg3ixidkE; Fri,  1 Jul 2022 14:27:16 +0800 (CST)
Received: from localhost.localdomain (unknown [112.65.12.78])
	(Authenticated sender: jiaming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 242571E80D09;
	Fri,  1 Jul 2022 14:27:15 +0800 (CST)
From: Zhang Jiaming <jiaming@nfschina.com>
To: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liqiong@nfschina.com,
	renyu@nfschina.com,
	Zhang Jiaming <jiaming@nfschina.com>
Subject: [PATCH] RISC-V: KVM: Fix variable spelling mistake
Date: Fri,  1 Jul 2022 14:28:38 +0800
Message-Id: <20220701062838.6727-1-jiaming@nfschina.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_232858_842134_9D97743E 
X-CRM114-Status: UNSURE (   7.84  )
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

There is a spelling mistake in mmu.c and vcpu_exit.c. Fix it.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 arch/riscv/kvm/mmu.c       | 8 ++++----
 arch/riscv/kvm/vcpu_exit.c | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1c00695ebee7..2965284a490d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -611,7 +611,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 {
 	int ret;
 	kvm_pfn_t hfn;
-	bool writeable;
+	bool writable;
 	short vma_pageshift;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
@@ -659,7 +659,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 
 	mmu_seq = kvm->mmu_notifier_seq;
 
-	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writeable);
+	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
 	if (hfn == KVM_PFN_ERR_HWPOISON) {
 		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
 				vma_pageshift, current);
@@ -673,14 +673,14 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	 * for write faults.
 	 */
 	if (logging && !is_write)
-		writeable = false;
+		writable = false;
 
 	spin_lock(&kvm->mmu_lock);
 
 	if (mmu_notifier_retry(kvm, mmu_seq))
 		goto out_unlock;
 
-	if (writeable) {
+	if (writable) {
 		kvm_set_pfn_dirty(hfn);
 		mark_page_dirty(kvm, gfn);
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index dbb09afd7546..f4e569688619 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -417,17 +417,17 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	struct kvm_memory_slot *memslot;
 	unsigned long hva, fault_addr;
-	bool writeable;
+	bool writable;
 	gfn_t gfn;
 	int ret;
 
 	fault_addr = (trap->htval << 2) | (trap->stval & 0x3);
 	gfn = fault_addr >> PAGE_SHIFT;
 	memslot = gfn_to_memslot(vcpu->kvm, gfn);
-	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writeable);
+	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
 
 	if (kvm_is_error_hva(hva) ||
-	    (trap->scause == EXC_STORE_GUEST_PAGE_FAULT && !writeable)) {
+	    (trap->scause == EXC_STORE_GUEST_PAGE_FAULT && !writable)) {
 		switch (trap->scause) {
 		case EXC_LOAD_GUEST_PAGE_FAULT:
 			return emulate_load(vcpu, run, fault_addr,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
