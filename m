Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604B5CAC582
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 00:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+88ADqCYS7kP3sc0253FKihAqcOB7AlEMLY2HIb/7s=; b=XHcR3uVTVahf0J
	1q0tcma2iR4enyArEQoNqDmONh2zzSeeUMMy8kGtI6VYKTEdkyw5UZyilnrbvDFK/vH9m3aeaeqA9
	lrI/UfxJZcfK2Gts+y8wzEupLDlCPfZP4brghg/Fg7bKZPdgHLiagmSBei7YKy7klP1UqzMMGKlVJ
	dpl2F/WdGP8fdUQlOEo6u96Mgow8nh/CBSjGdyluPfEzSSW/Qdu/t65EiiYienSYg/l7mj8MMgTC/
	w7VkaBibCqgUWC96au8A/OSnZob2aWs+yE5KQF1fAqO5u8BHRoK4eAEdHXDUKKQP+Ndx/DJQOo1BD
	McQMQ34OpQBvAwomtLEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEa9-0000000CSYK-06ul;
	Sat, 13 Sep 2025 00:57:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEa7-0000000CSWi-1s0N
	for linux-riscv@bombadil.infradead.org;
	Sat, 13 Sep 2025 00:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ezI+jX/C/Y112e/n5Rz3xR2Z7MqtqGJhurNzHRBUkc4=; b=knjuCwxOrrBs1EfEOdUI9V1p0F
	R+HzKQbX+kRt5OEFsfXhcej+CJzYehIk/j11CjM5vOkBIsCXSqLj2wkXSfVlKIy1R3IVyFVAluChK
	slvk0+yyL26SevDB3n0HTbIeYaYDX2K6qOFULr+4MK1IwXwe7lcCT+uUfoww4Ou9ppkIENtqrOa2j
	pBIAz9v0Fi4X5/a9nKizXv8hBeuj7z9Olh/DComWAA8yaxDzlMX98ufdDe4OlOsjnl5RuTDk7oa0O
	IaxUDpCNA74MezHZfr3HpxXk66/McCzS+sB9WfjGMXwont4V39YOiQ/kn81hwrl/2qLHml0VGy0RR
	cO5hRsHQ==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEa3-00000006VJ7-3Hsn
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 00:57:34 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b07ba1c3df4so344738466b.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 17:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725050; x=1758329850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezI+jX/C/Y112e/n5Rz3xR2Z7MqtqGJhurNzHRBUkc4=;
        b=K1bqlQmAaOaPR2jOMNAxRc+4Bl3vNYLgZHcPNiiK8YlMCIjEN7ispRRCE7xpCWxh5p
         xYuqM2IP42IOjrT/LY6J0lHzydHI9zPbvWx6hOf9HQfya5k6nB6dATClaY3MujrFyyJh
         /s8Fds8glxxFkC4f53KB6Vn5kp79SXuCbk+XYjduFXfxzNLrloUdxHbIco+MRWBPb3iB
         HI6cLEGB83vZ8Luh0urS3Ws2LySC6HQBjYkM3W6EoNVmJC1q3FyfmUZauMQCrnm6t2la
         5F//7p46xMBkgP4Luzngg3GTab8ahDErrBpZysnRMM73vWiXelUIz2eFmdzme3h174Vd
         cDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725050; x=1758329850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezI+jX/C/Y112e/n5Rz3xR2Z7MqtqGJhurNzHRBUkc4=;
        b=mk1ai358weASpQCICPLtziO17DrwosoiAVVpkVKxWkypdnNJQ1A6ll4Lez3KOpBlA+
         PUz1oMxwMNvGFH/NluRruwAsrSKQEnmUfFIxL2zKjrVBVNrJmJb59k9BLJ3E3aUqWVQi
         PAdiYQ6meacCGB9D5wOTJUikbMaArFB7sJ6o/x0Z1OOJscYJ3LwFr8se0G4tVntjHQEm
         LdOdPjrt3GKiEAIQpGMweS1yDcPuPMYbdlZfo5ynhWqoDp0Ngfp730q4pbVJqtPPEjzA
         G/toqdiS/JRePBepr3oR+wtcrG/2YlcXFd+pHzWx/GaNylbbbsij9FyIl9TY1YEP1Yaz
         JcpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHp8EMhF82F7lrgtUHgXdaFr9YO3EMhEec+jnkF0bZQZJQw/gNhcfzZX/pigWOqjDfp8kgsdW2Amip/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8pH649/+TWouP+78KyCJkJ6lcF/qf0ZqW847hs0RjaQQ9yQQG
	HdkHOIx2d7QZh3tPnIvSAasHVlNIpL84fGyehIsgKSlA44GmevZrsVUB
X-Gm-Gg: ASbGncsp5UbB9gTAlGtODK7GUmGwTuHv9thtA7PeIWwPVC9O/RDyoyobPukGIsW170h
	WzhPBahgqt5AR4zr0yZqyTt+G7dRp8jy8Vax9aGrqLgFsIH/1mydN8cas+G6Ee82KAPmCHIwuEx
	J+wtkrCcyV2QNWwZPy27qhdYSW50fidJXn2PSDkpZndhF4NT8C4fG1t9glF/4Wjj0vp0o8j8n1Y
	seivatkw5EIuqkunnHCWhxrYmQya5vxmbB8N47EW7R07fca5fHlr3vIxTRAi1R7f1uW1NmmrtTv
	R46H+tnTmbH+DY+Nx5z6s1DKP2DnUCkhFba7GMN+hMHu7xOTB91WZ0nKO2lRm+rkLoY4xEkwYE8
	soefrSc8q/DJ0SmVP0MCCWzgwe7nwbA==
X-Google-Smtp-Source: AGHT+IGnRtXHmAlBOGcWImQD5jsKfQTyCdy3QliDqyqREaJdsFoBMJl1utqd/JT9F2sOVlrjQyooHw==
X-Received: by 2002:a17:907:944b:b0:b04:ad1c:59e4 with SMTP id a640c23a62f3a-b07c35328admr535751966b.12.1757725049282;
        Fri, 12 Sep 2025 17:57:29 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd47bsm478662366b.58.2025.09.12.17.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:57:28 -0700 (PDT)
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
Subject: [PATCH RESEND 16/62] brd: remove "ramdisk_size" command line parameter
Date: Sat, 13 Sep 2025 00:37:55 +0000
Message-ID: <20250913003842.41944-17-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_015732_176599_B176AF83 
X-CRM114-Status: GOOD (  16.92  )
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

It was used mostly for initrd. It could be used only if
brd is built-in. Use "brd.rd_size" instead

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  3 ---
 Documentation/arch/m68k/kernel-options.rst    | 20 ++-----------------
 arch/arm/configs/s3c6400_defconfig            |  2 +-
 drivers/block/brd.c                           | 10 ----------
 4 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ad52e3d26014..e862a7b1d2ec 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5279,9 +5279,6 @@
 	raid=		[HW,RAID]
 			See Documentation/admin-guide/md.rst.
 
-	ramdisk_size=	[RAM] Sizes of RAM disks in kilobytes
-			See Documentation/admin-guide/blockdev/ramdisk.rst.
-
 	random.trust_cpu=off
 			[KNL,EARLY] Disable trusting the use of the CPU's
 			random number generator (if available) to
diff --git a/Documentation/arch/m68k/kernel-options.rst b/Documentation/arch/m68k/kernel-options.rst
index 2008a20b4329..f6469ebeb2c7 100644
--- a/Documentation/arch/m68k/kernel-options.rst
+++ b/Documentation/arch/m68k/kernel-options.rst
@@ -215,27 +215,11 @@ Devices possible for Atari:
            seconds.
 
 
-2.6) ramdisk_size=
-------------------
-
-:Syntax: ramdisk_size=<size>
-
-This option instructs the kernel to set up a ramdisk of the given
-size in KBytes. Do not use this option if the ramdisk contents are
-passed by bootstrap! In this case, the size is selected automatically
-and should not be overwritten.
-
-The only application is for root filesystems on floppy disks, that
-should be loaded into memory. To do that, select the corresponding
-size of the disk as ramdisk size, and set the root device to the disk
-drive (with "root=").
-
-
-2.7) swap=
+2.5) swap=
 
   I can't find any sign of this option in 2.2.6.
 
-2.8) buff=
+2.6) buff=
 -----------
 
   I can't find any sign of this option in 2.2.6.
diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
index a37e6ac40825..23635d5b9322 100644
--- a/arch/arm/configs/s3c6400_defconfig
+++ b/arch/arm/configs/s3c6400_defconfig
@@ -4,7 +4,7 @@ CONFIG_ARCH_MULTI_V6=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_S3C64XX=y
 CONFIG_MACH_WLF_CRAGG_6410=y
-CONFIG_CMDLINE="console=ttySAC0,115200 root=/dev/ram init=/linuxrc initrd=0x51000000,6M ramdisk_size=6144"
+CONFIG_CMDLINE="console=ttySAC0,115200 root=/dev/ram init=/linuxrc initrd=0x51000000,6M"
 CONFIG_VFP=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 72f02d2b8a99..05c4325904d2 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -222,16 +222,6 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS_BLOCKDEV_MAJOR(RAMDISK_MAJOR);
 MODULE_ALIAS("rd");
 
-#ifndef MODULE
-/* Legacy boot options - nonmodular */
-static int __init ramdisk_size(char *str)
-{
-	rd_size = simple_strtol(str, NULL, 0);
-	return 1;
-}
-__setup("ramdisk_size=", ramdisk_size);
-#endif
-
 /*
  * The device scheme is derived from loop.c. Keep them in synch where possible
  * (should share code eventually).
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
