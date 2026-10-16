Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0F0CCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 03:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OK5WK0WVITr6b6WmKUimUnwiycdnUrZo+C5roVF8mCc=; b=h3z7Tt7Yjfopml
	F+pTAAp0I4fYSju2ROCjlPt5s8gXwaKj4YsVppHa2uwQKpEx95egWt3urtA9OvWNKQhlMuXDiAApp
	wwZ1UnNXLsJLMfO9wRap/Sa0D6E3whiqiZdlPo224BlvTNgHi9XqsFdwMeH/TDIvI2Au/DfAF1ajp
	PSOow9keUFGxoveNxPIRmQTXja3GKhYLbk1sHKdkYAc459K7LH29Rwy7Jx1QhCLU6zTajtGm1RJGz
	kl58k8n6TH3dgjC1Xw/HG7CUQJ4AXjBZ/wmjaIjmdbgB3OnSqocKTpYz08MISzgAXoB8W4IuGJP2k
	KERFp18ZzQvp+fP0tgTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYK0-00000001nEd-0CAH;
	Fri, 16 Oct 2026 03:09:28 +0000
Received: from mail-pj2-x06.google.com ([2607:f8b0:4864:39::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYJx-00000001nD1-2Fm4
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 03:09:26 +0000
Received: by mail-pj2-x06.google.com with SMTP id 98e67ed59e1d1-3acc610014eso196432a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 20:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120165; x=1792724965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=;
        b=pykGi6p5n0lqjw+03t5NPoFmTh51Zcnh/Nr0Bua9q4mV5HRaRUwEx3ChVne3b58iyO
         YtfPYWAkIcthNQ3DPZy7+mVVdqil8Z7hPYYgCrTiOT5zCsfgpsHGBJPbgL2h/8Tn5YoR
         8FdnkaxGtTVW1sOxshAwCnKUmucPYNY90AIEwRwx9Dca9s1zaca3xEcVUFNuCSOJCEcr
         JDAua4vMIcocjTeo9Rfl/Yj/OxbH+dx5h7JnK47U5XSX6wqJGemVEZffphtrcbvn/5iX
         Toa/F8Ere+S1HiT/XOlBzs0Xy6xnVbhEm+BdDYLVwgaIMsJ+2nD0R0DEgPYJCxqzrye/
         6KqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120165; x=1792724965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=;
        b=tA2JgqBBUrO30V3elAIYlpzbGuATtSAxmjvuCDHNAMwllzTfGtTUXagOvjipNJOANQ
         PEgFNqNzEi6h9IUhVJtIPoaIvAHHy3plaVjjCBqf+tCEewRg/OCI23jFKU8RSBYLyCsh
         v97BJ7ZyGndd/5It2TMMwVTatxEWUA8jwv34adHoiGZusjpQHrSy08OGZE1c+mmxa8aD
         479XF7Fu6zS9OIiM4MQPCUYY9EDBYduV4VeqYtQmhZYWe39mjoWYxfzCH4od/ct0w922
         bvVsxdjoDbaKVew1/sF0fyvFqqkkaoB1K+kqtHH0kRhrRvN7R4Av8j7Iuq8CpzOv/uZ0
         86Qg==
X-Forwarded-Encrypted: i=1; AKwUvBx/znjroG9WWeDxseyXv+3qbEofs1RnzYo1yGQrjpQyY3/rStk51e2s1GtFyOzU4+nq5ZkjlLy4wNjlFw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJpox5yUHwZ3VTk98lx5XwuS5brAU1bqiAJma5MSt50nritvQDk
	8Pt/4bNlg0wV76U7a6vqmQk7kXslqmB+xWzSmWt+BgzrZg1+zhhnYlVc
X-Gm-Gg: AYBFou1PISrsB4oFD7LaQglwKcVDb63Rkqb29sHkQhkXpSp8CE6ML/XxCsrIv8r7w5i
	y88H6fFHlc7d8baEHVg686TfeiJS1nYVXhh0xMZfBbdcIhV5wvcuTQbLbGrpEujrY1yBzJ0Apsg
	6zRicwE4U0lhRodxbLWSmgy9tL/c2+UGA6W/7U5bEN7JBYpNkkS4LDdP0R0nFTGHVsw+Xj1kGep
	hkLnKI+xwjVhdsrrwZSyU+E2bCMKXF8iWYPnUCsHtVxDma/2K3q12IekRdfmTRR8J0WTRTg1PoB
	HT2m277KBga8UNrxZmrnXbrQUKK782D7kOBXq93FA/5IU5rRhfVLTyJdj2P9Te3Oj1IiX3u9GSm
	zCfk6inuTGsnxq+MRnO3vNtb0fwKwPkMUEl2AkSHwPPPz1W9/0YIBZJ/Q7qhAx/G2UR32mhLOQ9
	xeP4F+UMxkCnGTVDfhfMs/GGsh/loCGZr59J8r9FeK1rZ1NahEgyaSKlywWr86LCM1W3waQd1z2
	xi9BOxWwSc=
X-Received: by 2002:a17:90b:5823:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3ab3ab1d561mr18240688a91.42.1792120164811;
        Thu, 15 Oct 2026 20:09:24 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:09:24 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
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
Subject: [PATCH v8 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Fri, 16 Oct 2026 11:08:48 +0800
Message-ID: <20261016030855.4062882-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_200925_606583_1ED88A25 
X-CRM114-Status: GOOD (  10.98  )
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

Replace walk_system_ram_res() with for_each_mem_range(). A later patch
introduces MEMBLOCK_NODUMP in memblock, the reserved-memory regions
marked with MEMBLOCK_NODUMP can be excluded from the vmcore by walking
memblock.

for_each_mem_range() iterates memblock.memory, which is freed after
init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs ARCH_KEEP_MEMBLOCK
to filter reserved memory from the vmcore, so extend its condition
(ACPI || KEXEC) with CRASH_DUMP. arm64 and loongarch already select
ARCH_KEEP_MEMBLOCK unconditionally.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 62a4be0474e3..529310e3ae1e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -58,7 +58,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
+	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || CRASH_DUMP
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..808e872f4063 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,39 +37,32 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
-{
-	unsigned int *nr_ranges = arg;
-
-	(*nr_ranges)++;
-	return 0;
-}
-
 unsigned int arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
+	u64 i;
+	phys_addr_t start, end;
 
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
 
 	return nr_ranges;
 }
 
-static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
+int arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem = arg;
+	u64 i;
+	phys_addr_t start, end;
 
-	cmem->ranges[cmem->nr_ranges].start = res->start;
-	cmem->ranges[cmem->nr_ranges].end = res->end;
-	cmem->nr_ranges++;
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
 
 	return 0;
 }
 
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
