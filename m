Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F52E810A8
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 09:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxIoMP7cgjkEllvVILD+43ppKcvew7mz+cQqP/wn+qg=; b=J/CTM2cEeoeICH
	mMtQzHq+O3uGehictvhihsRHWtrcDDjXG0rUgxOlGnHi0HaKjKnTvu/9ZviEj3oqYMg9x6BTZJEe8
	t+Ide02i64+bCSujWuoKYpJXQG0ZmiRcBAr/sE/z92OjLUYET0Nr4FyGX5j4QCOFpE9vlSLKbY80E
	yM5MEzmkrn2SzU8CtUonNzzzU9hNucf9mI9ShcKXgQCySLW6xFPBjc60kJ7+u2C8yM8qijA4tRSb8
	/byb2fdKSm/cA+eY5XeNEbtGDxoJs2NxNHOy+CpTZvpDDgMJbQzsNB/pFwAJtfbEYf6Z1NgxjlYmI
	ZdWoM4Se//rre7kBv5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQRb-000Q1A-0Y;
	Wed, 27 Sep 2023 09:02:55 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQRY-000Pzx-1y
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 09:02:54 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6c0b3cea424so6151169a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 02:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695805371; x=1696410171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDfODZTn111ZZ8DX98LZ4K1E0ZmX3dAdVwjheRuwzs8=;
        b=eat7bI9fgrm0Rpq1/RMMlY9dWf1tuC1P056zh/5M/O010POTUrC8GGJKMc+RAis0bS
         cZMhG04/XqaR/XRfnK3wwJVQVoZMgswwMXcs4qrY25xI6WGSeKZLLT30/s1GWPKCe2Zf
         JMqeb8snEvi4clfm/CZ7P+CG+JwMc57DctvES9GiuFLR//TaqyyIel6fd5didsLOIzeQ
         +agH6fBa++U5OIgWUKADrvMo85vPMwJzjHNNZR302Ad/idEMl1x1/c3xs6bBhYKElMU0
         PbvTubJ6uZVXlKS3wt5jStsAnZiEoM6M39lrZS0aJLl+fNGF1ct8DMppwsD9vkbM+ZFs
         LTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805371; x=1696410171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDfODZTn111ZZ8DX98LZ4K1E0ZmX3dAdVwjheRuwzs8=;
        b=gFHmaLGtf+rcTMJO5r5+ECY4IhfVIE3kxmhMHiwqQsq93f9TxcvuudwpFHVtXJRPDE
         UOLW8+qM9Qztb59w0Hwf2p+zEu3Cob95zqrt6KoYZimpRGpkbyU0LtG2ErBn38p7Mpyl
         xptJ2tmdDgeVAUWXZHySLoStM18IJd/fplaxPkfg4gkXR0exYqYDkrVpXVpKL7KXNaXw
         X3vh990qyy87VSxKyUsrBpqcodFJNfIl7Jj8JJljhbFyw2zw5rK4KdgVft1FUT4xTLkQ
         hyiXcfEFpsTawnic6+NBjfbI7Wnr0ARcCX6SbdFilOCXyOe8moivXvkhXuMZMshzJoi8
         v9Rg==
X-Gm-Message-State: AOJu0Ywcb+NkyzRRFYIONzI4/wzbgbep+gErS7Pk/gGBV3BeCN7SyRAl
	oViCOtr5YgiGwcbjWtU6xcM=
X-Google-Smtp-Source: AGHT+IHIjzzQuh2yLkWHMREiBgUch5rTTTkz3abO07HnClhXdNoZfEzboK3+7hF2NH1lllXbKbVsPw==
X-Received: by 2002:a05:6870:a693:b0:1d0:f5bd:6fe with SMTP id i19-20020a056870a69300b001d0f5bd06femr1726827oam.50.1695805371567;
        Wed, 27 Sep 2023 02:02:51 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id eg46-20020a05687098ae00b001dd17c5356dsm1369946oab.11.2023.09.27.02.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:02:51 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicornxw@gmail.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v3 10/11] riscv: dts: sophgo: add Milk-V Pioneer board device tree
Date: Wed, 27 Sep 2023 17:02:44 +0800
Message-Id: <e094732421d7f3ec88c635ef54da65aef8665874.1695804418.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695804418.git.unicornxw@gmail.com>
References: <cover.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_020252_653863_D2695042 
X-CRM114-Status: GOOD (  14.99  )
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

Milk-V Pioneer [1] is a developer motherboard based on SG2042
in a standard mATX form factor.

Currently only support booting into console with only uart
enabled, other features will be added soon later.

Link: https://milkv.io/pioneer [1]

Reviewed-by: Guo Ren <guoren@kernel.org>
Acked-by: Chao Wei <chao.wei@sophgo.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
Signed-off-by: Chen Wang <unicornxw@gmail.com>
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/sophgo/Makefile           |  3 +++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 19 +++++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/Makefile
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index f60a280abb15..72030fd727af 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -4,6 +4,7 @@ subdir-y += canaan
 subdir-y += microchip
 subdir-y += renesas
 subdir-y += sifive
+subdir-y += sophgo
 subdir-y += starfive
 subdir-y += thead
 
diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
new file mode 100644
index 000000000000..5a471b19df22
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
+
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
new file mode 100644
index 000000000000..49b4b9c2c101
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2022 Sophgo Technology Inc. All rights reserved.
+ */
+
+#include "sg2042.dtsi"
+
+/ {
+	model = "Milk-V Pioneer";
+	compatible = "milkv,pioneer", "sophgo,sg2042";
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
