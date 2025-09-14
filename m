Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C5FCAC58F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 03:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4fCfv6v/l4dPjWnkKRRFHHjDPLLrQ9rOMv2bJ06i1I=; b=2aBBdcw30Mwhwf
	fmpWebGxPdi5SwB0MEOr+vfUaKVlc3sYvKZnjsrPEwEUVm99VgCx1LJ4G0f9oxWsAl6LWmEf7qyM6
	f6xDtL6ljpnck64YWnw1kJm7buzGZrv2N5DrokvxnPBSiM/lXwODc6RoouOkk2AJhUm8X8CBARFpu
	dA+kBdhN4P7flY/JQa2gLiqCzP6H4Zmn0gIDwNhUSSahxUvRMYrREjcy7XgB0Z69xLXvyYUJZtRz5
	ZYkD2r9dBf6cEFVRhgPFn6veENvJMzuduz2hiOq4cERvXoMrXBRT7dKVEnsbSbuWfXSdE/a7ATJlg
	F7P7Ozk65mD8F7jQJyLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdrV-0000000HOWK-3VvJ;
	Sun, 14 Sep 2025 03:57:13 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdrS-0000000HOSv-0znW
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 03:57:12 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b07e081d852so184010066b.2
        for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 20:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822228; x=1758427028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7psSH4JIkuISYR7xy9RNjBVG2GzEUFc3+zgpdmbt9Y=;
        b=aHc0TaWXLKfVoRv9nfC+fPJddR0M/Us8cPDkTDwVYo8wjE0P4auY2/r59NjnLCEu/i
         2GYfn89I74PLd+BN6988FQAqKT+0MGIv4IWWCnXpq2LAGrFkQFsK7exNYnTu5F4A1Bgg
         YtsqxEsrzN1Sq/S+TJFubeZ3rLYvGC0PLMeOWiN8bOG5KCciyXW6Ox+32SqYl5MmgoaD
         mlAhARzGGghCH031FcHYIFRv9mbYs6rkSuFHMp8+0bgDfOWL53DkY3uFu0YUbvhQAn1g
         G/bWty5s6evhif3vawMzjQc4we6nNC64tqB8VPK1zavIHd7qv2Lj86IvknmvVPOGxdRa
         d4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822228; x=1758427028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7psSH4JIkuISYR7xy9RNjBVG2GzEUFc3+zgpdmbt9Y=;
        b=KlBah78VGTiwE6w9X/ZYND1D6X2oxwn5bcjyhq1X9/mJlx6MpazvrCYN+xmzedHbCv
         umTKJm09RqScoTUzEyX+aiI/hz7G4jZQOHmWndurxWE63ml9tJO8To6DJqxP1fdi1vZS
         JPHKv5QHoRuxpUBIi5nUwFd2MyxPMOveROuHKIMVHcqUJkUt6N1vjkhbfHDb8Vdh28I7
         nh8b5fRmRtHbJN9HTLEXVGoNClIYWPJm4QwZKFXSWTBvyr0rnlJ/Y3KlWokex4mx6TU6
         BTgthqQG4oDMgSpVIM/qDNjxqpQtWkRW0n+2Du8ApR4uRKFF85OcGDmhq8LzA6e6+/JA
         LU8A==
X-Forwarded-Encrypted: i=1; AJvYcCXap/jHw/FjcB8mITlgYwz9Drz8clDY54fyJREMZm1lDk4r1936WaGUiiFqQYgiMbeq5QkFZ47XFDnT4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnU0ZH9gqP3fjxfFgUspifq+rC2kJbnTrgohjAJicDA77yILYU
	VAy0Y69lG0pmd7/AOgezYNLN5oyJ7elPFt+tygdj+I/YF1pRuf9rjseS
X-Gm-Gg: ASbGncuRMejwOcct2opsICP+dmVKyTzY+oyxU63wO1HtQ6UVrRuEeUkJ6iUn/UDsEyr
	VLRIqqH5v17HGz8jz1KdKWpAYKsQ5X6JCQd0EKyQswE+2K/OJFzQFv8kuYGMxZ/DWQu9lPN1hqq
	CJQgTg3sGxw4JXZ3OY7D89Hlb0oVkvpt4OamkM9K9CASLnU1ayDM+GfiIw+HAMp4vszI2rSZHNW
	XGP0LwkBF5RDOnyP1VfT3/ZibC04+B9pzJ3+gArzR1k6TTXCx6aGFWAOLUVQDdKl0uQ2JA27dw5
	gl2bFUso+irz6KGfl2iFMfMvNerkEe9N648gHk21d6CkHBPyQPfGtkbSOE7jKk1TnqEoeQb30zv
	9afGvRj1S/pQsKIxFdivHPqh3thv5Xg==
X-Google-Smtp-Source: AGHT+IHHnPU+sOVT053l7deT3P8z3LJVFAOiksWjmZKd0Ub2gBIDgZK1/4gCPHfUrNaBqPQVOEAIKA==
X-Received: by 2002:a17:907:d16:b0:b04:6338:c936 with SMTP id a640c23a62f3a-b07c35b8e53mr876582466b.17.1757822228258;
        Sat, 13 Sep 2025 20:57:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32f1e54sm673986866b.75.2025.09.13.20.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:57:07 -0700 (PDT)
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
Subject: [PATCH RESEND 49/62] init: rename ramdisk_execute_command to initramfs_execute_command
Date: Sun, 14 Sep 2025 06:57:03 +0300
Message-ID: <20250914035703.3729713-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_205710_292339_B692943A 
X-CRM114-Status: GOOD (  13.65  )
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

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/init/main.c b/init/main.c
index 5186233c64fd..cbebd64f523c 100644
--- a/init/main.c
+++ b/init/main.c
@@ -160,7 +160,7 @@ static size_t initargs_offs;
 #endif
 
 static char *execute_command;
-static char *ramdisk_execute_command = "/init";
+static char *initramfs_execute_command = "/init";
 
 /*
  * Used to generate warnings if static_key manipulation functions are used
@@ -609,7 +609,7 @@ static int __init rdinit_setup(char *str)
 {
 	unsigned int i;
 
-	ramdisk_execute_command = str;
+	initramfs_execute_command = str;
 	/* See "auto" comment in init_setup */
 	for (i = 1; i < MAX_INIT_ARGS; i++)
 		argv_init[i] = NULL;
@@ -1491,12 +1491,12 @@ static int __ref kernel_init(void *unused)
 
 	do_sysctl_args();
 
-	if (ramdisk_execute_command) {
-		ret = run_init_process(ramdisk_execute_command);
+	if (initramfs_execute_command) {
+		ret = run_init_process(initramfs_execute_command);
 		if (!ret)
 			return 0;
 		pr_err("Failed to execute %s (error %d)\n",
-		       ramdisk_execute_command, ret);
+		       initramfs_execute_command, ret);
 	}
 
 	/*
@@ -1588,11 +1588,11 @@ static noinline void __init kernel_init_freeable(void)
 	 * the work
 	 */
 	int ramdisk_command_access;
-	ramdisk_command_access = init_eaccess(ramdisk_execute_command);
+	ramdisk_command_access = init_eaccess(initramfs_execute_command);
 	if (ramdisk_command_access != 0) {
 		pr_warn("check access for rdinit=%s failed: %i, ignoring\n",
-			ramdisk_execute_command, ramdisk_command_access);
-		ramdisk_execute_command = NULL;
+			initramfs_execute_command, ramdisk_command_access);
+		initramfs_execute_command = NULL;
 		prepare_namespace();
 	}
 
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
