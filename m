Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB01CC624D4
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAcN3cJzcatqsFkgx0ZZom1hb7c85erPLe2VO4rpxuw=; b=C0QwsIFs61gaOv
	S3TKbzohzMK8xpcYTsxNgEniaRVzvv5O5/e6dfXjRnJsbVydDjSgp03buo+Cgcdornr5t6Wn4mmo2
	xYsV5uO51Yh1TAYngGzHxTDXmh0/WvgTjMWsNFgkbiBqjVieI/TTuR5PpoWEg8OYEbD2LQH94WP+0
	IlTcPdJKeKXpPRtBiL8MucIVCKPlhtB/fK3SHSXtuyuDVC29OqVW1ZpouV36djZ3z4ny5fAksXdMM
	0uzmAVE9bN+0zgeZmhUJkhGowXn1QZe4iAzNesep7ZReKqbv3rExHoc6y52u7sVfq1zn784RNoH2d
	NicEaDMk96TkkIGHTUSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fSG-0000000Dw1e-3bKf;
	Wed, 02 Sep 2026 07:32:21 +0000
Received: from mail-pz2-x03.google.com ([2607:f8b0:4864:3b::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fS9-0000000DvwY-0gbL
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 07:32:16 +0000
Received: by mail-pz2-x03.google.com with SMTP id 41be03b00d2f7-cc1c2963c92so224518a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 00:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334332; x=1788939132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1lPJGPvZxlgDVbSkkI+j7mcGDHCDt5YKPntydBISgc=;
        b=LS9SQH0xAmJZhXAMrsDsu20mMKFW8ZoaIiGxBasHQKYGvTQ7MuaVxy/VfQvwc6lqmt
         3XxF9hJnWJRqFrIdFUE9EB3l+MSxUakKU/WoYPpLlftdJXxUi/IjjxhG4oVOuPeKjSGG
         zefxMG/d7rqB7qWtvq924O8xbnI18Q/moD/0iVMC5S3+APxT4vcdi4u9XZzRsXQo2UYa
         X/piZVvm0BzFC1ThePawRPmRbM51QVOExqMjQcE56ed4XPpZyCdhcBcn1CytTA+xMzel
         n2Jj9XMKiW8R2AHNt8f3S4qBw3p0yQbiwNXdzb2ME9rRdnn7gqsYat17cly63rTdpw0w
         GVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334332; x=1788939132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1lPJGPvZxlgDVbSkkI+j7mcGDHCDt5YKPntydBISgc=;
        b=SUxPnwLRbVHfg7MgxrV0BkrMCnRSBh6fAHRLkqWlWpOPanHQzTgMZEI+qV7BuhDVwF
         w8ibTYskW/9bc0dO5uabRPdPa0wWCoFgzev7OozDO8vgqMEj44ZUOe+wD3dexsRiOjjA
         Rz13ZnPRHThf5d3sgm0QTE0+/P7q2U9mAkFyu1w2q1GyTnaDIxRi+H+wE6HwQleNgBO3
         xm5AGgp7Cy8jODmh7EDhY8szeBOqfd3dkdKyLr/cSY1MVOGHLEf4w5HHz8nMNAsVHxFl
         pLKsJZHDwzYp6unKNv+6SnwTYF1NjmNsP9yRgtti8+vZv/mAEgNRVbq+4xThiccFK7aT
         UybA==
X-Forwarded-Encrypted: i=1; AKwUvBzY+U4KBiKichJ/PSdST8J762ElsqipB5oMvPqG1Bcv8nPKaBwIepWdia+wFydvhirntx/Cle60e3pjuA==@lists.infradead.org
X-Gm-Message-State: AFuF++nXctrA09N8XQo7/rxZMU5022RyO9p6L2mxFRX2RX9+6E4/Z6Ge
	wPrWHJhMRKSLWP+P9jkqe6sHAXL8UoaflfzCmf1j9oOwtGO7BEv8poYx
X-Gm-Gg: AYBFou2HYs+H6fArjg4NZuL++haSlwb1tahiODFLQvP5hkSt+cDij+wMOVBSQ/HfRyc
	RGvWXZgBNKEZ7mmF14G+odZ1GvDQ3QCzxy3LuDoBOruvmSOl/t2MH9iEnNU0ERKgkwTh3sq5UQp
	iU1WBsXF3kerp6eErkycskRFJNJRur94k/AKyZo/yJHgU0PE8fV6/WcIjQ8RPMhqNCkqOF3umKS
	m8LB+YDPwXAaouTG00pZ0iI/n1qIz7bSRaXwQyY+/oPqRDIxFqc232p6f7mGKJSGjbdF/Dc98dz
	aMTos0Xui0TbIAeue7zbUdtEm6m2xLu9DMUDpy0ddDi1iocKss7PFZG7sSXAAkg4vjWhLYqLzKn
	Ta4O1vONStgt5ACWOsLXefHYhnRFQvkDDGny1rnaHnKSTNjLu0LZDTdLk+LobrKL301DBfrO9hE
	YqilqoQH3RA6FdACtwI68tY2mujIV1yaakGKlQjle/5Xc7t5HAR8QIRvhXVp7gMPm8AMdwpfiKB
	9U1dAmUXC4=
X-Received: by 2002:a05:6a00:1c9e:b0:857:73e2:9104 with SMTP id d2e1a72fcca58-85ed94bb41amr4709226b3a.20.1788334332169;
        Wed, 02 Sep 2026 00:32:12 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:32:11 -0700 (PDT)
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
Subject: [PATCH v6 03/10] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Wed,  2 Sep 2026 15:31:09 +0800
Message-ID: <20260902073116.802752-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003214_302989_D16850ED 
X-CRM114-Status: GOOD (  16.02  )
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
---
 arch/arm64/kernel/machine_kexec_file.c     | 29 ----------------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 --------------------
 arch/riscv/kernel/machine_kexec_file.c     | 26 -------------------
 kernel/crash_core.c                        | 25 +++++++++++++++++--
 4 files changed, 23 insertions(+), 84 deletions(-)

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
index 2b36aa9fade0..77285ae3ce60 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -281,8 +281,29 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 	return cmem;
 }
 
-unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
-int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
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
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
 int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
