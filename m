Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12905C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 00:58:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE87560E0C
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 00:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE87560E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xzb413+R83aFZ38gtIwme9Xni6T8CDHS3lbXrs6Lm74=; b=AC6sT1a9GqijvW
	Om1QkrGQcxWO33mwGwR498kwGZ+6DKq1xOvoSXic7R3t6vh0l+C5gFDrUR72WEsrTAWzZPDkzfzVF
	w+FCho12B7XaoZOFfkMaJyfgkYQjpL+J0DPc1T1XBDu/HpN2sC5ZbF0WszvVOb2MxotEaWFYEzvI1
	iM1lXEA6Nr6qPRe916d7GHX2amWB9cI6JRc7VF6vIXcKWfc9KR0shviA0FAvafx726+FBF5K0shgy
	qnH8Jz7xkHTXRc48YJpCsw7I0yv5E5NCkJcxYQ6ZIYfxS9fdSvyi0HwIg186YsCPji9vMJK0B383G
	tV4nF8XkPL3Gai9qP4fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maSbI-00ESRZ-GG; Wed, 13 Oct 2021 00:58:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maSYs-00EQog-4E; Wed, 13 Oct 2021 00:56:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBD606101B;
 Wed, 13 Oct 2021 00:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634086561;
 bh=Id+lo8S98inx0VkSjzSpon/uiOSKyP7vBgn14eXMLQY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gfl2QErIKnUHyotNIdCXlr+UEztBZuK8ml1yDrMvHIwpHVCApqeUQ+o9asci+P2ND
 KMh2iPDZPVH06aPm4jLJFmm4VjhRzk3DIjeLztGvF1rmd8rBgzFGEHHU9oGlhpGWYE
 UtKBP6sKcIj+hbXH/LlWTm8DenNqpgBWS+FnDhiDg78l81Le96MOJn/Id+QV4zQJau
 +guWnqoXOoN2ZmZlPeYibLpudjHAMZ5R3UE3g/56JuTLpV/5f7bCmdaoonZDPuhiDn
 iqTJXDd0HNKzDl4fyxWLSyvr7F9FjUMJ6E4PiotRTsXxcoYK06Uk/sS/X4AnwqOrLt
 ZlreT7ooFYQkg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Sasha Levin <sashal@kernel.org>,
 linux@armlinux.org.uk, catalin.marinas@arm.com, tsbogend@alpha.franken.de,
 James.Bottomley@HansenPartnership.com, deller@gmx.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 linus.walleij@linaro.org, geert+renesas@glider.be,
 rmk+kernel@armlinux.org.uk, akpm@linux-foundation.org,
 anshuman.khandual@arm.com, mark.rutland@arm.com, ardb@kernel.org,
 u.kleine-koenig@pengutronix.de, rppt@kernel.org, lukas.bulwahn@gmail.com,
 wangkefeng.wang@huawei.com, slyfox@gentoo.org, axboe@kernel.dk,
 ben.widawsky@intel.com, dan.j.williams@intel.com,
 gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 11/11] firmware: include drivers/firmware/Kconfig
 unconditionally
Date: Tue, 12 Oct 2021 20:55:31 -0400
Message-Id: <20211013005532.700190-11-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013005532.700190-1-sashal@kernel.org>
References: <20211013005532.700190-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_175602_271232_8D331A26 
X-CRM114-Status: GOOD (  12.00  )
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

[ Upstream commit 951cd3a0866d29cb9c01ebc1d9c17590e598226e ]

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

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Will Deacon <will@kernel.org>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Simon Trimmer <simont@opensource.cirrus.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
index 002e0cf025f5..d4c6b95b24d7 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -2043,8 +2043,6 @@ config ARCH_HIBERNATION_POSSIBLE
 
 endmenu
 
-source "drivers/firmware/Kconfig"
-
 if CRYPTO
 source "arch/arm/crypto/Kconfig"
 endif
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 5e5cf3af6351..f4809760a806 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1933,8 +1933,6 @@ source "drivers/cpufreq/Kconfig"
 
 endmenu
 
-source "drivers/firmware/Kconfig"
-
 source "drivers/acpi/Kconfig"
 
 source "arch/arm64/kvm/Kconfig"
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 39b25a5a591b..e8014d2e36c0 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -426,8 +426,6 @@ config CRASH_DUMP
 	  help
 	    Generate crash dump after being started by kexec.
 
-source "drivers/firmware/Kconfig"
-
 endmenu
 
 menu "Power management and ACPI options"
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1a63f592034e..3bd3a01a2a2b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3328,8 +3328,6 @@ source "drivers/cpuidle/Kconfig"
 
 endmenu
 
-source "drivers/firmware/Kconfig"
-
 source "arch/mips/kvm/Kconfig"
 
 source "arch/mips/vdso/Kconfig"
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 14f3252f2da0..ad13477fb40c 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -378,6 +378,4 @@ config KEXEC_FILE
 
 endmenu
 
-source "drivers/firmware/Kconfig"
-
 source "drivers/parisc/Kconfig"
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f7abd118d23d..fcb8e5da148e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -428,5 +428,3 @@ menu "Power management options"
 source "kernel/power/Kconfig"
 
 endmenu
-
-source "drivers/firmware/Kconfig"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f3c8a8110f60..499f3cc1e62f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2899,8 +2899,6 @@ config HAVE_ATOMIC_IOMAP
 	def_bool y
 	depends on X86_32
 
-source "drivers/firmware/Kconfig"
-
 source "arch/x86/kvm/Kconfig"
 
 source "arch/x86/Kconfig.assembler"
diff --git a/drivers/Kconfig b/drivers/Kconfig
index dcecc9f6e33f..493ac7ffd8d0 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -16,6 +16,8 @@ source "drivers/bus/Kconfig"
 
 source "drivers/connector/Kconfig"
 
+source "drivers/firmware/Kconfig"
+
 source "drivers/gnss/Kconfig"
 
 source "drivers/mtd/Kconfig"
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
