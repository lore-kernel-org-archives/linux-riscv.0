Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45389C8303C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 05:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dI5+XCzQl5ljZLQTGXC5OREdA/CxNW+kJyvVYKIbYBM=; b=WnmqG7b3JaTQSv
	FN2uBY4v9VxW8nsME8Od2EXo3yHqHJYftsQPaOmZnbPrnxteCptpPVCRFbik3XMDK8uxZcfSFOzZW
	/4Lhvgj0qISdP5fMXLNPC56hUdqFpyXqTUEfxxe3wJdCCrTerDiow4l2FkIeYjP5q8igbgg1BP40s
	0MHJGuPLwkpWBJW1d0qD2ownNSOS4/mQ8dSUXzEYd2B+o9P4BUGt+uSQ4rg1g0ez15cZ/P1MO5Qtl
	YjczYPKLWoAaZaaJ0SD5FCnDZ2RhC4fo6mqZT2eok8R7bGjRdbYKflLVA7/pSM+uWlw2YWbPa6WZp
	1yVvdcUyV3p4mm89Vx0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpuH-00000007HQz-1YBb;
	Wed, 02 Jul 2025 05:21:17 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpoh-00000007G1Q-0fkn
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:15:32 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2353a2bc210so37511535ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433330; x=1752038130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=NejMCytXHukYl1iilMY+LeqYSHfaNqkUSNLb0XTA7SYTZgkb39lhtOZuabFOYKfU+w
         jNoukC+Cqo3CIiz245uiOkxELKfjJ//Te9EE48/DEamcCL8QwmbWWuxTk5x31WH6h8dW
         OI5KTVaqHVx+B21/iJjAxph7tLB4rGLZJBp0QtqIYXM9Wg6nD6xhUvbEHnzEUw7G1QZr
         EzhYcLE0opgIRIDFtXXpjmIs33NuzuefcOHC5qTtCWg6WYCjJUa4PUxLAu78c1z7ZgHI
         SP2+3yFiUXDq1/BBbTvHD5czg179B9OjjS3U7MZUqmh1fS53d/MLpLBZAo3IxNgHFTE2
         Y7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433330; x=1752038130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=WYo0DrRin/dGVZrU6GaD883UXKU/4NoyqMXI9BglvX6Q8viL9trgHsIj5j52prrhrL
         f3aIWzc6l8msMV6U415GDZLEg1UozeybyqwxcNXpqJn4XEcCT2HmlN2UNc1xtgWfMZQB
         TmQS1AEJviAvvT3NK2PAmzm6sMH5b39C9hbWcf5Y+kHwyoLJzm2MeYOm/eaolnQa1wDI
         gVFWJmXyrt2W7/NfFDPeg1VJmTF6Vjfuvovdpladjx1H55sm28HXI6TcODHC5VxC7SZW
         77FIj8GrURBJFquxaMtSCRjMoDVFBQj0H3mssrRlMBtL9qHqGEVCHbZaYwNAvfn0qCjF
         CjJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX5IpCIrgAaXXb+ENzE4FER/jVkuTG+ECeS29ukq9p18Gq/z7rfoua3kSn/Jcf8AYeZHn5IlFA4tTNTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNs5QrVCYtjWH31ADnxtYlxtJsTnAxqgo/R7szP1Td6Vp14C9d
	J33tDI7LgKFfm8vprcEVItusabz/08ea6O6PVi0qBAjqprmbcCBggqQgxEGBZIDK3/4=
X-Gm-Gg: ASbGncu9MfswBum0Xt7yXYeh+lS9uohzsM590WrkSRiRq4RrNbTf7Hik2HTvQ7OG5qX
	WVjYmB6QefOud5C5YxKs6JIBV4NlnWyMu9g65zFdtlJ6Nc0zhuwc8XDq8ymZ3DbwlgI7tUUQ8cK
	/3U/3nnNXb8P+K2fbw6olRsHppX6JQNoGEJhDFv8g+n2k65dl+MW9S97YRkxf/21hIH3Rm/zGBP
	NGSvIytMALBo5/WXdqU5wORWg4d+S7l6Mh+vbvQiA3PbqVsm1RmkwQl0GDdCJQ3mqlTtqPLs5SM
	IlH+4d6UjXcxan2YxqJjhVEJqObo5Z+STa3TBtuQig5J6mW40G0AkOtPKPzqQutNdgplgj2SbkN
	6icgtCuEZuJBsmFQS
X-Google-Smtp-Source: AGHT+IFkSVDLCtizadO6/SefSREM+o/lLAXhKCmmv4wW4SQI87DpfrniV0LznmsSNzm//rR3xEBV7g==
X-Received: by 2002:a17:903:1983:b0:234:d7b2:2ab4 with SMTP id d9443c01a7336-23c6e4b9073mr19484855ad.17.1751433330503;
        Tue, 01 Jul 2025 22:15:30 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:15:30 -0700 (PDT)
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
Subject: [PATCH v7 11/24] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Wed,  2 Jul 2025 10:43:32 +0530
Message-ID: <20250702051345.1460497-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221531_196404_D80EEF7B 
X-CRM114-Status: GOOD (  15.92  )
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
