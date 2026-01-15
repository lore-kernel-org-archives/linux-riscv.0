Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95300D4662F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 23:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=El0NF+pj+otAaFHz7ABR4apsZMCfFHKe1yhfhLv7jh8=; b=oKq3nrhpUqtPSF
	XtDOGTyggLNM64gJFyUZfYos48Fx1AUAAksQNPSrBJuPmW+PzLkne31nRG+9eGKMYZBOx5rsZtS3E
	Ba46RyS4IpQkqQzEvy7iWbUIYpc2jaB89FYRmOJYzmUDe3e3BBEkp5ZHddl/oJQz+bVFcicTKCiML
	Pk7CxYn7Wi2iDouUCi9eBPco4KaDIWxC9NwaoHvBxkxPWwjVimD0izFadwUUMTxFgUjAWat8LTlzH
	BDTEMwvYttZ7HubDqGyAvkf7abRCmTVUct+85mmaSpnpiskYB6LOhpD/lOyEXOcHnrrAOY8IZS57Q
	FIEDYBr7UZAnVcHuiRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzS-0000000DKLq-2Gly;
	Thu, 15 Jan 2026 23:42:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzR-0000000DKKw-08fo
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Jan 2026 23:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FhfgD4MLmYb5AUeJY2eVc/fXqLoD7qd7hkr+2xTsRcM=; b=CKcrGGaQ1o86sEByewJJ7EPCkI
	lEZapqu2kLa6jhRN5eyodSbQLF9GAc3UxuEijRrjhimyVa/7TvDghqX8jYUu9hwE6aVTTYs6pSusN
	h69T7DYvm+owXwNDsT4f0PMoFuRPx4/6ytXNTOXYKXuU0A7KBYm1cABN+1XWbHbbpyPfUr5y6R8OF
	EUnfyDAS4MJPNWemeEdsEVIAWIAAIe53l3hXDfEJ8OrEeioNLwqz5TiQiXpkwwYkHEJR7cgzg0Vic
	n7T/o3jt7MeRFbfLICCXZHfRw4rO0Y5yy5uMEFptym5TUy5vqAFTWgrBL8P7mBM6xqbvLDPnF5stl
	gkQ6UTdg==;
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzI-00000007o5Z-3DBX
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 23:42:55 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-790b7b3e594so13792217b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 15:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520566; x=1769125366; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhfgD4MLmYb5AUeJY2eVc/fXqLoD7qd7hkr+2xTsRcM=;
        b=IZrgZeV1aom9n5u9ciLbNNjI7LGnBglPt5gxTdaXraWrIUrD6Noiti4YdR7qZyqcnq
         uXsMq2HfovLgRhk//Bp4ZlzE+7YY9p7ss63EdhY5676jcEalpCsqeD5e0rWq4ESvi6ze
         VhscNUbajhsijQtkv6vyo7dG9i8rEbEdv/Rm1A/u6wdXm0+Qds2UpjkwGLK/ZmUlLTxL
         E8dW2EhX6ABIAi9PVzrt7lVwXfycwEqq8QzyWqraJjWGFeo2l0yF/E/DBuocCljGztw0
         vV48DXmSDfUoE+sh/D8mqtVzh+LE5V9kt2Yc4SLS9c4WcMp41lRf6blj8BIdYrj5eERj
         QsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520566; x=1769125366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FhfgD4MLmYb5AUeJY2eVc/fXqLoD7qd7hkr+2xTsRcM=;
        b=f17tHMownvJ5IuKZXr+JNijm8Sw7/4Bx+2RyOMT8LVke2RGzKyLxxndEv33pO6Iv92
         Fxei9WW78XXdd6y455O2R4+fT+mg/yFawSz+uZHjc/Tuqcc4Sg2ZCBm7FRKVw+jgfBLZ
         EBfx3WJ79X+IGzwbu/iHlFWDLUWBFQnJtSaH5U4kZH8chIkirvMcR54FrMp5bN5sFSEu
         AuO0f0Gk02H6X/S4TWVO1eYo8KlnYSKXtZtBQUeVw5Euhk1QqfwGPQO1hR1bYufHbYj2
         LJY3Ap80pR9ZRlvfpTb8N0cq2DIkW30FXIQOsbkorwBKPp0J8eslQ/70o6llXbemYaZR
         uaBg==
X-Gm-Message-State: AOJu0Yx/JzB8J2b5i90eSwmdPI9Pon4e0P4IRfL9dOOqXxkLCUuHVkwD
	hkzVfnaGtbN3ivZGG4/dKzbvndXBmoVCSjeT3F4vtzUAPvupfcnwOgrfSVrn4wivx/M=
X-Gm-Gg: AY/fxX6ZipA5EwgwcF/DnKrKNegI46NHCd26KsOL7VbcmcU3rtXDySIION1zh1Q9+no
	MZAvoCezi0CSmOpas2NXxcBt1Fg/f7gRCOv0xrzLD3h+3v3LeW+iIDp3Ygj8J5+5aKj3mItLNch
	RccxI6HCjxxlSOTvHzwaWSLOhSduAUJiKGtGvPnEwWY36n2M1lXh49BQ/w4hlwEEUirzw8ix09z
	gf6O/qbRRRPPvjKui4bndFsgqadBLJI6lGn9jToMJuYR24fsXTQ58VJBmlkz3sE3OtqF15W06U6
	9RTR++ewt6AOor1jzbUw2EbbWBErxB+PjLA9JiRXAM31PgWC3bmui5TMwI8WC/n42N5wSek8i12
	06Zffcdwbkh1e189BWQQuDioH0tNuXOALWagKGyWP8Be6o4MDW0jIyuDxQ5pG8FuFYS8VvxEiJe
	Qt7p5ERuliXRAMpGwzsVLIAeOcKgXUV2ewed41DH3SuDY5zS0wO+r+MlkY+k5eeWZ21DqDrk8/3
	rvBByCZ1g==
X-Received: by 2002:a05:690c:b0b:b0:788:c22:1f0 with SMTP id 00721157ae682-793c53c4539mr12329207b3.54.1768520566220;
        Thu, 15 Jan 2026 15:42:46 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:45 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:01 -0600
Subject: [PATCH 2/8] soc: tenstorrent: Add header with Atlantis syscon
 register offsets
MIME-Version: 1.0
Message-Id: <20260115-atlantis-clocks-v1-2-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_234249_383770_CB47BA53 
X-CRM114-Status: UNSURE (   9.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Document register offsets used for controlling clocks in Atlantis

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                               |  1 +
 include/soc/tenstorrent/atlantis-syscon.h | 38 +++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 19a98b1fa456..4a2017d647b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22538,6 +22538,7 @@ F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
 F:	include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
+F:	include/soc/tenstorrent/
 
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tenstorrent/atlantis-syscon.h
new file mode 100644
index 000000000000..b15dabfb42b5
--- /dev/null
+++ b/include/soc/tenstorrent/atlantis-syscon.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 Tenstorrent
+ */
+#ifndef __SOC_ATLANTIS_SYSCON_H__
+#define __SOC_ATLANTIS_SYSCON_H__
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+/* RCPU Clock Register Offsets */
+#define RCPU_PLL_CFG_REG 0x0000
+#define RCPU_NOCC_PLL_CFG_REG 0x0004
+#define RCPU_NOCC_CLK_CFG_REG 0x0008
+#define RCPU_DIV_CFG_REG 0x000C
+#define RCPU_BLK_CG_REG 0x0014
+#define LSIO_BLK_CG_REG 0x0018
+#define PLL_RCPU_EN_REG 0x11c
+#define PLL_NOCC_EN_REG 0x120
+#define BUS_CG_REG 0x01FC
+
+/* PLL Bit Definitions */
+#define PLL_CFG_EN_BIT BIT(0)
+#define PLL_CFG_BYPASS_BIT BIT(1)
+#define PLL_CFG_REFDIV_MASK GENMASK(7, 2)
+#define PLL_CFG_REFDIV_SHIFT 2
+#define PLL_CFG_POSTDIV1_MASK GENMASK(10, 8)
+#define PLL_CFG_POSTDIV1_SHIFT 8
+#define PLL_CFG_POSTDIV2_MASK GENMASK(13, 11)
+#define PLL_CFG_POSTDIV2_SHIFT 11
+#define PLL_CFG_FBDIV_MASK GENMASK(25, 14)
+#define PLL_CFG_FBDIV_SHIFT 14
+#define PLL_CFG_LKDT_BIT BIT(30)
+#define PLL_CFG_LOCK_BIT BIT(31)
+#define PLL_LOCK_TIMEOUT_US 1000
+#define PLL_BYPASS_WAIT_US 500
+
+#endif

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
