Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10800C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pL51A5/CqlxsWNP6KzPCF4PTJlcnplGXA1SDgTchxs=; b=kcr7yt5Ix3uDNx
	VzO6H+aPDdips8NNUyJnGTejY/77X20ZFV1gK9+0eFSt10k+nKQFoC1Sy7OGm3SOLgouEaK0pE9zM
	26yiJAKu75QoUJt3qs6Eoe1XtTv/z3vtRM2TCpOV4elWFpC4F4OO2LVKTx6nMiZTuvHCkN/3/JMDa
	nozpgWTEtc9qmxHvJe7IX9iifgpW88mVCwRWrPJO8Y53GUYpid70WOvInI52zcFCe7d8iyqmnsUTi
	ZdqBlN6d/pirRo8534wnsQbpoy9Fo68OvTpaJ67fiYxwiqqjUwW3REKkxCcIYYU4NybONKfKbVF1h
	zoVs1D+kjyTLeQUTUlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6WW-00GC9f-GG; Thu, 27 Jan 2022 15:17:20 +0000
Received: from out29-4.mail.aliyun.com ([115.124.29.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WF-00GBwx-9v
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:04 +0000
X-Alimail-AntiSpam: AC=SUSPECT; BC=0.6349558|-1; BR=01201311R141b1; CH=blue;
 DM=|SUSPECT|false|;
 DS=CONTINUE|ham_system_inform|0.0327302-0.00826224-0.959008;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85OzO_1643296617; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85OzO_1643296617)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:16:58 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 02/12] RISC-V: add Nuclei SoC Kconfig option
Date: Thu, 27 Jan 2022 23:16:37 +0800
Message-Id: <20220127151647.2375449-3-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071703_587136_EAA76BAD 
X-CRM114-Status: UNSURE (   7.37  )
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

As a CPU core vendor, Nuclei has some "DemoSoCs" that uses Nuclei CPU
cores and modified peripherals from Hummingbird E203.

Add a Kconfig option for this.

Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
---
 arch/riscv/Kconfig.socs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 6ec44a22278a..e4488ac8c72b 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -7,6 +7,12 @@ config SOC_MICROCHIP_POLARFIRE
 	help
 	  This enables support for Microchip PolarFire SoC platforms.
 
+config SOC_NUCLEI
+	bool "Nuclei SoCs"
+	select SIFIVE_PLIC
+	help
+	  This enables support for Nuclei SoC platform hardware.
+
 config SOC_SIFIVE
 	bool "SiFive SoCs"
 	select SERIAL_SIFIVE if TTY
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
