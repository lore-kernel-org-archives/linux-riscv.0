Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CE2CE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 06:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS8otpbG/zjfgkopHou30z7VroOMnzCddK0cmre7gx4=; b=ZtoHTbkyjEL0Ti
	d5xSZsIWYBHym+g/YoHE0kawGdCl4kAQEN0RUeuetdo1TXt34SJaADQsVTJxqVWpmillVXIobsirE
	dWyAS1R/wWR7NGlqKylhNZSJVcCaNmixr2o61JAA3iZhuoxhco4qCNT/F7bkjogvI8VKPx6/eFVJa
	Aaf+m6P9OfFqC8e3ft2II2Xj+oWl8CNkR90uBG3LW0uYBurMbS1Q4TXud0LcDoR7Rerlf6e9pzCPL
	y5aswxoZOk9w4V3ypcsTAvwo6z24nNijhe55i8c8+OzdX6N0v8Y9A7wkhrsRdetvVq45oUSAthsYp
	eMNlEcoxwS2rMx5uNIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqtV-00237a-1v;
	Wed, 20 Sep 2023 06:41:05 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqtS-002361-1S
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 06:41:04 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5733710eecaso3830057eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 23:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695192060; x=1695796860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yveMbLv2+NblyHjS4ZDFugIb595kXowdDQelFhwmBqc=;
        b=FXxVf6gi0lQH8XFegdC/SAWdUoX1u6z8XKs3rYZ2UDINsNul/1T9bJwnhLdoNJHbCg
         RP5JzpHaikrys+O6SB913ODPV9i629fJs+TEYuNmmqdb5tC5F3+TyRxbl91xj3JG1+27
         u/NXQkoTm1fntDCrb+ruEJ4ksjHru4FFBbBAASijAD1+6+vjFyGmMPmf7gl8hD7IsNhk
         4WSu/eFmVmI0b3TszUn2SgvyDUE4bGFEnJwDqNN0HvVt9BtQXrdnwzRBEk3fPY+rarrU
         /CSuDEM0m6tEpMmIMrwgrPaBQdYkhtcNY4smf/aurJo1ikFrXLC0XaotU4TutB9BNlSs
         t84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695192060; x=1695796860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yveMbLv2+NblyHjS4ZDFugIb595kXowdDQelFhwmBqc=;
        b=ZTsZmwQ1vAZshPAKDh7LBHn0ViuA3KmgBhtSraoR97zG06ygfq0u5L98H0Ph9Yic1d
         DEDPXgg3JL3TzKLRkyQkLW55zv76O++fpFcWMtlj8fDK4ZXkCrBLP9+mc+yf03WzxCMm
         x474eS+4B5z/p/ou0PBEwRKJA0ND1+T98f45a94y3olrWJ43zNkjSuPQiykcuHKWLd8L
         qCK0maZ5TNT4e4zQfAy2lPDDH6WdZGP6K6lHctmHOboPqBl53MAPEnPYK0FtIw45WQkS
         5p48u4YplsmxvsTs9xCe+B3A5A4ZkEiHWJfzxIzRj6KRljCMFPUoABiUOyf0Hp/y0q/+
         0qIg==
X-Gm-Message-State: AOJu0Yx2fgcY+bBPQ0LuiDtVyGVtdpnSpAG1iZsblMIczjk2Ip9y90PM
	WOaESD5WuLkbOLttTUu+Fxk=
X-Google-Smtp-Source: AGHT+IHpXiDlyuVx7CkluNKS075+3yRXcB1SfrU4WSQUnbNKNNVlL7D1VCjygFqYQjVrgIRXIbOxeQ==
X-Received: by 2002:a05:6870:658b:b0:1d6:b404:a50a with SMTP id fp11-20020a056870658b00b001d6b404a50amr1671312oab.31.1695192060592;
        Tue, 19 Sep 2023 23:41:00 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id eg50-20020a05687098b200b001db36673d92sm2220744oab.41.2023.09.19.23.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 23:41:00 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
X-Google-Original-From: Chen Wang <wangchen20@iscas.ac.cn>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v2 10/11] riscv: dts: sophgo: add Milk-V Pioneer board device tree
Date: Wed, 20 Sep 2023 14:40:53 +0800
Message-Id: <e9ff83e4fac9a9ebd217ef10e5f8d3260342102b.1695189879.git.wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695189879.git.wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_234102_488335_4455FAED 
X-CRM114-Status: GOOD (  15.20  )
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

Milk-V Pioneer [1] is a developer motherboard based on SOPHON
SG2042 in a standard mATX form factor. It is a good
choice for RISC-V developers and hardware pioneers to
experience the cutting edge technology of RISC-V.

Currently only support booting into console with only uart
enabled, other features will be added soon later.

[1]: https://milkv.io/pioneer

Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/sophgo/Makefile           |  3 +++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 19 +++++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/Makefile
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index f60a280abb15..94788486f13e 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -6,5 +6,6 @@ subdir-y += renesas
 subdir-y += sifive
 subdir-y += starfive
 subdir-y += thead
+subdir-y += sophgo
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
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
index 000000000000..d6e8c0285d1e
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
+	chosen: chosen {
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
