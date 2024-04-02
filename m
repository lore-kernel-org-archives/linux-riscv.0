Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8FCCD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFUeopbIyMepePJwqtYhaIjw/2O1eQ+tu22P6vWNk+Q=; b=NY4jys+GPCZU4c
	yuwIaIrnpxt0rt/ymkp4jjoXiUksTXabgu4soRKO6/yrhyIXd4/qXnXefryHlxtsPzYK8zIiFR6KX
	hsXayMPY1cEbNdUXeVFLvyGWZDQY800aWiueOhRAPi2zqynMDSinNKk8m1A4CGHNHnsEexFwXArtn
	wXbs/XoXusN+VqociMQU8uUJLeqJe7liD21S9Bum3XGAPJpyUL+WgtA9W3FytsZOt+KuTtpO+DHfy
	IkIJGG8+d1Shd2kz1lhLm8Mz51iL/yzfHXMwlpJGGOy+ZaeLbgRGnHZV8ULHn2xbEuTTbQrimhfCa
	i0nBrVXaICa0/LM4QblA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZ0T-0000000A9Wf-3bML;
	Tue, 02 Apr 2024 07:56:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZ0E-0000000A9Ui-2s4e;
	Tue, 02 Apr 2024 07:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=s63mY4NKBPmN8uvTPNOa0oeJhsDly0BRCa2ZGt+fbXg=; b=m25Bo4dAMBTBn67uqpaH7zPXrA
	wRkWrN47hhkgMz0yelivbuDiLOBU8urBAsk7KwlM34EdqF22J2Do8sawZJiQH6SAPUaEPZAcGnFER
	PcKCC4DDW0XpsxpMHiTkRDxst//hC7S2wYK0Oi7wAF724VS8xSvWPZV7laSv8SC1E4SSQ+/X1RLz+
	nu3YLKo1T7SnMrqJRxX4Q9RZTTzFQeoeNOZvWF/DKKB+nsI9a2irbzx8CRvlTq3gxVrmCQrDbJKMa
	zIB4E1yVAG7cGNp1yFWhk/LOzNOnjxeiroQTZY8Om97CPV9hLAUi8VpAnWCBxvbkBtjF4ZQH202Jp
	TrlyGWLg==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrYyC-00000003V4K-30ml;
	Tue, 02 Apr 2024 07:56:05 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V80Rc70dCz29kHr;
	Tue,  2 Apr 2024 15:50:36 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id B81221A016C;
	Tue,  2 Apr 2024 15:53:21 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 15:53:20 +0800
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
Subject: [PATCH 7/7] x86: mm: accelerate pagefault when badaccess
Date: Tue, 2 Apr 2024 15:51:42 +0800
Message-ID: <20240402075142.196265-8-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_085509_132701_218DD50A 
X-CRM114-Status: GOOD (  13.13  )
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
bad access, directly handle error and return, there is no need to
lock_mm_and_find_vma() and check vm_flags again.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/x86/mm/fault.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index a4cc20d0036d..67b18adc75dd 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -866,14 +866,17 @@ bad_area_nosemaphore(struct pt_regs *regs, unsigned long error_code,
 
 static void
 __bad_area(struct pt_regs *regs, unsigned long error_code,
-	   unsigned long address, u32 pkey, int si_code)
+	   unsigned long address, struct mm_struct *mm,
+	   struct vm_area_struct *vma, u32 pkey, int si_code)
 {
-	struct mm_struct *mm = current->mm;
 	/*
 	 * Something tried to access memory that isn't in our memory map..
 	 * Fix it, but check if it's kernel or user first..
 	 */
-	mmap_read_unlock(mm);
+	if (mm)
+		mmap_read_unlock(mm);
+	else
+		vma_end_read(vma);
 
 	__bad_area_nosemaphore(regs, error_code, address, pkey, si_code);
 }
@@ -897,7 +900,8 @@ static inline bool bad_area_access_from_pkeys(unsigned long error_code,
 
 static noinline void
 bad_area_access_error(struct pt_regs *regs, unsigned long error_code,
-		      unsigned long address, struct vm_area_struct *vma)
+		      unsigned long address, struct mm_struct *mm,
+		      struct vm_area_struct *vma)
 {
 	/*
 	 * This OSPKE check is not strictly necessary at runtime.
@@ -927,9 +931,9 @@ bad_area_access_error(struct pt_regs *regs, unsigned long error_code,
 		 */
 		u32 pkey = vma_pkey(vma);
 
-		__bad_area(regs, error_code, address, pkey, SEGV_PKUERR);
+		__bad_area(regs, error_code, address, mm, vma, pkey, SEGV_PKUERR);
 	} else {
-		__bad_area(regs, error_code, address, 0, SEGV_ACCERR);
+		__bad_area(regs, error_code, address, mm, vma, 0, SEGV_ACCERR);
 	}
 }
 
@@ -1357,8 +1361,9 @@ void do_user_addr_fault(struct pt_regs *regs,
 		goto lock_mmap;
 
 	if (unlikely(access_error(error_code, vma))) {
-		vma_end_read(vma);
-		goto lock_mmap;
+		bad_area_access_error(regs, error_code, address, NULL, vma);
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+		return;
 	}
 	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
 	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
@@ -1394,7 +1399,7 @@ void do_user_addr_fault(struct pt_regs *regs,
 	 * we can handle it..
 	 */
 	if (unlikely(access_error(error_code, vma))) {
-		bad_area_access_error(regs, error_code, address, vma);
+		bad_area_access_error(regs, error_code, address, mm, vma);
 		return;
 	}
 
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
