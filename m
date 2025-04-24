Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B87C369D1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3WX5bnY3K2B+TfuFQVC0DY73/nltcsX1lJzXPziroA=; b=BlTqjaCAkcaxEb
	ZrjmGZ7Hsa2YtxI36WrD/rgp9BddmmgLhl+fl4xffpcZbfavvBeqrE1dKdmhoF57swbx/eEIfyWjp
	uc5NlrU4YAFi1x2Hf6Za21JW1CYe9BBV8UfBRqd/agC1zSOccskNV4DtjF+aujrEUbvWm0YrnSS58
	Qn0eck71QvXzu6Wx4EDGAbCUPNerkLrdnCS3cnUV+Pocz3c95bPw5J6Zlug2UveVF36q+2ty6ggTd
	fUMtgSxb6Hs3ZNA88TQjebaioWr4vhhe4RTjtmVs6anvc4u1RSYxfqXti/Y/iZz6C2Ux9KRhJaot3
	cGmPWLm0zn/2SmhJKLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7smi-0000000DTxU-1taS;
	Thu, 24 Apr 2025 09:22:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rgp-0000000DIHy-1hU7
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=90i0OCg6Zt5Z8sKdLwCV2r9r1JKdc4QuwHkOEn9E9Jg=; b=E+Zax7JTAYNBSpWshcg3cjKxvD
	LrF0BzfSZsQbuv47VWvC/g8DHW295nOXxLlglwiJ2FNWh9H0fvYcUVN20Ud6Y+0MFVMgy7pSuDg42
	DTTsugts/rr+BQlmhYQEBFlT13GtC5az38pI5/sf+kqUc7GVRdL8TdTRZhnhEYpeOLGC3CPLvK38c
	W5tHx1HmqRHG1n7UmDBr5M2PDubq+sIR8K5KEEa6ZjZI/I8QVu1FynV6Y9k2J2EO5JRV5P44taxxP
	q9YL9/Coylz2iuwYJcfwePmQ3ra8bADgcSd9/wCzAGAW7VLGyGG7iwabTAttYizdPN20LjwRd+7su
	MOY7TS1g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7rgm-0000000BbYm-1UfT
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 08:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745482326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90i0OCg6Zt5Z8sKdLwCV2r9r1JKdc4QuwHkOEn9E9Jg=;
	b=AJu6+lgC2jjs+pKKrS28AeLl6sV1Ma0gOBI63xTA7hRmIPKSWTnHJyYRakFPZppb3w2dO6
	N+nGA28WMKdoKAqYo0b+q7El4MblWfSm2Yi4JQaz0JJ8aZ4pD7iMQlVmgKJxoujp41ZsxU
	TNjGhitEEO24OJ05bK+rsBzmN4qKXcs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745482327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90i0OCg6Zt5Z8sKdLwCV2r9r1JKdc4QuwHkOEn9E9Jg=;
	b=UW5UC2t0UTOVQRQQaKmojLnz3GoxXyWh7Y/bmOEc4c04SRaa+kVFiqcMtEJCAZaxBBFerA
	Qe8UEnLZ6vlgalxaew7R5xjn5kEdXJuNE84uZ6dIWR1vBkGr6oAw++4wlCJUnIJFsNBRFJ
	abMXBL9wNnPfw44R1IPqErzUAFpcBFw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-3RHKMFU5PVm64rDqCSspaA-1; Thu,
 24 Apr 2025 04:10:42 -0400
X-MC-Unique: 3RHKMFU5PVm64rDqCSspaA-1
X-Mimecast-MFC-AGG-ID: 3RHKMFU5PVm64rDqCSspaA_1745482240
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5FC2219560BA;
	Thu, 24 Apr 2025 08:10:39 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.224.198])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B3B5B30001A2;
	Thu, 24 Apr 2025 08:10:25 +0000 (UTC)
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
Subject: [PATCH 2/2] x86/efi: Implement support for embedding SBAT data for x86
Date: Thu, 24 Apr 2025 12:09:50 +0400
Message-ID: <20250424080950.289864-3-vkuznets@redhat.com>
In-Reply-To: <20250424080950.289864-1-vkuznets@redhat.com>
References: <20250424080950.289864-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_091208_644673_2B06C347 
X-CRM114-Status: GOOD (  17.46  )
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
for x86. Put '.sbat' section to the very end of the binary.

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
 arch/x86/boot/compressed/Makefile      |  2 ++
 arch/x86/boot/compressed/vmlinux.lds.S | 13 +++++++++++++
 arch/x86/boot/header.S                 | 13 +++++++++++++
 drivers/firmware/efi/Kconfig           |  2 +-
 5 files changed, 30 insertions(+), 2 deletions(-)

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
index fdbce022db55..b9b80eccdc02 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -107,6 +107,8 @@ vmlinux-objs-$(CONFIG_UNACCEPTED_MEMORY) += $(obj)/mem.o
 vmlinux-objs-$(CONFIG_EFI) += $(obj)/efi.o
 vmlinux-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
 
+vmlinux-objs-$(CONFIG_EFI_SBAT) += $(objtree)/drivers/firmware/efi/libstub/sbat.o
+
 $(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
 	$(call if_changed,ld)
 
diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
index 3b2bc61c9408..d0a27905de90 100644
--- a/arch/x86/boot/compressed/vmlinux.lds.S
+++ b/arch/x86/boot/compressed/vmlinux.lds.S
@@ -49,9 +49,22 @@ SECTIONS
 		*(.data.*)
 
 		/* Add 4 bytes of extra space for the obsolete CRC-32 checksum */
+#ifndef CONFIG_EFI_SBAT
 		. = ALIGN(. + 4, 0x200);
+#else
+		/* Avoid gap between '.data' and '.sbat' */
+		. = ALIGN(. + 4, 0x1000);
+#endif
 		_edata = . ;
 	}
+#ifdef CONFIG_EFI_SBAT
+	.sbat : ALIGN(0x1000) {
+		_sbat = . ;
+		*(.sbat)
+		_esbat = ALIGN(0x200);
+		. = _esbat;
+	}
+#endif
 	. = ALIGN(L1_CACHE_BYTES);
 	.bss : {
 		_bss = . ;
diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index b5c79f43359b..ab851490ef74 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -207,6 +207,19 @@ pecompat_fstart:
 		IMAGE_SCN_MEM_READ		| \
 		IMAGE_SCN_MEM_WRITE		# Characteristics
 
+#ifdef CONFIG_EFI_SBAT
+	.ascii ".sbat\0\0\0"
+	.long	ZO__esbat - ZO__sbat		# VirtualSize
+	.long	setup_size + ZO__sbat		# VirtualAddress
+	.long	ZO__esbat - ZO__sbat		# SizeOfRawData
+	.long	setup_size + ZO__sbat		# PointerToRawData
+
+	.long	0, 0, 0
+	.long	IMAGE_SCN_CNT_INITIALIZED_DATA	| \
+		IMAGE_SCN_MEM_READ		| \
+		IMAGE_SCN_MEM_DISCARDABLE	# Characteristics
+#endif
+
 	.set	section_count, (. - section_table) / 40
 #endif /* CONFIG_EFI_STUB */
 
diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index 2edb0167ba49..5022a378fec1 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -283,7 +283,7 @@ config EFI_EMBEDDED_FIRMWARE
 
 config EFI_SBAT
 	bool "Embed SBAT section in the kernel"
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
