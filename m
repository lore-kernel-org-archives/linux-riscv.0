Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06B8C3DA42
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 08:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqDOGARZwPUbVNnjFqfnJLH70oXWQFa2rHPZm01foeA=; b=ktsKPRLnvGYyHB
	DQ1NyTmgE5t1bY5NUjvzjDOW+gislCdOnoJQ8/Ga8q8eMYAInf6v/nQE1Iv8orU2guaxXwDtbj7cV
	yd8HMi86Njf1SJ4sNT/MCz+KEwZPdwyWIzI0cO1Vh73XsmZIT1wC8IdmZsSy5+pPEwSWKn2picCzL
	VwvcT63GI1f1NRlr+w72iYJEHYB9rve0wgQy9XRMIu5KJAZHlbrNfLRLW0VbXax5qqY94wuGNKRQ9
	Oe57OwfZUDhi+EbtE/6AuQrs5czRsK5NovdjT3HxLIag10WOyCn0rYovoiw5G33Us5G7NED4BtOQw
	0pd+YbMeTPAbx/5wYtBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSv4O-000000046nd-0LOf;
	Sun, 14 Jul 2024 08:59:00 +0000
Received: from mail.envs.net ([5.199.136.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSv3n-000000046cc-0XqZ;
	Sun, 14 Jul 2024 08:58:25 +0000
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id CEA8038A399F;
	Sun, 14 Jul 2024 08:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1720947501; bh=yyUazkvkRh10ZbEGZX7/MXwA6mkniL0Aqt6WS89cGkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BX096ylvPXeYrwWxZLty8ghuITn9TBNUlXRIqKxN+XshUOIFiMHVkGUd3M1TCwpdF
	 cRrFXlBajCA2QRwXaxHfz/LsIQftwAqqONaCO5bNb7P/K2scRD8mdcQIq/NrYYXBe8
	 FS19q6QjODirpRtBtetibQpu0xC59ex3C4KRg7b60GUyzRsYPpdB+6TzJSxesmUY84
	 CoSH/YCUPea038A6D17yPZwULk86CHmRQ2w4TkUN+H8iST31M7BDpGEyuIs2MqVLpO
	 d0yvtBxEIWMJ7mODw14gN6Qd6UvyYI+N1KLcUQ2ii4egWCHcB+9srYosrjMgrLiURC
	 7lhJQnt+QrPQPwNKHChdHpvYzr5iN9eqXx33CdncsejIxnH/1LV3P6K1uZwKNfHjtY
	 ClOnQlX5FsC6uq50sIJ8LnPf6e/haVGUp6Opr2IKu/vb6wNc4uDridsOAMHqND3GYu
	 IMG6aA7Sk8PzP5T/ETm6CwNaAdJo4ClbtFZuN3BzvLkKNvwm61RYC/eCDyHnF8IJMF
	 pojLYS9Pe16lhyqu56OWfjPld0TWD739HoGYkOv5XxSsYSjpqzdOyJ8miviKd2OmbR
	 a48tzEXKLNrrk2ZJLwEt0aTLZKbjbVKef7eMJHN9gOf453lE5hSF5ZucKdPK0owt5f
	 y+sUAWIiuuxzx990L62vMwAs=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GYBywokYmGiX; Sun, 14 Jul 2024 08:58:11 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.214.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sun, 14 Jul 2024 08:58:11 +0000 (UTC)
From: Zhang Bingwu <xtex@envs.net>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Zhang Bingwu <xtexchooser@duck.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: x86@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 1/2] kbuild: Abort make on install failures
Date: Sun, 14 Jul 2024 16:57:50 +0800
Message-ID: <20240714085751.176357-2-xtex@envs.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240714085751.176357-1-xtex@envs.net>
References: <20240714085751.176357-1-xtex@envs.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_015823_563641_A0CE3C20 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

From: Zhang Bingwu <xtexchooser@duck.com>

Setting '-e' flag tells shells to exit with error exit code immediately
after any of commands fails, and causes make(1) to regard recipes as
failed.

Before this, make will still continue to succeed even after the
installation failed, for example, for insufficient permission or
directory does not exist.

Signed-off-by: Zhang Bingwu <xtexchooser@duck.com>
---
 arch/arm/boot/install.sh   | 2 ++
 arch/arm64/boot/install.sh | 2 ++
 arch/m68k/install.sh       | 2 ++
 arch/nios2/boot/install.sh | 2 ++
 arch/parisc/install.sh     | 2 ++
 arch/riscv/boot/install.sh | 2 ++
 arch/s390/boot/install.sh  | 2 ++
 arch/sparc/boot/install.sh | 2 ++
 arch/x86/boot/install.sh   | 2 ++
 9 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/install.sh b/arch/arm/boot/install.sh
index 9ec11fac7d8d..34e2c6e31fd1 100755
--- a/arch/arm/boot/install.sh
+++ b/arch/arm/boot/install.sh
@@ -17,6 +17,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ "$(basename $2)" = "zImage" ]; then
 # Compressed install
   echo "Installing compressed kernel"
diff --git a/arch/arm64/boot/install.sh b/arch/arm64/boot/install.sh
index 9b7a09808a3d..cc2f4ccca6c0 100755
--- a/arch/arm64/boot/install.sh
+++ b/arch/arm64/boot/install.sh
@@ -17,6 +17,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ "$(basename $2)" = "Image.gz" ] || [ "$(basename $2)" = "vmlinuz.efi" ]
 then
 # Compressed install
diff --git a/arch/m68k/install.sh b/arch/m68k/install.sh
index af65e16e5147..b6829b3942b3 100755
--- a/arch/m68k/install.sh
+++ b/arch/m68k/install.sh
@@ -16,6 +16,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ -f $4/vmlinuz ]; then
 	mv $4/vmlinuz $4/vmlinuz.old
 fi
diff --git a/arch/nios2/boot/install.sh b/arch/nios2/boot/install.sh
index 34a2feec42c8..1161f2bf59ec 100755
--- a/arch/nios2/boot/install.sh
+++ b/arch/nios2/boot/install.sh
@@ -16,6 +16,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ -f $4/vmlinuz ]; then
 	mv $4/vmlinuz $4/vmlinuz.old
 fi
diff --git a/arch/parisc/install.sh b/arch/parisc/install.sh
index 933d031c249a..664c2d77f776 100755
--- a/arch/parisc/install.sh
+++ b/arch/parisc/install.sh
@@ -16,6 +16,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ "$(basename $2)" = "vmlinuz" ]; then
 # Compressed install
   echo "Installing compressed kernel"
diff --git a/arch/riscv/boot/install.sh b/arch/riscv/boot/install.sh
index 4c63f3f0643d..a59639dff64f 100755
--- a/arch/riscv/boot/install.sh
+++ b/arch/riscv/boot/install.sh
@@ -17,6 +17,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ "$(basename $2)" = "Image.gz" ]; then
 # Compressed install
   echo "Installing compressed kernel"
diff --git a/arch/s390/boot/install.sh b/arch/s390/boot/install.sh
index a13dd2f2aa1c..fa41486258ee 100755
--- a/arch/s390/boot/install.sh
+++ b/arch/s390/boot/install.sh
@@ -15,6 +15,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 echo "Warning: '${INSTALLKERNEL}' command not available - additional " \
      "bootloader config required" >&2
 if [ -f "$4/vmlinuz-$1" ]; then mv -- "$4/vmlinuz-$1" "$4/vmlinuz-$1.old"; fi
diff --git a/arch/sparc/boot/install.sh b/arch/sparc/boot/install.sh
index 4f130f3f30d6..68de67c5621e 100755
--- a/arch/sparc/boot/install.sh
+++ b/arch/sparc/boot/install.sh
@@ -16,6 +16,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ -f $4/vmlinuz ]; then
 	mv $4/vmlinuz $4/vmlinuz.old
 fi
diff --git a/arch/x86/boot/install.sh b/arch/x86/boot/install.sh
index 0849f4b42745..93784abcd66d 100755
--- a/arch/x86/boot/install.sh
+++ b/arch/x86/boot/install.sh
@@ -16,6 +16,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ -f $4/vmlinuz ]; then
 	mv $4/vmlinuz $4/vmlinuz.old
 fi
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
