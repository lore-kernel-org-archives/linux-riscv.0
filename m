Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F39C3DA5D
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jul 2024 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5R+U6xiQC4s7cfEsjHXzN2mJisv63KITTN1QTfQwIs=; b=2uiWkmuj2EyjJ/
	+SD9unqtTz0pvtU9sLG5XNa9AqvcKcI/nhshwlXCSPGWIXU4w9gO9ESOWJyCR/Yq8aq0DSfwQpmYS
	Mb7bdH/OPKjFeZRwOBPKLmO6ADybghb7NzyZh62wJjGEpIIhJJVdE3iV95iRYJki5VR9M2AJq5hDD
	rq/tpEONJVNRg7gQ6prMz59O2S9lwg5TvusO3SSFXjXeQYcrnJyWqtYC/BFSwF1FWZwHQITGa6vYR
	ZuuXBqmZD1Uvfb+dk2uKwDAwEgEZxxZIHJNSw0C4C0J6gICpcGaq8L0wemzDoidd2vv6RqTyv9USO
	pHa/1SAOYkfAIYqZDwvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVWlT-00000006uGF-0wyE;
	Sun, 21 Jul 2024 13:38:15 +0000
Received: from mailscanner10.zoner.fi ([5.44.246.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVWke-00000006ty3-2sRj
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jul 2024 13:37:26 +0000
Received: from www25.zoner.fi (www25.zoner.fi [84.34.147.45])
	by mailscanner10.zoner.fi (Postfix) with ESMTPS id 611A92131F;
	Sun, 21 Jul 2024 16:37:22 +0300 (EEST)
Received: from mail.zoner.fi ([84.34.147.244])
	by www25.zoner.fi with esmtp (Exim 4.97.1)
	(envelope-from <lasse.collin@tukaani.org>)
	id 1sVWkY-00000001SpP-3xpw;
	Sun, 21 Jul 2024 16:37:22 +0300
From: Lasse Collin <lasse.collin@tukaani.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lasse Collin <lasse.collin@tukaani.org>,
	Sam James <sam@gentoo.org>,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jules Maselbas <jmaselbas@zdiv.net>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 16/16] riscv: boot: add Image.xz support
Date: Sun, 21 Jul 2024 16:36:31 +0300
Message-ID: <20240721133633.47721-17-lasse.collin@tukaani.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240721133633.47721-1-lasse.collin@tukaani.org>
References: <20240721133633.47721-1-lasse.collin@tukaani.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_063724_904550_FD42DCEA 
X-CRM114-Status: GOOD (  10.18  )
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

The Image.* targets existed for other compressors already. Bootloader
support is needed for decompression.

This is for CONFIG_EFI_ZBOOT=n. With CONFIG_EFI_ZBOOT=y, XZ was already
available.

Comparision with Linux 6.10 RV64GC tinyconfig (in KiB):

    1027 Image
     594 Image.gz
     541 Image.zst
     510 Image.lzma
     474 Image.xz

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Jules Maselbas <jmaselbas@zdiv.net>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
---
 arch/riscv/Kconfig       | 1 +
 arch/riscv/Makefile      | 6 ++++--
 arch/riscv/boot/Makefile | 3 +++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 736457a5898a..ef6a603b80c5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -153,6 +153,7 @@ config RISCV
 	select HAVE_KERNEL_LZO if !XIP_KERNEL && !EFI_ZBOOT
 	select HAVE_KERNEL_UNCOMPRESSED if !XIP_KERNEL && !EFI_ZBOOT
 	select HAVE_KERNEL_ZSTD if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_XZ if !XIP_KERNEL && !EFI_ZBOOT
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 6fe682139d2e..d469db9f46f4 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -159,6 +159,7 @@ boot-image-$(CONFIG_KERNEL_LZ4)		:= Image.lz4
 boot-image-$(CONFIG_KERNEL_LZMA)	:= Image.lzma
 boot-image-$(CONFIG_KERNEL_LZO)		:= Image.lzo
 boot-image-$(CONFIG_KERNEL_ZSTD)	:= Image.zst
+boot-image-$(CONFIG_KERNEL_XZ)		:= Image.xz
 ifdef CONFIG_RISCV_M_MODE
 boot-image-$(CONFIG_ARCH_CANAAN)	:= loader.bin
 endif
@@ -183,12 +184,12 @@ endif
 vdso-install-y			+= arch/riscv/kernel/vdso/vdso.so.dbg
 vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
 
-BOOT_TARGETS := Image Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst loader loader.bin xipImage vmlinuz.efi
+BOOT_TARGETS := Image Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst Image.xz loader loader.bin xipImage vmlinuz.efi
 
 all:	$(notdir $(KBUILD_IMAGE))
 
 loader.bin: loader
-Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst loader xipImage vmlinuz.efi: Image
+Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst Image.xz loader xipImage vmlinuz.efi: Image
 
 $(BOOT_TARGETS): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
@@ -225,6 +226,7 @@ define archhelp
   echo  '  Image.lzma	- Compressed kernel image (arch/riscv/boot/Image.lzma)'
   echo  '  Image.lzo	- Compressed kernel image (arch/riscv/boot/Image.lzo)'
   echo  '  Image.zst	- Compressed kernel image (arch/riscv/boot/Image.zst)'
+  echo  '  Image.xz	- Compressed kernel image (arch/riscv/boot/Image.xz)'
   echo  '  vmlinuz.efi	- Compressed EFI kernel image (arch/riscv/boot/vmlinuz.efi)'
   echo  '		  Default when CONFIG_EFI_ZBOOT=y'
   echo  '  xipImage	- Execute-in-place kernel image (arch/riscv/boot/xipImage)'
diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index 869c0345b908..710a5f6caf96 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -65,6 +65,9 @@ $(obj)/Image.lzo: $(obj)/Image FORCE
 $(obj)/Image.zst: $(obj)/Image FORCE
 	$(call if_changed,zstd)
 
+$(obj)/Image.xz: $(obj)/Image FORCE
+	$(call if_changed,xzkern)
+
 $(obj)/loader.bin: $(obj)/loader FORCE
 	$(call if_changed,objcopy)
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
