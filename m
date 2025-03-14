Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6B6C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DtrB0l4WB4yOGXD/4Y8X0PmdBLM2DVWZWlBC7xvD/nE=; b=gXoX0r1zDKtjix
	aKssqezU+aSjgqRq5OYNzuRZu3L4KmhqpqIPY+2ETDDaiYYZ+XzXcQwsr9ZKTg6jB+UCvWgYnlZ4v
	m+ulIzbohe+SWH7zeD+JHkQTat6y+GH8YbKoe8doF2XbHIfQJwEQhiHjvaPQ6svzZpRHdF4nrSACt
	te1KM4U8sFWmPOF+VwCsPr4iUQNL1y7fiMuYQSzJYGvYBbyTLYvICzZ6UO9Drur9P1K1MlZg6QPqw
	M15k/P+WZnTNdZ8/oj9Wh54+tM66cUr5A13252dHK3rItddx5YDE1sSVzXP5liaXYtpzwRqr9E1Wm
	DZ9JxiFEOZpt64c7JtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0HZ-0000000DQvM-3TJA;
	Fri, 14 Mar 2025 08:20:41 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0AK-0000000DPie-3Xz6
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:13:14 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-225d66a4839so18738875ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741939992; x=1742544792; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIaypJwWB+9Cndggia9exzQ6t2dGjEXmye283vVYlI0=;
        b=BCKH8s+TzQV676SUCWPjNBKO7e11AO1fOyRV9emgth14oaniejitpllNmmLxsHG8Ur
         XYw+9O3+5DFVovYwuInH/O0wFEF1EX9pbSU6Jh/+uMOKOQ5KvGyWc+02DXby0hTFLeVK
         va2F4exl1Ax+MQq16QNF2hUeYls5J+tMY+5w/3+UxCSCCBasluMSDZ5c09kgPBt4bMCo
         caH5K0iKxfQ8s9whcs8pfObKcNqx1CyAF0qO0u6BciOQMxNtQ5B2GUbcWQLa1W0OFUQK
         0Tjl7kTXv4afSPPorlDLhLpywnFjawkiuWqLSMKaPXx6BO3N93BsHUVv2rTXFe4DR1pu
         rIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741939992; x=1742544792;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIaypJwWB+9Cndggia9exzQ6t2dGjEXmye283vVYlI0=;
        b=Fi/4EnNgb20d5W8ifnSkQaCGP2/1C37grtHYDDyVSDQm7QgVdv6KMKfWz6lz9h8nNZ
         JMslnHzmPviZg4OcvUqKOWihwlyZB/H6U/nb9RZWcCcjy1xBqMzXx6uzz63Ls9FBaGfi
         I4XyzJl47Ww3nukYaheoaPSp7AYvgGuZ0JOzFi/YFFuJuHY1vbYBT0qRItkE6seujH97
         kZl92bvhYnA2Ra8r2ZZOj5Cf4j3bVqsTemoyq+8mkIEWv7NhPIgOBW5mwKHe2BXHxl2I
         kFLagEnM77UWgiWlykIsz3IkFw29gw7hCDfG2Zx77dbkpxoCLOaJTjUOuNPGcBhw9BNu
         atFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsR6k2x58GLj0qh34M2zO6MWNX9FbYg3jDA60U9jpYu7MpV90fOSHYxqr9kIx9iWbGHMUIcGAmRgVxDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1AFI4kAbyI8k61Lx+/vQZ47xoml6HLxikSH1qj2A5pFCrmmK/
	3PYkSQNdt3SMZ2YNifFJ18cROmSQZ+2lO06OVobxRE5ORFRA8ou/LTOeAVhN9po=
X-Gm-Gg: ASbGnctVN1itNq2Va9Z3ZM+X1qMqDK1FZiNgMKCKY0L8MTHWyPxupzcyrLcbPsvIbze
	dnA9zGLh4Qc+XYWPrvQh357CZSgur03hspvZfc/qPcOy1Q05MEBcWejRviyyl3Hf7mEiSo3qiha
	PXykXIJuetBjZhWnSh+EmgmMvRMe9xfKFxXJg9sPfuqoBC6nqQ2Zbe1RMVXa8T2cwJP5uBoQIwx
	J/aW2cid92bbYSr2MCpN+8Y0iaB8DoSExbLXS73gsuBftjXfBdeDjl/hbjTKnzTicP1kIuSYTCb
	0dpuvAs0Dzth1+vXaURqnSq+If2Vz0OWvdZ0E8kjaqJcVQh2qGC8ZMBBqI3+aGl0WTs=
X-Google-Smtp-Source: AGHT+IEU8f9gJD9fpGi0dkqDON/MFDwlzwvX7/+G8p0jqw7GozR3XpJHe76R/qoNe2N8VD05r7VjlQ==
X-Received: by 2002:a17:90a:d003:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-30135f4e5f5mr7721021a91.11.1741939991712;
        Fri, 14 Mar 2025 01:13:11 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3015364ec2bsm611920a91.46.2025.03.14.01.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 01:13:11 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Nick Hu <nick.hu@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] dt-bindings: timer: Add SiFive CLINT2
Date: Fri, 14 Mar 2025 16:12:54 +0800
Message-Id: <20250314081255.3718-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_011312_884496_BA05D2A5 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

Add compatible string and property for the SiFive CLINT v2.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
- v2 changes:
  - Don't allow sifive,clint2 by itself. Add '-{}' to the first entry
  - Mark the sifive,fine-ctr-bits as the required property when
    the compatible includes the sifive,clint2

 .../bindings/timer/sifive,clint.yaml          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 76d83aea4e2b..4b9dad11c1e9 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -36,6 +36,10 @@ properties:
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100
           - const: sifive,clint0        # SiFive CLINT v0 IP block
+      - items:
+          - {}
+          - const: sifive,clint2        # SiFive CLINT v2 IP block
+        description: SiFive CLINT v2 is the HRT that supports the Zicntr
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
@@ -62,6 +66,22 @@ properties:
     minItems: 1
     maxItems: 4095
 
+  sifive,fine-ctr-bits:
+    maximum: 15
+    description: The width in bits of the fine counter.
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: sifive,clint2
+then:
+  required:
+    - sifive,fine-ctr-bits
+else:
+  properties:
+    sifive,fine-ctr-bits: false
+
 additionalProperties: false
 
 required:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
