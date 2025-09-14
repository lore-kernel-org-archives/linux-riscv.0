Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350BACAC58F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 03:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tx+ZNphbPCBkDrplh8VXgoOu4N3QqsaRe1skByyhXkU=; b=AwXcwsk61PrhHh
	UU6o/mpwMmkZPfQbufs/kksfspQ99SFI19au6FzLNzyLhKyCaFpMUlZyrk07z3zDuTRYVsLER6YmJ
	aumihHklH6bwaOvvPvFDwjRLOzsf5gS44Dr1sMR3Zs1/t1vCGIL31gbgnUiR0GUspedgTdMF7LzMk
	TuUGem1xkGBJByTM2dYLVC7yN6YtXKxmSZcA/NVkIx6nV6rcZZk/mOKQrW0KusERcReCu7f8W50gi
	TXeIMSGXV83jKrRRLdjUrvgQsiO6TSR2ez7+ZHLi8KKd9KQt7usYK5jmRnuRAzOxeizHiSIuZ7NxK
	Aq/0I69vjXnM1vE+B76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxds4-0000000HOpn-3dZz;
	Sun, 14 Sep 2025 03:57:48 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxds1-0000000HOmb-2lzP
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 03:57:47 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so479043766b.3
        for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 20:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822264; x=1758427064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=VzaDoNOH3mhqXRAw8u7zfHGnI7GXO+Wuq4Ni+KVbigVWV626TX41ZwAtDyd7yCuB8O
         Xz+uKg+Q4aq3rT4JsQ6exYMuDVTIw82+88NsuJMR/htUeofAX4EEK2ObLL7wmG8+ww8j
         cEVhZXfq/WEUbazVBJuEbFJk3RsiBJDvQEFOoCPWLIO5a45yhMGqJKJ4sZjvQpPaNvEf
         Zo0LlhS9mytM6fz2LvaClNs8rgVmeFLtohmgkSm4YNj2wZ4SMtoIGLZukPbEt7jKQN93
         hKT/tbiSxuYyJp6MnEoAQw/HtoAUaK0MZXxtVrNybpwU6YSU/LaNsRLs3iWuxvsp1lIC
         kA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822264; x=1758427064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=FbJHRcE4yb4fGSe5vf0hY+RIWZzdM0nqv+tA+dZyEru0utezjEuLFsTw6xGmaeaZPg
         zOyfxZKeJIRIlh3WWWlqClpbYF2A0YMtpFA+nL88v2lg0bF0YRZriJLnjXIn6faYQTwq
         3PcjS40OoaHvij9W9aXJWl7O1flJ2lw2N4p2ZEQ8y5ytp+nHX7YJ7CiXHjhqq0HQe/uq
         rU6iDIgnrHoYUM/KXMJxtmM+MFpHJUK7x+6WpeWjhFY4IYnkp14er1dOU9l2M/6LYLjj
         NDxTiH4gW0hKL7JT0Nmghi/QucHtM/K51+wECv/TapRKlAyZazh8AZUQCWUsgl7di7GQ
         afBg==
X-Forwarded-Encrypted: i=1; AJvYcCV69Mk+AdfavslFZxkH2wIniG6ykBelG8CS52nOX7nVu+XA6fXU42tNxIZ8Tf88Mgeqv+wIfQmrdMKgZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQyokb4iZXr7ngv+Gqgtb6qR+ffIHoLkHe4z27/0L8hQchq/bj
	ROuX9xwujV27MuidHXSVQZfpLKGd50VmBat8W8JMCaAySLgxMtM+oSwU
X-Gm-Gg: ASbGnctABxW62btvsoPdy58e3ME1YIW5Ym13gPnaHN4T9zOzU56uCFdrJ1tGaozClsF
	BHwpTg+onORWJbBacShV3raSbtLzrsK3TkEXQUxw8Sx6pWo1WZYpQp6Pp1Q7fonHW9yJT1k6xGo
	EC5PlVOzROKSBqZ3/9wqRBbTav39rp6GFQK5KUcpX9SVKIymgKN5WZESGVdBLasOHNaFEvdTlLG
	lTifHK+9K64V0Cd93j+G8FIoiRXuePbOpNcwBwUQVIDIgAuNbwuOGvBDXUGutclLoY9XmZZ2lNT
	qikCvW6/QMJGF4L7z03hML5tkADyY2/z4gJyM56DYmmcbQ3rGZCakPCP12Uu+R376JI2tH7gNGk
	+7sE7fvzbqUui1noyv415gM8rkWQBEg==
X-Google-Smtp-Source: AGHT+IGOdPvfXOVddm8G6LJhfH2nNJDoTTLKR/3NE7kowNRoQPIuzhxmV+feQvXrrMYzfjsz5Ubcxg==
X-Received: by 2002:a17:906:a84d:b0:b07:cf04:8a43 with SMTP id a640c23a62f3a-b07cf049441mr520202566b.41.1757822263792;
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b31287cesm676665366b.30.2025.09.13.20.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
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
Subject: [PATCH RESEND 50/62] init: rename ramdisk_command_access to initramfs_command_access
Date: Sun, 14 Sep 2025 06:57:38 +0300
Message-ID: <20250914035738.3741007-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_205745_717303_C3ECF694 
X-CRM114-Status: GOOD (  12.48  )
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
index cbebd64f523c..a42f1f0fce84 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1587,11 +1587,11 @@ static noinline void __init kernel_init_freeable(void)
 	 * check if there is an early userspace init.  If yes, let it do all
 	 * the work
 	 */
-	int ramdisk_command_access;
-	ramdisk_command_access = init_eaccess(initramfs_execute_command);
-	if (ramdisk_command_access != 0) {
+	int initramfs_command_access;
+	initramfs_command_access = init_eaccess(initramfs_execute_command);
+	if (initramfs_command_access != 0) {
 		pr_warn("check access for rdinit=%s failed: %i, ignoring\n",
-			initramfs_execute_command, ramdisk_command_access);
+			initramfs_execute_command, initramfs_command_access);
 		initramfs_execute_command = NULL;
 		prepare_namespace();
 	}
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
