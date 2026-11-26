Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD5606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x7Ue7fH3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNX3cDEN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XLhcJgzf8inyiZ9hqSLd8NiHKnbWEDjia9ILJQFf/iE=; b=x7Ue7fH3o1XNSAJEIpwOCit2nF
	IDKQ0NEfRa5MNtd6oIjOB2eSLY/FK7PjSASqazu7NSs9PhR7nYEFFAZKMKaD+lCLD9Mch0E4+Z3yb
	nHnMPjCwcjVVvFatCHrVVeId+7qe4gFbmebp8dIICHs1hJf6DJPdkztB2EZJBTTN+5IRwQ3GdCrgS
	OT73xgNerAlKAzXNwHd9dv3+fLsoq0EFmoBsf0pdTPMw/Scug04VDnpgdW/ssqCvpnsaGrLPNQu6M
	0QAOy22zHQmZ0rpHLGJqn7zdzpwYCUt0qDEcUYRdjo2hGss9vQgub5aMge42qHEZXFZrSJVihMm/m
	IW31vfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXYv-0000000Cy2v-2KCz;
	Thu, 26 Nov 2026 11:22:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXXi-0000000Cwfp-0xEu;
	Thu, 26 Nov 2026 11:21:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A569C6338F;
	Thu, 26 Nov 2026 11:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734441F00AD4;
	Thu, 26 Nov 2026 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692092;
	bh=vigwkAWRONvzPByx/zhPfJ9SVHH2ehEcBxoq+qTMC8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SNX3cDENiO5DzlG2beALu6yElwtfAJXpHrvTqpxO60LzbbVU27yDaIgMMSFUrC3qK
	 +gif9ob2GHrwxtQZ2uGiKiYmg7Dy16SvDHGHzdFUsr1dSx+qMH8iVYn8rJD5ozxCDu
	 ZLenCOZbN2Wt7s8cZ1jwGUELsfeht4miRfQl7N/J1msWxoJt4085AIm4mT+Ff3Hjww
	 0rvY138mhTHgAPV+UhUHEzrCijrGWuVoJt3D8ag2qDG35f5eTy1vTkHDWY+1GMsIhv
	 Z/IC6JEKsjS2y2gDXBkm1BfHhyIJPZCVGsNCbFMHzeqMQhFUU9ScTYCUcWKZiWuLGQ
	 jEz1spOt2dAIA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:57 +0200
Subject: [PATCH RFC v2 44/54] mm/pageattr: derive direct map counter
 updates from the level sizes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-44-723f1e33c3d8@kernel.org>
References: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
In-Reply-To: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
To: linux-mm@kvack.org
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16.1-dev
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The direct map counters add PTRS_PER_PTE entries at the next level for
every split.

That is right on x86, riscv and arm64, where all levels have the same
number of entries and PTRS_PER_PTE is the same as PTRS_PER_PMD.

This is not the case on s390.

An s390 segment table has 2048 entries and a page table has 256, i.e.
PTRS_PER_PMD is 2048 and PTRS_PER_PTE is 256.

A split of a PUD mapping on s390 would add 2048 entries to the PMD
counters.

Replace the hard-coded PTRS_PER_PTE in the counter update with a helper
that derives the number of entries from the sizes of the two levels.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/pageattr.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/mm/pageattr.c b/mm/pageattr.c
index e05281a2b169..555e55e7ecea 100644
--- a/mm/pageattr.c
+++ b/mm/pageattr.c
@@ -48,6 +48,11 @@ void direct_map_count_update(enum pgtable_level level, long pages)
 	atomic_long_add(pages, &cpa_direct_map_pages[level]);
 }
 
+static long nr_entries(enum pgtable_level level)
+{
+	return pgtable_level_size(level) / pgtable_level_size(level - 1);
+}
+
 void direct_map_count_split(enum pgtable_level level)
 {
 	if (atomic_long_dec_if_positive(&cpa_direct_map_pages[level]) < 0)
@@ -59,7 +64,7 @@ void direct_map_count_split(enum pgtable_level level)
 		else if (level == PGTABLE_LEVEL_PUD)
 			count_vm_event(DIRECT_MAP_LEVEL3_SPLIT);
 	}
-	atomic_long_add(PTRS_PER_PTE, &cpa_direct_map_pages[level - 1]);
+	atomic_long_add(nr_entries(level), &cpa_direct_map_pages[level - 1]);
 }
 
 void direct_map_count_collapse(enum pgtable_level level)
@@ -71,7 +76,7 @@ void direct_map_count_collapse(enum pgtable_level level)
 		else if (level == PGTABLE_LEVEL_PUD)
 			count_vm_event(DIRECT_MAP_LEVEL3_COLLAPSE);
 	}
-	atomic_long_sub(PTRS_PER_PTE, &cpa_direct_map_pages[level - 1]);
+	atomic_long_sub(nr_entries(level), &cpa_direct_map_pages[level - 1]);
 }
 
 void cpa_report_meminfo(struct seq_file *m, unsigned long levels)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
