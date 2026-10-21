Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32627606A31D
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2PTNl/QO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GqkpNSLH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mxkMuP/U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8zbSP2S7jjurUx1bL5HCvmQCF5UVEHtQqaKVd3SAxU=; b=2PTNl/QONeDAo4
	Ft5LyWywmob5FZegWOZtnYFh8YCNBzz7W6MwmSdyeVyneNl6W4Z1l7g/XzL0KNaf00GvdsvfOorZi
	3ZOmpvCyLfajdgmKiSu5CePGMnr0bcx7yXblt+ZO6dnLDD8BT3HACC9cx5DQBV05MxH970l6vDZ8T
	FQWO5o3+7HAA6IFZKXD/K+0R3aekW2uP6bPgx6okXU9Zm+HNreZnVULwSkE/3++LvVEOeaPkIBCMn
	7uk4SfYil+gcuSWrm49pD7cqfG9nRlDfWaT4/PssAIFhoxFn5EqB8g8b2f1E/Za8Obu3MqKGQbVxg
	8o2i12xN7MlWE37eoH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRio-0000000BMEf-0T1W;
	Wed, 21 Oct 2026 08:30:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRin-0000000BMDb-0pKv
	for linux-riscv@bombadil.infradead.org;
	Wed, 21 Oct 2026 08:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=; b=GqkpNSLHwU/X+A4d++0UFGAnNW
	RqWu0notMFtVD1bSE6ZfBJaHyhJm5JRUUBcDfRmB2iQ7gJ2vf7CvN3+Vf3a+aWpc/PuVolHVCKNRd
	EiIljqkZgA2QVPyIr4vBqmbBqrmmOiUHUEz9qzHuVnGL2k2TM1NuTkf2wyhDwUC0vmXtB4Ejl1HPq
	tgzp4ilgXpahecAY1FVG4lkp2P1xwgSa2+t0DWcGLR+GQZTPBRgKFAVkI8mS3kEAbs568uuOlIzNO
	wQSYBuEBGUjBYp0WGrPSqBGs4Fz1nS8LYGqG1PqhloTRlGbAqB5PbZwnNeIYBnvkyXLxs+qRbeM19
	avu5DcKA==;
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJRif-00000005b2C-3A9H
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 08:30:49 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cd66d7e32baso44300a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 01:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571443; x=1793176243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
        b=mxkMuP/UQTnyd6tPIhvSCP3dwPC1gb1N7zqK/+gpX/53U3H+jH1KGCG9bB6obkslUl
         aQ2+RZ7927JrPX0VdF/QgMkIRtzHNxvTLLFvVtdgooIibtPPjTssV0Ej+hBvtmv7MsKO
         r0nffS8cpcxv8ycDyg4eh4+v69Pck4r76xGCYHzmzFRV5UrPK6an0+Fvh7a9RjLJM222
         B7eUiE8E/IuTsSofOjcWUuijsCz++dvGztiNi4/THp63tFXWtPkYUUDhpDQtqZqOUsmS
         oVU/11i4b2hai4LySYCfspbOhmWpPIBYl6wWQvWYoZrgrcqO/bU7Afi6cp7vDVc4leva
         DrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571443; x=1793176243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
        b=RrxI4o3gHYOBVd4ySWW7BtP1yCi+PXquoOi2CpVAd/t37tRoah6W9pu+028l4bOE5H
         KyCvWe13wG+jcVhzzaW7pI3EKOCWFDDUVpz/cOgHBG2TQ15s5OhzRVDVe+Z9Zqj/8CYQ
         AiftOcsmfLPc3/QI18a5lz8/aAlD9P+mOaibFkKg2u1fUVEMCYvoESuausBriL+NsA4v
         OlFY6jWiwHWirATfRzNXVUJ+kwUP40IgJ2TVEfeOZAhlN6btHNWdivLti/Yc0+cpmKhZ
         uq+RyFkmDga5yEMb8KBpqtQa+N1Tx+uUh4rquVw3ISZni1SFbT5i+15Trc6L261yKu0S
         2Tmw==
X-Forwarded-Encrypted: i=1; AKwUvBw5hDSBYknsfwQrQxNLky28p/Xt+SkEeqjNOb8yRS/zsbDQSRBU0ibfglkoyXx2ei2VSq6pJijuorMciA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLo8CP0hh23GSwAoirZFS/1khihmOYau0e0eK8iM3u8iBrX3tQr
	E4xS+IJCfjzrSC4C+o+ZfpnuzPdyOai3eF8OB12MOf640Ba/qVWOQnoN
X-Gm-Gg: AYBFou1rfSJ9XZwYeFGy5PRsJ9h7rGvC6BznAHBCG/IS6YfbpIuVMLNsL4eAT2UAZfo
	2HToY9EAKv+YtL3MGdBHbQYGp24gUMMC2RI/C/Sb1biyI99Ev1r+o/cjkwbxLjtzkJA3DweSHjC
	e0t2Gy3yc/Ey49tBUP1BYNnACHrALsAq+DGsIYff8B4wst/uGPYr67b+P55VGdTTkzRX/dX6XkI
	qNR7sIX8l+f7adtYW9XiMf8Cx/9hCNpmPmqChITfF+rg8LDz4WQ3x3pZTUvEledDlBKxWYgNvBU
	c6+p4C4sODaZYV1ooFOy3gY4/XANIyzAqZxk0i0HLzWVpwaM0Xo/fc3VZM3zQkgaeE5QZeWooOU
	MaG38pmVeeEfzlghlmaZXIgCCNqCaKCj+CCu+3w5jNRlwWYRuuyURYUPxVCstSMRWLwoWUF26AZ
	UWLplg2wXJT48dik5uGmuySM7AHbWyWsafdv9rEXo7QKA2EaZ+ns67zuGmSPI+LE1+FsgXzqY4q
	o2dZk77PzNPYrN9q/aimE4uEY3BQC0F84DfO+1ofL7x86tl6UI9J3rCLOQ505C9zrLE
X-Received: by 2002:a05:6a00:a204:b0:874:708d:b620 with SMTP id d2e1a72fcca58-8a089d13a97mr1238939b3a.30.1792571443298;
        Wed, 21 Oct 2026 01:30:43 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:30:42 -0700 (PDT)
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
Subject: [PATCH v9 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Wed, 21 Oct 2026 16:30:04 +0800
Message-ID: <20261021083011.2170525-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_093046_052304_140519FB 
X-CRM114-Status: GOOD (  12.27  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index e7891a2a89da..e21d0bab77ee 100644
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
