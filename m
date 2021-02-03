Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE9DC433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E98D64D9D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E98D64D9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2uN0afD67F6WjcapZsa7VbVByqIK85VwFWnFs8wJ9io=; b=YcdYR9LhbRP8djTguxDDXNw1O
	kkCjDqzyd6+PQEgj5bqcXtAPhtSYwF0ljKQw4PjxGLAIMs/w1GtwMug0Gqy7IeqHthP+w4yoZbE24
	t/A99K1029m3n/DP4+j+0LIi6aFc3xBo2yrcz/JSM1PsV83u0BRmRCprwaZb/r4vr9+TGM9OYJ6QB
	RTJq20lJsVYvejFNJbVBGE/41/orIDCzfro3cKqIbNjO3jvqTliUiZTg4CnF7WwRFnIi5AOGxadXW
	B500JUJnoNeuEOo++4FfYXmnhk+sj9CQteSES9/ddwRaJlNje2F2LlBlMc3IqvaO5JndRbB/okfPo
	SOIn4Z4xQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Hl8-0005qh-Pe; Wed, 03 Feb 2021 12:59:50 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Hl4-0005nX-RE
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 12:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612357187; x=1643893187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UMFQIdrYtQi54YrRachcvZozXVK7+0hIHPjfiw4r9KA=;
 b=O0K7nkRWTkgwHaw2s4eBezf7zIMZp3cud3qKOAWQvBE8U9g4AROAc8+O
 Zrv6WCvdOE/Im2P5Q4z1IUs5wqACj20FjImY9pP2M1YwlIViSjh/h3hhk
 JW4dMfa2RSB6zFI7w6fMT3aTV39yqXP2s8+uSTTg+WcKOdP4h48leh0PE
 LG3XcGoJYXpms1iwebE3BKMQTzKGEQ3UP9pkEO6bKW1bCzW5JuBiyOkNR
 rssR85HBOqczcF5QXvPlDJQFKx6b8OTclHsKV2tKccT7whFi9+r/Lcues
 hl4HlnzTncNu+/qLGjxBk2Qzx4lI1KNEAjn1LyAfCmTW4l+Vy+5d9GPWp A==;
IronPort-SDR: DcRu8ddTtr3DREtAntw5nXS5svUm/oxL7p0ujJLicpTxb8K08PpwHYZ1p4W/shLEB582Wo5NgA
 QOnHJ+QbRMbqYq9+Zz+SXqhfg46K8X1SaghtUbimHhYY7ms7nsauDHiMQFUZkKJmKmpfE0JlFN
 fdIqsXiuwe2ZO43N3/v02scBKrTbOjmIEXHHjoMAkOLK/EysdnS0sEY0EOk3Or0R50YvU0+dzx
 La+qDcAH7pXkYPhcARzGz3pbMn6wzcItLOA2Cu+Ivow3LlpmgDe3eByUESM9RDQjXbgyK44L1+
 B0Y=
X-IronPort-AV: E=Sophos;i="5.79,398,1602518400"; d="scan'208";a="160202877"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Feb 2021 20:59:47 +0800
IronPort-SDR: u0TsXkcLCRI+ARrATZIUQJO18nB4kv/IAOJqIEPs9H3IZXSgVZIklNsYAl0YDKds6NmgB1E44p
 qpiYSEEHditWeb+jArd+dP51zGAeXtzzTf1VbYeLVS6sRXM3YZQvuA1Zq1U0ZgyVZJEVmOI09X
 VwE9++uO5TXBNS6/yR52s7gwW2WpKHgYlTSCccBQTzjr5YdfzsjrGlLvA3Ji5HhMN98VkxRgBp
 9/kkAp+4ARia7EKrXr5oQf7CMnjDaoYrwqzE52P/8DH1C9TRQNxxrc2Gcza96sgO34vtN1SX3n
 SVKm0eOH3/olpriwOoYVf80o
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 04:43:47 -0800
IronPort-SDR: uS+ApnV/oVN8lTTMdgOlZM7R+TZgaXPNPOscRJQDIQEsvj8bNQnC4ImXoAKM7iv6m1Ejc51+r+
 LEbDL2vb5aFi6Q7HzmPw+SA0NbqugG6yKNHBnoAsHFGZaqPANrj22rQTyculkJalvu+5pCOFZ5
 fKBngu4lZsbYtNkT33SW7lMCEQs9pntOqk4pE/yq5rstk33a/w2pt2G4glqFYxYDHoyqqL6srf
 6+KAoO2iG3Vb1SEHrzCYRLi+iI0/DpCuboLr8Lvw5RV7+Gpue5agd9CMTx9jYXZd0YhaFXQfJu
 6h8=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Feb 2021 04:59:45 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v15 04/16] dt-bindings: update sifive plic compatible string
Date: Wed,  3 Feb 2021 21:59:01 +0900
Message-Id: <20210203125913.390949-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203125913.390949-1-damien.lemoal@wdc.com>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_075947_069131_7CAB8ABF 
X-CRM114-Status: GOOD (  12.11  )
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
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 .../sifive,plic-1.0.0.yaml                    | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index b9a61c9f7530..04ed7a03c97e 100644
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
@@ -41,9 +42,14 @@ maintainers:
 
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
+          - const: canaan,k210-plic
+          - const: sifive,plic-1.0.0
 
   reg:
     maxItems: 1
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
