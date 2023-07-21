Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67451EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyAm3j/XVn2MmMYnGtq3Bx34cjrN2a9sfUYWC3L8iVU=; b=EXFg8xP1AhUZTu
	Jk70BX1ZCDmN7P15Fab81YRZ2bfZ2e3K1hG55jKAb9j1liR/Ui5jEnjmKb+Cf/cAYEq+RBeRctFf/
	aYS9GKs1pPmmMdKJcJLlW2qqxzvDbJbkIbwlEQwRjizFPDSUDJ/BjDVHo8hXk2yR3wqfgpU5qy85B
	H8yRX7gdVdQoLY00n4VRfoW7FP5unUeQhV1F5LXHgK1EL7+mRmAHafFh6+I+rugHr96eYxBf+1Kye
	mv4wjO6xiF/gI6kMYgnszRPEcic9c2XN2cx7B4Sfhf5VU+ed8TdihwY5WQBUdIRhaA19g9DbMeD6B
	/sDq+zG1L+CosWS5dI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkxf-00DFqq-2k;
	Fri, 21 Jul 2023 07:54:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkxc-00DFoq-1Y
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:54:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbc54cab6fso13383015e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 00:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689926037; x=1690530837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTCLx/Z9PJYFq6Pk7xMLXjel9CDG1RIukbxZ6yTca28=;
        b=J/iWEZAAnGscNPHr9bcJKT6sQV3lA1cAElt66GYks+N721W2ngt1KUuDO/4JJOAol4
         hAsDPLzv+vfyE3Ii2Ed3lamxdG4pGqWBx5FEhGtvqefQ0fW0dxKEBDnuALpuQylRaT8i
         O9eIWEVC2kqcw53z/RL5ILtx1Gr35jSnwwPClrLWiKLHtAwEzGmi2ryH8IDkR8JiYns9
         8ao6NY1I+YhsFAe4ovw0uj4RnzVkaK6q99UjCCvsyfeVwXYryOKvCej8hN1xMVF/3laF
         bv/I3sh2MdvGY9jkTcVlvHm580DtNZjZe7HLLMQayAej8h0LH/8Yxq6RLN676OsIwEej
         clAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926037; x=1690530837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTCLx/Z9PJYFq6Pk7xMLXjel9CDG1RIukbxZ6yTca28=;
        b=ddlejQMFjTCkHR7zLCBBXgrvPeBQv8/XL6/bKCmmlcAuI0UbMsO0a8gFrGXPTjKP28
         MYaYySIjcYWi91Wnw2cXDxAM6n7YqOaNhl+uCe+2QWDJHdMoFOrZoqWOZW4qw1l/uNbz
         jdj4dGGvRgMSuUt6ruN4UWf1lFZogAzqBErcgAMuioGpvM1QpGNCrYO4RqWWvz5IpLRZ
         45gtj1OvU0hcwr8p8xE7cezl4PL1c4iOkSXI4g04EeUOEtgoIF79LT1cCJxR2iC8FEh8
         MmgVdLBfskU+WF/43lzVN6aDphFuMdRzmezglQqaC7Q7IzyauU7CIIS48meJTk64yWuY
         AtFA==
X-Gm-Message-State: ABy/qLY/5eOKMXCnl7RMHADH43+PiuEwGx4ZtxUNgi9iSv8XPFSJQQqP
	hnN2mn3QBJ/n7USJet1LhFpruQ==
X-Google-Smtp-Source: APBJJlFLnJTaXTTskNiyakPpL3YLbA+OfGjHB9N3lPuS4SI171RVD04EGAih2bgloP1Jhme0UbwDJA==
X-Received: by 2002:a1c:ed0f:0:b0:3fb:a506:5656 with SMTP id l15-20020a1ced0f000000b003fba5065656mr740023wmh.32.1689926036800;
        Fri, 21 Jul 2023 00:53:56 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n23-20020a7bc5d7000000b003fc06169abdsm2892519wmk.2.2023.07.21.00.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:53:56 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 5/5] riscv: libstub: Implement KASLR by using generic functions
Date: Fri, 21 Jul 2023 09:48:50 +0200
Message-Id: <20230721074850.310644-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230721074850.310644-1-alexghiti@rivosinc.com>
References: <20230721074850.310644-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_005400_515058_36771C65 
X-CRM114-Status: GOOD (  15.19  )
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

We can now use arm64 functions to handle the move of the kernel physical
mapping: if KASLR is enabled, we will try to get a random seed from the
firmware, if not possible, the kernel will be moved to a location that
suits its alignment constraints.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/efi.h              |  2 ++
 arch/riscv/kernel/image-vars.h            |  1 +
 drivers/firmware/efi/libstub/riscv-stub.c | 33 +++++++++++------------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
index 29e9a0d84b16..00b24ba55035 100644
--- a/arch/riscv/include/asm/efi.h
+++ b/arch/riscv/include/asm/efi.h
@@ -51,4 +51,6 @@ void efi_virtmap_unload(void);
 
 unsigned long stext_offset(void);
 
+void efi_icache_sync(unsigned long start, unsigned long end);
+
 #endif /* _ASM_EFI_H */
diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index 15616155008c..ea1a10355ce9 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -27,6 +27,7 @@ __efistub__start		= _start;
 __efistub__start_kernel		= _start_kernel;
 __efistub__end			= _end;
 __efistub__edata		= _edata;
+__efistub___init_text_end	= __init_text_end;
 __efistub_screen_info		= screen_info;
 
 #endif
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 145c9f0ba217..c96d6dcee86c 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -30,32 +30,29 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle)
 {
-	unsigned long kernel_size = 0;
-	unsigned long preferred_addr;
+	unsigned long kernel_size, kernel_codesize, kernel_memsize;
 	efi_status_t status;
 
 	kernel_size = _edata - _start;
+	kernel_codesize = __init_text_end - _start;
+	kernel_memsize = kernel_size + (_end - _edata);
 	*image_addr = (unsigned long)_start;
-	*image_size = kernel_size + (_end - _edata);
-
-	/*
-	 * RISC-V kernel maps PAGE_OFFSET virtual address to the same physical
-	 * address where kernel is booted. That's why kernel should boot from
-	 * as low as possible to avoid wastage of memory. Currently, dram_base
-	 * is occupied by the firmware. So the preferred address for kernel to
-	 * boot is next aligned address. If preferred address is not available,
-	 * relocate_kernel will fall back to efi_low_alloc_above to allocate
-	 * lowest possible memory region as long as the address and size meets
-	 * the alignment constraints.
-	 */
-	preferred_addr = EFI_KIMG_PREFERRED_ADDRESS;
-	status = efi_relocate_kernel(image_addr, kernel_size, *image_size,
-				     preferred_addr, efi_get_kimg_min_align(),
-				     0x0);
+	*image_size = kernel_memsize;
+	*reserve_size = *image_size;
 
+	status = efi_kaslr_relocate_kernel(image_addr,
+					   reserve_addr, reserve_size,
+					   kernel_size, kernel_codesize, kernel_memsize,
+					   efi_kaslr_get_phys_seed(image_handle));
 	if (status != EFI_SUCCESS) {
 		efi_err("Failed to relocate kernel\n");
 		*image_size = 0;
 	}
+
 	return status;
 }
+
+void efi_icache_sync(unsigned long start, unsigned long end)
+{
+	asm volatile ("fence.i" ::: "memory");
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
