Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6430C4361A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 12:35:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6E122A99
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 12:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6E122A99
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+0CXdbieQJh2Vq3RRJMUhZbm9MqZskof8PV7j5GUVVg=; b=ktxdtV4lUccnVtvfEOB9AYEoo
	B3PjGVTJcXJwTEvwT2Ls05jSRnQBzQ17ZLDTaUo1U5kH2d5YgC9+PsjNzWTn57kV0PFakPyLhLPKM
	Geh77zO4/28WRtVCScSij66ajsmEsyHjiDIgMkcqNEdZiXvNhIfjH7DuEfQg0l8Iatf7jVMmV2o+9
	sCE+DmGTpr09PXbgVba7d2/vekSiIH/3S6Vs7FnIxFY+EhlN2CHiR8ziSe2LX9XxATpfpYZ63onWb
	f2BCOgHfintrVwWUh62EdA01WhpcbFwHS4VXV5Ab3PBtGN80GzpMRtSya82NSL++0CAGXPkaEe+Bn
	4CJCthVBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klAIh-0000Qk-UJ; Fri, 04 Dec 2020 12:35:03 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klAIf-0000Pc-8c
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 12:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607085300; x=1638621300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=jY0R1/xfu6HtmxjTgcdxe7QK3p92MvvnE8O6H0jUXmQ=;
 b=XNufLkMeD7aGdCO7shgIp+GxGgRAJmawcgQeLGT0OljaJ+g3y2LT3x+b
 1V6a4FtSDyoaY6GHcbogp6ZQmafJimV/R1wnLGyL6A7HJhFcCgrXKoR5N
 DUK63Qyd9f15qU1pDya+IfEDr/G8VwVgtKlSGaOnD9H0yi569j4F1eRM7
 odk3q3//OvJvQWMbDZnLmJtPJzw94sefZ6E6PeHmLG9EHXI/zPhSEnxjZ
 kFoIRjJ7i0gnTmcu0NzWviHkTQY3KKuDVxDTcXEYHhj5860RFZvIXPyZT
 QRsf2ds9rjGLjQlj2TkFqmjOMgS724NuUFcmOUomgQatR1NsKu0zlLhKf w==;
IronPort-SDR: yQcU00xr0zK5tubVLPX5yonEi3W28OoMB75jGJ27XyOAH8cxFiBkx2AQdlqnlsVrC3mRfJea2L
 /mmu1c4UViqAWU9R7q0mkGi7u7WNAsDbgVhpq/DchS5cxVFpoYXq2gmTsImtzf42ODbQrDb7/T
 MNrbFhl7pN9EzZrMNmJcNS77XwPl/i70xht4+qlz4vAgdsPGSP7e+DHmPdm0zi/UyxnH8y30Iw
 1v59h/WuSXPyGdnKdQh+3p/Mdip0w7DSPcMTaH0CP96wUDsIM5qrU9sM1C2qcEh+hsRi0/d1BL
 EQM=
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="106188081"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Dec 2020 05:34:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 4 Dec 2020 05:34:59 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 4 Dec 2020 05:34:53 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH 4/7] dt-bindings: add documentation for sama7g5 ethernet
 interface
Date: Fri, 4 Dec 2020 14:34:18 +0200
Message-ID: <1607085261-25255-5-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_073501_486183_B5CFC5BD 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, yash.shah@sifive.com,
 linux-riscv@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add documentation for SAMA7G5 ethernet interface.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/net/macb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
index 0b61a90f1592..26543a4e15d5 100644
--- a/Documentation/devicetree/bindings/net/macb.txt
+++ b/Documentation/devicetree/bindings/net/macb.txt
@@ -16,6 +16,7 @@ Required properties:
   Use "cdns,zynq-gem" Xilinx Zynq-7xxx SoC.
   Use "cdns,zynqmp-gem" for Zynq Ultrascale+ MPSoC.
   Use "sifive,fu540-c000-gem" for SiFive FU540-C000 SoC.
+  Use "microchip,sama7g5-emac" for Microchip SAMA7G5 ethernet interface.
   Or the generic form: "cdns,emac".
 - reg: Address and length of the register set for the device
 	For "sifive,fu540-c000-gem", second range is required to specify the
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
