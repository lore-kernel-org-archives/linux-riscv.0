Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323B7C55ABF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGtae7HOpA4iBzjscyehJz67037zf7BFKlBIjd8XAGQ=; b=hCVeWG6lhF2C1a
	NB/inzVkfk+NRgxSNnLDbB4to4HruxogWZiyfJf6Fc0P/o/oOrLlnkRY864+ep/ggC3vx2Q6rQDpM
	/YH1r7PKECZl76PELCJi9H/XbvD00wQNwKh30Hf8ostcmxj1shhXo/mkZeZDizXxZAyqnGXNNPO7S
	/AnrRRTl3tvqXqPN97KQJVmN+tR2qYEbHuWULUfW/Ozlj63N4UEufSmacNFKKjzqBfzeqLyDNoTqJ
	Olei2WH75hngH/HxmcLfjnt1/n0yXQ7x449ci3pvDUYsgqyCm0hN9/QTVYoTLDraAoV1LzeL0wI1h
	gxzyTGTlHTX4vtEKXidw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruW0-00000005PSr-1JYb;
	Thu, 06 Aug 2026 09:35:52 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruVw-00000005PP8-3Ypy
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 09:35:51 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-cbb8ebaca74so1068361a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 02:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008948; x=1786613748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gF4E42dXY09sWBsDK5gTPPv7oygQNLJ0717q+HvJkA=;
        b=sz3uBexKRC0YhCp8yInlWbUssr7/3as+jh9wLzoIHmed4i6SN/xf52kTFKHXqb/VF2
         bwZO4/AI6N0ANqUh40EJ+8O0BzJmS9fdfdqh21+VCnEmv9/0nSMuDED6k+oIkTP4iaam
         N1BTzwwi71TuwlQnDFRdOfVd/S7qbuOuMvrvxopirRKzuEGA9c2ZzBpkNgRTjzQqbNyp
         EakqVC6Wok6GdM9faXOPjyt/FNxEAbEknnPEgkGxHTeGHP3Lx1/xmDgNRHh7B3Lfw5R8
         DEbWH3rg9r60UhG/Sr1Chp5/PEqFqMbAoXcUUX5OojMhw8U1Y6SyosTz2F3G7S/7TI8q
         Y0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008948; x=1786613748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gF4E42dXY09sWBsDK5gTPPv7oygQNLJ0717q+HvJkA=;
        b=dgpBALl6bo/d/UQzCBY9Uqzzr9kkBmnskvIPxlS97G83UAXtML3NqnMIfBBlwZXnYl
         IXr3h7tJCCHsRkeyLOZOwwzYdr/g3FSIH3ne/0vl7msbYJufg6kvA0tDytHmUulWwcEe
         JNJEebwjzceC7Yn7/+VOEeGF1/wFZ6gxvN1gYHRZnE9EnNQxc2l7mSvqffk1dEGPKHcC
         iWvMH+olBfOr/85sCtvuvVZPdyAP43HQqEWDAmaWJ7L/aDW7wQZEUZWTLbugz+LuRvg4
         4mfTHIKBuSmRR1HhwdGsJh+Sw8fEe60t8Yqdvuq4sTJeVtnwp0YYtEUxjauLoLOWWijz
         wX5w==
X-Forwarded-Encrypted: i=1; AHgh+Ro5J2jZOHxannUvHWZm0uXT1tAdv/r0goNNNnHhO1J09Xi7HF28KFI7FtUsXawEiMrSOjJYt5wKBloCTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFvnirqYNonhVs1ltxrS+VI190zNTpM22HYgwPubATTrUe9xxQ
	NnAVmJqx5zMupwGTdnjyzLEtGYTMTlrSnKyoQkM785pq3CUfBQDTwX4g
X-Gm-Gg: AR+sD13Cin62iatASEnahvT+vycBp8+SiKhzkD9kbVRGvYXT+d2YgotsoBbwgq4K/Jw
	RX4YMk6z1u8ZkmZKKGoxMe3pcv5DyJejoTpreTINBlP5uQUKBNHK2vn2ghSjGcTMgaqAP972yKg
	L0ucER3u80KwC79mUA57L9uj50soRqef6+k+uyNIbKjiMCaUNicCwzsrhxacSQ0lr5rgnKaXMjA
	R9YltokGB0rtdHQFXv3Oo3XCwRfivF/7onexoPxH9RrHw7lxeNvx1awfFEz2imBvP+crMdJKJVC
	OmPnltfUNltv3x8ty3zQVBAhFdFW7ezT6pB4jXmP/8zjgk5w99Wzw8fO/lNcq02k6vNWR6aPNE1
	tktm/xxTrM8+HdKszTDc3MbtXUI76D86rlbBkwxxDLm+TS+zjEMWgm7GQEd9HMf6O2rgNg/Arlo
	vAY9sFpbK5jE+uO3YcPxAO7iriZkg5eiGoRB78QqvKoBNNWvTt5lR76mb7f7N3DzyfrZfKZ7QUv
	g==
X-Received: by 2002:a05:6a00:302a:b0:848:7443:f2de with SMTP id d2e1a72fcca58-84f2dff77cbmr16112920b3a.13.1786008947826;
        Thu, 06 Aug 2026 02:35:47 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:35:47 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 1/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Thu,  6 Aug 2026 17:35:12 +0800
Message-ID: <20260806093519.2907771-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023548_888574_0855684D 
X-CRM114-Status: GOOD (  13.03  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Add MEMBLOCK_NODUMP to mark regions that should be excluded from
kdump vmcores.

The flag is meant for reserved memory that carries no data useful for
crash analysis. Reusable reserved regions such as CMA may hold useful
data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
patches wire this up for /reserved-memory and /memreserve/ entries.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index d62db9e776cf..b2fcf11fba2b 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
+ * for crash analysis (e.g. firmware carveouts).
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
 };
 
 /**
@@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
+int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 void reset_all_zones_managed_pages(void);
@@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_SCRATCH;
 }
 
+static inline bool memblock_is_nodump(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_NODUMP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index 9ce86349a29f..79231634c25b 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_SCRATCH);
 }
 
+/**
+ * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Mark the region as not to be included in crash dumps.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_NODUMP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2886,6 +2901,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
