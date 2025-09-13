Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17FACAC582
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sxy/do6BBEHIeMpdSs0LCYtBEQgGFPuAZN+nqxnPzZM=; b=QYTJhE00dAAYCo
	g9w4q8ddjvJtvZz0sV+CNI8pVr4aFmTeleNimYCVHyEI6HlfiKVEzRkom4leoHCQZBRUsA+V3boHM
	z1hKkbT2zUvVWCBccLaPsOJsa0ehbUb8XfAug08Jfwy98Uu4jldpzjtRb/7/ARngCNQZkz0Yu1qFq
	EIYcxB8CweQQiVcbf+p/DviBdiG/Df1KKkIvY3lHodsZKtSwlml8tvnBZi7VX5jFfMwHhNr4sBrVl
	l/uCanFIpF6W9WcMufE8bv8MNEox2w3/BkED8Xgd3lBIvarL7gXuQT0g7o5j08suhYJf+Ue6BWRnP
	MSGn3Gevqn5FMO86HsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEjd-0000000CWDp-2mGp;
	Sat, 13 Sep 2025 01:07:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEja-0000000CWAr-1EGD
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:07:23 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b04271cfc3eso313029266b.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 18:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725640; x=1758330440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TddlkftgluMc/5OOjsTCfHjiuASJR5DkmoxCxqoFSk=;
        b=H50XMFHR08bcNcJp44b+AxuYhoZCf/lh1c+U9uGCY09C4paa4ItFG4OXmDlnTRsAH0
         zGBxAUj8mdMO0DKwuMXRrdjLIJ9C8srJaXDi5f2qAmAyKrqaEsb+YvhmbATudzbbBm22
         BMkYH6riPNadmd5ptLhs3DfzRGdEI0n200ZoLZIeNqHktA+V4DZIvlzm5L2IrvXsitB9
         dBeUGcUKwK/yoFn3ZVeGeOJgPF52oxMB5LK4k63AKUYUPr3ZEodCmQgF41QlSqD0Ih2v
         UgSYv9BgqUyiftxxyIfiu5g6sWxC+PvKLxgVc0Z3BYNOhhX3iUfzNemNmm4kKHC2v2jH
         acHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725640; x=1758330440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TddlkftgluMc/5OOjsTCfHjiuASJR5DkmoxCxqoFSk=;
        b=BQiAHY1qumfYehFvECs5lu1oW2fR7IvLQrY8iyaStQAKsiOQRGF/e9DT9+U+5C2iaV
         3X5OoZYMLLEyu/sZPShxoyYhKG2L7s332Z8JXgHkNIpnxe4zZXTgbxzO3wgFyY7MJTG9
         krbsVxWaFtwt5W5gjGyGR8iRlfTdPTPVpv6n/tJqtHGwlg9QaDr/u3fFco3Nlm5XvDuo
         N4ibj1Lm7GmB5sV63ceiYfI/Vnn9Ses0XRijzViIxkvdruVmhO0KUQO9bCug1HozY/9d
         Yn4HiZAiDe/pW53v1chmSUOJ/7o1QvAY7GVqkKpzcWp5KSWm/5ks5AO8+gpENUtP6+Qa
         yS8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkwvuWwXNc5sjiFeEq0KsA7c1ZfhjFmzP2M8B2CKIR4eL8Vd+P75Neldlp8Td+d+gLfPUEpomrktBm4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yznh6H7yQ7/tBF6781nL7XPA/RPInvUCg3swJugslYcr24PUkLd
	qx4KeRN88naAAU3SBmEzvxiBpBk7XgDUfhhgw0f28acYhqUkuiItzGhk
X-Gm-Gg: ASbGncuoCt2UMzqTqbtZYtq7/J9dFSP/Ckurts4OZcoJ52AiDEwZWlosJswTWKFyLUz
	+t47BFcWpviV5upl9eJGCHtnsXBTab2svTe0myU225/sUKU7OnEI5s36CVnXzKydVvYnhxojQ0T
	yOvcLe1hUH1RF48gxOxpZHJ36c3MSMPvC7HVhOW+gJEXGCVVhDw8RWxrqZRDqr1RnnKBZGY1ThD
	qZqP89rizs2oaU4t+IOxCY3lfx6xdWPlMFdrl3W+fF/vFKbiaOB/a9tPKm+CT5y4hJ3WDzxV2FU
	/27c4E4fS/Baa7RCaUhqvVyRmRS1DpIFDDINTXViu5/iDixGW/mQX7jkgcmLV09Fse8FqTmfG7c
	axgWAoIAViMbxYW0L2cY=
X-Google-Smtp-Source: AGHT+IEPa147nGJmvgvWkKDBP00lWIElqeQkHe249MsG+HewIQaHxDJ7wNuN9LkOMWVT9BrK9W88lg==
X-Received: by 2002:a17:906:d185:b0:b07:de95:1c70 with SMTP id a640c23a62f3a-b07de9543bdmr137566766b.31.1757725640067;
        Fri, 12 Sep 2025 18:07:20 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b334e720sm472168266b.104.2025.09.12.18.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:07:19 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 25/62] init: rename phys_initrd_{start,size} to phys_external_initramfs_{start,size}
Date: Sat, 13 Sep 2025 00:38:04 +0000
Message-ID: <20250913003842.41944-26-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_180722_392565_C6D93828 
X-CRM114-Status: GOOD (  24.35  )
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

Rename phys_initrd_start to phys_external_initramfs_start and
phys_initrd_size to phys_external_initramfs_size.

They refer to initramfs, not to initrd

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arc/mm/init.c         |  8 ++++----
 arch/arm/mm/init.c         |  8 ++++----
 arch/arm64/mm/init.c       | 15 ++++++++-------
 arch/x86/kernel/setup.c    |  4 ++--
 drivers/firmware/efi/efi.c |  6 +++---
 drivers/of/fdt.c           |  8 ++++----
 include/linux/initrd.h     |  4 ++--
 init/do_mounts_initrd.c    |  8 ++++----
 init/initramfs.c           | 10 +++++-----
 9 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index a73cc94f806e..eb8a616a63c6 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -110,10 +110,10 @@ void __init setup_arch_memory(void)
 			 __pa(_end) - CONFIG_LINUX_LINK_BASE);
 
 #ifdef CONFIG_BLK_DEV_INITRD
-	if (phys_initrd_size) {
-		memblock_reserve(phys_initrd_start, phys_initrd_size);
-		initrd_start = (unsigned long)__va(phys_initrd_start);
-		initrd_end = initrd_start + phys_initrd_size;
+	if (phys_external_initramfs_size) {
+		memblock_reserve(phys_external_initramfs_start, phys_external_initramfs_size);
+		initrd_start = (unsigned long)__va(phys_external_initramfs_start);
+		initrd_end = initrd_start + phys_external_initramfs_size;
 	}
 #endif
 
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 54bdca025c9f..93f8010b9115 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -55,8 +55,8 @@ static int __init parse_tag_initrd(const struct tag *tag)
 {
 	pr_warn("ATAG_INITRD is deprecated; "
 		"please update your bootloader.\n");
-	phys_initrd_start = __virt_to_phys(tag->u.initrd.start);
-	phys_initrd_size = tag->u.initrd.size;
+	phys_external_initramfs_start = __virt_to_phys(tag->u.initrd.start);
+	phys_external_initramfs_size = tag->u.initrd.size;
 	return 0;
 }
 
@@ -64,8 +64,8 @@ __tagtable(ATAG_INITRD, parse_tag_initrd);
 
 static int __init parse_tag_initrd2(const struct tag *tag)
 {
-	phys_initrd_start = tag->u.initrd.start;
-	phys_initrd_size = tag->u.initrd.size;
+	phys_external_initramfs_start = tag->u.initrd.start;
+	phys_external_initramfs_size = tag->u.initrd.size;
 	return 0;
 }
 
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index ea84a61ed508..da517edcf824 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -246,14 +246,15 @@ void __init arm64_memblock_init(void)
 		memblock_add(__pa_symbol(_text), (u64)(_end - _text));
 	}
 
-	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && phys_initrd_size) {
+	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && phys_external_initramfs_size) {
 		/*
 		 * Add back the memory we just removed if it results in the
 		 * initrd to become inaccessible via the linear mapping.
 		 * Otherwise, this is a no-op
 		 */
-		u64 base = phys_initrd_start & PAGE_MASK;
-		u64 size = PAGE_ALIGN(phys_initrd_start + phys_initrd_size) - base;
+		u64 base = phys_external_initramfs_start & PAGE_MASK;
+		u64 size = PAGE_ALIGN(phys_external_initramfs_start +
+			phys_external_initramfs_size) - base;
 
 		/*
 		 * We can only add back the initrd memory if we don't end up
@@ -267,7 +268,7 @@ void __init arm64_memblock_init(void)
 			 base + size > memblock_start_of_DRAM() +
 				       linear_region_size,
 			"initrd not fully accessible via the linear mapping -- please check your bootloader ...\n")) {
-			phys_initrd_size = 0;
+			phys_external_initramfs_size = 0;
 		} else {
 			memblock_add(base, size);
 			memblock_clear_nomap(base, size);
@@ -280,10 +281,10 @@ void __init arm64_memblock_init(void)
 	 * pagetables with memblock.
 	 */
 	memblock_reserve(__pa_symbol(_stext), _end - _stext);
-	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && phys_initrd_size) {
+	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && phys_external_initramfs_size) {
 		/* the generic initrd code expects virtual addresses */
-		initrd_start = __phys_to_virt(phys_initrd_start);
-		initrd_end = initrd_start + phys_initrd_size;
+		initrd_start = __phys_to_virt(phys_external_initramfs_start);
+		initrd_end = initrd_start + phys_external_initramfs_size;
 	}
 
 	early_init_fdt_scan_reserved_mem();
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 797c3c9fc75e..e727c7a7f648 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -297,7 +297,7 @@ static u64 __init get_ramdisk_image(void)
 	ramdisk_image |= (u64)boot_params.ext_ramdisk_image << 32;
 
 	if (ramdisk_image == 0)
-		ramdisk_image = phys_initrd_start;
+		ramdisk_image = phys_external_initramfs_start;
 
 	return ramdisk_image;
 }
@@ -308,7 +308,7 @@ static u64 __init get_ramdisk_size(void)
 	ramdisk_size |= (u64)boot_params.ext_ramdisk_size << 32;
 
 	if (ramdisk_size == 0)
-		ramdisk_size = phys_initrd_size;
+		ramdisk_size = phys_external_initramfs_size;
 
 	return ramdisk_size;
 }
diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 1ce428e2ac8a..7cab72da2ea9 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -808,13 +808,13 @@ int __init efi_config_parse_tables(const efi_config_table_t *config_tables,
 	}
 
 	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) &&
-	    initrd != EFI_INVALID_TABLE_ADDR && phys_initrd_size == 0) {
+	    initrd != EFI_INVALID_TABLE_ADDR && phys_external_initramfs_size == 0) {
 		struct linux_efi_initrd *tbl;
 
 		tbl = early_memremap(initrd, sizeof(*tbl));
 		if (tbl) {
-			phys_initrd_start = tbl->base;
-			phys_initrd_size = tbl->size;
+			phys_external_initramfs_start = tbl->base;
+			phys_external_initramfs_size = tbl->size;
 			early_memunmap(tbl, sizeof(*tbl));
 		}
 	}
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 0edd639898a6..9c4c9be948c5 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -760,8 +760,8 @@ static void __early_init_dt_declare_initrd(unsigned long start,
 {
 	/*
 	 * __va() is not yet available this early on some platforms. In that
-	 * case, the platform uses phys_initrd_start/phys_initrd_size instead
-	 * and does the VA conversion itself.
+	 * case, the platform uses phys_external_initramfs_start/phys_external_initramfs_size
+	 * instead and does the VA conversion itself.
 	 */
 	if (!IS_ENABLED(CONFIG_ARM64) &&
 	    !(IS_ENABLED(CONFIG_RISCV) && IS_ENABLED(CONFIG_64BIT))) {
@@ -799,8 +799,8 @@ static void __init early_init_dt_check_for_initrd(unsigned long node)
 		return;
 
 	__early_init_dt_declare_initrd(start, end);
-	phys_initrd_start = start;
-	phys_initrd_size = end - start;
+	phys_external_initramfs_start = start;
+	phys_external_initramfs_size = end - start;
 
 	pr_debug("initrd_start=0x%llx  initrd_end=0x%llx\n", start, end);
 }
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 4080ba82d4c9..23c08e88234c 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -17,8 +17,8 @@ static inline void __init reserve_initrd_mem(void) {}
 static inline void wait_for_initramfs(void) {}
 #endif
 
-extern phys_addr_t phys_initrd_start;
-extern unsigned long phys_initrd_size;
+extern phys_addr_t phys_external_initramfs_start;
+extern unsigned long phys_external_initramfs_size;
 
 extern char __builtin_initramfs_start[];
 extern unsigned long __builtin_initramfs_size;
diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index d5264e9a52e0..444182a76999 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -15,8 +15,8 @@
 unsigned long initrd_start, initrd_end;
 int initrd_below_start_ok;
 
-phys_addr_t phys_initrd_start __initdata;
-unsigned long phys_initrd_size __initdata;
+phys_addr_t phys_external_initramfs_start __initdata;
+unsigned long phys_external_initramfs_size __initdata;
 
 static int __init early_initrdmem(char *p)
 {
@@ -28,8 +28,8 @@ static int __init early_initrdmem(char *p)
 	if (*endp == ',') {
 		size = memparse(endp + 1, NULL);
 
-		phys_initrd_start = start;
-		phys_initrd_size = size;
+		phys_external_initramfs_start = start;
+		phys_external_initramfs_size = size;
 	}
 	return 0;
 }
diff --git a/init/initramfs.c b/init/initramfs.c
index 2866d7a0afd7..6abe0a3ca4ce 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -610,7 +610,7 @@ void __init reserve_initrd_mem(void)
 	/* Ignore the virtul address computed during device tree parsing */
 	initrd_start = initrd_end = 0;
 
-	if (!phys_initrd_size)
+	if (!phys_external_initramfs_size)
 		return;
 	/*
 	 * Round the memory region to page boundaries as per free_initrd_mem()
@@ -618,8 +618,8 @@ void __init reserve_initrd_mem(void)
 	 * are in use, but more importantly, reserves the entire set of pages
 	 * as we don't want these pages allocated for other purposes.
 	 */
-	start = round_down(phys_initrd_start, PAGE_SIZE);
-	size = phys_initrd_size + (phys_initrd_start - start);
+	start = round_down(phys_external_initramfs_start, PAGE_SIZE);
+	size = phys_external_initramfs_size + (phys_external_initramfs_start - start);
 	size = round_up(size, PAGE_SIZE);
 
 	if (!memblock_is_region_memory(start, size)) {
@@ -636,8 +636,8 @@ void __init reserve_initrd_mem(void)
 
 	memblock_reserve(start, size);
 	/* Now convert initrd to virtual addresses */
-	initrd_start = (unsigned long)__va(phys_initrd_start);
-	initrd_end = initrd_start + phys_initrd_size;
+	initrd_start = (unsigned long)__va(phys_external_initramfs_start);
+	initrd_end = initrd_start + phys_external_initramfs_size;
 	initrd_below_start_ok = 1;
 
 	return;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
