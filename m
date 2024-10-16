Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D33CD20686
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 00:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmIjfXBNJP120+Wq/HT1iPsGtiYQNHTWtSc7gIEv1jg=; b=djucroSQgjXsUb
	jSgONZ4NXyiUU2dNDAmRJZgjIwzDVRJkIhckHf5WpIEQBXJEgHllFLswTCQxPQL45EDLuVKhdadJj
	yi0VZPW66ZGdIjusBIDAgZq3oaNbDV9V6kOmekeR/+Q53GLgKtFjCKfAWoxm5wcuuNFaOKVvs4utn
	UKFb1yr9gqsUko0MHgBHkPk32Nu3tCqTEubVdLQGHG3T/Y2JXhAxv3Dx13kKctNHrJFZyJw5Efvu0
	MHHTmDRHBvlaZPPTm2BrhvYme1OaDLEYshX+0B64OMXzYaoCDv/5WLCFaMy/QkguLE5UvZkm6N4q8
	QF98emR6tD6JF/oCGwpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0rlF-00000009zi6-38rp;
	Wed, 16 Oct 2024 00:19:33 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0rlD-00000009zhc-3Rxd
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 00:19:33 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-716a7d5c9fbso3378392a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 17:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729037971; x=1729642771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlWzcYJ31J9Ws/z9sFG6bpzdTEyI/n4+1H05qgKO0vE=;
        b=XDY8avPlK9NzrTGl7x8yonH1RaxHeQxR0uiiy9LUQIvjlEEuPqeAbH+0GmZUQpcZSt
         7BvyWZlDgW+lS8eRU4yZTmjzwVSDrcT8BLPW7dSluHXhybKCrD43mhmnm2OId5mSRzbV
         WyJlqSd3uLtQczCliOFz0CrvY+jBsEnPS19mMaFftnesJC+SLN7hoMvOyahXH7qZuFuU
         D3nUD0sMiEHaShhcDcJ27RkgQXb/vYwNsKfTV66cqXc4HdesLPGPN2vQeXULP/hdH+vS
         BIBsmQHRXUlUx2wgc5+4DshjVST8WFo6/T+E+Xo71ewit629yTOImLp8hq5rTwcUzAAJ
         3w1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729037971; x=1729642771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlWzcYJ31J9Ws/z9sFG6bpzdTEyI/n4+1H05qgKO0vE=;
        b=A66iAFY5kRKf2nCnjMMQTxEzf1dj0+ctnJbTbiUOdvVGodrfX72x0clJQckXyB5Vv0
         wCexCPzWybfQg+oP8/pSv4poqR7PgzF7b1R+2L6CpQTuFzu8Xi2N0sFnMKh8pGhB6DoR
         7esXerrUg1kOKx8vhUwGii6UPg/Q/0/oLyW+AN9IfKGdECvnAF1AZorafYGQlBygD4R7
         54m7ROWhDjWXpRZfSjXjMUPhKt+fLPBGThUIc5LrXGaFalSmmpLR6SW+dI0KlymqX6Ou
         5epW8pD/RFYyApRBl7CXvKTuPwZG5GfNW3rF5/V42WjemrCo9I6YdRrSgWyDVBeAEwqK
         2jVg==
X-Forwarded-Encrypted: i=1; AJvYcCXYv2uwbVRBV2gvpHEg1vcR0A/18KnBSIu91EPkojV48FmygHfl7HE4ZQpeHKxBXkwp9nnseODQHqZ8QA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyspZCzXhe/KH9Rj9JFyX688O5qHrTf/qGoeb/mhx9+2I1nVZDI
	/CyWgcNpmFGxGMAMvRQa7rshxzLtrtIB4evS6Tp7J7ODcbWi6R7p
X-Google-Smtp-Source: AGHT+IFw8zlbKDtvNmVePRwavyGsAfAi2KYxPiUFzfeRVIsRw9ZlHlAgw/BduzdJ6EYOR/iAMn5T9Q==
X-Received: by 2002:a05:6830:4119:b0:715:4e38:a1ad with SMTP id 46e09a7af769-717d653fc85mr14661117a34.21.1729037970597;
        Tue, 15 Oct 2024 17:19:30 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-717fb8e40a0sm594829a34.16.2024.10.15.17.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 17:19:30 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: pwm: sophgo: add PWM controller for SG2042
Date: Wed, 16 Oct 2024 08:19:22 +0800
Message-Id: <fec7163144d7f7b615695b5fd22a182ed7f1e7e9.1729037302.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729037302.git.unicorn_wang@outlook.com>
References: <cover.1729037302.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_171931_887360_D2252F49 
X-CRM114-Status: GOOD (  11.55  )
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
 .../bindings/pwm/sophgo,sg2042-pwm.yaml       | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
new file mode 100644
index 000000000000..fe89719ed9dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -0,0 +1,51 @@
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
+  "#pwm-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@7f006000 {
+        compatible = "sophgo,sg2042-pwm";
+        reg = <0x7f006000 0x1000>;
+        #pwm-cells = <2>;
+        clocks = <&clock 67>;
+        clock-names = "apb";
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
