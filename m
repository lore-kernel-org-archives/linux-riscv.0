Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E683CD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	References:Message-Id:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=6BoPywbh0K8ypiAp84MqW/pHOZEhxMH1D3u4ZIs3ceY=; b=Vw4zJw75e/D6fo
	1sJD5rP/B9Ass0vod00BTxLJ9ihINTL/s3ECZ8aS6NLJM0aJMJ1IEPfwMeiPUaY9h0JipWWuCOLOI
	/pw/NDhjiVQj2oymuEYeH2bvsc7OD6n8s1mQAo4IPV/jBMoVDX8I/7KTXmagh/4/7kRfb9EeuMpJz
	g+XAJ/DxN3334+DW+1jBibPA4SGowQZzE94jfsXJ7l84safZQtK+wTJSXp58aQvAqwsQmVB4hYBFF
	O106AevOXG5CD51YEz6jMaGR8YwJDot2R308MNrEZNkz+dOnyXnDq/lxUVGDvvMC73z/FDGQ0JjmI
	NDiMjg/aE9t1g61Y23WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5K1-00000001o87-0eJV;
	Wed, 13 May 2026 08:52:05 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Jy-00000001o6u-21Vg
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:52:04 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gFnJX44xfz4xPYg;
	Wed, 13 May 2026 16:51:56 +0800 (CST)
Received: (from root@localhost)
	by mse-fl1.zte.com.cn id 64D8prqc083672;
	Wed, 13 May 2026 16:51:53 +0800 (+08)
	(envelope-from liu.qingtao2@zte.com.cn)
Message-Id: <202605130851.64D8prqc083672@mse-fl1.zte.com.cn>
Received: from njy2app03.zte.com.cn ([10.40.13.14])
	by mse-fl1.zte.com.cn with SMTP id 64D8kmvG074085;
	Wed, 13 May 2026 16:46:48 +0800 (+08)
	(envelope-from liu.qingtao2@zte.com.cn)
Received: from mapi (njb2app06[null])
	by mapi (Zmail) with MAPI id mid204;
	Wed, 13 May 2026 16:46:51 +0800 (CST)
X-Zmail-TransId: 2afe6a043a7be67-f3fcc
X-Mailer: Zmail v1.0
References: 20260512183012245tRba33vG69iPkP37ZE21R@zte.com.cn
Date: Wed, 13 May 2026 16:46:51 +0800 (CST)
Mime-Version: 1.0
From: <liu.qingtao2@zte.com.cn>
To: <krzk@kernel.org>, <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <marex@nabladev.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <rdunlap@infradead.org>,
        <geert+renesas@glider.be>, <quic_zongjian@quicinc.com>,
        <arturs.artamonovs@analog.com>, <robert.marko@sartura.hr>,
        <hvilleneuve@dimonoff.com>, <thierry.bultel.yh@bp.renesas.com>,
        <julianbraha@gmail.com>, <flavra@baylibre.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <liu.wenhong35@zte.com.cn>, <liu.fei16@zte.com.cn>,
        <dai.hualiang@zte.com.cn>, <deng.weixian@zte.com.cn>,
        <jia.yunxiang@zte.com.cn>, <he.yilin@zte.com.cn>, <bai.lu5@zte.com.cn>,
        <yang.susheng@zte.com.cn>, <shen.lin1@zte.com.cn>,
        <zuo.jiang@zte.com.cn>, <hu.shengming@zte.com.cn>,
        <gao.rui@zte.com.cn>, <tan.hu@zte.com.cn>, <liu.qingtao2@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyIDEvMl0gQWRkIFpURSBMUlggVUFSVCBkcml2ZXI=?=
X-MAIL: mse-fl1.zte.com.cn 64D8prqc083672
X-MSS: AUDITRELEASE@mse-fl1.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.qingtao2@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Wed, 13 May 2026 16:51:56 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A043BAC.000/4gFnJX44xfz4xPYg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_015202_674783_37EBB857 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From 08610be731b6fc3919d5eebfd2ff9d67f38a094c Mon Sep 17 00:00:00 2001
From: Wenhong Liu <liu.wenhong35@zte.com.cn>
Date: Tue, 28 Apr 2026 22:30:31 +0800
Subject: [PATCH v2 1/2] dt-bindings: serial: Add zte,lrx-uart

Add devicetree binding for ZTE LRX UART controller.

Co-developed-by: Qingtao Liu <liu.qingtao2@zte.com.cn>
Signed-off-by: Qingtao Liu <liu.qingtao2@zte.com.cn>
Signed-off-by: Wenhong Liu <liu.wenhong35@zte.com.cn>
---
../bindings/serial/zte,lrx-uart.yaml         | 51 +++++++++++++++++++
MAINTAINERS                                   |  8 +++
2 files changed, 59 insertions(+)
create mode 100644 Documentation/devicetree/bindings/serial/zte,lrx-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/zte,lrx-uart.yaml b/Documentation/devicetree/bindings/serial/zte,lrx-uart.yaml
new file mode 100644
index 000000000000..20f470f04257
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/zte,lrx-uart.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/zte,lrx-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE LRX UART
+
+maintainers:
+  - Wenhong Liu <liu.wenhong35@zte.com.cn>
+  - Qingtao Liu <liu.qingtao2@zte.com.cn>
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: zte,lrx-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  current-speed:
+    description:
+      Initial baud rate configuration for the UART. This is a required
+      property to configure the serial port baud rate at boot time.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - current-speed
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial@e0001800 {
+      compatible = "zte,lrx-uart";
+      reg = <0xe0001800 0x100>;
+      interrupts = <18>;
+      clocks = <&clk_uart0>;
+      current-speed = <115200>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0dfad67f66c0..79be2dde3b71 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29494,6 +29494,14 @@ F: include/linux/zswap.h
F: mm/zswap.c
F: tools/testing/selftests/cgroup/test_zswap.c

+ZTE LRX SERIAL DRIVER
+M: Wenhong Liu <liu.wenhong35@zte.com.cn>
+R: Qingtao Liu <liu.qingtao2@zte.com.cn>
+L: linux-serial@vger.kernel.org
+S: Maintained
+F: Documentation/devicetree/bindings/serial/zte,lrx-uart.yaml
+F: drivers/tty/serial/lrx_uart.c
+
SENARYTECH AUDIO CODEC DRIVER
M: bo liu <bo.liu@senarytech.com>
S: Maintained
--
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
