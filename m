Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35528CAC582
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2hCbGII/dpQ/pfJ+bV64qUgI9Tv//AgAVgDXvl1xpQ=; b=msWI0R9f6GX5bh
	o9vUrmtbwyd+5sqtWG+KauUjur2iB96DGuTeHMKXQ2mhfu9vcwmRCcTKjFeLLpuLGjAhHi9u18WdP
	lyG+LmeXOtBX5wGKTCL7Mdvh279r/K+w8I0WMKYzl3W2H/5DlGG6w//1xAG0uVZ64lyoou5RsLwyr
	o1TX9u4K3DFoQv8j5dVAtwFpYe9ktb+WM/tG6cjrmJe7ULgfH4NSULkzx72BEtAggrBdeKDOdddT2
	MjUEpxIoHIieLuf0RvTYgk75KKbLdv74N5CDyYFtF0mAeMg1k2dZykUT757TX6ZznJD6qoXVGotsb
	f4ky0c//B24QZEUo5tOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEnx-0000000CXmC-1p0Z;
	Sat, 13 Sep 2025 01:11:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEnw-0000000CXlI-00R6
	for linux-riscv@bombadil.infradead.org;
	Sat, 13 Sep 2025 01:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=h6O+lfSZLBCLtFpNKL/1anVub0eApVizJE0pmHD2kMo=; b=mMO+5O12b0XxX+R9SIUIrPVgtL
	kQWm4XCw3NU3X3QM5B4lDGYhcHpUP3ORRZTowxTR5X3bGu5D70VeVKxlXQvE8g8cZu1INihhVcvgF
	lcrlsTGWs2OjWrEWHEyUWcht5BSmd0KQRwFxOQJ3vDtwZYfi5QawKRkpEQrRnfuBdHvhjEl/gar9p
	Qfsiq0Fu+7Af030GHPC0OaB56CeF1H+Wnj9fJeGD0hVK+obNNjf9Z35eb3GPF59icxXD7cbxy5i6x
	YQbIJGIDybRtRj2VC/4S2oEJCAz48uStOzsww9/ljNgX0Wv53ea4ptHgZYFVPrF6IBsODby8aD8oR
	pfc+UbYg==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEnq-00000006WQ6-0cJE
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:11:50 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so3994994a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 18:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725904; x=1758330704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6O+lfSZLBCLtFpNKL/1anVub0eApVizJE0pmHD2kMo=;
        b=RQzeg6oJmT4iSMfCNQ/0VroFLO0UHQkNAL/A5L1M/hiMkrzU8rbTFumdbxTTPhIudB
         ufWEneb6kTXy7dNz3VXmD9EpyM0kR6BBewhqomP4WfUeXATO0iqjujkpHdv4wYzzvQvG
         OatdeOIxZFH6rJDWUX4zxDj9+k7v/OIRA7+N0j5OYv9AQkcSiQA/KjMK/EXEMMtkdNPN
         FQi+kSQWq3Rb8OnYGY7pvpabJIIAAQNmIHcJzrbk/2bhzgo23AgC3VOHmGk8G1aijSco
         M3DrtiDC7ZMS+ZZaiZzpqQvQq3/6HU3Q0SvV1c/sy8/uzm3g4+C/vW5uWwIxI+BDLR+X
         YABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725904; x=1758330704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6O+lfSZLBCLtFpNKL/1anVub0eApVizJE0pmHD2kMo=;
        b=kC79HIO8KQTBQEAELd4oNm6QL0aB6V+/OdG9dRB2t9bH4dBFzZEiWWFDJdwzAgcONR
         fUumOR+iv/S/M/d9M6pEabUkLtBhwjbaDuJZFzldFtjwXMZVPf/P+J+L/Kq5uFQXhRrR
         zwm6Aty9IppF2cHzdeiNYtS0+Dkdx5BP+PvF5IHukEquUb0WZ9Ye6qwrPKhr0UIvW1jT
         9MKt2xqyKGx+VV+YftISeRdNwJD1HGjctTYg454tWBEuY/ni/85/0pKBX23EPQI7vqCu
         vp1PyytiOXUIRi/nq3hCI1x7dF/ebQ1nkA8ygrlTnC8V1E/Ig3GlEbZK18OxYekIv72m
         Yjww==
X-Forwarded-Encrypted: i=1; AJvYcCV2vEQqFv34Ej4P6dSqzMzIzcIiyChPV2LPDhd3ATFrCSWjwoPO2hTlDnKvr2P2LCC1ByKepSrhucEPcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGraK8iUubxiEuldPwTVY+ic/68F3+DmlblY20f/N3n+CH5M9h
	YUhO0lNxMFxM2yen0ruODvHDOEfzR6y+aG8uPJh9JIEGxqdsC3QD9hbW
X-Gm-Gg: ASbGnctXfDgNzF8h00/eopCl3dQkbBBcWq+4792vgsPwfHFSbtINm6pkclM6nDX8k5V
	QcBZy+FZQFdZmBExiI30L7dtC3QHQHZ+HU/+fNMaKntGnltK78N+ICLGcYigkj7Oom2MAM4/2b5
	2j21UQfobeQT3A5Y6PuJyqtisO+PL69iFo7bVZS9jgZ+1nJhAxATo2ABRDR5XWQfSSA9YWtsQWW
	zqvJnji3VOPop1+CONLLDj/pJXh1MMoyfAKkVpYgjTTdL00tVKx7jtwSQoCnnysJ0gTs+8NVKyR
	35Yc/Sd6t884rflkGQSVh97MH2N5Hwqg3b4w0J5ouuu7G+G3nZbHT/CAJOa7h1y1Hu0VXIeYrRE
	v+4GAww3Z/aSvuo+AXz4=
X-Google-Smtp-Source: AGHT+IEEs4w0VYWOrTZ2mf5mPdRdgIBBMsi5zMJEle+Jt2EK6Q+4TbCNWtdbvmdxcJfUUMXxxDwLfQ==
X-Received: by 2002:a05:6402:5242:b0:628:a4fb:3b44 with SMTP id 4fb4d7f45d1cf-62ed825998fmr4990182a12.1.1757725904210;
        Fri, 12 Sep 2025 18:11:44 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62efb5b8b0asm913566a12.20.2025.09.12.18.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:11:43 -0700 (PDT)
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
Subject: [PATCH RESEND 29/62] init: move virt_external_initramfs_{start,end} to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:08 +0000
Message-ID: <20250913003842.41944-30-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_021147_994222_7598CCFB 
X-CRM114-Status: GOOD (  11.37  )
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

Move definitions of virt_external_initramfs_start and
virt_external_initramfs_end to init/initramfs.c

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts_initrd.c | 1 -
 init/initramfs.c        | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 8bdeb205a0cd..535ce459ab94 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -12,7 +12,6 @@
 
 #include "do_mounts.h"
 
-unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
 int initrd_below_start_ok;
 
 static int __init early_initrdmem(char *p)
diff --git a/init/initramfs.c b/init/initramfs.c
index 9a221c713c60..d2301cc6c470 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -600,6 +600,8 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
+unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
+
 phys_addr_t phys_external_initramfs_start __initdata;
 unsigned long phys_external_initramfs_size __initdata;
 
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
