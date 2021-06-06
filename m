Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBE1C47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 09:08:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 566C96120F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 09:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 566C96120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jABT8uMDqXr6k+AxlhPgzNNu5Z32dUyOTiibbtml+Vg=; b=ijfDFtmj9anxZ/
	gai4V+eetAq+SVbx3t0p+jIupvuilGbkfB5p0b+WtcKMjdSWIoHyA9Ul8pNcOJ02gCKY9+gWU9+cN
	Gey63p3jvrnup1tjRwgSkIr9f47fAazIoF/WADw+9h6nStbdXOGiwrnlnyAt2S2vku8Vk9b//8Nr0
	dG1STf2pvvoDBp2j/5I0Xg3hzDn9wGL4s22Qqx2ceqV7E7SarwMiotXDHCfDgwy1r12IyU9CtxZca
	2exiU+2UbeHTRIMAGeI9O2whtBQOCdBWZHXWc8vXV5hk6uFvqbSjUxDlucyjtkyYE3Vr4/Rl0HQr6
	lw3cGUbF7eYYCWEY9TCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpoj6-0002tQ-JW; Sun, 06 Jun 2021 09:05:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpoj4-0002ru-1r
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 09:05:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6CFD61429;
 Sun,  6 Jun 2021 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622970345;
 bh=up6MI09XxUOny0rsrKOJu1japPKIJnaYG9XFipf9Ric=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QDyGyevpWmoRQQnZeg+GC1blL4gLIm6F+O2h7coAarAwFi1UbAdal76AOAdtdKTAd
 0YavnUi0Fp1tQNs2BFAIz4eDq4rSPPxS2HnGRftJ5VENFj5Fa8Y4vePN+0YnapzJHs
 nmByx4jFku0vrNN0uZCTkDaVdgxc58lW21Ag1yMWnSrB2XQr2FRVUau0UTsL98HGb9
 3kIWbW4+yjH0eqfSrO2HByUBDAiB37iH+r9JgEA8P3KhUyEdCwDhENXnDeo+JANNEf
 wQtrkAXlPqxcF3mBaCydUv46FDYFOrFcfTP9G0UVr+/3rH+Wg/Ldni+IGRzbotkCJh
 ew07KYtkyu42w==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Atish Patra <atish.patra@wdc.com>,
 Christoph Hellwig <hch@lst.de>
Subject: [RFC PATCH v2 10/11] riscv: soc: Add Allwinner SoC kconfig option
Date: Sun,  6 Jun 2021 09:04:08 +0000
Message-Id: <1622970249-50770-14-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622970249-50770-1-git-send-email-guoren@kernel.org>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_020546_197222_4DC94F27 
X-CRM114-Status: UNSURE (   9.76  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Add Allwinner kconfig option which selects SoC specific and common
drivers that is required for this SoC.

Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
interconnect issues for dma synchronization, so we set the default
value when SOC_SUNXI selected.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-Developed-by: Liu Shaohua <liush@allwinnertech.com>
Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Drew Fustini <drew@beagleboard.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Wei Fu <wefu@redhat.com>
Cc: Wei Wu <lazyparser@gmail.com>
---
 arch/riscv/Kconfig.socs      | 12 ++++++++++++
 arch/riscv/configs/defconfig |  1 +
 2 files changed, 13 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index ed96376..055fb3e 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -69,4 +69,16 @@ config SOC_CANAAN_K210_DTB_SOURCE
 
 endif
 
+config SOC_SUNXI
+	bool "Allwinner SoCs"
+	depends on MMU
+	select DWMAC_GENERIC
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
index 1f2be23..9e83d14 100644
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
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
