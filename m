Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E560A2600
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yJk3p3CB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hb9Cl2l8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=CsYQDJhEEXPmCbrb7/vjkAIymkymxyzwxF6gPzHGFB8=; b=yJk3p3CBP/Oir2YMjeRszEzg9L
	vRLzkzv4/1qhyAwbzwwVJNWmcAd16/TrGx+4zYM15mZ2beuR/MonZIr4YloSHggOabb52j+gVar1U
	O/yjkGDFPM40yyNqCDVBsZfv1aPUPCnjzMGGASDrrG7MhTC5YTNz7idxbeLWV0p4nYjQnvFvlLxUI
	zd63kemG4Wf386jWloeQpoWPH7BvvPU1/v49oDR2jGGI+YGQvz733RDT0sIWtEVvyhU4gAVvL7jSo
	/V0OUzQmXAfhWV9vDrsJNdGiryA/Fz51qzED5E+Q5PE2lmwG+YyY7/1HrBlBuUG+IaP2MY3MM7YSm
	bF/j/KDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkng-00000003nQ5-3suk;
	Tue, 10 Nov 2026 12:18:08 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknR-00000003n4e-2Eu1
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:54 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48e0461e040so1563849f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 04:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313071; x=1794917871; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdvBqOsbdSb+5XW1VvJy1N+JD/q5Zf64Jcn34ls18MA=;
        b=hb9Cl2l8nKitptAnNWAZPQVOMreqElqYpOTZ3Q8Ab3GfhoeB5n3IWhB39X/ynl2Ib8
         S7TPLtrMohlNcj41oD2mrtcvsWWE2Lvo/p/W8wVeiHuQcm10M/6WkBrszJlTZGWqzksB
         ASBtXSu0ZB7ZZN/Hj7xsCNCTVjYDDNDomfYvC4bVPaxcOJA3y26Iq4KL16hCbVOVQHGS
         V8LfSxK+1fIXqo2YV6RKFfkbJJ5JoKsvt2WCQYcmPeZ9P4IDHgIW3ysCOm96Wuq6u16D
         y9mps/8SFbuJ2qZbn9QM4R+7m6M3AmOwKHLNcAsCovxfXHsJUzs6yV5Aa6W2LQpofwMA
         Jd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313071; x=1794917871;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdvBqOsbdSb+5XW1VvJy1N+JD/q5Zf64Jcn34ls18MA=;
        b=oQpOfc4rbNNnupb5v/Pdah3WNGC2PXAK803jkYEW+vORaq3fmK7iOA/CyZNEGuo54J
         GdR4K+hSBVuPunQo9IyflBP93UJ1ZYoumGgSwoii9A8nMxwebMb/WKd5WXHbtC3L27uP
         R0vXmWwOUcdUv/8P4MnXcCfXtlGdC/+Mnq5FIar3q5ew+mmgMGewWG7q7MQHwUpQ78dq
         3GX+7SMAkBXjlAji+Bxu+hIqzmpxk5XSgUvSXaytRGk9e1nmHUQ2DEAZQE6EhYlJhmCR
         1MBzv61KTyKGrNNe05c0QDi95RYuPPTappUTngzk3QpArUadKhWOgq0q3kUPOZKhJF2k
         7qvA==
X-Forwarded-Encrypted: i=1; AL+hErFmLe0rllxMe2kzC7cw7gAml3GTcTfH4Iy0GN9OqtkoedwhvhLYEVKYqeRZ0emLD3pvtqeSj7cEnKrSKQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/d+JMOaWbZeP9gVsXCt+x6YW7u1DyRpy8Lc7YPxhJV9ln737PM
	aIEQn0REHdAxkf91IybQstQe4a/LrPDzjXb4boTFYKjQ4vosnZjeLf0Mpht9RSXK1ljl9v14hA=
	=
X-Received: from wrso6.prod.google.com ([2002:a5d:4746:0:b0:497:913:6e4b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:468b:b0:48f:e879:5890
 with SMTP id ffacd0b85a97d-4982fc49566mr3226218f8f.32.1794313071241; Tue, 10
 Nov 2026 04:17:51 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:42 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-22-ardb+git@google.com>
Subject: [PATCH v2 10/10] efi/libstub: arm64: Drop zboot code_size hack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041753_604511_72878EC2 
X-CRM114-Status: GOOD (  12.32  )
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

Now that the code size can be obtained via the generic image_info
struct, there is no longer a need to inject it explicitly during the
build.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/Makefile               | 3 ---
 arch/arm64/kernel/image-vars.h         | 4 ----
 drivers/firmware/efi/libstub/arm64.c   | 4 +---
 drivers/firmware/efi/libstub/zboot.lds | 4 ----
 4 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index d42d07667822..509b59518818 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -51,7 +51,4 @@ EFI_ZBOOT_BFD_TARGET	:= elf64-littleaarch64
 EFI_ZBOOT_MACH_TYPE	:= ARM64
 EFI_ZBOOT_FORWARD_CFI	:= $(CONFIG_ARM64_BTI_KERNEL)
 
-EFI_ZBOOT_OBJCOPY_FLAGS	= --add-symbol zboot_code_size=0x$$( \
-				$(NM) vmlinux|grep _kernel_codesize|cut -d' ' -f1)
-
 include $(srctree)/drivers/firmware/efi/libstub/Makefile.zboot
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 9ab71d103f64..22b242a7a21b 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -144,10 +144,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
 
 #endif /* CONFIG_KVM */
 
-#ifdef CONFIG_EFI_ZBOOT
-_kernel_codesize = ABSOLUTE(__inittext_end - _text);
-#endif
-
 /*
  * LLD will occasionally error out with a '__init_end does not converge' error
  * if INIT_IDMAP_DIR_SIZE is defined in terms of _end, as this results in a
diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index fdd48ba0f9f1..4399b23fa237 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -88,8 +88,6 @@ efi_status_t check_platform_features(void)
 #define DCTYPE	"cvau"
 #endif
 
-u32 __weak code_size;
-
 void efi_cache_sync_image(unsigned long image_base,
 			  unsigned long alloc_size)
 {
@@ -100,7 +98,7 @@ void efi_cache_sync_image(unsigned long image_base,
 	/* only perform the cache maintenance if needed for I/D coherency */
 	if (!(ctr & BIT(CTR_EL0_IDC_SHIFT))) {
 		unsigned long base = image_base;
-		unsigned long size = code_size;
+		unsigned long size = alloc_size;
 
 		do {
 			asm("dc " DCTYPE ", %0" :: "r"(base));
diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
index e1365907f805..e0f0bf005854 100644
--- a/drivers/firmware/efi/libstub/zboot.lds
+++ b/drivers/firmware/efi/libstub/zboot.lds
@@ -2,8 +2,6 @@
 
 ENTRY(__efistub_efi_zboot_header);
 
-PROVIDE(zboot_code_size = ABSOLUTE(0));
-
 SECTIONS
 {
 	.head : ALIGN(4096) {
@@ -22,8 +20,6 @@ SECTIONS
 		*(.rodata* .init.rodata* .srodata*)
 
 		. = ALIGN(4);
-		__efistub_code_size = .;
-		LONG(zboot_code_size);
 		__efistub_efistub_image_info_offset = .;
 		LONG(efistub_image_info_offset);
 
-- 
2.56.0.542.g3ef89b7020-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
