Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F35CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 05:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAfGO82llCEh3Qi95A5ynEyqKJrVoGn1J4e12u4ZWEg=; b=fZWdBTdZgyrWGN
	27K/UIsmGaCGnHcuLfg0IiI3+/fmlAnhw5So4nQyShgdZnTjltw0uudAq2neNI0JQnU5LUuiYk170
	xExCbtDLH+xNARhFil8OAsUbXV/plW7pzDManCRb7gbi2v5z3VezvyyRacZU882efQBOtIwNaJIdw
	zyNYvjGFYTI7f3IuRx8k5Y7b7r7gu1NP9xR9R4BpRfC/gljbn5rATivz+40BN8ErB1+NM/PgRofkh
	GT3l/iyqzYCB4t8DDa7LQyCzc9W8ZcDf4f00i+Ipzgh84J9SAjOTWCI78qrL3B5CyJMa+bhQCoTXY
	tzNcxV6koHW+7jXtZyJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsGK-00000006XB4-0H1k;
	Mon, 18 Aug 2025 05:18:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEU-00000006Rd6-47Ou
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=X+ejybDVQT/aGz6Lcll3wkVRKaiK+174ISdzaVIOfkE=; b=eTp+eFRL5JO0XW+3u97wn0D6Xn
	GyPwucFgmmRcbL51LBeuGLN5pDeETfVeAsiVt8rVPR3f9UNFRCiVt4X7pkYItMA8nevoV7fOqVZFW
	WZ/9h5AmHWzXVQrXfj/0hGUN2m7/E2hsfhU0htIyzGCp3njDacFgl21mo35/TgbxcVTRZAW5F9n1F
	Bg41mOjW13BHBwVSGfTf2zS69l12pZpScrP2KYazYViVSCvudfFizUNSilcGP4JiV+ivsM1ZmYLnL
	A5yFPwMKl3Z5wduQp7FaePonUSYMGBoJvprk/nszr7HGFLVlA9sJI7I8fXioLBel9GYesqJ1HBysF
	8FrST3Zw==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrDK-0000000HE7H-2faU
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:12:13 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76e4f2e4c40so1308603b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490274; x=1756095074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+ejybDVQT/aGz6Lcll3wkVRKaiK+174ISdzaVIOfkE=;
        b=SToiNcRIpX+msiwVx7mDOYmf5HaWt3j7WXmTofmAmTLolSiEVb6LkIeXopQLmCBrqq
         uigvhuZ6Oc1Dov7r8ktcoP52imPsxjY+zKuhca/AXOVV+JC4CFq96ksIlJH3vBouoVFf
         wIA1xLwjvW27swFMEfNrIOb/6kufp0ruAUC5YselrRKel3m11ypMODaOjPNkBrp0OOn1
         SkXlStRHZ9et5p5cI86DNYHMnh0Gs8LtPug+iLXCOYDVR4Ll3BL+WrTUS1m/WtFtPYIv
         RL3I1HPslKKX1A8UNzL760vVyv6tEW3ECS0gZfgYL8m88FI6yesPhVhHcssAGuFemtv1
         k9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490274; x=1756095074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+ejybDVQT/aGz6Lcll3wkVRKaiK+174ISdzaVIOfkE=;
        b=CdBCbUjAibIPh5fpk0X8Zq70EzsMSdcv9C/4lqIJAIUQAepTod1hjiN6ol3ytBOj6/
         ypE09CZjKO4/xHCI89OdshqEmyaN19VQSZEve0uVbSnIuWu0e+7VGcAfS+txnrFo5IPO
         MSuX4WN+RrqP26ZIfdkFSm96bY2z6DDj7ZxUWHi+9NOv5N+ve2nkdcx82v4aAsCGj6Rl
         KRl4frQk9oHIIQhZREwpyUaW5twRNDOxZMai9tpCGYqqflMyJ7mkJOQvhHFRILtchrBL
         6ZWKZ3iBZ3upXdplYBS9EWjnRmei9uC94zHtWO3BGjMuEbQF6OG3UPtUq4IFxHjjd0G9
         UmBw==
X-Forwarded-Encrypted: i=1; AJvYcCXL3Iy6jJqwawChhoVtQbzPuoyAjCSsvp/n4l/OyrwXnWGPLlSWNfUwJd3lzY2OttTwD2nSEXQB7B62cA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXhu1rW3GkWBwPBqNEg4RGeponOHi5rdggAJkMxm6XuU9jKLKS
	Cf2sWeSckqgtB0s5lUcOhjq9IdbfVmg79Rzwf9kTnarF5aH4rC5XivdgEjOjcOtZn60=
X-Gm-Gg: ASbGncuN+J6GnfAFySTCT475JjzTmTkKAKH2i1db8zaxyqi0Kp9bkd/qwmZ9kIiqhjj
	mhT9JafotKZf5SViZgNM1xCt+40gNdYpIfaqvv80eoy5td2Oxqy+E96bVuukpD/eEAoPy4sbNNB
	ocFi0OWVaq9elJOuIK1uJrJ0hq9+yhgpQe3uxQz1UX5pU4T7/BCfT3gjKeysiayQUc8qam5YaC5
	62p6uNRFX/9Ckj9wz7YRtlconxno/t0n/BLjLv9yjMgdieRI8onM6X9QYZ/P9hQcw8KpBQiSnZC
	X+09g2RxsR/m5+rDSGKNxsvQ5e4ymmS/SocQ5sJdG4+B7J2oU4z+y7MURXNpIFzPrHmPJTLFOZS
	Vx6msGCbECHptkL7xwOPzQP+9uJTbJT9Wt9odL05WWeNR4BG6Lg0XDw==
X-Google-Smtp-Source: AGHT+IEUmCBJqt58NVIHDPHHca9PR8O5TrOG4aqKnEqH28bGTGwWCZIcGW0W6/qShoAW7F8CGp1xoA==
X-Received: by 2002:a05:6a20:9183:b0:23d:9dd0:b2ce with SMTP id adf61e73a8af0-240d2f668bfmr14194804637.44.1755490273971;
        Sun, 17 Aug 2025 21:11:13 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:11:13 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v10 08/24] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Mon, 18 Aug 2025 09:39:04 +0530
Message-ID: <20250818040920.272664-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_051130_058794_1510B842 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RPMI clock service group based
message proxy implemented by the SBI implementation (machine mode
firmware or hypervisor).

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
new file mode 100644
index 000000000000..76f2a1b3d30d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based message proxy
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines clock service group for accessing
+  system clocks managed by a platform microcontroller. The SBI implementation
+  (machine mode firmware or hypervisor) can implement an SBI MPXY channel
+  to allow RPMI clock service group access to the supervisor software.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the SBI implementation.
+    const: riscv,rpmi-mpxy-clock
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software.
+
+required:
+  - compatible
+  - mboxes
+  - riscv,sbi-mpxy-channel-id
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-service {
+        compatible = "riscv,rpmi-mpxy-clock";
+        mboxes = <&rpmi_shmem_mbox 0x8>;
+        riscv,sbi-mpxy-channel-id = <0x1000>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
