Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35A9C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 22:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6iyLm3MdTszwCU77oQhYiofbB+bzuEQLAZemjaqLoQ=; b=nVoUPjhLbEpPey
	xAtMik07K10We1s6ozRwpf7Nh82qPIDy025F0IrHc3bt3OznQaJ4+mCgYNvgy1rHz9Xp1WPZ76Ihx
	/WqhoKYnfuTRjaw9omTGUkt9zAjz/5/EvNtiDHmyAdV/FAnMRkXcK2vGueSuIsQ9rns/lBSL/9aek
	NSGLhbGwIVf4MwmHcXT61pbfKvlpIidtcyXtLFhYeHsBI/UEnNpELc7UxTHP5JFYeZ5Fq/W0btZDx
	YS+8UXVUYnwmvo84wihcb/FOQA5nhDaX1TgGKY7x3uSiGcjgrfxXt8HyfTiJHY2a2iGZM5aRkPpNA
	iCsF9WrHkTcBc/LLdX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7O-000mLk-8o; Mon, 21 Nov 2022 22:18:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7L-000mKD-PH
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 22:18:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64324614C3;
	Mon, 21 Nov 2022 22:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1EF7C433D7;
	Mon, 21 Nov 2022 22:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669069098;
	bh=Mp/qHJbEET1gRdLX+njK38qbYjZnjBHmZCF007jkaAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kAxhByaoRTToXJFd3NJ7QcPvnQtUxmGNY2XnswY/eIVaNn98+wdzVJCnXDQ+2R1qP
	 ZhND5AcaKP4Q6s9O4ZcqQISxcqe+wl/zrxG7Ni4dnzW8qzpI+DktCJ5bwMPLWhzCgV
	 8qGLTpFPSEPx5mQaTrAo/eQKHrH3sIQShdRLRRLwBc43oknwVot1DlLu2sk5+jvKhy
	 S32NKsC7VdPLDJuNRsY/mruIv130QyNl1IRe9ttqTBCgDZ8OR8eZmRWmMCloycH9rG
	 s9DFrup/lyKK+hX7luMQk96AxHgRKv0ZVZXG6Sn25FaAkGZgTYTD2pey+nmMPBIhIx
	 KnBVSVyDq/crQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@infradead.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v1 2/7] RISC-V: kconfig.socs: convert usage of SOC_CANAAN to ARCH_CANAAN
Date: Mon, 21 Nov 2022 22:14:10 +0000
Message-Id: <20221121221414.109965-3-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221121221414.109965-1-conor@kernel.org>
References: <20221121221414.109965-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_141819_911712_5968E745 
X-CRM114-Status: GOOD (  13.59  )
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

While we cannot yet drop the SOC_ prefixed symbols, we can convert
uses of these symbols within Kconfig.socs to the ARCH_ variants.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 58cd2304b82d..203d1c528ef4 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -75,14 +75,14 @@ config SOC_CANAAN
 	help
 	  This enables support for Canaan Kendryte K210 SoC platform hardware.
 
-if SOC_CANAAN
+if ARCH_CANAAN
 
 config ARCH_CANAAN_K210_DTB_BUILTIN
 	def_bool SOC_CANAAN_K210_DTB_BUILTIN
 
 config SOC_CANAAN_K210_DTB_BUILTIN
 	bool "Builtin device tree for the Canaan Kendryte K210"
-	depends on SOC_CANAAN
+	depends on ARCH_CANAAN
 	default y
 	select OF
 	select BUILTIN_DTB
@@ -96,14 +96,14 @@ config ARCH_CANAAN_K210_DTB_SOURCE
 
 config SOC_CANAAN_K210_DTB_SOURCE
 	string "Source file for the Canaan Kendryte K210 builtin DTB"
-	depends on SOC_CANAAN
-	depends on SOC_CANAAN_K210_DTB_BUILTIN
+	depends on ARCH_CANAAN
+	depends on ARCH_CANAAN_K210_DTB_BUILTIN
 	default "k210_generic"
 	help
 	  Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
 	  for the DTS file that will be used to produce the DTB linked into the
 	  kernel.
 
-endif # SOC_CANAAN
+endif # ARCH_CANAAN
 
 endmenu # "SoC selection"
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
