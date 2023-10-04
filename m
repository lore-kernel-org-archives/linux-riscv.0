Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBA8E7C4D4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4W0JGkHbFJDLtM8eiXj+nt/oknoYmioknSOZV6Dbjg=; b=MlAlyUBb9x+o5H
	10F0ZwKTqLWmnrzWejtaltHINsNivlvc3KZxpw10HCM4RiWHq4ZdC9AT2d/P97Su1r1YHyHeZUcAG
	zfPZxVhNHKzlJwfnWoCmYSrEVe2pGsPjr9a7LYXFx0WBTt2l96Z427mx+F4sZawxhLjD80p9nGEdy
	HJpwueworBeedKpvYPZAJ560KbBBhm2X0kS3IWpXjx3gUxFhSo9F7qhYWSCam1/ZFKKRLOLQgP/JD
	57JkL2Nl1m4s/6MjGtrCScPwBNOvMwrH3TzYFJdt1Oni4Ua8yVmoab9G9yfNBMgngx2ARdWsqOSVA
	7TTEN9O3wjdX5KpfOBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo43A-000OWa-2y;
	Wed, 04 Oct 2023 15:44:36 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo437-000OVg-0e
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:44:35 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-57ba2cd3507so1305746eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696434272; x=1697039072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEYw2MwRgnbPGTuXNbUSjhb+9OMbJ8g3XCkSkGYa9LM=;
        b=XUHbDukZzEBSB11vNPu19jSSt0pxKq0L4FyyfqrQUbJFFT2ZbbeR4S4xjUxfptOFP5
         p682OT8ltUDtQr+B9VYfuZ1xgSNx7M/29+s/ujt0JXjJwNxime9dw6jEGmzuXM/9FyK2
         3wyAHPgMomARSdAeHo9AktpEKw6fDmUb4F/O68c/kaZjQjeVj4CQMTkONaFF86/2sq9M
         VO+c8nyGIeLT04E3jU6eQBb8GhIbQvv/a6Yp/LH0gROy9+rqvCYUnCq8oQ1FWKqJdzfn
         7Jkv7NIFfO0Pn3B/EfL3VFccRQm0xAFOCP535Q7xK6kLvwX07QJn0cjT+/LxTf9N1O+Y
         JVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696434272; x=1697039072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEYw2MwRgnbPGTuXNbUSjhb+9OMbJ8g3XCkSkGYa9LM=;
        b=tSubJfHJEc+hzN1pMaJnd6fqgCt6p/Hod6de16jF866gkw7JGCKCfM9JiZWn1F8Itz
         ZlQv+hxWPEVKZYTZfPWNFnXloIz+kpooxL1QWbCBLfDErbXgy4/PZgYXkG7yAbRgbp8E
         xELGan7ERYCHqoNmr4BnfFtNKz7j1087IJCguVaDFirv3/GRJgdxB2XsVbWD/1Ftoeaa
         ansvCeYSGdiTVJRcZg2T8ZLACA1ZjWWpGilJaYFvQk0gZ8+OYLpWFZ/q4phcPdDFpl7v
         QHeALzO5iMr0ywcdksU+eZqSaIfRcANUhprOWnz87XUjiPjj+W8B17e2bq5uDEERdbuy
         Cvyw==
X-Gm-Message-State: AOJu0Yzw1+KR4ROBDibLPkye8lU0kYm4CKpadQaYltO/YE7NJWxJfD42
	R8NjGg/ZsWSx9pjXaGa6Fzc=
X-Google-Smtp-Source: AGHT+IGwxMht30LRWeQkhFmIXPWfU23TWH0ZTFV2frJ2G6HIKcbZwDKeU6DkkHGrz2R0nrFioeVCZg==
X-Received: by 2002:a4a:8081:0:b0:57b:6a40:8a9e with SMTP id z1-20020a4a8081000000b0057b6a408a9emr2314916oof.7.1696434272377;
        Wed, 04 Oct 2023 08:44:32 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id q74-20020a4a334d000000b0057b6bae1e31sm673615ooq.7.2023.10.04.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:44:32 -0700 (PDT)
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
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v4 09/10] riscv: dts: sophgo: add Milk-V Pioneer board device tree
Date: Wed,  4 Oct 2023 23:44:25 +0800
Message-Id: <9a5b3499ad6ae76d1dfccc6f9cf5eb954e2fc2b2.1696433229.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696433229.git.unicorn_wang@outlook.com>
References: <cover.1696433229.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_084433_238744_595807E1 
X-CRM114-Status: GOOD (  14.90  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Milk-V Pioneer [1] is a developer motherboard based on SG2042
in a standard mATX form factor.

Currently only support booting into console with only uart
enabled, other features will be added soon later.

Link: https://milkv.io/pioneer [1]

Reviewed-by: Guo Ren <guoren@kernel.org>
Acked-by: Chao Wei <chao.wei@sophgo.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
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
