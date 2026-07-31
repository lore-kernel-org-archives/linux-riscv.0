Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F7DC5516D
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jyv1ptIZI3GZLbn10Qr1TfrPpqDnwhZnvSFiJPrLuKI=; b=sDKP+7s5KhHxUr
	mtFLwqAfxoM2TodKKdvpeuiWzPveQzgkWLM/jOcVuueM2g8AEgerWWtYM/BoJsztsX2pxTnJFIGVn
	ztcRZGjGp5ZZ+nrEQvEMFeBRMpj4zCLKkG4FG+CDmKwSHhZxdKiQE72wtWqlTnF853deXLsmnqtkZ
	IJz2nvs+nQjd9byqwCPrjuveAqiidaLOJ11UyaVEdhyQo2wWFCBRG6ZNX+QejVy1sNeriGVOE+D3x
	bVfe+CuC3/96WO41rhx4E+THrnR7If1Nccy8OYalt8woq4zKaYSbMNLPGMyFaixiVvZ2ZNPFe/Qk8
	78NDyZkFiY/LregonSeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjLb-0000000C9d1-1dYk;
	Fri, 31 Jul 2026 09:16:07 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjLV-0000000C9bh-3Hpb;
	Fri, 31 Jul 2026 09:16:05 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hBL5g50DYz57HS4;
	Fri, 31 Jul 2026 17:15:51 +0800 (CST)
Received: from szxl2zmapp05.zte.com.cn ([10.1.32.37])
	by mse-fl2.zte.com.cn with SMTP id 66V9FkWb064161;
	Fri, 31 Jul 2026 17:15:46 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Fri, 31 Jul 2026 17:15:49 +0800
X-Zmail-TransId: 3e816a6c67c4010-3c123
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: wang.yechao255@zte.com.cn
From: Wang Yechao <wang.yechao255@zte.com.cn>
To: Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Wang Yechao <wang.yechao255@zte.com.cn>
Subject: [PATCH v5 0/5] Implement Eager Page Splitting for RISC-V
Date: Fri, 31 Jul 2026 17:12:05 +0800
Message-ID: <20260731091215.1549430-1-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 66V9FkWb064161
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 31 Jul 2026 17:15:51 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A6C67C7.001/4hBL5g50DYz57HS4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_021602_068553_B4631D05 
X-CRM114-Status: GOOD (  12.87  )
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

Eager Page Splitting is implemented on x86 and ARM. It improves the
performance of dirty logging (used in live migrations) when guest memory
is backed by huge pages.

This series implement Eager Page Splitting for RISC-V. The Implementation
similar to x86 and ARM. It provides two ways to split huge pages in ioctl
context instead of on fault in vCPU context:

- Split huge pages when dirty logging is enabled when
  KVM_DIRTY_LOG_INITIALLY_SET is not set. This happens when enabling the
  KVM_MEM_LOG_DIRTY_PAGES flag of a memslot, and splits the whole memslot
  into 4K mappings.

- Split huge pages during KVM_CLEAR_DIRTY_LOG when
  KVM_DIRTY_LOG_INITIALLY_SET is set. This happens when enabling dirty log
  in small chunks. It does not split the whole memslot, but only the
  requested chunk range.

Changes in v5:
 - PATCH1: Move pgd_split_page_cache freeing to kvm_riscv_mmu_free_pgd().
 - PATCH3: Add a comment to explain why TLB flush is not needed here.
 - Link to v4:
 https://lore.kernel.org/linux-riscv/20260701120954.129873-1-wang.yechao255@zte.com.cn/

Changes in v4:
 - Rebase on v7.2-rc1 version.
 sashiko-bot AI review
 (https://sashiko.dev/#/patchset/20260624160054463wcDvJaMoydSggcNOWgcfB@zte.com.cn)
 - Add the rwlock_needbreak() check when toup split cache.
 - ALIGN_DOWN the start addr to PMD_SIZE.

Changes in v3 resend:
 - Fix patch format to ensure emails reach the linux-riscv and kvm-riscv
   mailing lists.
 - Move the free pgd_split_page_cache into kvm_arch_destroy_vm().
 https://lore.kernel.org/kvm-riscv/20260624160054463wcDvJaMoydSggcNOWgcfB@zte.com.cn/

Changes in v3:
 - Rebase on v7.1 version.
 - Add patch03 to remove the redundant TLB flush operations.
 
 sashiko-bot AI review
 (https://sashiko.dev/#/message/20260603104847.9692C1F00893%40smtp.kernel.org)
 - Check the kvm->arch.pgd before split huge pages.
 - Align the start address to PMD_SIZE before split.
 - Flushing remote TLBs before Dropping mmu_lock.

Changes in v2:
 - Rename the split_page_cache.
 - Rename the kvm_riscv_split_huge_pages and
   kvm_riscv_split_memory_region.
 - Add lockdep_assert_held check before split huge pages.
 - Update Documentation/admin-guide/kernel-parameters.txt.
 - Link to v2
 https://lore.kernel.org/linux-riscv/20260603175256408L0jnqGs1cJGc0ijCdujci@zte.com.cn/

 - Link to v1:
 https://lore.kernel.org/linux-riscv/20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn/

Wang Yechao (5):
  RISC-V: KVM: Add the split page cache for ioctl context
  RISC-V: KVM: Split huge pages when dirty logging is enabled
  RISC-V: KVM: Remove redundant TLB flush operations
  RISC-V: KVM: Split huge pages during KVM_CLEAR_DIRTY_LOG
  RISC-V: KVM: Add the eager_page_split module parameter

 .../admin-guide/kernel-parameters.txt         |   7 +-
 arch/riscv/include/asm/kvm_gstage.h           |   6 +-
 arch/riscv/include/asm/kvm_host.h             |   1 +
 arch/riscv/kvm/gstage.c                       |  23 ++--
 arch/riscv/kvm/mmu.c                          | 100 +++++++++++++++++-
 5 files changed, 120 insertions(+), 17 deletions(-)

-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
