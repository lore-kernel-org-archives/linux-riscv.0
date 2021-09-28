Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1AFC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 07:53:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E382611C3
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 07:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E382611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TcAm8vxFdw+XagcXvIAzLSLxRstdgXiCzlk8fsATg04=; b=tTfR1G8EC1sWD8
	HgB0VDy+9rI1oe638Kx9sLoMYAgxkin0H2g4XBh5cHGhDXpsybeD0zzBXuKw2OEmFc8e5SSnVILCO
	LXWfPLC9/45paXWdc2wJtRzt80NChMxSp9XHTHHziKks1TLGw0BddwhzF0PbCvz/nD182vhDkr4Ru
	trWNZLOnL6zjJVDIFPS0oMzlQN+P1/ySVrvHMaJAnakp9JuwRu1h4Ivxa7fx/Jm6UWjaUeY8YKqfR
	nre9sdtbNx99MV9AUQzR+UwFgGnuqBC26IcJ5Ym3mwWfnJgBSHrfh1VgP3UlK8q2J6H9e4mdraWmK
	adWJD9m25x4MLNSu71aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV7uu-0065sx-RU; Tue, 28 Sep 2021 07:52:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV7ug-0065nT-Rp; Tue, 28 Sep 2021 07:52:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5137D61130;
 Tue, 28 Sep 2021 07:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632815550;
 bh=lFsTmsn7BYcrty0qzd1AqSPHwOiCHDnCX/Te4vlwM7A=;
 h=From:To:Cc:Subject:Date:From;
 b=WJNbYy6q2dLmrox1V9lvJ3yNXIMuZp8b7wEDV18kZkrcMMEkz4ZdaL6+wMd/EJuzu
 rCVh5UO5rDIvSMr3BDOE/uQnc8i5D1Q9+JeiaFU/tIjaphu0W1GPoetd8AQBZjw1L8
 0shNSrZjCEMwmQ4lAz7eX9+gzn2cfrRChhTiVafD5FTWjnzkJLmdRGCJJAUrXGYmRR
 xWRUINz2rJ3DofuTl/d+o5LYqevL22s3N3ljhF9382UP92IH2f538r4skWsFBqOxEO
 tqwBVxxgOpwAZI8EZexXd4qGch5isT0eB+UmUDVvwm1yAlEkEW4xjjT4KCRUn+5IP0
 tEuej0ZCMgWjA==
From: Arnd Bergmann <arnd@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] firmware: include drivers/firmware/Kconfig unconditionally
Date: Tue, 28 Sep 2021 09:50:26 +0200
Message-Id: <20210928075216.4193128-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_005230_969150_8971A641 
X-CRM114-Status: GOOD (  19.53  )
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

From: Arnd Bergmann <arnd@arndb.de>

Compile-testing drivers that require access to a firmware layer
fails when that firmware symbol is unavailable. This happened
twice this week:

 - My proposed to change to rework the QCOM_SCM firmware symbol
   broke on ppc64 and others.

 - The cs_dsp firmware patch added device specific firmware loader
   into drivers/firmware, which broke on the same set of
   architectures.

We should probably do the same thing for other subsystems as well,
but fix this one first as this is a dependency for other patches
getting merged.

Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Simon Trimmer <simont@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Not sure how we'd want to merge this patch, if two other things
need it. I'd prefer to merge it along with the QCOM_SCM change
through the soc tree, but that leaves the cirrus firmware broken
unless we also merge it the same way (rather than through ASoC
as it is now).

Alternatively, we can try to find a different home for the Cirrus
firmware to decouple the two problems. I'd argue that it's actually
misplaced here, as drivers/firmware is meant for kernel code that
interfaces with system firmware, not for device drivers to load
their own firmware blobs from user space.
---
 arch/arm/Kconfig    | 2 --
 arch/arm64/Kconfig  | 2 --
 arch/ia64/Kconfig   | 2 --
 arch/mips/Kconfig   | 2 --
 arch/parisc/Kconfig | 2 --
 arch/riscv/Kconfig  | 2 --
 arch/x86/Kconfig    | 2 --
 drivers/Kconfig     | 2 ++
 8 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ad96f3dd7e83..194d10bbff9e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1993,8 +1993,6 @@ config ARCH_HIBERNATION_POSSIBLE
 
 endmenu
 
-source "drivers/firmware/Kconfig"
-
 if CRYPTO
 source "arch/arm/crypto/Kconfig"
 endif
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index ebb49585a63f..8749517482ae 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1931,8 +1931,6 @@ source "drivers/cpufreq/Kconfig"
 
 endmenu
 
-source "drivers/firmware/Kconfig"
-
 source "drivers/acpi/Kconfig"
 
 source "arch/arm64/kvm/Kconfig"
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 045792cde481..1e33666fa679 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -388,8 +388,6 @@ config CRASH_DUMP
 	  help
 	    Generate crash dump after being started by kexec.
 
-source "drivers/firmware/Kconfig"
-
 endmenu
 
 menu "Power management and ACPI options"
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 771ca53af06d..6b8f591c5054 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3316,8 +3316,6 @@ source "drivers/cpuidle/Kconfig"
 
 endmenu
 
-source "drivers/firmware/Kconfig"
-
 source "arch/mips/kvm/Kconfig"
 
 source "arch/mips/vdso/Kconfig"
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 4742b6f169b7..27a8b49af11f 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -384,6 +384,4 @@ config KEXEC_FILE
 
 endmenu
 
-source "drivers/firmware/Kconfig"
-
 source "drivers/parisc/Kconfig"
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 301a54233c7e..6a6fa9e976d5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -561,5 +561,3 @@ menu "Power management options"
 source "kernel/power/Kconfig"
 
 endmenu
-
-source "drivers/firmware/Kconfig"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index e5ba8afd29a0..5dcec5f13a82 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2834,8 +2834,6 @@ config HAVE_ATOMIC_IOMAP
 	def_bool y
 	depends on X86_32
 
-source "drivers/firmware/Kconfig"
-
 source "arch/x86/kvm/Kconfig"
 
 source "arch/x86/Kconfig.assembler"
diff --git a/drivers/Kconfig b/drivers/Kconfig
index 30d2db37cc87..0d399ddaa185 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -17,6 +17,8 @@ source "drivers/bus/Kconfig"
 
 source "drivers/connector/Kconfig"
 
+source "drivers/firmware/Kconfig"
+
 source "drivers/gnss/Kconfig"
 
 source "drivers/mtd/Kconfig"
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
