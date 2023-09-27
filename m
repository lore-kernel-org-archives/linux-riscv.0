Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96887E810B2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 09:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tt/JT383xjCNtAqZbBKrWo6eOCjBRtB2hK2OJ5AGaIw=; b=bAcK7+4G6TqfyH
	byY25Dcyx8uLWHHQWJWa/DHUhmXMT9ZHp6Gjw8CGx2bS4y0bTWWkkpvVuGHs/cXFYxMnDh38jjF08
	XXsub+Kz7fAD2QOtqBfzRS4LHLCJpxeYYII+Ud3imBigYyWevGUPrSYi2n+lbF68H8LR5DKrlvU2D
	jF+xQhcvtxmYkpwfSLOZlVGcyqGkkHrg2OyP0Z5+40y/YN9w5JzuTd6Ekx1skm0e18OgkJCZC1VVn
	PqJj5hpgXtgF2u7Lh9XLdFqrLruoW6xB8AZfXAA3LfMojU6N59/UeX1uj5MNFa/qMt2tei9PO641B
	k8XGCcHvVRlgU3uTUjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQQs-000PjC-0N;
	Wed, 27 Sep 2023 09:02:10 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQQo-000PhL-3B
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 09:02:08 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3ae2f8bf865so4995312b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695805323; x=1696410123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYb+x/wAKIajaMdzWu38bo8URRaln6e+0LguScHfSNU=;
        b=U4a3R1IIx7LopeLsbk4L2Fpl1HUaO3DTkbvSQW8feU5CcBE6V0amo5oUXaJed7tJ6F
         JKi6eF57ETpo7raeruo87yiywGJ++4xrBURdrSpxNoAaECPhGSK0w3382UBCgQLKdD0J
         Zr92Gnu71POeOzZls9gxDske6nhf6X6mzlDxpJrBnEqwI7uwxLlEKQQR8UR7ptxfWhYg
         y+q9OYTV3SEJdr59Ik8wIU+gMdchv6jEPtG0L2EZ2zZbc6WlMcY4NmyLQFKXebiIzjM+
         M0F8C4FWtx8XvWKgP3Rz641V6bGKL7aIKjkM0YKGbnYRU2T4nJf6ETEBi4T/YpG0USHL
         ZqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805323; x=1696410123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYb+x/wAKIajaMdzWu38bo8URRaln6e+0LguScHfSNU=;
        b=MG8aTfQtlwENJIsfe2mZvzpDw3mL7xaiCncyIpeoQIzDMzFyhy1/4Uq5Ieu4Y+YkK+
         PANX9mqmWEuvcUe/VHY4awyLNdQYIeh5eERaZntpUqrt4eR1eb69Miny2io55LOV5KJh
         GIYuNZvjf0o+kNjDWVu91/5Tp2C44nNVQ8uCAlDQwdhJgbpelimXBGy43a/oI84xxcSB
         wjdgFXK3rKK+DUk5l5DVmcKRG3dveD54FWHYKksNupK7Sa2RnmuniRXsQusD6bofKSc1
         zSSFfVEEIBYIqXuPjmSXwr93ZTMNNspJMAs7vmN/9lTHVqjsSu0a9vfBlAHm/sehgHiP
         G2bg==
X-Gm-Message-State: AOJu0YxDE5BzXp+9T/OEPA0CQbT6OXqeQsxgo67m7VkHfaKFjSjR3C1U
	hOBKIun26k2l480bM4BbSog=
X-Google-Smtp-Source: AGHT+IEb5dlecz8eAtSfltSmdujtwoVtRC6Z7aE3UEu34jdVnUbAVOmlFXFYRMw5hvFLvQY4iMCrbw==
X-Received: by 2002:aca:2b14:0:b0:3a8:1c07:17d3 with SMTP id i20-20020aca2b14000000b003a81c0717d3mr1694343oik.19.1695805323309;
        Wed, 27 Sep 2023 02:02:03 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id j1-20020a056808034100b003a7a34a4ed8sm2452085oie.33.2023.09.27.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:02:03 -0700 (PDT)
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
	Chen Wang <wangchen20@iscas.ac.cn>,
	Chen Wang <unicornxw@gmail.com>
Subject: [PATCH v3 07/11] dt-bindings: interrupt-controller: Add Sophgo sg2042 CLINT mswi
Date: Wed, 27 Sep 2023 17:01:56 +0800
Message-Id: <4dcfca1b0fa736a226bd01c796e4d8986ce49e63.1695804418.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695804418.git.unicornxw@gmail.com>
References: <cover.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_020207_020530_AF501F56 
X-CRM114-Status: GOOD (  13.01  )
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

Like the timer of Sophgo sg2042 clint. The machine-level software
interrupt device (mswi) of sg2042 clint have the same problem when
dealing with the standard sifive clint.

To avoid the same conficts as the timer of sg2042 clint, also add the
vendor specific compatible string to identify the mswi of sg2042 clint.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
Signed-off-by: Chen Wang <unicornxw@gmail.com>
---
 .../sophgo,sg2042-clint-mswi.yaml             | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-clint-mswi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-clint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-clint-mswi.yaml
new file mode 100644
index 000000000000..a79c4c3db3b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-clint-mswi.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/sophgo,sg2042-clint-mswi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo sg2042 CLINT Machine-level Software Interrupt Device
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: sophgo,sg2042-clint-mswi
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
+      compatible = "sophgo,sg2042-clint-mswi";
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
