Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD30CA101F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8kXZnnW5SsEzBOePr3heVKC1dOppiJrwyqT5yysV7Y=; b=Tqe4ne2Xl6tl2l
	1FbibxwLw5VoK/StZfHZNWRBshtAKM8LSh4HUXsiX/qM32wjqKklYwM1mNEu1hIOqcknSZEjXAJXQ
	Z+MUT83U6ZnKxJCHvFO5Qc0/zl1vl9dLNhqT17IwEYAaYDus2WtawajAFZBfrUwB1AqD20A2F5HM+
	1RDl+nc0o5DWNaMaDZfUz+96MyGoQHnGErm3ZpbDxuvgQslN/GJHhR0Bhs1JM7yx954eva15b5bAx
	ck/ACiBHFULYY/qf9vx0uXOKU28hVaJ/6Ei8yRJIZoPzRFJpMOrkM1Dv/8mculiYYGYAOHqOefxV+
	d62j8X5J+koNkH8liHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEr9-0000000CZB0-0Yh1;
	Sat, 13 Sep 2025 01:15:11 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEr6-0000000CZ8n-062C
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:15:10 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b07e3a77b72so31770366b.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 18:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726106; x=1758330906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGsRGTypi9NqdtciySRZZEpkGgKS+BdOkJag/Ax3VcI=;
        b=lUVqobb39iz643aes1qeh3Vpa3kDsTUuv2UxEKL8DffCOWuDK/6wgNkl9wV34MOn6g
         w9984shkZbzObkjoH8tH5iXJboy49RNQrZDfNI5AAtW+83+ErzcZ+k2ohhR9p0w3LVW5
         I1yCUvix6OBKBtJtZxt4AtySYJe/pZ3cZ4Jd9KaEaGxNYYiwrBK1udAUA1p7KZ5PR+Gx
         EbN+0iSiyy/MMO+sphnCalteQyRIYIViisVSkmKhvLFd+cOgP67bfBcATg0kP7XtA9rP
         Wgn7doo+0UzSsHCKxz4yEJZ9CYamjttsPxb1jII/LH8+Ur8DsjMpA/e9bOyuCv+kz+sg
         9zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726106; x=1758330906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGsRGTypi9NqdtciySRZZEpkGgKS+BdOkJag/Ax3VcI=;
        b=s4DmjXOB7B6UwOrL9xyGPUFgrzPKvA7g65leOJNpJYE1EblqeZ5vTg+vcvWUrpJbz2
         s+d/rei75OqEac3irnBaMzRIb4F/4iz4LnRc6KNdQtTkbk6P0oPOHqH7LA/2cNKLS8R2
         My/KdmGHyu/J64L2LW+I4zNEy9nCifJ2gwnGpjF1iX2gvQIPCrn64SsexIgmtGVJhgkX
         OA9qo8WzceK+zn/xh8ABbWHcpCvluqhOFTP3aLI5UD+Ysj68PF/TaZp2gU6n5owYp5gA
         GmP+xVWsCVoqE1i8Mf5FO6UbjIfLJ8oowci5FcJ/toWBJ3d0RyL+EltCOtasRYzF/vcX
         WeOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF7x7lSQT6jONwrH95LJObywHeyD2riZVR/7R3X8mDn4zRASCPhxdOtL6IiWBnEsqi7ohbM3TPEGAIlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwKoFNGzT/oso8MmYgZi0PSpagyP00JFp8y7JXYRVfcUSiXouH
	2ET4YEtft7WbTa2UgldyNhyw2QxduGELuIK9o1ljDmxaEckOwe4Xtl0K
X-Gm-Gg: ASbGncvQr7GYfXhSZKdcNjBbtFOP5EYX23+WGyJBKkP9FZ/nLbYPJvjMAnOTVrKtuTi
	px94YqAaRIYUtcCnxKbnmU2XI221KyIjehPih61nEzFc/vUV5I7i3IwpMNuNivsUSJCYOOxoscG
	nd28zezdCrxeK+Q2fSbDtYmmDF8qLH+rP9lJ6omCbgxSAYC1fCteCuEMOrdfk4EJlNqun84g5p+
	zDFugSne8vXVf/y/gbfG0cIgLFTMNt78/34M8thUAdiVBab525kZd1u5LNHlyFptfVA8LZCff7u
	ejFI4Oeh4SKARvT0Aa4I5QvaseuYE9IWPLQpkaQ6PKnCpMozf0SCYjMFnV8QpTAh0Y0zEcJfC6f
	IIGo2EvwDroTbzuCMz/4=
X-Google-Smtp-Source: AGHT+IF9BfFXzJCfAH1j6Whgn4db4w3JHUdrGBSr/SBtjDaVKK8KXKnwXgawQKNvW2//sA4Wp0ETBg==
X-Received: by 2002:a17:906:794f:b0:b07:b19c:1389 with SMTP id a640c23a62f3a-b07c2543931mr499914966b.23.1757726105874;
        Fri, 12 Sep 2025 18:15:05 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b334e4fesm475799966b.106.2025.09.12.18.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:15:05 -0700 (PDT)
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
Subject: [PATCH RESEND 32/62] init: move initramfs_below_start_ok to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:11 +0000
Message-ID: <20250913003842.41944-33-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_181508_075225_AB05A177 
X-CRM114-Status: GOOD (  10.96  )
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
 init/do_mounts_initrd.c | 2 --
 init/initramfs.c        | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index d8b809ced11b..509f912c0fce 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -12,8 +12,6 @@
 
 #include "do_mounts.h"
 
-int initramfs_below_start_ok;
-
 static int __init early_initrdmem(char *p)
 {
 	phys_addr_t start;
diff --git a/init/initramfs.c b/init/initramfs.c
index a9c5d211665d..90096177a867 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -601,6 +601,7 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/kexec.h>
 
 unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
+int initramfs_below_start_ok;
 
 phys_addr_t phys_external_initramfs_start __initdata;
 unsigned long phys_external_initramfs_size __initdata;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
