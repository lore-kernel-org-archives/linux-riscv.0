Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F7AC64E7B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 11:03:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAEA6206CB
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 11:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ijaRFbJ5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xtczivcN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAEA6206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LbbH985Z9UkZgl2RlwFzCc5ytNup2pzwIvdg4UMTIOk=; b=ijaRFbJ5C9xvheISR+3xf78CUB
	aDwzOANVUBD4uHJoRampJ7+0kd/33kXRF/skQQkb6czUoWF3BeCITwTX9+0zn9Xb8JlSEOkLmuRbU
	JgvdYLOqqKPaqwm/sr4fZx9E4MhNdJopXBRX6FYgTonWXFekELOlrh0b1RcImjGQSXB5pmuSwM2y2
	KNqcO8AkIqU5/vW8Xvv2TCodDvcnM7IHI2X/TpqacUbMzwEu1A7UzX5H4x3fBC2XmIS1l+RIqlKCD
	vydmZ9McinONj41qZtIczGNouaxSJpnO60OP3Cb7GS9MjZE1WnLFV0eWdFp48NiFD3RxOSF5Y4ety
	FjJxhk2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk3RH-0004Of-H4; Tue, 01 Dec 2020 11:03:19 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk3RF-0004O0-NZ
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 11:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606820597; x=1638356597;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=zk6cCCU/8Jv26b10IZeTDqLo8b7LPtw6jb4oI3S6LZI=;
 b=xtczivcN0qMyxvUUGdkMB63ahpygx3HE4u2Y5XDzwf590l3zHuBCN4mq
 ViT7rpOgfUfZJLOA2qax7cXE1ohwPuuH4dM1oC61VwQSovwrsQVuDaLsB
 ul9BFhwHe7onqneQry0vSt+ZQz5iqLILz1Yx3bDOPWPFXszAEwTrbdw2P
 4gaYSHVwIk+toj7ewEskT0X4BRd4oFcq2G0VTUptktcuEbBx0MbmpTDu3
 +AnYeZBh35so0Y5CinVDPY9tCJww3jwNSGWg4TUNsvUstDD/8cSZ9Bh0u
 UX3WlZQCzZdLP7ETzS+t8IXD3Lzbdwl6fvI+DIT+qWSRiqHP3m+Lngk7o w==;
IronPort-SDR: JwDo0qO8c99jbTxsf4lX33LeU4TSjCrnKpqFI99uYXOfoFeY+Tx0u5Zl6RZke/aGm5rAuNnQkh
 lQ9sWbQ15Uq1llGtmp9qV/6xumrC8pWrA4TfPzz4zDmFC2PPQofTu+XAftDlAoI93//Sakdxda
 Ce9//DI9jVxesrlkqUSwWs8WMkz9m7S/zFl6vC2kiqCtXwmheC2TO236fUKU/9I+mNYzf+bqJi
 OImrMyjCEjqOnW1kYRzUhVltssDTFTBIUyKwpW5c/V1wY67EKsTzYC2w4mkrkxfFi8W0ORSciL
 v7k=
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="100945431"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Dec 2020 04:03:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 1 Dec 2020 04:03:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 1 Dec 2020 04:03:12 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 4/5] dt-bindings: add bindings for polarfire soc system
 controller
Date: Tue, 1 Dec 2020 11:03:11 +0000
Message-ID: <20201201110311.28593-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_060317_910654_FBE4ED2B 
X-CRM114-Status: GOOD (  11.23  )
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

Add device tree bindings for the MSS system controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs_sys_controller.yaml        | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
new file mode 100644
index 000000000000..c22fc203b95c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs_sys_controller.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip MPFS system controller
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,polarfire-soc-sys-controller
+
+  mbox-names:
+    maxItems: 1
+    description: name of the mailbox controller device node
+
+  mboxes:
+    maxItems: 1
+    description: |
+      phandle and index of the mailbox controller device node. It must be 0 (hardware supports only one channel).
+
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+required:
+  - compatible
+  - mbox-names
+  - "#address-cells"
+  - "#size-cells"
+  - "mboxes"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscontroller: syscontroller {
+      compatible = "microchip,polarfire-soc-sys-controller";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      mbox-names = "mbox-mpfs";
+      mboxes = <&mbox 0>;
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
