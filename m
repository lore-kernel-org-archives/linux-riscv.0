Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B59C0018C
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdFGUTf99kdlnKVKFXcCclUuqUBLq94qghh1mKy1EUE=; b=40InPk4v35W+Lv
	EMir38kYui1SwjJJ52ho6GqpxEIXvsHQFOTlaG8eHZRB8mvh8y4vFGHx6bdrt+J4RI35IKMXc8YKB
	BTcJPnxRKUpt9I/0HCN1NOHnnPmU8XCruzmjCE+qfbPuCrIJE2rIl10ECCkWFpPRhkNwYxiw88xyP
	UVj3hHeL8CfoVZDiLQ1VMIfxxb/GXvXasWgAUgRcYrrgJrZ70ALXAhL0zUrHpk7J5bin07LpdwW/0
	/JsWF/m/3DBQlZwFWevXcFf8gr/nXPtzdoJES/71d7RT4f/a3mOy9dxRhVlB0qzxUxZXlwNSnN+Ds
	yBwSLIH1VdoCQvSgkb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyadK-009s5W-2n;
	Thu, 02 Nov 2023 16:33:26 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyad9-009rxd-0V;
	Thu, 02 Nov 2023 16:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698942795; x=1730478795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Rx30kV34VqF67UIAymgDYBdZ21FZrZga0jsqNzydYSw=;
  b=Mw02MGd8mGcgIuJ4QD6nUx88rRuoKGuGIC/utoEkIokkrrBJR1r7RGIh
   M/phmhgsqNKmj6o22f/pPnab6PIRBRWS5UCa4SRzh3ul34COsMOZ4qBTc
   OEis43xQCRqrrZZWsKO1y7XSGAd2BaCY8g6F2g06esm0rSC/9KBWnJ9r/
   nEGWEPMJNqp5p9sXeGNQoMSD16WA7FWlqMZmgkoL8AEdUYieq7iiTqbzO
   lLkUt5U8sySSOgrN4QJqYcsBo167Gf/IT0pFT397fDq3V1YQxXdQsxqJP
   IXGiEuHIFKO4fCUHww+kLpHKo/2XiXgLE6C9ss2cnr6bcJTT6YYLktJ/+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="388570859"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="388570859"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="9448403"
Received: from arthur-vostro-3668.sh.intel.com ([10.239.159.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:04 -0700
From: Zeng Guang <guang.zeng@intel.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Zeng Guang <guang.zeng@intel.com>
Subject: [RFC PATCH v1 1/8] KVM: selftests: x86: Fix bug in addr_arch_gva2gpa()
Date: Thu,  2 Nov 2023 23:51:04 +0800
Message-Id: <20231102155111.28821-2-guang.zeng@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_093315_229946_64BCAA10 
X-CRM114-Status: GOOD (  10.58  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fix the approach to get page map from gva to gpa.

If gva maps a 4-KByte page, current implementation of addr_arch_gva2gpa()
will obtain wrong page size and cannot derive correct offset from the guest
virtual address.

Meanwhile using HUGEPAGE_MASK(x) to calculate the offset within page
(1G/2M/4K) mistakenly incorporates the upper part of 64-bit canonical
linear address. That will work out improper guest physical address if
translating guest virtual address in supervisor-mode address space.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index d8288374078e..9f4b8c47edce 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -293,6 +293,7 @@ uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
 	if (vm_is_target_pte(pde, level, PG_LEVEL_2M))
 		return pde;
 
+	*level = PG_LEVEL_4K;
 	return virt_get_pte(vm, pde, vaddr, PG_LEVEL_4K);
 }
 
@@ -496,7 +497,7 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 	 * No need for a hugepage mask on the PTE, x86-64 requires the "unused"
 	 * address bits to be zero.
 	 */
-	return PTE_GET_PA(*pte) | (gva & ~HUGEPAGE_MASK(level));
+	return PTE_GET_PA(*pte) | (gva & (HUGEPAGE_SIZE(level) - 1));
 }
 
 static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
-- 
2.21.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
