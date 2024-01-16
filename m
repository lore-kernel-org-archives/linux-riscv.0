Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B349FC4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 07:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+swFqyJwMQxLwSrZdzTv3MV6/OngWFnQM0j/bzY/xU=; b=x0ae2YVycK/HJv
	kB4l+fYurb2+RtvLnh57DgW7Tp9xt8orQ5EX8RTxU0tAkFuisRq23bfEFziuTy3LT51GTIXc9TG8D
	EEWaZU+oLelHpdQwawdSAE7c/CYk7M8R662MtMhZq6BaUp9tQKaVFDElFMD9+qmFEz5ChL60aaFEg
	xEolotshJxf9q1hQLSlhX15kbubXYwLUpSpFC/t6Od/BInkNLWv2DaPyiMEXpDQf6BNjecS9njLYd
	9DvCXBCufPuAfDoexbuYcHtY1GhkHpKtr2QfLgVqDKPsIc/wnARbBZqeJwwe8AuATZB5c/U7m6dqp
	NZ7DiMX0U5zoIWaXiSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPdmI-00BCFb-3D;
	Tue, 16 Jan 2024 07:22:31 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPdmE-00BCCt-0P
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 07:22:29 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-204520717b3so6645366fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 23:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705389683; x=1705994483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXfVxRdbpg0Jjrtfyh2r9z1d0R31xJqLPqzwKtIlUvk=;
        b=PsA0JDOjNk5KxzetqMfQzvxSVGOMGqAb+Z7Hr90B6wF7U8hrjiJ2wi5JtnvUHBwIIV
         Ue7zoB+hCUGtRLBvLO8hLTyl5+j2Ckwr4A8B1JQdgN61THI/CRuu4/tNNMM8MxtZW9gS
         Ebi4reyEWMNLrBHcR3plSH0tj9hHmN3+fwORRFjXsgvTgEfUFH1hLPqC6J0R+SM6B1jM
         w2A3SwrYS0JiDQPnLXR+vhyQkF5CwNlo732JdRbQayKZTzn/BYk6wI7Wt3i4B98x/5Q2
         8WoUEti6mmM3fgzq8B5uKP57ZJgAVM7SB91jKGf+lOLS2yhbZt1F+ezDzxGWb6mUp/R3
         E6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705389683; x=1705994483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXfVxRdbpg0Jjrtfyh2r9z1d0R31xJqLPqzwKtIlUvk=;
        b=VM7tjXWKQrQtERGONMAzF3r0HyfSSccCA5iikH3zQnk1EEqpj141W9OjR6pbyrYtPB
         M0nQOvkqCfSQi9GzM/7K0Wodh3Xrme6/unyxlIGQy6m+W2dHu19o98eCP46O6KXWGMtG
         1kX72huqh50tRERgt1Nuhb5oijJdlY01mdmfw9bqr8NANlgF/VudPyp7nTtrhPwFHcJc
         VoMlXJFLNbNVrDmTKkojTcgoYNeqg/SK8dW+YjqMfzUGKaYepQlQhuBw1M4fgNWrVJIi
         YnCbGZGOZToGsA7n903VHFH3hXBLtLktVE5y0kkWrdLOK8aPC0lkJdaTIMsY8+mk0PnX
         5fQA==
X-Gm-Message-State: AOJu0YwOLMdZ7GP1icNnlz51ftbMK5v7fixA5SSnxbenlQimXz/6Mgg1
	uLpoEeKaloJaAPgZvq18E6M=
X-Google-Smtp-Source: AGHT+IEqnaLXbDXCKsVUX+dGxbBp16mJ7jqRodrtJ/NsEB25oY5Lw0WW7mN4rWbYMPov1atd2HQ2RA==
X-Received: by 2002:a05:6870:a10d:b0:203:e9cc:486e with SMTP id m13-20020a056870a10d00b00203e9cc486emr8835946oae.107.1705389683421;
        Mon, 15 Jan 2024 23:21:23 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id ds13-20020a0568306c0d00b006e0c65ba0b4sm253289otb.13.2024.01.15.23.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 23:21:23 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v8 2/5] dt-bindings: soc: sophgo: Add Sophgo system control module
Date: Tue, 16 Jan 2024 15:21:15 +0800
Message-Id: <598b1026fdf9989bc48e5e10d1034b37947d3b80.1705388518.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705388518.git.unicorn_wang@outlook.com>
References: <cover.1705388518.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_232226_163205_32F46C53 
X-CRM114-Status: GOOD (  11.91  )
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

Add documentation to describe Sophgo System Control for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
new file mode 100644
index 000000000000..7b50bb56b4cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-sysctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 SoC system control
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  The Sophgo system control is a registers block (SYS_CTRL), providing multiple
+  low level platform functions like chip configuration, clock control, etc.
+
+properties:
+  compatible:
+    const: sophgo,sg2042-sysctrl
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    # Child node
+    $ref: /schemas/clock/sophgo,sg2042-sysclk.yaml#
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clock-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    system-control@30010000 {
+        compatible = "sophgo,sg2042-sysctrl";
+        reg = <0x30010000 0x1000>;
+
+        clock-controller {
+          compatible = "sophgo,sg2042-sysclk";
+          clocks = <&cgi_main>, <&cgi_dpll0>, <&cgi_dpll1>;
+          #clock-cells = <1>;
+        };
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
