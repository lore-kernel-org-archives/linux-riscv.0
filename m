Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F919CA101F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XoL5q0Pl6Hdh/Xmq+i5QZzfS0QaJFEizUNGYeSojE5I=; b=hw0vNl/bz+cNo5
	UM20t7+T4TbYJp9yYOp100Jeq91MNaIgMxaWS7+wXrqmv9CttpuvjQtOarw8D+aw5keLjPPjg6/a2
	KbvF3lWq/WWwkPQe/1uBvhc/Ff79g1RHJ4BsqL+EJJ6ZSHzCssbXqal+KAOZRtlAXhikvenPTYACo
	QbTXkpR8hI1SuZdz4uVx/OdIWDzjUauvtHXhx+N6qLrPnH7FE/HU/+7honFr2HkkOviw3Mc7fqtOw
	1gR5QPEWF7qkFgOzdQBBTCdhIFGV4HPKwX3EDUCIVlNBD1rLnm2qfQDayLQ+VJgutTMxIIyfCAFBy
	wpNJhKC6JEhCpHGNuh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEq4-0000000CYio-2eVB;
	Sat, 13 Sep 2025 01:14:04 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEq2-0000000CYhS-1lhf
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:14:03 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b07e3a77b72so31721366b.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 18:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726040; x=1758330840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKplWAnltyYUA7miE90Ca2CY8VaXOWztn2OaioKTh7Y=;
        b=jDvlGQXefzviDWEgpo9qI6KBTiYPRve0tCHjy+9642u6TSUebFKKviijweVanCBBXm
         WhDJZi70hEO+7z28ulQObQWg2XQLizQmwNTKw+h96/0hK+PFGnyaPHGJjc3RjexHzKj5
         N+gjYBKuygVXWK2JRLPB3vkWjRWRemYq5TQDdH9eZDiUCtVLJl6dLo+UtYlts+dyTU2w
         /WHd60mhmEl2e3ehTwNjknk5HfKrJXVXwfkIUigHfmDap0nIfQhrvNrhGveL8noNa/5C
         OvhPBSZsHCPLMIl0hT1JVvYV5H3bPWtZ4ZHq5n9Vx/ZcD9AtPa2+u5fiDWKg26vI53Gg
         iF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726040; x=1758330840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKplWAnltyYUA7miE90Ca2CY8VaXOWztn2OaioKTh7Y=;
        b=VX3ug1QDChP+KGpcELzYIrCQGFRB9CDNZBuBqvB+YXGynw0bk9YEL5QViJ14OovMt4
         0vHCeK+iRbSXhocKdUZtZGJQleAhkNzBHMqr/VIzyBRSSY1P/4WL1JB01VMWA2eg7JXF
         PM2jw323XXH0sG/lx4qCkU9INfJUTTb4z/HejSeiltzQjVJVYbT7joGVZM/HAI2O/AeI
         5EiJpYlactYaFtzwu/tQdLZ5tQ8xyx8WYq4WBIp+0iaLSWlB4ZXygcu2B81MNxPiYc2z
         0GfqF3FyOcGHuWaWHzb2ZItWAm9eK9h8J2ZfgAm3Ig+wBOS8AaLzus0WLF2qYeWdlVWF
         mDFw==
X-Forwarded-Encrypted: i=1; AJvYcCUNwRbdd8harQOjqT7sx47TG85ZQHrVRW02VjnBy0VbhlEm4VD1VR8IDXW1UGvRCvF/9KGuYYrJBQOJqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YweCVGZtUksMqPKDcvy4v//xop4T0+qJqoOW8/8YitztJ3zchrU
	e9pC7OwSXzOBbKLEUxQ3SIvRNNeUSBgQeLMwagC7WIIFhYm0d7BpbvZF
X-Gm-Gg: ASbGnctBbDhzN6tqNaKA41tTGmBY2DaPogbvi+9assGnuRyj7p8a12T/C62TF5rm2eZ
	cBFZhGsA9sWWgA7EmOS00Q81aeoDsp0RSOqyz7wG39M6/cpZ01Hofe8dQBYU+0sRih4+jQHnO3u
	XRGlGyGISyIt8mj6t0vRa6wSgQol0UtHdI6lk3KBWpTC1xZVDHpeiM5VUuVps9eCI+COXX9Nfe2
	eS3zVI3LbqjHF/LblUG5RQ6+dlLTgzqQ8aAgvhuqv5s0TJndqWPIjqP8yXdUnRF/jwQ4HIsXV6h
	LRbvBj0jzAGht9OKLMePvD66WBsVTR+j//Y6LZ8PJF2zBtVn6zgqi6lMWk7yaSDizriuzB2WSGa
	W3fA8QKUL7ukFnw2U650=
X-Google-Smtp-Source: AGHT+IEnK8aPf5G48k9Kvznzx9z/ncVW6jv1PE49Xay12m4larnapJ0sjzKIoAPfuRHHNKc71/ZXZg==
X-Received: by 2002:a17:907:86a7:b0:afe:8420:1152 with SMTP id a640c23a62f3a-b07a6490897mr877727966b.18.1757726040472;
        Fri, 12 Sep 2025 18:14:00 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b3128a1esm461508066b.29.2025.09.12.18.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:13:59 -0700 (PDT)
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
Subject: [PATCH RESEND 31/62] init: rename initrd_below_start_ok to initramfs_below_start_ok
Date: Sat, 13 Sep 2025 00:38:10 +0000
Message-ID: <20250913003842.41944-32-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_181402_496183_4DCC533C 
X-CRM114-Status: GOOD (  16.99  )
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

It refers to initramfs, not to initrd

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/csky/kernel/setup.c     | 2 +-
 arch/mips/kernel/setup.c     | 2 +-
 arch/openrisc/kernel/setup.c | 2 +-
 arch/parisc/mm/init.c        | 2 +-
 arch/xtensa/kernel/setup.c   | 4 ++--
 drivers/of/fdt.c             | 2 +-
 include/linux/initrd.h       | 2 +-
 init/do_mounts_initrd.c      | 2 +-
 init/initramfs.c             | 2 +-
 init/main.c                  | 2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
index ce128888462e..403a977b8c1f 100644
--- a/arch/csky/kernel/setup.c
+++ b/arch/csky/kernel/setup.c
@@ -40,7 +40,7 @@ static void __init setup_initrd(void)
 	pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",
 		(void *)(virt_external_initramfs_start), size);
 
-	initrd_below_start_ok = 1;
+	initramfs_below_start_ok = 1;
 
 	return;
 
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index da11ae875539..aed454ebd751 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -225,7 +225,7 @@ static void __init finalize_initrd(void)
 	maybe_bswap_initrd();
 
 	memblock_reserve(__pa(virt_external_initramfs_start), size);
-	initrd_below_start_ok = 1;
+	initramfs_below_start_ok = 1;
 
 	pr_info("Initial ramdisk at: 0x%lx (%lu bytes)\n",
 		virt_external_initramfs_start, size);
diff --git a/arch/openrisc/kernel/setup.c b/arch/openrisc/kernel/setup.c
index f387dc57ec35..337a0381c452 100644
--- a/arch/openrisc/kernel/setup.c
+++ b/arch/openrisc/kernel/setup.c
@@ -246,7 +246,7 @@ void __init setup_arch(char **cmdline_p)
 	} else {
 		printk(KERN_INFO "Initial ramdisk at: 0x%p (%lu bytes)\n",
 		       (void *)(virt_external_initramfs_start), virt_external_initramfs_end - virt_external_initramfs_start);
-		initrd_below_start_ok = 1;
+		initramfs_below_start_ok = 1;
 	}
 #endif
 
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 74bfe9797589..af7a33c8bd31 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -308,7 +308,7 @@ static void __init setup_bootmem(void)
 			} else {
 				initrd_reserve = virt_external_initramfs_end - virt_external_initramfs_start;
 			}
-			initrd_below_start_ok = 1;
+			initramfs_below_start_ok = 1;
 			printk(KERN_INFO "initrd: reserving %08lx-%08lx (mem_max %08lx)\n", __pa(virt_external_initramfs_start), __pa(virt_external_initramfs_start) + initrd_reserve, mem_max);
 
 			memblock_reserve(__pa(virt_external_initramfs_start), initrd_reserve);
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index 2e9003be3e8c..b86367178bce 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -51,7 +51,7 @@
 #ifdef CONFIG_BLK_DEV_INITRD
 extern unsigned long virt_external_initramfs_start;
 extern unsigned long virt_external_initramfs_end;
-extern int initrd_below_start_ok;
+extern int initramfs_below_start_ok;
 #endif
 
 #ifdef CONFIG_USE_OF
@@ -292,7 +292,7 @@ void __init setup_arch(char **cmdline_p)
 #ifdef CONFIG_BLK_DEV_INITRD
 	if (virt_external_initramfs_start < virt_external_initramfs_end &&
 	    !mem_reserve(__pa(virt_external_initramfs_start), __pa(virt_external_initramfs_end)))
-		initrd_below_start_ok = 1;
+		initramfs_below_start_ok = 1;
 	else
 		virt_external_initramfs_start = 0;
 #endif
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index baf8347e0314..127b37f211cb 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -767,7 +767,7 @@ static void __early_init_dt_declare_initrd(unsigned long start,
 	    !(IS_ENABLED(CONFIG_RISCV) && IS_ENABLED(CONFIG_64BIT))) {
 		virt_external_initramfs_start = (unsigned long)__va(start);
 		virt_external_initramfs_end = (unsigned long)__va(end);
-		initrd_below_start_ok = 1;
+		initramfs_below_start_ok = 1;
 	}
 }
 
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index f19efebe8221..364b603215ac 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -4,7 +4,7 @@
 #define __LINUX_INITRD_H
 
 /* 1 if it is not an error if virt_external_initramfs_start < memory_start */
-extern int initrd_below_start_ok;
+extern int initramfs_below_start_ok;
 
 extern unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
 extern void free_initrd_mem(unsigned long, unsigned long);
diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 535ce459ab94..d8b809ced11b 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -12,7 +12,7 @@
 
 #include "do_mounts.h"
 
-int initrd_below_start_ok;
+int initramfs_below_start_ok;
 
 static int __init early_initrdmem(char *p)
 {
diff --git a/init/initramfs.c b/init/initramfs.c
index d2301cc6c470..a9c5d211665d 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -643,7 +643,7 @@ void __init reserve_initrd_mem(void)
 	/* Now convert initrd to virtual addresses */
 	virt_external_initramfs_start = (unsigned long)__va(phys_external_initramfs_start);
 	virt_external_initramfs_end = virt_external_initramfs_start + phys_external_initramfs_size;
-	initrd_below_start_ok = 1;
+	initramfs_below_start_ok = 1;
 
 	return;
 disable:
diff --git a/init/main.c b/init/main.c
index 5f4d860ab72a..58a7199c81f7 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1047,7 +1047,7 @@ void start_kernel(void)
 	locking_selftest();
 
 #ifdef CONFIG_BLK_DEV_INITRD
-	if (virt_external_initramfs_start && !initrd_below_start_ok &&
+	if (virt_external_initramfs_start && !initramfs_below_start_ok &&
 	    page_to_pfn(virt_to_page((void *)virt_external_initramfs_start)) < min_low_pfn) {
 		pr_crit("initrd overwritten (0x%08lx < 0x%08lx) - disabling it.\n",
 		    page_to_pfn(virt_to_page((void *)virt_external_initramfs_start)),
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
