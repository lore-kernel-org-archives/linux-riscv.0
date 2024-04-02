Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B65C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 07:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPvqChdPMqKdNpP8DZ2JW2/l8a9uvRjD1RaH9Fu70QI=; b=zuz/na1kZ+wdvw
	re3iaSjJegMttpeiUl83kIyAmNSuiGXW4gvymGHPw9Iv68R9y+/vuWZCGiebHeJY+d8OKughC6sS9
	MYUiwTJsW7V/JHBdIb92J44rSyUf6VFpGbABAvU05WzMFqhhy4X4dD1g+JyOCmcRPoFlw40KAaSZy
	4pGSjcL/ng1aPCbabvLONe7G1nxcNOkppJGkKGmXAsaK2wLUDwwyzF7B2keKH+eJgJ8zixwb1yMWt
	05OXuWRjmQ/PjI/Bb+HB0FdnkNJTO5IcSXpmOBlfJIKeaBXeMV17uUUSShixkFO1df5FIS8k59VC3
	/nR/tQU2i13MVKNP64Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrYxV-0000000A88b-1zof;
	Tue, 02 Apr 2024 07:53:29 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrYxN-0000000A81k-3I57;
	Tue, 02 Apr 2024 07:53:23 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4V80RY0PFcz1R9f5;
	Tue,  2 Apr 2024 15:50:33 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 267511A016C;
	Tue,  2 Apr 2024 15:53:18 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 15:53:17 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <akpm@linux-foundation.org>
CC: Russell King <linux@armlinux.org.uk>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <surenb@google.com>, Kefeng Wang
	<wangkefeng.wang@huawei.com>
Subject: [PATCH 3/7] arm: mm: accelerate pagefault when VM_FAULT_BADACCESS
Date: Tue, 2 Apr 2024 15:51:38 +0800
Message-ID: <20240402075142.196265-4-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_005322_058001_C78B35B2 
X-CRM114-Status: GOOD (  11.07  )
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

The vm_flags of vma already checked under per-VMA lock, if it is a
bad access, directly set fault to VM_FAULT_BADACCESS and handle error,
so no need to lock_mm_and_find_vma() and check vm_flags again.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/arm/mm/fault.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 439dc6a26bb9..5c4b417e24f9 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -294,7 +294,9 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 
 	if (!(vma->vm_flags & vm_flags)) {
 		vma_end_read(vma);
-		goto lock_mmap;
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+		fault = VM_FAULT_BADACCESS;
+		goto bad_area;
 	}
 	fault = handle_mm_fault(vma, addr, flags | FAULT_FLAG_VMA_LOCK, regs);
 	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
