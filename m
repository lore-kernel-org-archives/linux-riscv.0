Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095F3C4363C
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:18:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6896E61057
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6896E61057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:References:In-Reply-To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygxxg6voNvkUtfygiaNBz52WJN7ST6UXhZqMLEOjm08=; b=n2CoI7lnxl8bZN0r/b0DeF0dCS
	Z+OACsth9ZTnpZYaXCVe5qtG8kBngEOF1HeBd5kedq4AY+4Q6vn0xAiYG1d+in3cg/70JjLuigJr8
	lGHJqC/5JvcINc2sM5AGF828sGbj0wZvC73luzpQt8LhyvhZjOP5+mR416V2/S8vh3/fg4r174oXP
	8nCWMWOzWaNqnDVl2IZ/O6biyGidMYIn2S44eESESbnTPZBmrfCTRWfOh11VRnUkFAwWMkI6O3faT
	YsXprdKnFU/BFEMpDULGB/VUyEOsc/xeUYd3HW6om6iXT6QhmX2qPo5G19t6WCBqhGrLsgP8hIuQA
	mj09M7ig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLZ5-00DCW7-J2; Fri, 02 Apr 2021 15:18:27 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLYl-00DCNu-0B; Fri, 02 Apr 2021 15:18:08 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFm3NsKz9v2m3;
 Fri,  2 Apr 2021 17:18:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UqB_0D8kMq5r; Fri,  2 Apr 2021 17:18:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFm1vXmz9v2ls;
 Fri,  2 Apr 2021 17:18:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AD948BB7B;
 Fri,  2 Apr 2021 17:18:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Da56GN4Eog_p; Fri,  2 Apr 2021 17:18:06 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ABC668BB79;
 Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 86AF467989; Fri,  2 Apr 2021 15:18:05 +0000 (UTC)
Message-Id: <13fb0995a91bdbce71812794d28cb29070daf51e.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 04/20] drivers: firmware: efi: use cmdline building function
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org
Date: Fri,  2 Apr 2021 15:18:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_161807_144952_4E45584C 
X-CRM114-Status: GOOD (  17.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use cmdline building function in EFI.

EFI cannot use pr_err() and doesn't have a .init.data section,
so use the __cmdline_build() internal function and provides
both a source and a destination.

Remove the handling of too long command lines as it is handled
by the generic CMDLINE.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v4: New
---
 .../firmware/efi/libstub/efi-stub-helper.c    | 35 ++++++++++---------
 drivers/firmware/efi/libstub/efi-stub.c       | 23 +++---------
 drivers/firmware/efi/libstub/efistub.h        |  2 +-
 drivers/firmware/efi/libstub/x86-stub.c       | 18 +++-------
 4 files changed, 29 insertions(+), 49 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub-helper.c b/drivers/firmware/efi/libstub/efi-stub-helper.c
index aa8da0a49829..9f60d471d650 100644
--- a/drivers/firmware/efi/libstub/efi-stub-helper.c
+++ b/drivers/firmware/efi/libstub/efi-stub-helper.c
@@ -13,6 +13,7 @@
 #include <linux/efi.h>
 #include <linux/kernel.h>
 #include <linux/printk.h> /* For CONSOLE_LOGLEVEL_* */
+#include <linux/cmdline.h>
 #include <asm/efi.h>
 #include <asm/setup.h>
 
@@ -339,13 +340,13 @@ void efi_apply_loadoptions_quirk(const void **load_options, int *load_options_si
  * Size of memory allocated return in *cmd_line_len.
  * Returns NULL on error.
  */
-char *efi_convert_cmdline(efi_loaded_image_t *image, int *cmd_line_len)
+char *efi_convert_cmdline(efi_loaded_image_t *image)
 {
 	const u16 *s2;
-	unsigned long cmdline_addr = 0;
+	unsigned long cmdline_addr = 0, options_addr = 0;
 	int options_chars = efi_table_attr(image, load_options_size);
 	const u16 *options = efi_table_attr(image, load_options);
-	int options_bytes = 0, safe_options_bytes = 0;  /* UTF-8 bytes */
+	int options_bytes = 0;  /* UTF-8 bytes */
 	bool in_quote = false;
 	efi_status_t status;
 
@@ -354,16 +355,12 @@ char *efi_convert_cmdline(efi_loaded_image_t *image, int *cmd_line_len)
 
 	if (options) {
 		s2 = options;
-		while (options_bytes < COMMAND_LINE_SIZE && options_chars--) {
+		while (options_chars--) {
 			u16 c = *s2++;
 
 			if (c < 0x80) {
 				if (c == L'\0' || c == L'\n')
 					break;
-				if (c == L'"')
-					in_quote = !in_quote;
-				else if (!in_quote && isspace((char)c))
-					safe_options_bytes = options_bytes;
 
 				options_bytes++;
 				continue;
@@ -395,24 +392,30 @@ char *efi_convert_cmdline(efi_loaded_image_t *image, int *cmd_line_len)
 				}
 			}
 		}
-		if (options_bytes >= COMMAND_LINE_SIZE) {
-			options_bytes = safe_options_bytes;
-			efi_err("Command line is too long: truncated to %d bytes\n",
-				options_bytes);
-		}
 	}
 
 	options_bytes++;	/* NUL termination */
 
 	status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, options_bytes,
-			     (void **)&cmdline_addr);
+			     (void **)&options_addr);
 	if (status != EFI_SUCCESS)
 		return NULL;
 
-	snprintf((char *)cmdline_addr, options_bytes, "%.*ls",
+	snprintf((char *)options_addr, options_bytes, "%.*ls",
 		 options_bytes - 1, options);
 
-	*cmd_line_len = options_bytes;
+	status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, COMMAND_LINE_SIZE,
+			     (void **)&cmdline_addr);
+	if (status != EFI_SUCCESS) {
+		efi_bs_call(free_pool, (void *)options_addr);
+		return NULL;
+	}
+
+	if (!__cmdline_build((char *)cmdline_addr, (char *)options_addr))
+		efi_err("Command line is too long\n");
+
+	efi_bs_call(free_pool, (void *)cmdline_addr);
+
 	return (char *)cmdline_addr;
 }
 
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index 26e69788f27a..b79ee76f2e95 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -127,7 +127,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	unsigned long fdt_addr = 0;  /* Original DTB */
 	unsigned long fdt_size = 0;
 	char *cmdline_ptr = NULL;
-	int cmdline_size = 0;
 	efi_guid_t loaded_image_proto = LOADED_IMAGE_PROTOCOL_GUID;
 	unsigned long reserve_addr = 0;
 	unsigned long reserve_size = 0;
@@ -165,29 +164,17 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	 * protocol. We are going to copy the command line into the
 	 * device tree, so this can be allocated anywhere.
 	 */
-	cmdline_ptr = efi_convert_cmdline(image, &cmdline_size);
+	cmdline_ptr = efi_convert_cmdline(image);
 	if (!cmdline_ptr) {
 		efi_err("getting command line via LOADED_IMAGE_PROTOCOL\n");
 		status = EFI_OUT_OF_RESOURCES;
 		goto fail;
 	}
 
-	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
-	    IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
-	    cmdline_size == 0) {
-		status = efi_parse_options(CONFIG_CMDLINE);
-		if (status != EFI_SUCCESS) {
-			efi_err("Failed to parse options\n");
-			goto fail_free_cmdline;
-		}
-	}
-
-	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && cmdline_size > 0) {
-		status = efi_parse_options(cmdline_ptr);
-		if (status != EFI_SUCCESS) {
-			efi_err("Failed to parse options\n");
-			goto fail_free_cmdline;
-		}
+	status = efi_parse_options(cmdline_ptr);
+	if (status != EFI_SUCCESS) {
+		efi_err("Failed to parse options\n");
+		goto fail_free_cmdline;
 	}
 
 	efi_info("Booting Linux Kernel...\n");
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index cde0a2ef507d..2f872c48b20b 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -780,7 +780,7 @@ void efi_free(unsigned long size, unsigned long addr);
 
 void efi_apply_loadoptions_quirk(const void **load_options, int *load_options_size);
 
-char *efi_convert_cmdline(efi_loaded_image_t *image, int *cmd_line_len);
+char *efi_convert_cmdline(efi_loaded_image_t *image);
 
 efi_status_t efi_get_memory_map(struct efi_boot_memmap *map);
 
diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index 28659276b6ba..0f6a33149ef7 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -359,7 +359,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	struct setup_header *hdr;
 	void *image_base;
 	efi_guid_t proto = LOADED_IMAGE_PROTOCOL_GUID;
-	int options_size = 0;
 	efi_status_t status;
 	char *cmdline_ptr;
 
@@ -404,7 +403,7 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	hdr->type_of_loader = 0x21;
 
 	/* Convert unicode cmdline to ascii */
-	cmdline_ptr = efi_convert_cmdline(image, &options_size);
+	cmdline_ptr = efi_convert_cmdline(image);
 	if (!cmdline_ptr)
 		goto fail;
 
@@ -674,6 +673,8 @@ unsigned long efi_main(efi_handle_t handle,
 	unsigned long buffer_start, buffer_end;
 	struct setup_header *hdr = &boot_params->hdr;
 	efi_status_t status;
+	unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
+				       ((u64)boot_params->ext_cmd_line_ptr << 32));
 
 	efi_system_table = sys_table_arg;
 
@@ -735,22 +736,11 @@ unsigned long efi_main(efi_handle_t handle,
 		image_offset = 0;
 	}
 
-#ifdef CONFIG_CMDLINE_BOOL
-	status = efi_parse_options(CONFIG_CMDLINE);
+	status = efi_parse_options((char *)cmdline_paddr);
 	if (status != EFI_SUCCESS) {
 		efi_err("Failed to parse options\n");
 		goto fail;
 	}
-#endif
-	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
-		unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
-					       ((u64)boot_params->ext_cmd_line_ptr << 32));
-		status = efi_parse_options((char *)cmdline_paddr);
-		if (status != EFI_SUCCESS) {
-			efi_err("Failed to parse options\n");
-			goto fail;
-		}
-	}
 
 	/*
 	 * At this point, an initrd may already have been loaded by the
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
