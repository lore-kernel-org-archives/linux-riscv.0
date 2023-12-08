Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE181C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 01:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnFKBqaoJQwdKtuFUBM02yk8wBo9oDjFVZVNebFt344=; b=bxfK9oLZ5RHoVE
	R3BA6zrZ0EtyZfH38EDx5ZKuXXBK/mSp4z9TcXvGe1Cmh2DcQmks01Bv914X5Wquk8/i1Oklzq5cH
	q2ReVHyjYM20avuBJE+gDWqUDDxF2RkkbVDkkOBw1IFKmCx0SuB/YgZh11BM3DvWGaNe7xaKKC7CR
	B5aEFKZUd3qOE5DroxfGYrDJynu+Y61Jgrp7oZOyaJmYs8h/fxqo80pfH7pNvFLzemG7YZLzoKZ4b
	rKLX3Uk2sm8zZKovy98DmgI8Y4AHinkBKmreO0T1oAXILnE+17VObEMyTBVGw7LoMMOJrk+lnxk/2
	mP18AP72uADTxU4f+Ubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBPR1-00EQvb-0q;
	Fri, 08 Dec 2023 01:13:43 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBPQy-00EQuX-1c
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 01:13:41 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1fb06f38df0so1054501fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 17:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701998018; x=1702602818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Wg3vTVI+KNNtCZ40tO4THN1Rc/sssddRQwHLFYhkAc=;
        b=g5b+MU54NsZif4d5mi7qjWVws2mMKD6P5pf6O2PyQbozIAYmtXEtMaE3oBGcyRzhlq
         SNr5fVvEFORR8k0RTWOG1Psh8u0S+OrmffXTu8FMC1TCZlVKPbFDg8BvHoZBpdcYmGqU
         B6nMlV9EWKo4pvw19ggn5km0GrvJIpJlxhpTUyjHPJG0GV53ufveFiptEkQd9LChEAc6
         kx06EQY0sUQHyeyeVTkrvdfAtLxyc3iczR5TM0OIGBkllBAlIzihLTMhH1/stYO+Kpkj
         C12n8SBpA1XmLqBpNg6o4H/gzg5zezjeijCm1Ir9vrh4LF4HPjkbMGBhkCZyd/2+L1aJ
         UU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701998018; x=1702602818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Wg3vTVI+KNNtCZ40tO4THN1Rc/sssddRQwHLFYhkAc=;
        b=g98937R7ptDXJF2mQpzNBvOUI/J27wCl1vMDf4T4HhzaLlWVosHp4Excdhu4UDXJoT
         vCn4b2VfxCg8pIwGZHnUsbb0wXhljb4D6iBc5iu8tkicGprMrs8oN9gMQbvvvgcPcF9x
         3m42wR4eGMYNtt7JZjJ64X62ZUby5wW8ZwAtzEhdPhfoqyhB/VO60xFqnpxlAdaP+EQe
         zyb/nvJrrUDbGheJZ3Hpe9DoBSsKzOMVydTgMGUWKY24nGE4MRFGonxN3RsoqGrmbvm9
         0FUM6lwS1A2djr7D2vPCIJlKpk5TNjfG2o3OB8RFPnWJv5PFkb1itfsOskHSD2WYh9l6
         mweg==
X-Gm-Message-State: AOJu0YzGSJMWe/M4q+VSik3g85qeSY3DwiqbNUiNlSIia/7PUeruKScE
	7zMCbpA2zWPg+FhrHW72zGY=
X-Google-Smtp-Source: AGHT+IHq3XNbApiW/rK14kESG46BbbOrCxC7UErCs/p6jI1ZvS2KI8wrN/V2ZOh5nu1uGZkHDIM5VA==
X-Received: by 2002:a05:6870:a798:b0:200:4d66:39ce with SMTP id x24-20020a056870a79800b002004d6639cemr19714oao.95.1701998018344;
        Thu, 07 Dec 2023 17:13:38 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id qb7-20020a056871e78700b001fac77ee907sm207493oac.33.2023.12.07.17.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 17:13:38 -0800 (PST)
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
Subject: [PATCH v6 1/4] dt-bindings: soc: sophgo: Add Sophgo system control module
Date: Fri,  8 Dec 2023 09:13:30 +0800
Message-Id: <b7d52351a1b68e14bf4b7101c91fe5de929bdca6.1701997033.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701997033.git.unicorn_wang@outlook.com>
References: <cover.1701997033.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_171340_536414_67B7EC22 
X-CRM114-Status: GOOD (  11.31  )
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
