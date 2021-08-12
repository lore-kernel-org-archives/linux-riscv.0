Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24520C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 07:00:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACE9601FD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 07:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DACE9601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2SBsknqTdIByEtTh5YcBRcBfcmLFvGbEbKjGSLuA88=; b=De7xFVwHqgg7Kx
	5N53IzTzy5iU+kj1oDdxoi0ZcqE3gv+aw1DGbZ6f/yU3pHj1B+meiEkgWWyl+a5HB3XeOvdvTPs40
	CAXsapo51eRu6zqzvaKa57pHqmZ4cWgFMCDCRsqycbiUJ82F4kgrcchX6yw4xTy0Mf8ms6iEleRcH
	Ll7ZBXAXCeW6OyXp+YsyP5R93o6/Qc1WhcfOHFIg6Kux+yil8ESTAUYHQHfG9IGMVNXICzHH+ALdB
	C2I16M9LGkTa5GyX+vlRD9anfPVoOR087G3Jh4Gh3IcGceb18sJf9l3Li2S7F9BuWu9+4NFQXRdrI
	kkt2qeh0T5LU2iIMiEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4gw-008oRi-6h; Thu, 12 Aug 2021 06:59:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4gc-008oLa-FQ; Thu, 12 Aug 2021 06:59:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 380286101E;
 Thu, 12 Aug 2021 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628751569;
 bh=ZQav6dV8arUW7JrdFYQDuwE6wrSwrjaeQEiFGD8y5Ow=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ub06Kjl0JOvhrwSvBoL2gmy7C5V9LcaLfJX4yihafiq4jwaM9ed18Mqq07gCxmmRc
 dBUACRxsjGNMUuPesEXB4NM6qhtbBc3iff2dr+pWlD3uXacnNjvXrSXOv2GQeEZaQk
 T5EjPvN6qf91Si5gNiyLWnmmqBhSVLnbq0cD1UTlLeu8DwjjPJIufFz/H/4NiX3LdV
 098Di3iHP3zb+sqspU8kt0rfVgMlCmHe6Mbha1VoXncA3Ntyr0cfpysaIXYyiVNUNf
 vyT317LfJl4oR3bkN1wEHq7OrIKJEGS3w+j+XOUsNEphrtv2u0D2L1lGU/XncCVEfF
 bZZ9cTh4OS0cw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andy Lutomirski <luto@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Len Brown <lenb@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org
Subject: [PATCH v4 1/2] x86/mm: memory_map_top_down: remove spurious
 reservation of upper 2M
Date: Thu, 12 Aug 2021 09:59:06 +0300
Message-Id: <20210812065907.20046-2-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210812065907.20046-1-rppt@kernel.org>
References: <20210812065907.20046-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_235930_621908_F7B2F5A7 
X-CRM114-Status: GOOD (  18.19  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

memory_map_top_down() function skips the upper 2M in the beginning and maps
them in the end because

	"xen has big range in reserved near end of ram, skip it at first"

It appears, though, that the root cause was that there was not enough
memory in the range [min_pfn_mapped, max_pfn_mapped] to allocate page
tables from that range in alloc_low_pages() because min_pfn_mapped didn't
reflect that actual minimal pfn that was already mapped but remained close
to the end of the range being mapped by memory_map_top_down().

This happened because min_pfn_mapped is updated at every iteration of the
loop in memory_map_top_down(), but there is another loop in
init_range_memory_mapping() that maps several regions below the current
min_pfn_mapped without updating this variable.

Move the update of min_pfn_mapped to add_pfn_range_mapped() next to the
update of max_pfn_mapped so that every time a new range is mapped both
limits will be updated accordingly, and remove the spurious "reservation"
of upper 2M.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/x86/mm/init.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 75ef19aa8903..87150961fdca 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -486,6 +486,7 @@ static void add_pfn_range_mapped(unsigned long start_pfn, unsigned long end_pfn)
 	nr_pfn_mapped = clean_sort_range(pfn_mapped, E820_MAX_ENTRIES);
 
 	max_pfn_mapped = max(max_pfn_mapped, end_pfn);
+	min_pfn_mapped = min(min_pfn_mapped, start_pfn);
 
 	if (start_pfn < (1UL<<(32-PAGE_SHIFT)))
 		max_low_pfn_mapped = max(max_low_pfn_mapped,
@@ -605,20 +606,14 @@ static unsigned long __init get_new_step_size(unsigned long step_size)
 static void __init memory_map_top_down(unsigned long map_start,
 				       unsigned long map_end)
 {
-	unsigned long real_end, last_start;
-	unsigned long step_size;
-	unsigned long addr;
+	unsigned long real_end = ALIGN_DOWN(map_end, PMD_SIZE);
+	unsigned long last_start = real_end;
+	/* step_size need to be small so pgt_buf from BRK could cover it */
+	unsigned long step_size = PMD_SIZE;
 	unsigned long mapped_ram_size = 0;
 
-	/* xen has big range in reserved near end of ram, skip it at first.*/
-	addr = memblock_find_in_range(map_start, map_end, PMD_SIZE, PMD_SIZE);
-	real_end = addr + PMD_SIZE;
-
-	/* step_size need to be small so pgt_buf from BRK could cover it */
-	step_size = PMD_SIZE;
 	max_pfn_mapped = 0; /* will get exact value next */
 	min_pfn_mapped = real_end >> PAGE_SHIFT;
-	last_start = real_end;
 
 	/*
 	 * We start from the top (end of memory) and go to the bottom.
@@ -638,7 +633,6 @@ static void __init memory_map_top_down(unsigned long map_start,
 		mapped_ram_size += init_range_memory_mapping(start,
 							last_start);
 		last_start = start;
-		min_pfn_mapped = last_start >> PAGE_SHIFT;
 		if (mapped_ram_size >= step_size)
 			step_size = get_new_step_size(step_size);
 	}
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
