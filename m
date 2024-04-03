Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D02C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2ky7f1nvbNSRIjEEGrGTEvNsKTGtgnc7MeYXJXR0Ow=; b=kvw+v7Qs9nt5kF
	a23IGhKxhT8D6VXl5pKsGgMqoF4w5aWW9ouqg3h+ygE1CK2oKbdEa9AVyvsbY52k471XNtBevuDF4
	1geLena2jX2e/VVeux4KxTTYDAfa9RvTDlMGOMbnd65WlWUpqUWrHMKyxKFNk+Jzd7cl50RxqF1if
	yAPg+IBlyCgYdh/lFOhDW3PI3VmXBa6HVEfYqO3L6QsXzVyyfdEHXqWXwdsua6wH+a5695QfWHxLo
	BwiWQQYnDLI+N6cGQxHSqQ0Mk0lwqq2KQamIZHgyousxAJQMO0d/D6sJWH4qqohS3D5dBcS8Xj7qf
	XY8SFTLWjwdReUBSe75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw9i-0000000EwzN-0NWy;
	Wed, 03 Apr 2024 08:39:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw8v-0000000EwJN-2d2x;
	Wed, 03 Apr 2024 08:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Myv/h7kbb21tl1+xfuWM9tOyrAQENAdc7X/Z/48zHSM=; b=Qn4g6icSWtHfyY/FIqjAEqNEi9
	XomQC8NhN94yZMH5vZP2ZkmXBNONK0QdWfioMj1KPjyU1UPlLwix+7Vay0zhm0Da32hAsUUwjlDxQ
	TFEDo5faQt5oJK+t/cEt44H834iirRp0PJyJMEEs2n+Zn9Eehv6iQ9WeYem008XU8HPVFut9Pessx
	6FqtJLYDzlLpCqMNgW7EdpQ4AQh4IEYjpoUDxqQTbaMQ1DNEDfrUPdrnro6U25/nSLoCD/bzoxtWI
	zQWdyWc3iqmA+A2bEuZvNCwh/Uw3LMf1+t+bHPtpShzVb/JtuYYu8XX872WoLfMJ/GtGdIvZadZLL
	Xm68rH6g==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw8p-000000046AH-3mwe;
	Wed, 03 Apr 2024 08:38:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4V8dRJ4hz5zbf6r;
	Wed,  3 Apr 2024 16:37:32 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 97DF218007C;
	Wed,  3 Apr 2024 16:38:27 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 16:38:26 +0800
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
Subject: [PATCH v2 5/7] riscv: mm: accelerate pagefault when badaccess
Date: Wed, 3 Apr 2024 16:38:03 +0800
Message-ID: <20240403083805.1818160-6-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_093844_548840_46584719 
X-CRM114-Status: GOOD (  11.36  )
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

The access_error() of vma already checked under per-VMA lock, if it
is a bad access, directly handle error, no need to retry with mmap_lock
again. Since the page faut is handled under per-VMA lock, count it as
a vma lock event with VMA_LOCK_SUCCESS.

Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/mm/fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 3ba1d4dde5dd..b3fcf7d67efb 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -292,7 +292,10 @@ void handle_page_fault(struct pt_regs *regs)
 
 	if (unlikely(access_error(cause, vma))) {
 		vma_end_read(vma);
-		goto lock_mmap;
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+		tsk->thread.bad_cause = SEGV_ACCERR;
+		bad_area_nosemaphore(regs, code, addr);
+		return;
 	}
 
 	fault = handle_mm_fault(vma, addr, flags | FAULT_FLAG_VMA_LOCK, regs);
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
