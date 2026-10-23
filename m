Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7524D606A31B
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 01:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FHYiHnac;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LAb+6DEt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QE9HK68rxauZp1MrlkVHet2rSy49lJrOrg97fO43+mI=; b=FHYiHnacUwxeYH56Zp39nklNb9
	4ZhHHXTsBwGqF4fzaArYYraRJ+86Gub1pBMoJCPSkihy1FZZkon1SW1DK2ZpbIlgtcrMTwEd1i6ot
	qAN74hFd3vAkWg+oJsXa0nUbBTW6UGEEdUPRqiW54OoGBdfPLv3BVrOg4P6h6MhSv4buF8vt8cDbV
	ZA6k3XBPzJua7UwpPiIy/QiDY0tOXaVn6Fqo/Y11rBxnVcKIZ+5DkmLR1HvvoM76/E4tWp/lwy70u
	QxhwT2BeAJvYvYbP153j7NmIZngG7Wz8kf6Q0c79cB1yegVkXY19ZRhFPgddGe/JV48FYyEvijsGB
	qsiF/TRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Wh-0000000FIUf-0qrS;
	Fri, 23 Oct 2026 01:56:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Wf-0000000FITm-27pg
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 01:56:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BDB2601E4;
	Fri, 23 Oct 2026 01:56:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792720616;
	b=2FvUkGl4MaWBmUc6MN44xYtF7OAzCIvoxo8aoAq0p+4fQmOnPxNG0b+dV3903jg0xEsN
	 hecrI6z4yH4TUcQ1fFU1/mffbMuvwc+YsfXQkhq48e2lhLcq4pQtth8nQpPtCjw8q/dJd
	 upKIXDIMDrl3U5iDJjuwx8Qw8vUCWOKxa5k8icCi5hDxxXruknbKfaCZmNVym58ccVZpW
	 M8PgzGwMu0x7ftS9boHwOqbQktIXXS0RpfDEl7M5O1+nsOVttrp8rf6/aNM32x9PgPLYR
	 y2UKiHuTvRpcGpwQ3VVcFXDBfJLwitm/Xz7ez/RzguEXaW/px3NQpKbfGXsAua86WWg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792720616;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	b=pL1sy+iGV4jM7aY8uileD0ZLivCJKUDrR/YEYntZX5Sqq0nevN/rM2OjXszoIJEHEmSM
	 /Zhkq3nAUPM0sbo3qDXfmVxcApz1ilSvC8Jk1BB0tKBHpL5P2QhVOR4FFsBIs3J1uftaF
	 WteaSdpm5K2zrL48wY/gP4LkhwDL7w4jQAJedF++S3rIUXym/V6O5RlicRpJitWVr4GpU
	 WHIewwt1QmlxU+pFQEj8bO2KmMzmYBasrASJrAM/uI8/VbXhPhl8VpKN8z+/pmUxaRXAg
	 nAkYmxh8PlfTvLVzvHlAahb+VzMbUTYKV/s6giEXKmE7GuwaT9g6srCuwqA0s5HSITg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C0361F01829;
	Fri, 23 Oct 2026 01:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792720616;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LAb+6DEtj2jAXZDiXYPRv6a0q8hqssQpxxN/Arlhg0R/zGs2Ft42UuIvd1H7CDafy
	 h+W9cDaYaOJ0xFlG2LUGZDoDUBKDtgj3VD52KVq71jqb786awNh9owgFpIu5OHN5Ug
	 36bY/6kHCOlNmJOfScgAeiu7gdpSGYPbFVytzO467HBmJ73a8i6BUAphRHuXLakfKB
	 koDdNR+dMhLt6pnNCPe6ADUNZwLqhAxnEYin10VDcxXYA9Pap3jwsxIsqqQYZAV9CG
	 n9LPON4FvStziUyCHdk7Wsj2NHI4d6xg89iDpjHfquHGkPPuazTwNnI5hYrgveCSiG
	 1VTBDZyG+TFDg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E152E42176;
	Fri, 23 Oct 2026 01:56:54 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Fri, 23 Oct 2026 09:56:43 +0800
Subject: [PATCH v5 3/7] dt-bindings: riscv: Add UltraRISC DP1000 board
 compatibles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-ultrarisc-dts-v5-3-af79dbd6ccec@ultrarisc.com>
References: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
In-Reply-To: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792720613; l=1942;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=F931PJB7CYQDP8Qv71XY2lbmZu4qGdN+Fjh5HxV88EU=;
 b=h/6RWoBjw0sjolkqIzjJpMDqbaw8pueMa9vGtbP70tf5uuz26C4ls10lJi15V6swv9Kk5oVvl
 8ETEApXYpC4DJraNpM7E4t6wBWVZ7zWSah0YyrYPyZzWNZTDXHz07ll
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: jixincheng@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jia Wang <wangjia@ultrarisc.com>

Document the compatibles for the Shenzhen Rongda M0 and Milk-V Titan
boards, both based on the UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/ultrarisc.yaml       | 27 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/ultrarisc.yaml b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
new file mode 100644
index 000000000000..a51e63dbeca3
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/ultrarisc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UltraRISC SoC-based boards
+
+maintainers:
+  - Jia Wang <wangjia@ultrarisc.com>
+
+description:
+  UltraRISC DP1000 SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - shenrongda,m0
+              - milkv,titan
+          - const: ultrarisc,dp1000
+
+additionalProperties: true
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ff1c1aea9a98..7eb1b2971bea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23639,6 +23639,13 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+RISC-V ULTRARISC SoC SUPPORT
+M:	Jia Wang <wangjia@ultrarisc.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+T:	git https://github.com/ultrarisc/linux.git
+F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
