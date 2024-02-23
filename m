Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7159AC48BC4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 08:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqvMoMQwSF09Iu2Koe2W59S9boyMf7VQnSKV4bZYqvI=; b=07Tf6sHR9/HShG
	xfzLm40WHKQSlZvtZ10Eh+loRZa9rVe2ldp1ChIqGsKzgZlMVpZOAopwe0rcSVzS4WXlDfLvZI1D0
	xAaETzGBf6VPerBYqeviX1A37m1qUodmPdDU2Hg2Sv2467UAAFbR+bF+VAeHnFPcSYhuhcq9J8r1g
	+456k2JVaYCgtbubkqnTwtpbM830MpSJQLg1I3SqLZ/BxQO+B5pYi2rCP3o2ULDqZ/A8mkL89xOUf
	fj1RKGHayLMpp8Rnh9KCrP3QyI5A8cpyhkrSxJwlEw1IigpMrBn5iHCskQ9OX17rAxsWfXOAil7vC
	BuMmwx24hdJMgXfXrvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdQnC-00000008RZD-49tV;
	Fri, 23 Feb 2024 08:20:27 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdQn9-00000008RXV-1KGK
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 08:20:25 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso498409a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 00:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708676422; x=1709281222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RfbJF1AHvLx68TbsWfPK5aQiL25UBSnWB8Job9Vv4g=;
        b=fMCJPBn6AhDaebChXnVdzfHDOj+gsyi/Z1mlQq6AZ06GsJv9iM9tk0nHXJrFniBt7x
         9xHAbZFuUOELjgdSySfYiLwHBryT91BPPQ231yifGbbd6uDVr1vHiO+CYeWDCduoq3rP
         /zXhUCn+PMHBDuo173czPV3ePsZCAO2XPdT+gYJ9eHCfd3fTHkmvkscC9augE6DIYwpR
         OGRxxZ0X4QnpXjib2OSTtEFeDwkDlr751wBRprcv9OBMoiyr2gflRCbeUpXYuDiZH+8C
         z57dw6XIxUgcdWd/BkWmhPE8p064blCWXYL+aTjyNsh2G+gQHJHACl7HJVc5XyR56t6Y
         ckyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708676422; x=1709281222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RfbJF1AHvLx68TbsWfPK5aQiL25UBSnWB8Job9Vv4g=;
        b=AkrqlLHYXIclaeGDDbaUoouthGqPt1sgFbFYU7XeEisV9Jmu+gNL4JEdUJS9BZ2AbM
         v9PUQMeZgKzI4+Z3o+4mjYTJuidDNqA+Opb2oBMhwmdjwYsanXom3TbPPP5hwefqSCZT
         iACH7Fmr3xjxPuUMMvMIk6/d11J4+Xl+Cir0dGqDOIwxhh2AZwcPv3w45KSOwOEe74aP
         A6mxEnI5EtqrA//VHfTzmzBGcYsm/NaFYmTCKbPPDOAtDTj198JVIGaK/F8lymTAOWfC
         wxzMoTJqOIJpS9f32SeyZItwMEffpDhDJrSY1zCRpr97k3Fen2Lap+HRuAS/5Io+In9E
         xexA==
X-Forwarded-Encrypted: i=1; AJvYcCW+8g11PaIYGxZmtgIXxpVkLObrxXQjBbFZVDKneBqcqIszOsbia+sOGNHuoWvoEYmfqa0WrQDD1lHOZGGC/AXPLfhlCQHH2RQ0SKOmkPrI
X-Gm-Message-State: AOJu0YzLxedF+x5WEbELpX6PjWBSavQjV6sEKUAmREQWi3GVL3qpkCH6
	4baNK7IDAny9WDAruPDnYWa6FSDckmcFe5knVHjMA82LOX6PKKyb
X-Google-Smtp-Source: AGHT+IESlTxR62kcKEjRyPd2MRipWcHKSB7X8sQnfOsHDmD+ru1s8Eaj7GCPdSZiEdY7xGi0rgweRw==
X-Received: by 2002:a05:6a20:7a9e:b0:19e:5517:c345 with SMTP id u30-20020a056a207a9e00b0019e5517c345mr924733pzh.44.1708676421551;
        Fri, 23 Feb 2024 00:20:21 -0800 (PST)
Received: from localhost ([46.3.240.102])
        by smtp.gmail.com with ESMTPSA id bf6-20020a170902b90600b001dc6f7e794dsm411534plb.16.2024.02.23.00.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 00:20:21 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC
Date: Fri, 23 Feb 2024 16:20:13 +0800
Message-Id: <20240223082014.109385-2-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223082014.109385-1-qiujingbao.dlmu@gmail.com>
References: <20240223082014.109385-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_002023_421797_EB265F83 
X-CRM114-Status: GOOD (  10.97  )
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
