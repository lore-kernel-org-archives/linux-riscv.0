Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6D4C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqvMoMQwSF09Iu2Koe2W59S9boyMf7VQnSKV4bZYqvI=; b=30SWIrpzcpxIN0
	dmy+Cbikj4GUu+ROynBps4S3zQE1S8E0rvaj1+X6VA7fZbMYNBtrQEk1Zez913DCbjaYmGi0tFPYk
	bMadzKwWyhi9FvIs8enMxOaW4nXi2bVbg5QKVK3FK+nvsIhsiEBXm/YXTeGDlf+QrHXtXzdRNSjYP
	MbLvR1a16k+LFUIegsGWthP00IzjhRRoYWLt9807bbNAQrhHQMMZxODo9TNH97tMTsni3OQ54D4+5
	gnMWMKz7c4H/wGKkt0G5RqGpAOQq8UY9zIQUIzm2L890520s+yT/0Peh13AscQidOKAEI3luAE7bv
	fmaVOGq28zSXMYIpw9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4Aj-00000008FKB-1kbg;
	Mon, 04 Mar 2024 08:59:45 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4Ag-00000008FJd-1R1t
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 08:59:43 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3bbc649c275so2802423b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 00:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709542781; x=1710147581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RfbJF1AHvLx68TbsWfPK5aQiL25UBSnWB8Job9Vv4g=;
        b=PaR80n7yGQsLDEm/qJlQuPOO/cVGcleD3RHgoWGwlKQ3ed78iYG23tezxVBfg++exK
         J/n8hddr5dr6spUrQrUftD4yHInw1wvUQ9ndmblUFmJBw6KuzIELLRnh0+FPynEK8lYu
         l0Kd66PihPReymF+epMPSHBQzH5hLjv2cGr70iL1dwpMIhmctdMKeaNb280sHWzjDW/i
         JEzQdkHxEd+uSgKS/LlLjyQqiDzfkZVfwEDgeedosYQe/Nd2DUiDPGNJYiUUfdoa6qDN
         TqnnSP7Y494ZMMReoct4VDrBHQBY2XQds2AKz5+/WUtat3lUyrBa03+KR2EbngGwyiPA
         M4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709542781; x=1710147581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RfbJF1AHvLx68TbsWfPK5aQiL25UBSnWB8Job9Vv4g=;
        b=hSsyYYVXnESvKogl289bno2cUADRuNlL4Q94bdqOGkeLEIMRPaGv8+KuPVwqR5pE44
         9cYuV9B8vVUcfuRIo8KMx+gZ87uC68nOYDRyuS0gJ0C4TmV2f+TQ7NvsVX69iiQ5vE2/
         99+6rQogDJww2OPLUU6nykS2t4P5CgMpsFzP9JFEBHFcS6xxjnawD3BX69dquElS58h2
         bV7ar9lsZJEzPx5fvqm+RaMEkftp4VE/Q52M94Dc+8/zqNWmLfEVWmwo1XwVyhDOvE2E
         gVq/o0bZZeQRrQlNK1uV6ZUQf7kMQ+fgKkdFPuJA5TD7s+xP5S9oEuJ0xwvxN1pINgVm
         h9yA==
X-Forwarded-Encrypted: i=1; AJvYcCX2xFJxFFklUG3LUb1tmgGijhnz6slzUn81ffe12pUqbdhQBC5ME8ygm0Gr/TMwAHJ678xvpcliIoQb2pi9GaRWL/exxo9jwf9bSU5O55LX
X-Gm-Message-State: AOJu0YzgLKCn1hx3bvjnXVHLItpTxacAnqTM4BZPRQqowLB36qrp6D9k
	C5GrNhcieBLGLgA6IUM8yOebZsiuOsjF1vpI4R2h2qhFuWh1rKqt
X-Google-Smtp-Source: AGHT+IFrJApvRiyiRPUBdBTtRF+hbAqJUWjUKCjR4DKkFz7uLlV4nmg8qKkGl8e+Xbjpdw86yiP4GA==
X-Received: by 2002:a05:6808:148f:b0:3c1:ae0e:9c4a with SMTP id e15-20020a056808148f00b003c1ae0e9c4amr9910219oiw.24.1709542781008;
        Mon, 04 Mar 2024 00:59:41 -0800 (PST)
Received: from localhost ([46.3.240.107])
        by smtp.gmail.com with ESMTPSA id k76-20020a633d4f000000b005dc8702f0a9sm6903483pga.1.2024.03.04.00.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:59:40 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	inochiama@outlook.com,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC
Date: Mon,  4 Mar 2024 16:59:32 +0800
Message-Id: <20240304085933.1246964-2-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304085933.1246964-1-qiujingbao.dlmu@gmail.com>
References: <20240304085933.1246964-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_005942_421060_969E1C35 
X-CRM114-Status: GOOD (  11.52  )
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

Add devicetree binding to describe the PWM for Sophgo CV1800 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
---
 .../bindings/pwm/sophgo,cv1800-pwm.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
new file mode 100644
index 000000000000..b5b819d780f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/sophgo,cv1800-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800 PWM controller
+
+maintainers:
+  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+
+description:
+  The chip provides a set of four independent PWM channel outputs.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm0: pwm@3060000 {
+        compatible = "sophgo,cv1800-pwm";
+        reg = <0x3060000 0x1000>;
+        clocks = <&clk 60>;
+        #pwm-cells = <3>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
