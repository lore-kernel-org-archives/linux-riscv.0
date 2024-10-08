Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94908CED25D
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 03:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmIjfXBNJP120+Wq/HT1iPsGtiYQNHTWtSc7gIEv1jg=; b=Xzx5tq9ns6zy1j
	S5xaS7mJZ69ABfF8xbOwXVPwnvqqqzJOH+lslBgFSlGoKrfvt5jmncSpPa9Ta89m3qOwimH3DeZ0f
	9irVGa6sAYfOJuOXw7iMlDoLeO73+k/XjOtlFzdN6RMue4x6CbE9ftkyiLZYSmMa5FCXEdJ/p+zqA
	1xbwt8PPqh46YXR1ktogacJXnHilpaFKudqsHGFgla7HXGF5szrRYOcOTOhVtLaCo0xkI7rGyCUiy
	dDza1Qgmn+VWBhTT/04wvhMwGqNRbn7drgqgDpHwViWiQ3SyERwUGQx7bA9LNP5ACGyyh5RXYAktY
	NRCK3RUVhU7n73YPS1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy0W8-00000004M31-0P6M;
	Tue, 08 Oct 2024 03:04:08 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy0W5-00000004M2U-2IUY
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 03:04:06 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-715716974baso276125a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 20:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728356644; x=1728961444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlWzcYJ31J9Ws/z9sFG6bpzdTEyI/n4+1H05qgKO0vE=;
        b=BQlAJou6Z5WjKL8UUCvNFT63B6brO8XQrWTSkNXWcMLybMirxYojucXxkMyvW5hVic
         DIaPyixAL+QU/9Qfr+N/KQ5ovDKtQKfb23dB/+nKFfXCmWYgiGf01NrWObuyAY0RF0oC
         tPt9+H2DTW4aORs0iNS+cy9iRr1yoNZqxqrdlAx7idDLqGXaj6WejN3SgQMPBYSAl72g
         plA0YFXiPC62msaDWjBIWvf26YYRXyURYJuH1oh70rEv2NaIj60VGCDUGUG9qkG46p2F
         iJ7u6q+hUhSKyHHSEOU8FwwKJ9w4/t0z1BWED7GZ7W2XHSi/1iwJ4vwdqHEPgp4ZN2Dh
         Ufxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728356644; x=1728961444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlWzcYJ31J9Ws/z9sFG6bpzdTEyI/n4+1H05qgKO0vE=;
        b=Qa1iWwIA5OveQ5KojAW9w6rvXTynTQygwXESBd1Vfek0kZjtZjz9DqaZ7WfYOYATPs
         3GmNGAZwk6K4CuU/a7Wc1H2PXpqxh9J+/9t3c9fGiWghHGmtxDskSk1rWLKLvUQv8BXk
         dmyPHMHeRJH46/nAu5l70QHrNAyZT0ipMeZeBO7tTfkCT+FkyJdgjNVzcGVo5hEAvqll
         1u91V4SfIcwEsWZbBf70OOnu3jt6ySQgLvFvpiGKQ/aZlvRYQfEi7+jf+KbXuHyerRy+
         VfUB32YceqP/UZx+sxb5hBAns/4AZJQLfPA/5Pjn0TRjOCyk3c243zC2Hvf1cKYC7+pw
         I3RA==
X-Forwarded-Encrypted: i=1; AJvYcCVg7do6a3xJV0aFPJyEJvOxXtxdO2JUH8bIT7nc32kixTlZGN5bLZmT4mD2tZxXjBa7TchNarnVaL+s6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7wS37k8drrv/bqflGKiz1bC9RaKebwGV2DsTedHVT+ln+ZYiE
	nG3llVdMDBr6s3hW921UbJKRrvQYFXUJ/rCjLSNTLrwnb/Z04SrBoc6Dj+tj
X-Google-Smtp-Source: AGHT+IG1ZpRLRDMCNzaG4ln3251H+l6NrmeOXdEcvw8EjEFUlcXPz+rrmFhK4pf1EQHHupmW9XupPw==
X-Received: by 2002:a05:6830:2682:b0:710:edaa:c030 with SMTP id 46e09a7af769-7154e97bbe8mr8716722a34.26.1728356644416;
        Mon, 07 Oct 2024 20:04:04 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71556865db1sm1768505a34.72.2024.10.07.20.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 20:04:03 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: pwm: sophgo: add PWM controller for SG2042
Date: Tue,  8 Oct 2024 11:03:54 +0800
Message-Id: <fec7163144d7f7b615695b5fd22a182ed7f1e7e9.1728355974.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728355974.git.unicorn_wang@outlook.com>
References: <cover.1728355974.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_200405_615453_1CA65A64 
X-CRM114-Status: GOOD (  11.75  )
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
