Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A143CA101F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 00:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/MHyUv3dAbO6aNWf5yO6LIQBLFp5VUpNnxLbJGlh4A=; b=dayGJB3GrbPjZU
	VP+YfNZ6O1wEJAdZwfp84n5CK16rw6JGUNIoYcsmvr+Hp2f+OHvjtz+oLoUhQnXreh63ErI6m6/rH
	QPx0pdD7MlEy0bt2Tx1I0CC9HFN2KHo8MeLeYpG127shlsLpDC7inK8Yv7cOIjE9FBNMxmZ/2s0wq
	ib7EkVSvelh7y7Ku9xdCx4+qUmDDovg3l58Fmngh9ikGfF8aa9zTfkXWRRDNnuGJm8D4f5F7ZOxVx
	EeuBq+h/l3Xg8GdjksvcPDJYBD404QspQKqLlP8Z4DfwueunMGAGGioLS/BmLkZq+U+NlTt3o2faP
	Iwn05O/sGm5QgFU4cVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEOS-0000000CNxl-3eF0;
	Sat, 13 Sep 2025 00:45:32 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEOQ-0000000CNwD-3Z8z
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 00:45:32 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b043a33b060so374069466b.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 17:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724329; x=1758329129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fi1FJKwP9nWnSjptSGh11GRsqwR1G48l7l6Ou3g4XAs=;
        b=mSprhB5RyxyZORyznotfPNWc/0UcKQ2e7uIAOIYWbccO3ythPL2DIR6ZBOTvp89hmi
         oq6AWwT3bRdzD4VZuOb4/fIb72bGCWCt8nBIbT1k49jiJQL+8Ja+Mgy2NVS/KCHk6dui
         aL7tO+UI1G+7s5dtiu+IXzoRmhPHXIwyLCkgqjV9aMpcdMwDCK6kQL4y5aXGScKOGRBd
         u14sV7Zm7Y7smR4yb+5RlL4RI/m9dWYZ3yOLygugC5ch4aIvKxLQ3jpgIWcr4hI+buj8
         0oMysndDHDYV4GiUBrwcSg1P7arLhTgNqnmXdbQGVhVY282cAATgRm9MPJ1aOD2FD7ye
         hXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724329; x=1758329129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fi1FJKwP9nWnSjptSGh11GRsqwR1G48l7l6Ou3g4XAs=;
        b=O6idlWokdRzgvyEjAUas3eXQ5TV3MWX3+1ujXX6Sx32TpnZqUeqU7oUpc4BRfMIyFR
         PpQn4PLBSJjTwnz5d7bY6LiEW4Q6iOaun9XEBv4TJDOsids7+fyVJJlTovRLZK9ubg4I
         LL05gU3+37qEoOUo0VUTQ+7J6WpS/EA5Q8LcgqTwDZP5/tON+O/S10QwW54eMojoZ2Kc
         +kqyvMgiU3GEmDYcNCL6D6klz6a0itwdI+o92zYQ+uFesA+LUSNJyYt3x2G1N2XZYVFu
         jV9AkFWeT8TOqRyz89iIjW3zEz/S6H/2rtGvVRpSRyTpEOeKGXrZ0qF/bvnc0Pcwvb5r
         YdaA==
X-Forwarded-Encrypted: i=1; AJvYcCVfgwge4UoXD6D1PYPmVaaOm3xP0SJu7tjMQ4rnhqhlYXZm6HS5Fsx4nbHyWGB+/ejIg2DBVWTDkaz5LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMyNHaQMyTxYAfLg8dPMY4WJsG9ZO5pHaCtmJqxt4vZlnG+4y2
	rshFlnI8RFCEsIqLhysKg8O4bPES0Nxa6tKs5VuR9xY5dm6uJej8gKHL
X-Gm-Gg: ASbGncu+nGdGJJTtPSHuoQbVJKY2Rk3z3+e8bn+JoEB2p4yMu0xMEkin+ErW/GnFlbj
	i7D81pXn6j35lCE79M42AtsrwsXPUuE3iLAe/oQ0F8JJkX8JLqF2BZGXCHxvVuIhEDKovva2su9
	k1wZ3ax4l4ksFl0g2jEihjjElkXh78yvDVQhPJatIoOZenlcJ0nnXhb1XtyQyOiolW8w/ALqLRn
	GDajTY0p3YznMm84otP6/g5Q7n6by7o1sDquhBcUS5JduS79W+1W6sI1wBdOMExyovi8ADc8pKn
	jz+oV15CP+UdP3PXyi3F9z5MLRjhDHcuhRxL03O+oCs0W5rd+95O8JgzqDwR4giO49pCgmOCDXJ
	szHBlqC5b53CHNtuu/+g=
X-Google-Smtp-Source: AGHT+IEY39yKNpHOwhu+b8E85JfZO5GXoHp0A73FES6zZeZtQwPXvLC0BV0HcFzY55ZLXxqy2VO9oA==
X-Received: by 2002:a17:907:9405:b0:b07:c9b2:dbd with SMTP id a640c23a62f3a-b07c9b20f2cmr456963866b.4.1757724328684;
        Fri, 12 Sep 2025 17:45:28 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd5casm460965366b.68.2025.09.12.17.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:45:28 -0700 (PDT)
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
Subject: [PATCH RESEND 05/62] init: remove "ramdisk_start" command line parameter, which controls starting block number of initrd
Date: Sat, 13 Sep 2025 00:37:44 +0000
Message-ID: <20250913003842.41944-6-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_174530_900213_FABBE075 
X-CRM114-Status: GOOD (  13.32  )
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

This is preparation for initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/blockdev/ramdisk.rst  | 3 +--
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 init/do_mounts_rd.c                             | 7 -------
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/ramdisk.rst b/Documentation/admin-guide/blockdev/ramdisk.rst
index 9ce6101e8dd9..e57c61108dbc 100644
--- a/Documentation/admin-guide/blockdev/ramdisk.rst
+++ b/Documentation/admin-guide/blockdev/ramdisk.rst
@@ -74,12 +74,11 @@ arch/x86/boot/Makefile.
 
 Some of the kernel command line boot options that may apply here are::
 
-  ramdisk_start=N
   ramdisk_size=M
 
 If you make a boot disk that has LILO, then for the above, you would use::
 
-	append = "ramdisk_start=N ramdisk_size=M"
+	append = "ramdisk_size=M"
 
 4) An Example of Creating a Compressed RAM Disk
 -----------------------------------------------
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f940c1184912..07e8878f1e13 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5285,8 +5285,6 @@
 	ramdisk_size=	[RAM] Sizes of RAM disks in kilobytes
 			See Documentation/admin-guide/blockdev/ramdisk.rst.
 
-	ramdisk_start=	[RAM] RAM disk image start address
-
 	random.trust_cpu=off
 			[KNL,EARLY] Disable trusting the use of the CPU's
 			random number generator (if available) to
diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
index 8e0a774a9c6f..864fa88d9f89 100644
--- a/init/do_mounts_rd.c
+++ b/init/do_mounts_rd.c
@@ -17,13 +17,6 @@
 static struct file *in_file, *out_file;
 static loff_t in_pos, out_pos;
 
-static int __init ramdisk_start_setup(char *str)
-{
-	/* will be removed in next commit */
-	return 1;
-}
-__setup("ramdisk_start=", ramdisk_start_setup);
-
 static int __init crd_load(decompress_fn deco);
 
 /*
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
