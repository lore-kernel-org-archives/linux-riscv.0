Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1594E606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 12:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hNkHegtz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZS64S/4J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=H8CqtTf3wnYHTcZxFOw8s/3qTodmjwtjbMnrn6/zpEM=; b=hNkHegtzLRG4Tmv1cNPzomAnpC
	6Ng8RmQBeVYUCvyODk7LUNDPky6OxFf6VQrcCLNeFHKcpzQZxwM5f3+/JaUhy9nIcM/ctu25knKs8
	xaeS4594AnBA91o+L396OJPL6hVK9iZhvt7zEiEDaUVrfkqpXfJCcWX0+ymY+q1+77IyUGbTb6wgt
	IlCpaQk4UVeuppoY4n27K18V8WAsmMOxHKcWBcwGx4nYke8UXyct+0NPhez3GyA1EwP+Wj/VpDOie
	98wkhWHp4RGqkMKS2mfH8fzgGZxzHPWVwxMnD0OfNLa+3NTG2rnufIAjceQcVlnzc717LbJtUN6qd
	ykT4XAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknc-00000003nHh-3gwf;
	Tue, 10 Nov 2026 12:18:04 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknL-00000003mwv-08ky
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:48 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so1864224f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 04:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313065; x=1794917865; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3QC/0gK2OClsDHJrI+qx7+T7UXE2mSOvFr6ntlSSRU=;
        b=ZS64S/4J/YC3XYAe18cQRSOcnkwjlcrhJQPFygbScwq/v0grBfBoeZhE28nwU2TFuf
         4RLOa6FAxC0xQbFdrOLlqbhS11lhgRnWPSqeyrK4NZyfYwnHhmyW4/majYdCyuVBvnGR
         hs24NCecF5tfHe1pTNr3gUpycLLEr9KA/qvluG8GD7xKDzyHccF3LPWvr6aEmKWd7zIc
         gq4RGnnztFqAfBofLFUXdYZ0V0Hj15BWGMjUCMc+K1hhAb9TZGRjBhGfshBmXRUnRvXx
         Q+rXQMWG/tMoC4S3tSLTBA2/kRVbp7s29fM5nIL81Vi0gpQWu6saH4BxUtTLNBjAnOu+
         w1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313065; x=1794917865;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3QC/0gK2OClsDHJrI+qx7+T7UXE2mSOvFr6ntlSSRU=;
        b=mnET84lMh92UMcrHcsxutdNlJtiVtU72L5bZBr4Eh+BHclht+dIIprduwlGSgntNHX
         +cRyIK140M6BNXYeDwXh608PPCf/QyYjWdMqf3Oub2eC9lqighrNJx5VtNis/b7/gKoy
         ka6ALZ2KNxzyRFZhR5flMILo/YLnwudfdH/L8LKuv+0GOGso+1zEkXBLNc20iz4luN3Z
         a6bRfuMu7TOF2FvsDNSKjtOghW7W855dlfKlhnRnlrZZvOTugbk5vj2Op6IyG8AdTXwa
         v7v+n2hl+lk4zs734IGGKdWhcrGyoYqXxsLHBnxjod7zlRx0kbb0n7pKjq0yx5eeTa6E
         l8Fw==
X-Forwarded-Encrypted: i=1; AL+hErEkb0YKGZF4D5ikt/SlkKo0/fyB71Pm9wOXttuWjJlidP+CcElzBTXLAVLAy9K5oND5fuvVm4IiEtyGCA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+4u8+lRTcU5luBET9xBlG7YwIjlUjpuU4Dy6S76WPVObu9kSCq
	6Tc94k2iyWoqLchwuIbe3fZB4lF8NNRcEIVVniuK0TDyId3qoYvWc7+R6k9/1fygPTF2NDebrg=
	=
X-Received: from wrod4.prod.google.com ([2002:adf:ef84:0:b0:48d:f014:9e3c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:268a:b0:48e:c84:5be6
 with SMTP id ffacd0b85a97d-4982ecf61e2mr4261257f8f.14.1794313064491; Tue, 10
 Nov 2026 04:17:44 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:37 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-17-ardb+git@google.com>
Subject: [PATCH v2 05/10] efi/libstub: arm64: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041747_200723_E9726F85 
X-CRM114-Status: GOOD (  13.64  )
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

Instead of exposing individual symbols to the EFI stub explicitly via
the linker script, use the generic struct efi_image_info, which accesses
the original symbols via PC-relative references from the stub itself.

This improves code reuse across architectures, and makes it easier to
add new references in a generic manner.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/image-vars.h            |  6 ------
 drivers/firmware/efi/libstub/arm64-stub.c | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 19d602e45523..9ab71d103f64 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -20,8 +20,6 @@
 	PROVIDE(pisym = sym);		\
 	ASSERT((sym - KIMAGE_VADDR) < (__bss_start - KIMAGE_VADDR), #msg)
 
-PROVIDE(__efistub_primary_entry		= primary_entry);
-
 /*
  * The EFI stub has its own symbol namespace prefixed by __efistub_, to
  * isolate it from the kernel proper. The following symbols are legally
@@ -33,10 +31,6 @@ PROVIDE(__efistub_primary_entry		= primary_entry);
  */
 PROVIDE(__efistub_caches_clean_inval_pou = __pi_caches_clean_inval_pou);
 
-PROVIDE(__efistub__text			= _text);
-PROVIDE(__efistub__end			= _end);
-PROVIDE(__efistub___inittext_end       	= __inittext_end);
-PROVIDE(__efistub__edata		= _edata);
 #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
 PROVIDE(__efistub_sysfb_primary_display	= sysfb_primary_display);
 #endif
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index 2c3869356147..8184b345af69 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -10,7 +10,6 @@
 #include <linux/efi.h>
 #include <asm/efi.h>
 #include <asm/memory.h>
-#include <asm/sections.h>
 
 #include "efistub.h"
 
@@ -21,22 +20,23 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle)
 {
-	unsigned long kernel_size, kernel_codesize, kernel_memsize;
+	auto image_info			= efistub_get_image_info();
+	unsigned long kernel_base	= efistub_kernel_base(image_info);
+	unsigned long kernel_size	= efistub_kernel_size(image_info);
+	unsigned long kernel_codesize	= efistub_kernel_codesize(image_info);
+	unsigned long kernel_memsize	= efistub_kernel_memsize(image_info);
 
-	if (image->image_base != _text) {
+	if (image->image_base != (void *)kernel_base) {
 		efi_err("FIRMWARE BUG: efi_loaded_image_t::image_base has bogus value\n");
-		image->image_base = _text;
+		image->image_base = (void *)kernel_base;
 	}
 
-	if (!IS_ALIGNED((u64)_text, SEGMENT_ALIGN))
+	if (!IS_ALIGNED(kernel_base, SEGMENT_ALIGN))
 		efi_err("FIRMWARE BUG: kernel image not aligned on %dk boundary\n",
 			SEGMENT_ALIGN >> 10);
 
-	kernel_size = _edata - _text;
-	kernel_codesize = __inittext_end - _text;
-	kernel_memsize = kernel_size + (_end - _edata);
 	*reserve_size = kernel_memsize;
-	*image_addr = (unsigned long)_text;
+	*image_addr = kernel_base;
 
 	return efi_kaslr_relocate_kernel(image_addr, reserve_addr, reserve_size,
 					 kernel_size, kernel_codesize, kernel_memsize,
@@ -54,7 +54,7 @@ unsigned long primary_entry_offset(void)
 	 * of the file representation. So instead, we need to jump to the
 	 * actual entrypoint in the .text region of the image.
 	 */
-	return (char *)primary_entry - _text;
+	return efistub_kernel_entry_offset(efistub_get_image_info());
 }
 
 void efi_icache_sync(unsigned long start, unsigned long end)
-- 
2.56.0.542.g3ef89b7020-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
