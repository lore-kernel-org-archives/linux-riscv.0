Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D064EE6425
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c3bLePSwMmrE+XJCpZBdYsii4510+ueSLVv03tD94uU=; b=exBRx0Jq1HxgPx
	LpejKDMvxZCxFy50ZCCSHnlEw/eJffcEBQYcP3gVGuhUamien3jnhRDLCi3p6dhC0CxT5dR6D4MGT
	z3r2Fo+BdXUmYdO7xg8XRNpuCOFh/oPChGMPNrGlbDXpiXCVWCNTyLHSJEFw9bFUB7uvCi7YCppQB
	cBZOGJKhTMOVjwg1e4K+FcEUtHj8FcxRRrOrvhqFUopxGvycImmIiGIJRxOACxrF4CT7qi4ti7JZG
	iX90n86K9w3uo5kTv4WFmmDtJExTzC55ZZ+XVJazrjhKH04fEKet8pNRBZtuyL1iJwOBVf1gqjUx6
	x3JA+dsbrvoG+PNnGu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3AK-00A13k-1M;
	Fri, 15 Sep 2023 07:23:00 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3AH-00A12h-16
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:22:58 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso14294165ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694762574; x=1695367374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LyY1P/Um0of8SC7pIExKL3uasiY0J3NOHqMMObs04Ac=;
        b=eXquN1n+hUgVQwlzjsPtUX86ZE0NF+2GxAr1znPAeHq0OtLdmNUFF787p/5kasH5gC
         YmV2GvUeQJx7K0b9HrR7e4z57FZUhLkr3LWQrQ38H26gqM2B2m8feFqwzR2nNKxRQ8XR
         30pxMJAlynhL4aZRxpppwxDETgHVrWeLgHCoGEfWQsjO43lv4FiyIl41CNznArw17khl
         2mqqN91ta5bN7dfvb1/VISNVCXkUijurB4a9wbD12w30/qUYnhi23qfJZcDRNJxsgSzz
         2/jD6BtT5lRQrcsbcGSy6y44UjnYEvKavQ2IXe7oMA6wuhigjvX1v84eQleQob64Z+JO
         SA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762574; x=1695367374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyY1P/Um0of8SC7pIExKL3uasiY0J3NOHqMMObs04Ac=;
        b=Bb3SrkLP9xuQxtz1cB6Tjx304xYvxvvGkaRX+06oaxIGTbcpCVMpgg9hrxZLqQvgEU
         NAUsx4ORmYpvJdRttAl14OXRPvDsyiQanPOHVyeMy8Kr/XP7U2HHJ2JSVyFNCLuOp8cB
         ICfQM6mtx22BM4wU+knvft+Uqzr57Z4adSMqjkoPiGS1ylsHCeo3z4HlkWK733c1v3yf
         jnb7vDw2t2CxfdVyzhSPhmC2r/gY187ifjaj9Gr8nvcgAwTTttODVnHC4X/4R0K6gnQV
         ktpKUMsKRPKDULDQpD0LKQNT5kPvK7Hg7vfNMDzsjdhfXCBLftTeqzU8iePMPacgZME9
         8pLg==
X-Gm-Message-State: AOJu0Yz7bgcufXXQ0YVevOoY3/lnx/uOKgZNPk/vRhqjscWETDIkoRC9
	OY9WmEx06FBoVI2+nUL1hoYHdQZVaZbOrg==
X-Google-Smtp-Source: AGHT+IGvr8WzjvcDBHoMtkleaP3mPTG/02siLWI4WX6UguEA5/t1b5l6/usIgOQuhI+avenUMMmXEg==
X-Received: by 2002:a17:90a:528c:b0:268:352c:9d13 with SMTP id w12-20020a17090a528c00b00268352c9d13mr751765pjh.0.1694762573570;
        Fri, 15 Sep 2023 00:22:53 -0700 (PDT)
Received: from localhost.localdomain ([222.95.63.58])
        by smtp.gmail.com with ESMTPSA id j5-20020a17090aeb0500b0026b4ca7f62csm2348283pjz.39.2023.09.15.00.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:22:53 -0700 (PDT)
From: Wang Chen <unicornxw@gmail.com>
X-Google-Original-From: Wang Chen <wangchen20@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	conor@kernel.org,
	aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	guoren@kernel.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	Wang Chen <wangchen20@iscas.ac.cn>
Subject: [PATCH 03/12] dt-bindings: riscv: add sophgo sg2042 bindings
Date: Fri, 15 Sep 2023 15:22:42 +0800
Message-Id: <20230915072242.117935-1-wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002257_379489_37951835 
X-CRM114-Status: GOOD (  11.77  )
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

Add DT binding documentation for the Sophgo SG2042 Soc [1] and the
Milk-V Pioneer board [2].

[1]: https://en.sophgo.com/product/introduce/sg2042.html
[2]: https://milkv.io/pioneer

Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
---
 .../devicetree/bindings/riscv/sophgo.yaml     | 28 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sophgo.yaml

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
new file mode 100644
index 000000000000..82468ae915db
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/sophgo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SoC-based boards
+
+maintainers:
+  - Chao Wei <chao.wei@sophgo.com>
+  - Xiaoguang Xing <xiaoguang.xing@sophgo.com>
+
+description:
+  Sophgo SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - milkv,pioneer
+          - const: sophgo,sg2042
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..0e0d477dab38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20063,6 +20063,12 @@ F:	drivers/char/sonypi.c
 F:	drivers/platform/x86/sony-laptop.c
 F:	include/linux/sony-laptop.h
 
+SOPHGO DEVICETREES
+M:	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
+M:	Chao Wei <chao.wei@sophgo.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/sophgo.yaml
+
 SOUND
 M:	Jaroslav Kysela <perex@perex.cz>
 M:	Takashi Iwai <tiwai@suse.com>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
