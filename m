Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BA6C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 03:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6a3fMyDwY1E1FlzxwAYW6rbwM81Lr36T1iZiqF35R3E=; b=E7ybBDVzLxB4Es
	SbQ5cGGamYDnwScoJWe1oWajni3IP90lLdNmZYUCJTRGwz/UHFlwOYPH2rdfqEVB/4TQ6pYAKPSFd
	9WSLnSpgpKHJGHv7IOBZps/t3YCG86z7kxkBf/uQh1A2A839lH4NiZnJ+wlox4ZPhxirnRHPI7O7L
	QoDJTihJe2v1PE8ySXcUz9tok15shdgwL226pigmH95f/8U7B/5eCzrQyblZlJmoNAU0I91x5an3B
	4fnQBY4SRPH3WNe8xjDKOGADrM+EmD/H1uBtd5GWCjswTB7oTwauo7pMeDBRPL8wVp+nFuVEbqKV6
	tjaVinCKPNB7QSU1Cweg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBrR-00000008icq-2kyx;
	Wed, 11 Jun 2025 03:10:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBrP-00000008icC-1glP
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 03:10:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-235ef62066eso76744875ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 20:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1749611443; x=1750216243; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB2voV3T1S6s0kr9GCPOg8+T/mhra2+9mwe9rgHhrTY=;
        b=e/bGfyRpPNIPeSa1z3JCR1gZsaoaI5a9X2mmD8m/3lZU7GqrxMAQ91o6Nke8pGV5gx
         uUfPiTFMFgKnVptnWJbfFYiIkrHlSaIAfUlXEes7fyhZLHT0rN0ZeW4DCol8MblettoP
         98yjd6o5MYwnyz9eLcYf5x4Uy/3KP3VxupysgXbm+GQ3+rzzHM3BzwGS6EH/2W1PmoKT
         21k2H+vDQS9ngM/rpN3a8NZAAJAuqB3DB7YR/oHJmM2rFvzoAxvJip8VsRoU5SqOz6pK
         c9e5epgKlifXh7k2iR1coHHz/iu+CgJbMDFa2EnVg6M631eZdK+RJIiEsscLwm+vuool
         LcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749611443; x=1750216243;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yB2voV3T1S6s0kr9GCPOg8+T/mhra2+9mwe9rgHhrTY=;
        b=qzlIBi8PFoPpjjXwc/fa+FCOt5SO6e17L31UExHjn9vwzC9gj2kvtbEjzXKYf89MPP
         rl+Kc1UVS28MvfrYKDF58EYjZUBbih5KXdUnTuhdZ3eAVxrFjMpXpmZpZDfOqZ+m8Woz
         TPZGzxdP2GN/ivjSVe8l5fxv66Af2EEZKEGt6WaPYwqaKsucfxQmRHPIUgz7eFvLyOK1
         RR4HOnSQyXTy9nXa6UDi9uG5mYDtkLgTmkxkMF594FHrIqDOJdl96AVMcFegDrHqZTBn
         sDXgyG3CirpXLH5lLKce5Gv40eVklgur6RKVEThekrbzCsBSs9nLv7xcy13HqC55HTtX
         O+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUn2Dk4PPWj23trrBxqrMHbWoNmg7DCt/hSoydw8N3eKRk4kbYqew6iu0czgBxwRWOZEg+/aOOnYZrm1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmqsWXbdDrATOPXjubAAm95I+EyhmWNuPdg8AqEyoYbaiBP8El
	IZhcCGU9UEFSmlPa/E8eiaHwiHTVwVXi1fud/+b1wME2OrsM7rMtdPF3HF0vAFflmNo=
X-Gm-Gg: ASbGncv3AmNBoudKKtE78ogtHk6PtZrOPmSE5nzSJ5fnwx9QAdohkNB1MknRqgRayGq
	vY+Z6qNLdCz93/WJR97sVTo44lcDODBvb3lSzpfq0CZPR5wEGOAotbHjUAOGxOypyQAElGGYuat
	2FGv9bjTAp8YrpZRU2WrpbHfcY1jVwr9+J8REkBwwRDGNF5sUkmFJxh5pjYXwIK1W25ww8cK74Z
	JuFgDqWry0WViHjbSKKBl55Go0msKREhvnlEfOZxjJmiCGDPcXzAdzhfEOKhCtirC4Tv8G+CKkT
	cyotNkPN0VNBxbfgmaPP6A623H+9duqG9lXYGalo4+TyQwheJ/S+Ls39XxeRVm4cOqxVLrS+LAo
	Jl0AftkSH
X-Google-Smtp-Source: AGHT+IF31vP92Jv6j9lEk0SYqK0SMTOB/iLYB6Qw7J13ixzOTBSXlAdB2rxPm5OhCWdhoVqhRABcCw==
X-Received: by 2002:a17:902:c40a:b0:235:f1e4:3383 with SMTP id d9443c01a7336-23641aa2426mr19809255ad.7.1749611442683;
        Tue, 10 Jun 2025 20:10:42 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030789c2sm77669035ad.29.2025.06.10.20.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 20:10:42 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	Cyan Yang <cyan.yang@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2 1/3] dt-bindings: power: Add SiFive Domain Management controllers
Date: Wed, 11 Jun 2025 11:10:20 +0800
Message-Id: <20250611031023.28769-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250611031023.28769-1-nick.hu@sifive.com>
References: <20250611031023.28769-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_201043_445286_85EF05EF 
X-CRM114-Status: GOOD (  12.63  )
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
MIME-Version: 1.0
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

However, Since we don't have a SoC specific compatible string yet, so
add '- {}' for the first entry [1][2].

Links:
- [1] https://lore.kernel.org/lkml/20250311195953.GA14239-robh@kernel.org/
- [2] https://lore.kernel.org/lkml/CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com/T/#t

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 .../devicetree/bindings/power/sifive,tmc.yaml | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.yaml

diff --git a/Documentation/devicetree/bindings/power/sifive,tmc.yaml b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
new file mode 100644
index 000000000000..4567d51148e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
@@ -0,0 +1,70 @@
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
+          - const: sifive,cmc3
+          - const: sifive,cmc2
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
+          - const: sifive,smc3
+          - const: sifive,smc1
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,tmc0
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,tmc1
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,tmc3
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
+# The example will be added once the SoC specific compatible string is available
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
