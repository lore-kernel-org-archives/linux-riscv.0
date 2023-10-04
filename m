Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA234E7C4D4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCbnYLhhlpI2lZnpadR/rHdBj5YKpSEcOoSuwmyRlRc=; b=4ZYOXOjdbfpABq
	KAquCAfRGKWc2rhXfU/fAz0nCxgS6UhVqfdAg1P0kr1uBTMKZOGRYMzMIfw6coJ3lhnGuskA5h5cV
	j046Cs/mNW6KzUnPvv86wmf2+2WnV586uazIwnegWhCR0Dje/FPlCTM830qhzT1DWRr9bWp9NaieZ
	nU9b9XXLtI+eBGW/lPXwcWtQeYVeRg+YMbSGeGXx2HrwUZdCbStYWoRXIhAxqxt+pCpvEwVKhHpPo
	qur8coh7XaYz/9Tzolxenzf0oceENW0UsnFwvZRtnkne3jZGsDGQveW4c67IADNj43VXhVMnSt0YA
	61xIQiqbRYCr2EdnJ1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo42H-000OIN-2Q;
	Wed, 04 Oct 2023 15:43:41 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo42E-000OHS-1q
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:43:40 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-57de9237410so1291878eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696434216; x=1697039016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHNexQjEWqwmHrfiry0buaBQbrLt3wpcuExz+BRupW0=;
        b=VT230t+gDCUqFRzjmQPGD0yoDbLIMwpEYiAAk+1fBDIYPNIqFYRxIkayYs5SxSAZC2
         3Xi0BOLqotMSL+AVUnYJqknT079ynOWqQUXEOyD5IIswalCoc/MEkLr607rxWPb43IEc
         6WsTXc4Bxtyoohv1jqa6HAvNEQagj6DnvF7Bwepq4pWTYxwOWpBbXzammsvcWDyE7llT
         SKgDgfJ3NWjxNO2vRCLnFBouIP1V5sq490e/jJhf7nK+TrWRqXHfzIUV8+lwBPNaFuwN
         vHgz/9MFl6FBgAMJvmfgh/WoxJ8Qp5wvzvREiEnd5KpKzKedv5cBK6F96cdzf3QfaIh+
         V5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696434216; x=1697039016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHNexQjEWqwmHrfiry0buaBQbrLt3wpcuExz+BRupW0=;
        b=MckK8ovroVTLfvZAslJObMP2Fec9uxWdwfj/h/7EEL0JWxbCqdVhKYuvsWWzpXJWWD
         b7HbY93Vsnpe3J0wLxOHyyTBBQ6MLlAtbB2m598+/3GbXTFQUZn0WTQO7zw+XY3P3yEx
         lP0ymCgHJVdZJmT5Gnyf6jNZyX45i5VMHIo/fVxlJZSADv0LbBV0wiWIb2vXaiwwT4Tj
         c9wlKXK8JilBhA9AtiqpBaG4BjjdSszJcNBtQT+b2CcdwdtE6IMIEAam+kVHqQ+mIoJu
         V22iRKWFcZoCMNhELj0i4e8QyV8Jr76yq00zfFGLNCrm0tWAVYCsT+SxI3GCSIqenreM
         s8FQ==
X-Gm-Message-State: AOJu0YxIYzuoU2+Z1iTJK1zjcyuGMnwuX/1P2vWkz6gZ77TR01MOixyy
	RUj0VRfCWpq50hJ8IvaTIdw=
X-Google-Smtp-Source: AGHT+IF6r0Nf92b8yMVSXzfb//2cKp9M6wexeSeiIG3LAk4U7LnHo3090pI0Juj4ICyo7zS2BWchyQ==
X-Received: by 2002:a4a:d2dc:0:b0:571:1a1d:f230 with SMTP id j28-20020a4ad2dc000000b005711a1df230mr2546119oos.9.1696434216397;
        Wed, 04 Oct 2023 08:43:36 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id m1-20020a4aab81000000b00573fb6178a6sm654637oon.44.2023.10.04.08.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:43:36 -0700 (PDT)
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
	Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v4 06/10] dt-bindings: timer: Add Sophgo sg2042 CLINT timer
Date: Wed,  4 Oct 2023 23:43:28 +0800
Message-Id: <6e48cbe5e60f9ada2fd1fe58e803e127f1a678e5.1696433229.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696433229.git.unicorn_wang@outlook.com>
References: <cover.1696433229.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_084338_612279_3F6C4FD9 
X-CRM114-Status: GOOD (  19.01  )
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

The clint of Sophgo's sg2042 is based off IP designed by T-HEAD, but
Sophgo changes this IP layout to fit its cpu design and is incompatible
with the standard sifive clint. The timer and ipi device are on the
different address, and can not be handled by the sifive,clint dt-bindings.

If we use the same compatible string for mswi and timer of the sg2042
clint like sifive,clint, the DT may be like this:

mswi: interrupt-controller@94000000 {
	compatible = "sophgo,sg2042-clint", "thead,c900-clint";
	interrupts-extended = <&cpu1intc 3>;
	reg = <0x94000000 0x00010000>;
};

timer: timer@ac000000 {
	compatible = "sophgo,sg2042-clint", "thead,c900-clint";
	interrupts-extended = <&cpu1intc 7>;
	reg = <0xac000000 0x00010000>;
};

Since the address of mswi and timer are different, it is hard to merge
them directly. So we need two DT nodes to handle both devices.
If we use this DT for SBI, it will parse the mswi device in the timer
initialization as the compatible string is the same, so will mswi.
As they are different devices, this incorrect initialization will cause
the system unusable.

There is a more robust ACLINT spec. can handle this situation, but
the spec. seems to be abandoned and will not be frozen in the predictable
future.

So it is not the time to add ACLINT spec in the kernel bindings. Instead,
using vendor bindings is more acceptable.

Add new vendor specific compatible strings to identify timer of sg2042
clint.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../timer/thead,c900-aclint-mtimer.yaml       | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
new file mode 100644
index 000000000000..fbd235650e52
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/thead,c900-aclint-mtimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CLINT Timer
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sophgo,sg2042-aclint-mtimer
+      - const: thead,c900-aclint-mtimer
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
+    timer@ac000000 {
+      compatible = "sophgo,sg2042-aclint-mtimer", "thead,c900-aclint-mtimer";
+      interrupts-extended = <&cpu1intc 7>,
+                            <&cpu2intc 7>,
+                            <&cpu3intc 7>,
+                            <&cpu4intc 7>;
+      reg = <0xac000000 0x00010000>;
+    };
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
