Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD51C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 07:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=77chWYOrqcy22CGbzHZv4kAZPK3cr8MeB5HiHNXhzsY=; b=ngCeWoftHIN7RT
	UZJqJKtY2yuWZH/moxrQ8ct2AMmlANzCe8kBPIFvd1okWgf0fe2nj4nmfV+OTdY/bQoIasE0aJEM6
	0jJ4IqnibigBGuHVMy+dV//o9WcNEtaWKOytJ/wXKGhDhHsNpa69t3M03j/K3uQiHIahzGUkvKN/q
	tfrLC5doTHArtCqTpH4bn/PLdiCqDNLQ2y34JB9d5drdWX+MjCdc14sAwGqxBkcV4iyUGOapi2Rrw
	YbHTZFpB4jwCcygxw5fUfkY54Ja2p8MS0d642OaaR0CEKvDshbERrNfr7OGQX9v5pvEG2QpgZrg4X
	BDdrkIe1ot1f0yYM0b1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njG1b-00D76S-5S; Tue, 26 Apr 2022 07:54:19 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFzT-00D67V-Ei; Tue, 26 Apr 2022 07:52:10 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KnYxG5z5HzhYs7;
 Tue, 26 Apr 2022 15:51:46 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 15:51:59 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 15:51:57 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 Tong Tiangen <tongtiangen@huawei.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
Subject: [PATCH -next v6 0/6]mm: page_table_check: add support on arm64 and
 riscv 
Date: Tue, 26 Apr 2022 08:10:30 +0000
Message-ID: <20220426081036.1374452-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_005207_719109_2B258385 
X-CRM114-Status: UNSURE (   9.11  )
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

v5 -> v6:
 According to Anshuman's suggestion, optimized partial implementation and
 commit message:
 1. Remove redundant IS_ENABLED() in ptep_clear().
 2. Remove redundant __HAVE_ARCH_PTEP_CLEAR usage in pgtable.h.
 3. Remove redundant __ptep_get_and_clear() on arm64 and riscv.

v4 -> v5:
 According to Anshuman's suggestion, using PxD_SIZE instead of
 PxD_PAGE_SIZE in mm/page_table_check.c and it is checked by Pasha.

v3 -> v4:
 Adapt to next-20220414

v2 -> v3:
 Modify ptep_clear() in include/linux/pgtable.h, using IS_ENABLED according
 to the suggestions of Pasha.

v1 -> v2:
 1. Fix arm64's pte/pmd/pud_user_accessible_page() according to the
    suggestions of Catalin.
 2. Also fix riscv's pte_pmd_pud_user_accessible_page().

Kefeng Wang (2):
  mm: page_table_check: move pxx_user_accessible_page into x86
  arm64/mm: Enable ARCH_SUPPORTS_PAGE_TABLE_CHECK

Tong Tiangen (4):
  mm: page_table_check: using PxD_SIZE instead of PxD_PAGE_SIZE
  mm: page_table_check: add hooks to public helpers
  mm: remove __HAVE_ARCH_PTEP_CLEAR in pgtable.h
  riscv/mm: Enable ARCH_SUPPORTS_PAGE_TABLE_CHECK

 arch/arm64/Kconfig               |  1 +
 arch/arm64/include/asm/pgtable.h | 59 +++++++++++++++++++++++---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/pgtable.h | 71 +++++++++++++++++++++++++++++---
 arch/x86/include/asm/pgtable.h   | 27 +++++++-----
 include/linux/pgtable.h          | 21 ++++++----
 mm/page_table_check.c            | 25 ++---------
 7 files changed, 155 insertions(+), 50 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
