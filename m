Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866B6CAC582
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 00:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zhr5OFWuSfnAqbsOUu4MyYnupplz8wb6mYWjicE1do=; b=qYFz7o4qpAQ0yN
	KS+s9H8Imfypeb2HasRSp3pHWDIaXW7apWKPSiGxisGSQY/h3RpnxBq2NS9f49wKTvqjfT94VJjHl
	pfZ1iSg7HDdqhPFkxCWu6H47erBJWW+QrcEyl/ZnODMT6/vSxtk2oZvIDlE02QRtBUzwoq661uWWZ
	65SqBRQT8yNZi8f1c4iBo3LUC1jI90fANeAHG6vCTCkP49bgNLCWhL+0qCFFxCH7YCH9Gd1cWvBTp
	OJkD6+qc7qtRckUaYkO+2k4x6KUO1kIpM35rSJYtqzXl6/Ft/397P2y2ISmz+ghaWdhH+L5nMxoSC
	1jC+kEyBz1yhFMFvfuPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEXz-0000000CRrV-4AKu;
	Sat, 13 Sep 2025 00:55:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEXy-0000000CRqm-3aJm
	for linux-riscv@bombadil.infradead.org;
	Sat, 13 Sep 2025 00:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=brUQzIfCd0Hsthf3I31XlgkqlDsgZYmVYRfws4Ev66A=; b=IQMeNT8MPFN7s1BrJnQ5Y2aP+x
	7Xld1EGKeu1PtLfvynHb66HDg56U4Actrt9hNlUJEUFgcACXoO3d+4N76B0ONA5Wr2NcMaUc9azbF
	TI3nqHhF3eEgA71sTsO6aqYJA2HlsueC+cGH8D/AyCkj+fw85Pdg2QWodaKLJrmlH26DEEAMEOTRJ
	jEVlBjRm4DyixBCwpJG2DyymHoxttjzLG4cSoAdmnvSPXS/C9qz5NHHvsxCrQRftHpo7AnMyhqHFV
	ChcXPfXsGmv1qaLdA1bmFi2szX9pl03iQOLB1n5z6QukIle2Dejy2K/kQoDad0KIe6BmcaP2qxTi8
	JYA9p+DA==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEXv-00000006V2i-3ymg
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 00:55:21 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-62f125e5303so4558a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 17:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724919; x=1758329719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brUQzIfCd0Hsthf3I31XlgkqlDsgZYmVYRfws4Ev66A=;
        b=aqUmb/bnqkM2rgAAGlOWpQ7xSBgoInJjWEXKzDZ52NgHnluI6Plb8rPapy+ZaL8Oxk
         t0JFdBFVw+hROfHSZ72/k3DTu9K5wb3KpynrnIZyNGHlOznwEK8BaNIVEtRw9CvauHin
         V1Fnlk+pXT6HcImQe24cXJjslug0MdV7BtQTddUVYusXrPyUyWnCAZV04oL8k1wd31MX
         z+NoyLyX0jERpdhrpF8uFAIAiI+dVWH6mqnxwboe/AosGh0/BDGVuq+HzePEN6il15w2
         gH01pY+889JpkoRA0064DTp/xKxtyleZtM3UWuBst4D9p8sdFrygN6NgDspIxmFs8/dy
         OJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724919; x=1758329719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brUQzIfCd0Hsthf3I31XlgkqlDsgZYmVYRfws4Ev66A=;
        b=WsI2lMJYexrCV0jaYMqQrNU6uT0PcXHvgniCZCSoTVlwXpokw4imxcvr0LqMlLEKMP
         i2fvjZT1b26iAUJq4n8L+gHxvShTn8A8OIkzNc5OMpXRtBjGrL99bJ5NgZOd3eFrxo1M
         cORljGMeBS17OIVs7Os2GzGIIfxzaHaaHzm+UKiWo9eTgBKHdEh/rWf6Xjju3i0HSoPw
         7mEFtUajnXnd5hBtc1w+IwGVB0PBK2MLvDeryUpZzG271B+E8huyByMUM+7MVyvyVK2e
         /Gf5azpkEBYxMx3ZOUoW8xwwTFtk9k/s7ZdYYl2GG8MrGgEhhFGHf/4cv6r2PCHlYUJR
         vIIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU18ThnX1F5LEMgMz8AWHwcP1RDJEtG5unV2xQAM8glsBpoe7HmZWPIboVU44R+hs3gWo6eyIyro8egkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVOB21HQY9fb+dbu1fL7tWABNU8KbFGoIEyb9OTZO/dR/uokmx
	SmSTENGqTgxzrNeoU1UyECLK+WOYscdyp6IOQedxURRasy26hA6pBeBB
X-Gm-Gg: ASbGncsBt57LvbFBjonRg+uaGXaM9k5wJcLjzFKYHdpH+1QWcSW/cF9UUo5O/X3dEg8
	8inrB/vmlDROrLhKid4k5Mdv7hIQdSt+ukOS2t8UFO4o7zKAQjIoD5eB61IA0Haxz6UCtV/SGaS
	hck3q6Gc9WPT/PWU4wGXAEY9Z+KzB3oymUg5oBxGRdJgAUF1Mq/o8m8dCmDwvt+DHbkUfkAjWAf
	AR/KRT4qaiEBLzG2fQ6sAr4AdRFk9uB2PXb0mFHg57FN6oQNn3pKRAWiI1ZMxF6udwL7dXVkYaf
	gIAlrzAobufN2ORJnDwJt4ki9k1EaGturs5q5b2sQofXzVVBI7BGRoSPKISJJKmWbqH9n+JPsxQ
	IeMMdoh73f5vPG3g0XB2P3YYVoKCyRg==
X-Google-Smtp-Source: AGHT+IFhKaZuOZuHh9m3zt1qgdjZK8E9TZ0Xtk6mNXJxSo6OktVvoEgwN+yDRi3/QGfp0/HMd569SA==
X-Received: by 2002:a17:907:3d8c:b0:afe:8b53:449c with SMTP id a640c23a62f3a-b07c37dc9f1mr442768666b.34.1757724918489;
        Fri, 12 Sep 2025 17:55:18 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b316e2d4sm471493966b.45.2025.09.12.17.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:55:18 -0700 (PDT)
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
Subject: [PATCH RESEND 14/62] init: m68k, mips, powerpc, s390, sh: remove Root_RAM0
Date: Sat, 13 Sep 2025 00:37:53 +0000
Message-ID: <20250913003842.41944-15-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_015520_171884_F957C614 
X-CRM114-Status: GOOD (  17.29  )
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

Root_RAM0 used to specify ramdisk as root device.
It means nothing now, so let's remove it

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/m68k/kernel/uboot.c                |  1 -
 arch/mips/kernel/setup.c                |  1 -
 arch/powerpc/kernel/setup-common.c      | 11 ++++-------
 arch/powerpc/platforms/powermac/setup.c |  4 +---
 arch/s390/kernel/setup.c                |  2 --
 arch/sh/kernel/setup.c                  |  4 +---
 include/linux/root_dev.h                |  1 -
 init/do_mounts.c                        |  2 --
 8 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
index fa7c279ead5d..d278060a250c 100644
--- a/arch/m68k/kernel/uboot.c
+++ b/arch/m68k/kernel/uboot.c
@@ -83,7 +83,6 @@ static void __init parse_uboot_commandline(char *commandp, int size)
 	    (uboot_initrd_end > uboot_initrd_start)) {
 		initrd_start = uboot_initrd_start;
 		initrd_end = uboot_initrd_end;
-		ROOT_DEV = Root_RAM0;
 		pr_info("initrd at 0x%lx:0x%lx\n", initrd_start, initrd_end);
 	}
 #endif /* if defined(CONFIG_BLK_DEV_INITRD) */
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 11b9b6b63e19..a78e24873231 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -173,7 +173,6 @@ static unsigned long __init init_initrd(void)
 		goto disable;
 	}
 
-	ROOT_DEV = Root_RAM0;
 	return PFN_UP(end);
 disable:
 	initrd_start = 0;
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 68d47c53876c..97d330f3b8f1 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -363,17 +363,14 @@ void __init check_for_initrd(void)
 	DBG(" -> check_for_initrd()  initrd_start=0x%lx  initrd_end=0x%lx\n",
 	    initrd_start, initrd_end);
 
-	/* If we were passed an initrd, set the ROOT_DEV properly if the values
-	 * look sensible. If not, clear initrd reference.
+	/* If we were not passed an sensible initramfs, clear initramfs reference.
 	 */
-	if (is_kernel_addr(initrd_start) && is_kernel_addr(initrd_end) &&
-	    initrd_end > initrd_start)
-		ROOT_DEV = Root_RAM0;
-	else
+	if (!(is_kernel_addr(initrd_start) && is_kernel_addr(initrd_end) &&
+	    initrd_end > initrd_start))
 		initrd_start = initrd_end = 0;
 
 	if (initrd_start)
-		pr_info("Found initrd at 0x%lx:0x%lx\n", initrd_start, initrd_end);
+		pr_info("Found initramfs at 0x%lx:0x%lx\n", initrd_start, initrd_end);
 
 	DBG(" <- check_for_initrd()\n");
 #endif /* CONFIG_BLK_DEV_INITRD */
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index eb092f293113..237d8386a3f4 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -296,9 +296,7 @@ static void __init pmac_setup_arch(void)
 #endif
 #ifdef CONFIG_PPC32
 #ifdef CONFIG_BLK_DEV_INITRD
-	if (initrd_start)
-		ROOT_DEV = Root_RAM0;
-	else
+	if (!initrd_start)
 #endif
 		ROOT_DEV = DEFAULT_ROOT_DEVICE;
 #endif
diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 7b529868789f..a4ce721b7fe8 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -923,8 +923,6 @@ void __init setup_arch(char **cmdline_p)
 	/* boot_command_line has been already set up in early.c */
 	*cmdline_p = boot_command_line;
 
-        ROOT_DEV = Root_RAM0;
-
 	setup_initial_init_mm(_text, _etext, _edata, _end);
 
 	if (IS_ENABLED(CONFIG_EXPOLINE_AUTO))
diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index 50f1d39fe34f..c4312ee13db9 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -147,10 +147,8 @@ void __init check_for_initrd(void)
 
 	/*
 	 * If we got this far in spite of the boot loader's best efforts
-	 * to the contrary, assume we actually have a valid initrd and
-	 * fix up the root dev.
+	 * to the contrary, assume we actually have a valid initramfs.
 	 */
-	ROOT_DEV = Root_RAM0;
 
 	/*
 	 * Address sanitization
diff --git a/include/linux/root_dev.h b/include/linux/root_dev.h
index 847c9a06101b..e411533b90b7 100644
--- a/include/linux/root_dev.h
+++ b/include/linux/root_dev.h
@@ -10,7 +10,6 @@ enum {
 	Root_NFS = MKDEV(UNNAMED_MAJOR, 255),
 	Root_CIFS = MKDEV(UNNAMED_MAJOR, 254),
 	Root_Generic = MKDEV(UNNAMED_MAJOR, 253),
-	Root_RAM0 = MKDEV(RAMDISK_MAJOR, 0),
 };
 
 extern dev_t ROOT_DEV;
diff --git a/init/do_mounts.c b/init/do_mounts.c
index f0b1a83dbda4..5c407ca54063 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -437,8 +437,6 @@ static dev_t __init parse_root_device(char *root_device_name)
 		return Root_NFS;
 	if (strcmp(root_device_name, "/dev/cifs") == 0)
 		return Root_CIFS;
-	if (strcmp(root_device_name, "/dev/ram") == 0)
-		return Root_RAM0;
 
 	error = early_lookup_bdev(root_device_name, &dev);
 	if (error) {
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
