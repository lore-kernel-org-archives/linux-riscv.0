Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECBA606A333
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=McpkxsuI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iSk2ZUXH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=s3JB7ELBlWaA3mwj4QzMX42pdrAoneQyNwycw/2SICI=; b=McpkxsuIUuskR0iz9K4qAtSR1u
	MqRPh9r91wyMboB5Q5F9+fPmerEZe2+gT9NhH/xzGAopnFl91no78nNMlYaVblbs2ACwgrO3v4GKo
	ukbtCa25kaigATt5S+doUgk8BKP4qirBe4ODfn4zXO74HiNdSAAk+KZRuWjAS5S6xpMrqtF3biQgO
	/d9KNDxf68Rl0lGDopsK9MZzhmI08HLj6UC85sKSjfqOykDIFS3CHJZLShsbXWEOhAo4ZyqCL05ZM
	jFVzDQf/D3CoIXMV8s0SnRFzDdpbr6LiGmNxy1NGnFk1LdbR/h/QQ0/0LFL4VIT0oUjPRlcOKt+41
	F57Dz++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxgS-00000002q12-2WrK;
	Mon, 16 Nov 2026 14:27:48 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg4-00000002pL1-3ITB
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:28 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4bb68d624baso14307995e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 06:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839242; x=1795444042; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RVj/mwGKYiU3kSMSXzOsaOfBC4aFrCWCPIyQ/H9Zds=;
        b=iSk2ZUXHLL4nE9Dq56dX6Dc4vGLvj5LZxI91FarE7mEtvVf/kzKfYJ26CQwyBLPZqr
         YFTUiyWnVSwAdP89xF4MWtJpdBm+3AXWVCaHDMpNnBhMHY3DY4Ev4eWH3/grMc0obAG4
         pCpgheodiXYbnM1Sx9NXI6k1K936FEAQWV7C6KdQyFJkZ5zL+fnqL3JoQzXtxkvw45r6
         0sDRXvy+kbGgsPWAEMVWNGa7Vf4L5p/CxGhspYnf3gLsKbvx1bp7hLD2386lAkx41DlW
         6SLtYtaXWvQ10lHScurf8tv5B093GRPYUUs0VUslM8AxVbv0mdyT54pGfBUYlpkCrijR
         AfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839242; x=1795444042;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RVj/mwGKYiU3kSMSXzOsaOfBC4aFrCWCPIyQ/H9Zds=;
        b=x1YcSlNXauqFmtSqxs0QZZ4wGX1qr11ZwiHtZIUJt855yIb1Ki/56ZerMbR29dWhCv
         e75XG+BgKqE3lqONOIuFv16Sa0GcLup/VDGIqLJyH0mRM6fYgNmDi7o6o8VthNg9+XiF
         V8syvrUwEj4uik9wEPJRkffVklUEFp2trnVORNXxkib7ptBB1a4WYz3/y1Q2t0AZ8kOO
         bem//zaT7hOAaPVsBMP5kf8eqV8BV0Rlp9oi0xHjh8GW9nrC0q5GfP79gnY3IWrvAS7Z
         2GCFMn0glNsnfxYXE0ThreHP57ZtfK+n6QJcN4cnBTEyrUmfT+fCHJtk9dmnGHd1hIBL
         rZSw==
X-Forwarded-Encrypted: i=1; AL+hErENNBww+coG9i1qPr0dcRzp44MpXcTeoNRcw5+AtsjjMg6gtz7QOdxqT3yR1q6DuKWSw8uWst1KBi/IjA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+spfrfuriID0FhJL4aBgfBs70rV+UmV8VmmSmBAzbYy9g8LXJd
	F71qGAfq5QjMBX1RtP7MzYysJT+YpIybRAQ7hhCslJ9QvZLf3zh1hUcVg5tT2M+BfN/R/YJzbw=
	=
X-Received: from wmcq6.prod.google.com ([2002:a05:600c:c106:b0:4a2:853:1e95])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8905:b0:4ba:4395:5755
 with SMTP id 5b1f17b1804b1-4bb55a6a5fbmr150647045e9.5.1794839242110; Mon, 16
 Nov 2026 06:27:22 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:27 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305; i=ardb@kernel.org;
 h=from:subject; bh=peJRMhRWVHJG8sZnjgL/vZGGMw1q+y4rvprHAO6G7n0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30LSAazPnfFGeua/tpXiBqa7GNo/P075mL5pygqdn6
 /sH+yb6dJSyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJXGlgZJhnynlSWGBaX1iU
 9cqi2qUMb5pWvPm9OV2Ad+a84JIpsfaMDOcrj/9WTLmm+nezcMEfzjnxbixp9oesrniaLZ9oFSy qywMA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-25-ardb+git@google.com>
Subject: [PATCH v3 08/15] efi/libstub: arm64: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062724_867352_C16E4E58 
X-CRM114-Status: GOOD (  14.09  )
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
 arch/arm64/kernel/image-vars.h            | 10 ------
 drivers/firmware/efi/libstub/arm64-stub.c | 33 ++++++--------------
 2 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 19d602e45523..329d5e214b36 100644
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
@@ -32,14 +30,6 @@ PROVIDE(__efistub_primary_entry		= primary_entry);
  * position independent manner
  */
 PROVIDE(__efistub_caches_clean_inval_pou = __pi_caches_clean_inval_pou);
-
-PROVIDE(__efistub__text			= _text);
-PROVIDE(__efistub__end			= _end);
-PROVIDE(__efistub___inittext_end       	= __inittext_end);
-PROVIDE(__efistub__edata		= _edata);
-#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
-PROVIDE(__efistub_sysfb_primary_display	= sysfb_primary_display);
-#endif
 PROVIDE(__efistub__ctype		= _ctype);
 
 PROVIDE(__pi___memcpy			= __pi_memcpy);
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index c93ab8b6e9d3..8ff8f8651504 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -10,7 +10,6 @@
 #include <linux/efi.h>
 #include <asm/efi.h>
 #include <asm/memory.h>
-#include <asm/sections.h>
 
 #include "efistub.h"
 
@@ -22,23 +21,23 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
 {
-	unsigned long kernel_size, kernel_codesize, kernel_memsize;
+	unsigned long kernel_base	= efistub_kernel_base(*image_info);
+	unsigned long kernel_size	= efistub_kernel_size(*image_info);
+	unsigned long kernel_codesize	= efistub_kernel_codesize(*image_info);
+	unsigned long kernel_memsize	= efistub_kernel_memsize(*image_info);
 	efi_status_t status;
 
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
 
 	status = efi_kaslr_relocate_kernel(image_addr, reserve_addr,
 					   reserve_size, kernel_size,
@@ -48,24 +47,10 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	if (status != EFI_SUCCESS)
 		return status;
 
-	*(unsigned long *)image_info += *image_addr - (unsigned long)_text;
+	*(unsigned long *)image_info += *image_addr - kernel_base;
 	return EFI_SUCCESS;
 }
 
-asmlinkage void primary_entry(void);
-
-unsigned long primary_entry_offset(void)
-{
-	/*
-	 * When built as part of the kernel, the EFI stub cannot branch to the
-	 * kernel proper via the image header, as the PE/COFF header is
-	 * strictly not part of the in-memory presentation of the image, only
-	 * of the file representation. So instead, we need to jump to the
-	 * actual entrypoint in the .text region of the image.
-	 */
-	return (char *)primary_entry - _text;
-}
-
 void efi_icache_sync(unsigned long start, unsigned long end)
 {
 	caches_clean_inval_pou(start, end);
-- 
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
