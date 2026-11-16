Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB88606A329
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gjTfRfHo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ohVs+Ehf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=e82GhYsZmGaWqkenv3yVHD/RaDh78/S+yqsgIZam+UY=; b=gjTfRfHolet17aoSyXCZA4a21k
	KydThL9fG5+S1eGA03j1IqhwgVPJ0zR1t1obVy9h5qsdhWoGm8MEHRO+9owOkubzYDSOsELMkA+Bx
	TlHhdgKZVHMu6PtSoD51u7Ui2loDZOlzwzlPvDkU57ay34ij7hnn7Tm726F7+WupS5aYKiuyzn7Ip
	hng21yYMvjHoi6zLMk5Z88uqU1FBH1Q9qlKZQw9B4+IcR+2WrtJRocjfRot4vY3S6oSAlEF3LWzxo
	ZPjjDAYf3rGOjGxoE0EUZ8AWeyDef4JjDeqbJo9NeNaUkKWqN1J88KGBLno2sgegukKzOWIA1LlK+
	CEWzxjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxgK-00000002pnb-0DMc;
	Mon, 16 Nov 2026 14:27:40 +0000
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg3-00000002pJk-2Hx5
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:27 +0000
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so2332985f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 06:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839240; x=1795444040; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W309uQy0XooJdzMwvz9qNm0IhwUCOZ7RPUmkTdvsJxY=;
        b=ohVs+EhffiPq0y0w8Jc8UM7WpXk6Nrwon7E9S/8ufpG+gh4mWq3fA1Id2RpOS2jCd9
         4AsahsnGwkqMw7WdgFqmcv6DD8XTeuEIU17dw8RWOQBBlx5r9w9O2zCmmwZYgxqMP2uW
         Y90YOa8WbrGM1GFSu6/8Zp7YYngQ810eIqnROByrnYPYAaV0xMCapjmRpuZ0ksF2olPL
         ixKxJ74I8TfFM23R+0SGFIfUNwwISktroXpgmtj+5A77tBObMi2RU7fNyTplH7M1ID1D
         5Vrb3Rglco++JuBEAk/90TB2IXYNIqu/PhhTuC4kvAVW5eegHIZZWMbabEeMJZtT/PoR
         JuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839240; x=1795444040;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W309uQy0XooJdzMwvz9qNm0IhwUCOZ7RPUmkTdvsJxY=;
        b=qjsU29huwNX0AJlEz+RIJJvgsK5ML7CBnpPCVMTnIUJeTn6YjcjwlB+6a3q6oA4z6L
         D0wPK+ZR3b1EUpOHOInmxdrm+ynSiBA4KBh2fjHyXYxBUIq6ZhsOpsDaDSqlbucRsYdL
         RU7fRMoGpK5xhdhmX7KZzMk3QhIba68vJqyNN1vi/DtFmdiq2TmbPyqM7Dya/cvpHAcE
         9H1GPQ0V+ETPT+qP+Rm8q7pkB8vhOrqMxAdSQ6RG3dsLRFVI8HZJ41+Pm5EW6jDI6ilY
         YHlvw/coeU8n43RPV0T6xSHZUqwtCO+2GqJjv27XkR7iadQ+3+mjftQCyEFnENVBH8MG
         dc7A==
X-Forwarded-Encrypted: i=1; AL+hErGkupVuypAfVt0XuZXW8Wx38TrOBarTUHhHr2yJsG4y/uIM1LNkfjjUfwUrTkB1btbvnzz+WDirb1PDFQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8FiV3ymodDhpgPOVuWfsZyGuSo3dEYceQkgqf5yv+mbeqSE1Ev
	yvmLMFmdvxuhSXWhIdSti8KEdkNsWUT4TzNbzJ/U3W28KIxXhr0Hhlpt8WEX1yzxm7E1DQ884w=
	=
X-Received: from wrnb18.prod.google.com ([2002:adf:e652:0:b0:48b:9d80:f2c3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64e4:0:b0:48f:c4fb:6bb6
 with SMTP id ffacd0b85a97d-49c70b051femr23428189f8f.12.1794839239530; Mon, 16
 Nov 2026 06:27:19 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:25 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=18119; i=ardb@kernel.org;
 h=from:subject; bh=ykE72bmdDAQg9Bz+YBYQeiUc1KfDhOTJT8FNVgBnihY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30BTuFzxNKx/fMbnTIJRSu/SteNJhjeLzK85u3Lv46
 brNngdqOkpZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBE1IwY/vD8sFK03GKzw+Gv
 VthW27aoQ6vn+VTYV0/fJ1+2xqr8uwQjw7US2b8mM79tfcDgo/uMc7PsxK+7p9o/VTO0dggwnOz cyQUA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-23-ardb+git@google.com>
Subject: [PATCH v3 06/15] efi/libstub: Capture loaded image information in
 struct efi_image_info
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062723_742663_4B5B459D 
X-CRM114-Status: GOOD (  22.80  )
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
defined here, as it refers to global symbols in vmlinux. It does not
really have a need for this either, so just define an empty struct for
it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi-header.S                |  2 +
 arch/loongarch/kernel/head.S                  |  1 +
 arch/riscv/kernel/head.S                      |  1 +
 drivers/firmware/efi/libstub/Makefile         |  1 +
 drivers/firmware/efi/libstub/Makefile.zboot   | 11 +++-
 drivers/firmware/efi/libstub/arm32-stub.c     |  5 +-
 drivers/firmware/efi/libstub/arm64-stub.c     | 17 ++++--
 drivers/firmware/efi/libstub/efi-stub-entry.c | 22 +++-----
 drivers/firmware/efi/libstub/efi-stub.c       | 10 ++--
 drivers/firmware/efi/libstub/efistub.h        | 57 ++++++++++++++++++--
 drivers/firmware/efi/libstub/image_info.S     | 19 +++++++
 drivers/firmware/efi/libstub/loongarch-stub.c |  4 +-
 drivers/firmware/efi/libstub/riscv-stub.c     |  4 +-
 drivers/firmware/efi/libstub/zboot.c          | 22 ++++++--
 drivers/firmware/efi/libstub/zboot.lds        |  2 +
 15 files changed, 145 insertions(+), 33 deletions(-)

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
index 1073dd947516..f7151a4915ba 100644
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@ -76,12 +76,15 @@ void efi_handle_post_ebs_state(void)
 		      &efi_entry_state->sctlr_after_ebs);
 }
 
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
 	const int slack = TEXT_OFFSET - 5 * PAGE_SIZE;
 	int alloc_size = MAX_UNCOMP_KERNEL_SIZE + EFI_PHYS_ALIGN;
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index 2c3869356147..c93ab8b6e9d3 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -19,9 +19,11 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *reserve_addr,
 				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
-				 efi_handle_t image_handle)
+				 efi_handle_t image_handle,
+				 const struct efi_image_info **image_info)
 {
 	unsigned long kernel_size, kernel_codesize, kernel_memsize;
+	efi_status_t status;
 
 	if (image->image_base != _text) {
 		efi_err("FIRMWARE BUG: efi_loaded_image_t::image_base has bogus value\n");
@@ -38,9 +40,16 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	*reserve_size = kernel_memsize;
 	*image_addr = (unsigned long)_text;
 
-	return efi_kaslr_relocate_kernel(image_addr, reserve_addr, reserve_size,
-					 kernel_size, kernel_codesize, kernel_memsize,
-					 efi_kaslr_get_phys_seed(image_handle));
+	status = efi_kaslr_relocate_kernel(image_addr, reserve_addr,
+					   reserve_size, kernel_size,
+					   kernel_codesize, kernel_memsize,
+					   efi_kaslr_get_phys_seed(image_handle));
+
+	if (status != EFI_SUCCESS)
+		return status;
+
+	*(unsigned long *)image_info += *image_addr - (unsigned long)_text;
+	return EFI_SUCCESS;
 }
 
 asmlinkage void primary_entry(void);
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
index f5eec8c12894..bb8e360fee7b 100644
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
index 5cbc50a814e1..0ddbe7cc8628 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -28,7 +28,8 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *reserve_addr,
 				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
-				 efi_handle_t image_handle)
+				 efi_handle_t image_handle,
+				 const struct efi_image_info **image_info)
 {
 	unsigned long kernel_size, kernel_codesize, kernel_memsize;
 	efi_status_t status;
@@ -46,6 +47,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	if (status != EFI_SUCCESS)
 		efi_err("Failed to relocate kernel\n");
 
+	*(unsigned long *)image_info += *image_addr - (unsigned long)_start;
 	return status;
 }
 
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
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
