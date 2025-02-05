Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9176DC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7hrIbEKAl0zS0RDcFdBrk3t3gZfAgQsBsVNZMyd0Ns=; b=EHVy1pw1glpsN/
	Bc23cV8kRzPUxHwcL7ZE8bYLlPE1IB1ekaI/Ih9ySV5uswMtF0HptjLUbS9qzANr81LDlncQg6job
	gkJZB7fn6Jb9nRqrGT1vWk05FIWNdUPcaVd/sd/ABvCDf4yE0HRN0z8D7nMBbt8OA9WtM4e+42yaJ
	g/eGPhWW9eT2d0f/9lWdLR0KZGAgJ89EL8LIjJO081AAQGZd3cgOgBz4eWFxVSjF+6vKKORUqddfg
	izC5Q8EYSSgId2CAzlxCHSStMEuoPpGZnaeXRCXX4bhu4L81VKBVzyhdA7eafTzD/IDJLOQRgMRH+
	aiV3b0Ag/pf31HeCsVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZPl-00000002TI5-15pa;
	Wed, 05 Feb 2025 07:01:37 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZP7-00000002T9g-3VkY
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 07:00:59 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5f2e31139d9so3011230eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 23:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738738857; x=1739343657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVz8hdajmeQn+sLRJ3LfLAYPYY16G3b35wwKMJMKlco=;
        b=a4Yvk5FDXwe0B6YYTibAUMFLRuT4hqWl7VofF4tYTF5SOjOAdhn1Szcr/NhIrs2TYG
         sBOmRBZ7rwY1Ab6kECSDlPbXUp5zq3/dxwADczMh9eZlLF7p6a7g56konNKFcWuw9zj8
         zavJGbzyvaCCk44W7olvfkKrIBTXPwczuUctNY11QkoMr6/+u+RpdI/dKpA5JFMxUkJ/
         cqisDn2X6CyytWrhqwc1D6+H9iZOWDRnUNJ/+NpTYrsVhaqByh5vUS14V5KxN+rTI7ZV
         d9FpJ3Oh4g29DM40HLHfy45RWUzu6DwBni8lAccKFOFD/JeAwkvVAk70nICcCX+z4Vms
         C+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738857; x=1739343657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVz8hdajmeQn+sLRJ3LfLAYPYY16G3b35wwKMJMKlco=;
        b=JURhKAEo2SRyyb8NSBtl93OJ6B4e4hsb4zPAkGhUV5b7BZnJpBJVQpIJudZDjDf6Si
         Y5jxFXpRO6h1Cq4PS8xFD9y0uwkOzMhkyxChHocZ+0zQZotvuA20x4kM15Gl+3Q7PSI3
         uUrl7brsMtV1jPVT02PsByrRSRBLno2JVUTAs4V4Kv263ZCGe8ENptbV4SiUjUL+vKnH
         ACs9aSdov6ACfOQcmtovlat4eRRfX1D0YU6ErNwv+P4W/kOVCpNxxyI+pFUg4qGUtAY3
         UCnkGkt1C6CZ9ebDw+DU5VFtoJQuMqIG8UijxeFgjpbpoQWCWHYZ4skG2UBLecyyFw5W
         sslg==
X-Forwarded-Encrypted: i=1; AJvYcCVIFa7k3YRUdCGQLS0l1lQBBoz7TDvZCmJJ+oyNCKUSOaajJ8Jso+uGolFzkgymUJYBdxeyqt0YU4gBWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVmolQcW/eR1tX111na6gr1VG6UP28QpBx58VZhXYvaVYVecX5
	1qr6VD7yC4D1GyosLJOMmmRyzmc91qL71MX3Ia2bLKo4mq9z22J8
X-Gm-Gg: ASbGnctI5ZhLIHYc2//BWnRpPt309HQKD6XgZHCr9Nu9RUlZDtDV2tXme454FOJWUZr
	/z+OA/TZWZJTo/to1eORwopGjLHqrLfQkH1nFaRPTjlxSbEeZQtpoVnh9HOol6wm8dc1lvgNrzy
	wKM1hk+5zHRXwv5Q7dGsqCqDgqV7jEgLs02jL2QRxwFuP81eCUdrOExC3Ftkd8m6VZZVUzYesd2
	8QFilBIc/1yuEzVBLu0bgB6kTuU2cqcGyvpGAxfyTRMpaFst/I4rQVjaZCOwGQQRHXubQG/XBZH
	dCjfE0a8Hp9V6x1lXZqYPZ/35w==
X-Google-Smtp-Source: AGHT+IFsHiem+4btGG99h0d6BwMEp2mzewnRG8Nfz6GBsGDnx1ZgDacLy7O2/NhwKDNQhLK60akjwA==
X-Received: by 2002:a05:6820:1992:b0:5fa:73ed:de8 with SMTP id 006d021491bc7-5fc479ce7demr1475362eaf.6.1738738856694;
        Tue, 04 Feb 2025 23:00:56 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc104e29b7sm3598247eaf.17.2025.02.04.23.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 23:00:55 -0800 (PST)
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
Subject: [PATCH v7 1/3] dt-bindings: pwm: sophgo: add PWM controller for SG2042
Date: Wed,  5 Feb 2025 15:00:47 +0800
Message-Id: <d739ea5a1bffcf762248efbe25fae9b9fda6f452.1738737617.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1738737617.git.unicorn_wang@outlook.com>
References: <cover.1738737617.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_230057_887329_202DAC2F 
X-CRM114-Status: GOOD (  11.36  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/pwm/sophgo,sg2042-pwm.yaml       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
new file mode 100644
index 000000000000..bbb6326d47d7
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
+    const: 3
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
+        #pwm-cells = <3>;
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
