Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CEEC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=olIq+MoD/MKfkEa4AfC5tZRiRQ4Deux64vtnNl1+GfQ=; b=VgqU+9Nlixv2Sw
	SURjhsbw7XbDXBPT5NzTzGC8WYDzEBvJf1BZwCgkg1RVoa1qiR1bsTnFb3nHmrFj5WeDHVjuqj0tX
	O9QE/HHR6hVw4bQQQpn1bE40DNB/I9M7vdQPBLV94mlCkRrSbSVeA6/glEyUJpl6Zfl0nTGBb1VEk
	hJD3ypzyzof7bttQxtB8fUq/HCecRiIwHv0+Am1MhpRTCV4xkkH3ag/pKMj7Cp95vKJWRubTlWI0X
	UjJ30UPGPmJGtJ3mL+nnDLB1jdHzDuLE1iKxV1KTvWxwhFQ5gtIzqgc7B5BqgZgO6cZz6IDso7+Tk
	ytbhpEXii5uPVB+nUwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWfSf-00BCV4-Gc; Tue, 22 Mar 2022 14:26:13 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWfSS-00BCOJ-1l; Tue, 22 Mar 2022 14:26:01 +0000
Received: from kwepemi100001.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KNDKx2LLzzcbFF;
 Tue, 22 Mar 2022 22:25:41 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100001.china.huawei.com (7.221.188.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Mar 2022 22:25:48 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Mar 2022 22:25:47 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 Tong Tiangen <tongtiangen@huawei.com>
Subject: [PATCH -next v2 0/4]mm: page_table_check: add support on arm64 and
 riscv
Date: Tue, 22 Mar 2022 14:44:43 +0000
Message-ID: <20220322144447.3563146-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_072600_325190_F55A67D1 
X-CRM114-Status: UNSURE (   8.01  )
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

Page table check performs extra verifications at the time when new
pages become accessible from the userspace by getting their page
table entries (PTEs PMDs etc.) added into the table. It is supported
on X86[1].

This patchset made some simple changes and make it easier to support
new architecture, then we support this feature on ARM64 and RISCV.

[1]https://lore.kernel.org/lkml/20211123214814.3756047-1-pasha.tatashin@soleen.com/

v1 -> v2:
  1. Fix arm64's pte/pmd/pud_user_accessible_page() according to the the
     suggestions of Catalin.
  2. Also fix riscv's pte_pmd_pud_user_accessible_page(). 

Kefeng Wang (2):
  mm: page_table_check: move pxx_user_accessible_page into x86
  arm64: mm: add support for page table check

Tong Tiangen (2):
  mm: page_table_check: add hooks to public helpers
  riscv: mm: add support for page table check

 arch/arm64/Kconfig               |  1 +
 arch/arm64/include/asm/pgtable.h | 65 ++++++++++++++++++++++++---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/pgtable.h | 77 +++++++++++++++++++++++++++++---
 arch/x86/include/asm/pgtable.h   | 29 +++++++-----
 include/linux/pgtable.h          | 27 +++++++----
 mm/page_table_check.c            | 25 ++++-------
 7 files changed, 179 insertions(+), 46 deletions(-)

-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
