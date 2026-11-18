Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D2E60A2608
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e269dZAQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BmiZqqjt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=TGsHzxBRD8xoP8W7DrWxNFR5ra/kfxPRU54X5nVS0gw=; b=e269dZAQS98F3m3K4yVcRTf9Cx
	k5SoIIef89y6foTsRbLJdhnsF3a1HAx76hsiFtHppI4rxMktN+Ib1rf9WQzK+20NSiaxNf8mJ+s/s
	cZ8RJ/hi5W2RSN4e26V6XIaT+iw3aJ/j1Q69GggfX7Oo4yHSckK4vfvBnOJI6myGfjC9aKrOMq6UA
	PeaJQ9PGT3Wg1Rdc60aL5gI9fIaPbum9UArUglpTLxNUDcDKvhixOrXjKqVxwaRQcyOJUPgNHqndE
	r6LQmPTQLukOnp3UD86lnrBAnTafvMnf/qfOotnG60N8ROm1/1j61/2NoEGyGSoGt3EEVfqQH0bNQ
	j3jMwgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIy-00000009uB0-2ZN3;
	Wed, 18 Nov 2026 18:22:48 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIG-00000009tLA-1Nky
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:05 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a2065a2ef9so12691165e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026120; x=1795630920; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BFGKQtttUCCxiC9KvZFy5P/XBPLuepyODAMZD8pNnRE=;
        b=BmiZqqjtVIp/v6POyjqk+1V+MAkir+m3Y126FaqHA77b4LyvowXUZViiPBYQW3kSzm
         W4dFWeT0BPgBaBMdHrGvDw5YdrIxumSDExm8OMxX4xUqiVsrLfhYqquU08/3p4M0jPE/
         ihnqlUFoKWgLhH07v7JIZoaika9jcOGma8NVXyx2FbIfdkKFdWpnqu3hbEP7ripavaHY
         z4YIXSDZHF/dTgDG+otylolA8XexC3KC8aoCuTBxzCeakHq1KS4XJlDSt3VakDwzPgY1
         /Uuw0y0ZDnA4nyg7MaB6O7m5onsQ5cWvS4eGDbE3+zxov5PYD6Q8wvpoeqpenzOaI9b0
         vSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026120; x=1795630920;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFGKQtttUCCxiC9KvZFy5P/XBPLuepyODAMZD8pNnRE=;
        b=Bi903WB07uhTrUheu9tVkfhQS99j/6wIAg5bUQ6k75yFi6cQchYqTnL0eab1EkX/t9
         be/IEaHgyPbQaIxTzczsmKM31cj9vRFcdEEj+Amx28K8RfhoKiCfAg0bVJn6WLTm6qSh
         eQmwV9UwdyH0EjWWusxFvhxS1WgvO9vXiRM/nrpcFnA1fKXEWt1sk5bt/RxsX75VjScf
         MBTvqxl3fAgmeOPUhSw4p5ldPKEjBBJk6/ojbXaEEqRWtYAQztLnt+zNAbuKMUoXgh9B
         Li6ik1AXwfQVcwEs7tCHN8279Qu7s0rQZMnT7S/DMOdt3Er43gRVJpbsEQ1Qg3ft8hhJ
         T3Hg==
X-Forwarded-Encrypted: i=1; AL+hErHtuaZ2hxy5qZYeovbnXYV5QxA/lobCIh9N/sbAg5tPzcDAfKTnJD8m2xzbO4JD0KURVK8xcerdjmNBxg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/eJf+APh7DkKbcqCK7nRVvFS8rCY9sjNxt3ubIAggELO5matbF
	YipukURY1+aKoyoovxJZfwxQBxl2L8K1zGtWWnHjx68zUb/hpwbmdGIxPffr6N2yeIuXx9YCzw=
	=
X-Received: from wrqv14.prod.google.com ([2002:a5d:4b0e:0:b0:4a3:6d62:8105])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:81c5:b0:4bb:7987:fbbc
 with SMTP id 5b1f17b1804b1-4bb7d5d41e5mr64616255e9.1.1795026120017; Wed, 18
 Nov 2026 10:22:00 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:14 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=21464; i=ardb@kernel.org;
 h=from:subject; bh=hdE3Rr4UdMRGoVG44vW2Nu/AA6wj0JqpCbvhKmKVIYI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm7lNuR6PWAsXbv3/Z8KaU+aGz0WPXTkdwj+hUnLf+
 s9LPxUc6ihlYRDjYpAVU2QRmP333c7TE6VqnWfJwsxhZQIZwsDFKQAT8fNjZHgu16bxaf0/rcC7
 it/W3FpZL6Efeq6tOClnoxbvZMFtDIcYGdaw5inlB2WncmyQiww9qHkqbAGP5YXO226szw1yz56 o4QMA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-29-ardb+git@google.com>
Subject: [PATCH v4 08/19] efi/libstub: Capture loaded image information in
 struct efi_image_info
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102204_598904_53970965 
X-CRM114-Status: GOOD (  23.61  )
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

Define a struct efi_image_info that carries properties of the loaded
kernel image, and pass a pointer to it to efi_stub_common() so that EFI
stub code can access these properties in a consistent manner for both
the uncompressed kernel and the EFI zboot image.

Note that zboot can only access this information after decompressing the
image, whereas code that is part of the EFI stub that gets integrated
into Linux could just grab the efi_image_info pointer as needed.

However, in order to avoid future surprises, pass the efi_image_info
pointer down via the calls into the shared stub code, replacing the
image base address field, whose value can be derived from image_info as
well as long as it is taken from the copy of the image that will
ultimately be used to boot the kernel.

ARM implements neither, but -like x86- incorporates the EFI stub into
its own decompressor and cannot incorporate struct efi_image_info as
defined here, as it refers to global symbols in vmlinux. Assign the
efi_image_info._text_offset field at runtime so that generic code can
use efi_image_info to derive the base address of the loaded image. Other
fields are not used on ARM so ignore those.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi-header.S                |  2 +
 arch/loongarch/kernel/head.S                  |  1 +
 arch/riscv/kernel/head.S                      |  1 +
 drivers/firmware/efi/libstub/Makefile         |  1 +
 drivers/firmware/efi/libstub/Makefile.zboot   | 11 +++-
 drivers/firmware/efi/libstub/arm32-stub.c     |  8 ++-
 drivers/firmware/efi/libstub/arm64-stub.c     | 13 +----
 drivers/firmware/efi/libstub/efi-stub-entry.c | 22 +++----
 drivers/firmware/efi/libstub/efi-stub.c       | 10 ++--
 drivers/firmware/efi/libstub/efistub.h        | 61 ++++++++++++++++++--
 drivers/firmware/efi/libstub/image_info.S     | 19 ++++++
 drivers/firmware/efi/libstub/kaslr.c          | 17 +++---
 drivers/firmware/efi/libstub/loongarch-stub.c |  4 +-
 drivers/firmware/efi/libstub/riscv-stub.c     | 12 +---
 drivers/firmware/efi/libstub/zboot.c          | 22 +++++--
 drivers/firmware/efi/libstub/zboot.lds        |  2 +
 16 files changed, 148 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/kernel/efi-header.S b/arch/arm64/kernel/efi-header.S
index 329e8df9215f..54ca61d03403 100644
--- a/arch/arm64/kernel/efi-header.S
+++ b/arch/arm64/kernel/efi-header.S
@@ -7,6 +7,8 @@
 #include <linux/pe.h>
 #include <linux/sizes.h>
 
+SYM_FUNC_ALIAS(efi_primary_entry, primary_entry)
+
 	.macro	efi_signature_nop
 #ifdef CONFIG_EFI
 .L_head:
diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index 601ddd78b233..69c31b0b65c5 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -35,6 +35,7 @@ pe_header:
 SYM_DATA(kernel_asize, .long _kernel_asize);
 SYM_DATA(kernel_fsize, .long _kernel_fsize);
 
+SYM_FUNC_ALIAS(efi_primary_entry, kernel_entry)
 #endif
 
 	__REF
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 1631fd6bc786..6c81f32be70b 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -28,6 +28,7 @@ SYM_CODE_START(_start)
 	 * that expects this header format!!
 	 */
 #ifdef CONFIG_EFI
+SYM_FUNC_ALIAS(efi_primary_entry, _start_kernel)
 	/*
 	 * This instruction decodes to "MZ" ASCII required by UEFI.
 	 */
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..9dc6a707fd79 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -107,6 +107,7 @@ lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
 
 targets				:= $(lib-y)
 lib-y				:= $(patsubst %.o,%.stub.o,$(lib-y))
+lib-$(CONFIG_EFI_GENERIC_STUB)	+= image_info.o
 
 # Even when -mbranch-protection=none is set, Clang will generate a
 # .note.gnu.property for code-less object files (like lib/ctype.c),
diff --git a/drivers/firmware/efi/libstub/Makefile.zboot b/drivers/firmware/efi/libstub/Makefile.zboot
index 52baacf3e9d9..e2769bbec963 100644
--- a/drivers/firmware/efi/libstub/Makefile.zboot
+++ b/drivers/firmware/efi/libstub/Makefile.zboot
@@ -26,9 +26,18 @@ zboot-size-len-$(CONFIG_KERNEL_ZSTD)	:= 4
 $(obj)/vmlinuz: $(obj)/vmlinux.bin FORCE
 	+$(call if_changed,$(zboot-method-y))
 
+# subtract the two symbol values to obtain the offset of struct efi_image_info
+get_image_info_offset = $(shell $(NM) -n $(objtree)/vmlinux |\
+			grep -E ' _text$$| __efistub_efistub_image_info$$' |\
+			awk 'NR == 1 { a = toupper($$1) } \
+			     NR == 2 { print "obase=16; ibase=16; " toupper($$1) "-" a }' |\
+			bc)
+
 # avoid eager evaluation to prevent references to non-existent build artifacts
 OBJCOPYFLAGS_vmlinuz.o = -I binary -O $(EFI_ZBOOT_BFD_TARGET) $(EFI_ZBOOT_OBJCOPY_FLAGS) \
-			  --rename-section .data=.gzdata,load,alloc,readonly,contents
+			 --rename-section .data=.gzdata,load,alloc,readonly,contents \
+			 --add-symbol efistub_image_info_offset=0x$(get_image_info_offset)
+
 $(obj)/vmlinuz.o: $(obj)/vmlinuz FORCE
 	$(call if_changed,objcopy)
 
diff --git a/drivers/firmware/efi/libstub/arm32-stub.c b/drivers/firmware/efi/libstub/arm32-stub.c
index 1ab15d66e709..798b2ae3bb03 100644
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@ -82,12 +82,15 @@ extern u32 input_data_end[] __aligned(1);
 /* entry #3 in the zimage magic table carries the kernel's BSS size */
 extern u32 zimage_magic_table[] asm("_table_start");
 
+struct efi_image_info efistub_image_info = {};
+
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
 				 unsigned long *reserve_addr,
 				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
-				 efi_handle_t image_handle)
+				 efi_handle_t image_handle,
+				 const struct efi_image_info **image_info)
 {
 	unsigned long kernel_memsize = input_data_end[-1] + zimage_magic_table[3];
 	const int pgdir_size = (4 + IS_ENABLED(CONFIG_ARM_LPAE)) * PAGE_SIZE;
@@ -122,6 +125,9 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 		kernel_base = round_down(alloc_base, EFI_PHYS_ALIGN);
 	}
 
+	efistub_image_info._text_offset =
+		kernel_base + TEXT_OFFSET - (u32)&efistub_image_info;
+
 	*reserve_addr = kernel_base + slack;
 	*reserve_size = alloc_size;
 
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index fe0deae78e5b..b57cccd75ab5 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -19,10 +19,9 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *reserve_addr,
 				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
-				 efi_handle_t image_handle)
+				 efi_handle_t image_handle,
+				 const struct efi_image_info **image_info)
 {
-	unsigned long kernel_size, kernel_codesize, kernel_memsize;
-
 	if (image->image_base != _text) {
 		efi_err("FIRMWARE BUG: efi_loaded_image_t::image_base has bogus value\n");
 		image->image_base = _text;
@@ -32,13 +31,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 		efi_err("FIRMWARE BUG: kernel image not aligned on %dk boundary\n",
 			SEGMENT_ALIGN >> 10);
 
-	kernel_size = _edata - _text;
-	kernel_codesize = __inittext_end - _text;
-	kernel_memsize = kernel_size + (_end - _edata);
-	*image_addr = (unsigned long)_text;
-
-	return efi_kaslr_relocate_kernel(image_addr, image_size,
-					 kernel_size, kernel_codesize, kernel_memsize,
+	return efi_kaslr_relocate_kernel(image_addr, image_size, image_info,
 					 efi_kaslr_get_phys_seed(image_handle));
 }
 
diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
index efa3ab8ad1c6..36ea6aa2cfcc 100644
--- a/drivers/firmware/efi/libstub/efi-stub-entry.c
+++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
@@ -7,22 +7,17 @@
 
 #include "efistub.h"
 
-static unsigned long kernel_image_offset;
+extern const struct efi_image_info efistub_image_info;
 
-static void *kernel_image_addr(void *addr)
-{
-	return addr + kernel_image_offset;
-}
-
-struct sysfb_display_info *alloc_primary_display(void)
+struct sysfb_display_info *
+alloc_primary_display(const struct efi_image_info *image_info)
 {
 	if (IS_ENABLED(CONFIG_ARM))
 		return __alloc_primary_display();
 
-	if (IS_ENABLED(CONFIG_X86) ||
-	    IS_ENABLED(CONFIG_EFI_EARLYCON) ||
+	if (IS_ENABLED(CONFIG_EFI_EARLYCON) ||
 	    IS_ENABLED(CONFIG_SYSFB))
-		return kernel_image_addr(&sysfb_primary_display);
+		return efistub_sysfb_display_info(image_info);
 
 	return NULL;
 }
@@ -36,6 +31,7 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 				   efi_system_table_t *systab)
 {
 	static efi_guid_t loaded_image_proto = LOADED_IMAGE_PROTOCOL_GUID;
+	const struct efi_image_info *image_info = &efistub_image_info;
 	efi_loaded_image_t *image;
 	efi_status_t status;
 	unsigned long image_addr;
@@ -72,15 +68,13 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	status = handle_kernel_image(&image_addr, &image_size,
 				     &reserve_addr,
 				     &reserve_size,
-				     image, handle);
+				     image, handle, &image_info);
 	if (status != EFI_SUCCESS) {
 		efi_err("Failed to relocate kernel\n");
 		return status;
 	}
 
-	kernel_image_offset = image_addr - (unsigned long)image->image_base;
-
-	status = efi_stub_common(handle, image, image_addr, cmdline_ptr);
+	status = efi_stub_common(handle, image, image_info, cmdline_ptr);
 
 	efi_free(image_size, image_addr);
 	efi_free(reserve_size, reserve_addr);
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index 6db10590f89b..bf9a9f53a95c 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -51,14 +51,15 @@ static bool flat_va_mapping = (EFI_RT_VIRTUAL_OFFSET != 0);
 void __weak free_primary_display(struct sysfb_display_info *dpy)
 { }
 
-static struct sysfb_display_info *setup_primary_display(void)
+static struct sysfb_display_info *
+setup_primary_display(const struct efi_image_info *image_info)
 {
 	struct sysfb_display_info *dpy;
 	struct screen_info *screen = NULL;
 	struct edid_info *edid = NULL;
 	efi_status_t status;
 
-	dpy = alloc_primary_display();
+	dpy = alloc_primary_display(image_info);
 	if (!dpy)
 		return NULL;
 	screen = &dpy->screen;
@@ -160,9 +161,10 @@ efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr)
 
 efi_status_t efi_stub_common(efi_handle_t handle,
 			     efi_loaded_image_t *image,
-			     unsigned long image_addr,
+			     const struct efi_image_info *image_info,
 			     char *cmdline_ptr)
 {
+	unsigned long image_addr = efistub_kernel_base(image_info);
 	struct sysfb_display_info *dpy;
 	efi_status_t status;
 
@@ -170,7 +172,7 @@ efi_status_t efi_stub_common(efi_handle_t handle,
 	if (status != EFI_SUCCESS)
 		return status;
 
-	dpy = setup_primary_display();
+	dpy = setup_primary_display(image_info);
 
 	efi_retrieve_eventlog();
 	efi_bli_set_variables(image);
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index 5c10815d9172..edc768a54473 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1135,6 +1135,16 @@ efi_status_t efi_load_initrd(efi_loaded_image_t *image,
 			     unsigned long soft_limit,
 			     unsigned long hard_limit,
 			     const struct linux_efi_initrd **out);
+
+struct efi_image_info {
+	s32	_text_offset;
+	s32	__inittext_end_offset;
+	s32	_edata_offset;
+	s32	_end_offset;
+	s32	entry_offset;
+	s32	sysfb_primary_display_offset;
+};
+
 /*
  * This function handles the architcture specific differences between arm and
  * arm64 regarding where the kernel image must be loaded and any memory that
@@ -1146,12 +1156,51 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *reserve_addr,
 				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
-				 efi_handle_t image_handle);
+				 efi_handle_t image_handle,
+				 const struct efi_image_info **image_info);
+
+static inline
+unsigned long efistub_kernel_base(const struct efi_image_info *image_info)
+{
+	return (unsigned long)offset_to_ptr(&image_info->_text_offset);
+}
+
+static inline
+unsigned long efistub_kernel_size(const struct efi_image_info *image_info)
+{
+	return image_info->_edata_offset - image_info->_text_offset;
+}
+
+static inline
+unsigned long efistub_kernel_memsize(const struct efi_image_info *image_info)
+{
+	return image_info->_end_offset - image_info->_text_offset;
+}
+
+static inline
+unsigned long efistub_kernel_codesize(const struct efi_image_info *image_info)
+{
+	return image_info->__inittext_end_offset - image_info->_text_offset;
+}
+
+static inline
+void *efistub_kernel_entry(const struct efi_image_info *image_info)
+{
+	return offset_to_ptr(&image_info->entry_offset);
+}
+
+static inline
+void *efistub_sysfb_display_info(const struct efi_image_info *image_info)
+{
+	auto offset = &image_info->sysfb_primary_display_offset;
+
+	return *offset ? offset_to_ptr(offset) : NULL;
+}
 
 /* shared entrypoint between the normal stub and the zboot stub */
 efi_status_t efi_stub_common(efi_handle_t handle,
 			     efi_loaded_image_t *image,
-			     unsigned long image_addr,
+			     const struct efi_image_info *image_info,
 			     char *cmdline_ptr);
 
 efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr);
@@ -1173,7 +1222,9 @@ efi_enable_reset_attack_mitigation(void) { }
 
 void efi_retrieve_eventlog(void);
 
-struct sysfb_display_info *alloc_primary_display(void);
+struct sysfb_display_info *
+alloc_primary_display(const struct efi_image_info *image_info);
+
 struct sysfb_display_info *__alloc_primary_display(void);
 void free_primary_display(struct sysfb_display_info *dpy);
 
@@ -1245,9 +1296,7 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 		     unsigned long code_size);
 efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 				       unsigned long *alloc_size,
-				       unsigned long kernel_size,
-				       unsigned long kernel_codesize,
-				       unsigned long kernel_memsize,
+				       const struct efi_image_info **image_info,
 				       u32 phys_seed);
 u32 efi_kaslr_get_phys_seed(efi_handle_t image_handle);
 
diff --git a/drivers/firmware/efi/libstub/image_info.S b/drivers/firmware/efi/libstub/image_info.S
new file mode 100644
index 000000000000..587a3eaff1c3
--- /dev/null
+++ b/drivers/firmware/efi/libstub/image_info.S
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/init.h>
+
+	__INITRODATA
+
+	.p2align	3
+	.globl		__efistub_efistub_image_info
+__efistub_efistub_image_info:
+0:	.long	_text - .
+	.long	__inittext_end - 0b
+	.long	_edata - 0b
+	.long	_end - 0b
+	.long	efi_primary_entry - .
+#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
+	.long	sysfb_primary_display - .
+#else
+	.long	0
+#endif
diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
index 49b05d0c0003..7cf68a612394 100644
--- a/drivers/firmware/efi/libstub/kaslr.c
+++ b/drivers/firmware/efi/libstub/kaslr.c
@@ -84,9 +84,7 @@ static bool check_image_region(u64 base, u64 size)
  * efi_kaslr_relocate_kernel() - Relocate the kernel (random if KASLR enabled)
  * @image_addr:		Pointer to variable carrying the image base address
  * @alloc_size:		Pointer to variable carrying the allocated size
- * @kernel_size:	Size of the text + data
- * @kernel_codesize:	Size of the text
- * @kernel_memsize:	Size of the text + data + bss
+ * @image_info:		Pointer to struct efi_image_info pointer
  * @phys_seed:		Random seed used for the relocation
  *
  * If KASLR is not enabled, this function relocates the kernel to a fixed
@@ -97,14 +95,15 @@ static bool check_image_region(u64 base, u64 size)
  */
 efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 				       unsigned long *alloc_size,
-				       unsigned long kernel_size,
-				       unsigned long kernel_codesize,
-				       unsigned long kernel_memsize,
+				       const struct efi_image_info **image_info,
 				       u32 phys_seed)
 {
-	unsigned long kernel_base = *image_addr;
+	unsigned long kernel_base	= efistub_kernel_base(*image_info);
+	unsigned long kernel_size	= efistub_kernel_size(*image_info);
+	unsigned long kernel_codesize	= efistub_kernel_codesize(*image_info);
+	unsigned long kernel_memsize	= efistub_kernel_memsize(*image_info);
+	u64 min_kimg_align		= efi_get_kimg_min_align();
 	efi_status_t status;
-	u64 min_kimg_align = efi_get_kimg_min_align();
 
 	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && phys_seed != 0) {
 		/*
@@ -148,5 +147,7 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 	efi_icache_sync(*image_addr, *image_addr + kernel_codesize);
 	efi_remap_image(*image_addr, kernel_memsize, kernel_codesize);
 
+	*(unsigned long *)image_info += *image_addr - kernel_base;
+
 	return status;
 }
diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/firmware/efi/libstub/loongarch-stub.c
index c87ac7025107..d57e3d3557a5 100644
--- a/drivers/firmware/efi/libstub/loongarch-stub.c
+++ b/drivers/firmware/efi/libstub/loongarch-stub.c
@@ -99,7 +99,8 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *reserve_addr,
 				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
-				 efi_handle_t image_handle)
+				 efi_handle_t image_handle,
+				 const struct efi_image_info **image_info)
 {
 	efi_status_t status;
 	unsigned long kernel_addr = 0;
@@ -112,6 +113,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	*image_addr = kernel_addr;
 	*image_size = kernel_asize;
 
+	*(unsigned long *)image_info += *image_addr - (unsigned long)image->image_base;
 	return status;
 }
 
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index d0fc04d21b56..e4f9723d5055 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -28,18 +28,12 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *reserve_addr,
 				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
-				 efi_handle_t image_handle)
+				 efi_handle_t image_handle,
+				 const struct efi_image_info **image_info)
 {
-	unsigned long kernel_size, kernel_codesize, kernel_memsize;
 	efi_status_t status;
 
-	kernel_size = _edata - _start;
-	kernel_codesize = __inittext_end - _start;
-	kernel_memsize = kernel_size + (_end - _edata);
-	*image_addr = (unsigned long)_start;
-
-	status = efi_kaslr_relocate_kernel(image_addr, image_size,
-					   kernel_size, kernel_codesize, kernel_memsize,
+	status = efi_kaslr_relocate_kernel(image_addr, image_size, image_info,
 					   efi_kaslr_get_phys_seed(image_handle));
 	if (status != EFI_SUCCESS)
 		efi_err("Failed to relocate kernel\n");
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index 4a5ffe164873..4cff756902ad 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -26,9 +26,18 @@ void __weak efi_cache_sync_image(unsigned long image_base,
 	// executable code loaded into memory to be safe for execution.
 }
 
-struct sysfb_display_info *alloc_primary_display(void)
+struct sysfb_display_info *
+alloc_primary_display(const struct efi_image_info *image_info)
 {
-	return __alloc_primary_display();
+	return efistub_sysfb_display_info(image_info);
+}
+
+static
+const struct efi_image_info *zboot_get_image_info(unsigned long image_base)
+{
+	extern const u32 efistub_image_info_offset;
+
+	return (void *)image_base + efistub_image_info_offset;
 }
 
 asmlinkage efi_status_t __efiapi
@@ -93,9 +102,14 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 	}
 
 	// Decompress the payload into the newly allocated buffer
-	status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
-	         efi_stub_common(handle, image, image_base, cmdline_ptr);
+	status = efi_zboot_decompress((void *)image_base, alloc_size);
+	if (status != EFI_SUCCESS)
+		goto error;
+
+	auto image_info = zboot_get_image_info(image_base);
+	status = efi_stub_common(handle, image, image_info, cmdline_ptr);
 
+error:
 	efi_free(alloc_size, image_base);
 	return status;
 }
diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
index 367907eb7d86..e1365907f805 100644
--- a/drivers/firmware/efi/libstub/zboot.lds
+++ b/drivers/firmware/efi/libstub/zboot.lds
@@ -24,6 +24,8 @@ SECTIONS
 		. = ALIGN(4);
 		__efistub_code_size = .;
 		LONG(zboot_code_size);
+		__efistub_efistub_image_info_offset = .;
+		LONG(efistub_image_info_offset);
 
 		_etext = ALIGN(4096);
 		. = _etext;
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
