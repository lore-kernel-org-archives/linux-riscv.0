Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7852AC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ael0jZ1kQ4JLcBDoW08qT1INJI5RsDjaSWtExgKGpLc=; b=sxbCbiEGSsS0se
	sjf/mKJ0uuFwBFlMT2K9jcBj5zax+DXxCxVYokm4PHUu1OOtUNwPvHOL2TOwNlAr82lf9a8h0kO84
	+uwc/QyuipYR53QGZWq2aTxs6cM1ixblCuRoTv09Vr1ktVJEiexEtkb+b5/QfiuTV2D40bDkROxNe
	UQSrOD8wjmSKKV0ILz4KSrhR5Wxn0qJJVDkG7tJPd37AH/1JLDOmlJw88SlurqgpYTYDTq4KdhF8V
	BwVpppZsIKqB6AI8Gk5aqhlAsQOKwnYgSfMEiTrcZKp/XKhBITRRWR6I8YWqLvWLWZQGKZxkIPnDn
	7BZnyZib3caTRDMpWx4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rgm-0000000DIHE-2Kta;
	Thu, 24 Apr 2025 08:12:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rgl-0000000DIGv-0ZRf
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=A+1ZgWYZjkFNKtbyOd5XBijVRyjAhhTtk+/ckQxhbdc=; b=MiLV955RP77KqUcCSXbaGReYI/
	9sAMXfukkVBjn7AJqckBvqNKmfMEO9lHO1VWb4I7zbeHGhjuGhkXceBGzvlQ7p3pSDpd5z5AIu4sR
	3IvJGVADZD7pFPxelZ91LodTLWUpi5OERpmZikpcYBeS9+WZiQiX//kvmVbI/bOE/9Y42ALR9GkQn
	8TWZvTnbU83knyjIIQ/fjrvicJxM6r3uTi8RxyiemSt7/XE713kTPNrWZAR15iIxFM1+k0bGEPE7J
	AGUWSUPelAvzi/iF6cCQ3zbOfELu/RG8hIGaObVgaSEfuXhkFiFDGWiQQAGRyqdpvWxo7tyeLaqpH
	Ypvw2p7g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7rgh-0000000BbWS-3XWy
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 08:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745482321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A+1ZgWYZjkFNKtbyOd5XBijVRyjAhhTtk+/ckQxhbdc=;
	b=fM86tAP6863bQRdSDM7cIFhJc68jA3C23axKdtceFA20PCDCP1Rse88G7d+IKdoFOnohph
	bGFKW1S23Tnk5AcX9ViKCeT1J8Yydx3kXS2bSkcUHVJEUdt2DIX0LkCc2G9dYYTOVoVWGR
	KmoWwPTl4UvnOqxwXJd50ZcwvrbIQG0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745482321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A+1ZgWYZjkFNKtbyOd5XBijVRyjAhhTtk+/ckQxhbdc=;
	b=fM86tAP6863bQRdSDM7cIFhJc68jA3C23axKdtceFA20PCDCP1Rse88G7d+IKdoFOnohph
	bGFKW1S23Tnk5AcX9ViKCeT1J8Yydx3kXS2bSkcUHVJEUdt2DIX0LkCc2G9dYYTOVoVWGR
	KmoWwPTl4UvnOqxwXJd50ZcwvrbIQG0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-491-Nz0TM1INMt6rHFY_g5srJw-1; Thu,
 24 Apr 2025 04:10:29 -0400
X-MC-Unique: Nz0TM1INMt6rHFY_g5srJw-1
X-Mimecast-MFC-AGG-ID: Nz0TM1INMt6rHFY_g5srJw_1745482227
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2BF20180034E;
	Thu, 24 Apr 2025 08:10:25 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.224.198])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B0E9230001AB;
	Thu, 24 Apr 2025 08:10:11 +0000 (UTC)
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
Subject: [PATCH 1/2] efi/libstub: zboot specific mechanism for embedding SBAT section
Date: Thu, 24 Apr 2025 12:09:49 +0400
Message-ID: <20250424080950.289864-2-vkuznets@redhat.com>
In-Reply-To: <20250424080950.289864-1-vkuznets@redhat.com>
References: <20250424080950.289864-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_091204_066002_DA732E73 
X-CRM114-Status: GOOD (  18.81  )
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

SBAT is a mechanism which improves SecureBoot revocations of UEFI binaries
by introducing a generation-based technique. Compromised or vulnerable UEFI
binaries can be prevented from booting by bumping the minimal required
generation for the specific component in the bootloader. More information
on the SBAT can be obtained here:

https://github.com/rhboot/shim/blob/main/SBAT.md

Upstream Linux kernel does not currently participate in any way in SBAT as
there's no existing policy in how SBAT generation number should be
defined. Keep the status quo and provide a mechanism for distro vendors and
anyone else who signs their kernel for SecureBoot to include their own SBAT
data. This leaves the decision on the policy to the vendor. Basically, each
distro implementing SecureBoot today, will have an option to inject their
own SBAT data during kernel build and before it gets signed by their
SecureBoot CA. Different distro do not need to agree on the common SBAT
component names or generation numbers as each distro ships its own 'shim'
with their own 'vendor_cert'/'vendor_db'

Implement support for embedding SBAT data for architectures using
zboot (arm64, loongarch, riscv). Build '.sbat' section along with libstub
so it can be reused by x86 implementation later.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 drivers/firmware/efi/Kconfig                | 25 +++++++++++++++++++++
 drivers/firmware/efi/libstub/Makefile       |  7 ++++++
 drivers/firmware/efi/libstub/Makefile.zboot |  3 ++-
 drivers/firmware/efi/libstub/sbat.S         |  7 ++++++
 drivers/firmware/efi/libstub/zboot-header.S | 14 ++++++++++++
 drivers/firmware/efi/libstub/zboot.lds      | 17 ++++++++++++++
 6 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 drivers/firmware/efi/libstub/sbat.S

diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index 5fe61b9ab5f9..2edb0167ba49 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -281,6 +281,31 @@ config EFI_EMBEDDED_FIRMWARE
 	bool
 	select CRYPTO_LIB_SHA256
 
+config EFI_SBAT
+	bool "Embed SBAT section in the kernel"
+	depends on EFI_ZBOOT
+	help
+	  SBAT section provides a way to improve SecureBoot revocations of UEFI
+	  binaries by introducing a generation-based mechanism. With SBAT, older
+	  UEFI binaries can be prevented from booting by bumping the minimal
+	  required generation for the specific component in the bootloader.
+
+	  Note: SBAT information is distribution specific, i.e. the owner of the
+	  signing SecureBoot certificate must define the SBAT policy. Linux
+	  kernel upstream does not define SBAT components and their generations.
+
+	  See https://github.com/rhboot/shim/blob/main/SBAT.md for the additional
+	  details.
+
+	  If unsure, say N.
+
+config EFI_SBAT_FILE
+	string "Embedded SBAT section file path"
+	depends on EFI_SBAT
+	help
+	  Specify a file with SBAT data which is going to be embedded as '.sbat'
+	  section into the kernel.
+
 endmenu
 
 config UEFI_CPER
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index d23a1b9fed75..5113cbdadf9a 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -105,6 +105,13 @@ lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
 extra-y				:= $(lib-y)
 lib-y				:= $(patsubst %.o,%.stub.o,$(lib-y))
 
+extra-$(CONFIG_EFI_SBAT)	+= sbat.o
+$(obj)/sbat.o: $(obj)/sbat.bin
+targets += sbat.bin
+filechk_sbat.bin = cat $(or $(real-prereqs), /dev/null)
+$(obj)/sbat.bin: $(CONFIG_EFI_SBAT_FILE) FORCE
+	$(call filechk,sbat.bin)
+
 # Even when -mbranch-protection=none is set, Clang will generate a
 # .note.gnu.property for code-less object files (like lib/ctype.c),
 # so work around this by explicitly removing the unwanted section.
diff --git a/drivers/firmware/efi/libstub/Makefile.zboot b/drivers/firmware/efi/libstub/Makefile.zboot
index 48842b5c106b..3d2d0b326f7c 100644
--- a/drivers/firmware/efi/libstub/Makefile.zboot
+++ b/drivers/firmware/efi/libstub/Makefile.zboot
@@ -44,7 +44,8 @@ AFLAGS_zboot-header.o += -DMACHINE_TYPE=IMAGE_FILE_MACHINE_$(EFI_ZBOOT_MACH_TYPE
 $(obj)/zboot-header.o: $(srctree)/drivers/firmware/efi/libstub/zboot-header.S FORCE
 	$(call if_changed_rule,as_o_S)
 
-ZBOOT_DEPS := $(obj)/zboot-header.o $(objtree)/drivers/firmware/efi/libstub/lib.a
+ZBOOT_DEPS := $(obj)/zboot-header.o $(objtree)/drivers/firmware/efi/libstub/lib.a \
+	   $(if $(CONFIG_EFI_SBAT),$(objtree)/drivers/firmware/efi/libstub/sbat.o)
 
 LDFLAGS_vmlinuz.efi.elf := -T $(srctree)/drivers/firmware/efi/libstub/zboot.lds
 $(obj)/vmlinuz.efi.elf: $(obj)/vmlinuz.o $(ZBOOT_DEPS) FORCE
diff --git a/drivers/firmware/efi/libstub/sbat.S b/drivers/firmware/efi/libstub/sbat.S
new file mode 100644
index 000000000000..4e99a1bac794
--- /dev/null
+++ b/drivers/firmware/efi/libstub/sbat.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Embed SBAT data in the kernel.
+ */
+	.pushsection ".sbat","a",@progbits
+	.incbin "drivers/firmware/efi/libstub/sbat.bin"
+	.popsection
diff --git a/drivers/firmware/efi/libstub/zboot-header.S b/drivers/firmware/efi/libstub/zboot-header.S
index fb676ded47fa..f2df24504fc5 100644
--- a/drivers/firmware/efi/libstub/zboot-header.S
+++ b/drivers/firmware/efi/libstub/zboot-header.S
@@ -135,6 +135,20 @@ __efistub_efi_zboot_header:
 			IMAGE_SCN_MEM_READ | \
 			IMAGE_SCN_MEM_WRITE
 
+#ifdef CONFIG_EFI_SBAT
+	.ascii		".sbat\0\0\0"
+	.long		__sbat_size
+	.long		_edata - .Ldoshdr
+	.long		__sbat_size
+	.long		_edata - .Ldoshdr
+
+	.long		0, 0
+	.short		0, 0
+	.long		IMAGE_SCN_CNT_INITIALIZED_DATA | \
+			IMAGE_SCN_MEM_READ | \
+			IMAGE_SCN_MEM_DISCARDABLE
+#endif
+
 	.set		.Lsection_count, (. - .Lsection_table) / 40
 
 #ifdef PE_DLL_CHAR_EX
diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
index 9ecc57ff5b45..2cd5015c70ce 100644
--- a/drivers/firmware/efi/libstub/zboot.lds
+++ b/drivers/firmware/efi/libstub/zboot.lds
@@ -31,10 +31,24 @@ SECTIONS
 
 	.data : ALIGN(4096) {
 		*(.data* .init.data*)
+#ifndef CONFIG_EFI_SBAT
 		_edata = ALIGN(512);
+#else
+		/* Avoid gap between '.data' and '.sbat' */
+		_edata = ALIGN(4096);
+#endif
 		. = _edata;
 	}
 
+#ifdef CONFIG_EFI_SBAT
+        .sbat : ALIGN(4096) {
+		_sbat = . ;
+		*(.sbat)
+		_esbat = ALIGN(512);
+		. = _esbat;
+	}
+#endif
+
 	.bss : {
 		*(.bss* .init.bss*)
 		_end = ALIGN(512);
@@ -52,3 +66,6 @@ PROVIDE(__efistub__gzdata_size =
 
 PROVIDE(__data_rawsize = ABSOLUTE(_edata - _etext));
 PROVIDE(__data_size = ABSOLUTE(_end - _etext));
+#ifdef CONFIG_EFI_SBAT
+PROVIDE(__sbat_size = ABSOLUTE(_esbat - _sbat));
+#endif
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
