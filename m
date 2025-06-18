Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD84C71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yf1K/WI5KK7Rl3BcASyupLP0eAN2iABDXrFQ2Kzr6s=; b=0nc73cijj/sPLu
	buR65mUoaxHxhYejlpTF/hh/mWPB+rT7r8SGe+j+A4IftJJqT7rlFGsoXWpd7o7sRFKf3tFSazaNu
	23SSjjKQgRise+lZXicrZFloPjPq0ftSr6IuRC9W6a1YWqXN3o6EW0hnJ8ocDXg2QdSDcA7LAY4kR
	oJT1qikBrX2vnRNCS86PhGmvDDWqUwzvGCgrjfRmVMmVYPkFZoUtaznrKD/2RuYggDZcClBkuB2Oh
	uelYEo1sJ2DA+AgyUs7q6B1qfO7loCNz7HzH37F+zujTGLKfr4YLMyXSrPGBBlIG5/zaFmfB2jNfo
	fFjXK7Tm1hfB0ZE757Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsoN-0000000AHc3-4044;
	Wed, 18 Jun 2025 13:26:43 +0000
Received: from mail-pf1-f172.google.com ([209.85.210.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhD-0000000A5OK-0dyT
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:15:16 +0000
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7426c44e014so5697341b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248914; x=1750853714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=koiU4q0YoxTVnXt54Ni56oUUngcaWpgZTuZEX17j/rSyoha2mF+Ywiq8axf7CnmzE8
         IlOs/MdzsKzZGX0WJmyYqhLwGDu9xFUT70G1HgM7VA7HwiKol2AoplPBeq390twzyVWs
         Mw9+F706UKfuelTktN7jc6PzM3n5O5f6VxMbGC3DMKer0c85qF/fTRrow6KNAcXARtH9
         ixS0YMt/EE0ezOOedQToekokO26/WFPSVFrgp5q4Ksiytdv81XHczW+UBXcsBcV/WPAD
         4lir3NNOqhxbRn9YS+J4oPcIpeevxPipoz4jC89+EtlkhUv7hheOT7PilRE+3y7IARtl
         jSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248914; x=1750853714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=S3TXrPtHz70T268y280NsH3dDiTSYTcVoLbBvVSMsnQ5u7ucQtpaTPo4mbLNTRoQia
         3pZAAEjSouAbInMqticdqWkH8CSQaBGMHCjpZrJIVq18wu/LWero+7n9rJ+MtIwj7++m
         eQzN4QF4+cs7ZGSoBwodwxSk59M8FzF4d+vFCUA1mRMq+U/Ujo0rIAj2r1W2sXw7ofJT
         ua1ML32XKW6d6e75Ubr+sRxoMH2FMk/PJsYFozlfdVogdWz566VnErcvlOlOsCX25uxZ
         hzib6o2lmRvbyatQCUJZOJcG43/OqWMmtm0hLnBngm8IM6+RD+sPoO3ED2dV87zRCgQU
         Shpw==
X-Forwarded-Encrypted: i=1; AJvYcCUt2pMBfjNak1Nlmg6RpGKASIm7JPCS/YColHQEwB062CjT7xYBIfT5nriAMys9WY21oHm6TvvipYlIXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcyLYkLgz4/0FGA/9+v3R06LIVtD159svoIXaKvjsGh0reOmwV
	0S1gsvxtZ/G+pukaogaaGmPO0P9hVaKx1ZWncHDowOQkRED+ORjx98Bki+COh+AvYhY=
X-Gm-Gg: ASbGncsPz334vzdy1JFX2kwuYImZZNhXWyUPvqmw5MvI70jyruPIZobn6IGOW5vG/HD
	iudOgi/FkUIWCw7c6xdIUakOQywT7cR55IHl9AxkE6tbRkYAANCPxvhgSgVx1O+HlTQWgkoFX9J
	wCfZvOiBzTVa6FTj++ezAQykWr0kLIiPyLZU3C1Et+K2J+NFFACQpzzkjMAFSlNrbuoBIguxVeb
	lNgcPKTsUMmprV1S3lgWlwJZnRXxLv/BgezaVvYC1wQGiT3Rwk4YE27Y8rZZY5peI7TSzMOxMzS
	SVuuXapZTplvTwOWOfORTYUoSpcZtj4Xrc9AJOmzZg3mYGzjOB8DjKYzbfczmEK0wniKSKk5cIb
	9rX/4bsh6AQxrp7OuHA==
X-Google-Smtp-Source: AGHT+IGpDJao2qZOumFSvvfbkzlCDWzk3wE0Q5eIberU12DIM26VmJ5PFPyH0X+lTLfK2UXnDjT87g==
X-Received: by 2002:a05:6a20:9e48:b0:220:eef:e8f0 with SMTP id adf61e73a8af0-2200eefeademr41789637.23.1750248913920;
        Wed, 18 Jun 2025 05:15:13 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:13 -0700 (PDT)
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
Subject: [PATCH v6 07/23] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Wed, 18 Jun 2025 17:43:42 +0530
Message-ID: <20250618121358.503781-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051515_198181_B44B4B73 
X-CRM114-Status: GOOD (  14.38  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
index 000000000000..70ffc88d0110
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
+    clock-controller {
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
