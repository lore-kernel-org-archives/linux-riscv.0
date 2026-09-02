Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0146FC624D4
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHm46advxIT394f7ZiVJV0GsAHSTr5Jvh7hb2bnzCWg=; b=HSlC/rpXQCUSlU
	huvIw5XQX880eL4R55yF91x8T2o9dkySv622PV97B9xfgmFGiRSys3CoaMrYEWCCz3Jw4vjdqpj9r
	EAt3aobCokoVjYtaN7qYHR4/80SuqZTZJkuV55y1onHimnTPI7SRBH/mHjAFykl+ttGJ91lg+14rm
	IC+jB4pg8c8nzJfPdpsHMthPRXGveLDyKaF4K9S+Xr+JoQDgvRDobbZEsDQHjpT5vOl/SjkPM/w2i
	D1I+b93lyKmuNQMWRA7oGV+agrVhHhF9O7znGfdfYPEroqv115XwiGt53i642Y+BWR2hjHFZB5kj6
	pMyeOINVjJNukCAbpGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fS3-0000000DvsI-24K0;
	Wed, 02 Sep 2026 07:32:07 +0000
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fRw-0000000Dvn0-1BEn
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 07:32:02 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cc150711112so118280a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 00:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334319; x=1788939119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEYvUbaRHsvrLqexK6TwRNN/GB2ra0YD4DknJvJHsJI=;
        b=kKByqb/82Y7lmTn1wzhDT7qiQQmSkXEQXhvc2XIQ5BZHkc4KpXEmUUFjmw3aCEFhyq
         wjO5II/otHDeXnfqV6Cw0hhsRzOX95LmXXTAdjTh/x3nBZdZxdkNfOTDTzbxSYGPo5ZN
         L4Z7Oc8mhSjURkjit8KcT0IB7EqU9jx2IbXQg3wXoE6+iyiCFSyyyZ7bY2GauKOyNiWP
         Y8XtE1xGDc+X2WYb4n3FHoOirkePeDfHbKvKunykWxcQOMPTBBGhc9zgMlJRO6PsEzG9
         f6HYK6QL+56mtPJFg8MakK04gzv314c6szwA+PkIg92XIi3ZSSxqX4YPErucOBhJJKw3
         nUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334319; x=1788939119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEYvUbaRHsvrLqexK6TwRNN/GB2ra0YD4DknJvJHsJI=;
        b=Gfb5enu40k7lPlmgPK1QT2iWdKGFgxlu5QtLja3/8gnwYyWq8hG4oaQKuJ2ETnCxaG
         gmc0xSt4LCUlWWVaB9QdXZeOOa2nI38YtlC0TE9YKrpmSMDkrs2Zi6l/5kYg+nh+SWB3
         kkvChxZpwrfe5dJVK7YdycxBcIoV6YDfK6ovBixmihE7KiCeeYrgnHKKG6tNGK8CLCua
         0q3Lq9BFXmlqoVxUY6wFO5uQZb1Bn/ebVNABhVHaR0mC61QZKpC3X7GOb4AC3mWv949d
         MuZ7qfHUYz32VvRIkRuhhELV/59wxsN7zbjl3Lp0BxI24WmfcjhJOU9vDZaLsxQf+twO
         uflw==
X-Forwarded-Encrypted: i=1; AKwUvBy5wDew6KCS2bTu3FYzjBYXNrMccf3QbWMkGZm3eSKroqtLG1+KDWX3d4hbOSvwql8ZrBHZ0kM4evXclw==@lists.infradead.org
X-Gm-Message-State: AFuF++kjWYfN8DXAJEVcBz/2rnoE72/B4W+BvXSIUWAJpcZCj2L+c08X
	RA6+kZ+RtTKZewW0T9yjSQpHlPeD+i1N1fk3T0eH5SIlD6YJFn2qedvD
X-Gm-Gg: AYBFou07St11Y6b3Fq962c4z9dSdKvxAjSXayhZIYj6mgqrSFWypJZIGsYJtLAOEKzz
	Un9EUIu9ADMu3w2CvM2S41oW5tYqa9+7o4GcQvyyfvH+dUx5JFtt1HLZlGc65oYBhd75f5s/a+G
	1QzOAYLnijKfcBfPYkhqoi3VbhMS7zBDmPTWW3z4PtI5SWr7hxgC1P+jbazyYqjwrc1D2TmBB6F
	QDvwUUIfMXXe6XZAym78NLVFShCoUjhytoulMh5g0MTMhG3gvBwRGypLGKCeDB8QfVFC6zA6nl+
	1hHaWx/XLRT71bWoRX5fec5kiKSf25DR7Byk2t1ELEsxK4hRFFepi2kQ9q/wMOvTh9z7dzSjXL5
	ITiR0sgqh497SE3C0icVDhm/CKzmPvG9Zm5CrVXwCqsbz6iTaAf4jhMwfnFjJki7Xgy+JVzsGbo
	d9jJxQsYTn0pcFVbC1jy67+PE+vB7eDLNFMKUHiJVFedxHC/LWvvSU4o6FMiHS6R2hG+FV4mAB
X-Received: by 2002:a05:6a00:4188:b0:857:7384:b5fc with SMTP id d2e1a72fcca58-85ed4d137e7mr5136737b3a.24.1788334319386;
        Wed, 02 Sep 2026 00:31:59 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:31:58 -0700 (PDT)
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
Subject: [PATCH v6 02/10] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Wed,  2 Sep 2026 15:31:08 +0800
Message-ID: <20260902073116.802752-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003200_361606_1C26BBD1 
X-CRM114-Status: GOOD (  11.99  )
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
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455c..1de14a2d5aba 100644
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
