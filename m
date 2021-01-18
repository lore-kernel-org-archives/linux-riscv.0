Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE63C43381
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46BFB2251F
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46BFB2251F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZxRok35mNF5LwnJZ2Lw5JvoHw7vnfSENFi7Uv+YB8Mg=; b=CvIfZ+KfZ2tkxMXaf7baeLSIM
	U6xXF4v+Dt7O0TZAva6TzxTC9S0Ia6Qs96dTbcglDlKbD311y7Btkioa8e4J6l0ejUnKrB5exRxX1
	u8Ode1CxssEmkmCd7LBMWiYMnjpC2f84JGbh934V+VrvHKlpFabU+U3tQwpeiSp4sEspxHXi9S8tG
	pozJ/DkP5TuHCswzfLqp4mPxhQTjhhC8/ipAqPmlpq1VE8+CTIqIFT2ojHvZRQdpv+ie6xmTiITBI
	e5/RxxU2LCeAC/05PnHxfjOsdYn7EWfy2v3JSBxnqXJ6lm54RqNK0BvHnPOj3c930lymGjIdtioOo
	BzTpIoMnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Jss-0003bI-DF; Mon, 18 Jan 2021 02:03:10 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Jsq-0003Yc-5D
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 02:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610935387; x=1642471387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PieD+HEsZTf13C6UeofD+u83C3BRDKwXIiv/iI9JJO8=;
 b=NLPHK6XQGbh+ldi9QNFB0BZokZpdUogANUpDVy+SOjae6J1w7E5e3Ssk
 Q27Kuk0/OKiYI5dwvDlvz99lnVM70bykD7dTHnyadnB9BNdh8waK+S41n
 99ISRn1jw1Z5UNH4edWtBn4MiL+kMwZ6ud4JAbe5oOlO1wtnr+Xmyiskz
 UZlksiiy2RlPcFnKEZKkn1bX+uU4vwSfXoT5h3guOgdLDtdpYwTu242Em
 LGWU4Moo/x4Mrl+h6XBvOlVGjPUhrfD2WGU2AaOOnYwnpTzAJKA5M22MD
 gVhVCmfGpw1GQST9hkv5MndJme8lIEO0l9XwVafTU4FBztD99xpWfp1pE Q==;
IronPort-SDR: SpYmy4FMmPGPXucCsGVggQKNyacZ3MIdjBqguAcMhMjhqQpoRe99VNGH6/XEKI90txb5D4ByUO
 O19RZiH7+7a/B5tKD0s1saV8pzwuxpRexnf2VoQRvhAnTydQ25hmPPZcAy8f+LmBslLF2YOuwg
 d4MnE32Fbrl4wjArzxx0iB6DTK6HOmOzATZC6b0Ny1I6ZaSpiEcJ8eJbqipj8zJJToBZrtWu7j
 kn/ENFdqb18kjmQolDGLZjXH8VSspo2bfKWz0vU9czESem9/31WI6i0X34xnek6J3hOUJN+EUg
 aoc=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="267979901"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 10:03:07 +0800
IronPort-SDR: TXXVS5iAmkS+B9+A5SlDPOuuoikUKbeAsx9MRkD9y91Ls0nQHh5cHo+lkd+zvyujt2RM79la8a
 KJ/M+jk/bL9Bin3AV/VAaLF5SoFIA8Pk/hxskvnTBTYlXXKTcNd8mjifz01mpohxKH6E0X/8up
 nL6qIUaW898WCvVJ0ZlrGvCtr5Q0KXpMaUfB4P+GWQoK+tS5hEyIOeTkvZqK40TSV1LJiZHAmq
 dbttDu6z3CgzONUgivhxpcrtckD/suXcQ9t68O9SHQL/3EJWYVsrUDkdXHPXAv94zj/B3xAKh8
 9cJ24XJLIVo//dwd6wf0nBMr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 17:45:44 -0800
IronPort-SDR: +eewbUvStbtrd8VXQzuiJPmiWKzWwEw52/p1fgyMiGX5Ftfm5zNefsSgZQd27X//NLaHmeGQ1p
 Z6410CvTIOqoKBLWCT6EvptSZw2sL8SgsuLUCfu4LdVh0kmWmn0K2h1oFnkNZpfA7wAY0/qTbt
 gXNQFu/e/t8rQ5V/pRT8VLdkdRLXiPlZ64BWLc/5gz41sTbr2A31ttb6lYd8wqKI8FdJ5DJD7r
 N0OsCBUDgqsOqkDqYQvDTNygC9a46IzIfgc4B6at90E5L9l0MwKCeeR8lj6yh6sQNntNabDJjD
 YlI=
WDCIronportException: Internal
Received: from cnf011319.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.208])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2021 18:03:07 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 06/17] dt-bindings: update sifive clint compatible string
Date: Mon, 18 Jan 2021 11:02:33 +0900
Message-Id: <20210118020244.103451-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118020244.103451-1-damien.lemoal@wdc.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_210308_416799_67D3E36F 
X-CRM114-Status: UNSURE (   8.70  )
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
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>
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
 .../bindings/timer/sifive,clint.yaml          | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 2a0e9cd9fbcf..1a7d582a208f 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -22,16 +22,23 @@ description:
 
 properties:
   compatible:
-    items:
-      - const: sifive,fu540-c000-clint
-      - const: sifive,clint0
+    oneOf:
+      - items:
+          - const: sifive,fu540-c000-clint
+          - const: sifive,clint0
+
+      - items:
+          - const: canaan,k210-clint
+          - const: sifive,clint0
 
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
