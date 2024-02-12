Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D58C4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 12:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqvMoMQwSF09Iu2Koe2W59S9boyMf7VQnSKV4bZYqvI=; b=NyxRBaNb6NfioX
	Sk9+Ru4jR2kHE9JnpQsfOKK6CwQ0i+PIzdoxUjaOtCA/Hedd8thHm5MYtP9HZ0azAD0DYUmFgEQtS
	soNCo5NKEiuPpxckwwXODHRNDzk+CUG4AEmPlLjunxDqsMwV+xVs/wj6H4n/gWqdDWkkb4Vxg6UfB
	OJ4veGTpFZNl8Lowgh7YnM9J5OMffmsjHKPNK2rQShpKWj71aJkz3bWxco9hupqesh1UMXlH7BnFf
	Ox6xABDeoClyDdP4P4oBs+zeLEAeo87RXD6I/o07z3InI33Sjb09viNfUhmNbeYTa5myl7fGqEMGM
	IvBwNUv4t4JZV0JQfujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVFp-00000005FD5-33L6;
	Mon, 12 Feb 2024 12:17:45 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVFl-00000005FAe-1u5y
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 12:17:43 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6e2da00185dso983075a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 04:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707740259; x=1708345059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RfbJF1AHvLx68TbsWfPK5aQiL25UBSnWB8Job9Vv4g=;
        b=UIbG1CbOb0+YzmMgWC2Ww+HAGNgw6vtO2W6moMWYSbVSLII9gf6p9B1GOpwgDeOZhM
         J+9rZ/1LCLLwEW/QB1TOGsvf+dAeq+35U8MidGHrtLWHPhI1jJKzW0DT1cJnclywOHH6
         /UxIHpTndJiUnl3ae+4Gk4C4Jas3lQAeMcO9QIKZ11DC7UJxJ/ShbarpmXrsNmxKcFX1
         u5QOKGv7WHy8EjrFQcQhle1xwaVJbccRAfHRBEjvCPk/uu85Zp2E9qdcdxjCK3Fj8noF
         4sHGFboq2XyLReQHoKeUJHbqxUMAVFFAax6jY+5WywivaQdIZg4w2eIed9cYlzLv7QPh
         GQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707740259; x=1708345059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RfbJF1AHvLx68TbsWfPK5aQiL25UBSnWB8Job9Vv4g=;
        b=f0fZF5vK9SYHXSEMmFN1rVeEUcuWeqIgmG8UXccbKqHS+6f8XoqVqAfXZZkkYHe3wn
         W0pizRjfMZVHt8gtYL9TWG2941bhUUY+c3VaG6D4aP+Fc8h/+ENPrO6+TN6z3Efmdsuj
         C5iB6bemvMR19LjE0uJg/AyHwfDQef0td2tACqNdoGYIubEabfurvdP0gz/G0Sax2Oln
         h2/UfolvGmxFLVYS0DZyONqjrgptvPWgcGsix3WF/ahsTcjeCjYmtyfDKwsZT/BOTXCC
         jJLg9FJrAAMmfkXbIJEQwb4yprv23czfhOkXltjsBM0UZXwg4nQMKYKhD9dMlPpP1GV0
         S56A==
X-Gm-Message-State: AOJu0Yw8r7wMFilgnlIuJHJeYjOZqevgTZ0tJKzCTzSdpoWvTiLHfB+A
	eVVqE9Hk5wFyJsA/fTY5gQPU8oRKgk7bn7A8mmvH6ctVaPx+ErtT
X-Google-Smtp-Source: AGHT+IF1V8fjciPDIVrbirrW65r6wp9hguDDTfeW5poRWxLAD6XqNoHV5/CpwG9m+ZX0np/f/YuM4w==
X-Received: by 2002:a05:6359:2192:b0:176:b156:f69d with SMTP id lr18-20020a056359219200b00176b156f69dmr9001594rwb.31.1707740258740;
        Mon, 12 Feb 2024 04:17:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlUx/5elAYWFUyu3JBsYBwId9m/koGZaU1mU7SeGEzzCwQHHCjUkHr8ZLVBF1oOnqSPyqAtxWBXhXtha4Dn0aozg0tvbpYa2HjafCcj7uZRyev3FleJzrjuZxPpQix6KKpXyaPzTObBK0MiMj+d/iL/xKufqbFSP64R06LcFi7gki+igvtuxzxxAQLPoz085GK8HVkpy10v6wM/TPSLkStXWbeT96ic2ptQieYjI6c1Tm9e+jO62+yXcdEL7cvKA1PN08/qLNf7kRC/sF4IUJ8cRFHPDClV1gq8atT0w+A6ouYNiIaIGVxJDYp2chNJLoSf08oGaBOvUHapXE/5yn/H4EJjQk0zQmtX2jOvmOY5s5EF7hQ733jOGsN1Wc33ZqR3E8sjW4DBh4fPsxwdjVLzKk4SfDe5tJ9QUjb51FM6qTN9G5BWyDPFkZig7G6D899AHm939ruXNEH/JWkJvYiYCsbJidEJbw/vHNTtwAA/trcPxoloDm+jzgHhS0=
Received: from localhost ([46.3.240.107])
        by smtp.gmail.com with ESMTPSA id q23-20020a656857000000b005dc2ca5b667sm253534pgt.10.2024.02.12.04.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 04:17:38 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	inochiama@outlook.com,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC
Date: Mon, 12 Feb 2024 20:17:28 +0800
Message-Id: <20240212121729.1086718-2-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240212121729.1086718-1-qiujingbao.dlmu@gmail.com>
References: <20240212121729.1086718-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_041741_523386_1B792CD6 
X-CRM114-Status: GOOD (  11.12  )
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

Add devicetree binding to describe the PWM for Sophgo CV1800 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
---
 .../bindings/pwm/sophgo,cv1800-pwm.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
new file mode 100644
index 000000000000..b5b819d780f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/sophgo,cv1800-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800 PWM controller
+
+maintainers:
+  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+
+description:
+  The chip provides a set of four independent PWM channel outputs.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm0: pwm@3060000 {
+        compatible = "sophgo,cv1800-pwm";
+        reg = <0x3060000 0x1000>;
+        clocks = <&clk 60>;
+        #pwm-cells = <3>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
