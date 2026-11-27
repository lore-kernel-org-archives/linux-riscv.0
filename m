Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7130E606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ATk1tGbv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AQR3YaA1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCFjgDI3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fBZteZ6b6gAXJ24gXOJ/F+mUdBoqwN5DgB282cPDSQM=; b=ATk1tGbvT0S9X9vX+3X4bPksSH
	z1cJ9VIncTsG8GELchmquTaZ9PwUy1ofU4XAOr1YvxPPcxLu3wDnQOrmMsWcQ1+BGdQcHy9cqv+/L
	kD/3c7FSCgPPccvjIqs/HBaGC9zxoN1fCGOVP9MU2fWAT3lv+KyQijnH6d36qvRtGujWGE9jO9PQU
	p5+eSkQOfMQfNuWVhJBJx90IlnawcqJF9OCtvlHxDevVcgIAtcRMKv1AnOIXnzquajZC/hTPRg/AD
	bxPkpC+g/nLxW13gQj7sgfhakaQXNrSDJto3jAJSfcBldwl8kAoITt0eJn3yvT5EX4i1F+ZtTbm5H
	Ihb0lmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrwE-0000000FML0-3cCt;
	Fri, 27 Nov 2026 09:08:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrwD-0000000FMJO-1jV8
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Nov 2026 09:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9Yac15kv4zUJMw/dFjjqld9TLsvrPI7GRE4h7XfVDwk=; b=AQR3YaA1m0px3gBk68a/CZcsSU
	lX/BhEf234NuS/CUCNIaGnuGgXfjdrsy6rvCAgTusDDrqB5J6O6CBonuFi0MUDzd0e4sAB2V1F+3c
	b1FBQQGZv/j2ygpLl2EGPg26GO71TEmn1di2SPmLWUFfOKFB1zn4yb8/Z8x4pn7J/PvhxuuxmxpBY
	QcrTDN3hN47FXq2G9KCTg7xaoYGNkzjnN7RCzgqjhnX7g6ITN5vznZOZ4QNeTu2/SrkyIEtzbFMeZ
	cRDrkpEipj9O+Gw/DUOu+oeKwcIMJl7KLlVpedZYGC3EcYrBQsgg+xaXI03HAANdazsPdvyI/rhz6
	pifLSGDA==;
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrw9-00000007UMh-0R8r
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 09:08:12 +0000
Received: by mail-pj2-x07.google.com with SMTP id d9443c01a7336-2efd15c7545so26514265ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 01:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770486; x=1796375286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Yac15kv4zUJMw/dFjjqld9TLsvrPI7GRE4h7XfVDwk=;
        b=aCFjgDI3ggJycooWEy/2ER9RYjUSQF0m04jWaPDQ88B6nvrxyfft2p1K1pxqM8Y1EH
         hNT4oFMfNeWdov3ZeK0uLyaUfTsqp13QA/KRkb7PdVQW5dXhuzNmKslzxSpaMc/JGeFu
         lsfApepKM/K6RiyDKdULf4eK6aCKLwrqik9/OLyUKhMb/vKD4jD04rLXg2I6jDtl3s3Q
         ohpNLqT0DC+Ce7QHWce+1rKYc4G0houNFbMvjWl/wwqNFxkepLJsRGnUyOFsjC9mroQW
         b6ipCOETpLds3N5I1aCgBl67x4/h68YfCJyZZ57Dh6ppjjhztYrz3G/aOc4DvnoMOmi0
         M95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770486; x=1796375286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Yac15kv4zUJMw/dFjjqld9TLsvrPI7GRE4h7XfVDwk=;
        b=DWAqijCamzHwRWH/aqghZD4WKdwCCAaNfZLsRweE5b1Dnn32PIJMfxJNqGlMITIqCb
         O0sliq+fH2/LZ6CEhZyGKpyIG0SW95gEnSI2+yCcEMbjDnw5FBCg/hE7/tI98e3nfEwk
         3Tf8cZ6ZXZ7z+Lj3DHqNU05XghVLfyZS2NLywn4iC6z/aGy0vRk44PK2Y+TvQSDT1Cq0
         QK6WCUG9RIauBNlLGSdIbfEz4SD6Md2cfc0/pyYQg7a1hUq2hGMazuZnLgKKSSJJ+eZQ
         pEeMMEI7+LAInrzgfF3Z0wMiygv/7Aa9HOk/JqE36FHuJfHJmnPreFXVyogUZYBCeg/M
         Xfdg==
X-Forwarded-Encrypted: i=1; AL+hErEcszvKRNJZ3ErA87rszk1tR5xurWo6Geyjkoogv26jag5DoExDCI8F5tS5WQI/PM5LbO/SXD6tRDiEkw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9po4NHvVxI0kHW6q1rVLiRUztvAiBImJRS5LdOrnP7s38PffTe
	dQ/W82RAt9xR/HIoOe3Zv5Ku1PKa+qLMfT9NG0vozxV3c76qBqi4FCJh
X-Gm-Gg: AZFdTZcYFwZF/le37FXqaDCqjdENgyNoIKisvLUToS/N1neHQQLViSfQmoVZkuDDOMG
	XvS2oo+WkXFte44O/Bfd5cidZR9KELvM7rJzKpvgCkFcivDblNVb92YMci6gQEv7VDqaGAcbhTc
	jGfN/kFYXg6JT4yJT69huRAxBmuxPGeEVvCOM8ZvZZyjz9+qYKnJBHLaywUvKdKpet60Ks+NtyA
	zY4ph/BEeURdyWrZGF/8eK+LgjxKs1CaGSj+mGSzvKZHI9828KQEXISM9HbBhdy88MZqEGYM04x
	1NfZjbnrqLEs1OonITqfXpPbwZTs3kdo1UNxJUySKpoquikqtW2EuqbA/BubLqGsKvCltWM2Nor
	2RR3XyPacEzF16/mzOxFiAg/XHmr+n5Ozp+JlZ8gBjPJWEcoCTSA3RE939PTEH8pIxLl1UyUjDF
	ai2Yf+YBRQfv8Wy1pOJj/qLi8SOF+FMgSvMd8Tc945nqe7oI5+7GNYP2pSFm/IK8ZKwdksIwL/t
	SJROuBhIb6/BUc/PQVHJI4QtCSFzMkSMhShvvJoVm4BWxHkhbYIaiZbRGyhjZcBZary50MIP71J
	2oi+iAQTmuqghoZ7mZ7aWbHr6vo9tZigqeE3VzldUg==
X-Received: by 2002:a05:6a21:8803:b0:3f9:292e:775d with SMTP id adf61e73a8af0-4014bc4b4abmr19459218637.49.1795770485952;
        Fri, 27 Nov 2026 01:08:05 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:05 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
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
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 2/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Fri, 27 Nov 2026 17:07:17 +0800
Message-ID: <20261127090723.741253-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_090809_192401_C7918FCE 
X-CRM114-Status: GOOD (  16.14  )
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
index 14f453dd0946..18695f01043c 100644
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
index 0fe60907b97f..bef459287683 100644
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
index dad7f02365d3..fdc6695e8588 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,32 +37,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
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
