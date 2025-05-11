Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B33C3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4vijWJsPyO1u8uY6J2wI3CMaikYFaT9xBuIYoQFBh0=; b=sEIx+VO55M9DUm
	OEZVivoE3V2xRFw2iC3/9UqvMvnMlGVu/oQrmPESxOG5WJbV2HzKo+BcspeAGhSXVyegiTW9+aEqa
	s8F2IafL0pirfEDiiUp0udT9YPqzTJH9pOS9VaQAuaeh82QHHqVNtAkhHuZymI6siav7PKb97dJ0S
	T/l3yIJUVBE9Fbi+PQNwPtThaAL6lLVPVjn3RKW7JKklpRYMmAy5c6VAZpzn2roAtMzM+G0Yw8KB6
	dbspFtE/wPqA8X1FjoVuarXkf1HgwKdlySqRVOCkhVcmT00J4aOvcjfFko3yYdblemiZ3TZsHtftY
	iO4hbLEhikPbVj9mtfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6vk-00000007HoK-1ime;
	Sun, 11 May 2025 13:41:25 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6vh-00000007Hlo-21zT
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:41:22 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22e70a9c6bdso52151125ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970881; x=1747575681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYmzV5+laFQZlY1OUMxuPLa7G32W7v4o4U3ZvBmHKpM=;
        b=W6NGXpN+rXVSemTOUKygBAf8WK7777NzSxy8dcqKE9QPVmOPosiv7DEeUAYAiStUbs
         lY4QVVEQy0VVNyEvj+7NrTl7+1C7TGKVt1n+kYN7lpXta96aa8cJ9H9c+2XeWfGtkMs8
         /UnG7fYwzoi63/XwRJoAKDkF/RuhV/CowZQmMYqrh/yk+N2Uu0wAed23gPKWQxTcuXbL
         jX47/25rRGVMSyXOQz0DYJEwXSiZQrIx1HIO94wShhBh5ydJEN0lszUMx9w0dkrErZOr
         tTkRIABijH1jLbw4TpePr58mSZCESxaf0Ezgye78MZbncShpbFhulpV15Ozy3+WwXwp0
         5/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970881; x=1747575681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYmzV5+laFQZlY1OUMxuPLa7G32W7v4o4U3ZvBmHKpM=;
        b=ATIUR5VEnpUXPtYb9bWNsis3Leu5qbTbBRN3ZANkMKwBjUqFrZs5elcEb7+DMkJJO0
         Jhneh7Lww/N56cC1q75ci4b8Euow5Kyn2+K2LQ8nFLqQQeohqDJ/fTni/HTsJAmVXCjO
         6CTegkJaySEPF9pXCXbsrztOiiyrb4cC/QAqV6jqfK8BPxSah63MPP9G0QGs03xhIY7B
         oTfoUF6/zHaS9WraiZ57G/NB1wlt9VriLlAYzAgPuwxG02YW7FwbOCMpe3js3yUjhrnh
         fAVl8/cZhAKdnvSgdioHupTXl6X7+uCj8+9Zj1NrsatHJNxGxjxtbAydIwcW1+g31ZMp
         dGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcWqFocvGp17VHWRG6lcymrRYIR7A2uSw6l1fzUUTwVVVQxL5thoVkliS9bCjhLz+dyYKa2fsxKKhFUw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1sSfrfK4aeiyx8gu7oBQYbn02Ipmzc6zGlE1ssS5qamtTV2K6
	jHfT3IfAc+g80PYQJENnGBJr4f+GRWO4k91euC9zQrUOsJRq32bFFSiqTxK8RM0=
X-Gm-Gg: ASbGncticCM4ERwRT1r44lU0Tt3U2k95rHF6/lBaLGjxSE8blnzqk60mCzYs/+b+tHt
	THPInrjy6Tu3C09smjcEt/SAt9IACprZFWah3xWKPHk86ooe9wAx3RJSh5jA98JyXxPiUrOUhB/
	SnhD8zJd4rAOPM81HGoL49rwbFK5sELhwt01wjzxCb5S5PPGtoigP0Ce60y8WjXnr3uLqLrrrG/
	vP6Q21E6cUKGVEabyxIEW4YPz1pjiVp7UIqRThjQlzCTOHOzhy8DJnUf7bp6VUbWLMtt82V5j1H
	/+UBfNwOfg93ITUbrcVBm0+BWhMEyX1kQueGEM+8zy3rmOaARcNVfb/izkfRTOOJlzpj0TrIirm
	vuOza12F5ReLyBj+BvlNZDH7N
X-Google-Smtp-Source: AGHT+IEfaxgrqbXpWtZS2d6T+EevRdeE0WEhWEel3ocGJ+bMO5Ii2RhRjdLhMu2s/pa8PLRyJHchMQ==
X-Received: by 2002:a17:902:ea01:b0:224:10a2:cad5 with SMTP id d9443c01a7336-22fc8aff172mr172444685ad.10.1746970880653;
        Sun, 11 May 2025 06:41:20 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:41:20 -0700 (PDT)
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
Subject: [PATCH v3 09/23] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Sun, 11 May 2025 19:09:25 +0530
Message-ID: <20250511133939.801777-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064121_530211_5457BB7D 
X-CRM114-Status: GOOD (  12.60  )
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
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..9c672a38595a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,61 @@
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
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI)
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
