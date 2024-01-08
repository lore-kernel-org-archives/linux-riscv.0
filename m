Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EC2C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 06:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnFKBqaoJQwdKtuFUBM02yk8wBo9oDjFVZVNebFt344=; b=ByyPN7GScmLUzi
	f82Fa3omAP+2oHxII+CwukjtpzIAgDRwEO6rQXfLJQDLCboFqSPgYNDXOZHcz7FUfGtQu+RW3vGZF
	oNdmv5KEnw/Ibr7KXhEVvDtz3pODdkblk5Rd7UIYN1QejKXW0tartkckneRc/KzqZWav3WR0C6w+k
	A2qJtkZMQxYhzTiUc2H1oHaUVcWEtQNYDLADX4B8JGXPglBDDeh8+l0OGcOQUG3Llk9JNwjbmGVRW
	Sro06Or3VoAk4HNcVmWTMETlL6N8mbrc8aN3RVZC2U+eLMktfxuP6HRTh4gNz2fSvmVlHugTDT+Wm
	oAlrPDsrh2EL+UtLPXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMjRF-0046UI-1J;
	Mon, 08 Jan 2024 06:48:45 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMjRB-0046Th-1W
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 06:48:43 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-594196f5081so234903eaf.2
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jan 2024 22:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704696520; x=1705301320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Wg3vTVI+KNNtCZ40tO4THN1Rc/sssddRQwHLFYhkAc=;
        b=Tprgw7ZNOZRDAQvwY4NZEMQkgLWrtrv3xArczVmR434mTLQ2GrhY4gmOUytSzy+SAT
         xvOrRBjf73Co/PkiXqK3iRKey2ojP+k3ArsQzygkkQAjIzh+8p4tcHOYNOS+trKv7X4a
         QamPRDGLEWkYGWMEz+onY65Rb1AirsAUF6mY3CwnnFF7qpX/+eEhUn6/uP+iCGawmnEK
         Zk/KxNMD0gn4zSaZDILxcqcjaEri9yZD89z6DdY/zVxZR06QWUGZR+59r7S36I47mdg5
         GUVudvvcsmdV9uavoNQquC64vWRgXvGmpRWSwH+5q4qF8LmV9TsZdoJNpzycsR27vy6C
         ATeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704696520; x=1705301320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Wg3vTVI+KNNtCZ40tO4THN1Rc/sssddRQwHLFYhkAc=;
        b=XpoNgrlmxZPoGpoKta/tkng7URE4wpx6113laHd0Mngt7OWvMN/Tdcm5MXqO/fEI7u
         t8qAPR0CPoHhxbsVA+5+9LKyTra3SmGouPFBk3KRUAA7ZQDhNd6PZjLW5ijygqSh9/QB
         uS1TcMfmp+XoU+y68rPO28d1McwdtXqJcyRdaQs/6dOFOFRzygK7m6/BVFwDTCPZnNVc
         SyU5uG3wUtbtpBP1cFMmyZ5lrKnTNojfxobw5k0K41paJYPawX9NdLEKqf09cc110tUp
         hDHmd+xocXuWnZnxgewvuGTGdAeoQX96CE3674l4If7YlL3h8whIgeYaHDz//DfwkdMl
         DIuQ==
X-Gm-Message-State: AOJu0YzzcM1QCW22A43pOk1mU0mznQk/czxHJZ1cJbBXwfppWg0zuTOF
	9uvlA+KXI0tUP1gzEVqewl4=
X-Google-Smtp-Source: AGHT+IHsDMinD9pZsQgqRTNdeVO7/dnheZKJycqpG6Y5mbzk5hFQQB9ZYGDJpHp2mdjeSdWmPhEAUg==
X-Received: by 2002:a4a:5187:0:b0:598:4255:2292 with SMTP id s129-20020a4a5187000000b0059842552292mr382392ooa.2.1704696520158;
        Sun, 07 Jan 2024 22:48:40 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id s26-20020a4adb9a000000b005981f6d8f94sm1038203oou.21.2024.01.07.22.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 22:48:39 -0800 (PST)
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
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/4] dt-bindings: soc: sophgo: Add Sophgo system control module
Date: Mon,  8 Jan 2024 14:48:32 +0800
Message-Id: <acebc88db3e5fcd2a2607b56842af7443a6e1289.1704694903.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704694903.git.unicorn_wang@outlook.com>
References: <cover.1704694903.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_224841_507272_F88BE0A5 
X-CRM114-Status: GOOD (  11.62  )
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

Add documentation to describe Sophgo System Controller for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
new file mode 100644
index 000000000000..1ec1eaa55598
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-sysctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 SoC system controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  The Sophgo SG2042 SoC system controller provides register information such
+  as offset, mask and shift that can be used by other modules, such as clocks.
+
+properties:
+  compatible:
+    const: sophgo,sg2042-sysctrl
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@30010000 {
+        compatible = "sophgo,sg2042-sysctrl";
+        reg = <0x30010000 0x1000>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
