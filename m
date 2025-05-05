Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B56DC3ABAA
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzoHuAEO5T/8jnqH/MFQu8rw50CY/Shg7yL4Xmvkl0E=; b=XP3+go4YPye/h2
	7XpiFhD4eIFFbROKKaYp/EMppJr0E+xc6xf47J7b49lU0LtiaoKfq2PlFvrLTKLtfy+nYPz/NT/1/
	lTab66/8hh9RRY8NEQu3XxaUNt+qg5t9ZI8XQ57HVwX0LqI+dsQ2LvhdFjNjdEl4ON1YZE3zb8yXs
	F9/WKTvCrP3YnmCYjwlOdo0xKyAmAiZyrEQhkLExBOvoJdnqU3dib8lJu+skbFRWwDBaNP3a/7FZz
	Xxf8WDaf9hWIJHcqTZzizynn+Y6qZB8SnQIaFCivxTMacqrpM91VORTiNSbzUqQB0o4IusROZ+z9C
	l7x8Hy1mek3m+mQM0vqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBy40-00000007sD5-2LM5;
	Mon, 05 May 2025 15:49:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBy11-00000007ret-0znn
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 15:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746459958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DY9wfzWLHvGzz7EOz3I1aIg4uX4Xuuhs2YE5FIpj3Gs=;
	b=UuPOCDv+u49stWDvVtkzrJlMmrFuGni2LKP/wdChldE+bVnkoJn4+yBAUR3jUQGIlz+DPy
	nQGOvqUI8+2DHjmPFkcq9zzYdmvhu2tV6ylTHnRSV/HUqgnS/cxcifW/NlaCns98sXkDYr
	ybQWG4prxxdKXw3iKCzcm9KVW4+A76c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-u066N9eaMxON1vXISMlZYg-1; Mon,
 05 May 2025 11:45:55 -0400
X-MC-Unique: u066N9eaMxON1vXISMlZYg-1
X-Mimecast-MFC-AGG-ID: u066N9eaMxON1vXISMlZYg_1746459951
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 591A41956088;
	Mon,  5 May 2025 15:45:50 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.34.28])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7FA8430001AB;
	Mon,  5 May 2025 15:45:42 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: x86@kernel.org,
	linux-efi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Jones <pjones@redhat.com>,
	Daniel Berrange <berrange@redhat.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Luca Boccassi <bluca@debian.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] x86/efi: Implement support for embedding SBAT data for x86
Date: Mon,  5 May 2025 17:45:23 +0200
Message-ID: <20250505154523.231233-3-vkuznets@redhat.com>
In-Reply-To: <20250505154523.231233-1-vkuznets@redhat.com>
References: <20250505154523.231233-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_084559_351093_F72C2FC5 
X-CRM114-Status: GOOD (  22.51  )
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

Similar to zboot architectures, implement support for embedding SBAT data
for x86. Put '.sbat' section in between '.data' and '.text' as the former
also covers '.bss' and '.pgtable' and thus must be the last one in the
file.

Note, the obsolete CRC-32 checksum (see commit 9c54baab4401 ("x86/boot:
Drop CRC-32 checksum and the build tool that generates it")) is gone and
while it would've been possible to reserve the last 4 bytes in '.sbat'
section too (like it's done today in '.data'), it seems to be a pointless
exercise: SBAT makes zero sense without a signature on the EFI binary so
'.sbat' won't be at the very end of the file anyway. Any tool which uses
the last 4 bytes of the file as a checksum is broken with signed EFI
binaries already.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 arch/x86/boot/Makefile                 |  2 +-
 arch/x86/boot/compressed/Makefile      |  5 ++++
 arch/x86/boot/compressed/sbat.S        |  7 ++++++
 arch/x86/boot/compressed/vmlinux.lds.S |  8 +++++++
 arch/x86/boot/header.S                 | 33 +++++++++++++++++++-------
 drivers/firmware/efi/Kconfig           |  2 +-
 6 files changed, 46 insertions(+), 11 deletions(-)
 create mode 100644 arch/x86/boot/compressed/sbat.S

diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 81f55da81967..5f7b52f0e7f5 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -71,7 +71,7 @@ $(obj)/vmlinux.bin: $(obj)/compressed/vmlinux FORCE
 
 SETUP_OBJS = $(addprefix $(obj)/,$(setup-y))
 
-sed-zoffset := -e 's/^\([0-9a-fA-F]*\) [a-zA-Z] \(startup_32\|efi.._stub_entry\|efi\(32\)\?_pe_entry\|input_data\|kernel_info\|_end\|_ehead\|_text\|_e\?data\|z_.*\)$$/\#define ZO_\2 0x\1/p'
+sed-zoffset := -e 's/^\([0-9a-fA-F]*\) [a-zA-Z] \(startup_32\|efi.._stub_entry\|efi\(32\)\?_pe_entry\|input_data\|kernel_info\|_end\|_ehead\|_text\|_e\?data\|_e\?sbat\|z_.*\)$$/\#define ZO_\2 0x\1/p'
 
 quiet_cmd_zoffset = ZOFFSET $@
       cmd_zoffset = $(NM) $< | sed -n $(sed-zoffset) > $@
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index fdbce022db55..1441435869cc 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -106,6 +106,11 @@ vmlinux-objs-$(CONFIG_UNACCEPTED_MEMORY) += $(obj)/mem.o
 
 vmlinux-objs-$(CONFIG_EFI) += $(obj)/efi.o
 vmlinux-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
+vmlinux-objs-$(CONFIG_EFI_SBAT) += $(obj)/sbat.o
+
+ifdef CONFIG_EFI_SBAT
+$(obj)/sbat.o: $(CONFIG_EFI_SBAT_FILE)
+endif
 
 $(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
 	$(call if_changed,ld)
diff --git a/arch/x86/boot/compressed/sbat.S b/arch/x86/boot/compressed/sbat.S
new file mode 100644
index 000000000000..838f70a997dd
--- /dev/null
+++ b/arch/x86/boot/compressed/sbat.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Embed SBAT data in the kernel.
+ */
+	.pushsection ".sbat", "a", @progbits
+	.incbin CONFIG_EFI_SBAT_FILE
+	.popsection
diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
index 3b2bc61c9408..587ce3e7c504 100644
--- a/arch/x86/boot/compressed/vmlinux.lds.S
+++ b/arch/x86/boot/compressed/vmlinux.lds.S
@@ -43,6 +43,14 @@ SECTIONS
 		*(.rodata.*)
 		_erodata = . ;
 	}
+#ifdef CONFIG_EFI_SBAT
+	.sbat : ALIGN(0x1000) {
+		_sbat = . ;
+		*(.sbat)
+		_esbat = ALIGN(0x1000);
+		. = _esbat;
+	}
+#endif
 	.data :	ALIGN(0x1000) {
 		_data = . ;
 		*(.data)
diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index b5c79f43359b..91964818bf50 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -179,15 +179,17 @@ pecompat_fstart:
 #else
 	.set	pecompat_fstart, setup_size
 #endif
-	.ascii	".text"
-	.byte	0
-	.byte	0
-	.byte	0
-	.long	ZO__data
-	.long	setup_size
-	.long	ZO__data			# Size of initialized data
-						# on disk
-	.long	setup_size
+	.ascii	".text\0\0\0"
+#ifdef CONFIG_EFI_SBAT
+	.long	ZO__sbat            		# VirtualSize
+	.long	setup_size			# VirtualAddress
+	.long	ZO__sbat			# SizeOfRawData
+#else
+	.long	ZO__data            		# VirtualSize
+	.long	setup_size			# VirtualAddress
+	.long	ZO__data			# SizeOfRawData
+#endif
+	.long	setup_size			# PointerToRawData
 	.long	0				# PointerToRelocations
 	.long	0				# PointerToLineNumbers
 	.word	0				# NumberOfRelocations
@@ -196,6 +198,19 @@ pecompat_fstart:
 		IMAGE_SCN_MEM_READ		| \
 		IMAGE_SCN_MEM_EXECUTE		# Characteristics
 
+#ifdef CONFIG_EFI_SBAT
+	.ascii ".sbat\0\0\0"
+	.long   ZO__esbat - ZO__sbat            # VirtualSize
+	.long   setup_size + ZO__sbat           # VirtualAddress
+	.long   ZO__esbat - ZO__sbat            # SizeOfRawData
+	.long   setup_size + ZO__sbat           # PointerToRawData
+
+	.long	0, 0, 0
+	.long	IMAGE_SCN_CNT_INITIALIZED_DATA	| \
+		IMAGE_SCN_MEM_READ		| \
+		IMAGE_SCN_MEM_DISCARDABLE	# Characteristics
+#endif
+
 	.ascii	".data\0\0\0"
 	.long	ZO__end - ZO__data		# VirtualSize
 	.long	setup_size + ZO__data		# VirtualAddress
diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index db8c5c03d3a2..16baa038d412 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -286,7 +286,7 @@ config EFI_SBAT
 
 config EFI_SBAT_FILE
 	string "Embedded SBAT section file path"
-	depends on EFI_ZBOOT
+	depends on EFI_ZBOOT || (EFI_STUB && X86)
 	help
 	  SBAT section provides a way to improve SecureBoot revocations of UEFI
 	  binaries by introducing a generation-based mechanism. With SBAT, older
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
