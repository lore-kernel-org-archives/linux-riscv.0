Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0170BCE8E77
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GW/E5LvFNAAiI1tFgW/mzVcQDiewBEgxeyC3mSpcLM=; b=19N9HC3lRxwc5y
	0bc/QR+uWyJhzjC/ftmQhUrP2XOTuWmgEp5kn5VGVEnyg5bZjmauRXvsWRSfN8C3AIPv7L46MKnMj
	xGX+lCVFne/NZ9yWJhwV4aVYcXWEI7xfwRSCZMka8ZHxcrLnCIPXE8/jBoUp5rzK/4TQ0EZTB3RvZ
	tqCXeHwz2wJP4X/maCId/2du8gTz5CVJi9T9ka/x151m9CsFaAEca3clf+Sb6jtUtFZ6ihvU7xBIu
	3HMnueCpbPyG7ph/IiVEMt6mjsZitUo18SkwlSVghUmvHUFFlZ5Vt4MO3JOwrvgGjZ3pr6D4H3ivM
	mF/MJdv7HgTQQN0BmMJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FTz-00000002wwQ-2wK9;
	Fri, 25 Oct 2024 08:15:43 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FLz-00000002vOk-1GDq
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 08:07:28 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5ebc349204cso960750eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 01:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729843646; x=1730448446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kROaOIt5szJgAa68Sy5g7p0dogkgu9Z3CSKDjRWOQKY=;
        b=SZxe0tlvmR5sppC5ZdHWAMI317umabcTcUjEfpcbbZYEZePJSPf6XRyjAXSf21mOzX
         Bn2Jzh53gXpi6xYQ44m3jB6WnAvzoh0SyHjcbekxkT/6e7kMntige4jBIgE+Ej4panmi
         tLSLmwkrvyxdKIdO/wtN5RX4MoO40Cu8o/TD9ribLx09Ukp3hV2oYD2Z/2kqhihn4mFT
         rX4AXn29Pwblpb/YeNNKQkheqNo0ZE5Ls+QEEh5M4g0imKCFzP5T+MxL2g6rZTu4qbKx
         B0EMmRImEt176xMwaT+RMMrtdgbtIENn/pxTZ0gXHDIEE1r7Ia/bnCjRMicskqvRnrzD
         UiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843646; x=1730448446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kROaOIt5szJgAa68Sy5g7p0dogkgu9Z3CSKDjRWOQKY=;
        b=o0Dek3atnIjnRVQm5bA7xc9VcLZ/6cQNlsYD6L4z41fPNsz3PhUNoqVeK/SVM43Wel
         FlkyIXE502EaH5RQ5nPXBTBnUeKzhXnBihf7ypPsCLtZZx8hYiyyrLBi0B560n6/r454
         9dybdqupZ6Au25uR/7UsSPm1sK6HDy4XSG7t7evAptSuYH3gjqoWm5T3xhF/4y8hFGNW
         9T4BzmA63QPWRjFBkIA98hBqbwFIXc1c7SkXcFojCZs7lpjpP5KudzQSRsKhzLfGPPYa
         XqciKnzafKJYmpXcKoJJGrVBrnAl6k+mlEU4HRUj5IVgbL40Z+OOhlKEwDdr92268DQA
         YqBw==
X-Forwarded-Encrypted: i=1; AJvYcCVc1FmHiUlWolBiBk/x2XLIPPE6h8f7C/ucTKqBWhXI4QLDEIiTZzKD22sMImSf1ureNBRE210mMWe7Bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVWil/f2w08m1WLGMOSSnl+cTCgSoC94aHbinbeis8K+YyuIqG
	HC0SVIc6QSh7cu05VrJctnnfGa8sVQMRKfBL5eM9Q592wK3h1mJB
X-Google-Smtp-Source: AGHT+IG3yZ7QFdXMQgZy4VqVWPZpaI1h3p/gTRs7/ehSdIlWEGnDqq5cSNi9pfS2CM4e0Baco2WIzg==
X-Received: by 2002:a05:6820:80f:b0:5eb:db1c:a85d with SMTP id 006d021491bc7-5ebee8e6619mr5987300eaf.4.1729843645926;
        Fri, 25 Oct 2024 01:07:25 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ec1843c72csm157328eaf.1.2024.10.25.01.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:07:24 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: pwm: sophgo: add PWM controller for SG2042
Date: Fri, 25 Oct 2024 16:07:16 +0800
Message-Id: <9f9a31a2a19c2743aea36c479b0dc32da0fec629.1729843087.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729843087.git.unicorn_wang@outlook.com>
References: <cover.1729843087.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010727_367620_5066590B 
X-CRM114-Status: GOOD (  11.08  )
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

Sophgo SG2042 contains a PWM controller, which has 4 channels and
can generate PWM waveforms output.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pwm/sophgo,sg2042-pwm.yaml       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
new file mode 100644
index 000000000000..5dea41fa4c44
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/sophgo,sg2042-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 PWM controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  This controller contains 4 channels which can generate PWM waveforms.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2042-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/sophgo,sg2042-reset.h>
+
+    pwm@7f006000 {
+        compatible = "sophgo,sg2042-pwm";
+        reg = <0x7f006000 0x1000>;
+        #pwm-cells = <2>;
+        clocks = <&clock 67>;
+        clock-names = "apb";
+        resets = <&rstgen RST_PWM>;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
