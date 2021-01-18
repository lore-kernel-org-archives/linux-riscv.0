Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A742C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BC51224DF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BC51224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J53FULrU3J7sXFfKCPL3sTr0LCdrTJz2F5ww6ROOsbc=; b=Oy5E7kbRyAVAiJEcgyJluy++K
	D4+s+NqGjH01q0gvAFL0A27ZqZNqsc6xHeLUnxx5M/9cnMteVvz5vQXShh6mv0MlOZ1UKMttxwyNY
	v/sxcjJ6wUfLFfDttgscpyuRo123HRCgNXz5QYzsjiik7rqllYnterFIoC/3/E9f6/+km4AXrZHW2
	GgwsS1J1UouTLapEfszT4EDiHCPBJ/0MNmx6Q4lXs/FgDuQNWc18ZUlLNTeOGxYwAfOWmfoRZo2tY
	6OcvptklLSf6gjCiSnIGcxhWPKG7FAbBQMiXYp/6gH49Y/jKjdDwY51d2pfJ5i8G4oqWLjoZdOqAs
	sriTLYKGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Jso-0003Zv-U7; Mon, 18 Jan 2021 02:03:06 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Jsm-0003Yc-AS
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 02:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610935383; x=1642471383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0gydr514UdHfaLZyMWZlPzEDnEe7NJxvNWRTRtcTWlQ=;
 b=dU1eKCwHhl/+Q1ZbDlsvWrL56vdHBk333q9NVybi2DxaMLPoT6681K1h
 7HWbMqRu3tfvQuKrWTbDqiTZtYihqbszZrtOfdgbIQP4xD6v6A/kWfjGL
 AKK3UVZ77WOOONAhlBq4XcXD82bzSoqalL24UjA5EtVSyRLUdYw7dYloN
 v0UcwJ6oHl9U3wyBmDq2CMEntxSLljCGQE10x1Ln3d1EMhIb8ezidvH/y
 hbIA7cbeFiw25izEsFYI/CL6OScrtBIG4Q320iZcCJ9Z//W1fpHxqqAS7
 dVHB9nbOKIqZELkPy/GRxJmk1OhdieVw2c3a97+OLANHIjwJCc875esDS g==;
IronPort-SDR: Z1+MK0s8squzFfz27DTRlfCI1oGkP6ICzbWqQpBpOl8dA6mRBkPY3LOWi6neEIxsbcst4Tqw91
 Yz8a+wqZeUhWKGUboOcbUe2UwVC+obrGdmyr52fjK2reCHlYd+vjLM3R130PYDrP/+zAChx6qR
 Ot0p119rhRcH8mHf+QWuzdKiNAbQ6r/GK8EL/INoCTFz46XnWzT7VhC4X120hsLX0IHiaB7mo1
 MYE9L6ZnqagSxFU55EEXX6ijC7KbKAXEdB2kE+agJmgxf5FdJEql3AO5F9QZtqgwG2O3exXYW+
 TMs=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="267979893"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 10:03:03 +0800
IronPort-SDR: SztiWc9fA5iwoEdF1YrVp6ZffAG1OBKgwoH0kLc1GZldQUuR7GRLPx+eX+ONrVFzeqEtvyLPDl
 UCnCOz7yPb02L2eSgsfquKEWJ0tQ3ojuWO+HyB5tx4I7vJy1aWcDfDyaf9FB5RrYnQB5/LtrTZ
 00kUPIGCiMvWFZqOOPgp/+/2hwzaCo2tgUD83o8JbUkFmS4yRqtT5b4NbepmW6XH/upaoi6lYL
 W3db4pIgBLTYkf0V5HQhK7RRV3Xg1KkWBnTJd7pie27057CYBrbCB9PuH6V6SVKchs6oimTSLJ
 sAsBvm5RofOLo5xHSNFQGybB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 17:45:40 -0800
IronPort-SDR: ppN5KI0KQdC3mGewT3XHqaxtTQ9UjFrZe3c8k4kBhLPXO2RbJ2mDjoafqK1n/Q+Jh0hNZKoei3
 z2OK+emUUm+fdHL/8pmmyKuMZTaWUGQZ8X2n/Du/dc8cI/wdshFjBtcAOMN+q9RalNMLTOmI4e
 zX8BlcPFVq4AuQuwqP4ES1i6DLIyVQE7My6B6wExOGiAp40ABrTo//q3BeKyKP/PishQKWN0oc
 iZeJcUQ1412+1C4y2AKK5WJfOvW1wSrBCuqSJZ2PoypostktPuHK5UJSjGlB9DM51oFViSscHo
 6+M=
WDCIronportException: Internal
Received: from cnf011319.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.208])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2021 18:03:03 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 04/17] dt-bindings: update risc-v cpu properties
Date: Mon, 18 Jan 2021 11:02:31 +0900
Message-Id: <20210118020244.103451-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118020244.103451-1-damien.lemoal@wdc.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_210304_519275_861956AF 
X-CRM114-Status: GOOD (  11.46  )
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

The Canaan Kendryte K210 SoC CPU cores are based on a rocket chip
version using a draft verion of the RISC-V ISA specifications. To avoid
any confusion with CPU cores using stable specifications, add the
compatible string "canaan,k210" for this SoC CPU cores.

Also add the "riscv,none" value to the mmu-type property to allow a DT
to indicate that the CPU being described does not have an MMU or that
it has an MMU that is not usable (which is the case for the K210 SoC).

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index eb6843f69f7c..e534f6a7cfa1 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -39,6 +39,7 @@ properties:
               - sifive,u74
               - sifive,u5
               - sifive,u7
+              - canaan,k210
           - const: riscv
       - const: riscv    # Simulator only
     description:
@@ -56,6 +57,7 @@ properties:
       - riscv,sv32
       - riscv,sv39
       - riscv,sv48
+      - riscv,none
 
   riscv,isa:
     description:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
