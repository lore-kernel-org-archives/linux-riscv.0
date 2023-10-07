Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC84DE92FFD
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 07:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERF6hJk0aqeFLlvyVYfHVeh00YSOGosEkWZt2toh1UY=; b=bdnI0B0op+BQIS
	NaVmjayR1tPtfNI2jE57fRa9Wxg8q5jqbOLoVa1fT68Gxh3jfixbeIJ+dQL3dQnfqnDpOVVf8dTOy
	PLTNh66i7R6Ewldmq6NRdRLsaYbDtYJhDwsdtOePvQbXKDX6hk5SiExCRAsHcr06Jyt6Y0KCSSE83
	pFa+BYjiL1qSscYkab3AHSPbD5fTpArl42JJx/04IsZ8GizyQlJcL+7vgKphP9ILuXXnp6YOJwaNi
	9yht75qiblL6t+fCWSbkwLohIdwCmnBgO1NZJvTf1DNQHVd2ChisiSkbpavenQR6oUHrI7kw6PghY
	lmvEKvVUZ9Fn1Zy3+HkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp2Bz-0079Yv-1D;
	Sat, 07 Oct 2023 07:57:43 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp2Bw-0079Xx-1h
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 07:57:42 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6c4a25f6390so1886823a34.2
        for <linux-riscv@lists.infradead.org>; Sat, 07 Oct 2023 00:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696665459; x=1697270259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSE2B0Sk0lNGKGqCG89tJGLae6XeuqHUYjO2VhHq1Fs=;
        b=iasDL+gUdx8GciGIw8WU+AdqufsBHercbNY6b/EG17RqscC5ovfzRV44bNAN7ciZeK
         jKv38/z0VSnOV1L1OPfmUw8NAo+yh3TI8A7e2uphSal7gZXSVtbLQidLr1vd+B23EvOW
         JCsRtz97roUiZVozaZSnvHr9TTF00+cNLl+l/YKmmLEQb33mu5FpdqEjWOhZGbTclT/0
         yTLn9akE3aI4USirS5YfzOBkZZ0hdhhDNf/MhbvkqyPmVQn9rd52vCA2dgfRLyQoCJSb
         nls69RLgWeLZu1SDU1R0tFMkPdbMugBj1CBBlUdpy3EUDzusAa6QhPORake+9BkYQ+p5
         fTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696665459; x=1697270259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSE2B0Sk0lNGKGqCG89tJGLae6XeuqHUYjO2VhHq1Fs=;
        b=WpdUeuhvBrt9GGusG+EtN8gbcF4kfPnIUqTM3IGJq1lqpjIrR6JbkjPHR6h4EmQYz6
         6KwCxFG/g3tooW+E1TonoTVo9KOMsGZcUMMuikHjheTqZGJTmz1Rd6OQbMvyAORApWRa
         izyxE/uNtN0FiYtXr6YXzsj3pl39rzEClI1YZChuMLaqk6VKi+IHjL3fT3Z6/W45GzGM
         p6U7cl+PaCMjZLNeRqyP2yTeCacSASW0MzDEVSgR0paGmK4h99h00/UVjYGrPtgV11wc
         uloYdqI/Sxc3rXfQXY9nH2OMoexNqhk1yTdZhaZ/pExv7dCn9A2dgXwAdFLPjCHTpgnS
         ekhg==
X-Gm-Message-State: AOJu0YwnVICByuJZbSIcWgyZ2sMZTQrefW+j+m9phnz0RtitnxuP3Tjz
	4uNAxsksG0737ytGn1efefQ=
X-Google-Smtp-Source: AGHT+IH0YQ4jRcVV2vj9RcB6/hAqQBZjf+EhgANAHz7njIewApQMsD8jlshmfOPdLKOLkPvEf9pBTw==
X-Received: by 2002:a05:6830:1d43:b0:6b9:a192:aaf3 with SMTP id p3-20020a0568301d4300b006b9a192aaf3mr10541851oth.17.1696665458914;
        Sat, 07 Oct 2023 00:57:38 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id b26-20020a9d6b9a000000b006c0d686f76esm831294otq.63.2023.10.07.00.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 00:57:38 -0700 (PDT)
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
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 09/10] riscv: dts: sophgo: add Milk-V Pioneer board device tree
Date: Sat,  7 Oct 2023 15:57:31 +0800
Message-Id: <990193b3a3f3d7854d4d652a034fd33cd759d33f.1696663037.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696663037.git.unicorn_wang@outlook.com>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_005740_566403_0FD88B22 
X-CRM114-Status: GOOD (  13.73  )
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
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/sophgo/Makefile           |  2 ++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 19 +++++++++++++++++++
 3 files changed, 22 insertions(+)
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
index 000000000000..73af15f42ec2
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
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
