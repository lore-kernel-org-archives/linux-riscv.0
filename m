Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F23C83F0A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mLfodULVkAuvr3RpafVpryqI1niCEH+LN4AOIr9bzhU=; b=hZJpJSpCPLRp2a
	VPTaX5ds6Lq5TmDnckmeKxCr7dDgZmynQqDjmPJgNcaOUaZEVfGmdb+vcA84cS/yJ2DwlJtS+WSK9
	Nntak7sFJKf3Xo0wlwMskTdgWQnxkwvxe8A8YWj4FOW1zxxE1o/a75U44OB2RTUh3PGP2MAedI55m
	wyp03O9vBPN07kqeIhPzpZGvC0xFqHXuuNuChT6N90Zj6wXkFdhkJ7HDF+YhC6/jc0kzinoN7ti/t
	VckpdcMZeQA57q4/u4uLYAIMqTcyw4iNVN7w8LhY+RoSme/r0fQCifqJNHtbYFoUz2NWWn2cckG+C
	Kn/QYsky58osD89D+vpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAwb-00000005w4p-1KoA;
	Tue, 08 Jul 2025 16:13:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZANM-00000005pmX-4312
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 15:36:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C30B613A9;
	Tue,  8 Jul 2025 15:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BADEC4CEED;
	Tue,  8 Jul 2025 15:36:52 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=m
Date: Tue,  8 Jul 2025 17:36:48 +0200
Message-ID: <0886d3eb81bffbc1d48e701cae21c42cad29fefe.1751988704.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

The SND_SOC_STARFIVE Kconfig symbol was removed, but it is still enabled
in the RISC-V defconfig.  Just remove it, as it is no longer needed.

Fixes: acc317e5254a739e ("ASoC: starfive: Standardize ASoC menu")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/riscv/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 37c98c0f98ffc0ee..82be92dd70dc29a8 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -191,7 +191,6 @@ CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_DESIGNWARE_I2S=m
-CONFIG_SND_SOC_STARFIVE=m
 CONFIG_SND_SOC_JH7110_PWMDAC=m
 CONFIG_SND_SOC_JH7110_TDM=m
 CONFIG_SND_SOC_WM8978=m
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
