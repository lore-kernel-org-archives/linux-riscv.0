Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917ABC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8n9rX8H//pSYVqWDl2zdB24iGkvRVWdgtf5kGAWdBQ=; b=suZ2eAe7k4xU/q
	R5AKF2ukJVU+XmYnSERRie83rEdiEyWn2So5Efu2+8qWWgKWhgmlIDXilNMNflCbrJc9a5Qyks5/D
	NSCTCscU3nAYhZhObDCj9lG0iwSaFdJ9WufEbBZaGUKRnFGMokX/mC0VBaiAWl3KEd0/Q0G/1E1a7
	l/itHN6kykSzbgPXw7iSsMmjVew5xSvFH3RWhNxNMcFP5OcTvQYQVAfLlNE55IgAKTncQ/sYlHKH+
	R0WhYXgmBQs7FLsnqnT1fWXDNzMtrD3uAj5lweOBZKkqxQDLwGXM082S6SifX8OGFbtSR6H94/yoi
	hMy7NJ+/mdE8pCGigmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw9V-0000000Ewps-0B3r;
	Wed, 03 Apr 2024 08:39:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw8v-0000000EwJM-2fVA;
	Wed, 03 Apr 2024 08:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7HHcWzzE9AwVcj9rXnePyGty9Nb+tULGuXwsa1lDWyA=; b=cEpNV4o622BRQddFRxgb7vx53w
	y8KKyKogGtG3aCjMHz4nkP4DniTR5uWCA5VNbt6/vvUkAcsydcMm9l+woqUrgA8UapVxbNJ47QD8/
	gCbKY592QjAgDl2SaJSGKdv53y310N5H2SVWpH5BeWAFeiTjGDXeL8O1Btv6zZuD5HF009YATeod/
	3oCdGggkN/QFWHMKWMYUJy9ipDYix1ZsHHunDdDfGTDVr66FUnrh9waMgRWTo5gOU7/nZ40tsJs81
	Qk93ROOOePKONGu2wClBbaJ+t51JhLyfuzgkPo8H8NdLviVkHrn/GrOhALfIbrTYAcIOh5rMQAU8F
	JwFM30HQ==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw8p-000000046AJ-3mue;
	Wed, 03 Apr 2024 08:38:46 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V8dPB65yQz29lXY;
	Wed,  3 Apr 2024 16:35:42 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 7BC4E180063;
	Wed,  3 Apr 2024 16:38:28 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 16:38:27 +0800
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
Subject: [PATCH v2 6/7] s390: mm: accelerate pagefault when badaccess
Date: Wed, 3 Apr 2024 16:38:04 +0800
Message-ID: <20240403083805.1818160-7-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_093844_565945_88DA04C7 
X-CRM114-Status: GOOD (  10.69  )
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
bad access, directly handle error, no need to retry with mmap_lock
again. Since the page faut is handled under per-VMA lock, count it
as a vma lock event with VMA_LOCK_SUCCESS.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/s390/mm/fault.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index c421dd44ffbe..162ca2576fd4 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -325,7 +325,8 @@ static void do_exception(struct pt_regs *regs, int access)
 		goto lock_mmap;
 	if (!(vma->vm_flags & access)) {
 		vma_end_read(vma);
-		goto lock_mmap;
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+		return handle_fault_error_nolock(regs, SEGV_ACCERR);
 	}
 	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
 	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
