Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D4ACAC582
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=php/5l3+gns8W7RW30TX6IXByecLAd7fLp8fnJPT15E=; b=b3oiOkg7HRchw4
	WSALKOvTIRynmi0Qf42OPTV/oXl44zyTaE+hH4b25uH8bL839Bm437poqhTR6nJelfcL4opivwc2/
	IuyvdqSBMY7ehmsza3Tw90WP2gryTuhyPNVi+wbG07A/ANAQ7Jzvh3ExaVzdJ8UkLXBl10XqdvxJt
	UbYKWiDJnpBwTq4gaNi0uI9MUAcyv+pYzaPH0bzrhUawEpW1ACroOfJgMok2KgCHuTCA9AraV7X8x
	upHmUYM0Mb2IFb7kuXFsDkkEGLcJv+DQVEnqyE12Btl/JP6cN+wjoOyVBDCTRsmVoGNt8x/sTh2Yr
	+HEYD2VL5I6oI8TZhNQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEgU-0000000CUwR-44X2;
	Sat, 13 Sep 2025 01:04:10 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEgP-0000000CUtc-2r5c
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:04:08 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso377929a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 18:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725444; x=1758330244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QP3KPO8+P4bejD4XvvOjfSlYK9K4kJKcAHCDef6XF+Q=;
        b=CFoL+/hfFewMhoWLWhRockPg7+oYUSDT7ybXlHRyutbjuQ6A241S6UB81f7rV8y4lJ
         CVE/oUlAEyjEjHa4C2xNUpbv6xHT3GQOanChpc5YwtKFC682nhNMr8g99wKuHKZ7PKne
         6TS0n2UyMOw7dPH7LwceSHSPlBuKoAPzMkX70MVIl0e10bTH3NaLiw6tqf/O1QZBo9Xu
         vvy9Rb7EmXxfH60vrRTQSOnS9q2fjTXI8aEUTR3Ksvr4cfr6traGOqkrwpkJ0pVRhAEd
         iQiLiWP+SYVU6BXju7duXNEkL6tZzeb/9YAbo5NV5scW7ecElYDOBrWaxtlEAT77eQBv
         UfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725444; x=1758330244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QP3KPO8+P4bejD4XvvOjfSlYK9K4kJKcAHCDef6XF+Q=;
        b=kPyCFmg1GYqcGLVsXSSN88ePkOC2aT9kDqsX0c30OVZIrk0siIxxlokYK/eNDruvu4
         5eJtSSScBwxmh5c8utEo4CHVfnczBjiXTbQSPpWoDanCP7U+0b7R3f8cmsD3om47XjlD
         nqOtEGi/0hhp80Nzu1zY8MDSTW0iklRRvlQQrVsOYzYTWXeF9he8zCr4TxLfywhozTG8
         FwImqwjmPf+8Qyn7sYbTeGFgWhezNIJI3ZJf59ud4JgpcvQF9meqj1H7nsieYoVLehfg
         g/YELs1vj1M44QXU4B9RMtu5U36DIe+Pb3lrJrwZIugCVZhlCXbJ66e7v25OHPza5Z5i
         6F5w==
X-Forwarded-Encrypted: i=1; AJvYcCXH3CpsvlqttADeDOeNsGk4CkaX+v5QYhurlhJi3EUSnp9OVMrtXRR5YZb31AwFskbkQFIgUhzNZrcJfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsoOymw2Pt33l4wNjRueFkjA5wdG44aeZF/4kSyIiY9YO+yRcR
	KH+lfILcCtjNNnYTAub1WXkwzCb/YUFaF/i5QLI/SDpuqerrZxmKM1+v
X-Gm-Gg: ASbGncvk9nKIeiq3/tM3N3Q7+9ud2CGQR8ff5TlLzOLDsoeEPbD+5Y5NQwjAUr2b7ke
	3u/iN7KbiTfbMbuR5XbL7wCiMNTvpBENvHa5nw9IubgaVgcS++0nkfsgmVE13fzgOdi/ta3CMYa
	xTaxaL9K/QbGpjKRhAON9xgUCMbhU0JhxWxFPi7XyRU71vf2fAiufnCVlJyM7ESpyyy+YTH/1dc
	6W8O73Y3xGHHm3NvdVP+hKlZeHI29p5k/MupqrWO4xpHfTc/cOtid8OkELck3xssbq7BQclk4Hd
	QVMITrrDm+zt9MfD0ybyuEwG9zNc3etBYGsdvMmQU/SGDIePYBUltzhRr2pTRf7CAPmH2M+ODbE
	K9xi0MEotruIdGgx1r3iMCzpzTDNy2Q==
X-Google-Smtp-Source: AGHT+IF5gJzNBXdtzBXv0OSH4ftjGJnmmybFv16rcAGk5hl57bAzoCs28S7e9w+ysKsSQWZRdIzUSQ==
X-Received: by 2002:a05:6402:3482:b0:61d:249a:43fe with SMTP id 4fb4d7f45d1cf-62ed82c5a43mr4352436a12.24.1757725443498;
        Fri, 12 Sep 2025 18:04:03 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec6b6cec5sm4014207a12.1.2025.09.12.18.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:04:02 -0700 (PDT)
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
Subject: [PATCH RESEND 22/62] doc: remove obsolete mentions of pivot_root
Date: Sat, 13 Sep 2025 00:38:01 +0000
Message-ID: <20250913003842.41944-23-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_180405_747262_78218DCA 
X-CRM114-Status: GOOD (  15.58  )
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

They refer to initrd, which was removed in previous commits

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/device-mapper/dm-init.rst | 4 ++--
 Documentation/arch/arm/ixp4xx.rst                   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-init.rst b/Documentation/admin-guide/device-mapper/dm-init.rst
index 981d6a907699..586bb38d716b 100644
--- a/Documentation/admin-guide/device-mapper/dm-init.rst
+++ b/Documentation/admin-guide/device-mapper/dm-init.rst
@@ -5,8 +5,8 @@ Early creation of mapped devices
 It is possible to configure a device-mapper device to act as the root device for
 your system in two ways.
 
-The first is to build an initial ramdisk which boots to a minimal userspace
-which configures the device, then pivot_root(8) in to it.
+The first is to build initramfs which boots to a minimal userspace
+which configures the device, then switches to it.
 
 The second is to create one or more device-mappers using the module parameter
 "dm-mod.create=" through the kernel boot command line argument.
diff --git a/Documentation/arch/arm/ixp4xx.rst b/Documentation/arch/arm/ixp4xx.rst
index 17aafc610908..ac9cb28776c7 100644
--- a/Documentation/arch/arm/ixp4xx.rst
+++ b/Documentation/arch/arm/ixp4xx.rst
@@ -137,8 +137,8 @@ Intel IXDPG425 Development Platform
    added. One issue with this board is that the mini-PCI slots only
    have the 3.3v line connected, so you can't use a PCI to mini-PCI
    adapter with an E100 card. So to NFS root you need to use either
-   the CSR or a WiFi card and a ramdisk that BOOTPs and then does
-   a pivot_root to NFS.
+   the CSR or a WiFi card and initramfs that BOOTPs and then switches
+   to NFS.
 
 Motorola PrPMC1100 Processor Mezanine Card
 http://www.fountainsys.com
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
