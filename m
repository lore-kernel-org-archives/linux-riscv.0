Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3EEC83F05
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 17:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvXHP50B89E2C37JRed+zx7/WahFtWnY7FEShkiJaXM=; b=4q+GLlWsRK+1aC
	l+On6bgjJAXRlSesYYp94NbssSljO8/uXej95YwJ8jsfDz/MznaoB7TjJuQRST593dL3aCLotA8k4
	XukFHHJ0KqsTxy4wjYS65SMOVLbqRxIbRj5dlgvDq8RuEGZp+vXHyEhkgjD+0JrjpgHXjJxw97U4W
	7Y1BVh30EjW1rvdlp30hZh1MRRDmfIxf/WuPfWFIi0o4pODqmOv0rufY2V+N5xTXHuHXTVAsn5Ogb
	CKdOS4h1tk7ILYOxGevSDxegHDp5FnSYYZEHroTmEalA9L3LQT+M+1x/csqVrYeUuU53Z1SaTXQiA
	Hza+VgZVBhXcNXA9w4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYSmF-00000000XzQ-1ejn;
	Sun, 06 Jul 2025 17:03:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYSmC-00000000Xyw-3C3n
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 17:03:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-453608ed113so26661855e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 06 Jul 2025 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751821419; x=1752426219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0WTLrmAKToX/FjKmRyOge68VRqoCdTCVJSZGUKo8fE=;
        b=jJJj4ExqtKm/kC2LVOyNpItW5Y8oo2fJKy1OjfoUdcJ60Z8tyTUlGcti1Qfy/Xpg+N
         BkQk2JpgnADf2D8x0TYzBPzZ2vFVIAdw7cn3YSbszZWStzslhQn/GusRdVT+OOPRimKe
         RrvjiE5dNyv50fT/WWze6K5LAIvk8OdUxYx/qjC0T/jvbID1cgX1cel9d7yNPa7trnT+
         gBMortGmmExHHxy7/7JMdK4qiH9mZp7HljUnDoyLAl6eWpwpiJR5UvEMAdJKbvhnXZqA
         6RqNRdg61sKhqAYTQZzKbGM06OP+0coX1S0L7wvy5p8oSjJ8v/HBros/Cr/o+17RZykY
         2jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751821419; x=1752426219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0WTLrmAKToX/FjKmRyOge68VRqoCdTCVJSZGUKo8fE=;
        b=LVtzZg/u5KOYCyA/0LIorr1zxgq9XXlx74Ha84Wmx4teMNVDuHSXDdIHzQD4KujES6
         Kye2EAbBT9VzuyLT5oksn37THpMtOUpMdVqH/gjK/99xnG9cADEsL2ia+hqqKVEWdYaP
         N3F0DMYQqpEXmIb6/dxiTjuFUdopVm7QDe5IdfoOuQ2eHQH9okRbGfV5n1WI8Xq68lih
         NcKDVf35oHItvhEw3xVMR4wZztcNI95nktS683mryD5TUCOTUEq/5Bhi3W5UiWmMHU4x
         LY64fsdT/f9WzeKf+1BUVBavhJancYkEseXTRKGP3OS8BcwgTnowIvA6Le1jidHaiV3J
         Vdag==
X-Forwarded-Encrypted: i=1; AJvYcCXISP/He5SJ59Kk0liFed2pcXs1Wwem1AItgFNbVI+wqzU0/ohblVkJ5zGypUfujVybidZFF6dqUOvqXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIws6XRlLkW6z2wMHPmGH9pU7uVGxnVcHbDtrf0uex48gPkZs7
	gOoQ7q9/lOvarBWca08cHe/4u+pmMnpHEpOEBa0YeW8xPMRMPwn1/ycU
X-Gm-Gg: ASbGnct0l3QIg5areTbd04hmxtEC0mCyCrYOsPMZkRlfoUGUaOnqFRiwNxD/J/glsKl
	R/KvlaDL17d28Hg2HjeO0WtRCOCmFWfRKBRkfUpw8VvRoFUM7N1Y0vPZiEMRYJ5eYbDDXCJU6Ym
	VzpmOF5D3XUBRvjdyrB8DPQf+7fuvIigtKKjEQTjF+iKSXlT5GgQ42J5sXtuKjZ4qEn0/5U92RJ
	A6dIQe8hJ0yfLEo2DWdxtKtX7fxbw2jPGJ0BGDTxF43AIDJEqvskJuVfT5d95+QH+C0GdXa1La2
	oDI18sp+MDO+3S8HHW/7jFaauxFGXwxU0PCJVsT8snY9OouCO+2FanuDdPnq/+RjFGFitkk7ema
	4F7SDB66B+JM=
X-Google-Smtp-Source: AGHT+IGHFWHQO+GbaoO0dlT0Bcef1ITuKlQgI9tq9Bk/gWBH527lrwIQzFopp81WEdwMvoMCD5f2nw==
X-Received: by 2002:a05:600c:1da0:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-454b31105demr86986255e9.27.1751821418629;
        Sun, 06 Jul 2025 10:03:38 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9969a20sm117235495e9.1.2025.07.06.10.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 10:03:38 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: ardb@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	jonathan@marek.ca,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	viro@zeniv.linux.org.uk,
	gourry@gourry.net,
	ilias.apalodimas@linaro.org,
	lukas@wunner.de,
	gargaditya08@live.com,
	kees@kernel.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH v3 2/2] efi/libstub: Print uefi status code on error messages
Date: Sun,  6 Jul 2025 17:02:38 +0000
Message-ID: <20250706170245.1165-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250706165850.1090-1-khaliidcaliy@gmail.com>
References: <20250706165850.1090-1-khaliidcaliy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_100340_823722_93F7A0A2 
X-CRM114-Status: GOOD (  14.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Khalid Ali <khaliidcaliy@gmail.com>

Print the UEFI status code in error messages, particularly when
handling return values from functions that return EFI_STATUS.

This saves time, specially for debugging. It makes easy to find
status code easily.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
Some source files related to other architectures i changed it also. I
didn't able to compile, because i don't have access to those architectures.
So, i am relying test robots and reviewers for source files related to
non-x86 architectures.

Changes in v3:
  * Fix -Wuninitialized warning reported by test robot.

 drivers/firmware/efi/libstub/arm32-stub.c     |  6 ++--
 drivers/firmware/efi/libstub/efi-stub-entry.c |  4 +--
 drivers/firmware/efi/libstub/efi-stub.c       |  8 ++---
 drivers/firmware/efi/libstub/file.c           | 14 ++++----
 drivers/firmware/efi/libstub/loongarch.c      |  2 +-
 drivers/firmware/efi/libstub/pci.c            |  4 +--
 drivers/firmware/efi/libstub/random.c         |  2 +-
 drivers/firmware/efi/libstub/riscv-stub.c     |  2 +-
 drivers/firmware/efi/libstub/tpm.c            |  2 +-
 drivers/firmware/efi/libstub/x86-stub.c       | 32 +++++++++----------
 drivers/firmware/efi/libstub/zboot.c          |  4 +--
 11 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm32-stub.c b/drivers/firmware/efi/libstub/arm32-stub.c
index 1073dd947516..583be54b6b1f 100644
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@ -36,7 +36,7 @@ efi_status_t check_platform_features(void)
 			     sizeof(*efi_entry_state),
 			     (void **)&efi_entry_state);
 	if (status != EFI_SUCCESS) {
-		efi_err("allocate_pool() failed\n");
+		efi_err("allocate_pool() failed: 0x%lx\n", status);
 		return status;
 	}
 
@@ -46,7 +46,7 @@ efi_status_t check_platform_features(void)
 	status = efi_bs_call(install_configuration_table, &cpu_state_guid,
 			     efi_entry_state);
 	if (status != EFI_SUCCESS) {
-		efi_err("install_configuration_table() failed\n");
+		efi_err("install_configuration_table() failed: 0x%lx\n", status);
 		goto free_state;
 	}
 
@@ -96,7 +96,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	 */
 	status = efi_low_alloc_above(alloc_size, EFI_PAGE_SIZE, &alloc_base, 0x0);
 	if (status != EFI_SUCCESS) {
-		efi_err("Unable to allocate memory for uncompressed kernel.\n");
+		efi_err("Unable to allocate memory for uncompressed kernel: 0x%lx\n", status);
 		return status;
 	}
 
diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
index a6c049835190..bc98fdd5f11f 100644
--- a/drivers/firmware/efi/libstub/efi-stub-entry.c
+++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
@@ -54,7 +54,7 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	status = efi_bs_call(handle_protocol, handle, &loaded_image_proto,
 			     (void *)&image);
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to get loaded image protocol\n");
+		efi_err("Failed to get loaded image protocol: 0x%lx\n", status);
 		return status;
 	}
 
@@ -69,7 +69,7 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 				     &reserve_size,
 				     image, handle);
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to relocate kernel\n");
+		efi_err("Failed to relocate kernel: 0x%lx\n", status);
 		return status;
 	}
 
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index 874f63b4a383..628d4e023720 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -76,7 +76,7 @@ static void install_memreserve_table(void)
 	status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, sizeof(*rsv),
 			     (void **)&rsv);
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to allocate memreserve entry!\n");
+		efi_err("Failed to allocate memreserve entry: 0x%lx\n", status);
 		return;
 	}
 
@@ -87,7 +87,7 @@ static void install_memreserve_table(void)
 	status = efi_bs_call(install_configuration_table,
 			     &memreserve_table_guid, rsv);
 	if (status != EFI_SUCCESS)
-		efi_err("Failed to install memreserve config table!\n");
+		efi_err("Failed to install memreserve config table: 0x%lx\n", status);
 }
 
 static u32 get_supported_rt_services(void)
@@ -121,7 +121,7 @@ efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr)
 	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
 		status = efi_parse_options(cmdline);
 		if (status != EFI_SUCCESS) {
-			efi_err("Failed to parse EFI load options\n");
+			efi_err("Failed to parse EFI load options: 0x%lx\n", status);
 			return status;
 		}
 	}
@@ -131,7 +131,7 @@ efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr)
 	    cmdline[0] == 0) {
 		status = efi_parse_options(CONFIG_CMDLINE);
 		if (status != EFI_SUCCESS) {
-			efi_err("Failed to parse built-in command line\n");
+			efi_err("Failed to parse built-in command line: 0x%lx\n", status);
 			return status;
 		}
 	}
diff --git a/drivers/firmware/efi/libstub/file.c b/drivers/firmware/efi/libstub/file.c
index bd626d55dcbc..428ad4aeeb2e 100644
--- a/drivers/firmware/efi/libstub/file.c
+++ b/drivers/firmware/efi/libstub/file.c
@@ -54,14 +54,14 @@ static efi_status_t efi_open_file(efi_file_protocol_t *volume,
 	status = efi_call_proto(volume, open, &fh, fi->filename,
 				EFI_FILE_MODE_READ, 0);
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to open file: %ls\n", fi->filename);
+		efi_err("Failed to open file: %ls (0x%lx)\n", fi->filename, status);
 		return status;
 	}
 
 	info_sz = sizeof(struct finfo);
 	status = efi_call_proto(fh, get_info, &info_guid, &info_sz, fi);
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to get file info\n");
+		efi_err("Failed to get file info: 0x%lx\n", status);
 		efi_call_proto(fh, close);
 		return status;
 	}
@@ -81,13 +81,13 @@ static efi_status_t efi_open_volume(efi_loaded_image_t *image,
 	status = efi_bs_call(handle_protocol, efi_table_attr(image, device_handle),
 			     &fs_proto, (void **)&io);
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to handle fs_proto\n");
+		efi_err("Failed to handle fs_prot: 0x%lx\n", status);
 		return status;
 	}
 
 	status = efi_call_proto(io, open_volume, fh);
 	if (status != EFI_SUCCESS)
-		efi_err("Failed to open volume\n");
+		efi_err("Failed to open volume: 0x%lx\n", status);
 
 	return status;
 }
@@ -170,7 +170,7 @@ static efi_status_t efi_open_device_path(efi_file_protocol_t **volume,
 
 	status = efi_call_proto(io, open_volume, volume);
 	if (status != EFI_SUCCESS)
-		efi_err("Failed to open volume\n");
+		efi_err("Failed to open volume: 0x%lx\n", status);
 
 	return status;
 }
@@ -275,7 +275,7 @@ do_builtin:	cmdline	    = builtin_cmdline;
 							    &alloc_addr,
 							    hard_limit);
 			if (status != EFI_SUCCESS) {
-				efi_err("Failed to allocate memory for files\n");
+				efi_err("Failed to allocate memory for files: 0x%lx\n", status);
 				goto err_close_file;
 			}
 
@@ -299,7 +299,7 @@ do_builtin:	cmdline	    = builtin_cmdline;
 
 			status = efi_call_proto(file, read, &chunksize, addr);
 			if (status != EFI_SUCCESS) {
-				efi_err("Failed to read file\n");
+				efi_err("Failed to read file: 0x%lx\n", status);
 				goto err_close_file;
 			}
 			addr += chunksize;
diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
index 3782d0a187d1..53b297a6613e 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -55,7 +55,7 @@ efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
 
 	status = efi_alloc_virtmap(&priv.runtime_map, &desc_size, &desc_ver);
 	if (status != EFI_SUCCESS) {
-		efi_err("Unable to retrieve UEFI memory map.\n");
+		efi_err("Unable to retrieve UEFI memory map: 0x%lx\n", status);
 		return status;
 	}
 
diff --git a/drivers/firmware/efi/libstub/pci.c b/drivers/firmware/efi/libstub/pci.c
index 1dccf77958d3..8cfffe1942ab 100644
--- a/drivers/firmware/efi/libstub/pci.c
+++ b/drivers/firmware/efi/libstub/pci.c
@@ -25,7 +25,7 @@ void efi_pci_disable_bridge_busmaster(void)
 	status = efi_bs_call(locate_handle_buffer, EFI_LOCATE_BY_PROTOCOL,
 			     &pci_proto, NULL, &pci_handle_num, &pci_handle);
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to locate PCI I/O handles\n");
+		efi_err("Failed to locate PCI I/O handles: 0x%lx\n", status);
 		return;
 	}
 
@@ -89,6 +89,6 @@ void efi_pci_disable_bridge_busmaster(void)
 		status = efi_call_proto(pci, pci.write, EfiPciIoWidthUint16,
 					PCI_COMMAND, 1, &command);
 		if (status != EFI_SUCCESS)
-			efi_err("Failed to disable PCI busmastering\n");
+			efi_err("Failed to disable PCI busmastering: 0x%lx\n", status);
 	}
 }
diff --git a/drivers/firmware/efi/libstub/random.c b/drivers/firmware/efi/libstub/random.c
index 7109b8a2dcba..b9849997bb28 100644
--- a/drivers/firmware/efi/libstub/random.c
+++ b/drivers/firmware/efi/libstub/random.c
@@ -106,7 +106,7 @@ efi_status_t efi_random_get_seed(void)
 			     struct_size(seed, bits, seed_size),
 			     (void **)&seed);
 	if (status != EFI_SUCCESS) {
-		efi_warn("Failed to allocate memory for RNG seed.\n");
+		efi_warn("Failed to allocate memory for RNG seed: 0x%lx\n", status);
 		goto err_warn;
 	}
 
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index e7d9204baee3..7859c950ca51 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -45,7 +45,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 					   kernel_size, kernel_codesize, kernel_memsize,
 					   efi_kaslr_get_phys_seed(image_handle));
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to relocate kernel\n");
+		efi_err("Failed to relocate kernel: 0x%lx\n", status);
 		*image_size = 0;
 	}
 
diff --git a/drivers/firmware/efi/libstub/tpm.c b/drivers/firmware/efi/libstub/tpm.c
index a5c6c4f163fc..ea7ab420c9cf 100644
--- a/drivers/firmware/efi/libstub/tpm.c
+++ b/drivers/firmware/efi/libstub/tpm.c
@@ -100,7 +100,7 @@ static void efi_retrieve_tcg2_eventlog(int version, efi_physical_addr_t log_loca
 			     sizeof(*log_tbl) + log_size, (void **)&log_tbl);
 
 	if (status != EFI_SUCCESS) {
-		efi_err("Unable to allocate memory for event log\n");
+		efi_err("Unable to allocate memory for event log: 0x%lx\n", status);
 		return;
 	}
 
diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index 13d8eba06e4b..aae3b7456759 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -65,7 +65,7 @@ preserve_pci_rom_image(efi_pci_io_protocol_t *pci, struct pci_setup_rom **__rom)
 	status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, size,
 			     (void **)&rom);
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to allocate memory for 'rom'\n");
+		efi_err("Failed to allocate memory for 'rom' 0x%lx\n", status);
 		return status;
 	}
 
@@ -80,7 +80,7 @@ preserve_pci_rom_image(efi_pci_io_protocol_t *pci, struct pci_setup_rom **__rom)
 				PCI_VENDOR_ID, 1, &rom->vendor);
 
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to read rom->vendor\n");
+		efi_err("Failed to read rom->vendor: 0x%lx\n", status);
 		return status;
 	}
 
@@ -88,7 +88,7 @@ preserve_pci_rom_image(efi_pci_io_protocol_t *pci, struct pci_setup_rom **__rom)
 				PCI_DEVICE_ID, 1, &rom->devid);
 
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to read rom->devid\n");
+		efi_err("Failed to read rom->devid: 0x%lx\n", status);
 		return status;
 	}
 
@@ -179,7 +179,7 @@ static void retrieve_apple_device_properties(struct boot_params *boot_params)
 				     size + sizeof(struct setup_data),
 				     (void **)&new);
 		if (status != EFI_SUCCESS) {
-			efi_err("Failed to allocate memory for 'properties'\n");
+			efi_err("Failed to allocate memory for 'properties': 0x%lx\n", status);
 			return;
 		}
 
@@ -254,14 +254,14 @@ static void apple_set_os(void)
 	if (set_os->version >= 2) {
 		status = set_os->set_os_vendor("Apple Inc.");
 		if (status != EFI_SUCCESS)
-			efi_err("Failed to set OS vendor via apple_set_os\n");
+			efi_err("Failed to set OS vendor via apple_set_os: 0x%lx\n", status);
 	}
 
 	if (set_os->version > 0) {
 		/* The version being set doesn't seem to matter */
 		status = set_os->set_os_version("Mac OS X 10.9");
 		if (status != EFI_SUCCESS)
-			efi_err("Failed to set OS version via apple_set_os\n");
+			efi_err("Failed to set OS version via apple_set_os: 0x%lx\n", status);
 	}
 }
 
@@ -283,7 +283,7 @@ efi_status_t efi_adjust_memory_range_protection(unsigned long start,
 					rounded_end - rounded_start,
 					EFI_MEMORY_RO);
 		if (status != EFI_SUCCESS) {
-			efi_warn("Failed to set EFI_MEMORY_RO attribute\n");
+			efi_warn("Failed to set EFI_MEMORY_RO attribute: 0x%lx\n", status);
 			return status;
 		}
 
@@ -292,7 +292,7 @@ efi_status_t efi_adjust_memory_range_protection(unsigned long start,
 					rounded_end - rounded_start,
 					EFI_MEMORY_XP);
 		if (status != EFI_SUCCESS)
-			efi_warn("Failed to clear EFI_MEMORY_XP attribute\n");
+			efi_warn("Failed to clear EFI_MEMORY_XP attribute: 0x%lx\n", status);
 		return status;
 	}
 
@@ -361,7 +361,7 @@ static void setup_unaccepted_memory(void)
 
 	status = efi_call_proto(proto, allow_unaccepted_memory);
 	if (status != EFI_SUCCESS)
-		efi_err("Memory acceptance protocol failed\n");
+		efi_err("Memory acceptance protocol failed: 0x%lx\n", status);
 }
 
 static efi_char16_t *efistub_fw_vendor(void)
@@ -414,7 +414,7 @@ static efi_status_t efi_allocate_bootparams(efi_handle_t handle,
 
 	status = efi_bs_call(handle_protocol, handle, &proto, (void **)&image);
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to get handle for LOADED_IMAGE_PROTOCOL\n");
+		efi_err("Failed to get handle for LOADED_IMAGE_PROTOCOL: 0x%lx\n", status);
 		return status;
 	}
 
@@ -846,14 +846,14 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 
 	status = efi_setup_5level_paging();
 	if (status != EFI_SUCCESS) {
-		efi_err("efi_setup_5level_paging() failed!\n");
+		efi_err("efi_setup_5level_paging() failed: 0x%lx\n", status);
 		goto fail;
 	}
 
 #ifdef CONFIG_CMDLINE_BOOL
 	status = parse_options(CONFIG_CMDLINE);
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to parse options\n");
+		efi_err("Failed to parse options: 0x%lx\n", status);
 		goto fail;
 	}
 #endif
@@ -862,7 +862,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 					       ((u64)boot_params->ext_cmd_line_ptr << 32));
 		status = parse_options((char *)cmdline_paddr);
 		if (status != EFI_SUCCESS) {
-			efi_err("Failed to parse options\n");
+			efi_err("Failed to parse options: 0x%lx\n", status);
 			goto fail;
 		}
 	}
@@ -872,7 +872,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 
 	status = efi_decompress_kernel(&kernel_entry, boot_params);
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to decompress kernel\n");
+		efi_err("Failed to decompress kernel: 0x%lx\n", status);
 		goto fail;
 	}
 
@@ -921,7 +921,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 
 	status = exit_boot(boot_params, handle);
 	if (status != EFI_SUCCESS) {
-		efi_err("exit_boot() failed!\n");
+		efi_err("exit_boot() failed: 0x%lx\n", status);
 		goto fail;
 	}
 
@@ -935,7 +935,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 
 	enter_kernel(kernel_entry, boot_params);
 fail:
-	efi_err("efi_stub_entry() failed!\n");
+	efi_err("efi_stub_entry() failed: 0x%lx\n", status);
 
 	efi_exit(handle, status);
 }
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index c47ace06f010..f7e7f68fea02 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -44,7 +44,7 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 	status = efi_bs_call(handle_protocol, handle,
 			     &LOADED_IMAGE_PROTOCOL_GUID, (void **)&image);
 	if (status != EFI_SUCCESS) {
-		efi_err("Failed to locate parent's loaded image protocol\n");
+		efi_err("Failed to locate parent's loaded image protocol 0x%lx\n", status);
 		return status;
 	}
 
@@ -86,7 +86,7 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 		status = efi_random_alloc(alloc_size, min_kimg_align, &image_base,
 					  seed, EFI_LOADER_CODE, 0, EFI_ALLOC_LIMIT);
 		if (status != EFI_SUCCESS) {
-			efi_err("Failed to allocate memory\n");
+			efi_err("Failed to allocate memory: 0x%lx\n", status);
 			return status;
 		}
 	}
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
