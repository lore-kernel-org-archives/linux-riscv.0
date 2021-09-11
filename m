Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EFCC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:22:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5FA961216
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5FA961216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxL7da1q19uWtfUeR9yIbZO+3UBTTmgnZXfnD+1A7B4=; b=MpnePfD5A/EGfy
	pXLXWkjvAtcQIfY4qhXRjU3nBRxT6mSJeddvKZzu1342H1tkWkAgWddwoJWihr4VU+33v8hqBHT26
	u2+ERVmU7Zb935UPwp0NGT9hNK8LVmSjT1ikosrm40Osbz5yk7tUcWKkUCYbE2+AtOWysMT7ihTWf
	Tr1/M4UYPzy0u7oPYQFb3emuKVHty3p6+OmGtmTnZcDUaofOdgkAZ8eTkoop3rFiZ+xjVXfFExi/u
	2kyofKnA8gYI3B8v1PFKn0weENhFN/ltfdYjEVcvuKs9Ae5Nb0MpQgzEIvBcRiWNo3xIczKAZ1bwM
	2AkkX/3VSP/Zt/cA3v3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOzDU-00Eb7I-Rt; Sat, 11 Sep 2021 09:22:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOzDS-00Eb65-Ax
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 09:22:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6056761221;
 Sat, 11 Sep 2021 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631352150;
 bh=cRNfFnfeWGtcYlgL0PiB2KFICmvm/APlEwTrrujZ2D4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DwTVSxsrXizDaf29KSNkLvVarSdmBDDs1X9JPPdiCw+yjKX+h2av4oPRu1n/F2fmB
 b77KfT4cmza+/EoQ+o5uxVYZff8Wr3WaU3N7o427j0MZmI8UpiWjR6FYn4ZKVICYlX
 HrZiFmwgslW4SKxAalSW90GoxGhe/YrmbCFHVxhSb3MI7F+QYbUQJJLyiWs6OiT3iO
 U1X53I/4wcF5qjm8Y4kIasLuAVS7LjtNS7m/uxohtGQa1pXW3Yygz9qOv7NPJA3DUc
 o/YH2LxMuKWeUrnMBDljTHk9+qu+VXNXDF8kSCboZCJuEcccTz5Pqf0DoYbVM5j+9n
 iSH6vrqlx8sZg==
From: guoren@kernel.org
To: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 hch@lst.de, liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 Guo Ren <guoren@linux.alibaba.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>
Subject: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
Date: Sat, 11 Sep 2021 17:21:39 +0800
Message-Id: <20210911092139.79607-7-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911092139.79607-1-guoren@kernel.org>
References: <20210911092139.79607-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_022230_438379_DA5700DF 
X-CRM114-Status: UNSURE (   8.99  )
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

From: Liu Shaohua <liush@allwinnertech.com>

Add Allwinner kconfig option which selects SoC specific and common
drivers that is required for this SoC.

Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
interconnect issues for dma synchronization, so we set the default
value when SOC_SUNXI selected.

Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Wei Fu <wefu@redhat.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Drew Fustini <drew@beagleboard.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Wei Wu <lazyparser@gmail.com>
---
 arch/riscv/Kconfig.socs      | 15 +++++++++++++++
 arch/riscv/configs/defconfig |  1 +
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 30676ebb16eb..8721c000ef23 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -70,4 +70,19 @@ config SOC_CANAAN_K210_DTB_SOURCE
 
 endif
 
+config SOC_SUNXI
+	bool "Allwinner SoCs"
+	depends on MMU
+	select DWMAC_GENERIC
+	select ERRATA_THEAD
+	select RISCV_DMA_NONCOHERENT
+	select RISCV_ERRATA_ALTERNATIVE
+	select SERIAL_8250
+	select SERIAL_8250_CONSOLE
+	select SERIAL_8250_DW
+	select SIFIVE_PLIC
+	select STMMAC_ETH
+	help
+	  This enables support for Allwinner SoC platforms like the D1.
+
 endmenu
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index bc68231a8fb7..a50f250fbdd8 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -15,6 +15,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_SOC_SIFIVE=y
+CONFIG_SOC_SUNXI=y
 CONFIG_SOC_VIRT=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SMP=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
