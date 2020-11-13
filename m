Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A05FC63699
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 20:26:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1372078B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 20:26:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wVeMlAku";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AiQoPilH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1372078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cN76LO7AW40EtgVeydIrtYj+kl23bEijK5wjC55XjVo=; b=wVeMlAkuFtWU/2D1rJ9k0xI7R
	NrcOnmjvj1m7YNuFvE9uIQEZIkGZ3Ewli42TTHRFH1FERd279Lz/slIzNUVTShd8FUXFvxhRwIGzB
	uaiNG/snkg02BJOvcRiNQhaoiR2OpCH+QDPD/6bg9l7qCLdUb0bezNBcUKoy48OkTTi0OtRDnQkFE
	V08ukk14bBehP5J0vCjHSWN3sgd11G0w8tqqa8J/mmTer8GCOvBMaVBcGw+Omu08bWoY/XN/0y4U/
	PuD53KjTr0rbLr/fUuWCVIV147ogeKfe2W4GoVr6cE1J9rBUWUACk05u9TD1VUYWDnuvv5vL/KjmT
	4f2myQSVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdfeL-0004tv-Tt; Fri, 13 Nov 2020 20:26:26 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdfeB-0004qa-WD
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 20:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605299175; x=1636835175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hd8ZmjId7vBbXQM1jz5+4Nu+51CF6i4iXNW7aRPTEWM=;
 b=AiQoPilHu8dSlj0WwrhdQDeTsO/Mi3eK8Odl2wtofPNjWRS8EpJemcaj
 2qVzjcNHWMMYVHoaxfmsYl2KMSUNtE8ungO0+kLt6S0ko6WZuFe7HyW/q
 sPifVRV5Q9o+S0EztKL6+25UFDAd8KNdF3rfVTcix58l3MalBC21g1vfK
 KRJmfaC4aAjryj70noUEnJP6QsyXaiCNHtB0sTUrB0drB9DYFwmliB0Hr
 QMJ3om/MLCzuDVMxy3rD+mUuT9XnOQIFVIO3RTXOHw7eu+xSm9ir2jBNR
 IYgQ3AiAQQ1qLh50EDgdrttpr30QTFwsnMq/cPkQCt+BNpCDiPEaYXrS/ Q==;
IronPort-SDR: fAjp49l5HBBhQfqwb8Qz1GtKcWmgjXTo99HHm0/Gih4f588LeBGkQqu7T6poFTiV8YoX4I2QnM
 tb1k4/uxoKjSAi8bFna3s6nkhDkTVo36Trwt+6Ui+cXDfbJsC4Uqfs3655OZWP8ICvHbXRSbJV
 Bwb4YdRqAh4o2cFri2rGe6pFxphpjIGlkxHtO13d6VWlRHhB4WRAz8kI53NUHjfkcz3h6UHVEG
 rKbd2GF/wOLjdp/lCyGANhKCeNLk634wZj5913w4YfpEJXJI8vHtg0FW4W5Y18he/MRVIbbyLD
 Ij8=
X-IronPort-AV: E=Sophos;i="5.77,476,1596470400"; d="scan'208";a="152497373"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2020 04:26:12 +0800
IronPort-SDR: hu4FGNttID/xJfL75uvb//tNvW+RGLvz0IlGv8peoi1NChaoV+SL4/v46me/rSKb7yRcTPJ9nU
 F4XjeUhGqt+qBeIOOjh7Au4p4TkA4El44r9ofNCwCnlPXAhx5oLjQjnzKu4T7/qNNtmb/q/bT0
 777Eg9rwKow364+9/fAadiB6qQu0zA7SmxDkppidmP/qm6awJXxLzLA8zFtyFMR/hLpLTvYSH/
 /lih8ki4YFk/XxDle9yP11lMnbCHoCME/Wa/ufbkOctoMpzvSRQGWIg96IR8xGbxk7dBVfSCGN
 wqhtq9aTVr+w32LzysM6eHC8
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 12:12:09 -0800
IronPort-SDR: GudsojcbCJuJ151ef4pw2kB59L4vcuQhce5JpZv1kOCLeSlZOY3DxuQWl8sRQSNPEaiP4Y58V9
 ctH2csmrRUyzpU9vVIEmxl5jWe2cWVSzwMRr/OwmrSXGj2vofyzy6bpP6ZKU5/lkXkagF+2YFj
 pqQVV3+lXQjixM/jYZ7gfbiNN5q2GcqBoAwA+bEMOgOYI7gq1I7SpXX5y5WNy10K3B19Bh2AL4
 phSt7zYMHfqjeki68OTkkS34HdI1XX+L4lubt1W88yRRncydlw+azuCOF0smVTvmKs9Wz0SzDb
 Dbw=
WDCIronportException: Internal
Received: from usa003372.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.22])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2020 12:26:12 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/4] RISC-V: Add Microchip PolarFire SoC kconfig option
Date: Fri, 13 Nov 2020 12:25:47 -0800
Message-Id: <20201113202550.3693323-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113202550.3693323-1-atish.patra@wdc.com>
References: <20201113202550.3693323-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_152616_784118_87A563FC 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Bin Meng <bin.meng@windriver.com>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 Conor.Dooley@microchip.com, Rob Herring <robh+dt@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Ivan.Griffin@microchip.com,
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add Microchip PolarFire kconfig option which selects SoC specific
and common drivers that is required for this SoC.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Kconfig.socs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 8a55f6156661..148ab095966b 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,5 +1,12 @@
 menu "SoC selection"
 
+config SOC_MICROCHIP_POLARFIRE
+	bool "Microchip PolarFire SoCs"
+	select MCHP_CLK_PFSOC
+	select SIFIVE_PLIC
+	help
+	  This enables support for Microchip PolarFire SoC platforms.
+
 config SOC_SIFIVE
 	bool "SiFive SoCs"
 	select SERIAL_SIFIVE if TTY
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
