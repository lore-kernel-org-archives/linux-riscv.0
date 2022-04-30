Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870A8C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnhFFS6ReEIUxoCnb2OS5GmO4f5WBhA0ZXIJvXkmrqY=; b=zJz8e7P2DlpgAY
	05dvMZ9vOBd8mfirXVx8JVp6x+w21EjycFz9Kr1H3io3xX4DP8DQ7/IpHcnUIBnR8Rc2Uph7gQob0
	9rKwhWU3OGKrNer3Aq1QBSHZdGpFg/ZKVQ387BtBHx2DiF0v14aPGahpGpWwD9zit3uX4Ae+qCZ27
	4Dw0A2zmKD2oaEcz/YpqDDgYYkTiQHxC3vFp8bP06+aLxIpbNgrRx1kWSXtFVHUsoHZ1rj2qWLb72
	BykvABko9p0U0MXguL29osnxueHnakVWHJPjB8Qy0Qvq42aEaeDWwmQpR66jiDthCjAa8xLYq5Qgq
	Iyix+y9Yiis86iqb1P7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkmuJ-00EJQB-FJ; Sat, 30 Apr 2022 13:13:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkmuA-00EJLB-Nw
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 13:13:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id k126so2585188wme.2
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U51TZQhHKAPu6F0ygHwpPoWdzkMjxCa4kGnNd6Hzk/o=;
 b=b0NKL9VwC3e8+DspbbgveqAFU8bLQvyX69E9r037zGadc4FwpXgqITKvvl+0SX57Ju
 iyd2yvK458NMGSY35dGv+++xES/M1jS4JlNfGizyR4RATqiId3ETfHip/UjmZYM01zIq
 ZUALlaJYdOdy0lFYEeOz7P1F34Z23Fh8y8AgDcP1xtsLq3h3SDRmczx02MN+TIKrhcr8
 Zr3jtMzfpdO3CE6ZQO5CrsRbsJ2N7pRxDf7S48XXzKPKusBmNKR2NPAwiwZ9vochTqjP
 +4W3DBHd/+HWnJhjnMlk/89d1UXC9fF29oBpkmilBYu2uYeiHS/VI6wFnvTepFO2KT6g
 6c0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U51TZQhHKAPu6F0ygHwpPoWdzkMjxCa4kGnNd6Hzk/o=;
 b=AOPW8tU23Z7msc1laP2nWP7YBTTIJhB0bazyS77ZqZwpL6lZ428TRKXvKRcvSwMG7m
 KS9eK+10rYk6ZXieKv4P4Ds1cJ8iTmO2NglZCm1q+dChH8qsapUBj4hI0kgU4+vFmFXS
 TM005F5sBQkLGyEC8FWIA9CLQMcC4XgVcNqe2SjCS7JJBzookJz9YBCFxtoSrq60WYOA
 0oeOZcVz38oo5lD1BCjTsR5SiQ+1K3Gsj+IZx6iJpAeg8JERnNcG5bl8vx9fpago9oIl
 KPmYCBoJ2m9792JpCp3uW4MW4ib8fZiYRuKBPmOP1xSf1y8gP+JUV1gr6QHkwZ2vS7qV
 NpDw==
X-Gm-Message-State: AOAM530xI1oh1cPVvUTLedvlPiJ1NrYzHUlZ95RhRt3rz0Ij68xDPGGx
 0Q9kx0vumeqX3YjgO1Q07dSySg==
X-Google-Smtp-Source: ABdhPJyhZkGAtnEZF26eRlmNAzd28Gd/+hWFcNPXa+U5piOfk+rl/XVZsDmWUL3JznznT7nfvKwsSw==
X-Received: by 2002:a1c:f018:0:b0:37b:c13c:3128 with SMTP id
 a24-20020a1cf018000000b0037bc13c3128mr7518375wmb.157.1651324376333; 
 Sat, 30 Apr 2022 06:12:56 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfa209000000b0020c5253d8ebsm2004439wra.55.2022.04.30.06.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:12:55 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <mail@conchuod.ie>
Subject: [PATCH v2 3/8] riscv: dts: microchip: remove soc vendor from filenames
Date: Sat, 30 Apr 2022 14:09:18 +0100
Message-Id: <20220430130922.3504268-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220430130922.3504268-1-mail@conchuod.ie>
References: <20220430130922.3504268-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_061258_818296_753B8D3E 
X-CRM114-Status: GOOD (  10.84  )
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
Signed-off-by: Conor Dooley <mail@conchuod.ie>
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
