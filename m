Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52804CD128D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Q1ey2Rr15fkJCvCpzdvToilleazlnwVVzotUcMkaMU=; b=dZYwUX9tLoHL3Z
	Hf9B3bjglxx6PLDPLDGH9kotfT6Tbb50Xk0TQxLnuY3eFAAqiYHAjInUYdgbQQ6ZbwebBBc/Yz+zL
	ZszRviSutTXCg648Ps3lnNBDvtPIcuUWOSC7yQefqYr3tOL3aOOyNKw63hZPDVbnrZQKsdR27ih8d
	09vs6ZIwaTA6we7Z6rjTWGrACgMtBLCoR10miCMn0ujXapbXEpYW1oc38hHzvka4tln8B/QLZ7Ojh
	W9NlLbfdjMkY9ukW8BqNgIIgLsHm0wra2BoVWnURgG4AWA6esQk9hcQZUdkkd73Y0qmWWVkDl2Ssj
	Y7hQXvKeT3REx6STuG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw8i-0000000Ew5d-47qS;
	Wed, 03 Apr 2024 08:38:36 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw8c-0000000Evyk-0hZj;
	Wed, 03 Apr 2024 08:38:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V8dP54B5kz1h5X1;
	Wed,  3 Apr 2024 16:35:37 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 0D7F8140410;
	Wed,  3 Apr 2024 16:38:23 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 16:38:22 +0800
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
Subject: [PATCH v2 0/7] arch/mm/fault: accelerate pagefault when badaccess
Date: Wed, 3 Apr 2024 16:37:58 +0800
Message-ID: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_013830_791347_281C897F 
X-CRM114-Status: UNSURE (   7.58  )
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

v2: 
- a better changelog, and describe the counting changes, suggested by
  Suren Baghdasaryan
- add RB

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
