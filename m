Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D58E7C4D4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6iQDTBh0XFAW+YOhmQ0DiscUuELqbl2evAx3J9fTkk=; b=4jq1wDiBNBD4lN
	pD6Aq7Qjh4i8JYLS5XVP1Hk+UeV9wCSAhAaWzt5ZZeWHd47PpiJrZxkcYRRnt/feWHhiZYPZ5RIH7
	TqQ+cPIwSgmVAOZMm2l4IdpTvphwsSQpCjG53/saMn3AMcTTA3r2XYgWkLkERXk9UjD0PQIA2X0WU
	aZgPLY0x/kskiBy7tgEp3mSs2ID6Xl/x1D00SD1wDSdRxwGx3SraJ0J3IRDbW+EMWKTIAR2wYDhQb
	9M+uav+8qKQ1Iy08Xxl6S4msiY9FKYPXlm8xvw8vXL/Dy/jPmLqgSNhjMQOfM0IHW9+3EEt8tKJez
	/tMC9N1X8HexgU+SLZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo42Y-000OM4-2S;
	Wed, 04 Oct 2023 15:43:58 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo42V-000OLD-25
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:43:57 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3ae55c2e12bso1520962b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696434235; x=1697039035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2EWhyzfVF0SlezT75W8p2BMfVzvHlK5TEMrrV+47aA=;
        b=WsBA0izRNR3Sg9QWQ+FlpsmZwuqMaVrM5r8MSJIzGMDEZTuFbjl8hs257qM/5x9YNE
         PFFf5yA80d6f20wJT6bgmoPnvCbUftv9iqGdKweEW+xL4/3AwUmK5Mghq3DVEEBlIIdL
         1qEZJ5gK8QE5gs6z8nbcEx5mHoam7S0OPmgYsC2LqmTRr4lLwe5D6nKsjyZOdq7MygNv
         KMVz7g1pRuBC7EfhKZ6cvtm+2XdTbjKnzA3+DNMeAIMRtVOt1z6BVTUhHL1CwVgbHgn3
         8cEeSmft222eTBYmKetA0VW0bTc84Ey3pCo85mvuYrMicDdqGp2Oy9LVHahLwBrmGews
         Evmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696434235; x=1697039035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2EWhyzfVF0SlezT75W8p2BMfVzvHlK5TEMrrV+47aA=;
        b=n/y/DIy5teAOdfpew/2ofleEZt/0C0LrVaiyDG60IEcRq6iFRzDrv4F8GW3p31R4+l
         SuYMotzzQV27YKAEh0WhFvx0FgaYG0HEOBS1Y8jZTRfI6XhgBi9Vvxpt4QjOILBn4D24
         0KxFIaS9Zt73JVS8Mp7lbPNyAEiyV6+/XwExGIfYWc7rsZJd1C0z4pzPDJDognkN+4ni
         C/tPDnHmpTI4F4KgpCrwVIyx8Nj2CngWNl8CISUPBwi6bMmsYlXPzuTJb6/C/ei0usJW
         x/vbFCO2OG9xjlHPyWNx4wvU3NfPMR/e5BYLlPvvlbDWM10O15nenptwWa+/wfVX9X8y
         S75A==
X-Gm-Message-State: AOJu0YzfxNI3GoJRxZ/2TVNAfu/3WrpsCBaSNJVC6a/GKCP93UFbuqjS
	stDx2XQot6yoasAvoH128ls=
X-Google-Smtp-Source: AGHT+IGwkJtwzLLVYekkJ9/PQRsEmxCyJwvLSlS+rvJ2gPE/qFblO0doSz/FckJv67w4WvQe5Y+C6Q==
X-Received: by 2002:a05:6808:9a2:b0:3ad:f6ad:b9d2 with SMTP id e2-20020a05680809a200b003adf6adb9d2mr2679866oig.16.1696434234754;
        Wed, 04 Oct 2023 08:43:54 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id s14-20020a05680810ce00b003af5f6e40d7sm537597ois.15.2023.10.04.08.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:43:54 -0700 (PDT)
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
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v4 07/10] dt-bindings: interrupt-controller: Add Sophgo sg2042 CLINT mswi
Date: Wed,  4 Oct 2023 23:43:47 +0800
Message-Id: <1f6b82a1864477a51db33d3f295889ff985b497b.1696433229.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696433229.git.unicorn_wang@outlook.com>
References: <cover.1696433229.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_084355_697012_7D397FE9 
X-CRM114-Status: GOOD (  19.10  )
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

From: Inochi Amaoto <inochiama@outlook.com>

The clint of Sophgo's sg2042 is based off IP designed by T-HEAD, but
Sophgo changes this IP layout to fit its cpu design and is incompatible
with the standard sifive clint. The timer and ipi device are on the
different address, and can not be handled by the sifive,clint dt-bindings.

If we use the same compatible string for mswi and timer of the sg2042
clint like sifive,clint, the DT may be like this:

mswi: interrupt-controller@94000000 {
        compatible = "sophgo,sg2042-clint", "thead,c900-clint";
        interrupts-extended = <&cpu1intc 3>;
        reg = <0x94000000 0x00010000>;
};

timer: timer@ac000000 {
        compatible = "sophgo,sg2042-clint", "thead,c900-clint";
        interrupts-extended = <&cpu1intc 7>;
        reg = <0xac000000 0x00010000>;
};

Since the address of mswi and timer are different, it is hard to merge
them directly. So we need two DT nodes to handle both devices.
If we use this DT for SBI, it will parse the mswi device in the timer
initialization as the compatible string is the same, so will mswi.
As they are different devices, this incorrect initialization will cause
the system unusable.

There is a more robust ACLINT spec. can handle this situation, but
the spec. seems to be abandoned and will not be frozen in the predictable
future.

So it is not the time to add ACLINT spec in the kernel bindings. Instead,
using vendor bindings is more acceptable.

Add new vendor specific compatible strings to identify mswi of sg2042
clint.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../thead,c900-aclint-mswi.yaml               | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
new file mode 100644
index 000000000000..065f2544b63b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/thead,c900-aclint-mswi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo sg2042 CLINT Machine-level Software Interrupt Device
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sophgo,sg2042-aclint-mswi
+      - const: thead,c900-aclint-mswi
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+
+examples:
+  - |
+    interrupt-controller@94000000 {
+      compatible = "sophgo,sg2042-aclint-mswi", "thead,c900-aclint-mswi";
+      interrupts-extended = <&cpu1intc 3>,
+                            <&cpu2intc 3>,
+                            <&cpu3intc 3>,
+                            <&cpu4intc 3>;
+      reg = <0x94000000 0x00010000>;
+    };
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
