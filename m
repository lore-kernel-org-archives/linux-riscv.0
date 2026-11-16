Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6B5606A323
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I6QJ9lht;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OVKHZ6nq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=qnhKAblcoZ9fGceGLlLJcFIdTZg1wESBX2ETxrTUx7M=; b=I6QJ9lhtnbtNKAlbCXd0ozbGxf
	sFRR8XDrbwGepzhock+94uQuY9V614TmSIczX4dNCpPRF6pQBehI6IuPG3yLomcccElM9VcxiuTJD
	+rexcVdbhEsGKF/XSrVN46s8aPYINOWubzmmgNzU80CoDGxO9Vj8YXcs7QrKqHDXovtEarsSYrtE8
	hHzJttvVmadYtQ+UoxahZEYRu/kjchL2frIAZ/Kzawbr0AYQhOvCfyBaHqGteWpej2x33J4ARZd1n
	m8+zUuQZUxgg6SS5NnmYk0/3Atk2/3EYcuazLx3muAMehoC9B2TfQD1PgzBOtPRMjRgcifM/SgqQi
	jHWDa/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxgb-00000002qDl-0Vhe;
	Mon, 16 Nov 2026 14:27:57 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg7-00000002pOP-2ICy
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:29 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48fbcf023dcso1566319f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 06:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839245; x=1795444045; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o11hgmvCCkoqVQmKB/Ee34WO8eez+JgS5dBD2M+SoXI=;
        b=OVKHZ6nqw2i6bqjO9scah5IRfHDId3na+KV856esmTH3XI9VCu1tsB4kTXj44IWmlK
         GCynIKZUkBZGlzLhQVmZ3WWtOl1hQxSxynbCiZ5DHTYEhTAY6GbaMlBNydpwsFlow6pf
         5ZwbusZMLRFLZwx9lJ7x2yNZJnpyRgWNqff4qRFk3A3jACOa5SwRmBn7QWZUc3+Y68/2
         L5XLpHYPX/KcuVVasZWlBg9Ge/Rqi3i7HZpML+xzFzta0qmzvCyim8iPd+K7BuRqSheS
         7I6BtcfUs/JOBp4G2aA0qX+UiIGaJwi16R0mJU12EquWRGGxdgE5OseJLf6nSlVeOTN6
         23ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839245; x=1795444045;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o11hgmvCCkoqVQmKB/Ee34WO8eez+JgS5dBD2M+SoXI=;
        b=BOZ1UDH5wW3fhOX+C1Kay8/EgpBv4mByeKTXhkIxXD2gcU2dC8ZBba548OTI2sVuFC
         f2DMsQWqISwWRt4Bihhg1aW9pWOrlQUtJD0Qdgmy7qP4P+krYTkBRzfvXKppWXD81LDw
         Vd1Tp7vi+xS1QiclUcRinL2bI90dAyqdH5Q+NyViKO3FAi/VdNAlxe9WAet/Yiw4mt6q
         sdkTHfXohLWeEpJPjQGfi9KYkDflHzg+t7B3mXR8EDvamYxVhNwlK4R81iOpJiK7BSIP
         tIhh8GAV9qJ8K8xNk2fNRFuOxI5Z0fTvbsuKEdkM0KSq0+fCqAxnd0Yht6frhE/XeVzk
         suOw==
X-Forwarded-Encrypted: i=1; AL+hErFB432/feghF2CZ5XkB7gNXdX5cmb53Q8ivn3PtAjyE0z+SkWNw8PWJzv52rU3GomuUYuxl6RLr5c0L5g==@lists.infradead.org
X-Gm-Message-State: APuU4Z/CbTlJoM4wIfD7uCHOJX8ATEe8bUjoUHMYre/DccYgKGiv/PNL
	+8zPiGKBO+ByMmh4r2bbx1SRwpS2pBhbSKzaaLzwItzd6UMOnWxXwryPHxAbSS3d77LI56jcog=
	=
X-Received: from wron1.prod.google.com ([2002:adf:f081:0:b0:48a:f42f:f171])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64e4:0:b0:487:6f2:1a4c
 with SMTP id ffacd0b85a97d-49c7381b46cmr25352969f8f.25.1794839244204; Mon, 16
 Nov 2026 06:27:24 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:29 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3411; i=ardb@kernel.org;
 h=from:subject; bh=0nt34/MyeHyViz+7a3rT70EnJHsQtwP3I7KaD72gSz8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30MwW9bOfZvZ9yNX/vfrllKK/Sb621ld3cr94vuZPV
 XKIj2JiRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiIaRojw6VFJQo7Lx1UX/bw
 Z4Lt9mypXpbEfDaVbsdzMx+zxa+ad4iR4fPSijBDhm9f1SV53q4o+TLnofCRLzvWVE9J4bisvO3 uXU4A
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-27-ardb+git@google.com>
Subject: [PATCH v3 10/15] efi/libstub: riscv: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062727_646692_4070BBA8 
X-CRM114-Status: GOOD (  13.52  )
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
 arch/riscv/kernel/image-vars.h            |  8 -------
 drivers/firmware/efi/libstub/riscv-stub.c | 25 +++++---------------
 2 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index bf703eba3fa5..c18b24792a29 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -23,14 +23,6 @@
  * linked at. The routines below are all implemented in assembler in a
  * position independent manner
  */
-__efistub__start		= _start;
-__efistub__start_kernel		= _start_kernel;
-__efistub__end			= _end;
-__efistub__edata		= _edata;
-__efistub___inittext_end	= __inittext_end;
-#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
-__efistub_sysfb_primary_display	= sysfb_primary_display;
-#endif
 
 /*
  * These double-word integer shifts are used by the library code, and
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 0ddbe7cc8628..58581ccb4cc0 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -6,23 +6,10 @@
 #include <linux/efi.h>
 
 #include <asm/efi.h>
-#include <asm/sections.h>
 #include <linux/unaligned.h>
 
 #include "efistub.h"
 
-unsigned long stext_offset(void)
-{
-	/*
-	 * When built as part of the kernel, the EFI stub cannot branch to the
-	 * kernel proper via the image header, as the PE/COFF header is
-	 * strictly not part of the in-memory presentation of the image, only
-	 * of the file representation. So instead, we need to jump to the
-	 * actual entrypoint in the .text region of the image.
-	 */
-	return _start_kernel - _start;
-}
-
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
 				 unsigned long *reserve_addr,
@@ -31,13 +18,13 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
 {
-	unsigned long kernel_size, kernel_codesize, kernel_memsize;
+	unsigned long kernel_base	= efistub_kernel_base(*image_info);
+	unsigned long kernel_size	= efistub_kernel_size(*image_info);
+	unsigned long kernel_codesize	= efistub_kernel_codesize(*image_info);
+	unsigned long kernel_memsize	= efistub_kernel_memsize(*image_info);
 	efi_status_t status;
 
-	kernel_size = _edata - _start;
-	kernel_codesize = __inittext_end - _start;
-	kernel_memsize = kernel_size + (_end - _edata);
-	*image_addr = (unsigned long)_start;
+	*image_addr = kernel_base;
 	*reserve_size = kernel_memsize;
 
 	status = efi_kaslr_relocate_kernel(image_addr,
@@ -47,7 +34,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	if (status != EFI_SUCCESS)
 		efi_err("Failed to relocate kernel\n");
 
-	*(unsigned long *)image_info += *image_addr - (unsigned long)_start;
+	*(unsigned long *)image_info += *image_addr - kernel_base;
 	return status;
 }
 
-- 
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
