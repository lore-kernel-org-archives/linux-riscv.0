Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5C7C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:16:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F50D233FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F50D233FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=buy60QqZSV5flSOZ/0A2UuE3fc1oC2n4J3mWRM/II/0=; b=juySBIjfAXOY1xC3EiWMke0io
	EFViI8nDP+jAMRF7JlUHA4kSURQydb6SVV3Lv1kGrzzTz0D2+L8f/OG1v2tWdlRc1o+yFw8EAVhHu
	ULUxwch8j/OK2O5n3hQgTsjvS4QtKpAFU6i/7oJTflciXPQrJOPxhcX2njKA9p/+fdfUxlUqwtHvq
	8JovGlOw1Zy6DcvYvbUS6O7Ntlue1XBZ89qiQb59ZjLLdmTHouAHDD81Dq4bwr9l208q0HITEM/pF
	yPixR7NPyxkVhS+HzcNCYPgWPP7X+BJTM10O0HrSVK2ryleT45Q8i0/xTTklgpb4I8W2R5J0gIirQ
	2IXp9Fh+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmFRL-0000Ar-7F; Mon, 07 Dec 2020 12:16:27 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmFRH-00008M-HT
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 12:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607343383; x=1638879383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=DUxcKkP9tne2ZEad42EnpND5G9jdrOj1iXVeTt57jG8=;
 b=D0e0tZTpNX9aIkZp75bQuMVmx5kokt4ZSaiK5SBLF3RAdpJzci0y2Y02
 Og/uXQvHL+CM0cxXqLx7DGAGmr18r4CObgKHrHC4V3G4BQhincne6Uuck
 iyigdWlTzt3d9R9Qk7IsyJYakRxTNr9ojMIvm2Mjj+Ph3EVdM65geAzTh
 ALDC+Y1lUPjFpCNNbNOq7xB59jLiPcHjW9x4gDR+obnCIcgwR7E821viJ
 tNAbfcjFH7WrIqW9W/jggRq1LcqZfm2e9i3xT2TpGN8T1WWhNkESkTW3q
 oALAkEtSfbn1GNR7V5e+bNE/R1LFjGX6pYaslHjsJgspY/13zMbjBWSRX g==;
IronPort-SDR: 7NBQCNTqGwOIfkmqgNYQkDZLfGGyFDD+TjnnaGsPa3QWsUk8C8FCdpp+PLQBX7//R9MW7N1dD0
 W+mMQyRPpn39Utv2/7RK81YAGY9f1CR6QMlX/6lC8BaULd1Hq5da3eejitf39Gn4+AkQ9MzbhD
 jT0Tz7KaB2UkZhA5IhbZgi6EsGADKRSvE7myeNDJspoxq6CqZocjBB7ucYKTqBiacPKBgsyXKv
 qxUqEv+aM48ugJ3C4/p9xNUxEoKeQvvW3QggYpMnrGkQOIS6u3AQY4BFA4dZtm8jgBP5/cjuOc
 zpI=
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="36409538"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2020 05:16:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 7 Dec 2020 05:16:21 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 7 Dec 2020 05:16:15 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH v2 5/8] dt-bindings: add documentation for sama7g5 ethernet
 interface
Date: Mon, 7 Dec 2020 14:15:30 +0200
Message-ID: <1607343333-26552-6-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_071623_754287_AA616C65 
X-CRM114-Status: UNSURE (   9.71  )
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

Add documentation for SAMA7G5 ethernet interface.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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
