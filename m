Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9ACC677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YW+R20T50Fyq1DOh/wk320dC8JZwaQuxDPeOtJneVBs=; b=iaxVjbEW/9iBs2
	UgdHgdETDc8zKSN/VQuP1oxwTQ2djzXz47UZ8PB5KyP0ilBt3KqPMljHSvDAChQii+F/2l22Onp/C
	/XkO4nrtLt01LgZkb4y6Ra2zQSvN2dPhEXCWH1PW2jOBdlfLNCPe5XG1GYi/skiYPJv9LLFQTJJqV
	plyJA8LwJwAepLOpgVDjfJJ9cXoonzIREDx4/YNMD0oCTzEqrD2BMhveHK/11w65/ljDvvf1UvyAn
	1acdPA0YOc0NJzRGohekqMCZe+PpnSR4dE6cByi6P/lHIzER6v6dhrMREqTStaTPCKEGLFYlQrChH
	J613vRPs7ULgjkwL2pww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGzA-00000009Jul-0x9T;
	Wed, 11 Jun 2025 08:39:04 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEsh-00000008zJh-2sz8
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:24:17 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-86cf3dd8c97so507449639f.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623055; x=1750227855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qbog2jwuTz9DCLB0jUubllQdhYVAN+AQfO1Y2vWOezM=;
        b=aAOApLMMY2p6Ame1RHkDB2PeyWB1QYYBH2Xv9YJSBlS7bCYJqEtkCqU7TUXVGZ7eUD
         hw+xb/JSixKRhihibvsFLQJoWOsvIbDHXG2fthQJr/NqQJB5JpxJQW6nfeuwTXzt0d3V
         o8yf9YX0BMgqC7LQ0ZiV/uCkXd57xdwGSIIgYMY6JNwr23yMPcwwklviEAk/biKNFcD3
         rwlFWA9rW/uIwLIWOEeMTuDZig9vtEicxms4xhCOpR83x+x2eQfctISZ5CeaeHlgJF7X
         ySaWhiERzV2PJMIdoMyPcByvVy/d+pQYvkBFf6NtDEJXG2Vkd+Ba3R7klBcDxs109lVe
         w5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623055; x=1750227855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qbog2jwuTz9DCLB0jUubllQdhYVAN+AQfO1Y2vWOezM=;
        b=rBpiT/CDDhuPqSwPwfm5GKlgwC3vV/G70oHwowSyIAZ24jvIPk846IvQsbl7Eh4CQ5
         KKt9iG0G+X5ijGI7vGgRy5+zD34A4Rmg5JRm1+/OOIJ2WQbI/PW67t37khRGFhz3s3WW
         eP26/VZercbUIbN84i+3jbKTcYBfmuZVUZS9UkZbjimwmC6kTI849SMlfbrd9CvQaYRS
         mrMGp/xzfpGPcpmzDCNXxmA+W9olFtDKowiuTW1PxZ9KaTSEFgZDiEiMgyIyPPgqZooe
         WLxH8+VJqzQuxJdswA/sEekvpLGkduaiydImeKbGvYN/xIPBCXdq36StlMjDg9E7t9oU
         EQ0g==
X-Forwarded-Encrypted: i=1; AJvYcCUgJA456oJWARQf/V1Hm9+FdFV2bzlCxXmWQS0XC2Yx/9PY8fozeK03HbczGNEGRM80cO3jTdUp+9viNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEuxE+/yF2inLdF2mj6zCZ7yZKq3RHhg5nr2xPutMRFdQm5mx3
	lrvWtR77uDmNFSUZzkwWpwDryNfV/zrPIHIJigxSjYxKndSUAtBH4s/S5y37OfunjzHoUX6vaKJ
	Z4Zo7snY=
X-Gm-Gg: ASbGncv+FWgW2nvoGRd3rKRLFQwYu6FKvnlNF5OIg/V6Z5noDyRXiGv4F+QpUmgW51K
	8mqQpr/agaGHhZGd0gph8f2Go3pprDjyFtmcTdRbfsRPzn8okqXF0AbUwEhlUp6Yz2IfJ0tawef
	zD8qye3F7j2k8ENAOx0HVHtWibJcsli/FTtuwwpP86Mx5c9UOG1309ohvDvT+82kMPb6WWVPiPJ
	PHPao7yLd0KKhN1bSeFFNE5sIz525Ss0dbvMk6zhksbje5UNt05m5Tm8dLDf2Fu5fcMFfCWdkx4
	R82lpm/8BRo4+klki2LQ4yaYQtheOdrxBgur7ZqEvxbvksdaZaRpQ8M7iukIz6mSB1OuIzdc1nz
	2Oj+r1zLuQQyEwnoYF2um+A4h9A==
X-Google-Smtp-Source: AGHT+IGE45Nw6cMjQHpSv5lLGxPQof36xcySb3y/f0xaMoClmIInPuw4tRKfvCta688qmeWHkxBrmg==
X-Received: by 2002:a17:902:d2c6:b0:234:db06:ac0 with SMTP id d9443c01a7336-23641b16ccbmr26600515ad.45.1749623043547;
        Tue, 10 Jun 2025 23:24:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:03 -0700 (PDT)
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
Subject: [PATCH v5 08/23] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Wed, 11 Jun 2025 11:52:23 +0530
Message-ID: <20250611062238.636753-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_232415_727703_2A28E394 
X-CRM114-Status: GOOD (  12.53  )
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
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..5d62bf8215c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based clock controller
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
+  system clocks managed by a platform microcontroller. The supervisor
+  software can access RPMI clock service group via SBI MPXY channel or
+  some dedicated supervisor-mode RPMI transport.
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
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-clock
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  "#clock-cells":
+    const: 1
+    description:
+      Platform specific CLOCK_ID as defined by the RISC-V Platform Management
+      Interface (RPMI) specification.
+
+required:
+  - compatible
+  - mboxes
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+        compatible = "riscv,rpmi-clock";
+        mboxes = <&mpxy_mbox 0x1000 0x0>;
+        #clock-cells = <1>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
