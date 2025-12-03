Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12A6D116F3
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KYhaIY5UcpjSnfaACYAVtdP1QIYmBH4yH55KeQD4sMI=; b=o1NmrYIEYEjX9r
	EgIYFY2Xl5hgjYIKPuUk7Vhwv7Py6Bm7whq50nQD+WqEvj70LUwmGAxkxthGvyq6ene5c9Z13kpMo
	oy4b5bMSr4fZn3QSCfjqrHdzN3WrmMEQCTPysTyCyxuoYdzqBevcIRfDRjUDWJj8ptHxOykRwtnyV
	8aCkL4HYTuhHG/TFPC5ruXDGVriZR1PRZK6/Imyrd9dVmXf9a99QDvkvAMwCUTv1anX6m9Pofbc+J
	ho3aTpICaZ/hLiiM8TDdL+Zr4eCOZmlSJm3oy3euQzhYmJB+eIyxgqjZPSYc/mVL3zi9TqBrQz11A
	FPIMAMXi3HHcmL1JGklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQj8w-00000006Ns9-2v2E;
	Wed, 03 Dec 2025 09:27:26 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQj8u-00000006NrW-17TM
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 09:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3e
	uVHr8ctRCjQ/B0VEgOKLb41oHxbWbM41uHSkvulpI=; b=RKgCcsAh3k6FO8XxJw
	WQg+JRqqa4CqvTfWju530yW6h2W3mAwf3EtXc0hu/Struy6PYnYKXyhipi9uvhbB
	5LtkdrhJ2FHOZDugTw5ozXM0/0qMBRZWXyPYd2womjNpVk7V2ZPvUS0C3nSU5PKr
	OP8k83QgkPqEcekh3D+YZJseo=
Received: from duge-virtual-machine (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3X0o5AjBpbgmrEg--.35163S2;
	Wed, 03 Dec 2025 17:26:18 +0800 (CST)
From: q691800735@163.com
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	jybruceupup <q691800735@163.com>
Subject: [PATCH] riscv: defconfig: Add MMC support for Kendryte K230
Date: Wed,  3 Dec 2025 17:26:14 +0800
Message-ID: <20251203092614.219392-1-q691800735@163.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: _____wD3X0o5AjBpbgmrEg--.35163S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF1Uuw43ZFW8XF15JF4rGrg_yoWDCrX_C3
	yIkw1UZ3yDJrZ7WF1Sqw4Fg3sFk3WFqF1kXr17Ar17WFZIqr1aq3yDXF18Ww15ua1agr47
	ZrZ7ZFyIk3W5JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMKZGDUUUUU==
X-Originating-IP: [220.196.194.129]
X-CM-SenderInfo: jtwzimyqqxjki6rwjhhfrp/xtbBcwwZMGkv-c9q-gAAs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_012724_654194_0F2705C1 
X-CRM114-Status: UNSURE (   6.16  )
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

From: jybruceupup <q691800735@163.com>

Add dedicated driver `sdhci-of-kendryte.c` for Kendryte K230's DWC MSHC
SD/eMMC controller, enabling boot-essential external storage access.

Enable driver in defconfig: `CONFIG_MMC_SDHCI_OF_DWCMSHC_KENDRYTE=y`
- DT-matched ("canaan,k230-dw-mshc")
- Uses upstream sdhci-pltfm framework
- No impact on other RISC-V platforms
- Supports K230-based boards (e.g., CanMV DongshanPi)

Signed-off-by: jybruceupup <q691800735@163.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fc2725cbc..5848ec2b9 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -232,6 +232,7 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_OF_DWCMSHC=y
+CONFIG_MMC_SDHCI_OF_DWCMSHC_KENDRYTE=y
 CONFIG_MMC_SDHCI_OF_K1=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SPI=y
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
