Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E5FC98302
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mG/pQa40pZHcpDsYtbkmoxACf1tRpl3QtfFAxSxDwPI=; b=gR57XsQ6+u/85c
	ZZTbmQpDg7nD2G6wwxzlBg/fjpYmbuvP85SpbyrK294h08zcysW56eSR6rhkD2NdboWCKVbhAxvND
	G8/T45WlFNNZjEcUFzgVWAf9NeUXo67t9RfNjef+WBdqqlz/h0axYUYFrzZ8Xlz6xIOBrdmDT6tRK
	+MKia+J/MqCKf0IrdX2r6VHCXA5/AjxSOkARl8IDy+BLo7zuH2L+jvI94z4SLiGs6QtxxW9rS+3Tg
	z/jWkgLcadzmSTNJp+RsO+HEjHkGmDVwobDfyecDOginqY2qQzTWthapnNiuAY72yp1ZJvhLBwFVh
	iuHoRePIuL7J/0iu4/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w69-00000004iVW-06wt;
	Tue, 22 Sep 2026 08:43:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w65-00000004iUP-3Ta5
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=M1ZOEGC6NTnorBW1vtDJTTSNUXHaycEwYALUJLCTDV4=; b=AdMMMYdynOVuoi86+7FHMkuMff
	cAuK76QTDurhTcz+IAu5BuKbvk9EJzXV0QwAO8UFdBRyI59LyjoVztHW8mxsJOVUOBXZmd+bVpPUS
	0w7qZTV4dmktFxjYaIeO+bPytd/MyVY9AC56o7PoI1545sIefSFUZ0TfzAbWQh/8bSuoTlVeYvFIB
	ms6btRfpqV9XoTJ8VULNWnccdD/z5kpmYGeyWs7j2w2zVzAB/8pbBKJTfDqUyglqPuJ9IpqB/OTvi
	OccJ5Hpj3japB0i3GsakazSiTYNNMyE0nTYCldJCF4NYEMZ4aqhotg8F+gnjmxengh01RImzlVjE0
	WYoJB9Mw==;
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8w61-0000000DHSu-3fok
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 08:43:28 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-398e10200a6so2418322a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066604; x=1790671404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1ZOEGC6NTnorBW1vtDJTTSNUXHaycEwYALUJLCTDV4=;
        b=nziQsYpl5u2i9n6g3dU+LeYyJAE0cDsATo0lNvS9qdjhJ83NbEgk9Y/jMg/uEIeKL/
         Pe4ifGsV6RVp9EZD5dtb/JRRmfM81NiKpwQXMK5mpNHEhnLAe9+3WOmrl4X4yQfdyUkL
         moWZC7ybPKY2TDQSS18xYOQIQ8kUw2gyhSvya4kidXsQBjOb3rL4rThsFpH3JhyYDHoZ
         /6XQPVDqK8/RKQ+iI0gDu+4dD5ULec4APT742v9/m0rMogNs/OV8vf5vMNOBf1ch3OKs
         jdrD2KvxoQehLp4gzH0aqd5gJ53K2c+c8MSHVFhugCGlSczqhvQJHia0C6tGjQoNPNhL
         4pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066604; x=1790671404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1ZOEGC6NTnorBW1vtDJTTSNUXHaycEwYALUJLCTDV4=;
        b=HfWTVLjMKYQSDTz9dbgIPuOlJ4PvvHHivT1Jed9Og1tuqcsNMDvKdXX/Li9IcgvVk0
         9p9pL+2Gal5Fx3EMBScVEEEdNC5M8ZRtlPGDBTWFHrSxY8zzhESC9ght2Pn5+lTDSG+h
         d32sUWkhrSO5x/5FIE3kWA/RhqlsYcsRbMfVurjwQdN23NalJuPMQSCvAxSHIf78Tm32
         rkwAHATgxAN25VKKK3mc8q/wsA6YjR7TzLfZxYgichvvRen5xO1EVy3Z8DLFPy5tCR34
         rJGAJjsWnrNnDQowl9lJCmnZ3ii+m6DhZPoN49v8G50co1vmin0g+7/98uTLvQnmKBh2
         /pKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuViVTrjT8Yo7qmX8+iTOTmCdYvcJZZLcnQmW5LFwmhsFQxry7ArgwXl2nHiLWQVys7LNTj3D1dAqZLg==@lists.infradead.org
X-Gm-Message-State: AFuF++l5XoHUuNez24cUC26KmUBPmTXcWetChY3+JR7Kph2fO2FgNhuZ
	V6Zsm342lfuZGHD3r8dwCflSpwKrL91/T/zgNvgOronvykC/pjC2e4F7
X-Gm-Gg: AYBFou1YaX+UllQt0Awcrf2q3nuc553z8Etl1P/G61NtbLL95GKANK3Lqhx1hbz9LbD
	4QhMHWZSZDpibmCZsQpZOjYfichOkNMOSzAfHRJyQ9UcIDcyUtEKqWj0PYcJUaQoS7n2S/psaoa
	opf6HeavL6apgM/FQcPzPxKSFb6ECgLK0lE7X/CYzMY1c/dXbqGcnPtAkcTTUNFyCsC7gn5OuQq
	nVsS7UbOnzvZ/YM5guhvqcSnVGdmG56W3Aix0upt8KcQpXjFAuBl57eBX0CZOvOQ2sKaC7toMEO
	mzRrVvkXmUpDN0nrQ5uTT152bhzw/rCqSsqoXcDbSW2TE0fzqvBVLUWUgY3Dwf5stjYMSJPxzD2
	or5ccyYaa/LcOefmKwyylopc4jYrEIZa6yxHKqij1vBnqKuciHu1BqqnjbaMBx8L5s72bGBp2Rj
	u6BaR75oWZ+EVAUC6JbaQc+JiHSf36HiHlk1SCX0t11foKqvqF2Fp32oersDMvRZWrT36SUSB5W
	ajEHtHouj8=
X-Received: by 2002:a17:90b:1d8c:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3a073182cebmr482494a91.19.1790066603666;
        Tue, 22 Sep 2026 01:43:23 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:23 -0700 (PDT)
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
Subject: [PATCH v7 1/9] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Tue, 22 Sep 2026 16:42:48 +0800
Message-ID: <20260922084256.1515554-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094326_953602_26C89622 
X-CRM114-Status: GOOD (  11.58  )
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
index a590db7687c8..991657b2465f 100644
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
