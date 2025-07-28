Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995B0C83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXZ/0j6dl2PwyZL8aBz10l+pQLp0tBqGgWgYTGnzQks=; b=05yTAEi4MXLrhl
	CJhjeq43jWDGgs4mnpQUmsTXSeGnUdhemhMBYgFGFRaakS9wyXgxMrhj9XDTexX3aQg5sStOIJp30
	TIIriI4ZqIlrg67/LozdQ+/eT3hLKxUztrJGZTjqwv6yKULWpNpq2uETEcNLS+DiNWCgysEB3SrN2
	YmfUrVZnoRkYqlvE2qhM4kkrv9ccZTjPBBuV69bcl5rv+dengjCiPAKAgWLpjIz/jJrjE2UiPPAP+
	PVn3igwBKPYwUf6v6ALPPnsiySHvDOOfS3XEI8kN/eNcWvbBkksu3a6noEJ8M8WU91V8rWODklIpl
	BY5HwoC9HBEgElmBDErw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKME-0000000E7gR-1E1s;
	Mon, 28 Jul 2025 09:41:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKMB-0000000E7fL-0jg9
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:41:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2403ca0313aso5028815ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695678; x=1754300478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=UdZ2Tl3AZpALoPTQ/GTV38A3+EvjK76Yeb/yQWTnpI16nllPOxf1WhMgR7rwAGOotE
         PkUqlJN9C9TgKAwGWboXOrNDLR4TYHsDF47nPOnzZLtguXUf9LmpP0IWX+Hx2LaJ++RB
         FZSykrywyzb4afGhOjMH4u8jIUyktn/OACKeWR02W2ldJoQuv6suVERM6eQcw0haRCK5
         FMMGELx7wnq9JjqoLTZc/Cca0UZrhmBSZc06v4bdeZuWQw7CM0pCe6hicwct+eOjkFU6
         3LuqelSXZ1Cr43cH4W7woRVr6MCLIo7RDO9SkF3X24vFzJha4WdcFj0Sj0bRPjLVwhVY
         +kKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695678; x=1754300478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=jTWLnF1a+3fucMxMSd1+uSLdRWMvxq+HkciI3DG47QHDhz6OrdUUnOFdtMRmKn6t0H
         7dTzA2HqkCS6mFFhbrBIiJd1S/LXK/WtK8tGINrvaqK4B3XJq1cLkt1106woGI36xs2q
         CXwrAIcI3npfqzrBdm+RvxB2degoK2vMYGqPmSbi5G+R0Xqbkzd1alKbbZHyO7VWwoCk
         sVLNkp1I3oKuVml9h4MHfU9om14bWAQxadB9WkPIkXpwhEefEmxkLZp3kZHYOvd+bOzv
         iWigfbJmGSObAqHKNerHGq95ghov5KanZBLTimwfLMZCnRf9P8OjeNcTiTNILeMYPZ32
         trng==
X-Forwarded-Encrypted: i=1; AJvYcCUtQG9dElsxoIGsQv0fXLdfrQ7fvWeY0woj6VrdX3A9YRWykAST8nDbQbij4HgUmU4shvvGQb3c4dLZ3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtmWxOj7luc4gM+2CyDSsWgD77EwMabbrv35Lga0yzTO7gs7fe
	PrNMhK1mJLBKtKDz23bnzsE2kHe39y27q7WaPZco+z6fmVr4+VWgrJCE+rLogO8whYM=
X-Gm-Gg: ASbGncsgpzBVi3unlYhcVX9SXaGs4WRo/Li5TfdTAtxhbdXJ9OFu02Dci1ekk0LsOGH
	F1DUR3Z0OVkHUW+qb1FGakR1u4hdlcqF3sZW1lNaNHe+uHYRtR9lArJIRFLQZZElc4uzJlnh5SS
	C1uTJrjYFY7brAvNVquP7EfAuKmQT4qMnOh/t9ykAgqF51b2Foogdp2yiIrhe81GMmC4NMi4WQ3
	vmGeiGlz//BvUT8QRW8k5uvx3t/sW2SciFkaLaGYcN6QK+LhLJsyLIPEyucBtsRR4fT81SiDGF3
	fDb+ywNxPagPQPHhtXDHJJi5lUS3Ddw86UDlK19sBM1sP+FSG2vwEtcwbHUxpVoZi7w+3JPQJQ1
	rTRAz7RXGmG0BnJ0pAA9R4ETQiQAmp4LVoe4ceXKtH6wtZERxncicNdagxW/L
X-Google-Smtp-Source: AGHT+IGPB6scD1Zk4kKbBNRYJ5Lk4+napYWqr+HDkuGBNA5LJwRU0oGXH2kwfbLJJQQc2lzDfZNUsA==
X-Received: by 2002:a17:90b:3c04:b0:31e:fe0d:f48f with SMTP id 98e67ed59e1d1-31efe0df8bamr3693862a91.10.1753695678152;
        Mon, 28 Jul 2025 02:41:18 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:41:17 -0700 (PDT)
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
Subject: [PATCH v9 02/24] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Mon, 28 Jul 2025 15:10:10 +0530
Message-ID: <20250728094032.63545-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024119_215400_FFB35845 
X-CRM114-Status: GOOD (  13.34  )
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
