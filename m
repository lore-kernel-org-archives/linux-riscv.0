Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6F0E7716B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 03:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GW/E5LvFNAAiI1tFgW/mzVcQDiewBEgxeyC3mSpcLM=; b=e8ytQAZL2PEtvH
	59onLG3DRqnWUel+B8OlS6D3o1e7FNnalXWXA1QsdHV5oRHEUvNUUM4o+dwj/xTREDOIg5bJqGgWo
	P4GBSx4FDKz2FIPgL7oJHTX4EPTf8hPtKC9AQXqeajnm9giLl5os4HTMJ8+rrYkcwxJMAsLKsR7dv
	KUfG18J+QxGz+ZTkozLo5fXcB3Q3IrpoelamgnJJPz7GmblMj0zrtAnNsrvLMitbiuw9NsP7w6d23
	hAIT4ROZN0YIB1d+Z5H5ChV+KahrIzmcvKpTBjzL9JJ4Ruz5KNgwgqwYn0yApF03iqILObMaPjnCX
	uG7qHeBnUsYzOi7zaVAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfsR-0000000BMTu-0Nnm;
	Wed, 04 Dec 2024 03:16:35 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfsO-0000000BMTL-35y6
	for linux-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 03:16:34 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-29e99130ff3so227266fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Dec 2024 19:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733282191; x=1733886991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kROaOIt5szJgAa68Sy5g7p0dogkgu9Z3CSKDjRWOQKY=;
        b=MXULZdyaVvx/OiMCDze9SUzlIsvxwquwyC2hd5UuXrzaoPyztdaReURCHSwwNrZtp2
         W5T1OTubuE7vZvWlzE+WpABuSzEaRgvXIZF7QMoGIJ0OHv7Wy4pHhmnRpUCu10U9U74b
         N3EnsaBbCjXY3lMJ4TQkCbOpV2RJn4x32MXDOqEm/Nb58HBFKMtia+k4sLICpCgIv5gC
         UI9q3aMTSnQcHUyXcWNuS7zjZ0AusSgc/wvw0xoZMQ/khJLYGGcZ9QrKsOrAGZX6Jq+a
         XO+5RCb2ykkR7oQ6D2rfLaHxxwenh8a3y4RlwAqNYfCOXAtcPDvYOS10/iIfcSau2w81
         dvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733282191; x=1733886991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kROaOIt5szJgAa68Sy5g7p0dogkgu9Z3CSKDjRWOQKY=;
        b=Pa1GgqK8NZi/on26SbVku0uIgcX2XVuOXM0TKJUPp39XVFQ98+vcN0FYADOeuSPfhb
         fh35n6cB7X7utHu1DPUmnnQHW3sFOLlYSwHqYkVQ4+xU1dgHl3BRCgItUKkAEHVM1fDg
         T7t+xBY58uOeJVvkL5E7/a/0RZjsBK8KWMNsAbftGVB+86fWnQwchzN6ltPBq+6/cp7W
         5NCiJSrQhNezc/7hJwl7SxPBby3FrGjh1+F8Es5xVAu3FRWJOgoJYuvouD4Do4GdhzFC
         V8rEtJ3Y3goQvB1eLUuanahz+aFMdf1F77Z5FbBxyIui230wSPmwiUxIP8Wi5f5Pr0F/
         KTsg==
X-Forwarded-Encrypted: i=1; AJvYcCXcPmp01HEf+IYQmgu5Plf1yJ9KK7dBzJxHXbZym24qRZyPUTOrPNO+2Rb5smmpuInBGxKzLQeOVhoiGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeG11NYnJWsfLTGA3kJ660NQiB0swuZjmrGFvXkIScupNagy+J
	o09QbQYnnXT3derHeLrVJTTJfCwSb9xN54gGwWpAh7Ky1wGFX7BB
X-Gm-Gg: ASbGncuB70veVf1jGgFf7xvJRCX7Nv9YRlRTsSnqaGRfjNg0dMOQ10/3cvh7tE5RdRn
	t8WB/OvvrXyzizLeoKKMmDArfaLL5YXxU8/ojMdgktHVzQLufEKYtoZ43BRCV8hgMW3L1w0PSbe
	ogRaBFWCCoSgq6QFiMoXqaO6BK+UiS4pjsw5dHamE3Erc+/hA23t6+Vc/SlmMvjd4ttJ0ncfYcb
	FJVA+KBut7Vj99wQbYmu8CL+wh/IfOoLaAdomujHkc+PdPz6/nSunaAYo9n
X-Google-Smtp-Source: AGHT+IHY5LjkclYMi3XMIUv3pdnbphLNp1wA4vpon3cxectbEX98rvxmO78DG4oypv59/M909N6rlQ==
X-Received: by 2002:a05:6870:55ce:b0:29e:7629:1466 with SMTP id 586e51a60fabf-29e76296df1mr5314546fac.7.1733282191529;
        Tue, 03 Dec 2024 19:16:31 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71d8691ae5asm2425786a34.12.2024.12.03.19.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 19:16:30 -0800 (PST)
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
Subject: [PATCH v6 1/3] dt-bindings: pwm: sophgo: add PWM controller for SG2042
Date: Wed,  4 Dec 2024 11:16:22 +0800
Message-Id: <673f314d78ab467399afc02b96ac730149f19587.1733281657.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733281657.git.unicorn_wang@outlook.com>
References: <cover.1733281657.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_191632_775369_35529A29 
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
