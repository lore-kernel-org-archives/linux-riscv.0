Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD311C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 12:35:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FAF222A99
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 12:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FAF222A99
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PKyWF59H4lWSy09rfRK9mbs7Vs1fSfzxs/4zFw2UMBg=; b=vsQqWQ8DseT4lFtJA3zfsuQDE
	urcHnCBIw/4iKkaE2aVOJrCdUkiPdptT2w8mc7tKlkiPlPA5Q77FvtyK/QGBH4HS5kHsLPtLuvwS4
	CcVCLZT0TdqWxNgYC5wQ1APFwKSTe2Q/S+H+zp6Vrgc+78ba5fU3x7LhMEesXEsNzpJWm7nLxdUEJ
	ST9PrmjkNglf+hh9fF7cruGuApxmSFnN9tD4VFFiCF53Tvg+MGai90ry++JwQyLs6MO+3davIipwv
	xmLEKXSWs7f+9orH4dT/2rsIZDg0HOT+3NwFH4OolOzmprStPdwpyHlAmx3/GHPmdsfFnifUy9XYQ
	VwhE4f5TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klAIo-0000Sj-LZ; Fri, 04 Dec 2020 12:35:10 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klAIm-0000Ro-6E
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 12:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607085309; x=1638621309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=CEAhOF2TJwycrOj7z9P3j3P2KFYumQb/0Mv/EX+Mw/g=;
 b=ZslFPDqbuNKD5Uk4Ed0Qdeg6OGjpAXbWqjhJmtjELDh+Y2zV57d/h3zv
 pp9r+AN3KUj4X2BFW620b2dm+yqkUC45bSe7G+nmGEisd/zOMJRyGWJX3
 A1G3okOiXS6bDdK9j8E5FJFp2mBYIaaFZkGNBrkyVfWH1/FFL9958F3mm
 AczeyXpL7g3aJaEOn6C0H7iSx1qWgAB4s+KKgrtvcwvS6u2XN4jwU6XhD
 QJrvmQXRS/n5REeZUARjAOb462W1fSxXdXQZ+gfU4VAK9VlhQ57zg0mpb
 W6f/1en498opHGr6hnuuY3C9fOB9A2iITs9qkdLf4PiuhOHFuG/kw7MiA A==;
IronPort-SDR: lGZYJVQlGn78KeShwwy5zzLE4V2cI87zhM3mRW+H4nfUuJIjaxIj9prdO2BjlZZNx3Q08R76ft
 /lehhDedLFk43Ra0ahkWnbH7UY41S4+mgo19GFj9aIuKVHVy50mRgQk/eewLu4u+y7BAfhrRsj
 sC6a6tZ9Zp+ajhRaX0fV9CziK3DGbfFxWFr+4HlLyMoEb96S4oQrvKTvqeh1/3NNXANyEWZ9/h
 whf/8Jwf+E+KiHYSdRpoZF5MnhTKaXJnp6YypLa4vS4o9gd/LU0RSdmvuwVY+DKOMh6el3ULSr
 zYk=
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="100918867"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Dec 2020 05:35:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 4 Dec 2020 05:35:05 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 4 Dec 2020 05:34:59 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH 5/7] dt-bindings: add documentation for sama7g5 gigabit
 ethernet interface
Date: Fri, 4 Dec 2020 14:34:19 +0200
Message-ID: <1607085261-25255-6-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_073508_364260_28F3E631 
X-CRM114-Status: GOOD (  10.21  )
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

Add documentation for SAMA7G5 gigabit ethernet interface.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/net/macb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
index 26543a4e15d5..e08c5a9d53da 100644
--- a/Documentation/devicetree/bindings/net/macb.txt
+++ b/Documentation/devicetree/bindings/net/macb.txt
@@ -17,6 +17,7 @@ Required properties:
   Use "cdns,zynqmp-gem" for Zynq Ultrascale+ MPSoC.
   Use "sifive,fu540-c000-gem" for SiFive FU540-C000 SoC.
   Use "microchip,sama7g5-emac" for Microchip SAMA7G5 ethernet interface.
+  Use "microchip,sama7g5-gem" for Microchip SAMA7G5 gigabit ethernet interface.
   Or the generic form: "cdns,emac".
 - reg: Address and length of the register set for the device
 	For "sifive,fu540-c000-gem", second range is required to specify the
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
