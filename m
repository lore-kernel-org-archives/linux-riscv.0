Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE07C83F05
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXZ/0j6dl2PwyZL8aBz10l+pQLp0tBqGgWgYTGnzQks=; b=CGEUu+w+EnrgKM
	EOKv+RIgb/lkz8CEfeSKMGl1kbtVkua+sEqAeaTuG6R0Wgd4A8fwrk0gOKzPRb00HNonR2b9AH9yt
	x7mnPMERriGxcuXgc+8luFQjgCL57EwA59A1kyDsJrURn8dnrUE0qfuF65pCgc5fOY3zT9sNItM9j
	aLJ2Eo1nQIC/qDwzUNsorVZuA9Tcqf3UNXHlGoRB3s4IDVfMqGwUpol2zCk06nR4RvfZ1jtaYnlAa
	cRrFvHlWdXplVV3U1hGrW54A4DbcEYbcSA4sSVqVMKUDIEm6CUPD2o9OtICY8mtGjQWv5nPqw9fq5
	NPtHBiHW7QjjpNURy5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaVv-0000000DUqr-1N4k;
	Fri, 04 Jul 2025 07:07:15 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaTQ-0000000DUGV-3fIM
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:04:42 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso500494a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612680; x=1752217480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=gwa4wPuAnKwjVcnf1a8xsru4AhOYLvK5t5Wl5CNLw8vOiUqVXfHwbT5YpoYepTKcy6
         MbdKoAkXXwbaPsjIp8v/SZA1XFSRZXLryPaNa23YZl8qCVYc+xHne2FM0ete9zrB+zcl
         YhWyqRYQKPZixKz2mSoQoRUoK3x4kjwUdR5hde4BDa8nfgxpEd50UFnmzW55GdiOrUAP
         WZjx3coN9GGDFT3q+ULXGYIk2dx84Kq2YC7o12IK77Z5oBJhllNelfM5FJYgpZGy8xvI
         yjMZ/OGPbZEQqraKHUf4YEAY9raBWDqwP/lM75pZ7ReumUHR8fpfadBlNa8c+hd54yuN
         bXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612680; x=1752217480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=hCbqPlcIH9eO6rI+GGk+bZS5NqJNvv7Yqrpmdv6fgDRy6Vk6OF3A9JMz5gz06HKei6
         1cP9IQgLZi94vPn39Bbm9oVQ7t/vKPbxE+Y7VHT3J5nR/6Qp9GBm8bI8GVg+niT+6Tww
         tuYIsoYqiBsyKkMHzDAogFp0W20cs2m+Hl37vvRCz9cUpIMYGv6k2XDG4yP04LIW523z
         ExoE195ycjVFDiSmRrFDmGtBcN06wWmHCLBQyWkgncnaFEnBcp/nbiUI4FPuyhmrQ+A3
         acUnmaKYwdQrxCDxxwJredeoXLOsqYitrjJYy4HBS8GsOjl6NMYGfsAutWFRWIQV1oQK
         6zfw==
X-Forwarded-Encrypted: i=1; AJvYcCUT/NoiVPqniGPnK5jQRmLshuFvEfgxODSWC5sNlfp0n4New9pi+cTRXVlmRU3AKVoZiQyqVHjyv7oAaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtRmOftcAboC/qRRqSIE5JKKYILH7oDpvq7ggGcADTbYts1my4
	mTJ8amhgU7XSYcxGFq6TlcqsbYtcISq/nE1nAfGhGgORpwAvWwrB0L0XGCofVit/F/4=
X-Gm-Gg: ASbGnct5/i7ZHb2n1Cg/o52G8xOO5GriysGDvuktuVHFJPVdnxj8hUB7iIrYOIDtV1C
	GzfntZjGfx7ckkHvWeVOFfDDB819Z11q2Adl38dJtQmRSz56DVbiqxrUxbqA0ui4kkhVOJizboS
	RiRS9LCjVDXe4H26UqCM6V8epNyIKvGBPGzpYWPY/3rzfC7xW/MdnEIcVZR+nnmMdj5Z1/G+tBG
	uoOLcoXENYA8KziJkcxOuwp1OoKzJ4NF1ghyC2mBHwDROS8rZ2u/KarHy8UfQr7s+MnNeEQothf
	Gr+20B9F7AyjdxC5mOg1EkwG7QHxoPiqGuxGBGSU7eLC6B6X2+bw6BSPwqKewfxEp0i+RLxNBx+
	HWBxcqIBrRuB5LZow5Mf9/+yeig==
X-Google-Smtp-Source: AGHT+IH7pAY4DEaeFD0g/LqQ4vl0f8jxx2LFhaIvUOj/iUdZwYT735N07dZ29I38RmiE/z8zxFQSjA==
X-Received: by 2002:a17:90b:48cc:b0:312:26d9:d5b2 with SMTP id 98e67ed59e1d1-31aac212971mr3321434a91.0.1751612679913;
        Fri, 04 Jul 2025 00:04:39 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:04:39 -0700 (PDT)
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
Subject: [PATCH v8 02/24] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Fri,  4 Jul 2025 12:33:34 +0530
Message-ID: <20250704070356.1683992-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000440_906234_288C10C2 
X-CRM114-Status: GOOD (  13.56  )
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

Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
extension as a mailbox controller.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..061437a0b45a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V SBI Message Proxy (MPXY) extension based mailbox
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V SBI Message Proxy (MPXY) extension [1] allows supervisor
+  software to send messages through the SBI implementation (M-mode
+  firmware or HS-mode hypervisor). The underlying message protocol
+  and message format used by the supervisor software could be some
+  other standard protocol compatible with the SBI MPXY extension
+  (such as RISC-V Platform Management Interface (RPMI) [2]).
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+  [2] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  compatible:
+    const: riscv,sbi-mpxy-mbox
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell specifies channel_id of the SBI MPXY channel,
+      the second cell specifies MSG_PROT_ID of the SBI MPXY channel
+
+required:
+  - compatible
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    mailbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
