Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70515CF6A86
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 08:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hszg1HU/P7S0VOe65bmI3Q6MeGNCc+aGPJgvXxzbAQU=; b=EMz+xaJPet81AY
	9qzK5a698kkbreS1WENTTLTbPuLRNsgltbnru70Z+rDlIjLOI+HxIsaCAQiYH8j/C1vxaX/JBdeHg
	3IKkMfq+rXtvXX6EiASlXjez9sAS/VAroKgYlHLiWMHZ3YEXVZucs3+e6JTHf82jciwR2iilbN3gl
	OPXFCR86vupUd19SwJHiAT0k3YSziOOrSWlvNjg+FarFMtugckmoRucSCqy5wxKOCr2dwGeli+KhN
	/zeCfQ41lamHYW2AJxvDDt3IYquYSvG7VzayoLKBVoJr+7Od4rZESxQAAVF/G1zFn3ultiU3ZaCU8
	a6l3MAmVeIHYhZ8V7Paw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlqu-0000000GMx6-14sv;
	Thu, 08 Jan 2026 08:58:44 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlqq-0000000GMv7-2pdK
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 08:58:43 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2ae53df0be7so3786019eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 00:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1767862720; x=1768467520; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPMKY7Ve7//uye45o8kcyRKc3naps5DDhGu7uTz/qYs=;
        b=kX5Lhvhb5MfS55s5YcUG4OW/d79O7CqHxhxRXD0HAu0BaJcJb2sXvv/DbrepTPR5xt
         R6+X5uB09umHFsWU1iLj/wIF56JBIpRdq0YIM+B30ha+Bi7m/LKnqT42iLenoELhFD7/
         36sMMEBP4bs+ApTKs4JECwYSn3FwZ+NCa7wjr8yIDCWB8eintabOStkU0lbfv0STMKQX
         M1iNELJI3ZWm0SjnZmxknV6W9+DW64xQVZ1QF3Z7RFw8ap5fp135tuuOgJC1XvZeXxb5
         apGvRTpHHL47teBQ6imJ4GidduwsNsQ4XdfiXEScHNjLkzOov2sPazFX1ehw83bckPby
         A1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862720; x=1768467520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OPMKY7Ve7//uye45o8kcyRKc3naps5DDhGu7uTz/qYs=;
        b=uQLhHRQy/3oysyCPdbbsqL0aIcgwkaPynDAg8Zhaz/2U61LCJCye2DEzF+ogPA+IcK
         xc1jGXWE6zN1S5VSWEcx8DrnYnU3jJV83K7QFQz9fmLbNxdSPE2Ab/HBBLFWFsEsgq2+
         R2J6JD2fRHSvaMhP0xNm6+keZM+iITiYIc4gUTjKf6RA21bz1MxoMCBIzCHPBFgcrv19
         LhfHnWqtZ74HgIvZb6HHqF2L2KeUTgpiAlFFtX70Xmz193NwX+iGmCEa+BiNW4+y4XOJ
         qB2eJe6CNPMMvITIOm624w1/js/4J5/cx3gHjV4VPDdeSYPVc7HDTv2NpmtVqW4Vj9Bd
         SwFg==
X-Forwarded-Encrypted: i=1; AJvYcCV+SMxrNNk8ylqHaJOIt9kgtJrhzI3sAkdGM5WFLbE66FMgjDp3zTMMoVmEu8HLgxguRsibE60JhzUb5g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx30Sgj4R0BiVg7PyYPLvw23tdK69cMtdupeGruvDbTJgjWwId0
	ZGtXOelHmNnBVKFJF4GYYDvfsX3tnU3jhrsfcAFftVBeciz8zpfHYYZs4XApffQM9JU=
X-Gm-Gg: AY/fxX46oGnlX9q9WyV0CPf0Q00bgS/KblltUK5f0XaH62uRUX+m1XRkJxzUPA8y/uN
	jYJ0H6/2DzKxhoL/Bh11wYGDK2gKMr39I9OXQGJRRSEQ7ApRLzUHOUDy3+X6v9UevxrIsDe8rZz
	XYTZCx8fks3iXANq8yFuC/yTrpcs9gbPrVtMyRMXF/kEpyuTncdNY2ako32HjHmJavRLZH0IVDh
	W7Q6oDGL0qSd924QLrElJQowdH4yaovoNzRmQI1aeDnfelCBzJGinTp/a0OU1VbksVdp6pWHDSu
	qzS25ZlLD3YsBK6anHznc+yRInOzsKUPYGekttgUxW6cTXIhMnxQSrvl6vAk4q9xPc6aqm1MmtT
	F/ZjhL7PyB6rfRsYqj+o1QWsu5c6G9POhhytNU6AIlWiNgqCu11t/U6LPoeZiTZ86qkH90/6x2Y
	IIbFegpfK7RVL/ZuBVEFgn8TI=
X-Google-Smtp-Source: AGHT+IGeM165oEvyVrh+jJ+fHeTSLxMLf2ir5ZaGZt7O8WdBQ16xZQI4McJDAnPHI+CXjXuTmYlcRg==
X-Received: by 2002:a05:7300:b09c:b0:2b0:4e86:8163 with SMTP id 5a478bee46e88-2b17d240aeamr3454843eec.13.1767862719638;
        Thu, 08 Jan 2026 00:58:39 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm8833634eec.2.2026.01.08.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:58:39 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 08 Jan 2026 00:58:25 -0800
Subject: [PATCH v4 2/3] dt-bindings: power: Add SiFive Domain Management
 controllers
MIME-Version: 1.0
Message-Id: <20260108-sifive-pd-drivers-v4-2-2a523d7d51a0@sifive.com>
References: <20260108-sifive-pd-drivers-v4-0-2a523d7d51a0@sifive.com>
In-Reply-To: <20260108-sifive-pd-drivers-v4-0-2a523d7d51a0@sifive.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Samuel Holland <samuel.holland@sifive.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Cyan Yang <cyan.yang@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_005841_163431_8006ABA0 
X-CRM114-Status: GOOD (  10.87  )
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

SiFive Domain Management controller includes the following components
- SiFive Tile Management Controller
- SiFive Cluster Management Controller
- SiFive Core Complex Management Controller

These controllers control the clock and power domain of the
corresponding domain.

Add `- {}` for the first entry [1][2]. Once the SoCs are ready, we will
add the SoC compatible string at that time.

Links:
- [1] https://lore.kernel.org/lkml/20250311195953.GA14239-robh@kernel.org/
- [2] https://lore.kernel.org/lkml/CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com/T/#t

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 .../devicetree/bindings/power/sifive,tmc.yaml      | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/sifive,tmc.yaml b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
new file mode 100644
index 000000000000..4ab2b94785f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/sifive,tmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Domain Management Controller
+
+maintainers:
+  - Cyan Yang <cyan.yang@sifive.com>
+  - Nick Hu <nick.hu@sifive.com>
+  - Samuel Holland <samuel.holland@sifive.com>
+
+description: |
+  SiFive Domain Management Controllers includes the following components
+    - Tile Management Controller (TMC)
+    - Cluster Management Controller (CMC)
+    - Subsystem Management Controller (SMC)
+  These controllers manage both the clock and power domains of the
+  associated components. They support the SiFive Quiet Interface Protocol
+  (SQIP) starting from Version 1. The control method differs from Version
+  0, making them incompatible.
+
+allOf:
+  - $ref: power-domain.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,cmc2
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,smc0
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,smc1
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,tmc0
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,tmc1
+
+  reg:
+    maxItems: 1
+
+  "#power-domain-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+# The example will be added once the SoCs are ready

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
