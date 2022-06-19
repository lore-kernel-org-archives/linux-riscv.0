Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC75C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 16:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dRybXqMrkXxufslwErEX6qWEc1XKHB9vZFaqsioQfY=; b=ypnMYOOv3Y4gcT
	E/4cAXyNko8CmVR1e6VOB0RVmOWKF9CHuluXCl34LOIYkIvBGyYpD/2iWQGLztJof4DWQh10PiX5d
	KnCD/yw9zMScvtu7PgNoKVQ7bXn7X2krjAG3l66T9+So3BqeQPub4la2dOzXE99P9V6TekNgBSYl/
	cT2INrKDNO5S0BgMq/C9Gbh6fkUOxe6yaPhARYhVqb5TzWjIkljXpRLK8oIQvAXuO3NUoI/lLRieK
	o2Y/Zw76MwEbzqYMZlp7DY6ST3yqML1uyGfGqXGAwVgCpGKWmOIYnZBSm18XS5OCLXJAgK4W4A7pd
	6nvennPFuXogf1NEamAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y80-00EjOi-Fj; Sun, 19 Jun 2022 16:50:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y7x-00EjMi-1I
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 16:50:22 +0000
Received: by mail-wm1-x332.google.com with SMTP id m16-20020a7bca50000000b0039c8a224c95so4621387wml.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jun 2022 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OdzijZhojJfexvUiHUDLq5z4PsGSFwQ1Ytr2BP9BCIg=;
        b=PWA4JJOFAtMdKuAwHauf5W0ilkam9+c284EfGOoeFfBxf73/U3WhmRonRDLM9YkFq7
         bXrvdq1MvbW4jcJQNEfv99schOsEgU8AxXsLtq8HqNmK8RTgB+WPs3prQdtrSpXphsv3
         PDKpjD2sE+YGBKavd99Z/4KdZH8b+vD/EGw1aMT/nhcIx17IdEMnfi0klW+QvxETCrdu
         ufR/+VR5poo6Nnp+w5yM2u4joLnHecINMOecWblxkbCXSka3zerwe2DdgAGjrgl063bq
         OeLVMsyhBjIQnxfYid1cwKIYct0v1Lb4aYeptnBNQIH+0Ki8ewyuz2pi/YMcTgDZS6VM
         So3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OdzijZhojJfexvUiHUDLq5z4PsGSFwQ1Ytr2BP9BCIg=;
        b=bogC9eru9KQJnGIW8mKFdK7jVrNUFS5dmoHeAiAw/YPsKz1tMFAYaJr70ud2264aVk
         IfXTk4ahY8LM/UYn8DOq2FuDI5Nts+fGJJ93j+1BbGBc/bNzYh7LQrFFA1zu0kaj1+N7
         K6MPaCCK3zL5pUL0zsoRUpLmPQNpDMWRRPZoUfG0hAfo1026vfSG+YGzAGlZZ03INjZ0
         jqjbASuefLPQokE9ZpUUhQE9zR+T7lJuKFeI1HIMhtsdyUCRaH7TjSx47qZsUJXfex5l
         p+qORJImSGRiTmlwEk/QyTg4ZWL1Xnzo0oDR7Phqqv2bOPXswohTb1UMPAg10J6rRhxZ
         vghQ==
X-Gm-Message-State: AOAM531gJNJEteJkNPPCcxz1w2wUVU3cp/CBXFcweLeS/5Eu4ClZZ1q1
	zrjaokht6BXPFRpnDUqMv5nuFw==
X-Google-Smtp-Source: ABdhPJz0xPBZmWQTo9K8KRhE/AtjcNNKaUjJZKnJFvDuhZ5Qur5cAWc+N3xl1u+1XObV9D2uRhHE6g==
X-Received: by 2002:a05:600c:3048:b0:39c:4c03:d54f with SMTP id n8-20020a05600c304800b0039c4c03d54fmr30692648wmh.89.1655657418512;
        Sun, 19 Jun 2022 09:50:18 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id m14-20020adfdc4e000000b0021a3c960214sm9189510wrj.6.2022.06.19.09.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 09:50:17 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC 1/6] dt-bindings: clk: microchip: mpfs: add reset controller support
Date: Sun, 19 Jun 2022 17:49:31 +0100
Message-Id: <20220619164935.1492823-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220619164935.1492823-1-mail@conchuod.ie>
References: <20220619164935.1492823-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_095021_116607_4DF30571 
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

From: Conor Dooley <conor.dooley@microchip.com>

The "peripheral" devices on PolarFire SoC can be put into reset, so
update the device tree binding to reflect the presence of a reset
controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs.yaml          | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
index 016a4f378b9b..1d0b6a4fda42 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
@@ -40,8 +40,21 @@ properties:
     const: 1
     description: |
       The clock consumer should specify the desired clock by having the clock
-      ID in its "clocks" phandle cell. See include/dt-bindings/clock/microchip,mpfs-clock.h
-      for the full list of PolarFire clock IDs.
+      ID in its "clocks" phandle cell.
+      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list of
+      PolarFire clock IDs.
+
+  resets:
+    maxItems: 1
+
+  '#reset-cells':
+    description:
+      The AHB/AXI peripherals on the PolarFire SoC have reset support, so from
+      CLK_ENVM to CLK_CFM. The reset consumer should specify the desired
+      peripheral via the clock ID in its "resets" phandle cell.
+      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list of
+      PolarFire clock IDs.
+    const: 1
 
 required:
   - compatible
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
