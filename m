Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B15C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ob8VXnYuPqRtUkHQryquoeLDKXY1iFIY0DdzdnhZ8Ms=; b=z9Q0Kldovu6Bv3
	Sy/2hvUmfp+Qntf2sH6MNwmCJtFTlAKbI0hT0R2+co/JqWREhnOed8HOEAIETpulb+M+izL/iH3m/
	cNrOYev4sotJfo0ZhARm+5W53bZOXuCJ1trGW8Dk5rxv29/So+INXXjzJXW96bCiDZYcXU+BUB3gX
	JuPPQOdCCIp37Ic7+ZEijN3TthowcPJr7nl/ctaafEZJbbGvIgMhs5MgVDIlWhq5hqOF2aC5ZRKz4
	cGQ8Zcj5UdFLcVM/1G+MR0ufbLgpFhqy84akPR4xwy/tbBvg3fRczAjj3UVsDswyATnKCBUfJuSN5
	MkfDiUSkoZqSOntGennw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw95-0000000EwUK-3nXO;
	Wed, 03 Apr 2024 08:38:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw8t-0000000EwGP-0iuD;
	Wed, 03 Apr 2024 08:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vhZLrHVELrtbu5DW0tOonOUKFnnhSmrXd1Sgos/yGkA=; b=qXGvFb6KH8qbYPpN9yT+RPXzJV
	ITqt4CADYXU491pM0hb66PBasPNt7uc4AWhp5YWXiDrHqb7bKfvJZBsftdCerWMshpmF8uJEjgs9F
	fu8HkHlNOdPcy7lLw/LkKlRyYdAf+Mg+AZn6YJGQfDB3kUZ0hAhzr/sB8fGYsdixS1bCoiHP8x9+G
	IgyivqNPjwH0nNZlJH2UcYJrpQfQn6oPn4H3BEEO3myRefcZNx+IUkwERY9woQqfQhU93uGOcmHxu
	3w4/OToTpvT8b9ogcaUGLZtQg/DbaLPs+2ylGrSZ2Mx/kcXiOII3Sy1Vv315kaCnkoQJgelL6Rxpw
	wV6xQD1g==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw8n-000000046AQ-3m7M;
	Wed, 03 Apr 2024 08:38:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V8dP90NXPz29lXd;
	Wed,  3 Apr 2024 16:35:41 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id B1225140410;
	Wed,  3 Apr 2024 16:38:26 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 16:38:25 +0800
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
	<linux-s390@vger.kernel.org>, <surenb@google.com>, <linux-mm@kvack.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH v2 4/7] powerpc: mm: accelerate pagefault when badaccess
Date: Wed, 3 Apr 2024 16:38:02 +0800
Message-ID: <20240403083805.1818160-5-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_093842_773084_D3A7CFC6 
X-CRM114-Status: GOOD (  14.29  )
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

The access_[pkey]_error() of vma already checked under per-VMA lock, if
it is a bad access, directly handle error, no need to retry with mmap_lock
again. In order to release the correct lock, pass the mm_struct into
bad_access_pkey()/bad_access(), if mm is NULL, release vma lock, or
release mmap_lock. Since the page faut is handled under per-VMA lock,
count it as a vma lock event with VMA_LOCK_SUCCESS.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/powerpc/mm/fault.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 53335ae21a40..215690452495 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -71,23 +71,26 @@ static noinline int bad_area_nosemaphore(struct pt_regs *regs, unsigned long add
 	return __bad_area_nosemaphore(regs, address, SEGV_MAPERR);
 }
 
-static int __bad_area(struct pt_regs *regs, unsigned long address, int si_code)
+static int __bad_area(struct pt_regs *regs, unsigned long address, int si_code,
+		      struct mm_struct *mm, struct vm_area_struct *vma)
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
 
 	return __bad_area_nosemaphore(regs, address, si_code);
 }
 
 static noinline int bad_access_pkey(struct pt_regs *regs, unsigned long address,
+				    struct mm_struct *mm,
 				    struct vm_area_struct *vma)
 {
-	struct mm_struct *mm = current->mm;
 	int pkey;
 
 	/*
@@ -109,7 +112,10 @@ static noinline int bad_access_pkey(struct pt_regs *regs, unsigned long address,
 	 */
 	pkey = vma_pkey(vma);
 
-	mmap_read_unlock(mm);
+	if (mm)
+		mmap_read_unlock(mm);
+	else
+		vma_end_read(vma);
 
 	/*
 	 * If we are in kernel mode, bail out with a SEGV, this will
@@ -124,9 +130,10 @@ static noinline int bad_access_pkey(struct pt_regs *regs, unsigned long address,
 	return 0;
 }
 
-static noinline int bad_access(struct pt_regs *regs, unsigned long address)
+static noinline int bad_access(struct pt_regs *regs, unsigned long address,
+			       struct mm_struct *mm, struct vm_area_struct *vma)
 {
-	return __bad_area(regs, address, SEGV_ACCERR);
+	return __bad_area(regs, address, SEGV_ACCERR, mm, vma);
 }
 
 static int do_sigbus(struct pt_regs *regs, unsigned long address,
@@ -479,13 +486,13 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 
 	if (unlikely(access_pkey_error(is_write, is_exec,
 				       (error_code & DSISR_KEYFAULT), vma))) {
-		vma_end_read(vma);
-		goto lock_mmap;
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+		return bad_access_pkey(regs, address, NULL, vma);
 	}
 
 	if (unlikely(access_error(is_write, is_exec, vma))) {
-		vma_end_read(vma);
-		goto lock_mmap;
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+		return bad_access(regs, address, NULL, vma);
 	}
 
 	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
@@ -521,10 +528,10 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 
 	if (unlikely(access_pkey_error(is_write, is_exec,
 				       (error_code & DSISR_KEYFAULT), vma)))
-		return bad_access_pkey(regs, address, vma);
+		return bad_access_pkey(regs, address, mm, vma);
 
 	if (unlikely(access_error(is_write, is_exec, vma)))
-		return bad_access(regs, address);
+		return bad_access(regs, address, mm, vma);
 
 	/*
 	 * If for any reason at all we couldn't handle the fault,
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
