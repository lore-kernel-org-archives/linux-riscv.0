Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E6EC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 03:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESDxUERwJOBLNKzmiyqiBFEzEB58K6ocsrfKV8WPCPs=; b=2/gMSoWgU1W811
	5rrC/E5oxldy3nVXYMWAU5JUT1jeuCR+IPBsv8dc2wiHZv9mKH8lkltGwOLFQ3ClO366EGMhgcBwK
	uziWUmiGOawT5GX5O+ikFEmaneff+tHSNJeWb/mS6Lerendz513qpzb926o7g9HRaTBk664zVgRGk
	u94vBYa9uoWbKv7HDmTViHl8Jn2fUOdB29ixeMOeVTl4kj+bwPQKJdZKSOwtiq8+m8qm2wveAsFWD
	hDkHDB1A9jQgqSgQs6okvPYLkvZbvz1QaAZTZcTBfzABCHcCKzdJn8GCxRLNhYdUTGQYsQabw8beC
	585ZcMiZkF3k2qjMgEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAkOR-00FhQk-6S; Mon, 11 Jul 2022 03:47:31 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAkO2-00FhAA-AZ; Mon, 11 Jul 2022 03:47:08 +0000
Received: by mail-pj1-x1029.google.com with SMTP id t5-20020a17090a6a0500b001ef965b262eso3773253pjj.5;
        Sun, 10 Jul 2022 20:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5IhrKX64Q/Z6V/1v+K+JVKP0KaAJzbrmRGjpirKbhJY=;
        b=nTf9L3OC40YJpmHflFSmz6KTAFSTaaZQ/S1ioxVsgmxptGp0IiaRp8EmBLD2A/gyAa
         xCxhqU4FrY/lAvJTq2moA9lgpqjoUbWVxt9jLxPCj3p706ca9EfduK+9ZEqASUp+iSn4
         EAQGxSVUN0yLRZXgqjdbfj5Fmtrix3Zcu+LFvg4y16WF7hkCA9xAsOqzQxEjWd454u2h
         XE+9+f9Iud7s2Mj28twbgXcE2SL3KUqGtSOKhI9wUKt1VHNuIkvy6yU2jFaWI5VZAN/G
         f94VxtVlrnt015VrVBiB2PQUM0RSK74qAsmnUwlhXwOzhhh3WvHkY5vJB3bG/9C0lVRi
         fgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5IhrKX64Q/Z6V/1v+K+JVKP0KaAJzbrmRGjpirKbhJY=;
        b=1gjIfL2pd2NoR65N/Vrcoq1hoZ2cy70lya2XHN5RFL5cbBFpGr1YMb7mtUU+I3VTIQ
         yqznlmeq56gwBQ9QLxZMmPs1LfshkLnVPUfnXwoZkC/2u6KJE/QozNHaRemLVTUKtNJS
         qSX3N8vL4+Wc8eIJaVYC+2Nse3A8Wl9m/aazfaddz+/5pglcxlypS18k3Zj1ljxfRmkk
         WYvagTEWGs9SrfQvU6fpsYl75cKavCEYS1GxEZu8g8YmOOpsCW4CKD3kNLaK5KMWW4Xj
         VusX0Uuo75LJIchaX12R20jblJc5u/P/ZYMqPD9cnytsRp1uaqgkzAnnFdyTa6rQyXWt
         PpXg==
X-Gm-Message-State: AJIora9KF+ArvSHEz4LWZDuzrerTpfnE84+VFYK7kdoUxIlkpzE0pHFV
	oF6o60zA8b2XYfLAKlEYi3w=
X-Google-Smtp-Source: AGRyM1tGbLroqairLqOJOtLQAbkOgD2oJX4eg7rNXG45d2PB1rwtsYjv7Fwlc1lyPAUr+54PmfGNUg==
X-Received: by 2002:a17:902:8344:b0:16a:6e99:de2c with SMTP id z4-20020a170902834400b0016a6e99de2cmr16521282pln.130.1657511224541;
        Sun, 10 Jul 2022 20:47:04 -0700 (PDT)
Received: from localhost.localdomain (47-72-206-164.dsl.dyn.ihug.co.nz. [47.72.206.164])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902eccd00b001664d88aab3sm3447949plh.240.2022.07.10.20.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:47:04 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	darren@os.amperecomputing.com,
	yangyicong@hisilicon.com,
	huzhanyuan@oppo.com,
	lipeifeng@oppo.com,
	zhangshiming@oppo.com,
	guojian@oppo.com,
	realmz6@gmail.com,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nadav Amit <namit@vmware.com>,
	Mel Gorman <mgorman@suse.de>
Subject: [PATCH v2 3/4] mm: rmap: Extend tlbbatch APIs to fit new platforms
Date: Mon, 11 Jul 2022 15:46:14 +1200
Message-Id: <20220711034615.482895-4-21cnbao@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711034615.482895-1-21cnbao@gmail.com>
References: <20220711034615.482895-1-21cnbao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_204706_425129_5E5A6C80 
X-CRM114-Status: GOOD (  13.39  )
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

From: Barry Song <v-songbaohua@oppo.com>

Add uaddr to tlbbatch APIs so that platforms like ARM64 are
able to apply this on their specific hardware features. For
ARM64, this could be sending tlbi into hardware queues for
the page with this particular uaddr.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Nadav Amit <namit@vmware.com>
Cc: Mel Gorman <mgorman@suse.de>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 arch/x86/include/asm/tlbflush.h |  3 ++-
 mm/rmap.c                       | 10 ++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 4af5579c7ef7..1b32f4b999c7 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -251,7 +251,8 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
 }
 
 static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
-					struct mm_struct *mm)
+					struct mm_struct *mm,
+					unsigned long uaddr)
 {
 	inc_mm_tlb_gen(mm);
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
diff --git a/mm/rmap.c b/mm/rmap.c
index 13d4f9a1d4f1..a52381a680db 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -642,12 +642,13 @@ void try_to_unmap_flush_dirty(void)
 #define TLB_FLUSH_BATCH_PENDING_LARGE			\
 	(TLB_FLUSH_BATCH_PENDING_MASK / 2)
 
-static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
+static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
+				      unsigned long uaddr)
 {
 	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
 	int batch, nbatch;
 
-	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm);
+	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm, uaddr);
 	tlb_ubc->flush_required = true;
 
 	/*
@@ -736,7 +737,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
 	}
 }
 #else
-static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
+static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
+				      unsigned long uaddr)
 {
 }
 
@@ -1599,7 +1601,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
+				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval), address);
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
