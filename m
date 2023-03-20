Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269DBC7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdYyB0hclNiQAeosuUXC0nijztiu6CReqLWrxPQJ8/s=; b=YEuRy/F1zz+XHz
	8yNYNsijdTtNB5RdVHYtzUZl1NV65v6YN2Y6WcdJBctAhOwXLpAxop0JlFffRh4XswCugCsInMhjq
	Y/Jr5qq8WwjvjClPDQ5WYhdARKIXZNB2vRCYWRuviDn/4Z1HqtwkpB/eE1ikhBsTbeFswQL0Z1aw1
	qOelbMwPFn1nEI2xUkuQuoRNJ67Zlil3DvsABhPsasxLQCsAJVFVJMgKza/kQBxFs9fPM5HHTmREY
	OLgRHnZ5aQ5ddxJjXLDriEpXqvUwQ+rM21kej6OvKYuKvdY9IucztXXVtqzQVwJFtu3FvBJur0LoO
	bx8En/vzOTqByeaksyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe3mI-007nxq-08;
	Mon, 20 Mar 2023 00:53:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe3m0-007npL-0L;
	Mon, 20 Mar 2023 00:53:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 883641042;
	Sun, 19 Mar 2023 17:53:55 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D1503F885;
	Sun, 19 Mar 2023 17:53:08 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/4] dt-bindings: arm: sunxi: document MangoPi MQ-R board names
Date: Mon, 20 Mar 2023 00:52:48 +0000
Message-Id: <20230320005249.13403-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.7
In-Reply-To: <20230320005249.13403-1-andre.przywara@arm.com>
References: <20230320005249.13403-1-andre.przywara@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_175316_187044_9213FD58 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?q?Andr=C3=A1s=20Szemz=C3=B6?= <szemzo.andras@gmail.com>, Belisko Marek <marek.belisko@gmail.com>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The MangoPi MQ-R board is a small development board, using Allwinner
SoCs with co-packaged DRAM. There are versions with a RISC-V core and
ones with two Arm Cortex-A7 cores.

Add the board/SoC compatible string pair to the list of known boards.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml   | 5 +++++
 Documentation/devicetree/bindings/riscv/sunxi.yaml | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 3ad1cd50e3fe0..1a2d728234b1e 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -843,6 +843,11 @@ properties:
           - const: wexler,tab7200
           - const: allwinner,sun7i-a20
 
+      - description: MangoPi MQ-R board
+        items:
+          - const: widora,mangopi-mq-r-t113
+          - const: allwinner,sun8i-t113s
+
       - description: WITS A31 Colombus Evaluation Board
         items:
           - const: wits,colombus
diff --git a/Documentation/devicetree/bindings/riscv/sunxi.yaml b/Documentation/devicetree/bindings/riscv/sunxi.yaml
index 9edb5e5992b19..b36e313e13a67 100644
--- a/Documentation/devicetree/bindings/riscv/sunxi.yaml
+++ b/Documentation/devicetree/bindings/riscv/sunxi.yaml
@@ -64,6 +64,11 @@ properties:
           - const: widora,mangopi-mq-pro
           - const: allwinner,sun20i-d1
 
+      - description: MangoPi MQ-R board
+        items:
+          - const: widora,mangopi-mq-r-f133
+          - const: allwinner,sun20i-d1s
+
 additionalProperties: true
 
 ...
-- 
2.35.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
