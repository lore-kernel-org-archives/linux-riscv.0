Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA263C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:58:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E60964F9C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E60964F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rDOsYd80hg1kW7D7IGobBsRgC2QIET2X9X+AVMYW0Ss=; b=bbiSVX1pcXkI2/iV1Kkt+A3oD
	N2WAVO2OXDiFzY/38qWiSbF3Rv841F0m2fb4Mtn9A7a0uKmTg7CwbethvuCNQU0yleNlb9RskX4Ih
	xWViHArc5cWyNbfqfnnjedle652LTO1PeI2kQypPB29AVJgp2+aZ0lojVTHj4q7kBVTQ12V3J24pJ
	jB5vyosFOVI/mQrUi4A5+s1yEY3aDF0HxEAK09MS9butUR15FgWAvI24tsA83DgeKmhMqwgT5+J5r
	KWDRaGQH6IN314uU0ENQrMq9e6rLSXbpqjygyv0V3cTY+LSDJieiQJ+fxhjbdn6TlVPArwfkuEGW4
	Fg5QgkY3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7v4r-0004gO-2M; Fri, 05 Feb 2021 06:58:49 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7v4n-0004dX-CX
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 06:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612508325; x=1644044325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AIY+mENCG0OfDogqN2TK/zkNool8y2CBwzDhCDvMBTc=;
 b=k/wpVFKaiTlmAqrNAINUr/KBO3Jyv6ulUFDEFdZnKMJYJXCYcezZgM1l
 ngmerczA49bQUBOqHp7yQThgBoRFmR05SSNbtuzthoZ/HsGh5439SFGv2
 40XvkHVCNg4xej8726iYi1OOkofiXaXJEFAhMJzvx9hOhU+bqkh+tgjf9
 IuFgcdyrGfk1lmK4CpjhqzYaka0YsJU0AjKnFZzCD+OyTPBiO7X8q710N
 FmWj55FB0Bmk9tnZ5YdM55syQXeMbQb1DrpCtANuznlkHKSweR5ERDqJ/
 9Uhl7QOdGLbmZeKC283SKbLLyyqpM7/eK9e208QzzpfoAN03QAQr13WuG g==;
IronPort-SDR: fsLpsNFy5wEPBqDOlKxDa2HgVvkiZZ73f0ULWJMXxIZiLE1dL7P7Q/KQAGmpzCnDpPL6KEDWcu
 hHAdkqEu4um3gR1uukVzeZCOwtKl3x0jZGh93b4Rh80EknA3ivXbI9U6RqKJn9cj3dnRaZLRUe
 uggxvWwI+RFfg0yvXUrMwazT3QPcqAxgVu68cEfpZlSSaZsiTvALmgn7KnwH4GgJSmZA30tFSD
 yCS5NrYUasmFDbRyHYC79v8X3iK/0/JCmC8Y3xRABpYg4IHLRsYPgM+YHKhgBdDdlzuS7lIyib
 On4=
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; d="scan'208";a="163655829"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 14:58:44 +0800
IronPort-SDR: wsbHsZBGqd+fNbeh6yDLxciSmV/W3ucib0xyct4rVi31TrqUf9apSSqIDOh+daCHlu6hCwqVgx
 OSxDcaF6UbJ7Xf63Xsd7mWcrD/qKVJLr4iVoBIann70xEjC1yr4UIPRPDmp8YFxhBSdV48jLFJ
 m6klVxrvnUfcImAv7rhYcvBRe9ruBs0rR1+UAdFOVkOtNpNZCeTNJ94y5FeEQzFzfLjelqlSP5
 nadnpJxScu22fYJY+V/YAb0w8ZScqhVhM+MQ7ruV1y+wflODhu6Co+pa/dcc3JxBSYn9DZ5fCm
 bY2j/8pOBszGAJTO5GXZrrAl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 22:40:46 -0800
IronPort-SDR: tOK9QR/uLe5qNKojkvaVog4neH3PH42jqSB/wQbbd3JFDU/aZibN9daVNXEpJ6eH4dh/EQtNhz
 szPpe0Qs74J25K/8tGvvIQ0aBBtyCF/pyR3q9ryeUzTTipo8Zz/js4aobQXqO9kNTXcGAS6R+v
 gGQdZmbKzBv+Cmlk8cz/9G/DyJTFuACEZgv2oJzIo0VtAiNDKnKhPwAU6e6GjH7iWJXXChtoL/
 IR9MhpwmBR5720OFQm9ELeAAw285g3lnL+lXYlzk0Qoff4Ii5ywkc3S4g1G0urwzFOvoQX/he0
 SAQ=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Feb 2021 22:58:43 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v16 06/16] dt-bindings: update sifive uart compatible string
Date: Fri,  5 Feb 2021 15:58:17 +0900
Message-Id: <20210205065827.577285-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205065827.577285-1-damien.lemoal@wdc.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_015845_613345_89D5D9BA 
X-CRM114-Status: UNSURE (   9.55  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the compatible string "canaan,k210-uarths" to the sifive uart
bindings to indicate the use of this IP block in the Canaan Kendryte
K210 SoC.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/serial/sifive-serial.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
index 3ac5c7ff2758..5fa94dacbba9 100644
--- a/Documentation/devicetree/bindings/serial/sifive-serial.yaml
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - sifive,fu540-c000-uart
           - sifive,fu740-c000-uart
+          - canaan,k210-uarths
       - const: sifive,uart0
 
     description:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
