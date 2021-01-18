Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14A5C4332B
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5865422525
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5865422525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gswnWoZbOBcUMQ34RrcIhomCllgFBG8MrmOUbQlcNqg=; b=0okd2wxVgZ7LYglqkB0mfAnvR
	XZfpoDFArCndH/qxuLW6/taNtuhGrLX8hpbSRLKzVL8x/1A1pXaKNNOgYwjbmcrI0UgqzP4HSnu8D
	MiGci1R1K6Ds8SYB6W/v++QdrYc7LVASBMJAKwIUrxhLcTu9ex7Wagx2wlcbfQZEphWWpfKbozgjM
	BYd66mubvRRJd6sodCD4czUJ3Kk8qVvo0sCgbeoJ4FsRaDiBNRh3gG7vlINY/0lSMoQCkhJfUIp2e
	LRb6AoedPZhCqgwMjN+mCmSzFp72UdHkLB3DfCj/UQ7w2DnHT9y6osvtsfRFwv+VgZ+JUlUzUyeox
	gttZdGnhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Jsw-0003dQ-Sp; Mon, 18 Jan 2021 02:03:14 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Jst-0003Yc-Vk
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 02:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610935391; x=1642471391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HnJ883zL+t4xSM63wnXK5D+H6FssPdmgykJIZOwLcLA=;
 b=H23jijcsKc9pFPrjw/Pw4Bk7VM7zAbDSDr2U6Ln1x+PUWlAFdif/IMZb
 01b3iEUz1MUFkB0rWP/4q7+SZjzxxDcgusxvMcm3clp+daJ1ossXY/01h
 cDABeNFj6tcQHvOP4iaHkayydGwHdEKkYSB8g4DnKL2GnHLYq5Okd7TaU
 kakkVitXb+Iqof0YMwqI4PngrZwmPZmXpMlbhv9WFCMb1zTesuJhb2R81
 uB9BOa5Kd6fwsrhlI+GTl9kOM9tanBZI3Gfl4Pg3SDwBQN7c9r8x6Vd2P
 rBE6J5OCg1HAXB0+fhfYWxzSw5Lsj5nzcYZ6WtlOnQjNFKhF6Qi2oByez A==;
IronPort-SDR: ulWjwmf/PN+wGwoyz3ahPn+VeyoeiLsxH0AQ7KCJTimaRJGMUD1Crzho5zaI2rYbjf8Sd2EKPj
 ubkwYYy4RwhSh5jIdGhqJHE5EdxV5gCwdDamucSeWuv79YT2ITqAP7rduF9W44TXF5DDCQIoLV
 rwhOFITBXcAEACGMkOVkfa0O/BkCod0jcejeaA4QZ5uJs0BmxXYmztsKMfZPP4kwJBLFStiCU2
 ZsRyRfKPHlA4sI1BPTQriMK9lyjKoJOxxn0riG/CKVs2gEaUfhmBu+vTdlTvHMj/pW2vgFYEwM
 0zs=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="267979909"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 10:03:11 +0800
IronPort-SDR: cxVEwfqaQSLPkDKmAfXcxR0OADqh0i3rFBXJsNSg0FUUvdG8NnRlu4OunZlTa87hVSCDd/1/ti
 3e5EDoBK5CPFlBTfMXkKQC0UQfsQnudF3EvDWMFznoYEjRhVkME+v9Wxndf2kg9V/4mbwBHwXP
 cygV9vN70oG0807OBa+l50Epgz3Ld7JuPVYYC4hctbV0svZXpv3cuWSDbsIsIa5I9YxUEAuEmm
 VvGEdkrXb5s2fpiMZZ9iORKk7tG4U7UlxYC/g/L/sT5xDI/HcHSWZY0bUpZ19et2Ykcf4+5kr+
 KPCeJXVP77zZjfFd6Pz/4sjw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 17:45:48 -0800
IronPort-SDR: QrNUiJfzoKM6fXZiFKAMFSCSOI+R03Cb6vvw96EpFCrKreBvi0MzINZKrEb989HCZrw0hZyTwp
 d/ckJMJYQgRH/V2tYslAirAPBN9qLkVfZY3SB6RkvpTjqhn1dAW4QqXd0yLQD/xJS6ahCbsSrE
 vIRAUt76OyFonmQ05+al0xWhwwWUy2NnNDCU7WGW4O+D/cq/4x7nYwJpizm8jI5Yh0qPZpuVTm
 SHFV6sYJNSp55OaiK5WHdzuW98sfP7NC8VBIdGTqwbQBpOKeH7yWMVbmO6tchHRbjw9KY128iU
 B/k=
WDCIronportException: Internal
Received: from cnf011319.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.208])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2021 18:03:11 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 08/17] dt-bindings: fix sifive gpio properties
Date: Mon, 18 Jan 2021 11:02:35 +0900
Message-Id: <20210118020244.103451-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118020244.103451-1-damien.lemoal@wdc.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_210312_225435_682A6B93 
X-CRM114-Status: GOOD (  10.01  )
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

The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
interrupts property description and maxItems. Also add the standard
ngpios property to describe the number of GPIOs available on the
implementation.

Also add the "canaan,k210-gpiohs" compatible string to indicate the use
of this gpio controller in the Canaan Kendryte K210 SoC. If this
compatible string is used, do not define the clocks property as
required as the K210 SoC does not have a software controllable clock
for the Sifive gpio IP block.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../devicetree/bindings/gpio/sifive,gpio.yaml | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index ab22056f8b44..2cef18ca737c 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -16,6 +16,7 @@ properties:
       - enum:
           - sifive,fu540-c000-gpio
           - sifive,fu740-c000-gpio
+          - canaan,k210-gpiohs
       - const: sifive,gpio0
 
   reg:
@@ -23,9 +24,9 @@ properties:
 
   interrupts:
     description:
-      interrupt mapping one per GPIO. Maximum 16 GPIOs.
+      interrupt mapping one per GPIO. Maximum 32 GPIOs.
     minItems: 1
-    maxItems: 16
+    maxItems: 32
 
   interrupt-controller: true
 
@@ -38,6 +39,10 @@ properties:
   "#gpio-cells":
     const: 2
 
+  ngpios:
+    minimum: 1
+    maximum: 32
+
   gpio-controller: true
 
 required:
@@ -46,10 +51,20 @@ required:
   - interrupts
   - interrupt-controller
   - "#interrupt-cells"
-  - clocks
   - "#gpio-cells"
   - gpio-controller
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sifive,fu540-c000-gpio
+          - sifive,fu740-c000-gpio
+then:
+  required:
+    - clocks
+
 additionalProperties: false
 
 examples:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
