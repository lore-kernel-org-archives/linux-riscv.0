Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62598C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NT1TiNzbWhcNZhjfC86uIAR1EW8paCA79zgMW9gXJY=; b=qOyX9QT+7nFFU3
	C+1odT+dMoq9CU80nUiOjRJWTRM3hQ0OGVBX3kmCnVtNnVUMDtNA89A8ib3BfMXoNlxgHcRXZw1ow
	R4A9F15wbsd4Mr1/n48q0FqPYrGRB0liUIBWNKKhpmkXJ+pbq9ey3VQ72LyEu1tphQKuComI2f/5Q
	qwun9PvMdUUwbc2TQI2kkUWPWYeQXbrID41KcDcaCeWVsCV5tJ8jWWmRFFi5FaMjkxIBKs3vlodc/
	F9jHyh9OKuQi5xsdEpb2KdAMvtB9FU2G7G3oQ6915OlSrWvoxRZci3TQPvBGtByKAh/OGF8Y//XtF
	WoQzeddDfXRfIUQAhfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw9a-0000000EwuA-3Ait;
	Wed, 03 Apr 2024 08:39:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw8v-0000000EwJX-2xwj;
	Wed, 03 Apr 2024 08:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dnCIzWeY1qqTgbyWio8O1U8KrwKcOC13DqOIgOib+lg=; b=Qk8Rlfearr7rsoxMj5+r50lIys
	A2hYn0SrFqZDoOU7/gvdKTcyegTI74sE2WL3sHMXovcnpyXDnFxIMYPY7bBb8QH45KWANwwUFtVV+
	6cM35HO4e2H5c+MqFE4E6cvNMgSnc/cblnXplK65UIkkMUWA95dhL3g8TlFf5FRIGn5xXQToeyty4
	mbeQF814vsJi4Yd+Mq2BXXHzjrlWEmuVTM6RRNrz30ZMzjeMUctApeNr0AcSMQIUmD5oE+j3Iuolj
	2xZjSX/h5vIAtdmNoS643NDjkmVd7AfytUAeOg7+pnqdmJZQI0qtUJZuwfYyH3+G0DxliIwHm2cFV
	VHA/qmJA==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw8p-000000046AM-3osN;
	Wed, 03 Apr 2024 08:38:47 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V8dP72twYz1h5XQ;
	Wed,  3 Apr 2024 16:35:39 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id D79AA18001A;
	Wed,  3 Apr 2024 16:38:24 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 16:38:23 +0800
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
Subject: [PATCH v2 2/7] arm64: mm: accelerate pagefault when VM_FAULT_BADACCESS
Date: Wed, 3 Apr 2024 16:38:00 +0800
Message-ID: <20240403083805.1818160-3-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_093844_563978_7B356A24 
X-CRM114-Status: GOOD (  11.75  )
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
no need to retry with mmap_lock again, the latency time reduces 34% in
'lat_sig -P 1 prot lat_sig' from lmbench testcase.

Since the page faut is handled under per-VMA lock, count it as a vma lock
event with VMA_LOCK_SUCCESS.

Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/arm64/mm/fault.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 9bb9f395351a..405f9aa831bd 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -572,7 +572,9 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 
 	if (!(vma->vm_flags & vm_flags)) {
 		vma_end_read(vma);
-		goto lock_mmap;
+		fault = VM_FAULT_BADACCESS;
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+		goto done;
 	}
 	fault = handle_mm_fault(vma, addr, mm_flags | FAULT_FLAG_VMA_LOCK, regs);
 	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
