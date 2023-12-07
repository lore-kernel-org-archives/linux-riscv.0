Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE790C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnFKBqaoJQwdKtuFUBM02yk8wBo9oDjFVZVNebFt344=; b=ZiLDQZkQDChCx9
	IOmr6qBQU2/yYrTrZvRMmevASecrc+PUt/twWjfQ9kPp6HckTqYf2/N/7Aq7PvpI2vv+LN/215c/V
	5OH9W1R0kaYXdHZRp08GC8t3/FbmMd4Hbf3lZudXRYXBYkhb89xoGTulgsDC+JZIaNmn4n34Jv+at
	etjA31FUirEcBMkujO+hnsCWY3xIGskHtT4Sla4EPbUM7hFc6C6V3qMHBBPbzwUASwHQiM/IqpMG+
	qLjTS8kbZa33x7TWTXgKOCQ8yp1/Mc4MUkbtrg4jUbmikU2TZ5ICt42P/SMLwkUYfUAN2cloYXNYu
	Tz1vYYpwaFDvjoACxEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBACU-00CHVs-0j;
	Thu, 07 Dec 2023 08:57:42 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBACR-00CHVA-2g
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 08:57:41 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6d9dc789f23so118788a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 00:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701939458; x=1702544258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Wg3vTVI+KNNtCZ40tO4THN1Rc/sssddRQwHLFYhkAc=;
        b=T3e9KsugD1jklDVMLuio4uXEarNPx78m3vzMBC/4LTbOhw130neq/oXr6RRzvZ1H6N
         Mlb23BZSCwx7/SURgtP6zSeaIUkXefmfA5x2sy1PgmFz42mH9Mpxsh0FmWpSrhCT/mHx
         yON9O7E0wzmjD7qgT7E/iZ9bmBRNJ5ZLh2OUWSbEvEK+ch3z6LVoPF1HKuDCeY/9U3T6
         BJkxt9rrHpz2U25rQ1UACKGOKjh745Vk8dJHXwFdnhEBphlP2vWuSGCeMq3gzSS4mT84
         JFsfIX1tafLfYy14VqGyoIuoiT3+qx0clXKZ2762b4v3H/CYYAt2Z/ABwXHlq4avoPrN
         UhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701939458; x=1702544258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Wg3vTVI+KNNtCZ40tO4THN1Rc/sssddRQwHLFYhkAc=;
        b=XBS61rSrQN7pbRxpNfAFx7+QrxOPGHUKdHjNktfyGp6gNwyDqfRI4J7tOOwONXQrwL
         6j/CjR2sJjoPdnFZCArXx5fun+JtzgI163V5MThpAtU0He6tGT7Buo1Ja9+RSNstLFt+
         4p3tPbsUbZ/b59Hbeg0lUXkvqMmZKX7TnHWfIRHnSFbItIQFia7uKa3ZdHm7wEaQRiPv
         ivPjifUqITWIgiABdzzwbzV4JkfK2pVzXf0s//p7Rg0l3R9sfE40m9aKn3ltq8npxECv
         XdnVo7klwY5sYbGZ7Q1jS7dGwR0dnvp3PtlHYNoTi+HdemtKhBV3Xz5vTtrV/SDuFvXy
         C5wA==
X-Gm-Message-State: AOJu0Yz6uekITNBs69vdwtit9K636R9YKRutX9To1jtLOQoGECKwgW9W
	Djy7LszYW9rCvdE8blx2Ips=
X-Google-Smtp-Source: AGHT+IHW4HSIb3obMzTrfiP4Gy1b6m5qiGblv1GKI63bYQ+XoerAbg/BeN69ofo3MRl6Vitfd51XPA==
X-Received: by 2002:a9d:62d2:0:b0:6d8:2883:cb5a with SMTP id z18-20020a9d62d2000000b006d82883cb5amr2130164otk.24.1701939457879;
        Thu, 07 Dec 2023 00:57:37 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id a15-20020a056830008f00b006d7f41c7e11sm152567oto.33.2023.12.07.00.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 00:57:37 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/4] dt-bindings: soc: sophgo: Add Sophgo system control module
Date: Thu,  7 Dec 2023 16:57:28 +0800
Message-Id: <3bb50fea3ae6e15f67dcc5bc21315edd1f4793d8.1701938395.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701938395.git.unicorn_wang@outlook.com>
References: <cover.1701938395.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_005739_868936_4BCE10B3 
X-CRM114-Status: GOOD (  11.48  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add documentation to describe Sophgo System Controller for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
new file mode 100644
index 000000000000..1ec1eaa55598
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-sysctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 SoC system controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  The Sophgo SG2042 SoC system controller provides register information such
+  as offset, mask and shift that can be used by other modules, such as clocks.
+
+properties:
+  compatible:
+    const: sophgo,sg2042-sysctrl
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@30010000 {
+        compatible = "sophgo,sg2042-sysctrl";
+        reg = <0x30010000 0x1000>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
