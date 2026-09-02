Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B08C61DFD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 07:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYtq9rNLLl0oMgdw8HlGD/boTztfuRWgr8Tr7SGKukM=; b=VXN7BXVi2fTUYn
	SScXUJ0pzPr4LziVG7Q1QX/cCSxjFWUYX3W3wuEqeFNJbA7GyI1P1Xfv0BYEotPUXCuTlugf/TVYp
	4/9JZrsaBYJX4n4y1JRtG5TtT5Y0lsqPuLVy/bHszJO6gRWc4ILSkuhBHzyv0KcbG8S7UskJy/eO/
	PEaUwpqdIk2ZevplcU1WUIgpm63LOdsXFbOYLaaELucWmBHMJDUyp2WG2KKb4mtC0467sb0Ncs3Hh
	E64AzNqXyCK28+jsY7uNgjrkpPH9FuIOgXmJ6jyX3YNG4q9oKspQ0j3KdLylaPUEad6Jj7jnZ0Mv2
	pSNOcFOLVjZ7AhBZ4vaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fSp-0000000DwVy-300e;
	Wed, 02 Sep 2026 07:32:55 +0000
Received: from mail-pz2-x0a.google.com ([2607:f8b0:4864:3b::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fSk-0000000DwQX-44Ua
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 07:32:53 +0000
Received: by mail-pz2-x0a.google.com with SMTP id 41be03b00d2f7-cc1d7f6f26aso411257a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 00:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334370; x=1788939170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vi97MWhfZddiqmimgtB8vYuipDLussxDN6BUz0TYMFc=;
        b=F0Q2WI90kCmV5i/mmBfxV2h6wAuCPPhQrWjdSW7WfVluoe4B8Y0bO7iyRQisb8Uj/7
         pGxffmpeaOnTVBnEm6O33c9JdaFVm5axHGPJyUPpEnX12yxzzENPaDn7//TvBoJbt6kG
         CAOvnImfSh0IEwJ3rih8gw8F6PSPtOX/3lggJOc+ZIp2qrqSWyiY5HW6vF5nTX6IHgZF
         WrXNSZsPmcyjgpNZum4r1FGM7BS6kYBsUPhxo0mQHEm42JSS2RvwsvcZoVt6A9fAsEL1
         E1Llw6jxFouxmuCkZTPC54jmhTAHvmRxFPeXifF7CT9EWDC6uI53dSj3td/cQrhbzDUQ
         xctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334370; x=1788939170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vi97MWhfZddiqmimgtB8vYuipDLussxDN6BUz0TYMFc=;
        b=AW7MFQWqlFzfdvezPjdysvTlDd9Z8iIGNkm42g+NsDv4D0h/lm6ZZayKDLT3YnljeI
         EX898tK3UP+q5HMWQHP/s+bran7Q+T/2k8LF9txfnqHO/BYIy3l86oxp7USvLSJt/Vod
         rS4UuQ2+HCre1wkPB16+MAxJMEAaGyw3hmG/Nolqyq0VBOCZcVsIzDuE5gzXRuleWaBI
         LfAjCKRPDN0iN6/feJdaiGkRI4yVb3s4zBgOZLFRdNvLW1B48EdeR0xYkyTvPrMLdpmL
         uajsyKLYibo2Yievl1Pe3aCAFtMDHCYAzSQ3DkDjNTfEL839xkj/YWJlPMns6438Zhs5
         tVWg==
X-Forwarded-Encrypted: i=1; AKwUvBzKuIG+fWT1lRz116D1VOVENEg3K1OHWc6h8kpNDC0ppXMh6mEnZePmC8jzttYE1i7pr+IOXhrj9nKCyw==@lists.infradead.org
X-Gm-Message-State: AFuF++lMhXHZgGXW3zqez6G/1xHoJDBZa3mLLqE5oe76MGpJBeqO2tFL
	IsQVflgKCxlhQOi34IfvssiwrQLv9eDTEeZTDRMMKo77xeRjJBgrOvKQ
X-Gm-Gg: AYBFou1VYzEYJs2N6DNzFyNl4a+UjF28QK3tD2BOek0OsnF3ymZXKpZYZhGNRfPQR8N
	he2zmlt2JWsZ/CTjWjwH+fFEfH4B3e/Y9GjmaGdyy8d8ckGVabZsOFyhY1rWVgrE1Y7h7nBYw+4
	C+l0TpAvRDMmMgMPs3zO70HcZC2RDqcBqLCq5J+gvbUMd1X5ZaoD0RN2SaBzvSaMljWpZ7pJJ5g
	90u1S8oqkWnXw12maPSuk8v/rp9KuoZQCM/cBuWsSBPM0o5ocgp7uGH5p8pMNSmjbK6DhH+gfcz
	WLhIPMUzfJ78sdbUoSTtfsxiFiNCFPhzXIJ4vdQDtqODqC2hufC4pIdj93o4U09r5EeuTO0ScgU
	ea95VPBydEefwcSkZ+4sO96U201PLRbbty7sUHwluko4gUoAS678X8oz0FhC1nsPAypzyJPc4ib
	zpNINeD+JBFrBc2WLB0zKidL0WYNZBQCg2L1WFYzwXTpucGH3aHkyHOr8tYoe6pmT6DjtE/M9m
X-Received: by 2002:a05:6a00:8017:b0:851:ba04:ca02 with SMTP id d2e1a72fcca58-85ed398adccmr5532767b3a.16.1788334370199;
        Wed, 02 Sep 2026 00:32:50 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:32:49 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 06/10] memblock: introduce MEMBLOCK_NODUMP flag
Date: Wed,  2 Sep 2026 15:31:12 +0800
Message-ID: <20260902073116.802752-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003251_128852_DC0F57B8 
X-CRM114-Status: GOOD (  13.85  )
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
index f2952d725c10..2e87f39826dd 100644
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
@@ -2887,6 +2902,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
