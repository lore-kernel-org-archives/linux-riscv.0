Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55102C4321E
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVgu8OEY3Nwh7MQd1np3VYkk1MGSQmMWS8jwYksTLG0=; b=l50ynqVZ77zxWc
	r+GtTfbr6im9fGFgpGrKrahxvTvVfJj9bjPdgb5NdS4Lgpq/1ATbFPr/rF+73te10BQeI1y3UPVep
	+pxqDP9aPPgcb2Hgtl98c9Ce1y1MLvQq9bYVGIQYDGxTOTNqQ2IaRkFFGniFrdwfKYUaaqjtMjJXf
	nP0plDSRFZjtKzXNQdUK36q7iXPJRPRWEf/116kA4EqgUUKCEaNFnr3BbpyLbDM40cantfyvoEuwo
	4zjpVRy58heC3Xet2RI/pKUjLQf0QBjwjJxPM65EFDwrFas6jLb7tKPVehxC7W0EoZPs6vrH9IVn+
	EMVBQ0HuzpZqoHD0EsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlFDM-00GnIu-Ht; Sun, 01 May 2022 19:26:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlFDH-00GnFH-Lp
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 19:26:37 +0000
Received: by mail-wr1-x42b.google.com with SMTP id t6so17243496wra.4
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 12:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6W8mGDi/93K2kk8QDtCgHIHZ3boVF3yAi62LdfvdHGI=;
 b=z705utCZ70PlQa67japtrig72flqPdJgJOKkrHueq5Iw2c9SpNq+cIMxweQe2GEYEj
 shYp2a2Iw26H01P8fTOtJpjxwucUqcqc1Jef2vnQ/IUDGH66DYW8hV8L8DsTo4IRCSqN
 +dQ36SXZfQPi27IUXhVP2tcM5rSRVQHH/IGu5dNPgSDs7wfObKs2tI8tFCvb2FoyFsgZ
 rrSxwxbA0x5dXLYnuma1fKl0fRvnfMsAOhXhIbBbzy77f49AdV3zRACrX/irUrC6HUQu
 KcoFfwSkiSwvp7kyK4S3z1Ks5zOhqreoRGja0SyJCxKjlDVZXbsvlPfMm0OZ9ZlBqpWD
 mezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6W8mGDi/93K2kk8QDtCgHIHZ3boVF3yAi62LdfvdHGI=;
 b=uvXP9izxIMKE+c7HczBfOlTb2aRUUTiJYIg1LvMFz0RJ5R+vgsh8YKDoknULmAhQBD
 LaYWONhiUui0KFkBoIAky/TqWbJRNUcWIu5QNPsJnSAIXVj9Uf6WCDdDtQP3cIxGNXAi
 OnsSEhiKij8HDIV/jdWA5Ns4fGhphg6ZedqWR+1MnPCKBCbhsuy9QjOfCYw2l9k1KPrG
 LiDc7KVXeJN5wyA9k9E+0c/CKBVta2OfRd5H9+oxo+VRqGFR0oNPO/qYWO03fPsnvhcp
 S4tcUN6DzP+xdYwhT1qNO8JJzKy0GgktM8GCZlAvdudyk/sCImskNFnVkHkmgKdKLfcG
 V2lw==
X-Gm-Message-State: AOAM531quMh90kNMxzwCW4zATUNcG5JAvbfEf2OZhuFkFTPYxUqVJpAn
 y1onIebI4+vo9wse3h/eTaYMYw==
X-Google-Smtp-Source: ABdhPJzktGGFVqcfOs/yVESY98mBaNz3iD17f8nMMsgMFe5Ky+S2e2dB9zIM3ZVQuf3drq+RAsChrg==
X-Received: by 2002:a05:6000:1848:b0:20c:5e07:f75f with SMTP id
 c8-20020a056000184800b0020c5e07f75fmr3031026wri.678.1651433193050; 
 Sun, 01 May 2022 12:26:33 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 i14-20020adfa50e000000b0020c5253d8c6sm6448105wrb.18.2022.05.01.12.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 12:26:32 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/8] riscv: dts: microchip: remove soc vendor from filenames
Date: Sun,  1 May 2022 20:25:54 +0100
Message-Id: <20220501192557.2631936-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220501192557.2631936-1-mail@conchuod.ie>
References: <20220501192557.2631936-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_122635_801988_3D09BD55 
X-CRM114-Status: GOOD (  10.61  )
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

Having the SoC vendor both as the directory and in the filename adds
little. Remove microchip from the filenames so that the files will
resemble the other directories in riscv (and arm64). The new names
follow a soc-board.dts & soc{,-fabric}.dtsi pattern.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/Makefile                          | 2 +-
 .../microchip/{microchip-mpfs-fabric.dtsi => mpfs-fabric.dtsi}  | 0
 .../{microchip-mpfs-icicle-kit.dts => mpfs-icicle-kit.dts}      | 2 +-
 .../riscv/boot/dts/microchip/{microchip-mpfs.dtsi => mpfs.dtsi} | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs-fabric.dtsi => mpfs-fabric.dtsi} (100%)
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs-icicle-kit.dts => mpfs-icicle-kit.dts} (98%)
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs.dtsi => mpfs.dtsi} (99%)

diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
index 855c1502d912..af3a5059b350 100644
--- a/arch/riscv/boot/dts/microchip/Makefile
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-mpfs-icicle-kit.dtb
+dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
 obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
similarity index 100%
rename from arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
rename to arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
similarity index 98%
rename from arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
rename to arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index c71d6aa6137a..84b0015dfd47 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -3,7 +3,7 @@
 
 /dts-v1/;
 
-#include "microchip-mpfs.dtsi"
+#include "mpfs.dtsi"
 
 /* Clock frequency (in Hz) of the rtcclk */
 #define RTCCLK_FREQ		1000000
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
similarity index 99%
rename from arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
rename to arch/riscv/boot/dts/microchip/mpfs.dtsi
index bf21a2edd180..cc3386068c2d 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -3,7 +3,7 @@
 
 /dts-v1/;
 #include "dt-bindings/clock/microchip,mpfs-clock.h"
-#include "microchip-mpfs-fabric.dtsi"
+#include "mpfs-fabric.dtsi"
 
 / {
 	#address-cells = <2>;
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
