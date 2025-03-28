Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134E3C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 08:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oacp8thIO/xfyD9yFEv6LIa/6wBLYyG3AUaX0v7GOr8=; b=je0M/RZRFEBzG4
	z8qVLOGKRJr+mwtKAuHOPa7KirETlwAxxXdtU+Y0q7mHSKM649rlHxqf6Q4YGzucmfuXPJrLO61MR
	mIE5ss9S0eGt3iZ21BLCNEicy+ZAGdmx4FHPOOyziOXViPl1s09KZur2qkZqF2am3HIj4v5p+YjDB
	p6sXfq+BNjTy/cF1pLcnGrNmBS/R+MZkRswtOhR94Y/zBzs/YPWEYBPhBWfXr5E5lzxPqQLHLLAk9
	W/Ies+3GF9ogVDvB81bqcMbzYySKi7tBV0fjika+xKkGxVnQuINaz9M/gj29hMDWLxPHKGIK1EXuJ
	fsof629UlYYXBG8SNF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4lg-0000000CsQx-3igb;
	Fri, 28 Mar 2025 08:08:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Z3-0000000CqnT-3pU3
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 07:55:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso13085815e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 00:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743148540; x=1743753340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qmXH6tUdBhyxCuOKPx5cChdmd3dLaKjPLtkEvOC6Z4=;
        b=iNNxe/QsqWsbk/prP1m0BDRco4QEEIiD0/2F9Le1Q+H9Q3na3Cph4giDIXAszWSUUe
         FL8d/RZhCSHDj22d6VqpIovoe8xOSouY//c0dYq4kxbKDC8GwxV/xi78DikJchSlF4Tk
         dG9MpiVFVgEraMUsVsLcKL5nLR7WwiEg6UajgS633nCawvWaCOG+MT8tJI02ldH2eZR9
         pzrgFs09zgLT+wZcHQFOOzY37HHpWNSEKfXNt4STOoXuEVlSRwJO/GhfkvjQ2CbcZK9E
         4+S8xPBNaksqz0/CsC7ld4a8WBkELhpQDLWw1nZKQOFz+S+QN0wHCWyZ/yXMwsYZY3L1
         eu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148540; x=1743753340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qmXH6tUdBhyxCuOKPx5cChdmd3dLaKjPLtkEvOC6Z4=;
        b=V1JMzAWJjiIkKYh2nYNRFQVicp9o7GHEt4LX+tpI1HLpoZBNCZlJoNhZ567h7ghjv9
         ZL88G1DenxAqgp/1WBuSBnUr+1tTnjSMDWIUhw4RhZX/nU8qyXd4RSesBQG0qs2cyxxS
         JNz5cWuXaMfJwLhFtO5mf13Elk+34AQCgRGpJxwtU8UCllYWvbwLEkpJimENqN0qRGAH
         YUk/OLcqmbm9xJjYggDroJ96GbN5fuWaIySsWmZp+GmgRDmkE9ZVp21OcSinzFSsob2T
         7Nhf2FfDy5JU7OuiDXRh7Fom66EK3RPvcIeE8agFjQXFmmL1f+mq55K5S6sYteQUNrDm
         d4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWFbWbnNDB603J2kXZkm40ucgCAbI5eHDIObH4cfe3W+NKCSd5HGBFhHYGK65D1Bifpw+3XXdMNXRSaNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxU2+KzZIG+aztYt8hF2ljOMJujnPEv2hsOYgg1hiVCD8e0ACRj
	uRBkjcXpuaznEE32dQgjn6GzM5R8XwsvibvEFDlCJpObgux8ah4ZxzXXutbK578=
X-Gm-Gg: ASbGnctt/fKhVO0flzSzEjixWfjZokQfQg7HpZo8GIVakb1l0hwgr2u1b/l7vFy5fLz
	CbVnw98hSUiI23IJ7nK3dzRAcbXl8puJWZHTbx4ps6Mh5VU45RPX9+6ge1oHFWWTxcTREwlAEsQ
	7NJ/cHiO1TAghODnQtPzdixEh6KEhQ7Vg8X2Bw+0Ehg4KC6A0JfcMwwpThsW7X/grNhUx4D6mt4
	DV70VCFZFA6h7E4ieo6gzP9mmh+JGpb+12nVlXoBz/+sWHOuVJZLfOePCGrr2M6rpHDFs9WwPXo
	0H3g4DC7HS3aAAeFuCejdwUSKdEyQtDDO5hMEmErz9Tx+2QuU9qDRxs0iXBvn0WgfQk=
X-Google-Smtp-Source: AGHT+IHCOMN8uZ+u+tWvAykTfDphcLmw89KftNnGG3qlRnjiUHtvL5LGK6mVPNUfynbX4LuKd5+uqA==
X-Received: by 2002:a5d:6488:0:b0:391:2f2f:836 with SMTP id ffacd0b85a97d-39ad174bf52mr5128871f8f.17.1743148539525;
        Fri, 28 Mar 2025 00:55:39 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([193.33.57.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a3d66sm1799249f8f.81.2025.03.28.00.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:55:39 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] scripts: Introduce ARCH_WANTS_RELA_DYN to avoid stripping .rela.dyn section
Date: Fri, 28 Mar 2025 08:55:36 +0100
Message-Id: <20250328075536.238782-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_005542_214515_261E5427 
X-CRM114-Status: GOOD (  12.05  )
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

riscv uses the .rela.dyn section to relocate the kernel at runtime but
that section is stripped from vmlinux. That prevents kexec to
successfully load vmlinux since it does not contain the relocations info
needed.

Fix this by introducing a new config ARCH_WANTS_RELA_DYN that prevents
.rela.dyn to be stripped.

Fixes: 71d815bf5dfd ("kbuild: Strip runtime const RELA sections correctly")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/Kconfig         | 7 +++++++
 arch/riscv/Kconfig   | 1 +
 scripts/Makefile.lib | 4 +++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index b8a4ff365582..d93f50ecb8f9 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1544,6 +1544,13 @@ config HAVE_ARCH_PREL32_RELOCATIONS
 	  architectures, and don't require runtime relocation on relocatable
 	  kernels.
 
+config ARCH_WANTS_RELA_DYN
+	bool
+	depends on RELOCATABLE
+	help
+	  This prevents the .rela.dyn section to be stripped from vmlinux since
+	  it is needed to relocate the kernel at runtime.
+
 config ARCH_USE_MEMREMAP_PROT
 	bool
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..d58053efa4e4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -84,6 +84,7 @@ config RISCV
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	select ARCH_WANTS_NO_INSTR
+	select ARCH_WANTS_RELA_DYN if RELOCATABLE
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cad20f0e66ee..e59210a9fde0 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -376,8 +376,10 @@ quiet_cmd_ar = AR      $@
 quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 
+objcopy-args-$(CONFIG_ARCH_WANTS_RELA_DYN) += --remove-section=!.rela.dyn
+
 quiet_cmd_strip_relocs = RSTRIP  $@
-cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
+cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $(objcopy-args-y) $@
 
 # Gzip
 # ---------------------------------------------------------------------------
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
