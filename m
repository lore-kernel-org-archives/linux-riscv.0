Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5816D606A332
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a7AGmC3W;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JKTLIGCB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=X26HAal/wtA/ltxcRu13nXSGbR6VZfM2VCl3oMUD97U=; b=a7AGmC3Wcqe2OyRw8qt6mnQIDf
	J56J43VeDSV+nab0XWJZgwWfMXPRbX0XwqT+IsXtAH8TMRR/Q1J1h10bClpDIEqXMR1UAZbFZA9j+
	q2+Kk2keIFqOZFobqIMHm4ZmkV85ke7xHf+/A0ZX4SDouAizZqFc5Dee+Y87cLkFUWfTT8foJdKFE
	rpcO7I40OMMa5NlN6w21RB31E7Qdjg+0Ykp+5VftnsEw2uGCXHXoOBFehfyRYYiiPvOn5WQjSLYA0
	s++iXCprbg1PWAJLj4DZ9lWzlNxn/9MZ3VhVLyLgzwRMXOvU5Qp+uTpmICCuipcnfUq+orqlM8o46
	R/yaPdBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkJc-00000009vCt-0FVV;
	Wed, 18 Nov 2026 18:23:28 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIQ-00000009tSw-1pbe
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:18 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-4915ba023d4so941987f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026130; x=1795630930; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmGCFG2plXe8vmZtQIJVK4guRF9ed+vUOMzeyrBZ/us=;
        b=JKTLIGCBop4YtNYwZhT5GvDSi7ghmP1PlbfZS005VPRXKWScjzU+elfZhLa+OtmDVt
         zjtpKNc1urjv2P3xUC9+xLmK/sT0/sgbhjT8CQd6u6VzFzt7oBJ0115roIgRkcZiTHOi
         RdIURQE/LfpCbIX5QSdCl+llIwCTmukiQzIm6JoEQ5QVG2QFl7/y2uh7KCe8wAw//OVg
         2GScskhVGJL/uKlKQCfW++sZh0b0rXu7zRC4Tx8/Zbqdh1TMXpckeUbAL90/MY8PY2Ck
         7q0pM7w+IkTgghYFKvfRS/iEyLecnkNJhNbqx09HJHJxqQp1T480XLSa5aUDljA8o7UZ
         lMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026130; x=1795630930;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmGCFG2plXe8vmZtQIJVK4guRF9ed+vUOMzeyrBZ/us=;
        b=V13drwFRw+VuyG0kjb5RKBnSnRkTJZTgvGqi8GhVUczErgExYi9Fj0lRY3oQmUWaRl
         haxH900hZn2HmsDXPcrccuMa4M1rcgNTkF122ywpofKHw6JK2ZRMWbLKG1RZFkC6htqw
         cPWEcV2oKEGxhWQ0VU7xLX+LBe1zqwZkEDD7T3f144zhPaUNd3sRlq6n9BCS6F06AFZJ
         HDsviLKJqcBn24F88uWkCjJI/bnI0EBKokUrPWIjEgMV+aRr0CqYYre56ceRMsC7q2JH
         YaKuCxGwQ0fdeqMwT8z0zq2vUS5IjV80UEPxrLtuLX5DJdPcY909ZckSf/F5EQ75qgX4
         tQKg==
X-Forwarded-Encrypted: i=1; AL+hErFpee72JaEQ07aRD0hfjlbkwRfdSGV4LDVxQjIGnHVWeO6XM17Pe9EY2PPDqKIycAgL3wg8/+LBgz9Zng==@lists.infradead.org
X-Gm-Message-State: APuU4Z8iuiMzAJfUfCuCjXqyj+ZtpKBavHeThvboTqafKWvWlm6ED/QM
	jmq8hM0Y3sH8wWyOqxP/NOMt2G/5wAGT1/imatYNcCH22jz+hQNL0rTxqlVMmH6bcaNiyBpGoA=
	=
X-Received: from wrbgf13.prod.google.com ([2002:a05:6000:27cd:b0:4a3:2183:2372])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d01:0:b0:48e:720a:ccaf
 with SMTP id ffacd0b85a97d-4a63658254amr8068198f8f.5.1795026129990; Wed, 18
 Nov 2026 10:22:09 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:19 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5588; i=ardb@kernel.org;
 h=from:subject; bh=Vn0Z0SmqUqZ8NK+fY9lRYM6IvhOk/O8WfVQkKgBtwuc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvmyUN51mqr22vUWb9L5EtnXaWMWDLpvq+koynlosUU
 teePWLVUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbC4Mzwh2PSVYaiuDVeilO2
 iE3dbZOX8lHQJNg4pOjfs7sck3qZ5zAyvA664Gm3Lvb520dKtdw3z7FNDNvDc/OidOVlr67nsWE veQA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-34-ardb+git@google.com>
Subject: [PATCH v4 13/19] efi/libstub: loongarch: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102214_554056_BD10BB54 
X-CRM114-Status: GOOD (  12.72  )
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/loongarch/kernel/head.S                  |  3 ---
 arch/loongarch/kernel/image-vars.h            |  6 ------
 arch/loongarch/kernel/vmlinux.lds.S           |  1 -
 drivers/firmware/efi/libstub/loongarch-stub.c | 15 ++-------------
 drivers/firmware/efi/libstub/loongarch-stub.h |  4 ----
 drivers/firmware/efi/libstub/loongarch.c      | 10 +---------
 6 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index 69c31b0b65c5..93ffedad6aca 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -32,9 +32,6 @@ _head:
 pe_header:
 	__EFI_PE_HEADER
 
-SYM_DATA(kernel_asize, .long _kernel_asize);
-SYM_DATA(kernel_fsize, .long _kernel_fsize);
-
 SYM_FUNC_ALIAS(efi_primary_entry, kernel_entry)
 #endif
 
diff --git a/arch/loongarch/kernel/image-vars.h b/arch/loongarch/kernel/image-vars.h
index e557ebd46c2b..6ace4993df57 100644
--- a/arch/loongarch/kernel/image-vars.h
+++ b/arch/loongarch/kernel/image-vars.h
@@ -8,12 +8,6 @@
 #ifdef CONFIG_EFI_STUB
 
 __efistub_strcmp		= strcmp;
-__efistub_kernel_entry		= kernel_entry;
-__efistub_kernel_asize		= kernel_asize;
-__efistub_kernel_fsize		= kernel_fsize;
-#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
-__efistub_sysfb_primary_display	= sysfb_primary_display;
-#endif
 
 #endif
 
diff --git a/arch/loongarch/kernel/vmlinux.lds.S b/arch/loongarch/kernel/vmlinux.lds.S
index ce097e25881f..f8723c1ba9a7 100644
--- a/arch/loongarch/kernel/vmlinux.lds.S
+++ b/arch/loongarch/kernel/vmlinux.lds.S
@@ -159,7 +159,6 @@ SECTIONS
 	/* header symbols */
 	_kernel_entry = ABSOLUTE(kernel_entry & PHYSADDR_MASK);
 	_kernel_asize = ABSOLUTE(_end - _text);
-	_kernel_fsize = ABSOLUTE(_edata - _text);
 	_kernel_vsize = ABSOLUTE(_end - __initdata_begin);
 	_kernel_rsize = ABSOLUTE(_edata - __initdata_begin);
 #endif
diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/firmware/efi/libstub/loongarch-stub.c
index 8f2145bd9ad2..df6749643bb8 100644
--- a/drivers/firmware/efi/libstub/loongarch-stub.c
+++ b/drivers/firmware/efi/libstub/loongarch-stub.c
@@ -8,11 +8,6 @@
 #include <asm/efi.h>
 #include <asm/addrspace.h>
 #include "efistub.h"
-#include "loongarch-stub.h"
-
-extern int kernel_asize;
-extern int kernel_fsize;
-extern int kernel_entry;
 
 /**
  * efi_relocate_kernel() - copy memory area
@@ -100,6 +95,8 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
 {
+	int kernel_asize = efistub_kernel_memsize(*image_info);
+	int kernel_fsize = efistub_kernel_size(*image_info);
 	efi_status_t status;
 	unsigned long kernel_addr = 0;
 
@@ -114,11 +111,3 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	*(unsigned long *)image_info += *image_addr - (unsigned long)image->image_base;
 	return status;
 }
-
-unsigned long kernel_entry_address(unsigned long kernel_addr,
-		efi_loaded_image_t *image)
-{
-	unsigned long base = (unsigned long)image->image_base;
-
-	return (unsigned long)&kernel_entry - base + kernel_addr;
-}
diff --git a/drivers/firmware/efi/libstub/loongarch-stub.h b/drivers/firmware/efi/libstub/loongarch-stub.h
deleted file mode 100644
index cd015955a015..000000000000
--- a/drivers/firmware/efi/libstub/loongarch-stub.h
+++ /dev/null
@@ -1,4 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-unsigned long kernel_entry_address(unsigned long kernel_addr,
-		efi_loaded_image_t *image);
diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
index 7f21e79384d3..cd19f3b574fd 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -8,7 +8,6 @@
 #include <asm/efi.h>
 #include <asm/addrspace.h>
 #include "efistub.h"
-#include "loongarch-stub.h"
 
 typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long cmdline,
 					  unsigned long systab);
@@ -59,16 +58,9 @@ static efi_status_t exit_boot_func(struct efi_boot_memmap *map, void *priv)
 	return EFI_SUCCESS;
 }
 
-unsigned long __weak kernel_entry_address(unsigned long kernel_addr,
-		efi_loaded_image_t *image)
-{
-	return *(unsigned long *)(kernel_addr + 8) - PHYSADDR(VMLINUX_LOAD_ADDRESS) + kernel_addr;
-}
-
 efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
 			     const struct efi_image_info *image_info, char *cmdline_ptr)
 {
-	unsigned long kernel_addr = efistub_kernel_base(image_info);
 	kernel_entry_t real_kernel_entry;
 	struct exit_boot_struct priv;
 	unsigned long desc_size;
@@ -99,7 +91,7 @@ efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
 	csr_write(CSR_DMW2_INIT, LOONGARCH_CSR_DMWIN2);
 	csr_write(CSR_DMW3_INIT, LOONGARCH_CSR_DMWIN3);
 
-	real_kernel_entry = (void *)kernel_entry_address(kernel_addr, image);
+	real_kernel_entry = efistub_kernel_entry(image_info);
 
 	real_kernel_entry(true, (unsigned long)cmdline_ptr,
 			  (unsigned long)efi_system_table);
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
