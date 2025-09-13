Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925FECA101F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkFSbU8fAMRV8AoAnqlDW8JOJ5HDAJMc7crd3T93h88=; b=nuIBhIY9dRJ8C4
	8Ic7OeCoqC7ocJnZvv1kaHePY6AUrqcLya0KQGrhJbxPnRZgzdDZxIiTV8KibCiXR5iT1eFgbGkvF
	51gBvIyedysaoWy5dTLJJ+nTCMLxgZL1V/dqK1Tcus2HuY5UpUMoD5dfDz8xw4Eiptd2WiGFC89Q5
	/mE+ft3XgFx05AzEFCvsROwKVL5t1oq+4yl7pwz6ZrR2AHD4ZptdibxubSb9UDu2DaaZoNyJVtNiX
	5RQh9+IgERJqHqo39aj4Uurjff298a03dB5nUFPUocN7EPd3HeFFyOaFt7ruM8HX4H7tWtm7nwAdg
	DvfcXq1sdB6IGHCIhQUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEeL-0000000CUF3-1gqN;
	Sat, 13 Sep 2025 01:01:57 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEeH-0000000CUBF-21d2
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:01:56 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b0415e03e25so324647366b.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 18:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725311; x=1758330111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZEc0E3RkrtT53PvUmeExPdZ+yV/ZVWq9ufU5BOWTEg=;
        b=gTpUp5AjUpGnpTrcRBtN82RPx+OEvmekbm+WmmWM3vYir8hfDy2j1vJOL7FG4cxgzF
         OaTAOYqKwWpRss4peVfKldvaCyYtqGOd/CTIsK+eHkU4vcYcTh8qxic5p46156qUmOcx
         6wIlx0f2FIHf6WrlYG0Jqch1uaucg0HE6D5yVaeypxv1Il7ewBW0gSjTyWGdwlSe+NHI
         TZIDXztXP0QcOu/R2iHcOuvdNjy2eus6qa+vWEp++y8AHrlOtMD7LrA8UAqcV9Qw6FJT
         Wx24yQFofDn9HvPmiXKrGOq9tIcqcXqDf4kmeVnukdMjRnksCAaMakDXAiq60nl55NC9
         /Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725311; x=1758330111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZEc0E3RkrtT53PvUmeExPdZ+yV/ZVWq9ufU5BOWTEg=;
        b=boD7H4JwXkiYo1NTS38gMet0LkcdddTi8itW6VFgiVFjexr8cX/rIKrPEYb5iMvQzQ
         +1snU7EqRJjYHVs+1OLHiv+nRBuCudCpQMY6yvQEvzujIrMUrJ7CG1/NPzAYGaGhr+Ob
         whlK4Ni1Wa+iny5NkOM/TRBGnisA94a6b5dTrJWD9x8xXbiQAWcbDI5/XDXB5rqRai/S
         BTjv0ZEhUIE3ZJEwfhqQ+LaH6EV6LccaTe6EiecFh2cYANrqJzlgeiBbuxJVoJEsx922
         Iz+JtMfmdJKDSz8Cg4RtFno60SWiG2XOL8cAm4KN86ee/oDBtciwWdmlXIQ9Sglv/kfe
         rUVg==
X-Forwarded-Encrypted: i=1; AJvYcCWL9c9Rmgi1ouA/iCtJvjvJ6RTj2vSPcZW/NiLz5i97qwlukxV4fCs9hrpbuOTbqemyNBlz3t2h55VBsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YybCRPLFC4doYZAkoxsvbKJro5VTPAVi5JNDWw0U1Y4XyP0fs8x
	bdNC4tdT8mnzRZcJsenI/2txuBbnUsa7M1KpAKK87TQxsNTzuOtrSBAz
X-Gm-Gg: ASbGnctsXdYq0i++oP2AroYOdcNSwizMr/YLc0TbzIkIc5t1RZl93p0x5MCxdx94IKs
	dH78Lx+9I3FV7w+NzbHvlYQGKiRovJP71MaJFfpCfgCv5olbNejs3c0+/Sejd2s4f7rNojpq3Xb
	mghLYMPLW8TW+VYIgcS1+5CitXvAr0+vq8nqJXI4MC2RbUPBnFj+rDNm4oBZIkQ+aCj8b9tt4nr
	RSvQrq7XBWh31g4S0rrf87QIHric1ORszxTiCY6sE7XylmSdGPh5qbzl18HsAguTiaTPPa/xGt/
	mFBt+T3NNmR8e7JGKUCJQZYSywPm6/10bzlrzISzYVBCyuk8I0j6nxk9TAFe5xbTqFzaQ0dlAlD
	vukAy7YeBtRkBPF/3xbdtAOrge84ZmQ==
X-Google-Smtp-Source: AGHT+IEAi4xtonmhCaT33K2Hzh7yyRfMcFV0HvMSUAxXUtkPqhwfRFML0tJIQIoV7OGJ/h1kr7fV7w==
X-Received: by 2002:a17:907:3d0c:b0:b04:7880:3e8c with SMTP id a640c23a62f3a-b07c3820252mr475574166b.38.1757725311044;
        Fri, 12 Sep 2025 18:01:51 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b317124esm476784166b.46.2025.09.12.18.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:01:50 -0700 (PDT)
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
Subject: [PATCH RESEND 20/62] doc: remove Documentation/power/swsusp-dmcrypt.rst
Date: Sat, 13 Sep 2025 00:37:59 +0000
Message-ID: <20250913003842.41944-21-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_180153_568774_EDA9A379 
X-CRM114-Status: GOOD (  24.99  )
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

It contains obsolete initrd and lilo based instructions

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/power/index.rst                 |   1 -
 Documentation/power/swsusp-dmcrypt.rst        | 140 ------------------
 .../translations/zh_CN/power/index.rst        |   1 -
 3 files changed, 142 deletions(-)
 delete mode 100644 Documentation/power/swsusp-dmcrypt.rst

diff --git a/Documentation/power/index.rst b/Documentation/power/index.rst
index a0f5244fb427..9f1758c92e48 100644
--- a/Documentation/power/index.rst
+++ b/Documentation/power/index.rst
@@ -22,7 +22,6 @@ Power Management
     suspend-and-cpuhotplug
     suspend-and-interrupts
     swsusp-and-swap-files
-    swsusp-dmcrypt
     swsusp
     video
     tricks
diff --git a/Documentation/power/swsusp-dmcrypt.rst b/Documentation/power/swsusp-dmcrypt.rst
deleted file mode 100644
index afb29a58fdf8..000000000000
--- a/Documentation/power/swsusp-dmcrypt.rst
+++ /dev/null
@@ -1,140 +0,0 @@
-=======================================
-How to use dm-crypt and swsusp together
-=======================================
-
-Author: Andreas Steinmetz <ast@domdv.de>
-
-
-
-Some prerequisites:
-You know how dm-crypt works. If not, visit the following web page:
-http://www.saout.de/misc/dm-crypt/
-You have read Documentation/power/swsusp.rst and understand it.
-You did read Documentation/filesystems/ramfs-rootfs-initramfs.rst and know how an initrd works.
-You know how to create or how to modify an initrd.
-
-Now your system is properly set up, your disk is encrypted except for
-the swap device(s) and the boot partition which may contain a mini
-system for crypto setup and/or rescue purposes. You may even have
-an initrd that does your current crypto setup already.
-
-At this point you want to encrypt your swap, too. Still you want to
-be able to suspend using swsusp. This, however, means that you
-have to be able to either enter a passphrase or that you read
-the key(s) from an external device like a pcmcia flash disk
-or an usb stick prior to resume. So you need an initrd, that sets
-up dm-crypt and then asks swsusp to resume from the encrypted
-swap device.
-
-The most important thing is that you set up dm-crypt in such
-a way that the swap device you suspend to/resume from has
-always the same major/minor within the initrd as well as
-within your running system. The easiest way to achieve this is
-to always set up this swap device first with dmsetup, so that
-it will always look like the following::
-
-  brw-------  1 root root 254, 0 Jul 28 13:37 /dev/mapper/swap0
-
-Now set up your kernel to use /dev/mapper/swap0 as the default
-resume partition, so your kernel .config contains::
-
-  CONFIG_PM_STD_PARTITION="/dev/mapper/swap0"
-
-Prepare your boot loader to use the initrd you will create or
-modify. For lilo the simplest setup looks like the following
-lines::
-
-  image=/boot/vmlinuz
-  initrd=/boot/initrd.gz
-  label=linux
-  append="root=/dev/ram0 init=/linuxrc rw"
-
-Finally you need to create or modify your initrd. Lets assume
-you create an initrd that reads the required dm-crypt setup
-from a pcmcia flash disk card. The card is formatted with an ext2
-fs which resides on /dev/hde1 when the card is inserted. The
-card contains at least the encrypted swap setup in a file
-named "swapkey". /etc/fstab of your initrd contains something
-like the following::
-
-  /dev/hda1   /mnt    ext3      ro                            0 0
-  none        /proc   proc      defaults,noatime,nodiratime   0 0
-  none        /sys    sysfs     defaults,noatime,nodiratime   0 0
-
-/dev/hda1 contains an unencrypted mini system that sets up all
-of your crypto devices, again by reading the setup from the
-pcmcia flash disk. What follows now is a /linuxrc for your
-initrd that allows you to resume from encrypted swap and that
-continues boot with your mini system on /dev/hda1 if resume
-does not happen::
-
-  #!/bin/sh
-  PATH=/sbin:/bin:/usr/sbin:/usr/bin
-  mount /proc
-  mount /sys
-  mapped=0
-  noresume=`grep -c noresume /proc/cmdline`
-  if [ "$*" != "" ]
-  then
-    noresume=1
-  fi
-  dmesg -n 1
-  /sbin/cardmgr -q
-  for i in 1 2 3 4 5 6 7 8 9 0
-  do
-    if [ -f /proc/ide/hde/media ]
-    then
-      usleep 500000
-      mount -t ext2 -o ro /dev/hde1 /mnt
-      if [ -f /mnt/swapkey ]
-      then
-        dmsetup create swap0 /mnt/swapkey > /dev/null 2>&1 && mapped=1
-      fi
-      umount /mnt
-      break
-    fi
-    usleep 500000
-  done
-  killproc /sbin/cardmgr
-  dmesg -n 6
-  if [ $mapped = 1 ]
-  then
-    if [ $noresume != 0 ]
-    then
-      mkswap /dev/mapper/swap0 > /dev/null 2>&1
-    fi
-    echo 254:0 > /sys/power/resume
-    dmsetup remove swap0
-  fi
-  umount /sys
-  mount /mnt
-  umount /proc
-  cd /mnt
-  pivot_root . mnt
-  mount /proc
-  umount -l /mnt
-  umount /proc
-  exec chroot . /sbin/init $* < dev/console > dev/console 2>&1
-
-Please don't mind the weird loop above, busybox's msh doesn't know
-the let statement. Now, what is happening in the script?
-First we have to decide if we want to try to resume, or not.
-We will not resume if booting with "noresume" or any parameters
-for init like "single" or "emergency" as boot parameters.
-
-Then we need to set up dmcrypt with the setup data from the
-pcmcia flash disk. If this succeeds we need to reset the swap
-device if we don't want to resume. The line "echo 254:0 > /sys/power/resume"
-then attempts to resume from the first device mapper device.
-Note that it is important to set the device in /sys/power/resume,
-regardless if resuming or not, otherwise later suspend will fail.
-If resume starts, script execution terminates here.
-
-Otherwise we just remove the encrypted swap device and leave it to the
-mini system on /dev/hda1 to set the whole crypto up (it is up to
-you to modify this to your taste).
-
-What then follows is the well known process to change the root
-file system and continue booting from there. I prefer to unmount
-the initrd prior to continue booting but it is up to you to modify
-this.
diff --git a/Documentation/translations/zh_CN/power/index.rst b/Documentation/translations/zh_CN/power/index.rst
index bc54983ba515..4ee880e65107 100644
--- a/Documentation/translations/zh_CN/power/index.rst
+++ b/Documentation/translations/zh_CN/power/index.rst
@@ -32,7 +32,6 @@ TODOList:
     * suspend-and-cpuhotplug
     * suspend-and-interrupts
     * swsusp-and-swap-files
-    * swsusp-dmcrypt
     * swsusp
     * video
     * tricks
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
