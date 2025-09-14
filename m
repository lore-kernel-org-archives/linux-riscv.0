Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8273CCAC582
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 03:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=te+jtAFWEVUFWnUVh5LawVbedfH9C/QkIUiCHgv3Z9w=; b=hUxPegGZrGkz5g
	bLjXizKFwBV2tN1Nl5CbB9HLlvwWet3gHAKDDUfAB2KOMmiGUZgJn0VsVkzrq7bHV11mb2aE6zJ09
	+wU/hGP64DEiu0RENrzs6kRweRywEE5QH50aug4MslYMMUmF2/b6MWJt19cg81uU7NtWu1JxDHlWZ
	wzrTYrBTR/EwqAFAUaFm9whGLDwfFJOuZaszBn8uscVdEyUgAwSGajEWiimVuvf0BWSDFWKMhiLJ/
	XJNMZfPD9FwQEYIqQJfH+0pzO4d4LKLlHi2MMFf4CwqLkhMkxgMMmrqegsa3BV59zt0xsmPTyQv1Q
	O6j4Hzy5GIeozXzfDMYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdtg-0000000HPjo-0aYD;
	Sun, 14 Sep 2025 03:59:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdte-0000000HPie-1fDa
	for linux-riscv@bombadil.infradead.org;
	Sun, 14 Sep 2025 03:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=; b=HM1VdaRsv7MDuvK6xi2ARc7+mT
	+4pUexwhSkC+C3g5eIuVry2AZORauSaMbIkdnd7E9OvrSDaNOfO3nnQQJ+DImepAeTflZzgu5wD4k
	3ue8pOU5+9vwYPK0HIy5fK/6VSHjK2Wf2eHzeQ31FeRglrl4BEVRLwqUyWlxZOd31vYt9y1MclMBg
	/IzI5wKAPDtWIm7iNtGB+38IyztqGCruFF8DcD6PQ9V0OONlbum2IYwCah+GU6Dil0nRc2sesUQyv
	JA2marXFv61YsY/oiCU3y6kuBs7WB7y9NMzJgS8m2bwfVZiie5AX0W5mI3DhkQJyWWylrQ9pbL/4B
	Vdq5eCsw==;
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdsc-00000006iMF-36xD
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 03:59:17 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6228de280ccso6257089a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 20:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822300; x=1758427100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=;
        b=UlaR3A4Eq3aQNFev7CLeZxHJNYT1TEVe+xLhS9Kkv6jccSalneg5KmwL0FdI2pD09y
         EooojtIdFQ9Nj6+YZeZNt2kYFKC69Bs4czjBQNG6IeLmWjsJcXVeSfoQuLB2rQGlYM4x
         i05hEzLOXO4Q57/ds96jpSMFIOSWfcjBkCsjgLWsp/RfHKTHZC31yg/yzxBfkSAIZ/bH
         EGo5ZaYOiu+mbiwEEfbblYPGaOCstuP3UaeeWsg0yej+QWvy8e1Y/jrfLt8nw8IwVWEX
         wPlHyH26aEqVsFFualqrQKsw+DkZtLysxp7PVSnpAO2ait+lqyrji+3pnyOUMmUz/P+J
         YajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822300; x=1758427100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=;
        b=idzhlPIMs2e/i53l4qy/nAgbm9KdO9nubP8G6C74C7qJnfJHQk45gEGoQnw7FC/AVi
         hRrmHpY4XOv0Amsv462iFDwRhAcbwvkwoSxZ78PyMwLgUSDW4kF4011z8cT3Ii394EKw
         PhcyxDQ++GS1DoLRExJz7iO2VctnMDJnoRsMZHR0oug8+qOKF9YTxTRhZ+vu8oA+JHSA
         XRlW94UkHPZ2s7Y5Nht1LbNBtfaEN7y/c8aOn7ZhzFHSue/bf7E9Gd6PtNwHqdfa2W8o
         5scYVsSHHf7I6C2qCOg37DjGbBFsYcFszjYAFJE20tKX7Fz7k1PA6FOrKjXCd9RfnSFz
         yWpg==
X-Forwarded-Encrypted: i=1; AJvYcCXHPj+bD3lPuMBonOaDQD5FE9WIg5MFBX+5G1KfHRb1cMSnR04RmAPtErRWrhjtvuv+rxEH7Vdc7T5crg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqmJUIqsGrs3xjfaHwKCCN/Yhs4f0Zb7rynneKmmCrqTepuc/+
	XJB1qlQ9pnErsHEZGRCQiwEYYQJpInyn7XPczOoebuGVwNXYCHKcCuZo
X-Gm-Gg: ASbGncuv/fABaZfKZgupJM74wIOE+oCZOstwgQxEaOQ18UPF/7mL+lTBlFwAEwfA1pC
	ZhxwrOrbdhvAbcCif1tF0HIu7c2i1nCRbRXbuKbWRWHmvF451CTFWy6WnH6BP93S8fKoU0JwBu7
	elRXF/cP7N3Ih9T8fDoJC78K7liZV8Yj68AFToePSA1m0+8lBsiCdRGj1x3LEYFiSQhTAL2dP7a
	EEpru+lY2gpwf2X26ZNCFwH0kbalYWVJfcDrj6CNt5wdSDv5nKsjertDrakTM608ITwdQTO3X50
	W6+VHmSWK2au7oD8GlXx6O5fdGvE/wv4sa+1nBD4p0WwVCY6itTKSEbztnAA99+oWY1HU0liFEj
	KT6HmnwxzvUKcn1DLwTE=
X-Google-Smtp-Source: AGHT+IEs7a72WksMtWatD4lSFnDxnNg7+5MS1D9GOkH6MKg4k8K6DTsXjCx54xq6hKPtDzIS4c8/bw==
X-Received: by 2002:a05:6402:42d2:b0:627:f47c:b199 with SMTP id 4fb4d7f45d1cf-62ed82599f7mr8759493a12.8.1757822299751;
        Sat, 13 Sep 2025 20:58:19 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62edb7d9cbbsm4735738a12.15.2025.09.13.20.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:58:18 -0700 (PDT)
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
Subject: [PATCH RESEND 51/62] init: rename get_boot_config_from_initrd to get_boot_config_from_initramfs
Date: Sun, 14 Sep 2025 06:58:14 +0300
Message-ID: <20250914035814.3752803-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_045838_355929_878263B4 
X-CRM114-Status: GOOD (  13.02  )
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
 init/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index a42f1f0fce84..c535e0613df8 100644
--- a/init/main.c
+++ b/init/main.c
@@ -264,7 +264,7 @@ static int __init loglevel(char *str)
 early_param("loglevel", loglevel);
 
 #ifdef CONFIG_BLK_DEV_INITRD
-static void * __init get_boot_config_from_initrd(size_t *_size)
+static void * __init get_boot_config_from_initramfs(size_t *_size)
 {
 	u32 size, csum;
 	char *data;
@@ -311,7 +311,7 @@ static void * __init get_boot_config_from_initrd(size_t *_size)
 	return data;
 }
 #else
-static void * __init get_boot_config_from_initrd(size_t *_size)
+static void * __init get_boot_config_from_initramfs(size_t *_size)
 {
 	return NULL;
 }
@@ -420,7 +420,7 @@ static void __init setup_boot_config(void)
 	char *err;
 
 	/* Cut out the bootconfig data even if we have no bootconfig option */
-	data = get_boot_config_from_initrd(&size);
+	data = get_boot_config_from_initramfs(&size);
 	/* If there is no bootconfig in initrd, try embedded one. */
 	if (!data)
 		data = xbc_get_embedded_bootconfig(&size);
@@ -479,7 +479,7 @@ static void __init exit_boot_config(void)
 static void __init setup_boot_config(void)
 {
 	/* Remove bootconfig data from initrd */
-	get_boot_config_from_initrd(NULL);
+	get_boot_config_from_initramfs(NULL);
 }
 
 static int __init warn_bootconfig(char *str)
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
