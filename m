Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9D3C4361B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 13:04:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA8923B45
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 13:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA8923B45
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=buy60QqZSV5flSOZ/0A2UuE3fc1oC2n4J3mWRM/II/0=; b=eX9FwTRl5FZfQNnebJBHSSGu1
	ruBQaMQoJkJbYSxvCfqySuYC91jVk6I+vRlOXrzUSMfzdrq2UyqQATy0LHd4mFPXUC+sV/38Wq9Cz
	/vsOQc80Vo8lPywh4T0M1/08rLo8FwT1csqVW75SlyPb1nB7UziCqkrVWP30Yg0tIMoapiOmEMnFE
	CphwwOMiCXtyAFrFdzzaoPECTVIcApJnHS9BaNBlyNzyv1VFwo1KTvxZsILrPQnupu0v+toN+IV1W
	osNfo5kb2cbcHp33TnmOuajhz3YGduQE8FbA+d0Xi4+xRJKcLOzmmJ2qXic4ETjnmb2gF+LEUD8qw
	/6ihaRieA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmz8o-0001WI-Ks; Wed, 09 Dec 2020 13:04:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmz8l-0001Un-BQ
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 13:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607519059; x=1639055059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=DUxcKkP9tne2ZEad42EnpND5G9jdrOj1iXVeTt57jG8=;
 b=plQ6IRCORJh1EINI6OCfvScTKSD0Y6YIji+nUl+EX7QxjFSlmkBPU+kj
 bfe9hapDesHLdLmn/0f0vRf1byqcyV3zlzfnkYDp1yzcPs4HIl8XZjrGy
 53Iy0uJVqDRIJ90gk6hah9TqeEOqU0bUf2UlqUAZL0OQMV2mbRxjOBCRL
 lwkQFNjW5rbJNz2sSbIpHSnuCd5LEY9QkAcCeHfaZEVxlCEf2hskhznON
 JTg5/cgSuEZqxC2qx+Bjk0VaZR5Iv5s3fLQ4rRljzjmxWDsmbUhLfprNj
 CpD9x+Ki0g/3ExAs7nZxgcSe4QHocGHe8p9HBVUz5OYmADqwXMP1yVgA+ Q==;
IronPort-SDR: WnhyyC67VAqaMCBDpwz2vNsmDbtjfzkkqnGtk85N3D9h3jDYItoQ7C4Nnupdn/1sNsgHXOc+kL
 +ZhyWyra5UpPa/Q1iDXyyg0beKqDen8eBpbzgHrIYCQ92sFgThhCzmk6bxR5Wyode6wTY7TsSI
 AwxWeIEMBCK2AQq9QpTPJ/5SWq8yun4cV7tOWkm78T9TksbTZPRf0k2Ewy37Q5GjEs4TK4zeEA
 x+mgpY8Hs9oQMUoDITxKmCbfiVzsBvOCEX4PJPeWv5f8It7MbfLzf9POufURyhRXrgd9TNs3XN
 q+k=
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="106862448"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Dec 2020 06:04:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 9 Dec 2020 06:04:16 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 9 Dec 2020 06:04:11 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <natechancellor@gmail.com>, 
 <ndesaulniers@google.com>
Subject: [PATCH v3 5/8] dt-bindings: add documentation for sama7g5 ethernet
 interface
Date: Wed, 9 Dec 2020 15:03:36 +0200
Message-ID: <1607519019-19103-6-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_080419_561292_D1FBA310 
X-CRM114-Status: GOOD (  10.27  )
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
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 yash.shah@sifive.com, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
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
