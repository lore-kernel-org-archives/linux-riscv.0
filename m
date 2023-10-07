Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC32E92FFD
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 07:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1TY/d+dShrQL0lSFiCWoow0YGFZYGFGFVeokLN3H6Q=; b=vTLwj3yUaKBUKb
	IfvBlfrnzS05Z6DROClI/Bd2KNBWtTByA8ZFTUmw70glc4i9ob2kDwi8m+pYxEWc5cr5rCPwbIq82
	QJEN7FsND1Wea9NuXeV0Nl61t/+oZ78ST/2gt/yRZhfRkuWJ84g8QH9//vPtj8gMz9Mett5WypRBQ
	gLt0JUDpxp4vTn9OER2pdR2RatitPyI1lzwkqA8/roqhpotG3U1CD8po8/X7eTCLSm58JhkpymImZ
	kCQE6Ykgt0HqSnxfJSj8eZ4m1bVMgHGdgf8pfPXVSLIapMvYZ5IHHPEA5fz83krU/LP3AN97PBdvM
	VDTE0NSJwEC1YHW/HdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp2Au-0079Jo-0w;
	Sat, 07 Oct 2023 07:56:36 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp2Ar-0079IG-1H
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 07:56:34 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3ae65e8eb45so1971962b6e.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Oct 2023 00:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696665390; x=1697270190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBpHGIaKLpPU171266rbLk8TrJkhcAtTOZV7fCxUUAs=;
        b=Bw02Ap6a1YXvePQ/9smAxMBj1EmszR93sroU8ztafA0Ygndh6V1P6772H1GE4yynfn
         qqUaxPgRJkSwZIqd5ttQZcC7pbBVoiU3WBpQUyGuEB1CSOv9pfZjDSO+qXJ19oPj1WeC
         CrqdTHhOFMbeZ0aUt4UK+RFbh0f/2IJhcHMogLCEKcYHkJ6DDSlwlqkeMZB+onaKT41c
         zMijZf7KDBN8ZOgcEscgPErvEIwAi1DAfQSOt9y7NcLbJtaDX2NWPZykUqkok7NDPOkg
         lLOf5CwqV0bsQhIPCg3YA5vR1lb3PfNL+bSIUCemhtBZ8fXSw7EAZI+DINqCyE2kmKmb
         Dq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696665390; x=1697270190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBpHGIaKLpPU171266rbLk8TrJkhcAtTOZV7fCxUUAs=;
        b=H3pQnNOSAYsTVAqA4gXSMPmIaYNhp1m6ZKBBsjydZ1y8mC3aXAyf5ZmhKp+lCpp+80
         WUvprS569K6dRYekuSrr0azVpju66lGb6YSX/yrOdMohwm8DKF8hClYbum6ITN0HMlQq
         YPaVPHvOFivNv1sBwUB6sebvOxZgxoHbdpiW3y1Cjrz6tRmoVSBXzcAcMMyCzDkVp1ji
         HoP0GrhAw9UyX2Ls01afVC+YQHAhuCa5iMWoEYikVmkYK3QpKlCphL6hyjGxwMXkAlM5
         Nvly6mRRjOK77gk5Z9bXzuOzF4zHiwKXY10UCIBugaxznn8fYtEv3j7MRi7pYnnYXmY0
         ryww==
X-Gm-Message-State: AOJu0YwYEQEbGWVj/oPMyUcqFYdztB85HVlNZZFDfZjTxBb/qfOZexS5
	PRIYfItZqMGQr9FBodKYOEk=
X-Google-Smtp-Source: AGHT+IHiU2Jxde6TIDkmqEUUI7gmEUMAxSt+GTwADoDz7as/kxYBdGs2+gl++XJuWpyzFS1RvZucpQ==
X-Received: by 2002:a05:6808:1153:b0:3af:7de8:ca90 with SMTP id u19-20020a056808115300b003af7de8ca90mr12597153oiu.56.1696665390394;
        Sat, 07 Oct 2023 00:56:30 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id j11-20020aca170b000000b003af5f6e40d7sm871005oii.15.2023.10.07.00.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 00:56:29 -0700 (PDT)
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
	Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 07/10] dt-bindings: interrupt-controller: Add Sophgo sg2042 CLINT mswi
Date: Sat,  7 Oct 2023 15:56:22 +0800
Message-Id: <4db57bcb69b9182c171598eb8d65151a347cfe8f.1696663037.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696663037.git.unicorn_wang@outlook.com>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_005633_431326_2EE04EE4 
X-CRM114-Status: GOOD (  12.33  )
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

The clint of Sophgo's sg2042 is based off IP designed by T-HEAD, and
implements the not yet frozen ACLINT spec. This spec seems to be
abandoned, and will not be frozen in the predictable future.
Frozen specs required by the RISC-V maintainers before merging content
relating to those extensions, therefore a generic compatible is not
appropriate.
Instead, add new vendor specific compatible strings to identify mswi of
sg2042 clint.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
[conor: re-wrote commit message to drop irrelevant sifive,clint discussion]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
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
