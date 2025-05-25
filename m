Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CD0C54E90
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rg2mus7BFs54Ixz2rU2r5BfrE0WNRQ2UK1+YlKoqHQ0=; b=Z7nVShIhRDBrsr
	16ZrQ8GA9B5E9RL18fdFvGxuAAcf+wFLkMB0treo8hIOz0dV+ld9AJ91K+VAo13Vm53ktu0XptlXd
	3hzHuPgaEHz1sCH9DdWXgMQBdkvqfuE7O3Z0aGSCth8Oc2UcLxyCd3FC7TnbRRTgbVuZzEqz+nwX6
	89c0YjfTm4kb+pX/B/ITLbwwiwLKVX5mTxB0WHuJ7y7dhwBD2ewt65QzcNsVkhJVWcJBQ13hlSHaS
	szaT21ohvzQLPx9U7q5h2ifPKE0rWj1lELfFiHku/aYFuOW/P6HOPL99v7Ba7mV8sPjT1wum+gtPq
	eAaCO5A5DD6wFZsarc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ8D2-00000006vKW-04YX;
	Sun, 25 May 2025 10:04:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ72f-00000006n9y-1zYN
	for linux-riscv@bombadil.infradead.org;
	Sun, 25 May 2025 08:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yU/DNAxy6LD72V0mVtTg/UEQNRHKlif24WvYR5Aku8k=; b=CZo6b///Cs1WTi651h5IT5LxtT
	F1lb7tJiQ9pllEOqujCegr8wM2d2pn3JZtd7a2R5d6bxL+bqN47iLUbiRgf/wKevhAwtYw+aQZOuP
	JCuf0BWm0YPE7mYRmN+hBoqVRbQlyUCb144MfF5wd8PikoddcS2Qf4WbRoZmYJf8FiXtiSaVGSDfh
	YXBcGiE3yVx0ukTTHFKyGHS59Uyp7DffTmarnqshYKKwqMIrYtePuFb9MvUxK4I+8r1OPhm36lmen
	0QFysOsvOAL003dArkoNKrpbRu5oMCyCiYhPwy+G3xNSeeW8F7HTRjNg9VSNN3P7U4GxhtHtBVgYm
	u6jzPx0w==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uJ72Z-00000001Zue-1c40
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:49:11 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so877043b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162945; x=1748767745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yU/DNAxy6LD72V0mVtTg/UEQNRHKlif24WvYR5Aku8k=;
        b=YiRxL/ooyGQgZP+kjQFjTrBVUB0o1qvcyfz8eHPfwdqtqT6FQJKFcbicAFChPO6Cn0
         705y54ECjMjXUVD740heU4wjQ/28SH7QAGX6oSIcR3xdEFMBWOK8uVIJ3Yd4Vx3p3ryh
         NhJH2rzUuUQHS8yud0RNCKzZHRgmDBpHcrNk4OAkPuvuQ7NFfN+/5UDUwTL4trosVvSY
         o51DKCMEBkvXQP11JW19vLTByw5C/PEB0FJPRQC1GrkctKPmH5ZUAtGcQBzmzuz9mdwa
         5K+Ixs2ZiJK9fB6i+E4GPWoYZFiFE24NBQQLxPdE6vWBokaD4TLaVm64CCFc0kqHZJgg
         xOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162945; x=1748767745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yU/DNAxy6LD72V0mVtTg/UEQNRHKlif24WvYR5Aku8k=;
        b=cF3Dua9FADK/RjPkA/UmLF0nJXFe2vhvcpIepTJuF7jHvnovVr8gTLQhJ+lBnYZQyH
         2RlvxXQRwcsNWJ87fHDasMGdCXMSMLg8yuK+EIVUng1M3qvkcAs77p+giYouqFwy0ZzN
         Hfm9WL7kj5ZHgtueas3wrmwKiZRkKRk8Rttr5cC3W9522cmbDo6r2fCgUdUK4zGShYks
         6+ma1uatRBhh572prPpnJaPEnhD2b7v+yhuYMAu2etDhnlX2j+UwtQHlMMEUKhTWiTAj
         KFuv93N08xGNSOPanxXNbG+Y3LXVCiezG1H0x+SUMJBZrmzcrmNXdJSLKzwZY8gFnzey
         j4zA==
X-Forwarded-Encrypted: i=1; AJvYcCWuOERISg5e7OughIVV5Bl3v2Bwk3BfB67IpVer8giwP3v/8wTUIDKG5PAZPkiIf1tyS0I/8sD+IaoICQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYX4o+FbvnWNTQUW4WIT7eZAuzRj2h19rDycK16/g4fIAABfTy
	OFAvJKrr0L1EMClkw0lRG+XucgPQq49NrrGFLl5pRLEop/LC+MEIA0s4HqaJh8NnC6o=
X-Gm-Gg: ASbGncsA+OlX9nxYlCpEYDA76LnGmoUEMHP2FrjREzukcASGb7mFyB32gTqaA7KcuM1
	hFH7p0ThBUBte7+wV/MvC24GVX0XuYQsga1roDZZEmEjD0g2kS8GYWucg1pd7QibpboTJwRZU/l
	vJeVF5ZkfRDuxg0bsEsDBfcAB6VyutD8dWxg2hXrtsznxUApu32z9WRpSjW4+Fggkfp3+M6MMsc
	KnNvD5WxrHLspE3m2//8du0+7pVUsF6L0zEP2rLNJrjmjSmJxUyCnVqy/iqhw9XBDA98Ub05/Qy
	Hh2cGuFNqvDqK7Q00a2Xk0fwdKKqKgVvWrqmFdY+eIl9czCrwuLhkD8TK3LIt4iulDUuz+MZeoU
	PywxAWTCJ
X-Google-Smtp-Source: AGHT+IH/fcI4Z7YkM4eWj7+IfWaRWzXa4Www+cl3fFM30tPCyJdhZKdj4mWnUuJpZel2KT/5AvPyKw==
X-Received: by 2002:a05:6a21:3403:b0:204:432e:5fa4 with SMTP id adf61e73a8af0-2188c299855mr8237866637.23.1748162944740;
        Sun, 25 May 2025 01:49:04 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:04 -0700 (PDT)
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
Subject: [PATCH v4 12/23] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Sun, 25 May 2025 14:16:59 +0530
Message-ID: <20250525084710.1665648-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_094907_712879_6264AA41 
X-CRM114-Status: GOOD (  13.97  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RPMI system MSI service group
based interrupt controller for the supervisor software.

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-system-msi.yaml                | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
new file mode 100644
index 000000000000..ac13cec0666e
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-system-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI system MSI service group based interrupt controller
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
+  The RPMI specification [1] defines system MSI service group which
+  allow application processors to receive MSIs upon system events
+  such as P2A doorbell, graceful shutdown/reboot request, CPU hotplug
+  event, memory hotplug event, etc from the platform microcontroller.
+  The supervisor software can access RPMI system MSI service group via
+  SBI MPXY channel or some dedicated supervisor-mode RPMI transport.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    description:
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-system-msi
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  msi-parent: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+required:
+  - compatible
+  - mboxes
+  - msi-parent
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "riscv,rpmi-system-msi";
+        mboxes = <&mpxy_mbox 0x2000 0x0>;
+        msi-parent = <&imsic_slevel>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
