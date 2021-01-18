Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84108C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16AAC2250E
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16AAC2250E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9cXAFhuKOoo11ADvsC9d9nwIgl4UaX7UcOF3CQfnGmg=; b=M+bezT/advBbfhXr2tY7/o/c/
	JhvFjpZfkKphSCY0XUWukauv40Os/UTPLNJ+yQRG78z4V2kCdXUZ8HV+odkJzSjRtFy05Ns32H8eY
	XfaFFmojBclWqUNMgkZBTyQy7xsRfkZ1d+xm/aJGeU208t0Fp+Huh1olkYk5LCLfQjRIGmYVhvX2Y
	y3veXGf1/BqTA13UNXqBvd5TlXDV4WBCzD0PmzdS5vxwnTII8068w8o14GCXQuXXBkwmgSgGXodia
	tdYTehcZmLg7HYkwL79wVUTIVYMA028l9IHbaSXm19t/WYPbWWRH8d5CwGguf0EgRZ1M2SbL9veoK
	tTuyo5mGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Jsq-0003ak-Ja; Mon, 18 Jan 2021 02:03:08 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Jsn-0003Yc-TF
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 02:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610935385; x=1642471385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NrWUahIqENHSFdK2RKLLrmHQ2RErkyo5KHGTMfijdUo=;
 b=j/cO3AN/c0XhJv4oogbFixpaJMGyetzQEpjQKjFqCtWMjbyojeaica5s
 v3aDanwHKhr9uZF7/ksbkOoZwtC47dPr51OB3PPtxLlL+JLXlfjKcfpNQ
 onrJuy7Y7LP1NRlebNvfqYBkDfEudEFc+vdpDkAjUU5WDlV8iDVil4blp
 oPOkw+n9OMs0scf6+P44+cteB2kMYKcZ3cXfRRF0/PlS4+tXpXysARjyB
 t1GyhN4vFRgsBPvmi2N4xxBdRqPFxpsC0F+edNZbexVUFgSSI2gS1DiKF
 rwtMaO/2A5boEevvQZ3hdiy2wZckmSRFI9PqJHbPMKr2VqwHYSjKfftfU Q==;
IronPort-SDR: Cy0gE/SK0zn9Yl0yoNR5qzWYrt/zyXmsEQQLDIIjWAgw/kAXpViDIKLoUv91l2crUCamzIUgZD
 dqlC2tar0RZQFCVdmZjc+6OY8NPAkhGHMUnGXAzNlO3zajssLXsFt8nUXc2TDuoZ33ROx648eg
 aNTP4RaUHTvYYrOqrJ/qhFrJBIRta8QY43ejFP3PE77PBPS/Fjkd8j5dmJKhJzUfrhAzIfyxZd
 k1tF1DWPeGY+uCY1iIQGrKtHdbUWwfOvDFSea+zUbTc4dr7w7LpgAjbeEkr1dabhQu2zZy2pOb
 y68=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="267979895"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 10:03:05 +0800
IronPort-SDR: xM3vytjXbyF60JvO8BCG62s8cYWjanP9qMDjryebXnbn8yD1Dde/CqpMt+ds6vWThKB6YieEhr
 PnMLMB9teRKLcKMxcBFc2LjtmUSteX0D8HOOt49JQehr6yMUny1FouUNq5GtwoJeziYaSZqOGZ
 eTuj6IIOdzAzBdlPhsMTT8ByOCF5O3ClG+knBYDVPA1skcRNg25ygwXhhYa/BsR9AtDNdLzNPS
 6HVpD72w7BySYTvbpX4b2PwvXyzB8wCcE26iaO4ST4Gi8YpTWdlUFtn5h+6Lsi19aT4B9/P0pN
 lU2zqbkqIgKOzAkGwvzQ3VLO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 17:45:42 -0800
IronPort-SDR: ZNZ4rHBX0qI+Fsgead47p1q+2c+soqv/N+kwIHlIPxgOl55R9tSz4jjC1OEoV4Q36B0Zw7vMKV
 5XY5En1Trl8IehEugWK88yYL0vE60pzWVZ1HWkfbQfg+F0cqqAkDtPvszTtQRNMo7lq6apl16P
 3b+dsjMytw/oC0sXZJdypq3MudMZTS6zKrppcpRH0YydKP3H3vy6w9DzKhQGFmTJso4YG59DwF
 pZ7y8+FbX3/OzuEKn3Cvrj4/nZgXnm+ayUhLCeiL/ArS9e7o/G7cnQM/PuyAEmaJ1n/GsXBodA
 lm4=
WDCIronportException: Internal
Received: from cnf011319.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.208])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2021 18:03:05 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 05/17] dt-bindings: update sifive plic compatible string
Date: Mon, 18 Jan 2021 11:02:32 +0900
Message-Id: <20210118020244.103451-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118020244.103451-1-damien.lemoal@wdc.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_210306_153058_A17CF526 
X-CRM114-Status: UNSURE (   9.81  )
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
 .../sifive,plic-1.0.0.yaml                    | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index b9a61c9f7530..3db86d329e1e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -8,10 +8,11 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: SiFive Platform-Level Interrupt Controller (PLIC)
 
 description:
-  SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
-  (PLIC) high-level specification in the RISC-V Privileged Architecture
-  specification. The PLIC connects all external interrupts in the system to all
-  hart contexts in the system, via the external interrupt source in each hart.
+  SiFive other RISC-V and other SoCs include an implementation of the
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
