Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475D0EE7FF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qLH7UuH0i+tY9Z/dPyphiX+fdMCmvwKURjEp5APQJvA=; b=3iMHBcEXNj7+UG
	o+tjtxLIyUYaVUxnIU+Ia+PSqnnoto6HXmi9iJcVRs+7qW86T/Yw2/KTpOot/XLnhd1IslqAnlrZe
	9Oc2Pm57OyWVxeJGMUpV5YC10jcw/DMCrJtr23EgfKyfrF92cyte/vpSg/OohpXgaPisKq8XtnSSn
	pIXtfhsOaZL92Sw654IMAyosGHEXSWwPu9lLP3UDIIXH/ZhWOWZX3KfoxZcNzk4uEe1gzhtutTJ4e
	L85L5HQPY6QL4lA/Z3jlvtp7+H38OQ6fK6enGzca6JAbCJ5y8aSEPQui+TO5/JYmFYrHRxIcjr25A
	k3rAsKAR04IbdzAD9QYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgXB-000YIi-2N;
	Mon, 11 Sep 2023 13:00:57 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgX8-000XyQ-0b
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 13:00:56 +0000
X-QQ-mid: bizesmtpipv603t1694437199trjm
Received: from localhost.localdomain ( [255.178.53.11])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Sep 2023 20:59:57 +0800 (CST)
X-QQ-SSF: 01200000000000302000000A0000000
X-QQ-FEAT: 6WLXEB60CfU6gl+0T7VQ7y7v63PY40ezi7u04+YNzdCnXIqjzLgP2nL5gtTl8
	NPAPmj8NOF76BDhGN96OXFLTK93HpLe82OevqdWaQM/aFQLohIeaB+GVxMrSXq/sPiuyph/
	6yN/V3NOTNwZn3yJdx1HPOHsGtirccrxhRojqjaJ/dhnVE0YmZtxmu/YXrcSf0rbt6VZHl/
	0yCkaKNowUFu6FEZ1GxMVY1sOtnv320Z+GrPsar4CldzfQuCcLiLqaJTIJLZwYH9hEc6Wvq
	esli6Gh0wURUleDhcUW7kmri3XyI58p9sO+ghTO4MUJKQspXt1LrH8IM66SBoUhUUuMDTty
	BJ6cqMffRYQKgSpjafsHjCPiEsv2vSGK/0e/Xc+
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11791659690987653282
From: Jinyu Tang <tangjinyu@tinylab.org>
To: william.qiu@starfivetech.com,
	hal.feng@starfivetech.com,
	conor.dooley@microchip.com,
	palmer@dabbelt.com,
	apatel@ventanamicro.com
Cc: ttjjyystupid@163.com,
	falcon@tinylab.org,
	wangjiexun@tinylab.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinyu Tang <tangjinyu@tinylab.org>
Subject: [PATCH] riscv: defconfig : add CONFIG_MMC_DW for starfive
Date: Mon, 11 Sep 2023 20:59:55 +0800
Message-Id: <20230911125955.8937-1-tangjinyu@tinylab.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpipv:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_060054_598073_D4556FFB 
X-CRM114-Status: UNSURE (   6.30  )
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

If these config not set, mmc can't run for jh7110, rootfs can't
be found when using SD card. So set CONFIG_MMC_DW=y like arm64
defconfig, and set CONFIG_MMC_DW_STARFIVE=y for starfive. Then
starfive vf2 can start SD card rootfs with mainline defconfig and
dtb.

Signed-off-by: Jinyu Tang <tangjinyu@tinylab.org>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ab86ec3b9..0664b92d1 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -170,6 +170,8 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SPI=y
 CONFIG_MMC_SUNXI=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_STARFIVE=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
