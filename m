Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84747CC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 06:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U22Ty+p2+gU7iqrmx7xmTJslHVHv9OqLbnxcybxKNH8=; b=hrh0cAqWE6pv0A
	++y63MfICOPjriDGLlRLagvl0xQgDMArLDCb7qbRrITZfvIS5UVJ1zyAMTTx73xUiLjcnYM78ltwr
	JRsUegSnnoV7aN8OJ7zMy0/E/xOr1udyipJqbx8MQHHyR6OOzQFuRCetWkMo2KtuUpkWSsLrm5PBy
	S9h8SFXZJzctNCeK/iwWWtalyn7G2nA1C/02uZMPQqZx2iTAIU4vBv/qbG8ieadXwiqklIXvebA/F
	IfX4OZufH5QD74sQhUy6qSWgzBuxgvXkvMVXqaaUtBCTxx9cVKzxUYlwI4j/OJTLWK6+MhQxy/cI6
	/P/Lhl3stKfJpcGwHjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFA-000000025Hd-1n2F;
	Fri, 16 Oct 2026 06:16:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbF8-000000025G1-3val
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Oct 2026 06:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=; b=G2bDU1ncP/F1i8IWKI3qeplIgO
	Pof3dfodalbTVXgIhFPBq/ZnE5kFf74f07pKhzyHQ7P0s43+tpOWPG/hK/LF0DuxbJxYcYz5cUVSg
	QOLReKFp12LoEldEOcmtpajSNNyGybpeVwpcUIIonp+dRrjzpqfRBCGC3r2bn6xZGSucdq2b21O/O
	RYT394PkEl87ZtSRIMs8A8/Y8bPSxDddMYooRyEg3JsDmtd6zjmV2i4H6jj+fgSbKPUcESvIqkfrY
	r263uY+EiayEoxltckZdMMj90xdf7GnHXc2wo2mHZ1HH5qHwjI9jwtfxuyPOsmOIKWkz482+/by1t
	wKovGwYg==;
Received: from mail-pz2-x04.google.com ([2607:f8b0:4864:3b::4])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHbF3-000000019bh-1ddi
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 06:16:37 +0000
Received: by mail-pz2-x04.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so604412a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 23:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131391; x=1792736191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=KGjyGUvQeX2aCt1uOnCnckiiD/nRXlTS6mgbYg7T6qGEBEcJ7WngrYvlZ5oufjaQiu
         IlfdrOgcUG/n9B8ZUX80lJC6BgCMCMRRTha5dKWpLoAqs71ISLmMOmC+zCl7MHKZo/pY
         9hAViQ5ZWIUe9l5J7hMWhvxtnylsl9jQXvsNYScOtbgdD5ZTzpfK31IWpb9j4ha9VWXz
         E1DRmKMFtAdAwbW0g/vNbeR85eOQeZ86N7V6Bw5zA9Kvw5QPjcx+meGDV0V03O3dD//6
         JeSD3DSIZnmuwNPl5mz+nk8hpTJPDOWSAJ14zmOOXS4aPWWve0uoo7Xlc09i8hz84/jo
         6q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131391; x=1792736191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=oo/UalOFy5mlDNsU7u+zmSG87vmFrBc2MmRwtNvJySrH0vGmbeaiWt1sMGr9X97YGq
         IhkE5GnkpCc4dbnjO50nMgk5SLfx9dTCvHL5B7hZqCVPqZyY4z+rNCB2WIynHvCz6U3A
         qbRLCpiuKpwdUPJmB2WkNAwnPVgkBNRfbMiDQTT/aYp6VF6kYK6CJj5OYm/gD6qjE94d
         2XRdiMofM535+DOxW5aWpyUJvmH2amB/MFdJB03CVWeAbefme4mB9j2ljp4ChzkT1/8u
         N3AOZU0T7hclf/JODtUBKz3N2prfiuXcX5c22b1JVpub+xdOGcSIyPytWlGbYZ7Oo1gc
         gG3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzY3oIiMRlm44/wNoOMOr5QqfWaGBsHmqINvDR2nwrdDo+N4gEP4KQQzilHlZL1lwuUnd4fc//2/QeVBg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6g3BeMjGDiaeWU+K0+Kezc9j26DU2qWWebvhNr10/XkolclCF
	pkahqopEMZYssqOMLq5+8mTFGITgUT3oM4cFy7aEFem5ZODtaV4cucbD
X-Gm-Gg: AYBFou2lTGQOiHuqQ+++q5ooSYpxXBlYJyto4rmNk73Rlai7Zgvd64VK44gIAhI8FKA
	j2Vpx6XbaMQOGYV6DThaAegyLibwREbi5WLSqONilisvpGNENg1gh2WqLh2piKwDCSia6it+fnQ
	Tb/5Y+BhcmN3H7xsrKBFJL08Iry7A6z2MIRn8k7GCwQwFWrw2uqUfEVqq/sYnIimz/7xQt5+TiN
	dtz1EJlOam6R8H+ewbOMgF+WoJPqGlZ0LRDDHAIztaURajBczgVvVT6K057/LylW5bNiud2nhUq
	7xS7zjvcMCVei+gsaSMRP3L403rkiy92eVwk8bE0IzIXR3zDNjzBLb6q1yqEZuRMjtG7zu27S6M
	1YTqoM76UV1qj2Sfv6aNcfYclNq7ZtDTKoyXyucGh5NMOmTlOwUuwHDwvC2s/dCtWeg0W0yY15Z
	MZJRz8U5Rrwd96tbr5zYAV9IhgLek5p2pPeOyFVWDMDCVQIfhQGOFMxNkq8UEuRv5fflMGrcynr
	Z9rsU7jNwEk22ToU1epow==
X-Received: by 2002:a05:6a00:99b:b0:881:5dcb:400e with SMTP id d2e1a72fcca58-897c8991295mr20719510b3a.56.1792131390645;
        Thu, 15 Oct 2026 23:16:30 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:29 -0700 (PDT)
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
Subject: [RESEND PATCH v8 2/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Fri, 16 Oct 2026 14:15:43 +0800
Message-ID: <20261016061549.4181390-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071635_079668_72384FA7 
X-CRM114-Status: GOOD (  16.11  )
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
