Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F9FCAC582
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 04:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjDJD/Nde8MoV86N1eUGsJkbxx9/1beGXtNTMGJ0L7M=; b=aFDaw/ipg/PJum
	wyo35lVIac0Y/yUuRUAY3T1PT3sYi+Rio9NbTrnCEdx3pCAF7eegalj1x+Zb9gtRW7y+OOLiwrK1f
	AEdG+jqYoygy6GcbMCdUxWuoRdPM4csRhFkbVxX5eplO+VbDvD7REcs3m73z1KSvvcHaqJ76Z6dhh
	h88kljMZCdyDwdzKTLHOCQp9qVp1BzuU4f9uVlJodcKvhsJ13d9q+FapdKaYv3cl3rU0eSOmeaRFp
	t6FPj0j+XtTy04hYXec7OVKrLI6VXRGipGfbLyOcXX4dTKr9wkH4hHx+NdeznFtKBZZ7dCmviSJJg
	lHqQQDun1nUcYbCJg0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdz5-0000000HSVk-3SK6;
	Sun, 14 Sep 2025 04:05:03 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdz1-0000000HSR8-3XNI
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 04:05:02 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b07c081660aso429398466b.0
        for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 21:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822698; x=1758427498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mw6NNXq6XfJ0FNmZ5frjZGClHo0iZVSxbFf+bMTHIN8=;
        b=lNp6TaR/XVX8skvYv9sVgurWygn3V58SvHCVBO3FINTU2+snmBbQm9+5ezKxUPws+h
         Szz5pHPdRnd6kdTt8XDYHrhpwEFR8ttFvo0eGhj/3ZTcs6bGLvmT6UfA2K5emvSPMCeg
         BR+8VAr2LVqoe8WZI0zI95bEM4b/ehhP1mLxDnKLwoBBSNV42tSe941hRx9Zc2V/fXNX
         iLhSvo2AurLsoDU7Iyh8tDXL42RkxW9NB11AEZ18ImYV83qUp2wWjDFiaP0VljPOiqnw
         i1ehzY651WSdl4YcgGscDYJhqEjMBoU0XR497WVQDF6l9sAesvZK/dXLo4mVB1gaqaBR
         0xGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822698; x=1758427498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mw6NNXq6XfJ0FNmZ5frjZGClHo0iZVSxbFf+bMTHIN8=;
        b=gzLAa6nGtDa7kfc+lrPvsh4JOXdinRN+p3gQ5+aEIjBwSZzv9fvkhpBBGcteEqSDTo
         RDi+LZFT4FO/Wzh7DfyohIq4eXA1NHMg5PoW8yMM9cCoZqAEzQ1PjNYDI0v3s0/bgvDA
         FI8W5AdWECeqvd5yM5K5ArXy+7Ax7jop6OrHpEOUVozn3TdNaDCa9PUakef28xV8OFtL
         k0vXB4DqunlgZoGYPlSYaNhwLlNzxeQqxaPeWOEEIlaPO2VgyvyayJtqBnDEuB+vX+K/
         KMAyc8jB1Xkp8RwppaTEKsjqd5d8MPyL92vzafX+nbqNfdDeczkQvzM7Rm/zmDh4vRcK
         PFQw==
X-Forwarded-Encrypted: i=1; AJvYcCXk/UKcMViTeDAUGMJ1t8TpEhs+GJMN7ALt36Aa896l/eJpObDhZPDMITNfDYM4AIsmkG9Z6EhQ3bBrew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuQyaW+yE7pyUEzH1ociQgUQSLSvCuaYs6Jh/AqiNfTwU1381t
	3917Nus9T9TtrIh5UfC++TWp80D5xid+Emg/CeAjpxWtcjVjhfx/wRMg
X-Gm-Gg: ASbGnctCHgr3d9BBWcHgu67DvwpGrir138wyjDTUsRpWWarsiUjBmYME65PD5i0sNDW
	R7TKjF+4YlXkBXLkehG/MKhyiHGuGuaf3QhDujx/C5j1WP/jAmeLnaqW1J7N36dD+qxaqR18TFi
	KJLbwSMfSOanSTJ5Mx7+B2zryRI4n3gfRk+mIe3ycfLK+Qg4LG8HwBX9/QMpS2Nks4GCt/MkSOv
	VefZ42+//kR7SOaqvee7yM77yvs70KFeCvJMDEXYbRPQ/POpTaUV/JUPQFwhik3nhGaND0b3Y8a
	7zQjPIc38XG1kdGb1P1qqRE7bNTQKzkxm2jU4BZhGwMgJ8aFZdb+Cspwn9KUtcpQqjs2QETix7m
	W0oegU8xzVCJ/mGeLpss=
X-Google-Smtp-Source: AGHT+IEha/cEycx+vu0xF7TxjEegwfvZABBYj962u8Q3zWPEYF1LD+BxwewIqIoCpytaOJDSx3nrIQ==
X-Received: by 2002:a17:907:3d8e:b0:b04:706a:bcfc with SMTP id a640c23a62f3a-b07c37fd45cmr876333266b.33.1757822697695;
        Sat, 13 Sep 2025 21:04:57 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07dbf5dbf5sm308085466b.79.2025.09.13.21.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:04:57 -0700 (PDT)
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
Subject: [PATCH RESEND 62/62] init: rename CONFIG_RD_ZSTD to CONFIG_INITRAMFS_DECOMPRESS_ZSTD
Date: Sun, 14 Sep 2025 07:04:51 +0300
Message-ID: <20250914040451.3848715-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_210459_896038_39714490 
X-CRM114-Status: GOOD (  13.01  )
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

Initrd support was removed,
and CONFIG_RD_ZSTD has nothing to do with ramdisks.

Update your configs

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/riscv/configs/nommu_k210_defconfig | 2 +-
 usr/Kconfig                             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 6e961256a941..68cae0496b54 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -7,7 +7,7 @@ CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZO is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZ4 is not set
-# CONFIG_RD_ZSTD is not set
+# CONFIG_INITRAMFS_DECOMPRESS_ZSTD is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_FHANDLE is not set
diff --git a/usr/Kconfig b/usr/Kconfig
index 3a891a0c9ef4..06e1c1474b68 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -100,7 +100,7 @@ config INITRAMFS_DECOMPRESS_LZ4
 	  Support loading of a LZ4 encoded initial ramfs.
 	  If unsure, say N.
 
-config RD_ZSTD
+config INITRAMFS_DECOMPRESS_ZSTD
 	bool "Support initial ramfs compressed using ZSTD"
 	default y
 	select DECOMPRESS_ZSTD
@@ -206,7 +206,7 @@ config INITRAMFS_COMPRESSION_LZ4
 
 config INITRAMFS_COMPRESSION_ZSTD
 	bool "ZSTD"
-	depends on RD_ZSTD
+	depends on INITRAMFS_DECOMPRESS_ZSTD
 	help
 	  ZSTD is a compression algorithm targeting intermediate compression
 	  with fast decompression speed. It will compress better than GZIP and
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
