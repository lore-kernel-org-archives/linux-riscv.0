Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2D9606A32C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0GbOnCKG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=drlO8TSW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=azcLLK3Y67ebO5NvAWCDikkrMVxEYQbtRm0KZruM2xQ=; b=0GbOnCKGj/7xm1IRklOneJWIsk
	tYBXitO6KNCdaj+Q1uoI0bgAv3WdR82VTDFbOvJbYVC9cfQQmJ7YOtWoNBR9u9/XaZyht69awLGdM
	soT0s7XLxpFXUdxrn3iTptXalsR21TDUbIaaNENg0dNGUsnugzkmIfWeRgZIcuMGn8EwkWf++6H06
	dtgXvv4kEgRDg8RzrrIX3/9EphqHjJVc30zvIJYChwDy0zcAzkZstP0yU8e4uzna06FcR9QEcL6ek
	ckgm8ssFnran5knpB+xh1fPwThBykOtIf6eGSk9BW7rYLNvtQ7dD2PKesMRapxPt1hj7NHGcr2F0+
	4gn/Pxig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxh8-00000002qzW-3RL6;
	Mon, 16 Nov 2026 14:28:30 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxgB-00000002pVc-0htp
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:33 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-4916bd6e3baso2744484f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 06:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839249; x=1795444049; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7Sgz3ld+ZNxi0hBngHAfrUu3ksDDoe/zQYxMmRp/T4=;
        b=drlO8TSWNGNNW365KXQ6VnZJRy+uSOgIcMFzycd9AUzHPQ9V7TrnvQsJp25nx2PTpA
         1N8EMLXOxJEceZX2esqtrUv+2N/a8YlPO/jmg3DYA0osLbCQdyi+mq1sXKHZbTxql2r+
         jUscptx4ajyI0F99R5ZC4wLxIJoE6zujcTMvkEVmgTnucesxWhvjGnt/0befLSR8WyDW
         U8azSEstNOdxT1Z2q00bNpW3uNPTRRYog6xeOkaOSSzC1Bsvn7fljvZt4QSXv8tkwQvs
         WUQlaelW4vKpa09uG578TmTyQwWS43bsvaBIa00dSQUnlj1pc3euUWyZPBsYjqLkV/7U
         WH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839249; x=1795444049;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7Sgz3ld+ZNxi0hBngHAfrUu3ksDDoe/zQYxMmRp/T4=;
        b=YzAgVQI2PByiS3eNITWO9SJXT7tsN2aKXyp5JdcTudvbktEwEovYEIwmcwP7wQmE1S
         DGwzXZ832SM2WspvE9XAbPEXXQh4RtqfM4BAezRen4HEHfJSlMJ1vOEvfIXU4yuazLZd
         5jHnwpMabJAnmnFIzUV+fA8zP76K7iw6hyTPS6osLfhA7D89+luei9+Ow83q7gBb+16w
         6wDFsrKLahCbEN7Koj9AfP6S++8Ax8nYGlZLUIAkVP1WL9TtL1LCU2878bNxNyMOq3pN
         qyKXo4cEoAJPcJPfePMOQ8Yb9VHFVtW7wXMJWCwCPiS09b/Mk85jQnIes6aFcowm2mmO
         96pw==
X-Forwarded-Encrypted: i=1; AL+hErH4hn5bNv0NC2Mt6qu3RAxBjnEmgZWrH2n1kBCPtFCEa0zu4SULn5zZZKQZ8MfBfQ/rT+lHx7riuJCC3w==@lists.infradead.org
X-Gm-Message-State: APuU4Z9IFlu6uT5W8h1yw7IfqmTb16mFE6/VDioaBMGHksPfNWkObFR0
	f0X8HAL/d4tGvuLuyB184wlTPV94HoBM1e34r1qk/Gv8OyzUGA5Sf8lRePzXXZtBPs2R2Jbpeg=
	=
X-Received: from wrve6.prod.google.com ([2002:a5d:5306:0:b0:49e:f4c:b427])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1863:b0:48d:ee35:b3fe
 with SMTP id ffacd0b85a97d-49c6d45308fmr26905295f8f.8.1794839248438; Mon, 16
 Nov 2026 06:27:28 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:32 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2989; i=ardb@kernel.org;
 h=from:subject; bh=4MxOZY/YO/IfVCPcb3Gx/rGT/ia9EZpFm+NWrw0PtxI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30NxgLubf0xQ07M/eeqe3zGcCp+jmF29ORL2NFuXwt
 i/67svfUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbybR4jw/nQ2UEqc643yObG
 rA9QLvcJyRBNPt8bxfdWLcddfyXPZUaGNfL7Zygavslr9X+589e/CNN5vJ9VM3sTb22bPiPb6k0 RNwA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-30-ardb+git@google.com>
Subject: [PATCH v3 13/15] efi/libstub: arm64: Drop zboot code_size hack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062731_306830_9C68C2EE 
X-CRM114-Status: GOOD (  11.78  )
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
index 329d5e214b36..ca634cedcf63 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -140,10 +140,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
 
 #endif /* CONFIG_KVM */
 
-#ifdef CONFIG_EFI_ZBOOT
-_kernel_codesize = ABSOLUTE(__inittext_end - _text);
-#endif
-
 /*
  * LLD will occasionally error out with a '__init_end does not converge' error
  * if INIT_IDMAP_DIR_SIZE is defined in terms of _end, as this results in a
diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index f8bb890b9631..8a051412814d 100644
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
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
