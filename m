Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B03C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 19:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TkfmDCl9Y09e5XXoJ0ZMJqo/2CdnbQkMG91JpA4J3cs=; b=U937d/EiYJ1W0v
	URs0uaxqqGnJJ1ilSuRy/RbdjwMD8AWS28Cez6DbEPB337Q86LAZjXnWgMl/VfsVRVK5y2tcfpmwj
	4Oz2SModvJTrAfl/Q+PA0rXd00C3Px1JEAFw2O7H0ET3S5PV5KpxlMTDP3fyajJULUliiB7GVugaO
	QLMHQonMkWZ3JoXekD03Y/uzVFhwRePcMkuv7Tb4SXv5GZlzu2FV3uXnnU6VNWppaXfHG0oEAu5+o
	wA5RKvw10BbvloifyMk/eTt9RB/xzGwhM2QtpcQt0OtdMCMHmUE/yZjqbC4lSr1ISOuwtDNCOcbve
	eVSXyP0Z5bhOvbCWhwsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhaLK-0000000EzmA-27OX;
	Tue, 05 Mar 2024 19:20:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhaLI-0000000EzkB-0pq5
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 19:20:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED1266172D;
	Tue,  5 Mar 2024 19:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6602AC433F1;
	Tue,  5 Mar 2024 19:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709666446;
	bh=DyJQQmbsgQrz6iSKr4cw5IeReFBVxq+EZYyLAZ8uZ8M=;
	h=From:To:Cc:Subject:Date:From;
	b=XD9Yt+o95PQZ9mxZo5k1nXOBSoRXsQhic6o7L8sO++U0psT51u9K8NvKSkarDgeI/
	 CYU+/hTnH+MuXUlztngk9FKrTX01wNXo1jiqp2wHnR9DthYaQm5GH8l+n4DVKexKEN
	 NOvGT0NExdO6Fn8Wd7uz4DaeZUK/vXToAUN8vqSjPz/t3vCKNJVz3SpiBkyiURLWQV
	 g+aKV9eHytqIh1hewWqTl5wj5yZ0ISZvzLuHxF5DeE0+EDOz8Qcv1iK9+tOOsxLFXT
	 hRttUJy6Kg8fnvsvv195G+v6fUXmV03rPvWjG1N1M93VOo7rjH1fK8yr8jaERa8smk
	 gUX4E6Kr4AnHA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v1] RISC-V: drop SOC_MICROCHIP_POLARFIRE for ARCH_MICROCHIP
Date: Tue,  5 Mar 2024 19:20:28 +0000
Message-ID: <20240305-fled-undrilled-41dc0c46bb29@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=sEnLy/zbRnuP6bn1D/dW722m4kLnHrHtwrR1+7kP0uw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnPC2oq3YXTEvpnP5KymJ60NFDlvf7rG9bFsW7cUxes2 n7zHGNKRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbiPIOR4cqhnKTZ2oL/7yv+ S8r9XiQtbjPhmfjKmy3Ky4IubD3VYc/I8O5L+paVzJn7YuR2xGQpX9B0jZb5LJBvVVRyTS2v0yO CAQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_112048_521742_2066B1B2 
X-CRM114-Status: GOOD (  10.28  )
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

From: Conor Dooley <conor.dooley@microchip.com>

SOC_MICROCHIP_POLARFIRE doesn't have any remaining in-kernel users, so
time has come to remove it. Foolish auld me left the "POLARFIRE" in the
new, hidden, config option when I renamed it and changed all of the
users however. As HPSC has been announced, and is not a PolarFire,
drop mention of that specific FPGA family from the new user-visible
config option.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: linux-riscv@lists.infradead.org
---
 arch/riscv/Kconfig.socs      | 8 ++++----
 arch/riscv/configs/defconfig | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index e08e91c49abe..5fd2e9f425d1 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,12 +1,12 @@
 menu "SoC selection"
 
 config ARCH_MICROCHIP_POLARFIRE
-	def_bool SOC_MICROCHIP_POLARFIRE
+	def_bool ARCH_MICROCHIP
 
-config SOC_MICROCHIP_POLARFIRE
-	bool "Microchip PolarFire SoCs"
+config ARCH_MICROCHIP
+	bool "Microchip SoCs"
 	help
-	  This enables support for Microchip PolarFire SoC platforms.
+	  This enables support for Microchip SoC platforms.
 
 config ARCH_RENESAS
 	bool "Renesas RISC-V SoCs"
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 89a009a580fe..5cfc0338ad5c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -25,7 +25,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
-CONFIG_SOC_MICROCHIP_POLARFIRE=y
+CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
