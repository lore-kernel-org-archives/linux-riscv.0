Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F62C64E7B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 11:03:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C77D320809
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 11:03:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MW0Tg0ip";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="zJjBKH5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C77D320809
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FEx3aPqp4ZfIBjzOP8t8uxDYGeufnRObHpvjRZ7ovI4=; b=MW0Tg0ipSGQaETrOLADAQEr//s
	dq7+4i0qH3f/24Z2bwSSIlRbAva8YzqnhD4r8ilWKRzZVm5UPjIZ4n/LAtLQjHiO7fEhn5QqpInrp
	OEIy4OFHCD1z4keSopTbjVc0MPip1peIFSnSZ3g8G+XtnpbE73luy73bhsFke7bQ6/7QZx1/v3zYS
	vRUdbXbo52cCdmySb3Hg+Ljva1CHeAjNQdQJZ6+C2TRYVKMj5UNh8QIEDDJVVJa2o7np+99dgeSFY
	80vR8jNzzO+0K+ij/ND+nSOjUAQVPz9iyRsj+5RbkERegGmkMUeY1QnRB0vqOJpa0PoSZOR8bHv4M
	qyh6KGHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk3Qw-0004JI-2s; Tue, 01 Dec 2020 11:02:58 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk3Qt-0004GF-0Y
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 11:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606820575; x=1638356575;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=jauox//ePXwP8SQPPfgfnZWRrEQXHbn0G2vtEiP850Q=;
 b=zJjBKH5SzoJQNVF6CTiWxXKUUrleDco1zzmR1mriGnwhchtL3s5RMojW
 8ofve6MKQl39o/oYL1BOqkuiVicbEqOLpvSqdLwc64s+oQaCtPITrl27O
 z+cTJB22HvlNsZWKyvMjhbgrZmK5O0U/xcvmB8TtqJt0y9Ba7TRbAhfWV
 myXls06MqaGHTOA7ojImBeGSm6M6TBjHieAf9mrNVmj7S9oIiBbfrISe0
 QXKkzX2e9scKdKMo364aYgZO8ZUU5rpjsfAl0pdtNA7Z+EQeL04ipQg7i
 4KZ8SmIwxy5eRpTviXMQjrKnpQ8l2qd89RHMgfq2HHvfgFrhioXc0uBvy w==;
IronPort-SDR: g7ol6B/HiOtIXty1iGzh01UtKvV2emKXDEs83RkaHo7bz43lfncXmP9GQlXcqriQuNgGrx+7cD
 EvvuJVWwr6QBw2Bi548AvMvl3erZgBvMcCdGMSDkxRpNUY57txYURhgG6hriS/3DBiLFhx7wUx
 b8+TvhT/SbnkGmczohjoRl9osVOckAEOP2ecCt5xz8XxvfBDr+oAtUmGGQoCe79/za/zNHmt6Y
 htnsLyCjcqp2VsNBiPKi1E18QxoHvQhEkrNoW9B8MLxoJq0PKZacUmN7BteaST2DPoN2O9sSUd
 J28=
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="100384391"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Dec 2020 04:02:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 1 Dec 2020 04:02:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 1 Dec 2020 04:02:51 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 2/5] dt-bindings: add bindings for polarfire soc mailbox
Date: Tue, 1 Dec 2020 11:02:50 +0000
Message-ID: <20201201110250.28437-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_060255_270818_128CB04A 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, atish.patra@wdc.com,
 Conor Dooley <conor.dooley@microchip.com>, lewis.hanly@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the MSS system controller mailbox on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../mailbox/microchip,mpfs-mailbox.yaml       | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
new file mode 100644
index 000000000000..9c522a088d55
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip MPFS mss mailbox controller
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,polarfire-soc-mailbox
+
+  reg:
+    items:
+      - description: mailbox data registers
+      - description: mailbox int registers
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      mbox: mailbox@37020000 {
+        compatible = "microchip,polarfire-soc-mailbox";
+        reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
+        interrupt-parent = <&L1>;
+        interrupts = <96>;
+        #mbox-cells = <1>;
+      };
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
