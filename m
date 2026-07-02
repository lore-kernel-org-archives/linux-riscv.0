Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57741C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 09:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sl7iR9f51sMYVfgIJcPI84WR4NMZ/c47Z0JmBhFPp98=; b=uPbWc+CBiMLNE+
	8uAnkpdxJvDZRpGh6KRiYJIcjihBzzgReoGN1fASN6q0SV8b0ZB6/yK1ArL4A0wru/11SBH+RTYh0
	BpqamGgKfpVqrl0b+OiGjz0eKJ9OfxdfErShwJZSwtd1LvF0QXDnqB3jUsIYOA9Adk7o/6bcL1H0U
	qPeI+mQ5PRQ1QsbIuSV0hdPwSeRcDzSZxOAxMxbiQfrozALCSCs9R7sXk0RKKqqSVIBcnHP39LZ2t
	O12hE+Ye3Lk85/pny8MtR0wa5hzQdunurWjGp0y+b7UTwRltO67KZigctXJ3zHaZmZ59N2KAn/6yT
	Cfkz4tLtivWJ/3tYf/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDLu-00000003xkW-0K5d;
	Thu, 02 Jul 2026 09:04:58 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDLr-00000003xjD-2fOn
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 09:04:56 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-37f7a5a217fso1256752a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 02:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782983094; x=1783587894; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rYOUNaGMGZsPlGyhqLkbebVXqK7qfkK62tQGnVDlaQc=;
        b=eEZFt4RSLNkmuuGhrTaPORPoGa7Fey+PJyHTn1vwK5JQznDCrYsGNl+IHAd6FKnnn8
         N6Hlu6WNHeQ8vJfGYGY2rR4GMLnMY4CF+SlpFQXIBAFbmshlc2m5+ajYeJfZ474LDELC
         rpkG1s7AZ+9y1rJTge+ctPuTv4sZ6iRwB84EAlIQ4zpbEBAcZTcUK7XkFR63QBkPoMlP
         1TJ9UKMUqtHGa3vZk+aQG+7QRoOJdJO+wxBWnLheTtCVb7TM0jnY4oFXE6xhzerBHCxy
         Dw3l4tFGKA/S0NGs5WgP5BWO8GdgyvTADMh66UqZKp7HlRwB8TLSUm/B/1EDfEHz6ItW
         RbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983094; x=1783587894;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rYOUNaGMGZsPlGyhqLkbebVXqK7qfkK62tQGnVDlaQc=;
        b=Gl/ONgALQ+HxhIUCnR6eDZInYUPm0BF05bV1q9MUlex1RZtADH8KLsMG83pVzhty1p
         2UWL9CBVkTWcqXGCQbdN+kxBtRiv47bFDq/GmatBL1z6VEzAYWWJbTT3QWXIQIi4LeWC
         1vodFMnHUr3VXFUTww8IneirnQV9NhpljHf8008nqp7HQeN/epvfFIDntG+jkdwZnZmH
         L93jMciPXvOB66a+9afmpzwLr6eNLXVC9vHqcNGU3RK/l1iJfk3s9h24jigKEi20+/XT
         2uYaytODdEy8WROCVhTltyHG+aUpBl9/TwZOkGaoHCPzF5u8xjqvQShoWAm+fN3Tm3kd
         qM4A==
X-Forwarded-Encrypted: i=1; AHgh+Rp3R9v+5WhTODczASxa+QwXjoxCYBcJUiiEodxaeVvA7VcFaznNKmwMSHTyTt8mf70CVQbUflKcgKZhgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgZm071tYzCIcKTumuvb9528bK0GsPcTnqxGUg86SmmjM9XJk5
	7UaYKGUphkFj5mNMw1MbBaa2ziM7UU/rEdMLKhhwWjEKOK8icWad9M1kOP5l2DEw/QU=
X-Gm-Gg: AfdE7ckHtG0GT2FA/985c6wQpK9YcB+0N3Y4fnBY+IlgmLJg05UxHHquetnuZy6frpn
	5PWu2C7XIG4OTik+sHhI1EDgY46k2YuXxNfRPbRrMKkXU/WWOuN/rIzfiYQ49D97PTzI6ko+0ut
	3pWlaYs4ZTzPV3FeJXU13PGp1D46FY9zmXkd8Jq1wVdpw9Hm63Jj5CtA9ex/LXr2ffwGAVPFX6D
	Bqt6G4pw80BenFxpuuhpmsaSAa8idV4FPmSmXP/mgxyio3fIOT25QQX+aTtaFN9Vqw8lPvgQF/m
	ffMyE/UfdvxF972OCmVwEDucB7E7OJ0D0VBoDMxcomd2gHKeGZu/peDgllek9by/oeYap2Y6C/S
	gyqlbFlVbIIBah8Q1JgntOP1gmB0PjpL1YNqRXnhz7IkEBCL7sqJCwmtDjkivQBXyYBBBHB5F4s
	GuzUGjhVEOFL7l6sGWhE7IkoUBBQopCOA=
X-Received: by 2002:a17:90b:3e45:b0:37f:d27f:5186 with SMTP id 98e67ed59e1d1-380ba91d167mr4114967a91.25.1782983094001;
        Thu, 02 Jul 2026 02:04:54 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e15c362asm725719a91.1.2026.07.02.02.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:04:53 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Thu, 02 Jul 2026 17:04:31 +0800
Subject: [PATCH RFC] dt-bindings: perf: riscv,pmu: Add interrupts-extended
 property
MIME-Version: 1.0
Message-Id: <20260702-pmu-dt-property-v1-1-a7a7737afb72@sifive.com>
X-B4-Tracking: v=1; b=H4sIAJ4pRmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwND3YLcUt2UEt2CovyC1KKSSt20NEOjJGPTtFSDtGQloK6CotS0zAq
 widFKQW7OSrEQweLSpKzU5BKQWUq1tQBQgp8DeAAAAA==
X-Change-ID: 20260701-pmu-dt-property-ff12b35fe0fc
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atishp@rivosinc.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Hu <nick.hu@sifive.com>, 
 Eric Lin <eric.lin@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782983089; l=2327;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=KuUldqSBvNUBw35ye/ZZ9kP2NkGYAK2SlfUkqDDVXZo=;
 b=r6xyJqLl12BSFPk0mVYjvI1fgO5czZqFRAdildvZY941PKjeY6XoAQqsZmgQVjkkNpPNiA/st
 /OSxALCjIC8As7kr5tTMspJ7rxU3VdXQOpNyeo7jc8yONMLS0Jk9Ffa
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_020455_700039_87DFF0CA 
X-CRM114-Status: GOOD (  11.29  )
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

The interrupts-extended property is used to specify the connection
between the PMU counter overflow interrupt and the corresponding CPU
local interrupt controller (riscv,cpu-intc).

This property also allows the software to associate a PMU node with a
specific CPU. To support future heterogeneous systems, where different
CPUs may support different PMU events, this property allows the driver
to identify the correct PMU capabilities for each hart.

Reviewed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 Documentation/devicetree/bindings/perf/riscv,pmu.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
index d01c677ad3c7..13aceb3d42b9 100644
--- a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
+++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
@@ -34,6 +34,13 @@ properties:
   compatible:
     const: riscv,pmu
 
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+    description:
+      Specifies the interrupt-parent and local interrupt index for each CPU's
+      PMU counter overflow. Each item points to a riscv,cpu-intc node.
+
   riscv,event-to-mhpmevent:
     $ref: /schemas/types.yaml#/definitions/uint32-matrix
     description:
@@ -101,6 +108,7 @@ examples:
   - |
     pmu {
         compatible = "riscv,pmu";
+        interrupts-extended = <&cpu0_intc 13>;
         riscv,event-to-mhpmevent = <0x0000B 0x0000 0x0001>;
         riscv,event-to-mhpmcounters = <0x00001 0x00001 0x00000001>,
                                       <0x00002 0x00002 0x00000004>,
@@ -127,6 +135,9 @@ examples:
      */
     pmu {
           compatible = "riscv,pmu";
+          interrupts-extended = <&cpu0_intc 13>,
+                                <&cpu1_intc 13>,<&cpu2_intc 13>,
+                                <&cpu3_intc 13>,<&cpu4_intc 13>;
           riscv,event-to-mhpmevent =
               /* SBI_PMU_HW_CACHE_REFERENCES -> Instruction or Data cache/ITIM busy */
               <0x00003 0x00000000 0x1801>,

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-pmu-dt-property-ff12b35fe0fc

Best regards,
--  
Eric Lin <eric.lin@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
