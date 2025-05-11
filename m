Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FAAC3ABCB
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kCLbqI0G6Q1AoFXFyDIyKGCgwkGZHtsnnAWh+8FLmg=; b=k0LshFWwPHG6cR
	a9KHnMZtc2L2+muuXzZFVgpZ7fKGzTkznrNF5TYf0LKwLKKNu2iCq4TwiS4PIMziVaNohugp1yjAs
	UFtxuum+LhTlgQ2+fQApMP6zKvQT7As7voyWLXTJX0hchZIdym4rbNEUp9hQ9DXVmrNaXYNDX/HBN
	8RTFPO8yZLCOB3ccRw46IEDOb10n3goQMkwphqNCEHOggcQ5+eBzrXw29Kai4keqGQhRMow6q9rGa
	Ibl/MXhA++d2WfL14Tt9SMi6KHR9JVaJnyEapx+X7KfMaPiqLXxfOxBXRXDlKSf/g3U9fFbXLTHP3
	kQ5FpMtGXMjH1BWW1KJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6vb-00000007Hin-2yGo;
	Sun, 11 May 2025 13:41:15 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6vY-00000007Hgi-49Qq
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:41:14 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b074d908e56so2325089a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970872; x=1747575672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoI4ZQkvSe+gzPq+S2m1Njfoq5y1QbcsqoJbpZojWCQ=;
        b=X3A7HtdhibhFcBDW2qw7a2K23x1zC/LQrqonJTiFTIm+2aKYs2vvmDgyN++hgD/9yi
         /sd5K3aIuE4K4vP/kwr7uGC1L6EbuPZOUaXhfUSGPRF9hkJaNwQ/MoUd32mPAGOJXj4Q
         fJVyjXZMWNjUsBLzFUQbDScs3Df5PgAgdG1G4fqhpZlaPjM9qMFg9enoWmj/i+e/5s17
         GH4VVKBGlh5FfqzsX/8w8gHSQcSI/r8htNc8bLbPW3vGjJGIc+7qsbjky2c9Dtx59rkc
         ZA6ZvUA78cRG5k7Cf6WZjqoCVJwKoUQ9CvL2YtvzbYLUOw311rcuLmZxmA+ROOBVlUEL
         Q9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970872; x=1747575672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoI4ZQkvSe+gzPq+S2m1Njfoq5y1QbcsqoJbpZojWCQ=;
        b=Zj5Z91edPsUgIAoABoyi9TmkCi2mle2dqALg2bG2d3hzkotp+23dvFMHGVEnnhzYur
         5Jdx2mrCe/p2xDPFGil8rP5CHfcg6j95UXG7hiPpd4mMqgJTUAbevfuh+EoyL8KvQLFo
         FUa2auyxkXCYP/QLqwodMRcKNmwGG8BZSOWXR2cqj6S4spGHWpeeKId4dM9xgCpBMpcn
         81RfwefB1n/NPsoCT5gNnGQS96iwdKi2rOYCt4sr7dq+ey8In0wArfPhHcmEKW8y1/xA
         hZPX8H9q13wvAIJ0YzaYyIC9VUudhvfaz90kt0NyxM7LbvYopbMfSkw1zxq/1LR62kRd
         KoTA==
X-Forwarded-Encrypted: i=1; AJvYcCXXKV72H4rCj02VYctS4YndvUyMxvXpoD9xR2p48nlg6fUaQ5V3Ugw+WdIx6dMoZIPPAA8n9+MhUXAFlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfW3Qg2ncKudKdst/R5Ilv1ZGHDiz3kNj+rSTbNAwNAa/tAzfI
	2551URk1ReXo9G3OAhbhMabsQlTVhOzS35Y+XyENolMbhC0ju48RIl8BD+RdQvU=
X-Gm-Gg: ASbGncu7BsqF91oNoDxNZcOfpZWurj2ErUwAcb7A5RlT6l8n0+shx+KT7omWEwFjrXR
	LByGbFIFwzlyt81AxDGsG0G6R0ulUiWQqN2ldCt6IM5R+eY2uMZ6xN2zuKEaKABouaD15zcWMjb
	7wm/OV0nsNAEWIYyfahvkP1GhE9mXPMwBFRob8Ojb7/l7kxWfwOseqV5gtScVLpKqKB1qTBzF9B
	vG7BfNZswincFTmNhsgIXEtiE2Bu/yhWvZ/EgHmZEv+gqgv87FZb90C7IINeeaoipsFC9TMdLCO
	6mRgKcYj1omViVNaCF6Bm2vEz2GPR0jGN203sftkQKO4xHM/WpG8Bp+1F0FzohC1FqXVkxlnoJX
	HMgIGp1Q4HOMM7g==
X-Google-Smtp-Source: AGHT+IFOsC3u7BRod28w2sEoeDfkPdrCH+VUf8yCcNu+XE6UmNmhrKz2V4ln4eo8Qilt/cRL+1dLxQ==
X-Received: by 2002:a17:902:e94d:b0:224:f12:3735 with SMTP id d9443c01a7336-22fc8b7c82amr158337005ad.31.1746970871937;
        Sun, 11 May 2025 06:41:11 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:41:11 -0700 (PDT)
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
Subject: [PATCH v3 08/23] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Sun, 11 May 2025 19:09:24 +0530
Message-ID: <20250511133939.801777-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064113_031917_3388445E 
X-CRM114-Status: GOOD (  13.45  )
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

Add device tree bindings for the RPMI clock service group based
message proxy implemented by the SBI implementation (machine mode
firmware or hypervisor).

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
new file mode 100644
index 000000000000..39db52de86b3
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
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI)
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
