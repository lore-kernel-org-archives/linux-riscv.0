Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F45EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRa15z5P4zVsQgO7dWjQB2ajlm2IKz8xppdMMV6Ma7c=; b=yOybjN39dmv3vh
	Pv6k/N2vq63eoahzesvBR2mQhEy22D3VosKFh74GZFCuGVGhKtuRnHLmfSe5mvUj0xgq/mIBqICxM
	3H/rZYvCAaRfE4GPnxKXsLZ57M/L3C9c6UQbkELxw8sSdZwaMNMoOlo3INHF7tdobZZdgQe68M4IP
	RZ3GgEqSRKx/bBs+mOnQTqOxoXlNP9iZo6DDrLryKTWcsA8ZOZcb0Zo7YwFnGquX0bQaOatx8Nri6
	INOhbK+JV4K8LaxBJyCzU6REh+QBxkWN/Jj5ntJNIGxEcneIIt/A+e+/uuJCdAa13lG8QVXv854ya
	juxCrpgIEOtaSkIFiSFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNBxv-00GicD-0l;
	Sat, 22 Jul 2023 12:44:07 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNBxs-00GiZv-1V
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 12:44:06 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fd18b1d924so22374055e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 05:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690029842; x=1690634642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeCObNb4PmolJTFe26id2IecwNBs81NuN62SQUhE5h0=;
        b=pUM+520vb2S92A6ynS7MBf+a+TvlSycieG6x/eLAxB9vkNf2NAAk3hKz2lVbEhN6Km
         9D+OpTxN358e0ePT4GlQNjD4y8JMqJED6JHYZ1vhglRCGL+/9vv8wgBa/4HC0Fg3s8wl
         rq+o2tb+8mmawwLyIZAoIgVi0mtbElZCDvcWyHCsAUhpD8yih7TyKqRWkFD9vcKvJ5l5
         To5s+Yl8KRng8QyCvHUYBfFXpVY39ST6SArgtFX6PcsvC0376cKqK/E6lDNOuZdou2k4
         ZmWsNfaeoEOrbmUCy2hQGQ6pkeaaasNFlU+Xmn7w+FgnOZcFNhGwUveLYe1tubOKHwSl
         xSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690029842; x=1690634642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeCObNb4PmolJTFe26id2IecwNBs81NuN62SQUhE5h0=;
        b=ihM7h79bjeV2d/gYbTRRQcQyLyGYY4ZQjR4k7nDhX2L9MHIzb/eE698x5im4CIZsZP
         UrvXuRgVIp8F98YzHm/VwXSgZxHgc+ViFSojqgDJGxC8KNgW2eGHhCyVTKOPNq+OOzIQ
         fM0dYSaROMPLxjo8Lqk0cTsw2pYqwhNuhqmVyMxPsbEHQbHZa9doenxXr/3OKvqj54Ri
         //5b0LoousdaU9GxCDY9LT7qPTh/mUxS/qSch6rngHMGlgVLkay2IfNaprivZkbW0LpZ
         XM5JSKJnpYv/aMuXWFjRnPr+vifpbwS2nyKIwAKLl6gYjzRaijipunihVS+T5RPnTFLI
         Krhw==
X-Gm-Message-State: ABy/qLZN0TBVsYW1tp8xRWZY7LtHcyXeBvxLjXoeUU0vz/FEjk+LYVTD
	7O30DoT5osTVGtHbcmng13nnIQ==
X-Google-Smtp-Source: APBJJlESOn48Uam2uBAko67ZqktvYU2AYN1QmwgL/HAND5SbQf6wVpva7H1fOV9++dlkWv6Q6TZ77g==
X-Received: by 2002:a05:600c:21cf:b0:3fc:e00:5275 with SMTP id x15-20020a05600c21cf00b003fc0e005275mr2809721wmj.2.1690029841797;
        Sat, 22 Jul 2023 05:44:01 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n11-20020a7bcbcb000000b003fba92fad35sm7985875wmi.26.2023.07.22.05.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 05:44:01 -0700 (PDT)
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
Subject: [PATCH v6 5/5] riscv: libstub: Implement KASLR by using generic functions
Date: Sat, 22 Jul 2023 14:38:50 +0200
Message-Id: <20230722123850.634544-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230722123850.634544-1-alexghiti@rivosinc.com>
References: <20230722123850.634544-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_054404_503472_7BA94AC4 
X-CRM114-Status: GOOD (  15.40  )
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
 drivers/firmware/efi/libstub/Makefile     |  2 +-
 drivers/firmware/efi/libstub/riscv-stub.c | 33 +++++++++++------------
 4 files changed, 19 insertions(+), 19 deletions(-)

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
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 11aba8a041ec..dc90a31b189f 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -88,7 +88,7 @@ lib-$(CONFIG_EFI_GENERIC_STUB)	+= efi-stub.o string.o intrinsics.o systable.o \
 lib-$(CONFIG_ARM)		+= arm32-stub.o
 lib-$(CONFIG_ARM64)		+= kaslr.o arm64.o arm64-stub.o smbios.o
 lib-$(CONFIG_X86)		+= x86-stub.o
-lib-$(CONFIG_RISCV)		+= riscv.o riscv-stub.o
+lib-$(CONFIG_RISCV)		+= kaslr.o riscv.o riscv-stub.o
 lib-$(CONFIG_LOONGARCH)		+= loongarch.o loongarch-stub.o
 
 CFLAGS_arm32-stub.o		:= -DTEXT_OFFSET=$(TEXT_OFFSET)
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
