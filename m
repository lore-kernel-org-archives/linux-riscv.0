Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86333CAC582
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 03:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQU4DFJDu7aQMAc/uMmtzxnFL19xK01aodvLsR06Utw=; b=NWq+0CjaA0UNgt
	8qkfIHTfpfGOB5ZRDRr9KBVSL0SesSkhLy2Hz/+yHgUfJi7hKYpOT3k9GVYsKyfajFVDNC4d5xjkO
	ZR83OkBnYt9eXohU4caUFBQiUcbDYyKLD0/ducnKPLPbDin3T7nVg35FQ1oALjMJwj1X0/SC1p/LT
	uvn0XgMh0AsRp6D7m95DPJ8lzPKi6D7BYPets3QSQ6tbmdNTKVlK8hfzFcsBNDwB/lVuK8QcsG8Oe
	I7AbUdCaflS647q2KY0b9tgr8zS7g7tSaPC7VmgK1cS1Fu4BRPyRZ7IvSBZX/p7U8LiUkzo/EuT6b
	zF/m1nF8bLyDxkwLDi5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdto-0000000HPpm-0z6u;
	Sun, 14 Sep 2025 03:59:36 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdtl-0000000HPmz-1KfO
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 03:59:34 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b0787fa12e2so446782966b.2
        for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 20:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822371; x=1758427171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
        b=hfvrScKuxmyyznzw1hLu3mFJRkZyrNoL21kiEK5T9xKcae8sIHcNZYBmPdHGXVRRix
         ABkFSS1VC4HToUKCHkYO7dGUuwjOxBFue4eZiWivAMlgl3rPp3ZZYl2vM6soqtyQxtIK
         C8tyIhJbqdMlSFqp87xCN3e7kHrOg7x/Bwmk05l/kQFGfagJh0aHYtdAzbVAM+XmvTSC
         VqN1YM2inp/OiPi857yEYPTXvl+cSXCJ/Q12YbdEDG6XpWy4Fd1nL8Ip1QrJrnzePbPp
         NAVbWJ+v9pA4Lpe5DDz+kcoPA0WgSp1LC+JFwlO3rhPYAPPb/b1ieagFidgufIzjMbrH
         +qXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822371; x=1758427171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
        b=G19zaz2IXpfeDHtNgap83SGvTJnz0nNcOKx2LEZzm7SZpzs9E11bNA0E0YiZrrmvdb
         7OFIUewuZ7Gh5IenWPgtpx4kEasFiz7a8Th5TpNiD1bfnM+NNj4cbWa1mMEszkWuwYGR
         vxCQ3X4Nlmf3MevfudvUY/63MligB/6dczlsYyYOdqqVViPZxj5SMU5J5tfc/oJ8MQg4
         +CHggYghHqzohUmVe+G9T1yw8rvFFgKi+UpOeEbgjUqboIVCNXpxDC+62HhhFocO8wCr
         ghZI8RfpYScGmT1QyIkMYraJ0VcJHTlLA9A8/GEd6i695WmF7pWkg4zI3PXEpZ9IU53x
         mZ5w==
X-Forwarded-Encrypted: i=1; AJvYcCUi6Suio5f5GjWtCmOzj48fg1XkMABmWAg2Ve5JX5Gywm0vre++k+dd3GD90lPDQpA5lSdIA3Gv+XiJiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTtohpXM7wG/TOWiMnEDKD6iijNwvfwgCNGn3INdgYH/7IDaGa
	oTY9gfh2Zt7eMhWDk5VgHudzWlWsVEDWxmbEXkqCADIvXDUAB5XPBrKo
X-Gm-Gg: ASbGncvu1GqktpYASWlW8HWJ7qbAArceIWGUDBBjUFmlwm0LMXI2/ns8rt2W+1dmY0G
	nd6bd9y5qZPTmCxH+GDflXsm2tUyfVtNy8EvJtNkdodTh1j9YJteeTh7Mk94ExiUrPNrTkWQknr
	HfPcfBc7Y9eDM40+wGjn4Gv1YcWz5DwWyy5waTZW8FW0MK7voSEZyoaInp5Be3X2hGUJ0N7lj4M
	GAOX3xem8rHcA79qzWAedIdP4i3DhIjM9J2+Ujti8cPBhpaisUQgzJpaQYjr2cqn++blx0SrAXI
	uMfJqY+mZPFqfjwDlrj1x3xOpEwbtE5P2m1wj+KTdN3jcw/Gwr48AeMkDJGbC7pG9FQhIpuqvY0
	3HBZ8mvjfz4vIWzGzuxY=
X-Google-Smtp-Source: AGHT+IHIaNmlQUOqaI2XvHaD2x2sJJCA+iwXMxeIqgPaozK4MzRrxS2gXxwIxVkINaRf0GrOSh3U1Q==
X-Received: by 2002:a17:907:3ea6:b0:b09:48c6:b7ad with SMTP id a640c23a62f3a-b0948c6c6a4mr387666066b.57.1757822371514;
        Sat, 13 Sep 2025 20:59:31 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07de03d93csm287001766b.12.2025.09.13.20.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:59:31 -0700 (PDT)
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
Subject: [PATCH RESEND 53/62] init: rename kexec_free_initrd to kexec_free_initramfs
Date: Sun, 14 Sep 2025 06:59:26 +0300
Message-ID: <20250914035926.3770703-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_205933_371547_66408D9E 
X-CRM114-Status: GOOD (  11.57  )
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
 init/initramfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 40c8e4b05886..d52314b17c25 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -690,7 +690,7 @@ void __weak __init free_initramfs_mem(unsigned long start, unsigned long end)
 }
 
 #ifdef CONFIG_CRASH_RESERVE
-static bool __init kexec_free_initrd(void)
+static bool __init kexec_free_initramfs(void)
 {
 	unsigned long crashk_start = (unsigned long)__va(crashk_res.start);
 	unsigned long crashk_end   = (unsigned long)__va(crashk_res.end);
@@ -713,7 +713,7 @@ static bool __init kexec_free_initrd(void)
 	return true;
 }
 #else
-static inline bool kexec_free_initrd(void)
+static inline bool kexec_free_initramfs(void)
 {
 	return false;
 }
@@ -743,7 +743,7 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	 * If the initrd region is overlapped with crashkernel reserved region,
 	 * free only memory that is not part of crashkernel region.
 	 */
-	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initrd()) {
+	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initramfs()) {
 		free_initramfs_mem(virt_external_initramfs_start, virt_external_initramfs_end);
 	} else if (retain_initramfs && virt_external_initramfs_start) {
 		bin_attr_initrd.size = virt_external_initramfs_end - virt_external_initramfs_start;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
