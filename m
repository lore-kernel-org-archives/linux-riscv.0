Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5CBCD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 07:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wJHB3xTyeYgSPxlUx8FVAwHzWuRBAcdsWU54sZRaALc=; b=zy4ovvcr3jqTCn
	gz4hn7N82m2NKgoQVzFY/tnS85fHUk7AaA7jYFgdDmIc1RCIbDL66yW0x0qmma0xhaspP19Dm7PJx
	PvWDNplU/zIs3Uh7gJSELMVYD7TBq1BA2DnmWlNprRSlSWgXpfGvUIH+ecR8oQZ77wee6hHs9L/OR
	XNj0zGE5uiqApykO7746nC9PKBsNYC565TM4ZqEmO15Jef6lx2SRkA4WZ6wjAmEKNJr92zXANIOaP
	hlJvygzVR37YDMSTA+Hteq5Kh3KcaGRDF3EdhqT2CIuSQoLfk3CfoEmGYRwFLvYz6JHGGN/OQgi1P
	ytFji1/Yj8/IJgR7B7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrYxe-0000000A8Fe-1wvr;
	Tue, 02 Apr 2024 07:53:38 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrYxO-0000000A81j-1Atz;
	Tue, 02 Apr 2024 07:53:25 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V80RS5xc3zwRBB;
	Tue,  2 Apr 2024 15:50:28 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B67C140415;
	Tue,  2 Apr 2024 15:53:15 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 15:53:14 +0800
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
Subject: [PATCH 0/7] arch/mm/fault: accelerate pagefault when badaccess
Date: Tue, 2 Apr 2024 15:51:35 +0800
Message-ID: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_005322_536947_D945F18B 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
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

After VMA lock-based page fault handling enabled, if bad access met
under per-vma lock, it will fallback to mmap_lock-based handling,
so it leads to unnessary mmap lock and vma find again. A test from
lmbench shows 34% improve after this changes on arm64,

  lat_sig -P 1 prot lat_sig 0.29194 -> 0.19198

Only build test on other archs except arm64.

Kefeng Wang (7):
  arm64: mm: cleanup __do_page_fault()
  arm64: mm: accelerate pagefault when VM_FAULT_BADACCESS
  arm: mm: accelerate pagefault when VM_FAULT_BADACCESS
  powerpc: mm: accelerate pagefault when badaccess
  riscv: mm: accelerate pagefault when badaccess
  s390: mm: accelerate pagefault when badaccess
  x86: mm: accelerate pagefault when badaccess

 arch/arm/mm/fault.c     |  4 +++-
 arch/arm64/mm/fault.c   | 31 ++++++++++---------------------
 arch/powerpc/mm/fault.c | 33 ++++++++++++++++++++-------------
 arch/riscv/mm/fault.c   |  5 ++++-
 arch/s390/mm/fault.c    |  3 ++-
 arch/x86/mm/fault.c     | 23 ++++++++++++++---------
 6 files changed, 53 insertions(+), 46 deletions(-)

-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
