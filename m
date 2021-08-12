Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F88CC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 07:45:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6439B60EE5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 07:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6439B60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLVP3cHZBSo29qK1CrFTk6y3GYdE6S/P/blCllrmGL0=; b=RcI1v0pUEvsNAC
	WcQW9QaHa7+PVbRogCcFZbszyJtg2RjAqBFP/fkMR2RqM4IjWko0SE4piNsdYgSKEHSzmvm2enAZV
	SBAe9EguKbTPw7Tk2sOfWzpc/uBB2B30y+NZ3c2gq5L5QRjA9EdMxSJzQWuMab8xvRRMObCwXQKon
	1olh+o2P9/V3e8PZcPVrtOLsOECI+YHIpvcwvRH2n6sX0dx8w3b1f0uscerdS2S3W608Lujf2xs+a
	ykviRivQhA/fo3NE+1JJD/iJB9nr5iGbCDOMzszgsLd7cqZAOogYoJTWIVR3qddJJY1uilh0kNKHW
	4Yw5/IpB+1DU0mVwDisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE5Of-008y4p-6C; Thu, 12 Aug 2021 07:45:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE5OJ-008xyN-Pi
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 07:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628754279; x=1660290279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=G9BCGG5pauZB4Jkjlwe0QadzDPfoCQnRp0F34qHKRaA=;
 b=FTEjo4FSE9BVDIC/8TEfu1Sk6tqSvk0p2Ztx9kZrnN602RBoHC/Qx+cq
 zpk7wMIBnOTqu6A21z/Mvi++GtbLM7VKcv19jAoaM9pS+hZ5I0Ye4OsVs
 lDpTxlckGKOr0W69KBLCR/Gx4z8ftr3RDd+gzaQnKZ2+lMoRajn1A/JhX
 lFpf5S/aD26dXjSEdQUX8kWhAekDxaigkqs/AXomYFAV++Ue3aA3qIohG
 +Fg1vdlgRih5op2X/fb3+sNTfXiK8Vl/3+2s6DMSUCzROIu/ZvpW9e42v
 yl8dAeN2oSiAtRF1s5hzAhtLAm2++/oWjvzOzn+BPCih8BPvtgAq/7uqY w==;
IronPort-SDR: 2zo4hHfaqqyttP/q70Rk5GL9gM0GhzHctVUow+5Yslnr4UWGYAU6TPiOQcn7xYZx4WAu0rOcDj
 yHmqYNZkzp/IjXd9AJTEXDWmo5nIsdZ6gUrp6QqkyvkIZmuPnLScoqpnYOC83gU5doNHOScUnf
 ovQLLKBSShZtJNRey2XeshyhXb28zm0Jjrv9cXWI1W8CckIc/PWQ5NhwoaWH/JyQM5H2NzIfHe
 Vcixyaar95lJaEMgyOUMeVI9FUl3MxR038a5av/Mdqoa5frvVJelWaVBOYWWO/VBT8aLDWVa36
 IBsN1KTsfkxSpmVGAwwk6pJk
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; d="scan'208";a="132520197"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Aug 2021 00:44:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 12 Aug 2021 00:44:38 -0700
Received: from che-lt-i63539u.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 12 Aug 2021 00:44:33 -0700
From: Hari Prasath <Hari.PrasathGE@microchip.com>
To: <nicolas.ferre@microchip.com>, <claudiu.beznea@microchip.com>,
 <davem@davemloft.net>, <kuba@kernel.org>, <linux@armlinux.org.uk>,
 <palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <robh@kernel.org>, <devicetree@vger.kernel.org>
CC: <mpuswlinux@microchip.com>, <Hari.PrasathGE@microchip.com>
Subject: [PATCH net-next 2/2] dt-bindings: net: macb: add documentation for
 sama5d29 ethernet interface
Date: Thu, 12 Aug 2021 13:14:22 +0530
Message-ID: <20210812074422.13487-2-Hari.PrasathGE@microchip.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812074422.13487-1-Hari.PrasathGE@microchip.com>
References: <20210812074422.13487-1-Hari.PrasathGE@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_004439_918602_69021DD3 
X-CRM114-Status: UNSURE (   6.81  )
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

Add documentation for SAMA5D29 ethernet interface.

Signed-off-by: Hari Prasath <Hari.PrasathGE@microchip.com>
---
 Documentation/devicetree/bindings/net/macb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
index a4d547efc32a..af9df2f01a1c 100644
--- a/Documentation/devicetree/bindings/net/macb.txt
+++ b/Documentation/devicetree/bindings/net/macb.txt
@@ -8,6 +8,7 @@ Required properties:
   Use "cdns,np4-macb" for NP4 SoC devices.
   Use "cdns,at32ap7000-macb" for other 10/100 usage or use the generic form: "cdns,macb".
   Use "atmel,sama5d2-gem" for the GEM IP (10/100) available on Atmel sama5d2 SoCs.
+  Use "atmel,sama5d29-gem" for GEM XL IP (10/100) available on Atmel sama5d29 SoCs.
   Use "atmel,sama5d3-macb" for the 10/100Mbit IP available on Atmel sama5d3 SoCs.
   Use "atmel,sama5d3-gem" for the Gigabit IP available on Atmel sama5d3 SoCs.
   Use "atmel,sama5d4-gem" for the GEM IP (10/100) available on Atmel sama5d4 SoCs.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
