Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABFF60A2628
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4dlEYhDi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PZezFk4q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=KIpo1hEDgfAO8GSS1BvKSDD6zkv3KCvuQK/r+lVnBtI=; b=4dlEYhDiK4e3uavWEJQ/DAcu15
	jTAh1CsrqL+aC2nBD2ZFoqWtRkR2luMjSRbRQJjcOLr2SMP0hhWm9lrkXKMhpfn8GVT0rvpzIgAAl
	bB6tkO4pvTZ8O8YZxPuwg+EuG+O6dcj/o3IbpmR6o5FaL8XBUvBc9YFVnho5rI2rAEcw9RX3LXKek
	Q4oDX8skwohfQUd2diQ3UUSQ4Jez3VcwVZoftgtVdHeGQSEIkFhNKczYWj4G3d6kboSmrjMpn/jyN
	i4Pd0+f9pAsliflOUh5JGQdJkAU19KRDRUxjMhO56QcCKRhyaExeuSUSXT0Hd5vyqqznWrlT34D+L
	os/PK3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIr-00000009u1M-04x0;
	Wed, 18 Nov 2026 18:22:41 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkID-00000009tHN-3HsI
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:03 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c508bafaddfso42800766b.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026118; x=1795630918; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1Jz1/QbPHolNpw7hViozPe0OhTh9e6urlvNZ1PN/CE=;
        b=PZezFk4qkCEl8vHTw3iLAp5ThZCDujz86YCTAgcba66vRHDZrzoX6ZNpuNEuNsLMFw
         bUYosDC6Peqw77jJCt9WDN+gBtnILXPlFoh51q3+g34quGjq8bOPuLlihcg+WKJetzZx
         BGjIssFtIamljQlkUqOwQNDStybO29ExgNuSRRoZFGCmqzAL/rbLdsmP5Y4GMq1UY2IC
         C+L1W7Gho55FV6445PRFBhG9qu+mFfQCYr+E5Vli1k9G1IcHCgMfLociLMqpXwDd/Y+s
         LgDrTMLjlJQAmFFO6LtiAoH+oB26/P4DajBYTTOeX0SWhlIZbEdjaGnrpaKtMQv+fW9n
         mp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026118; x=1795630918;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1Jz1/QbPHolNpw7hViozPe0OhTh9e6urlvNZ1PN/CE=;
        b=BHawWYGyNXb5pxdRFCkrYVryVDS4fNizMWjtU54Rebx5kyalwOZ7DgFbLWeojdYbBX
         U2h7WwlkzDNQ0TVCKZJja+50js93qf+mQjhLJqXKRYztjANYsYaSU8GB1xKsYdLco5nf
         n0p9ethXUKAk/N8RoAnmwUbYT5tPtxYSVN0hzhcVI0RuqCZgSFNr8BLyHIf8rgyLVJLu
         trDh9PJr90HDU+9rIjE6SeusNXxm3umZ20K4vjwhRwz1h65qjvOph3sINApIkUrFdeIn
         n9XU5U0CEmhuvFc9duQaI6/Gg9R8Sknasz5tPqthhKur1y/AQdFbS6DyBf+F8ayfuAKs
         avNQ==
X-Forwarded-Encrypted: i=1; AL+hErGZ5JB3QBbtQyEju/jj4Lq+/TcVNn1sxXqH0u3HqHdKql1KXFiznVo6jMLAGhAoSN+HBOjkYG5QqR0KYQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+ayeWYd8Ct61yZK7ygXsr7RRjODrjJq8Z+xt24JSmnI9+ndDRb
	2lTUTVZjjE++r6vJxl5A+1sfhfyC6csz4y4H1OdLbBL9J6Y5xYJ+QyE0oPCBmHs4EvlLxUpMZg=
	=
X-Received: from ejbjo16.prod.google.com ([2002:a17:906:f6d0:b0:c4d:2462:39ce])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7f94:b0:c41:4d5:e97c
 with SMTP id a640c23a62f3a-c510e361646mr311603866b.37.1795026118221; Wed, 18
 Nov 2026 10:21:58 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:13 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6557; i=ardb@kernel.org;
 h=from:subject; bh=UpOlRDfxgKbTpCknhkTVYs14c9RoP6u0s/Oh13lIEDY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvmzm2ncdETfvsKw8rxd7+8/mufGDvsrVFrJMOrXz+Z
 dMcgdOLOkpZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEFi5hZNibunG1wdlpO5qu
 r1/meKdsX//eQud1DGdlLrUy3SjRe+jHyDDXbGe7/YmN0aueTz2kd0pxy6GZ7tL56YaJBrPObFj oLsUOAA==
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-28-ardb+git@google.com>
Subject: [PATCH v4 07/19] efi/libstub: Avoid reserve_addr/_size in efi_kaslr_relocate_kernel()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102201_934210_2AAC4411 
X-CRM114-Status: GOOD (  17.97  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Avoid reserve_addr and reserve_size to carry the information about the
allocated space for the relocated kernel, and instead, use a single
alloc_size output parameter that is wired to image_size.

While at it, don't use the alloc_size as an in/out parameter, but only
use it to return the allocated size (and leave it as 0x0 if the image
is going to execute in place)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64-stub.c |  3 +-
 drivers/firmware/efi/libstub/efistub.h    |  3 +-
 drivers/firmware/efi/libstub/kaslr.c      | 30 +++++++++-----------
 drivers/firmware/efi/libstub/riscv-stub.c |  4 +--
 4 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index 2c3869356147..fe0deae78e5b 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -35,10 +35,9 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	kernel_size = _edata - _text;
 	kernel_codesize = __inittext_end - _text;
 	kernel_memsize = kernel_size + (_end - _edata);
-	*reserve_size = kernel_memsize;
 	*image_addr = (unsigned long)_text;
 
-	return efi_kaslr_relocate_kernel(image_addr, reserve_addr, reserve_size,
+	return efi_kaslr_relocate_kernel(image_addr, image_size,
 					 kernel_size, kernel_codesize, kernel_memsize,
 					 efi_kaslr_get_phys_seed(image_handle));
 }
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index f5eec8c12894..5c10815d9172 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1244,8 +1244,7 @@ const u8 *__efi_get_smbios_string(const struct efi_smbios_record *record,
 void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 		     unsigned long code_size);
 efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
-				       unsigned long *reserve_addr,
-				       unsigned long *reserve_size,
+				       unsigned long *alloc_size,
 				       unsigned long kernel_size,
 				       unsigned long kernel_codesize,
 				       unsigned long kernel_memsize,
diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
index b34e4599f0f6..49b05d0c0003 100644
--- a/drivers/firmware/efi/libstub/kaslr.c
+++ b/drivers/firmware/efi/libstub/kaslr.c
@@ -82,9 +82,8 @@ static bool check_image_region(u64 base, u64 size)
 
 /**
  * efi_kaslr_relocate_kernel() - Relocate the kernel (random if KASLR enabled)
- * @image_addr:		Pointer to the current kernel location
- * @reserve_addr:	Pointer to the relocated kernel location
- * @reserve_size:	Size of the relocated kernel
+ * @image_addr:		Pointer to variable carrying the image base address
+ * @alloc_size:		Pointer to variable carrying the allocated size
  * @kernel_size:	Size of the text + data
  * @kernel_codesize:	Size of the text
  * @kernel_memsize:	Size of the text + data + bss
@@ -97,13 +96,13 @@ static bool check_image_region(u64 base, u64 size)
  * Return:	status code, EFI_SUCCESS if relocation is successful
  */
 efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
-				       unsigned long *reserve_addr,
-				       unsigned long *reserve_size,
+				       unsigned long *alloc_size,
 				       unsigned long kernel_size,
 				       unsigned long kernel_codesize,
 				       unsigned long kernel_memsize,
 				       u32 phys_seed)
 {
+	unsigned long kernel_base = *image_addr;
 	efi_status_t status;
 	u64 min_kimg_align = efi_get_kimg_min_align();
 
@@ -112,8 +111,8 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 		 * If KASLR is enabled, and we have some randomness available,
 		 * locate the kernel at a randomized offset in physical memory.
 		 */
-		status = efi_random_alloc(*reserve_size, min_kimg_align,
-					  reserve_addr, phys_seed,
+		status = efi_random_alloc(kernel_memsize, min_kimg_align,
+					  image_addr, phys_seed,
 					  EFI_LOADER_CODE, 0, EFI_ALLOC_LIMIT);
 		if (status != EFI_SUCCESS)
 			efi_warn("efi_random_alloc() failed: 0x%lx\n", status);
@@ -122,33 +121,32 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 	}
 
 	if (status != EFI_SUCCESS) {
-		if (!check_image_region(*image_addr, kernel_memsize)) {
+		if (!check_image_region(kernel_base, kernel_memsize)) {
 			efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
-		} else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
-			   (*image_addr + kernel_memsize) < EFI_ALLOC_LIMIT) {
+		} else if (IS_ALIGNED(kernel_base, min_kimg_align) &&
+			   (kernel_base + kernel_memsize) < EFI_ALLOC_LIMIT) {
 			/*
 			 * Just execute from wherever we were loaded by the
 			 * UEFI PE/COFF loader if the placement is suitable.
 			 */
-			*reserve_size = 0;
 			return EFI_SUCCESS;
 		}
 
-		status = efi_allocate_pages_aligned(*reserve_size, reserve_addr,
+		status = efi_allocate_pages_aligned(kernel_memsize, image_addr,
 						    ULONG_MAX, min_kimg_align,
 						    EFI_LOADER_CODE);
 
 		if (status != EFI_SUCCESS) {
 			efi_err("Failed to relocate kernel\n");
-			*reserve_size = 0;
 			return status;
 		}
 	}
 
-	memcpy((void *)*reserve_addr, (void *)*image_addr, kernel_size);
-	*image_addr = *reserve_addr;
+	memcpy((void *)*image_addr, (void *)kernel_base, kernel_size);
+	*alloc_size = kernel_memsize;
+
 	efi_icache_sync(*image_addr, *image_addr + kernel_codesize);
-	efi_remap_image(*image_addr, *reserve_size, kernel_codesize);
+	efi_remap_image(*image_addr, kernel_memsize, kernel_codesize);
 
 	return status;
 }
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 5cbc50a814e1..d0fc04d21b56 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -37,10 +37,8 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	kernel_codesize = __inittext_end - _start;
 	kernel_memsize = kernel_size + (_end - _edata);
 	*image_addr = (unsigned long)_start;
-	*reserve_size = kernel_memsize;
 
-	status = efi_kaslr_relocate_kernel(image_addr,
-					   reserve_addr, reserve_size,
+	status = efi_kaslr_relocate_kernel(image_addr, image_size,
 					   kernel_size, kernel_codesize, kernel_memsize,
 					   efi_kaslr_get_phys_seed(image_handle));
 	if (status != EFI_SUCCESS)
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
