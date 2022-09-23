Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31060C04A95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fP2CjfP3gNvP+PsNyrV1L7I1jB26EXTPo7Bt+9bHqnU=; b=W2xHSa3tSscShY
	OnTFWEjhHVSggDT1/1w5arcZdBcAccwjHAwI7DTpqei4M1Ntx7Roj6ZAOHHOjIPNUjR4KGjyIPgsQ
	OuzYFzyd1dazV81JJfXyrOHqHddlowRlk8ttIJ0K8pp3N4Usf7ExRDb3nVUOeYFCntGs+RJrDk/bF
	UoxOtg+BOkTUWm5PFBZyNglDJwf1SPVBdhlJ2S2mNuknrbtYatl+tpq5tutB5odfqAEkvuaF9QtaM
	N23v8nyJDU3uDBG2tENo30HxxK8ws1We4SCqaS8a6nSU7JVeUPb5srsYV/KGcVW/cPZ8BvQtM89sJ
	t2DKDsXR/L51mDEeNTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsY-005RLM-Nb; Fri, 23 Sep 2022 18:58:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnry-005Qm1-4K
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8EB361018;
	Fri, 23 Sep 2022 18:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2638BC433C1;
	Fri, 23 Sep 2022 18:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959468;
	bh=tP/btHFbkOYsMmorbMXlcmqK4MezoUT1/5Yvl1phQCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M8SwIeFf/m4e3PMSrOcE5OSNKy3AVlIMT9qYeSOwtJ+F43e15Hy9Oby1YUj7tUjhG
	 1+H17AyMSZjQAocsgZdHEAMqF1bK2r7sm837aroRP7BSsb1UZcxZGsaj/xhTAVHZ/o
	 9sZrdQ2w9hxJsuNNKoNhJiLscNg765Hs8jw6MxOUW7nY+jERhFndCxolcQAYXqjC6V
	 Uo7UrepZFJmX9/xXXeCG9PtiD8l5MnLOlEni+At3Yke88AwtWDtbtCJ6kypPdrsMjA
	 yZg+tfYymSMyjTDRixrmzigGf1X0DNXIRkP6WNAO0qLB8GiPfxV8WHAEEA7CklY416
	 KqVP5H1rvKaCQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 18/27] riscv: convert SOC_VIRT to ARCH_VIRT
Date: Fri, 23 Sep 2022 19:55:57 +0100
Message-Id: <20220923185605.1900083-19-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115750_244967_D5E891EE 
X-CRM114-Status: GOOD (  10.71  )
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

As per discussion at LPC, the SOC_ prefaced symbols are to be converted
to an ARCH_ prefix for consistency between "incumbent" vendors and
those with a legacy in other architectures. Rename SOC_VIRT to ARCH_VIRT.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs                 | 2 +-
 arch/riscv/configs/defconfig            | 2 +-
 arch/riscv/configs/nommu_virt_defconfig | 2 +-
 arch/riscv/configs/rv32_defconfig       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 811338720cbd..9a216deb5c9c 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -21,7 +21,7 @@ config ARCH_STARFIVE
 	help
 	  This enables support for StarFive SoC platform hardware.
 
-config SOC_VIRT
+config ARCH_VIRT
 	bool "QEMU Virt Machine"
 	select CLINT_TIMER if RISCV_M_MODE
 	select POWER_RESET
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index bfb6f6f57ae2..341202b90c7f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -28,7 +28,7 @@ CONFIG_PROFILING=y
 CONFIG_ARCH_MICROCHIP_POLARFIRE=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_STARFIVE=y
-CONFIG_SOC_VIRT=y
+CONFIG_ARCH_VIRT=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_PM=y
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index 1a56eda5ce46..9ad6a182d932 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -24,7 +24,7 @@ CONFIG_EXPERT=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLOB=y
 # CONFIG_MMU is not set
-CONFIG_SOC_VIRT=y
+CONFIG_ARCH_VIRT=y
 CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
 CONFIG_CMDLINE="root=/dev/vda rw earlycon=uart8250,mmio,0x10000000,115200n8 console=ttyS0"
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 4badab395546..ffa5e8f05ae6 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -17,7 +17,7 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_SIFIVE=y
-CONFIG_SOC_VIRT=y
+CONFIG_ARCH_VIRT=y
 CONFIG_NONPORTABLE=y
 CONFIG_ARCH_RV32I=y
 CONFIG_SMP=y
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
