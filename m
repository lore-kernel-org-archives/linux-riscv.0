Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195D760A2619
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZztuloNL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pnCyCc8W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=iT2DvrKqUnP2HXvo9Exa5nb8SjUPH6ZQ6+qefmnv88E=; b=ZztuloNLi5tjR2ScqJrgWFu6nF
	jjdFarviiJSf8qSt3p2eujcuXdAbLZv60zUyLs0OGI9KPCI5SKFpr0nYx/K4QMx7yiWxp127KxGRG
	FAfPB/EHOs55vOo7fUWXKIZuySk5s/MOFLgisoRDtS17IP+oPh1T4F2+zqI2nCNAdAtvMGn5It9JF
	+m70rYBOdufCmQIytUOusuCCtkU81COJ6PwOkCCtdO+YsP+9oF+P5+oyJf+rYcM4pg3R0k2wZZHd+
	JGoUmtYEbZGDWF3f/K5yeDAoypuQQLO3t9A66Qs7D8VhqTRXW+kxwYBNYU6prJdL5t2W5gHpntpwP
	3jpEbQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkK1-00000009vqN-1OfA;
	Wed, 18 Nov 2026 18:23:53 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIU-00000009tch-3rZO
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:22 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso10966425e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026136; x=1795630936; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sF7COacRN1vGXnrZrNazsi2/3EiiL8z1PsIPlc+wKk=;
        b=pnCyCc8WD4kyWAvGIF635TuTsv9bzmY7RCnKAhukhb2Xm47v6PC1xqdxOzocC9AaHT
         bU6L8ngBxJPSAnuqhsocA7p9uYLbPTp6e8HN1ey9FEedUlaDQRNDOxeZuMVDRPBbwBP/
         3WsntMAQHVoavoRivO83pZ56wiK70qnfb8RlYG44SsdUuM9uHCrDINmwIX+VZGUV1Y3v
         J6VKZDwOcY9oQfpSv876QpGFIbJ44EUTDI2rHjIWuty7MqClqk0f1n+balJDNI1VpOLW
         u4Slwc6xQR4RlylVUgCUqyhtX6IniLAhXoHHRgfFmmWUuFtX6K+xLvOHPWnX1ODeK4Cy
         sJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026136; x=1795630936;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sF7COacRN1vGXnrZrNazsi2/3EiiL8z1PsIPlc+wKk=;
        b=fAj2BJb1NPlVgF1VCx7mBbsyMwH7/xm7gLonZnWhm7oGerlimng5eyiST4nRHH68Zm
         ibUb4+XPeYI0coLT70mJ+/xfAthvbXdxlHISFxpGM0ZQ2uqiFAR9KZD47isRdz2XYp0S
         lHYWqnTgivijyzHVyvZkefTrn8VRN1l3BiJCJK+zKKhTEkluq7q2D4DHTtCWc/awzNoP
         Jy+M/8rI/siLD/nSA9gUjFp10QcfBL8/6YZ450BZCYNylkOHsVO9Re/TVULjbLUaTep4
         k7O7pASB2HKAwYu5LNADXuhGX1ayAsTQ9W1qe9Pbm12xA+hJu3fDhtJgW3kdxqwEHkT0
         eY+w==
X-Forwarded-Encrypted: i=1; AL+hErENnsCO3mJELqASzLHsPbgVg8IeFFczSdjqTmAkbQIfddKmQmKXPAFBLX9yOqTNKnhRl2e5RBNDzoiZMw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9rfCKYRf81OXSGICNUOoMCIRc66vDbq3Fmi7Hz+ObEOziQYJuY
	kdRsa7y/fQzFzWRjjS0VcFwnpWHjktfTc5NjTdLxRxd0kDE2a3QFp2LN8qJUR05RHYcqvBMK3w=
	=
X-Received: from wmxt15-n1.prod.google.com ([2002:a05:600d:864f:10b0:4bb:609a:3944])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3555:b0:4a2:150f:1601
 with SMTP id 5b1f17b1804b1-4bb7da2be68mr70517655e9.12.1795026136002; Wed, 18
 Nov 2026 10:22:16 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:23 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2989; i=ardb@kernel.org;
 h=from:subject; bh=mMy4EOR4GKL669ZECvINo54lmzHNhYmaQBvXpm8/VGc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm1UmrxnyoqPFFE209K4fZTWeG7MtSqmC6ROf9YfZl
 Xe15KQ6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETm9jAyzGPUu7r22ayNLf+V
 bb67davLvrqTphuU2Hpe0f73hFcrQxn+iosLFkU+ZtZgvOfNbiglFLlGbcbVis8FQhy1+U/E05d wAQA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-38-ardb+git@google.com>
Subject: [PATCH v4 17/19] efi/libstub: arm64: Drop zboot code_size hack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102219_009571_2D33629C 
X-CRM114-Status: GOOD (  11.58  )
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
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
