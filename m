Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E96C87FC9
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 10:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dI5+XCzQl5ljZLQTGXC5OREdA/CxNW+kJyvVYKIbYBM=; b=Ote/biMPyc3KmB
	loOHsplYOVqNId83SuDQ0Jqy9lc5xx7m/9fiHtkZPwvCeU2bJvA/AFWsp1MM0fbtD5wBoh4YBizGm
	wrFT/bamKnzNFJq6jVZyITXynvEouwPhaMK32TwMxiDXbEa4J9NJ6fqADPq8i/sRD1jR9mnwtEwN3
	VmTQjeLu9wcvku2FxXGC8+IrjTsZQ5spCucgxR4tsP27lf0nCn1ghbY1g9BgFjP6gdSXSE3A7PET1
	YFSBhxt3amIuuluab88rGPxHni/1C6pIwHTkHG5/fm2uz1HEtgPUcSkLCa6hfqeOtTylnLNAYHj7n
	W+b7vDxzgRxrIUveuJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLY5-0000000EI27-3gCJ;
	Mon, 28 Jul 2025 10:57:41 +0000
Received: from mail-pj1-f48.google.com ([209.85.216.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKNb-0000000E8SD-2EwT
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:42:48 +0000
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313a188174fso4163820a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695767; x=1754300567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=f0BVSstdP0HaPuCjHIiXuVDMczQ53Ok4CdkXAW9X5GO7aB+vKqhtR8EEIu3pfUOhxg
         EipN0TkM1px6U9epRMzx3eH52T2+Kie2JiQVThDeTb3iLSahLH4DRAYE/jVN686NVl16
         RNhndKX/QNoOCtvfSoGHrJasG/gBHyx25WrrpXy/ddVyiMVWeg8aSrbJ/LPuIo9aj9w3
         il4E1BOfXI6yRdpptG6Bm+IEhPKC6QNl2yoV5Pcmow0oPYRpTQdaGxyT8+J2jUQEn2io
         w6LOfl7GxBQSP1/gwst7txztfFkARV5bwOJ/svdGo4d7DWyGITq6hhzDeNv2LsvLn/U9
         c+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695767; x=1754300567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=wq971DkRiGDrYkboXlCQlvI4F9R8l21Fag1i3MtZOnWX6Bpk5149emxEHs9B2wGNBM
         MrGeJmkx4bovX8uFFU/hrRSV6kuxOadYZjqM5KMD2I8aZknQvBrht1C3S1zIK+yBqKMn
         aFVDJYldkdZSQ5tMOSvJzpVDVwaPGEButu/UiTOAmJBD1cBjmCMTrSqQXUTjUlC0k3KI
         GF/BNNS3PaPmgA1VyuoY7pYpbfX7eIMH6WfcqUwi+r1dD9B76rdO6i/nClsP4pKSWXv/
         NNFvnHaZXvBvapwHVomCsUkUksJozViXYDEi7V/jkak1FhIbQR87x4BlHReE+zV+ZlOc
         kfjA==
X-Forwarded-Encrypted: i=1; AJvYcCWClqDbjbFmKWae/FhoQYKrTgN8Bmp2aQo+3VUo2bnPyQ8/DVIAQjfCHCwV8v4ROWzeEPc5p+VmRxYR+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXDCylGRmEs6UkVdsWcGAxSjx2i748pycSQjLplmcZ3lcFJjTY
	HdON4ameKZEFfWsUU276lrvZTsj5gchIL2W2YpPTfsQnLNik0LhiFnv01/h1z3W2GJk=
X-Gm-Gg: ASbGncti+BNp5zbTNxd02V2Et9fby8qPDuV0KD+QtZBys5XKuMpmoHgzww5Zzu9XLn0
	neTxnEUPs9jx9Ah9BWZFZ0Ne/xnbD94+ebRaYW1zS8WeEfMfjk9U5kBps+qK2oEPcBW0s8n88Pr
	HvDLyM0i6GdQfqHifXCklwTRj7+2p+Ec8bQ7g3ylc35cqwTMSORMzVe0tXGaFYi8CCPDBi0Z0AR
	Xtxq11vsdP7ZvXAOAeflXfWQiq54aElUZY5xgKRmu5gRBf8iNQgMz45GWIqoOk3qmRdnXPRNazJ
	Ppadvf9JiFjxp+G5hO3dMV/lNi6x8ZEEqZKDCLflbT+S8rTMwAUp3wr64efbagZtjd4uBr3iGJU
	2wJQ9q+B3ITmUdkskDJWwzadiALK0cYcA3OoxMgV/ILUOx3ST+BIrPMb4Fpc4py/p83qoXPY=
X-Google-Smtp-Source: AGHT+IGcRASmkNddGc4f04TprnWEk/VB91d1zyko2zPkLaF073cuPivETe+66fbsndZxOaOB4DsHkA==
X-Received: by 2002:a17:90b:3ecb:b0:31e:e066:c81c with SMTP id 98e67ed59e1d1-31ee066d220mr5005093a91.6.1753695766325;
        Mon, 28 Jul 2025 02:42:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:42:45 -0700 (PDT)
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
Subject: [PATCH v9 11/24] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Mon, 28 Jul 2025 15:10:19 +0530
Message-ID: <20250728094032.63545-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024247_573736_5D40762F 
X-CRM114-Status: GOOD (  14.56  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RPMI system MSI service group
based message proxy implemented by the SBI implementation (machine
mode firmware or hypervisor).

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-mpxy-system-msi.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
new file mode 100644
index 000000000000..1991f5c7446a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI system MSI service group based message proxy
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
+  The SBI implementation (machine mode firmware or hypervisor) can
+  implement an SBI MPXY channel to allow RPMI system MSI service
+  group access to the supervisor software.
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
+    const: riscv,rpmi-mpxy-system-msi
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
+    interrupt-controller {
+        compatible = "riscv,rpmi-mpxy-system-msi";
+        mboxes = <&rpmi_shmem_mbox 0x2>;
+        riscv,sbi-mpxy-channel-id = <0x2000>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
