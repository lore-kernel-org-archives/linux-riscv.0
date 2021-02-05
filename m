Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D7CC433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:58:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88C4064F9D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88C4064F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WO7wQIrNFttop5jUmSVTSAqAAipztRNUM88iSpFf2mA=; b=KiRBmxFLd27MjMkHLY8r9gRSM
	gxF8J9pcsh35c3BIB/nXQ7gJENOTnweowqdFg9RUM1ID8oyY+Q04nvQ+UsFDlI+gu6iaC+/5uLaQ6
	gVFbim6d86NoZ25ALAFgIdtEV7iqNCVXo56Bd6CIp6JOn8sQd6YgX0M4p44wklNj6qvbJAq4GDVyd
	V3xc+hEspDf9l0Ka3zwM1cMzTDBQazbF74VdNCwo/0yKtf5VSceAZdJc5kLA9D8pOaiCzmmKbT5Lv
	HkERla7ldlMHnQU/F7bI4schCUBPgzho7inDQySbTDRKnJo5fdjVkcJ0xa6moA45G57CnJq+RyY2l
	Ly20scY5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7v4o-0004ea-6t; Fri, 05 Feb 2021 06:58:46 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7v4l-0004cB-58
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 06:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612508323; x=1644044323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=imuithzWrTjkRyQr5q8L7wvXZ0KquIdBdqaL9xNxgNE=;
 b=WcH2zFKed9TceOwQxNUjF/05/aoWkFO03zSDMslBngdQ4MiFGIhmd1mX
 KG7LCQpJhMB0oijrSTeo2OsS/qMyJzzjYPn0Rjz0PhuIxH2F65wz7qld8
 uoCSBRQaOsM9C+Rxgc/TnWQWrGH1+Ii/duTw7K5wdIwnL1enzvk2OmVhQ
 Dr8AZQFR+m1qx8jQnx5V3XCCk4PzJNEdQ2EiPN8T5uyFhEkoK/X2T9tBR
 Y+80VXqYyTV8XzpB5r+uYOwk2DBhhE96yfgA6vguDifPAe12PSr5zCs+K
 Pr7rfabfaCB44+dJCcNov0r9L8Bdp+HGkBGmOgHeE+jPqI78cQJLsxunQ w==;
IronPort-SDR: TFJ/GAx5YI4JsjLQ9/VgjP0VETDcQx1s55jlyZJIsGTKHgvYf8VUdDJCroqb6tTYLhiCS81p8T
 TNjEJN68FP8fdHS1t2h+AdJYvK9wT+pjs1dY5NH7wUP5U0wQwpIbybIfzhUGzzfD1Dp1GlQNgR
 j4W24rD/zo0B0blfoU7bboV7b9f69AP56F44jZV7dlCJWXkJlUQWKjP5eWqurxsoWxYO+4pnQA
 0hoz6eZA9qGm51jETCJyd6Xh6z5z8GkzUFl2CFGK7Jk3rMd4vlWoyGEeyREtaFEmGqHJcN9xH8
 yxg=
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; d="scan'208";a="163655826"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 14:58:42 +0800
IronPort-SDR: lE8t9f168A9qRMS0o5paa0DG1maaszQpmMhUZefJcbDjE6sZy9T5IJ48iyDkxS6xVIS0TaDHk5
 VUXDeLfMx8FRJkFs7MSY5vWF7SRH8rP5dCxMPgf2l8wpxJBpwQe66uTF37ebIQ7iWq3++IptVL
 eo04X95Djge0jz6W4NID3zqCm2WPUNDz5C3Z9RROCsFEyPt9843F6VyQui9eNw9U5qkMEQronJ
 lsd6bPwsOjAXDoBl9zZjdsPWqIlPxQ1na1nZRfVSaRDEm2p0hneLslXfGDYvBGkwqhlEE2fNZq
 XdylhM6xCXsEtH7B5iEeoV6J
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 22:40:45 -0800
IronPort-SDR: Tat3o1D+8NTnysAH4mEzdLZmm1E8pUTJaWA/jM+PjrGV7w8+z7NX3KMocs4nNRacKJrhK4zxUs
 Fv1H6T7YLLe1/3r++Ez4VZIgY0LRvm94Mh+xpbhB0CeFLBhUhgFZ/1Rowp5SdDNlz21RpHWgNI
 P7yjJUiXqKp0fpTDPCqQymuPX2c0/qQGEN8p1AhD3EN1XRaBLUmM/EnWEpeGXNNOAWegCvt3bF
 LKkYXqjwib+w6KnS/FXDrwCFwxMw4r9bVmhH4JNFJjg1vsiEU/uJcbz/0TOlwBj5XGQoS3zE+Q
 ElE=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Feb 2021 22:58:41 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v16 05/16] dt-bindings: update sifive clint compatible string
Date: Fri,  5 Feb 2021 15:58:16 +0900
Message-Id: <20210205065827.577285-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205065827.577285-1-damien.lemoal@wdc.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_015843_342864_1001B0C7 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: Atish Patra <atish.patra@wdc.com>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the "canaan,k210-clint" compatible string to the Sifive clint
bindings to indicate the use of the "sifive,clint0" IP block in the
Canaan Kendryte K210 SoC. The description of the compatible string
property is also updated to reflect this addition.

Cc: Anup Patel <anup.patel@wdc.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../devicetree/bindings/timer/sifive,clint.yaml      | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 2a0e9cd9fbcf..a35952f48742 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -23,15 +23,19 @@ description:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-clint
+      - enum:
+          - sifive,fu540-c000-clint
+          - canaan,k210-clint
       - const: sifive,clint0
 
     description:
-      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
+      Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
       Supported compatible strings are -
       "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
-      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
-      CLINT v0 IP block with no chip integration tweaks.
+      onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
+      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
+      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
+      integration tweaks.
       Please refer to sifive-blocks-ip-versioning.txt for details
 
   reg:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
