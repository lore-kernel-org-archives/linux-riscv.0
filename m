Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16D6C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 20:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKWcz+agaFzsVv1NY4Z5tPlRNySZqHc/DEhvipBEewk=; b=dbKQ9ydtkf2Qaz
	sAxWoQNtyyMP+WZU/uAvncri5PaFE+rA3HsMEa5zJrEspk0LIuc6rY/pr/ljbm8RlJhB/xWZGo1gM
	0iJjaxo9BC+EP1huk78WIMO11A2UX30MEchymaMQoc6K9RITG3tIvDalBkQlOMB3vXuZbb5oN3Pmh
	hsWrOxWDrqEuIOkReSHEso46Po+qc66RRtbJxa6mcmnJoFFbDsxVsllYsWbvFcD47mgf27wF+XEe4
	HqZipYPBHfdMrgmurZwRsQBscgFejGCrIb/DMVZx56rkdqi0BUFxSJ1t2GZG5tFHTZLU6+DCxeMH0
	CWjHDxAVo7hhH4t8y5hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLiW-00Ca7F-Eo; Wed, 04 May 2022 20:35:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLiS-00Ca4q-4h
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 20:35:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id k2so3513135wrd.5
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 13:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q+pycwnKwDuKNdF3Y2w0IfQQiZ0eOLqkgeZDr/yI5II=;
 b=YWkiZKS3EMmfrCefyHqphbQyh5SswFCcaAsa0DngSr/zLNYdOi8JRAAAo7uJ1Tn9Sf
 tdm13xCaRGKdYRx0CWnG36Yc5zzbWTOBrobB7bzmYdOGjCVxbZ1rRlBVmf20YJL0rZq/
 a4PFp6PbPrsK0bXUaifCqMmVSU18OMpPIRmthwLcza06jkZB7OjUWtdPbk+O2AaOQjQ8
 Zruzet6oFpzHmMhxsNqQHfwfV4yBXG/LfqYNxURiC95CTVdsjdRo0OYYrp4lOQhkGVaR
 QiGqGDDaYVfW/tEmndVW6AqVCuHit6zBLLTxDnnkESpnErZMHnTlU36SV6bqZs5q2eiw
 IzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q+pycwnKwDuKNdF3Y2w0IfQQiZ0eOLqkgeZDr/yI5II=;
 b=L36Ua3uWVRI5FMi6aIm8KslFdSbnypwOukFaNuHmpYiQkWAuv6F/PPPJPGSRq9fV3p
 N8D3ChMGxQ/xvHAHOs5iMUijEhEwvHVGXzRV2/KOMqxQmSfIrDZrXTS6pk7u86dom0Ex
 wFvN1rJlIRPpyAuZ6EI4HAEg2GnF7EovQGkH2ea22x7FHXP24jupcBqjXTKwiUid3Mqz
 ygcqizVUucimH3a+W2TG4nECuKXjV8LSGBrteFjQJBaaxGf5RaF0txLncWMeathRYwR4
 UvP/iczhlFqOB1KqYuPoT2GbbZjGsGvxm5B4JfeRvGBOE5rh0aDol1et/7ilT7psIS7k
 2p7w==
X-Gm-Message-State: AOAM532Qz6mttdbbAASNCJ5j487yImuoFJwsBjuovNPKGFgrBLIpZ5vb
 5Gk7yujeOYEhvoHFiXnaOc9ZzQ==
X-Google-Smtp-Source: ABdhPJz925mygdEuN6CsxYthlUWASDvvEV0Pc9CThWjW2wo5tYgfu3S1X/n5dwMx9r4I1cjO+EP+hw==
X-Received: by 2002:adf:fc09:0:b0:20a:deba:8d3c with SMTP id
 i9-20020adffc09000000b0020adeba8d3cmr17798556wrr.44.1651696516139; 
 Wed, 04 May 2022 13:35:16 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 l20-20020adfc794000000b0020c5253d8dfsm13330101wrg.43.2022.05.04.13.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:35:15 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de, heiko@sntech.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v4 3/8] riscv: dts: microchip: remove soc vendor from filenames
Date: Wed,  4 May 2022 21:30:47 +0100
Message-Id: <20220504203051.1210355-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504203051.1210355-1-mail@conchuod.ie>
References: <20220504203051.1210355-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133520_221636_9B3560E3 
X-CRM114-Status: GOOD (  11.12  )
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

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
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
