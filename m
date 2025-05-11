Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2BDC3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNA3q2cBXTrGMtCmCE2R/8gztd6dYg08WJ26rpx8k10=; b=L5j/b/lPsfUXXO
	u95dCXLbI9WvRlbKEHS6sbCsITOx3WXY8TMemJl9qXqXIJAjTMj2KG33At9LWbVzNHXYV+iCFjmsd
	urNofsCDjL39lQnwsDc1IcCMzvMwa5I/uFZOYo8trHo+5ezDG1Rg1C0RVTO0E/qMaqt/yon/BUW4D
	Ui55c6AiIKdlDNE5yjZaqtgIu6T6sFldyZN0yonv+3aGobNl1RRrKuWp1RneXqX+pjqDZLZjkZj1P
	5ilx1qjLTfolK1v53Qv6/3iCWq6ihDZCgPyvUeYBNL0LYzQQr96aw5N+aVtSyyPxXIeCLMXOg9p8i
	0yTxQuKF4D5x81JsDlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6uv-00000007HJQ-2hyE;
	Sun, 11 May 2025 13:40:33 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6us-00000007HHD-3ash
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:40:32 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22c33677183so31244385ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970830; x=1747575630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrq/ed0KxjpyuTfPVgQBHoRGk1JS2/KTrIUQ+VEc4ns=;
        b=PpAxx5txyUI8XozODEeR5RyMwIm9dh5ZdevN6Jq+Xr2COi9Uhj6V1F7rkV9r4hL+UI
         kZVAk2QsBb+G4vt+Pec3m5qyQGajAME1ftp79L30TODTipAp0yknAwS5F8nbhOZw44Dg
         AZVkiyBCYqVz1O1q0G8cPg2jvrahUPqsn9WufVaqtSQuJKOJUe/IzIxt/tEoUUf0OVbT
         /fV2SKlXmWU8AD1/B7315UUnSqRfsXeyh5rHNbzg+5MiWlMvd9hdOEkFtSoj8hbT5irZ
         OeV9tW0OrHePbLdE6fltXy/ZYYnGbzEKE0MrDNriWS6exxBZ8Vj4BEtwCWbBFR1MpB1e
         mBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970830; x=1747575630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrq/ed0KxjpyuTfPVgQBHoRGk1JS2/KTrIUQ+VEc4ns=;
        b=ROR3GdedZ6Hp6yGmEXugmqmY08s4mt5IzdkDGrz0ZTBk8R3pONSImuKOfpTKdvNu5S
         S5bmKne4LIaRflEFMd04ZIPIZQVqryh+3S6wEq8cyiPV4f6C7AAWvueHuqyr3FfZawmH
         9YfFIacImcmNInWsF8qsfxYMeWkuvLNSTVNnLDl1RZc2oJdxeH/Lcxm8LX1blL8+RE8F
         5EP4SOA6Dv7Oj36YGBQwYshgTxZEXPEIAbmoL5M/jmAI89wCF4jA0kGUhQDZdb9I8hs3
         YeYaBep+8/3o92JTfDnu6pznQMulLrkCs3cSxcH6DmOf8zyvpmuZW6UKfugZr9CzfbLi
         PSJw==
X-Forwarded-Encrypted: i=1; AJvYcCWiY17mK+gdnW/ri1r2XOk3EG82oAyEkUowxH+nt54KgiTFwh4xfEbxNsrwz6W5FPEKFqeccW0tXuW0gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXnHdxih46f7XQxsvr2vyVPouROZEmTjKe7zoxpXxO0dk0wdkd
	5zpXsPbyG7oDVBhcCYLccD/BEesGOBo54eJuFLAMbqokiy2tN252iEtJOe58sec=
X-Gm-Gg: ASbGncsIxgLFqoj8w5zdFD6AYFr3zXF+hQnjoRFbf1hBIgaYMFP28LXslcIlqMqZHIt
	Th2jxgYqo5yaQNVKb96KDSkihwnPQ6ReaETu1OdQDDaOuMvkJZddW7HHaBabJmJFT439ABR3XSS
	Dx9mfWLk7YomzUXimfMjdRUdj9uQ3o7my/29cRE+zYNv31tyS+Dg6jmyEDG66gTTQKLBzZpVeDz
	HZJs6fCRI8zY4EU/5I0u79H8XQoS2GY+aFbD1VLRfyXYmcCwnv/XWCszsijPPhjvi29+3uJCrEP
	LtTpI3KG6wsHsaF0zO9yiPVJ8H50Pcmw8BgtnP3h0+s18BNCSPInKPMFwKDcjRGl0oc8OdQxm2X
	3lj8Y61vOtYEY1XM3GNy6LqHY
X-Google-Smtp-Source: AGHT+IGPaG5lK9RQjMv7rrdrCjCY/xtoEPE2JRgHnbSEInfBFbrmMEp72jKw6YqleNzDHesrXYvq0A==
X-Received: by 2002:a17:902:e94d:b0:224:1074:6393 with SMTP id d9443c01a7336-22fc918c44amr161896895ad.43.1746970829854;
        Sun, 11 May 2025 06:40:29 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:29 -0700 (PDT)
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
Subject: [PATCH v3 03/23] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Sun, 11 May 2025 19:09:19 +0530
Message-ID: <20250511133939.801777-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064030_892962_B31A2F63 
X-CRM114-Status: GOOD (  13.02  )
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

Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
extension as a mailbox controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..ad4c135e0510
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
+  [1] RISC-V Supervisor Binary Interface (SBI)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+  [2] RISC-V Platform Management Interface (RPMI)
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
