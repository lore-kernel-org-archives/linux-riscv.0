Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4274FC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 15:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uFI1bcrdacKdFLIrFNVmOmt6pHk63YxHXUCEx5zGpxk=; b=WBC3L5BnifWDsZ
	RM35qzHd9c5cKfpRyVXwPYls/7Ym46kaCjaOC01320ofbonhun0Get3EvoFQF0LRUgA85WAUJ+PPb
	xc0me0ry6k6xfqypZfl5W3YQm29Osd/u66cg1UoIgrlw9eh+5H0IwtNwuotXZjtqAw0xMeM/Fmilp
	WY2J3beil2oq1vyCnqkSrgPTX1JVcT3Y6trMcT8UrIG+7DQ0JN9Yzx2VTVP+ydg375SkhEND+llhj
	kk3Q2BbAV/JxkVfrMpt4NtgOBaLaRDai/okcRHWMUpjW98lAxbsDRlFWFmendWvmEs0J3TjBuIVxM
	RNBS9P1+AOgIecTMaSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJy0G-003her-2k;
	Thu, 13 Jul 2023 15:13:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJy0D-003hda-0V
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 15:13:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-314319c0d3eso871316f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 08:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689261188; x=1691853188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLw9kTvaEkAjy+qjwvRpscnMKlwPFJS0kuzz8CxiZVE=;
        b=gmqrfMFLOBX25S3+JUn/UZ07X4KBYapInPrcBiBweYAsrSJp787PLElVaURtOVqked
         xXaN4wQIr9V1r5Hq+V/ONFLo6QZ5lBYJw+F+sR96caaiPXAlMwopiAY4+CZEb3Aw2Gjo
         OQcl2JHm5ow8OTDTNrM0cTUVZSVCAbLqdrZO8/EHwUQtonSa0wMPv+VcTZJ1WuyaF8Lz
         uCyrQeG4b2F04KtbUNt8Tjg+aKQBtyMooZqFFtJs++Dji0NROoIG27/O9gggaOXssvlD
         xiO8UnfX1ebjVdaXxWVM3Hk/ajBO0+Ucl+9Qo4BCAaFmeO9xGdeCIHGJoVXl8uhNfcwn
         AAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689261188; x=1691853188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLw9kTvaEkAjy+qjwvRpscnMKlwPFJS0kuzz8CxiZVE=;
        b=JRlEsj3nW5Yq9TYRV+VVdbB/7avhkFKasNu2GSwf04SibKjvGtopmxpcco/DHembcl
         Y990JO6W4U9OAnNHh0hvrN5U3eUUJPtiPz2soAP3DYyRKaSHRnaRbn0+eR3qbUNHJax1
         FBh2EMYYOu0tojPRoKa11AwqEMlmrhqnmd5pXzFL+Af2OB/aFbvKAv+CTcAbe2gp7y1o
         1h7LhxxZXfhHsgG90W/OP2CoERWEsD7cheRkcQk15HdvCbvsSRw4B2ON8LxZoXrJaF7N
         v11xbGnzyiqHPsMulQI+EMKHZb95apgQVjk5d3OCcgM6fAOkIh65lJN/ZxN6Fx0Z4iA7
         erdA==
X-Gm-Message-State: ABy/qLaTwaL0Hi6bBkgwEKWygkCSvwnYsjtS+nfTjFuNTGoDcOjxdT4E
	b1TGWgNV1BblzQNfNRpS9kxykw==
X-Google-Smtp-Source: APBJJlGs36PgSwm46u3XZJ4EUOUmqIiNs5C73pLmPTFSWMqj0iA0kL/WuS2IjEk/CnWvfdtlsVEuBA==
X-Received: by 2002:adf:ef07:0:b0:313:ee4b:b58f with SMTP id e7-20020adfef07000000b00313ee4bb58fmr1967432wro.31.1689261187786;
        Thu, 13 Jul 2023 08:13:07 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p7-20020a5d6387000000b003143801f8d8sm8236839wru.103.2023.07.13.08.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:13:07 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RESEND v4 5/5] riscv: libstub: Implement KASLR by using generic functions
Date: Thu, 13 Jul 2023 17:08:00 +0200
Message-Id: <20230713150800.120821-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713150800.120821-1-alexghiti@rivosinc.com>
References: <20230713150800.120821-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_081309_192099_03D37D66 
X-CRM114-Status: GOOD (  14.93  )
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
 arch/riscv/include/asm/efi.h              |  3 +++
 arch/riscv/kernel/image-vars.h            |  1 +
 drivers/firmware/efi/libstub/riscv-stub.c | 33 +++++++++++------------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
index c3dafaab36a2..6f99e8812dfd 100644
--- a/arch/riscv/include/asm/efi.h
+++ b/arch/riscv/include/asm/efi.h
@@ -52,4 +52,7 @@ void efi_virtmap_unload(void);
 
 unsigned long stext_offset(void);
 
+void efi_icache_sync(unsigned long start, unsigned long end);
+#define efi_icache_sync	efi_icache_sync
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
