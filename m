Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBAA606A336
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 12:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OLv98zJ5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SUDWI5kx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=/R5rOoUBseh05ELsfHlneGmIrNCBJ5W/RfjZYwSA8zs=; b=OLv98zJ5nJ3RhY+bUaYL1EtKv1
	0WAt+8Sln6JmnI6Y7wQiio9dzD739Pv1Tt11l8oJoDyRCchYDEKR9i/kTmjWmmEplWJoytp/Q8IiP
	qbtFeU3+LU0VRsNZe28Xg/m/AgWkIf7qTFuOAqIrSjiOEqKPoHTLUeufiMR2xW7dTDPd9lwLXMFHi
	iYf6pZn8O0GpT/CCQnRNRSIG83Tl+MhcNA3NzstzBjXJkI9c2oRNAY7/OAx/AA4BUOhwZPRqpmhko
	qQv3jPhi4Zh31h+tPMFJbSvpm6EEO2wJUoCci50l3sVe0qI0lHpU0Rc/aOBZ0w4ALASCl6LxpMW4l
	qYdO6Zvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknd-00000003nJF-2Otq;
	Tue, 10 Nov 2026 12:18:05 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknN-00000003mzm-2fwq
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:50 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so14462445e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 04:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313067; x=1794917867; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NfbOn3Kflbxnh3F008n5JJpxbmKMRJyc/lu3FOPZxo=;
        b=SUDWI5kx+0716spTxuMFALeLdrCwcBTAnywvbUy2mHh0QRJCJCyaqO3Pq0J9uymvJT
         lTHG6noSAJcpu14KF0XNcxu4uKWlbp5JbHnteibxkC9q3ZCu2pyThrSLvYPUW06Qnwyz
         oi5ysIbai2AWcdbpOFQhJpVE0ml6pm6ktPBH3D95rTwGgLctJNk7LmuNEt5JiCWtBEJJ
         pk64oyYQ70mJsrWkxRchkWnESLwRfrKjrfyJt+irzEv1+CeFpR82ZLDkpY+bahxDB+hH
         hCoKV1JtPb448Wj38GroopdRkEKVsuIEE8fKjB7WUhGLDZ7IJgKeeMZAwiNHnDj6NnGh
         L1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313067; x=1794917867;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NfbOn3Kflbxnh3F008n5JJpxbmKMRJyc/lu3FOPZxo=;
        b=pa3JBd5PrxUO2wmz+645BfHNL19L/hMo3TDoIm1fUsT5ejL5pwrrXER/jSJlnbPNun
         BzPe+kpdBBgdIEnJ8L1x0jFC8dwis8dd6eS4mUnqDaUoIUVf5JlQzJw5pRrK7HZtQMNv
         0+PE0hndwu121YageEoorXY3owCZt4NPyJMEDc3haqgHDuXz0lFKD/z7Gsp938eByxKd
         E5W3cf86nCWNdEqQeIT95nAMLGgGK61G8LzRpqXIBdWUEf5IZW8z9ulXCdk5Ya9yc8Ai
         Jw3pkCoW0m3Si6QwcMDU67XcMTfYfnfkmuFSrNizMK42o4iZxgndFkhI+xQDevpHPv3K
         SeBQ==
X-Forwarded-Encrypted: i=1; AL+hErGXhsKUlsa/+D96DPj/AQxzA6WNZ7wbgVm9zULB2iRmAy07ja0YOVPzlPRzLbF9uUUn20TGvuQ2yHd6iw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/5UkXN9qSXFbLu/RnMO/TCLYSpT8Ps0EpicMM+xGTriEEygRv2
	AIq3AltxljyMnOd2sl/Bo41eRGtWwkcJih7iwkqdRSg/lTXdGaGhFwFkxPJJky5c2oSony9+Sg=
	=
X-Received: from wrnj18.prod.google.com ([2002:adf:ea52:0:b0:48c:4566:c9eb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:34d3:b0:4a1:e6c5:e44c
 with SMTP id 5b1f17b1804b1-4ba0233e7f5mr39656725e9.10.1794313067235; Tue, 10
 Nov 2026 04:17:47 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:39 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-19-ardb+git@google.com>
Subject: [PATCH v2 07/10] efi/libstub: riscv: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041749_709043_1FE4D76C 
X-CRM114-Status: GOOD (  11.64  )
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
 arch/riscv/kernel/image-vars.h            |  5 -----
 drivers/firmware/efi/libstub/riscv-stub.c | 14 +++++++-------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index bf703eba3fa5..27efb990da43 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -23,11 +23,6 @@
  * linked at. The routines below are all implemented in assembler in a
  * position independent manner
  */
-__efistub__start		= _start;
-__efistub__start_kernel		= _start_kernel;
-__efistub__end			= _end;
-__efistub__edata		= _edata;
-__efistub___inittext_end	= __inittext_end;
 #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
 __efistub_sysfb_primary_display	= sysfb_primary_display;
 #endif
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 5cbc50a814e1..e8d66f6fe8e0 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -6,7 +6,6 @@
 #include <linux/efi.h>
 
 #include <asm/efi.h>
-#include <asm/sections.h>
 #include <linux/unaligned.h>
 
 #include "efistub.h"
@@ -20,7 +19,7 @@ unsigned long stext_offset(void)
 	 * of the file representation. So instead, we need to jump to the
 	 * actual entrypoint in the .text region of the image.
 	 */
-	return _start_kernel - _start;
+	return efistub_kernel_entry_offset(efistub_get_image_info());
 }
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
@@ -30,13 +29,14 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle)
 {
-	unsigned long kernel_size, kernel_codesize, kernel_memsize;
+	auto image_info			= efistub_get_image_info();
+	unsigned long kernel_base	= efistub_kernel_base(image_info);
+	unsigned long kernel_size	= efistub_kernel_size(image_info);
+	unsigned long kernel_codesize	= efistub_kernel_codesize(image_info);
+	unsigned long kernel_memsize	= efistub_kernel_memsize(image_info);
 	efi_status_t status;
 
-	kernel_size = _edata - _start;
-	kernel_codesize = __inittext_end - _start;
-	kernel_memsize = kernel_size + (_end - _edata);
-	*image_addr = (unsigned long)_start;
+	*image_addr = kernel_base;
 	*reserve_size = kernel_memsize;
 
 	status = efi_kaslr_relocate_kernel(image_addr,
-- 
2.56.0.542.g3ef89b7020-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
