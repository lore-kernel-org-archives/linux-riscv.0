Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D35CE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 06:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqKv8tAXNsVOsu43PRXUR1elQ6qjbVcbwiHJHVm/lek=; b=IEru0ZKKVUuanQ
	KhBpqKSZI/AOD6sHmXJX2FmN+2lCebrVIMx14jSoxOQakiGAH8BT0qyKuz5k0OejPXM81gHhHv6uj
	e4b24WP9Xu5r87WAnXR8hAOLh0rx79XdTsAFHjQ6HrceFy4Kh1sVAcGuKYLRjZGXFQWZQyHkQc7go
	FYHxDxSiuj1xx+OWZxydXYegKcB+yjDNxHixwy/nST/zNI9f3f2Mr8LfNUc8bYybpra8KYql9vaZh
	Yh5u0vZuW3Pohdl2xnBwqmxywz9u8U0GFdwc9dmQFnDxHuN8+MkhJX7hgYXl2gMH6NE6ctbYVsZIE
	cnOQLUzDeZ39DNkZnswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqqZ-0022Jp-35;
	Wed, 20 Sep 2023 06:38:03 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqqX-0022JH-1I
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 06:38:02 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3adcec86a8cso2034064b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 23:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695191878; x=1695796678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BV+65pRBVYc+OiZ4eNCts7KcqWJoy+uloTJChETlmhw=;
        b=SzuMbqFZ+zbRR0ymuUXor720mDCgJHACfoxt1o/q9M+cpl70gGpTEg2b214DHVKmeV
         ULjIHWvvhisUoGYcOwPZvhaCAmkTiB01XP0j8MX6RuI6xCQUC+DfXOX/PAFRfcgv3dT4
         tIQujfxbP0/VQNqOva9RjjLY6JTKGhhbj+DZ4gM3e6BxoIkhuQIFkvJcaOTlY1Cn2t5v
         2DkFETezulqKVqo2x+uncpeixdhi/lkRu7hFZIoMs4iUn7VxVB30GJCR+FF3JnytykhL
         RjD0BM49f0DHuR70vKUAe4Uwk4Ji7tRsIkm+g3J5I5UbF/zT/pQQbl84+hrBf31gfoeQ
         7CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695191878; x=1695796678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BV+65pRBVYc+OiZ4eNCts7KcqWJoy+uloTJChETlmhw=;
        b=D3vBsz3by4k9XtvQ59uzd1K+0kOj7LqcxKtpPZraFU0C3xb6+76v2hvk2gmSpGcFjR
         oMCUC+VHZDkrS9pzRF9CQ7nV38YP6aOrMQFd9hdofG7oKXdEL4ZYMrSxIZdRsDQHbKIv
         B0r5dVh2LdFQMAusWrXMOwoMFQY0V2dnbiuYZD3dQQbiOGpIHR1qlGoN3LE3p8jphCvW
         Gm0MrTXyKXfSe6CZ3NzPPQ53Ngq/3v+9XuoItKKn/2uxrfWnei5lNL8gcydTWKJLV03s
         Fw3VduF7WhgGrEStZ1aw0Y4x7D8GmdepcOHjmIV1Lsv2gITli2rM6LYZ8/tSaCWw68fd
         /U4w==
X-Gm-Message-State: AOJu0YyrkQ4XZkF7BWrygo+g/yPBCZYsfnlNnRIPWRVp3V7774s6iD4W
	UF2uUpQzFtfp8URS9SUDx0Q=
X-Google-Smtp-Source: AGHT+IEWvN+C7f9ImWH0k3icxa3OXfImJNQPSPMfPOdPEqIsb7AlzEs3DRJNpMw5aUd0c4iMLMcPNA==
X-Received: by 2002:a05:6808:1ab3:b0:3a4:225f:a15b with SMTP id bm51-20020a0568081ab300b003a4225fa15bmr1266910oib.31.1695191878115;
        Tue, 19 Sep 2023 23:37:58 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id b19-20020aca2213000000b003a724566afdsm2775185oic.20.2023.09.19.23.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 23:37:57 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
X-Google-Original-From: Chen Wang <wangchen20@iscas.ac.cn>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v2 03/11] dt-bindings: riscv: add sophgo sg2042 bindings
Date: Wed, 20 Sep 2023 14:37:51 +0800
Message-Id: <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695189879.git.wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_233801_439706_6FB94F17 
X-CRM114-Status: GOOD (  12.94  )
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

Acked-by: Chao Wei <chao.wei@sophgo.com>
Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
---
 .../devicetree/bindings/riscv/sophgo.yaml     | 28 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++++
 2 files changed, 35 insertions(+)
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
index 90f13281d297..b74d505003e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20063,6 +20063,13 @@ F:	drivers/char/sonypi.c
 F:	drivers/platform/x86/sony-laptop.c
 F:	include/linux/sony-laptop.h
 
+SOPHGO DEVICETREES
+M:	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
+M:	Chao Wei <chao.wei@sophgo.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/sophgo.yaml
+F:	arch/riscv/boot/dts/sophgo/
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
