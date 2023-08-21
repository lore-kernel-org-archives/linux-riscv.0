Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E7DEE49A6
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 12:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IxCJvjnwqwvUPRIUh1tdlHFk6/Z+TXogDoxudDGtLHQ=; b=WS4OQmMqfhT6eD
	3yTsybTE4v1CYSKm88tzrzAOLKo3mW/FPXG97yw08TAlKrq1XqrVUa7d3lJ+aZhvWtAmWa4ExUwNS
	+sNY5IiRNswPKgvvqgVMxg8wXQfSpXL5XVlt99JNUrcg3I6VjgHZwHrtKUO3QRsCtFUwxHHVMGVrk
	A4ej8sLwu4UY8/YNLBvcfaEwtGEM8YpEVIMW4ZDZ8mQY8Ha6LiYs4iocLp7sdQurfJ00JXMf3S+ll
	WbcSyl77/y13Gv426+i3pCNn8Yey7KMVagdaqMMb0qrq6xNixU0KSW7I9aywA8mZWP8HY+V/+U/Q5
	0Dn/nRr3Cqn+ru9VJn1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY444-00DyxT-20;
	Mon, 21 Aug 2023 12:31:24 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY440-00Dyrf-0m;
	Mon, 21 Aug 2023 12:31:22 +0000
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RTsHY0pyfzrSqg;
	Mon, 21 Aug 2023 20:29:45 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 20:31:11 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>
CC: <surenb@google.com>, <willy@infradead.org>, Russell King
	<linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Kefeng Wang
	<wangkefeng.wang@huawei.com>
Subject: [PATCH rfc -next v2 00/10] mm: convert to generic VMA lock-based page fault
Date: Mon, 21 Aug 2023 20:30:46 +0800
Message-ID: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_053120_734943_6471B349 
X-CRM114-Status: GOOD (  10.06  )
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

Add a generic VMA lock-based page fault handler in mm core, and convert
architectures to use it, which eliminate architectures's duplicated
codes.

With it, we can avoid multiple changes in architectures's code if we 
add new feature or bugfix, in the end, enable this feature on ARM32
and Loongarch.

This is based on next-20230817, only built test.

v2: 
- convert "int arch_vma_check_access()" to "bool arch_vma_access_error()"
  still use __weak function for arch_vma_access_error(), which avoid to
  declare access_error() in architecture's(x86/powerpc/riscv/loongarch)
  headfile.
- re-use struct vm_fault instead of adding new struct vm_locked_fault,
  per Matthew Wilcox, add necessary pt_regs/fault error code/vm flags
  into vm_fault since they could be used in arch_vma_access_error()
- add special VM_FAULT_NONE and make try_vma_locked_page_fault() to
  return vm_fault_t

Kefeng Wang (10):
  mm: add a generic VMA lock-based page fault handler
  arm64: mm: use try_vma_locked_page_fault()
  x86: mm: use try_vma_locked_page_fault()
  s390: mm: use try_vma_locked_page_fault()
  powerpc: mm: use try_vma_locked_page_fault()
  riscv: mm: use try_vma_locked_page_fault()
  ARM: mm: try VMA lock-based page fault handling first
  loongarch: mm: cleanup __do_page_fault()
  loongarch: mm: add access_error() helper
  loongarch: mm: try VMA lock-based page fault handling first

 arch/arm/Kconfig          |   1 +
 arch/arm/mm/fault.c       |  35 ++++++++----
 arch/arm64/mm/fault.c     |  60 ++++++++-------------
 arch/loongarch/Kconfig    |   1 +
 arch/loongarch/mm/fault.c | 111 ++++++++++++++++++++++----------------
 arch/powerpc/mm/fault.c   |  66 +++++++++++------------
 arch/riscv/mm/fault.c     |  58 +++++++++-----------
 arch/s390/mm/fault.c      |  66 ++++++++++-------------
 arch/x86/mm/fault.c       |  55 ++++++++-----------
 include/linux/mm.h        |  17 ++++++
 include/linux/mm_types.h  |   2 +
 mm/memory.c               |  39 ++++++++++++++
 12 files changed, 278 insertions(+), 233 deletions(-)

-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
