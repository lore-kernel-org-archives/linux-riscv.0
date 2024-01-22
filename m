Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53E1C47422
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 00:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6d4kx4l527cWxnk7C49KBv1VA7l91nN/vB1b18ak3K0=; b=SJC0c2wnnc8zlb
	phplGPwYBscQTP9ZZhoh7+vMKlfnMnIwRXyznt3KI+VaW6tBQTMENGf1l9UnhC3SPOdQOuVacfONt
	ItnEC4tL56vYjp5Br9zSiqZ6k+WZP5Tmoa3JgxJgeT0OiTwioulGGElnDfKvRVIPt4yw+yE2Alc5u
	vuAHRp95R9DHXy5CPQySPYiaS3/mwsj/GU2SODAEm+G+FHGPzJgcSaX38SieIf2IBgJqfXmB5W35x
	ewxXVn69BSgDKYkRz4/OqsLby/tmQ7nWp3QOAsn6wLqVJqBQ8wFKkM5aX+ojiLZdfC0u2bunouvd7
	oVNhqWb076pknJsenrjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRi69-00AFzK-0j;
	Mon, 22 Jan 2024 00:23:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRi66-00AFwH-1V
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 00:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C60EB61006;
	Mon, 22 Jan 2024 00:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B7AC43330;
	Mon, 22 Jan 2024 00:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705882979;
	bh=TfofIEIKQZPK62dMUzgvPsR4BgvnYH75rA2YkgLkUvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oXmmw0pFKie1iTNEGrk1apBcAwNl0xXWYevupFo5OY/FbDJ0gEe1eAwyHLzA7rYHQ
	 VakSJ8WYLUyqbNKoG43mlsAbgUEmIi+4L7MOfvsXzbw+goo9lUw9srnKTF3WWZxAcx
	 5Kyk99bwbmRl0u1P9xi/Ckm6NM+xWGQ9wtW1LiUTcljq2RWn1wE0siEwMuLGMSZ+AB
	 uo/A4Mrgrlw8bHIKJEHwlxCGbeCTMJGN+crODJ/aydsCP2MQ3zIsOOLdjwJwr3iXG/
	 pf01EyzlGraH+P21AEXDaXGIhX99/gvlUl76GOOYaFAnYzf2O/awfYJ/4utJVT9X4Q
	 K/yt9e5HaL7hA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	=?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Jerry Shih <jerry.shih@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Phoebe Chen <phoebe.chen@sifive.com>,
	hongrong.hsu@sifive.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v3 03/10] RISC-V: hook new crypto subdir into build-system
Date: Sun, 21 Jan 2024 16:19:14 -0800
Message-ID: <20240122002024.27477-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122002024.27477-1-ebiggers@kernel.org>
References: <20240122002024.27477-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_162330_592515_13D265A0 
X-CRM114-Status: GOOD (  13.72  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Create a crypto subdirectory for added accelerated cryptography routines
and hook it into the riscv Kbuild and the main crypto Kconfig.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/Kbuild          | 1 +
 arch/riscv/crypto/Kconfig  | 5 +++++
 arch/riscv/crypto/Makefile | 1 +
 crypto/Kconfig             | 3 +++
 4 files changed, 10 insertions(+)
 create mode 100644 arch/riscv/crypto/Kconfig
 create mode 100644 arch/riscv/crypto/Makefile

diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index d25ad1c19f881..2c585f7a0b6ef 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -1,11 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-y += kernel/ mm/ net/
 obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
+obj-$(CONFIG_CRYPTO) += crypto/
 obj-y += errata/
 obj-$(CONFIG_KVM) += kvm/
 
 obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) += purgatory/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
new file mode 100644
index 0000000000000..10d60edc0110a
--- /dev/null
+++ b/arch/riscv/crypto/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
+
+endmenu
diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
new file mode 100644
index 0000000000000..a4e40e534e6a8
--- /dev/null
+++ b/arch/riscv/crypto/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 7d156c75f15f2..00e4aa16bf2bf 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1489,20 +1489,23 @@ source "arch/arm64/crypto/Kconfig"
 endif
 if LOONGARCH
 source "arch/loongarch/crypto/Kconfig"
 endif
 if MIPS
 source "arch/mips/crypto/Kconfig"
 endif
 if PPC
 source "arch/powerpc/crypto/Kconfig"
 endif
+if RISCV
+source "arch/riscv/crypto/Kconfig"
+endif
 if S390
 source "arch/s390/crypto/Kconfig"
 endif
 if SPARC
 source "arch/sparc/crypto/Kconfig"
 endif
 if X86
 source "arch/x86/crypto/Kconfig"
 endif
 endif
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
