Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D26C02193
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 20:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ei19gdmt9sOjiCUri5hurw3wR7WbdJb5L3yRltEN0lU=; b=PrIU3rYj60dW7S
	ugGWlDxUZrYUs26ynRP00afGpeACcK7A37WgnFM5wX/XILVR1gXZSOCyi8VfBtxqORv+7/2M1fqjH
	vXutk5HwO7QmtC0XRzx/Gj6wy0HEZT5b7qkV7ZtbUfQnBUeZAzELoRMRqMDGld7PLw70xGn7zyHPZ
	6XMbdHcCMvhCy+F0CkOsPuBCFZp2NehPw/quYsSmvBzmoYegQ/5itzKcj+8ufdAowTz9muGgO6eEM
	58L4FvNjnYadWULrR1+SlsLu3MSlP29RQwTfOZtY6xNUBx9HU1LPB/WVhIXGOKqOSjUdKKW1Fs4TL
	M0JeaJhjEiYNFdfUk23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfP6S-00000001SVk-1Rtf;
	Tue, 04 Feb 2025 20:01:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMqW-000000017cc-3zdn;
	Tue, 04 Feb 2025 17:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lQ5v1NnA6R05ztWWI7B+8ia+Rd5WZ3/fmwVsOhBY4uI=; b=Brf4U0OScI8qoWztrysxA+piOc
	6Qdgrg9o5Mk9NUNVECRg8cnL8q0bsikhkEncpIbum/WAlhcKZkixkDncKx0ijbLLV0rmVhrIrAATQ
	G5EUtgdKnpMYn3dzTSGgDIJXW4N9WFbSurV8XYk047KbHVuCT1rs3ggd71drHfpL3XaULv/yidfQR
	fAhjljN1YqBN8BIZoV1jElFip6/ETKuklU6cnqctk+oBt5W2asEQW2YWjZtevmpuBaa3vDn8auH4F
	NyG/0ggy8b8J2sivnRF/AEI8Py8LZaqr0FQLNf0YICS3ZGDGg6EQ3mm4PCQJ/4CExH9rpUxAWm/Q5
	ffEVyI9Q==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMqT-0000000GLsT-130a;
	Tue, 04 Feb 2025 17:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690581; x=1770226581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/9iE/zrVNGKs+zQWoSO6YvnUY6c4YJpTItZxJ7K+vOY=;
  b=GwzFVqMHV8ubytx/P97N0xpl9S7RxgUp+wQycWpBOmyBCydUA2E/sIUg
   knwpiNYSboY/fggekX+gRnbPAqWA+6RMsVowi3HvHUojb1nsMHYjXG8r3
   R+FJ1YgP30PzmROHsgzLoHgpn/ZEdA4leoXs0+ZzIjr+bq5nSAT95r7xD
   idLHXfz8tDCymhqa754yBhls882nl8hqI6cL6L60XBgq9v3sE/XoreC+X
   2k+XqSRVizh1Lovqt2WdvPW8CR3aNTbnPoQirJjGs0QsH7WPqYGhGu3zw
   UnIqinEIxyDl1F3LSrAUTxy9Q6UhkiG0UA9DvUAUcqi6yTLO3w7DcQtxF
   w==;
X-CSE-ConnectionGUID: qlLtWe9PTlatpUmDxLepug==
X-CSE-MsgGUID: f6HorramRB+DkckO5vrWgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930749"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930749"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:14 -0800
X-CSE-ConnectionGUID: +qvwGRPBT+u0hTrJ0ps4gQ==
X-CSE-MsgGUID: gKQBPywxQQq2MfdmEZxhgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866742"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:02 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: luto@kernel.org,
	xin@zytor.com,
	kirill.shutemov@linux.intel.com,
	palmer@dabbelt.com,
	tj@kernel.org,
	andreyknvl@gmail.com,
	brgerst@gmail.com,
	ardb@kernel.org,
	dave.hansen@linux.intel.com,
	jgross@suse.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	corbet@lwn.net,
	maciej.wieczor-retman@intel.com,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	ytcoode@gmail.com,
	tglx@linutronix.de,
	hpa@zytor.com,
	seanjc@google.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	jason.andryuk@amd.com,
	glider@google.com,
	ubizjak@gmail.com,
	jannh@google.com,
	bhe@redhat.com,
	vincenzo.frascino@arm.com,
	rafael.j.wysocki@intel.com,
	ndesaulniers@google.com,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	junichi.nomura@nec.com,
	nathan@kernel.org,
	ryabinin.a.a@gmail.com,
	dennis@kernel.org,
	bp@alien8.de,
	kevinloughlin@google.com,
	morbo@google.com,
	dan.j.williams@intel.com,
	julian.stecklina@cyberus-technology.de,
	peterz@infradead.org,
	cl@linux.com,
	kees@kernel.org
Cc: kasan-dev@googlegroups.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH 08/15] x86: Physical address comparisons in fill_p*d/pte
Date: Tue,  4 Feb 2025 18:33:49 +0100
Message-ID: <2c2a71ec844db597f30754dd79faf87c9de0b21f.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_173621_904448_C952B4AF 
X-CRM114-Status: UNSURE (   8.09  )
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

Calculating page offset returns a pointer without a tag. When comparing
the calculated offset to a tagged page pointer an error is raised
because they are not equal.

Change pointer comparisons to physical address comparisons as to avoid
issues in KASAN that pointer arithmetic would create.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/mm/init_64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index ff253648706f..bb101412424a 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -251,7 +251,7 @@ static p4d_t *fill_p4d(pgd_t *pgd, unsigned long vaddr)
 	if (pgd_none(*pgd)) {
 		p4d_t *p4d = (p4d_t *)spp_getpage();
 		pgd_populate(&init_mm, pgd, p4d);
-		if (p4d != p4d_offset(pgd, 0))
+		if (__pa(p4d) != __pa(p4d_offset(pgd, 0)))
 			printk(KERN_ERR "PAGETABLE BUG #00! %p <-> %p\n",
 			       p4d, p4d_offset(pgd, 0));
 	}
@@ -263,7 +263,7 @@ static pud_t *fill_pud(p4d_t *p4d, unsigned long vaddr)
 	if (p4d_none(*p4d)) {
 		pud_t *pud = (pud_t *)spp_getpage();
 		p4d_populate(&init_mm, p4d, pud);
-		if (pud != pud_offset(p4d, 0))
+		if (__pa(pud) != __pa(pud_offset(p4d, 0)))
 			printk(KERN_ERR "PAGETABLE BUG #01! %p <-> %p\n",
 			       pud, pud_offset(p4d, 0));
 	}
@@ -275,7 +275,7 @@ static pmd_t *fill_pmd(pud_t *pud, unsigned long vaddr)
 	if (pud_none(*pud)) {
 		pmd_t *pmd = (pmd_t *) spp_getpage();
 		pud_populate(&init_mm, pud, pmd);
-		if (pmd != pmd_offset(pud, 0))
+		if (__pa(pmd) != __pa(pmd_offset(pud, 0)))
 			printk(KERN_ERR "PAGETABLE BUG #02! %p <-> %p\n",
 			       pmd, pmd_offset(pud, 0));
 	}
@@ -287,7 +287,7 @@ static pte_t *fill_pte(pmd_t *pmd, unsigned long vaddr)
 	if (pmd_none(*pmd)) {
 		pte_t *pte = (pte_t *) spp_getpage();
 		pmd_populate_kernel(&init_mm, pmd, pte);
-		if (pte != pte_offset_kernel(pmd, 0))
+		if (__pa(pte) != __pa(pte_offset_kernel(pmd, 0)))
 			printk(KERN_ERR "PAGETABLE BUG #03!\n");
 	}
 	return pte_offset_kernel(pmd, vaddr);
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
