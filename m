Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906A8C5AD5A
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 10:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QikliT4V9iPKhHmZ6EQiZYw2hliqqTn2qZTdmlfmIGI=; b=TkorpC+U8nLqj+
	sGLDSS1nhVUwZix5+K/Uq5bzcItCSladG0cuJiHxxh80hDa9WSvaUdefocjdZDM9gXSJ6mEnK15C1
	Z3mPb4YmKeGk/edsNWtyEQEIWztN1CAN6Iehq5/AXX1ZXJRS2R2ZWZr4zLl61Ek4kGecvEujc99SY
	Vj6b+5rLC3GmEqk0tyAdm6wIEFtC1003Y1NVamDeyOBGcuQJRS7rZfkkx/qBnYqm18SuPbd5oR7Sh
	vY2cHl8KCTJlk+iNtOxZOh6VVT4/NlOwFhZFm2kkROlJT7D4H2CYFU/UKs6r7yhCaJprdNEpDrZ+M
	wr1flViK3icgjIQwSObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBh9-00000003kEJ-2OKN;
	Sat, 15 Aug 2026 10:32:55 +0000
Received: from out-210.mta0.migadu.com ([2001:41d0:1004:224b::d2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBh6-00000003kDt-3EUr
	for linux-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 10:32:54 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Ibq8FmFzfS79pa12j1e6KYtVVh8objCmcS0oBVDNFx4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786789970; v=1; x=1787394770;
 b=g8ivNWyO3v3Dij2KONxAnpatucSpKfXzw+XfxpIKqN/3zbljg4ePgHMhbnVnUICOELUn8LCR
 7njT5k+rmYDbRwV/jz1nHX3jxONhCApLOrYFPRDjsAev7oGN5GalgKCiyUek38M4JDNEunBsaP/
 2i6foFGgIP8ywmnaHIgtntiQ=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: from localhost.localdomain (2408:823d:2011:2c0:e810:54f9:f0a3:99d)
	by smtp.migadu.com with ESMTPS id 970a23246370098d;
	Sat, 15 Aug 2026 10:32:50 +0000
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH v4 RESEND 2/5] KVM: riscv: Avoid THP adjustment for existing 4K G-stage leaves
Date: Sat, 15 Aug 2026 06:32:45 -0400
Message-ID: <20260815103245.864925-1-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815102833.864330-1-jinyu.tang@linux.dev>
References: <20260815102833.864330-1-jinyu.tang@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_033252_950422_37E205F8 
X-CRM114-Status: GOOD (  13.95  )
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

When dirty logging is disabled after a G-stage PMD mapping has been
split, the fault path may see a 4K G-stage leaf while the backing host
page is still THP-backed. The existing kvm_riscv_gstage_map_page()
comment says that this path should update the small leaf and leave huge
mapping recovery to a later ioctl path.

However, transparent_hugepage_adjust() runs before that G-stage lookup
and rewrites the fault GPA to the PMD base. If the original fault is not
at the PMD base, the lookup can find and update the wrong 4K leaf.

Check the original fault GPA in transparent_hugepage_adjust(). If it
already has a 4K G-stage leaf, skip THP adjustment and keep handling the
fault at PAGE_SIZE granularity.

Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
---
 arch/riscv/kvm/mmu.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index bfd6168ebe30..2fabcd409991 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -500,10 +500,21 @@ static int get_hva_mapping_size(struct kvm *kvm,
 
 static unsigned long transparent_hugepage_adjust(struct kvm *kvm,
 						 struct kvm_memory_slot *memslot,
+						 struct kvm_gstage *gstage,
 						 unsigned long hva,
 						 kvm_pfn_t *hfnp, gpa_t *gpa)
 {
 	kvm_pfn_t hfn = *hfnp;
+	u32 ptep_level;
+	pte_t *ptep;
+
+	/*
+	 * Keep the existing split G-stage leaf and update the original
+	 * faulting 4K page in the vCPU fault path.
+	 */
+	if (kvm_riscv_gstage_get_leaf(gstage, *gpa, &ptep, &ptep_level) &&
+	    !ptep_level)
+		return PAGE_SIZE;
 
 	/*
 	 * Make sure the adjustment is done only for THP pages. Also make
@@ -730,7 +741,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	 * so do not promote them through the THP helper.
 	 */
 	if (!logging && !is_hugetlb && vma_pagesize == PAGE_SIZE)
-		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, hva, &hfn, &gpa);
+		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, &gstage,
+							   hva, &hfn, &gpa);
 
 	if (writable) {
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
