Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F017C02194
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 20:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAiGOf4Th7dmjfrU3bdPO3+3gXF0xN1nw69RFO3KNY0=; b=qrTb88+RuSdFDc
	YRBU7R0PCI5LKVQeVfcuii4V6vCKOa9msAyLXBERaY+GXd7tm+71Y/wa4jvLs6fxVyKt7LPAX2imw
	IdVZceu+1MYEfR24kXPc24zP3HSKJrDa28c3i8iandJqnuU3yjOkFjfls3KCs1YYw82GW0nk8th5p
	qS+vXPEfF6OiiDoNnPOXYbF14Q9HsNrCIJkXPnLtsmcQZXVxZ7/RfexqIrmM33dyxEYpat1/EVlr/
	FI4O8oZna60lwSIaRBuB6uJOs5q/xOT6DGWJLexCwZuEmj+zQGUqSyltpiROc3r0Di/GiMPzRef/e
	MIz5PTbrkcTYD3OyjCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfP6T-00000001SWK-2fTE;
	Tue, 04 Feb 2025 20:01:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMqd-000000017gY-3ztA;
	Tue, 04 Feb 2025 17:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OjOreTL+Ot1aK4xRTqvixmr6X+5Hdo5QfDrtzsBAFBk=; b=cF9BjhlLs5jGI6B+rtjcQ7R//+
	EMtDfW371mUM0XVPARAM71Kgf/cfqAx0ui52m1W0XinQF6OIYfYiXhynoYukET4I1bbb1JukE6KuI
	N9ILiK63nwX3VOHwLBt8EEAaoccSzgsuHpyXPmpvjLOZKUDOB6K3GDXBJ09H/ZckvfVbgH1XuUy+p
	27TLJa1wVZVFTxEPyVpkdlQINJweZ7kx1hZLBBG/Wadrt+jScjJW4kjh74W0hrPWw0/ZIKsGBPvRT
	7qJhOOofklWLgzoiNZOL4+nDSa3qPiQhc0cVnRZccIbwWm+mXVlWXIcvKD9zm/ZdwymBcQcx2Dp3N
	JHGO6L0g==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMqZ-0000000GLsT-2Kaa;
	Tue, 04 Feb 2025 17:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690587; x=1770226587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZPDKrg9roFM67mEQ2fI48/uwWPYPBpbE1ZWp7rfkzQw=;
  b=OzKLEZRcGnEafPuWzqcBa2H/6WpLfuxAPAQKLEg+q0BEnRqRSm549NYD
   CJd00DexTfsg5MFYeUUdGd7nX9aNaXTU57Gwcx1LKymI7cM7Sib/0jzbe
   Y9ZbE3nOGscJs7gB7xwfuBBre2j8iA9T2jBSfUGfhd1tvFEeSV1VqdOMM
   TIO8+ZF3S1VXNPkSX0eEpdl9ZQD2MckykDnD2uY2ZdZW8cra2Eh5PM1pF
   MGwFiR+HFhadiAKiNJL4kgU9Y2rEDnxOdKHQ06PnpATfH1MKE5WVQO55x
   DBY+/6GIcbm3lrik/UrpKk9ylLYZ+EsDRzDcdfhO4hR7bkYQZkXS5/ROQ
   Q==;
X-CSE-ConnectionGUID: PDqFjK0LQGOzIpkL9EBZcw==
X-CSE-MsgGUID: UQRW6WyYRT++i02erQ2Gqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930848"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930848"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:26 -0800
X-CSE-ConnectionGUID: jXIRAGRVSi6AV3rBRiAebw==
X-CSE-MsgGUID: yAFfDOxmTeCrIA01iFfVXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866806"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:14 -0800
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
Subject: [PATCH 09/15] x86: Physical address comparison in current_mm pgd check
Date: Tue,  4 Feb 2025 18:33:50 +0100
Message-ID: <fde443d0e67f76a51e7ab4e96647705840f53ddb.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_173627_955976_C4C56D53 
X-CRM114-Status: UNSURE (   8.84  )
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

With KASAN software tag-based mode enabled PGD pointer stored in
current_mm structure is tagged while the same pointer computed through
__va(read_cr3_pa()) ends up with the tag space filled with ones.

Use current_mm->pgd' physical address and drop the __va() so the
VM_WARN_ON_ONCE can work properly and not report false positives while
KASAN is enabled.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/mm/tlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 86593d1b787d..95e3dc1fb766 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1295,7 +1295,7 @@ bool nmi_uaccess_okay(void)
 	if (loaded_mm != current_mm)
 		return false;
 
-	VM_WARN_ON_ONCE(current_mm->pgd != __va(read_cr3_pa()));
+	VM_WARN_ON_ONCE(__pa(current_mm->pgd) != read_cr3_pa());
 
 	return true;
 }
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
