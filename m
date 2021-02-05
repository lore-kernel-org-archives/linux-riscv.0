Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C45C433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:58:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4192B64F9E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4192B64F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lLMs32d68MF6RDJTXQpcVshrD7If0kGiWy+gwIRC2sg=; b=BAhJies0I/eZxKPp/y8bDJqcr
	zL1J2MFHTdERk3zmBwFtmny5Bf7l1D+G6OplEbAZUlrqWjPTW28e64umSc2X9+o0e/yncJ6GvqLgl
	8Hg+QrwfxTFM+ZTj6zt9Ap7wamjL97Y5+jK3SXjCiukGNEFEQz9DPE+qqAdqhVAd2eD2+jmIp3gvi
	rlMqJkXyUJjhN5uEBDH9iMXBY6j067ABgdqdFvvAQpvIkKd1jZPX5ZyP9Hxo4OKdOCk7hgEWle+OD
	O9fRblDlakaYTAJnOfKJGPJy5EsyPHt7omYW+BYjoDYClckQZ5izdnhOZb4mjPt5+oc/Y7VLr8U8y
	HhC5wXeXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7v4m-0004dV-Gb; Fri, 05 Feb 2021 06:58:44 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7v4j-0004cB-OG
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 06:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612508321; x=1644044321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eotfzN0WvUvzgiZvKqxmdTfBb2NiGvb8zj9iv/Vd+cE=;
 b=nYeLTbbPNH63rA8rYWm/5SErx0c9SnoPrmF730c0n9+59H8lIZTCHaBT
 McHnoFoWXQBJoocqK2oR3Z+XsIHEwXVgonRiioXWzBQedTCRIeL+uGS/q
 y0+CfFEYzYcY3W3Bd9TWxFG8eaZIsgd8jxdRlWyaO2cn0ojBDidJjkggH
 fVHhARWxu5/WoBSh0uGnL8s9lbHUIZgyv/j7qmqldjwUkfGCdH0/jMlWW
 v++YPUwyvU86pSpSUA0BDeazZxzgLWdbPp1AsIRbeFGOYa8ZTLNxvvYRt
 xeHvSKmTXXw/7rMen/pFAGmWcmBfMYQGV+nh3whXSouB24lex+nx+tWph w==;
IronPort-SDR: 0DRlH6xUeBlBj4FECxbNcOdtHTYsWvK/YhoUT0O5GtJE2oZgJY8m5sEnPIioyMo/3rJ2GoTgi/
 VHULjCJ/CgOE9Ig+rmJoPYC2iywG1MK9f1pXRkx1LN0ihfDjoL2HpzkMbXKvQjXaop3NsdbWxy
 08+R5PB9cgw3XaWuhaHQaTlPIPeNLcXpXlLZ49wKZoz/85SFhR1Saz1p6xwnEeMdM8trg0lTHW
 5jihalGyF5K77+/jRn1+feRYjVxgM/grBRD6/Gn1HOpDpyBTvJWDXolAR4vV35d1Bic+tTYecn
 iKs=
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; d="scan'208";a="163655823"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 14:58:40 +0800
IronPort-SDR: BWoHwSqsQ0pKOCa+6HM1TTsfO+4bEDvLxHUjCCTtQE8KzcgUDqmIbftbIZ1QGQkQ8ERBDS+RB3
 SRhryc5JpwDc5WK/tWfOpUsWWQzF6cqZC6QLKFnBsjDfKmjxzyh/hkz4UdwHKQ4J0UjUix2RV9
 EX1Uftgl4UwWu2+qOE9TTcTxTnbxHApOLBLAJPdEJBS6ShRDM/fhluXJxx8dilcH4cC3fvLkNs
 KmNZGOgbtk/KLFP04hiPt4dojvWe+qcWwckVkAWkmNU+fnGHlAB2jm4rBUTYPQzzW1F/IoZ1jC
 5g9vEamctVGlNRbURSW3F3Vw
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 22:40:43 -0800
IronPort-SDR: iJ+L7v+b7LFPg0PEyuN4SUktS3jBZZhei5E+pgDp2ioB3BVLigE9WyJXbZOD6E6N6MHfapDQMh
 0mxnrZxzGpHUQHVTJLPz1X4Xcws1JBWnf5pOCaKwO7pUusjJx0ZoGj46R7V39Z9PTp7yuVMKf7
 T43x2YaDTPfWw+sHME4jo0s47pajivgnn+AZrM6ou/a7pt2EHJ3AWwj0Nf3yDCMR54q5o5uZ9f
 eUBE7nMqH6dRbqMlSZYZZbFipILcO772b3ETozLnnKk4C5+FC7wtDFPLGnGABJX8acsg3WpPqL
 5xk=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Feb 2021 22:58:39 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v16 04/16] dt-bindings: update sifive plic compatible string
Date: Fri,  5 Feb 2021 15:58:15 +0900
Message-Id: <20210205065827.577285-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205065827.577285-1-damien.lemoal@wdc.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_015841_966148_97D67BC1 
X-CRM114-Status: GOOD (  10.45  )
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

Add the compatible string "canaan,k210-plic" to the Sifive plic bindings
to indicate the use of the "sifive,plic-1.0.0" IP block in the Canaan
Kendryte K210 SoC. The description is also updated to reflect this
change, that is, that SoCs from other vendors may also use this plic
implementation.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../interrupt-controller/sifive,plic-1.0.0.yaml     | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index b9a61c9f7530..08d5a57ce00f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -8,10 +8,11 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: SiFive Platform-Level Interrupt Controller (PLIC)
 
 description:
-  SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
-  (PLIC) high-level specification in the RISC-V Privileged Architecture
-  specification. The PLIC connects all external interrupts in the system to all
-  hart contexts in the system, via the external interrupt source in each hart.
+  SiFive SoCs and other RISC-V SoCs include an implementation of the
+  Platform-Level Interrupt Controller (PLIC) high-level specification in
+  the RISC-V Privileged Architecture specification. The PLIC connects all
+  external interrupts in the system to all hart contexts in the system, via
+  the external interrupt source in each hart.
 
   A hart context is a privilege mode in a hardware execution thread. For example,
   in an 4 core system with 2-way SMT, you have 8 harts and probably at least two
@@ -42,7 +43,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-plic
+      - enum:
+          - sifive,fu540-c000-plic
+          - canaan,k210-plic
       - const: sifive,plic-1.0.0
 
   reg:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
