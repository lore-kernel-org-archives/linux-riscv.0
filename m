Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D2BCCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 03:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U22Ty+p2+gU7iqrmx7xmTJslHVHv9OqLbnxcybxKNH8=; b=J5MA7nEygj+0Su
	HEuhz2iQjUe2YMc+yjrNG6bnHuWvOt/foEU4sO7os4INeUNwt4LqgJ6hPGza4yQBPkazlzeCpz+a/
	ni9vJ6zMawY4O32bTtf1ozZa1dHFsXYJeqpQG0OhbaY1iFtQqcVZiZSCGnSDOyOAnPolwmvWFqU6y
	wzCaKeisDKTYynx4VFIhS8IRYrLBUncZEYtxpTz9XxUnmhmOUbZLQ94rqOB98w9kxfQNILxZ6laey
	XIyEB/02zCtHNyaSNYC0kvgTmzSrl/DSiiwT0QmtqRFFaDpGPwyFp+SB/3Hl0ClDPivSaOYFI4R6X
	6OoKWJHCx/LDpRVkn6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYKG-00000001nPT-1cGQ;
	Fri, 16 Oct 2026 03:09:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYKE-00000001nNp-2XCh
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=; b=B6swhyaCAMUqc/8HW2PMlHjHgx
	D+av/7eF29nrAcF5BY/JgbSwlHZO9kd79NT2bUr5kVWR+x1Ik6ASqwyx/qnvWUfpiEjAZXC+wL3As
	gjpPvr8MrWPF8nduBsP3o/TWnr6JvvrCJ4UqnJwlxvCaXzeXgGQv2hSHeaK0L3ykwqjGSzRkrThYT
	rhm/PRc1IYdiLi2BrAnQtYinJovqh/9prIpMFOJtX3PFvelL3LB2YIE5XslQLMdb6wRdtM1f9amAe
	2a7OJQOoO1ioUOnaX2Yca2EygjqFNSO6V0pc5Gz6xifHi4x5dZlBUoTCjeTkrY6JBN47UvE40lQ7i
	VhMw7u9w==;
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYKB-000000011uI-1vEk
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 03:09:41 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-3abe4fb64d2so2657609a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 20:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120177; x=1792724977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=Y2qMKwn4H9NnZBUTjvIjC32WX5HNmDm6S0XW/bn2s0Lf6+wTTbVu6BNpbKQ8WhEkkB
         exVO4m9hohrYmg1Gywh68eD1TfynOguvnnbYORb5o61nf1jzo8f5RQQd0NO+vY0gW+OD
         8nxi8FaWoV0N2cTQ2Ss7fKFlADgqIMBft5h0G9GB4eOSq5He1G8z8CGkr2xI+H/6AGpU
         6d39Qbhky8XpCN/BQ+9TDpr+u67E7T+HawSBaD0BeSPKmZIiBs9ImA2cnmvlhQabPcMV
         CYGRrTVMqBqty0xFSws0mi39aohDbOBOYqkgRib6m2fh5cZV5PFxz42Wh0ZjDzIGDZzx
         bzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120177; x=1792724977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=ON8gg6zsCJ2W6njp+0mgCYSirqMjcfJpLiNkT0PRFdYhQOUaDkS35wmuimXtRVHTB3
         IghRx/3g48O8YX3Qs3JnY7p9ZlHGrGGHiECHHr0QyCuLhCeRvGPbGERDkSrcstdXb7Ua
         xY6xXYGKia0I82nkUPT++pkEGyPsft8KOOVCZF704SaqWF6vz9SUichNRJfqb6l5naWS
         3f5Cuj8ACb9gZ60Sy0Q968V0zWAPqnLi+XeLGtGE+SqFj1teoMRvUxKMmZj79n+pnyaN
         gOIbOOD+OW6Hpx06+qCppG9v8rO66bFRR7CT1sVt8GuKKZBDLBvUnsmMZq7zE1V4BevY
         Vexg==
X-Forwarded-Encrypted: i=1; AKwUvBxI7wZ9/82zvSKx8W1qwCDUOgyDmFpgAx9SHwirpJVy2zl4UP4SFfnu4Tnc0yHOyeBAN7LLqKDA9vJVfg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKinLxkpxfdFCWIzQ5AI2X7hQNlxdTr6V7efu3iUC/Emtq4hr4D
	LTElegSsnO97e8w7cNu+pJNoYtpl1r7vv3KydqJVwVWlrCvaTUFUQEI4
X-Gm-Gg: AYBFou3DqgOeu4lIDLU6QsiBUjjz2oZViBd9XgR6bzq4yL7sK2eIjkIu02Wm6nrM2ON
	G1zZfJSLhlV46njSqSYsXJf1Y5k7y4tpBwW1Q9AtT0yFhtgXvxacFkqQUtZVDWvqU8frz9+nvCU
	mHmRmHPKVEsBpUSR3KARURyx2R1JGU89mgPH1uhSsaa0wJ+2dR8oixjtQR6NCBMohyV9w3fpq+3
	cKmA6l1OMBiMaKJAHxYy7Wu6Sufu//KHa+zO+pLJa5XmERANq4DEdiAuS2mtZP4bD/KpPDchqFv
	THLPjulXq0XYPodpKkrzwZI9R+pqEF8VQe0/oATcwkabZsNJJzc0rlPoAn1V2zUolHPqOCbRyZF
	Gg1nSG88Y8CbsNxXrVQDHaUw7bOuaGjT50TYXqsIDu1/T7sJmrUNkIS4daSZ3octbzeUhOfEll9
	f3/pu0bYbaz7+6b6sClqiU0scF9TRtGzHnPa8LpDwWMN97VFBSVHhJ8in4WrPDC4OsE4kQsLwfX
	DOXvCGWr5E=
X-Received: by 2002:a17:90b:3c0d:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3abb39f450amr14169913a91.11.1792120177160;
        Thu, 15 Oct 2026 20:09:37 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:09:36 -0700 (PDT)
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
Subject: [PATCH v8 2/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Fri, 16 Oct 2026 11:08:49 +0800
Message-ID: <20261016030855.4062882-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_040939_885356_00CBC4D0 
X-CRM114-Status: GOOD (  16.53  )
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

arm64, loongarch and riscv open-code the same memblock walk in
arch_get_system_nr_ranges() and arch_crash_populate_cmem(). Move it into
the __weak defaults in kernel/crash_core.c and delete the arch copies.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/arm64/kernel/machine_kexec_file.c     | 29 ----------------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 --------------------
 arch/riscv/kernel/machine_kexec_file.c     | 26 -------------------
 kernel/crash_core.c                        | 27 ++++++++++++++++++++
 4 files changed, 27 insertions(+), 82 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 854d872dfd0f..34d944d3f22f 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -14,7 +14,6 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/libfdt.h>
-#include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
@@ -39,34 +38,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	return kexec_image_post_load_cleanup_default(image);
 }
 
-#ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-#endif
-
 /*
  * Tries to add the initrd and DTB to the image. If it is not possible to find
  * valid locations, this function will undo changes to the image and return non
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5412aa9f3568..481b8f906a56 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -13,7 +13,6 @@
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/kexec.h>
-#include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -56,32 +55,6 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	int nr_ranges = 2; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 /*
  * Add the "mem=size@start" command line parameter to command line, indicating the
  * memory region the new kernel can use to boot into.
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 808e872f4063..fdc6695e8588 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,32 +37,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
-	u64 i;
-	phys_addr_t start, end;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	u64 i;
-	phys_addr_t start, end;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf899..faa0f22dbb41 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -281,8 +281,35 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 	return cmem;
 }
 
+#ifdef CONFIG_ARCH_KEEP_MEMBLOCK
+unsigned int __weak arch_get_system_nr_ranges(void)
+{
+	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
+	return nr_ranges;
+}
+
+int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
+{
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
+	return 0;
+}
+#else
 unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
+#endif
+
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
 int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
