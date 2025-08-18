Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78686CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 05:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dI5+XCzQl5ljZLQTGXC5OREdA/CxNW+kJyvVYKIbYBM=; b=aGtV8qI6zYe2PY
	1IfnFmugUkZjK+VFPOcm2w/NPOklXByc49KGsq2HXXZQqn63EW0HsHZYxp460x/lXaMX+giP1O/hs
	syLVFXfvntgs0ou+63zxwj8nofGF6HEZa+rcdOL4RqYFPYawzr17oktO+mSdyhlNxSiWADZDrlxcO
	mBG3jyuUQQR/0ThH5T+C8rhX+Ks6dQQ9XsatAPvxALf6L0/VluNIZxlz7m94eZNo3951Bu/moFpi4
	Ye4JOs/vmqPbV2M5ya5IidwrMBQrgKELOgK9bTZ9yVqVYQ5xMthoqMl/vQvT9rZ01rV2vjRUcEFfI
	MLQRFUMFryFJJgmoaVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsGI-00000006XAn-3lba;
	Mon, 18 Aug 2025 05:18:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEH-00000006Rak-2NeU
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=; b=bDzjpbDqaa8HzzFwDrJtsKT6C1
	wkc+nncDXRqz6ZqWNF6Cga1K1yyqBhLFnatqWfYYYLgqlpqIPN/co1QjTENOPM4rWWxX2C88hTDkQ
	i6cGw0ihQx0svc16tiiUHvare/IFdGz8fRDZJC9qG2cctKwPx6YXT53XXlzwELB9NhyUspFPpGDdG
	uweGWjH6o+cXq6rOmIAOQQFTHUrJ3Ol6MmIKoLa+PGvzlG2paQe+AJqaCnPCFpmbSdUrmgNkDdHh4
	UurBZJYdqXV/jDSzsAfNA5P3HaNturvEQdXqBRTHjvQ6W4lPa2tkrt5V7E2N0WNmYx+WV9s04sZjg
	0i9yWcVQ==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrDj-0000000HE84-0ucW
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:12:08 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-323266b6ff5so2128589a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490298; x=1756095098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=pSt/EVZyg1ShJ8LZ2CYItS1qBDWCSmtcjS9y4EGOwm52aCIczc17Ed4hF0VTGyDkvn
         DEemFVV1sZ2jw3CeqCfwodqHEOfvvMnlY9TY+feBNOIKD3n4C/Cbw5T0kE9YZ0We6kXm
         3jlH11JwfUbsq8fAV2e08j6Z23vvVgSH7Fd7dfzuf0MbwhwGMmmk4ZgfBpbKSBrQS6cA
         WYRLNSWiC/Yr/qWJYmniLp6bUIYOeUm5Wd8gKzot0QBe8CiAfW3fTTEfeXIbzch+xvTY
         8wwbwhAfUs7ub217qnONQiiAo1GjV4vdXHxTa0Z3jbSuspr8QU+HkIC1kwJpUSXCtBA2
         u5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490298; x=1756095098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=pp+yzYLgB3gRGLBl+nSFQfY8bAMwe7Wp8XdkvjhzIM0Ja/qbvXlrZVZnhPxwzh6QvQ
         9Pm0PbYdBXFwEiJsSAXVSL5f2PSVo5/60Zy+CifN04K0bAyzJdoy4AHYk216qDr/4+jl
         RGuxVPbO+fWjtfmQebERn+pjDUHCSnPKanHftN/ME9vE2JYvr8uHDNc0zGj7u8H7om4V
         aXljPLhuht+7/AKgShd1gAGZNJe90Z4i5dE3mCoPfCK4EYbiiudcFCDSFXVl7ckEAiVk
         0ohuNDzXmxTQV6tAtsYZpuQBL1jPaGoljF2l04tqpzAJc/rqyMmnyc1pDE+jd+cXjPGE
         jdhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVgOD80XR7SfA5MIj4GRAs7xiLZOiU9bFcv23njAbKxdLmjvCTnDP6eCP/tno6+7syzOTHRXFG15RIHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQzCOXC/pwEI7zkWtWImowCUVZNGhYnlSeuzKLGl+Orwj6Y4X8
	3KXXxx8d2d0sOLaty1sCf4+HVSRKSxN+2TtPYbs3z0kTtCmN5RbbASTJyhrORtQfJ/8=
X-Gm-Gg: ASbGnct5Q+1j71nBYLrSopUEZnWZhUw7BRaEXkEhtU94acIpMxUKyLv9PKQa29KOEhI
	hb76KQrdIUVEdcI1t5jQRB0w3DFDPZ65Z9XyQRNiK2deLBU39oixnxOfhc4NW/QeOysDCsJraNO
	UzWzeAq1ki2lm7B5ZeKSu8HmVnjdWagPQD+BP0o1dzrc6yICAd0nIVbLzTMmsZc/3A0f0+X69xG
	beb5CLRzAo56WwnwSKfTdlBf4X3wC4nEDoyzpyWIjShBcrCtN2doKs9R8STaLgk2a2iUFmuNE8G
	VCEY+HBrvo8MpzUFpVh6fMM3zobLm2pFRQQn8n0m68KrdbHgliBmK7tT/LTSOCxZbNzHpFj98UQ
	2KbZRaqvc5uFpJuL3MNSgVtXa32a7KB/ktTDL3Lv7GFUrW3jpFcc2tvg21aXT47VP
X-Google-Smtp-Source: AGHT+IFtbujOl+Pcx84ey4TUZu9YiGYdI2B8x59/rDGP8fO39Jouq7TSzRgIg0yzVLZAS0ibf52XRQ==
X-Received: by 2002:a17:90b:28d0:b0:321:90c0:bc62 with SMTP id 98e67ed59e1d1-323402f2115mr13772005a91.5.1755490298256;
        Sun, 17 Aug 2025 21:11:38 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:11:37 -0700 (PDT)
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
Subject: [PATCH v10 11/24] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Mon, 18 Aug 2025 09:39:07 +0530
Message-ID: <20250818040920.272664-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_051144_827860_2939C2D6 
X-CRM114-Status: GOOD (  14.72  )
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
