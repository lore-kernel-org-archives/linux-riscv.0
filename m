Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B193B606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 08:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1BB4+JJK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=w4Y4kjo9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:To:In-Reply-To:References:
	Message-Id:Subject:From:Cc:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCpzl0T1SVycY0wVSzhFJmOcpR9u+9/aM3tuxkeSGGY=; b=1BB4+JJKzR8U47
	HEu3XWlvlAjiTMBpWqNyW1PHZIbDkjEWLIAd48utofLUj2TidOVA+7qEmiH5+5HUuURRNwr2/3ndm
	Sm6hydjIiR/R0sMG+2pgMrNZfesft+yBmDWr2yiT/lDqa09uBAaXQk2E0uxgchy9XlvcQbzmyJzB0
	+OpB2dl0Ox0gQcEUTK6iXGDqJ8fxyurKK5tu4+8xbB2zYrSJ9KZMqSmhuS41EvEpP4mjlxesimhxi
	Vu/lJJXJvSOQut8Jul4hKnBHuJMt6RS6P7Ie8CME2YI+IG7RBkadDWnFYLf0l013ZfgA5KKoOugMW
	iaFi6/8b48TfWLFR/Vbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ55W-000000098o9-1XdE;
	Tue, 20 Oct 2026 08:20:50 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ55U-000000098nr-0lre
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 08:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1792484437;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Br+RwhEUUjij+LQeVh8KN+b6c87vkCnWluLTXLQF6m4=;
 b=w4Y4kjo9R9evDZzjuKM13vSvVSPv6tNy9R9p82g0GvtZITTnyNtLyR9USU6vCJp+Dq/RmX
 A8MNAe8NFAbAUqE8bYcQ+HXm0rNCCPMYWihtCjzW+lIS92WgbpeCsHpFlC0RrweoUhgceW
 VGe4OnVOzGhBygTw2gQhWsDyk61mzB/MjA1nIBX1S/Gs9L4ycMLqOp8+BWjd1qN4285HB3
 VTMtMxBAgGRS6G1usmDtg9LOl++MI8yk4zePj9xr/ReRLHCpwZcPj0jBqju3nmRaymb80q
 ZB9dBbRZnd77CahnZYwPLrCjbjfw0nbUeD7mcJQaXNGsh9EdajlQbbVvGdDzEQ==
Date: Tue, 20 Oct 2026 16:20:15 +0800
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([14.155.180.235]) by smtp.feishu.cn with ESMTPS; Tue, 20 Oct 2026 16:20:34 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v2 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
Message-Id: <20261020082015.3673761-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
References: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ad72453+361a93+lists.infradead.org+sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_012048_311582_BBA9DDEC 
X-CRM114-Status: UNSURE (   6.56  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the device tree node SDHCI-0 controller for Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../dts/spacemit/k3-deepcomputing-fml13v05.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 84f66dd8f962..09e3d46a2ea3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2026 DeepComputing (HK) Limited
  */
+#include <dt-bindings/gpio/gpio.h>
 
 #include "k3.dtsi"
 #include "k3-pinctrl.dtsi"
@@ -184,6 +185,23 @@ &combophy {
 	status = "okay";
 };
 
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	non-removable;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
