Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41579C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 09:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=df4ENRqvWvIHneel1tbYdWHSjT+VCVmBG8MsoBm5Gi4=; b=R1+TLdmVpzKJFR
	0+08u4W0ZnSlXl8It9y6IpNp0Ts75CKmxhcb5R/qT64oBTSZ86opn/rQsa4t3V7B2eXZrSF1pOoj3
	SoF67IPtDQr+7BZDLwbeCdYoh5tdOzvx5ygQt3RCuxw1qeiKbe8Mls4NrkbR93W1ZN5hcT8F9Xflw
	i1swSKh2unvfmedKkVLMP1eVQismQUFOUIrcO4rpG/ZC8zQ4frc8ZrlugVPT9FjZaGeaLafREpgNG
	EKpvn/pjNvarDDaW2P79WFaa0cYXt7xlfkERP2/G6V2aLi2FfUbOSVFq/Vg+ty+4xnUzvyuceqYly
	0EhksiJ/hqnrYO4/b6ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsoq-002ed6-0j;
	Thu, 13 Jul 2023 09:41:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsog-002eTN-1v;
	Thu, 13 Jul 2023 09:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IV4DNkdW4Hd8ZP157oL1HKEHrRYXoRV6592fFT5pGzE=; b=bYDz+GFwns4m99l5+kRLyA2+BA
	mfSz5eSAfrDWV4wFoAXZKB8G+MW3sKavXjQDyWI80ncIq3+JEo4YHzgitTPf+YDu1MXAvA0uKK1WL
	terxkDKjySrbpWfk96ElqI3E++m0aLGTnNaP2XPAg0rmCbBkkQPS02u5pa7D3wlrmB+qtqDOqpOgp
	WNMXgIpk1jCQU/kXf6x4s5DSGCDpIvIOyCEJROBaM0TQzMIm9/JxrvxUKP22k7qSSlc4/gUanpQbp
	KPK/Y2URxMjRxpvLtwPZRzV3innywuekj1YIx1TZm52PHCeaaKnMNB1UmfS0T56Xjl94OUonKorjQ
	pImzJ7kw==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsoc-004bMr-2P;
	Thu, 13 Jul 2023 09:40:53 +0000
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R1qMZ56yBzrRn7;
	Thu, 13 Jul 2023 17:39:54 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 17:40:30 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
	<surenb@google.com>
CC: Russell King <linux@armlinux.org.uk>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Kefeng Wang
	<wangkefeng.wang@huawei.com>
Subject: [PATCH rfc -next 07/10] ARM: mm: try VMA lock-based page fault handling first
Date: Thu, 13 Jul 2023 17:53:35 +0800
Message-ID: <20230713095339.189715-8-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
References: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_104051_498216_2DC8EC93 
X-CRM114-Status: GOOD (  13.20  )
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

Attempt VMA lock-based page fault handling first, and fall back
to the existing mmap_lock-based handling if that fails.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/arm/Kconfig    |  1 +
 arch/arm/mm/fault.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 1a6a6eb48a15..8b6d4507ccee 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -34,6 +34,7 @@ config ARM
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT if CPU_V7
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
+	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index fef62e4a9edd..c44b83841e36 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -244,6 +244,7 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	vm_fault_t fault;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 	unsigned long vm_flags = VM_ACCESS_FLAGS;
+	struct vm_locked_fault vmlf;
 
 	if (kprobe_page_fault(regs, fsr))
 		return 0;
@@ -278,6 +279,18 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
+	VM_LOCKED_FAULT_INIT(vmlf, mm, addr, flags, vm_flags, regs, fsr);
+	if (try_vma_locked_page_fault(&vmlf, &fault))
+		goto retry;
+	else if (!(fault | VM_FAULT_RETRY))
+		goto done;
+
+	if (fault_signal_pending(fault, regs)) {
+		if (!user_mode(regs))
+			goto no_context;
+		return 0;
+	}
+
 retry:
 	vma = lock_mm_and_find_vma(mm, addr, regs);
 	if (unlikely(!vma)) {
@@ -316,7 +329,7 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	}
 
 	mmap_read_unlock(mm);
-
+done:
 	/*
 	 * Handle the "normal" case first - VM_FAULT_MAJOR
 	 */
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
