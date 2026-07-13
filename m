Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07394C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 13:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8g8/Bd9DqrKzcF2h+b4REFlqS8NiNyNGAzS1CUJk3C4=; b=EHWlfq5CrT8SqB
	9iEUL1Dn6MGdobDzdJ7203AcNcr1oQ1U9uYnLNO0SHVQ7hD5eududqF1w4YsEREvdfvjof7DhgJfI
	VaUw2a1t6tK7ITTlD7WOa6B5Eu7XrQ5TVfk4pGwg/ViNdptOqib88WUdiV3OvvLHBJZ3Suaa+akH6
	5Ztqevriws5GKfaoPPo7g7dBGcxEReJMzJIWfmJfi5vHbtumB8HH20ZPBPGG5oPzzNspE3Zap3LTv
	wgLljwgOBivuM75nv5oBs08N8cwrgjfHDmOYtFchI2RL9MiehSDY7M74XkEUdxEcpv1zx4aifg6B0
	/24l5Gq7TIoIQ2uhGYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHCA-00000009UdR-1bwS;
	Mon, 13 Jul 2026 13:59:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHC7-00000009Uak-0QQm;
	Mon, 13 Jul 2026 13:59:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F7D41DB5;
	Mon, 13 Jul 2026 06:59:33 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2DF8B3F7B4;
	Mon, 13 Jul 2026 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783951177; bh=gV2pTsCUztgOvGxrgAt605ARjz7dmzmHzQM9Otey+5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hFiwKMoLlCD3BN8OR1BVTk7TGKyMljN5sZjMGiN8FhmafTvDOgG4tq4iifBz0LBGe
	 TEPym80+aPKYKhJUwzOJNb9VKhhRTPH621Ljc/q0DnJmnSnhinhKUbtdb6iKpO4mVN
	 n11BCRxPznqUlnDr4I57hyRYBDnCMWFwyszMYrfQ=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org
Cc: david@kernel.org,
	linux@armlinux.org.uk,
	akpm@linux-foundation.org,
	ankur.a.arora@oracle.com,
	rppt@kernel.org,
	linmag7@gmail.com,
	chleroy@kernel.org,
	klarasmodin@gmail.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	kas@kernel.org,
	zhangtianyang@loongson.cn,
	wangyuli@aosc.io,
	tsbogend@alpha.franken.de,
	ljs@kernel.org,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ryan.roberts@arm.com,
	pasha.tatashin@soleen.com,
	rmclure@linux.ibm.com,
	baolin.wang@linux.alibaba.com,
	tj@kernel.org,
	kevin.brodsky@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	anshuman.khandual@arm.com,
	yang@os.amperecomputing.com,
	chaitanyas.prakash@arm.com,
	ardb@kernel.org,
	guoren@kernel.org,
	yang.li85200@gmail.com,
	viro@zeniv.linux.org.uk,
	dinguyen@kernel.org,
	schuster.simon@siemens-energy.com,
	wangruikang@iscas.ac.cn,
	junhui.liu@pigmoral.tech,
	muchun.song@linux.dev,
	vishal.moola@gmail.com,
	namcao@linutronix.de,
	pavel@kernel.org,
	djbw@kernel.org,
	yu-cheng.yu@intel.com,
	baolu.lu@linux.intel.com,
	Jonathan.Cameron@huawei.com,
	coxu@redhat.com,
	andreas@gaisler.com,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	geert@linux-m68k.org,
	shorne@gmail.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH 15/34] mips: mm: use proper set_pXd() for generic compile-time folded patable in vmalloc_fault path
Date: Mon, 13 Jul 2026 14:55:54 +0100
Message-ID: <20260713135614.1618183-16-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713135614.1618183-1-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_065939_216746_C6443D39 
X-CRM114-Status: UNSURE (   9.83  )
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

We want to rework how set_pXd() behaves for generic comiple-time folded
page tables by disallowing its use and triggering a compile-time error
when it is used improperly, ensuring that the actual first-level
set_pXd() function is used instead.

Therefore, call the proper set_pXd() in case of generic compile-time
folded pgtable to handle vmalloc_fault case with pXd_present() and
drop pgd_present() and set_pgd() usage since mips doesn't support
5 page-table levels.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/mips/mm/fault.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index 37fedeaca2e9a..4ad281a3bf97a 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -289,28 +289,31 @@ static void __do_page_fault(struct pt_regs *regs, unsigned long write,
 		pmd_t *pmd, *pmd_k;
 		pte_t *pte_k;
 
+		BUILD_BUG_ON(CONFIG_PGTABLE_LEVELS > 4);
+
 		pgd = (pgd_t *) pgd_current[raw_smp_processor_id()] + offset;
 		pgd_k = init_mm.pgd + offset;
 
-		if (!pgd_present(*pgd_k))
-			goto no_context;
-		set_pgd(pgd, *pgd_k);
-
 		p4d = p4d_offset(pgd, address);
 		p4d_k = p4d_offset(pgd_k, address);
 		if (!p4d_present(*p4d_k))
 			goto no_context;
+		if (CONFIG_PGTABLE_LEVELS == 4)
+			set_p4d(p4d, *p4d_k);
 
 		pud = pud_offset(p4d, address);
 		pud_k = pud_offset(p4d_k, address);
 		if (!pud_present(*pud_k))
 			goto no_context;
+		if (CONFIG_PGTABLE_LEVELS == 3)
+			set_pud(pud, *pud_k);
 
 		pmd = pmd_offset(pud, address);
 		pmd_k = pmd_offset(pud_k, address);
 		if (!pmd_present(*pmd_k))
 			goto no_context;
-		set_pmd(pmd, *pmd_k);
+		if (CONFIG_PGTABLE_LEVELS == 2)
+			set_pmd(pmd, *pmd_k);
 
 		pte_k = pte_offset_kernel(pmd_k, address);
 		if (!pte_present(*pte_k))
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
