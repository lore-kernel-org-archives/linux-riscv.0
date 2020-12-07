Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69616C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:16:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D15F2339D
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D15F2339D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hx1yEHVZvrLbMiGDs0W8LZHdml7kOwPqKmAeFsWfP/c=; b=SRiAOVrVvpGn9hRJusnP2t3HP
	m7+ll2C9AVu3WS9eNejDaORYWa0al77AeGIkj05/YxACl5UMNU74Gz3CmoUlI9k3Hwg+TpKZywEx/
	6kGBh3Io8t97uinofDEYTMRIbNZgTbpVMh4NLzYfLpK5SwLbcLoK1TLiwp5sfyqcQByuOhpCzrX7z
	UfGBI1cjli9xnQ8RmWyTqQ6unlugNfF5fU3sZcxVrOU580IrOnttfQD4jKZhnVQu+W8Y2H1mQAj70
	hgAbTgnBpkdQwW9y7yXXUnN8w/91jQs++jyfFYcOFOI0Yud4ZekMOxhgyQVLGj//sysdwKoscrA/U
	FzK790VqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmFRc-0000Ic-Bc; Mon, 07 Dec 2020 12:16:44 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmFRZ-0000H5-PJ
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 12:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607343401; x=1638879401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=P6cdKIf6J3Sjbkovv9YjPeCYdVmSSKRAJ4HlEMmNDCs=;
 b=x7kTwbm3qRAHPXrhP+Ojq66i6MT4Lh7izMsia/giz0Umq4rWoRH1uexH
 cxaJ2wjfbcl+RFlmDdd0yY59AYixKy95QRmc+L3SXQ6kgYOo+qvTsLpOg
 25jfQ51tA6jAmnKa9BIEljYhBx3m3i/vNrdrKNKE5jFmo20zKlBHcfY8c
 7rpGt60MEIyBsgi7sX4ON9wzLAiU8yLt0xTWasd+iTTKWHwZ9IN01V0x1
 Avoa/XcMR55N/n/EiWRQsHwWGwsguzB2KwySmlRAnwiOiDPQ8pF6kpy/v
 OBhAYvkJIQ8gWjUHvmSMur9tsk2Xu1inWEmDWv6qQTiRyymYilq0d6il1 Q==;
IronPort-SDR: 2cRnLYN91b6QJn0p4Dg8Qd9vR2NnlMKdEYJahY0q1e37wdBuH2wMb7hxvDVLM+zqTCvWL9Rgeg
 KObGtUGlf5FgTuchzJbcMtphHGxxQHVCziqf3/3isiRWNtTr2NLfcatafAqNQI95GoA93i8IXA
 /GUAlZ7fWIc/ts06voBvjubZFcDVoXv6+va0N1DPh9H/4yf0Y6U8PLRTVZvlfvzQpNBer6JYTc
 wN3GP2A3rqReJAZ0M7A+62oJVF2txnbPZP4Mu4Mmm1Mx1fK41DJVNkMq+jYs/aW7QzLOcQfPY9
 RbQ=
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="101729141"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2020 05:16:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 7 Dec 2020 05:16:29 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 7 Dec 2020 05:16:21 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH v2 6/8] dt-bindings: add documentation for sama7g5 gigabit
 ethernet interface
Date: Mon, 7 Dec 2020 14:15:31 +0200
Message-ID: <1607343333-26552-7-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_071642_073868_6BB348F8 
X-CRM114-Status: UNSURE (   9.63  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, yash.shah@sifive.com,
 linux-riscv@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add documentation for SAMA7G5 gigabit ethernet interface.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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
