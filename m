Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE028C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 11:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPU8gs1V66+c2w056hNaMDzB8Z90cy0D4qTmVBi6q0A=; b=o+C9wyWw37VnKU
	YK96csXcjCxuz2u/oIpDvMgHBj7qpJrurd3pbGIv3Rroo0nG4Z0w7YpyjlUHZ/AllJyRiCMUibVE0
	nSEmn5owVvd98XZmm8VhW+bWgWmJPKYK0Qv3b49IBIaqytrkUic5kqZS54xpNYJ6P493yPGhjEAvb
	RVeOhfc7oST+WGfF7cSPowAoE4S6NP2+TvgbcohI+pJurTS4Qw974M+rQ8lBam8UO6B2kDZAfJWCS
	b1Y2IAUqA2+iv4tphK4+i0U8mLmZfsXR1M49XI7XI3htwAgarcDyoHGYxFh9bbkfqFXORLiqf87+j
	JSr+QzOmtqqa8T+pFLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2UQQ-0000000CUI2-0imY;
	Thu, 02 May 2024 11:16:30 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2UQN-0000000CUFS-0Uym
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 11:16:28 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B10993FE63
	for <linux-riscv@lists.infradead.org>; Thu,  2 May 2024 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714648582;
	bh=MK9pS8zh0OAd8/YKYBCNbvjlHmkQLgxQ6JtcNKhjMOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=fKx7hk+UP9wGhEJgc+atiCRs7VgqD6FAHc/fv84q906/2uvB4SbdXpSK+RzgTvT51
	 ewdZg5HwPENzu9rAxG3cvC+20HJ/zr6KreI64U62lPHKzA+JSB3DQPlACbQerVe39n
	 uu8in9WvBW2gvTcaayYcyPnCoR2COMVYoWCLxhIIp9OaMoQk+0rDHhPTLp32rVgVTQ
	 wocEYaKZXa2VnDzg+tNJekvnJezWcjMqYJB9AKB488Ffqz9SRv6HPZdncLIkDSuUA6
	 Fo9tPNd3y7bB17M4j0HKqNMyrxredb5d6L9nmGFGKafsyZRv2ZF+h+kmQ0fLj0a5B2
	 FH5wZN5fktWTg==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a524b774e39so165081766b.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 04:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714648577; x=1715253377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MK9pS8zh0OAd8/YKYBCNbvjlHmkQLgxQ6JtcNKhjMOU=;
        b=afU1YbxnDCRGIbPTx9cGMlR8olYxhG5BD/C/nhY4uFiB47usBhNYNT4pgE9cN5kmyE
         F2S2jN4/lRBW6Xs7OFul1ZhR9LpbAxlrC/HVFMaFa094oNl2tYl2w49msgNUhSe/sbP0
         oFE0Bl+Itco3Jdqgs3K5/KHdgaABk3dLi3SpdPWMC3y8Cq0UQYLY80vcYJ72z9lkKZKb
         B2EyT4Is9/4c9zzClxAPrzQU4ThKPcrVFAxcu3gHuw/SX6AOYFb+xO3WwVyTMrXnCcH1
         DXNCHKbJpogWgKrLmDPYtaRTqVd5t6M0dZxGzaDSXy3Aj5E9pqRjx2071W5kyAbrJ677
         S00w==
X-Gm-Message-State: AOJu0YxgW5GWGXGRPwNo7vFKXgGkuSW3fdXwKfK4RohldhzX1NiwWUd/
	s3pI2S60o8heaaXKL6qQSoucaWnLLAhaUu43ii51vZ8wJtvdFdf0BGLT8H3gGNdLL8AtksUdWfQ
	O+MzKWtvYj3Um0K4lI48I8dj0lXJLlYq2bsdQvMN0dmDIUUyn7hPFhJW+qsmArDpZiw4dFB+ZS0
	/2em4zyn5V5joTGA==
X-Received: by 2002:a17:906:248b:b0:a58:eb0d:f2a6 with SMTP id e11-20020a170906248b00b00a58eb0df2a6mr1882987ejb.31.1714648576859;
        Thu, 02 May 2024 04:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7LnYqMf09AgSTE93ChylTc81npf1nJHpjVmGmIFbInD5oUeTRsn+ecAVqhExu0Tv8wF6tLQ==
X-Received: by 2002:a17:906:248b:b0:a58:eb0d:f2a6 with SMTP id e11-20020a170906248b00b00a58eb0df2a6mr1882976ejb.31.1714648576542;
        Thu, 02 May 2024 04:16:16 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id gs23-20020a170906f19700b00a4739efd7cesm437278ejb.60.2024.05.02.04.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:16:15 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Terrell <terrelln@fb.com>
Subject: [PATCH v1 1/3] riscv: make image compression configurable
Date: Thu,  2 May 2024 13:16:06 +0200
Message-ID: <20240502111613.1380453-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_041627_315996_73657ADB 
X-CRM114-Status: GOOD (  13.37  )
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

Previously the build process would always set KBUILD_IMAGE to the
uncompressed Image file (unless XIP_KERNEL or EFI_ZBOOT was enabled) and
unconditionally compress it into Image.gz. However there are already
build targets for Image.bz2, Image.lz4, Image.lzma, Image.lzo and
Image.zstd, so let's make use of those, make the compression method
configurable and set KBUILD_IMAGE accordingly so that targets like
'make install' and 'make bindeb-pkg' will use the chosen image.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/Kconfig         |  7 +++++++
 arch/riscv/Makefile        | 43 ++++++++++++++++++++------------------
 arch/riscv/boot/install.sh |  9 +++++---
 3 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..6c092d1ea7db 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -138,6 +138,13 @@ config RISCV
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU && 64BIT
 	select HAVE_IRQ_TIME_ACCOUNTING
+	select HAVE_KERNEL_BZIP2 if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_GZIP if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_LZ4 if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_LZMA if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_LZO if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_UNCOMPRESSED if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_ZSTD if !XIP_KERNEL && !EFI_ZBOOT
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 5b3115a19852..29be676415d6 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -129,11 +129,27 @@ endif
 CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
 
 # Default target when executing plain make
-boot		:= arch/riscv/boot
+boot := arch/riscv/boot
 ifeq ($(CONFIG_XIP_KERNEL),y)
 KBUILD_IMAGE := $(boot)/xipImage
+else ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
+KBUILD_IMAGE := $(boot)/loader.bin
+else ifeq ($(CONFIG_EFI_ZBOOT),y)
+KBUILD_IMAGE := $(boot)/vmlinuz.efi
+else ifeq ($(CONFIG_KERNEL_GZIP),y)
+KBUILD_IMAGE := $(boot)/Image.gz
+else ifeq ($(CONFIG_KERNEL_BZIP2),y)
+KBUILD_IMAGE := $(boot)/Image.bz2
+else ifeq ($(CONFIG_KERNEL_LZ4),y)
+KBUILD_IMAGE := $(boot)/Image.lz4
+else ifeq ($(CONFIG_KERNEL_LZMA),y)
+KBUILD_IMAGE := $(boot)/Image.lzma
+else ifeq ($(CONFIG_KERNEL_LZO),y)
+KBUILD_IMAGE := $(boot)/Image.lzo
+else ifeq ($(CONFIG_KERNEL_ZSTD),y)
+KBUILD_IMAGE := $(boot)/Image.zst
 else
-KBUILD_IMAGE	:= $(boot)/Image.gz
+KBUILD_IMAGE := $(boot)/Image
 endif
 
 libs-y += arch/riscv/lib/
@@ -153,32 +169,19 @@ endif
 vdso-install-y			+= arch/riscv/kernel/vdso/vdso.so.dbg
 vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
 
-ifneq ($(CONFIG_XIP_KERNEL),y)
-ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
-KBUILD_IMAGE := $(boot)/loader.bin
-else
-ifeq ($(CONFIG_EFI_ZBOOT),)
-KBUILD_IMAGE := $(boot)/Image.gz
-else
-KBUILD_IMAGE := $(boot)/vmlinuz.efi
-endif
-endif
-endif
-BOOT_TARGETS := Image Image.gz loader loader.bin xipImage vmlinuz.efi
+BOOT_TARGETS := Image Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst loader loader.bin xipImage vmlinuz.efi
 
 all:	$(notdir $(KBUILD_IMAGE))
 
 loader.bin: loader
-Image.gz loader vmlinuz.efi: Image
+Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst loader xipImage vmlinuz.efi: Image
+
 $(BOOT_TARGETS): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 	@$(kecho) '  Kernel: $(boot)/$@ is ready'
 
-Image.%: Image
-	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
-
-install: KBUILD_IMAGE := $(boot)/Image
-zinstall: KBUILD_IMAGE := $(boot)/Image.gz
+# the install target always installs KBUILD_IMAGE (which may be compressed)
+# but keep the zinstall target for compatibility with older releases
 install zinstall:
 	$(call cmd,install)
 
diff --git a/arch/riscv/boot/install.sh b/arch/riscv/boot/install.sh
index 4c63f3f0643d..a8df7591513a 100755
--- a/arch/riscv/boot/install.sh
+++ b/arch/riscv/boot/install.sh
@@ -17,15 +17,18 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
-if [ "$(basename $2)" = "Image.gz" ]; then
+case "${2##*/}" in
 # Compressed install
+Image.*|vmlinuz.efi)
   echo "Installing compressed kernel"
   base=vmlinuz
-else
+  ;;
 # Normal install
+*)
   echo "Installing normal kernel"
   base=vmlinux
-fi
+  ;;
+esac
 
 if [ -f $4/$base-$1 ]; then
   mv $4/$base-$1 $4/$base-$1.old
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
