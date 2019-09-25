Return-Path: <SRS0=bXEr=XU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A646C432C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2019 13:13:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D95320640
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2019 13:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zt/kFM06"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D95320640
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S8+zzr7nv3gyA8GAbyOu9hTBkhisv0hfFzkEtqGumeg=; b=Zt/kFM06u1j2io
	3m9nkbcuRBWYbALrA3iKbKf++oWc/lhywraM58bPKGKtRucyl1Qf6i/NqjRe7gPq+inK0yFsZuvo2
	2c5DneslSuNwvZD8RE6c8oMLzjDSs6+BF8hhUFqnThr6TnHl48doJYWej+xt3gHIJXMLYO4aPlBZX
	dl55RQroHQRmcBtqG2ff/jMkyXjGTIKjUQpOIIu5JmBN2RhXQrv6VuXqroPPBTzolzdEkggUJqziu
	KhD+tpMfVwXxyQEEHTdSdkWzJrbKhPaaDCxKgPL4fXPRJ/YJATa8pqKNm7u+BNlvopKo/eMqk8hKN
	iEXsHUcK1FwY3p6P/SWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iD76L-00044S-Es; Wed, 25 Sep 2019 13:13:01 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iD76F-00040N-11
 for linux-riscv@lists.infradead.org; Wed, 25 Sep 2019 13:12:57 +0000
Received: by mail-oi1-f195.google.com with SMTP id o205so4807576oib.12
 for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2019 06:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWmNOzJx7r5Dye9C9HIH0fNSv2YxMODD9DtwUooioH0=;
 b=pQXaG52A2powoch7VwoibBdtbgznWzSjBwGXFV5SAvWVhs02LOhlJqwXKTVweJpLOp
 UwjDWmphvCoF4gjjNk79QYrgWPzylHz89I9yNDa7dq1t0X7Z2pDChFxAviIMYkGeBtGH
 BppmrYuqWKMru6YM/Y/lysqRGkO3p2Emx6P6MNyPxpPdBcN3C5xLbk487QwI2rigp89f
 ofPvYjoXD7G/BV4zzw9Symr9QULkNncDmIM0qBy2GD5Ij1B3yJjrDTTMXvN2s6Q0Cd7B
 ci49784a/XZpGku5CMJsfNuqOC+lAoK6UjQi68INjvvDKo6NCIlMXgBxypEFP/TMegIN
 w5HQ==
X-Gm-Message-State: APjAAAWBatBucXHbHK9ncz3DIjjJLNsCMravWfaA8AFxGaZiTGTV4dP9
 Fx91R4rul5NUe+C5DNncKA==
X-Google-Smtp-Source: APXvYqyRNeRQsJUXICdwZXRKjWmcbdmyDUjLs3J1t5NtgQFrB53QCFp+8qBs1OaZ1ObrHbQTOmgU9g==
X-Received: by 2002:aca:59c6:: with SMTP id n189mr4519258oib.127.1569417174055; 
 Wed, 25 Sep 2019 06:12:54 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id 11sm1628329otg.62.2019.09.25.06.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 06:12:53 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2] dt-bindings: riscv: Fix CPU schema errors
Date: Wed, 25 Sep 2019 08:12:52 -0500
Message-Id: <20190925131252.19359-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_061255_307461_9960CE21 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Fix the errors in the RiscV CPU DT schema:

Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: 'timebase-frequency' is a required property
Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@1: 'timebase-frequency' is a required property
Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: compatible:0: 'riscv' is not one of ['sifive,rocket0', 'sifive,e5', 'sifive,e51', 'sifive,u54-mc', 'sifive,u54', 'sifive,u5']
Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: compatible: ['riscv'] is too short
Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: 'timebase-frequency' is a required property

Fixes: 4fd669a8c487 ("dt-bindings: riscv: convert cpu binding to json-schema")
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Add timebase-frequency to simulator example.

 .../devicetree/bindings/riscv/cpus.yaml       | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index b261a3015f84..eb0ef19829b6 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -24,15 +24,17 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sifive,rocket0
-          - sifive,e5
-          - sifive,e51
-          - sifive,u54-mc
-          - sifive,u54
-          - sifive,u5
-      - const: riscv
+    oneOf:
+      - items:
+          - enum:
+              - sifive,rocket0
+              - sifive,e5
+              - sifive,e51
+              - sifive,u54-mc
+              - sifive,u54
+              - sifive,u5
+          - const: riscv
+      - const: riscv    # Simulator only
     description:
       Identifies that the hart uses the RISC-V instruction set
       and identifies the type of the hart.
@@ -67,8 +69,6 @@ properties:
       lowercase to simplify parsing.
 
   timebase-frequency:
-    type: integer
-    minimum: 1
     description:
       Specifies the clock frequency of the system timer in Hz.
       This value is common to all harts on a single system image.
@@ -102,9 +102,9 @@ examples:
     cpus {
         #address-cells = <1>;
         #size-cells = <0>;
-        timebase-frequency = <1000000>;
         cpu@0 {
                 clock-frequency = <0>;
+                timebase-frequency = <1000000>;
                 compatible = "sifive,rocket0", "riscv";
                 device_type = "cpu";
                 i-cache-block-size = <64>;
@@ -120,6 +120,7 @@ examples:
         };
         cpu@1 {
                 clock-frequency = <0>;
+                timebase-frequency = <1000000>;
                 compatible = "sifive,rocket0", "riscv";
                 d-cache-block-size = <64>;
                 d-cache-sets = <64>;
@@ -153,6 +154,7 @@ examples:
                 device_type = "cpu";
                 reg = <0>;
                 compatible = "riscv";
+                timebase-frequency = <1000000>;
                 riscv,isa = "rv64imafdc";
                 mmu-type = "riscv,sv48";
                 interrupt-controller {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
