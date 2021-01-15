Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AECC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 731A323884
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 731A323884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OMB4pacTeTCOejMjzlCjjykjqQjcG3+ef87hKckyHAc=; b=b21upnVWK80rA+QGC3tMJYks1
	nelgafKmkipBJ6ihIxotsaOGuJDNtmEuE8RIu8NehyWp62i7PnUADG6wdp82f1dU2aJi4TOVNXBiT
	HW9scVR7uqXJ8AZT7qd9pe4iYRwNGAxox7zByRqhAAopQMBqdrHRNnMu+pKcswiaDCePr7J/55Cum
	FogNdwva6nGti1t9cunqalrI9TMj1/dOlvdu4ukPzoJV/byntrjA6iAtIKu413aeGFm63hCO2Pr6s
	n13BRCc8OuYwDpdADn3vzKbNnWCIxd8HDjUxMqQI8P7od+rJVNg1kXFp0Kvkd1od382GrmPo6vrYZ
	h2bxVF35w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Pic-0002u1-6m; Fri, 15 Jan 2021 14:04:50 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0PiU-0002pm-Dv
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 14:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610719482; x=1642255482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K+bmNnrAw2Khp85jJkbS/ratLTdwTztUszUl7HF20jU=;
 b=Pv5a3eW/285wEaSXpl3pJ9jMkvyP355CMKNZqzTJpJ3Gv82VcUONxi/B
 GMU9ReAb4F0LGOqpaGe3o/Jjb3HGa6h8sgGcLXQ5OI0nYKcfsqcx2KeF7
 J6DrUJzLdNfo7TaMtLSrviHNT5bGs3WzAY+JHMiOPK7X2EYqLzzMELZRz
 z+lf+m75gqfUwaX5ZoL3qxgUs8LRJGVjRjZQ0Qzp1F7dOurZzP5jAfeV4
 EZxDcPwAamDhyw0Y6XsCYpvPG+gp2gR7gDCxtltGNRw+cxvczgEYBtxk3
 6MqREnESm3MRhguxZYDdIGwjn3oOk6fMQjAWUSbj0VPhsEhuA4I1Q3NY/ Q==;
IronPort-SDR: riyik1uX8Ng3U2MYkjwsJp8S5crlqroibnUM629zxGK824G4yNruF7ImsQ9YxTP2ZYn0DqZAYC
 BhaLNyXQS2Lk77F2Yw/UqCl9Fc6WpE+rSoI8bH11kQwNnkR8ZkPgvEKdH1Xb2uuX0vJE4By/rh
 rtY4GwzESP0aqrgzwqU0EezLydb2Ufz9KqTmX9lUUwcM0/He6y3NIs4q/QnWUWGZyQRIpIQpZl
 uwsrgnZThH8Qd+GgHU99jZam3QG2UVYI71rvpsngHIUU/pgAogufmNGH0xBUbBqU8+se+znqe9
 yV0=
X-IronPort-AV: E=Sophos;i="5.79,349,1602518400"; d="scan'208";a="161955749"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 22:04:40 +0800
IronPort-SDR: Iaz7qTaBubInNi2OlPHjCllyWKqkFAVLoz/sVWmotXze8ULoDvORN6BabWKQWeYhtinsRQBgQn
 s27eH8ei6K7u/T8hl8TZSwTZo9zxwi5hgs2HNEgLdOfmrKlT5bNGsVbxV2Cb5SELZzM2dCCHoc
 is2L2CCPlsGZFyEPt8RFFEq/VlUKfMUTPnNiipTyLcTM4D0SnKpFB6u2vvLaM5ZhGwPBSvHhtw
 HenSwk0v+4JFJkvQkD5QnEhWyH5F/u40h9xLVx0i+Gltc7LtDgPdtKHk2dZQjANHubrNAxDwO/
 MHHs2GEwMCIITq16IZCXLza3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 05:49:22 -0800
IronPort-SDR: BBA2VcmEWsXlQGi2G4NSddqbZF5tHke3YMHFJ131VaRTqpawQJGx4pyDxMuz9Xtf1hRTijUTgI
 UmCMbZVYS7TZzeHLQjKJEXMSorfFMb3VlGDuyQUCusCChl4Fn7h+J6KxJUBLPk4GkstJSrJ2G8
 JBgyux0UveduYzMCuLHts96kSDS2A2tKo62x2XZ6EX9ZwBTjp6FLz0sw7j42puJgwF6WgVTeA9
 asBRj1yxtA7moHzc6MDrGKhkOxR03BpZTBv/lvrUpzJgJUiqyp2PgMv6QurNu5Y8RkxxKr0ioP
 yNU=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.177])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jan 2021 06:04:40 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 03/17] dt-bindings: fix sifive plic compatible string
Date: Fri, 15 Jan 2021 23:03:38 +0900
Message-Id: <20210115140352.146941-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140352.146941-1-damien.lemoal@wdc.com>
References: <20210115140352.146941-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_090442_688362_2D50A1B3 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Allow the compatible string of a Sifive plic node to specify only
"sifive,plic-1.0.0" without an additional required string specifying
the SoC implementing the IP block. With this change, the plic node of
RISC-V SoCs using a generic implementation of the plic without any SoC
specific tweak can be correctly defined.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../interrupt-controller/sifive,plic-1.0.0.yaml        | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index b9a61c9f7530..167418a0021a 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -41,9 +41,13 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: sifive,fu540-c000-plic
-      - const: sifive,plic-1.0.0
+    oneOf:
+      - items:
+          - const: sifive,fu540-c000-plic
+          - const: sifive,plic-1.0.0
+
+      - items:
+          - const: sifive,plic-1.0.0
 
   reg:
     maxItems: 1
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
