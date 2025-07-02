Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341B7C83038
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 05:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fXIgMunU2CcxgS7fVFYYYHSTO/HOWdx4cW/xZMCIhs=; b=zHeRhGpr8QTREg
	ngF+y8j2Rl0LMDqnbPJB7+NhoSZaDat3u9OkNVBRL8nMD+RLa2HQzX0rBKIdJ6d/77a8kYFkZncqS
	GZtXLpv68tm6XdQvUd0BxkWPo1UU2hzw4JiMStLNaOjy+2/jiNUE7/h7DzuYH3ELp5/6TiE8vryJ5
	wtVOTdEtUXnoqFdqRviUhaKCMEDXOHHytWFEKjdp775Lv00XgP8o1BLs0nUDPzX1bC3VdmjUwBTMG
	uikVhtmK0Itgo+IqPxaTezgaVTXvC0uT3nbFPXo44y4TdsVaJu2YpNtDROInneOmHNdlUKhsbWwMA
	2+tTGQ8u7H//FKdU/GMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpuF-00000007HPX-3tAa;
	Wed, 02 Jul 2025 05:21:15 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpoR-00000007Fxp-3rah
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:15:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-236377f00a1so65058535ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433315; x=1752038115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=Qp5Himlm2YRPG9y3nqfpwjqbYqbe+kHedh3MApkfR/BJRvpEBKkCmh+ZA6hkNeNR45
         pQSdCuVecxHPTGK7njtAkhFVV+WncEo++2J86ns871eO4Uc16WmZ9PPiNee24a64K0ip
         msf5+n1Ckrq46788xjN3QVmlyAWehtqs/zHu9MlOAcdcsWcv2cKj6qvqTjlK4b4Aczik
         vuDYhL7NEViTA5tMhH5MViVWShJEpCpryCw9CxTsj6klJ4q3oEdg/3v1BYRtlAqgDt9U
         NqfkVUl7nfO8z+zvFvg2SxRz8O3a4NkLqAeSl7Hq1sl1TDE+h7XDM6XSjE+57cvKLyEy
         7POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433315; x=1752038115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=P+DvXx2Avk8szwjmfmaiJILyokuafQs8+OBkOxzTLQvl/wtP7dxHyO69GbPzxvsWp4
         gK23NFfZdpvVxfjwVFM964GmHaIUrjZ1ZffgZZKsr/BOarvI8nYsmOp6ByUWxUoFREYv
         +w+iSyFxeOWVGsESTxOyWuyVJyiF1BozTBoZtXktMw7fvmSk/TDMugWXLU5UyfJHoopX
         adEf2SwzDOa3svHOtnSo4+HBB8JpbR1CyIfak4QXi7/D543xKpFmxfRKkBeCa9EE/Zns
         JDQEAvVFPnlK6/FEeZuxWTh6Qwz7gsvbfR2PZo7XpaRFjZmZtWw20BEW135oPFEpJC1H
         CVfw==
X-Forwarded-Encrypted: i=1; AJvYcCXdHfeYsZhNKhwZawyMv2Tw++cTjt4OhUUrKJ1pVp7iUXFNwShvr6sAhFlHA/WNfsgBdk16OY4vebUeBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/KbMlMIsbDKHTuc2FH3GqXS5rKtVweoOf40VVTXqScFjRiB8F
	cEpEeSTNoKGrdzHscS0fffEudIA2ABRL4KxNzNpZdrwKPzMxAR4T6lP3wcyOg4SQZnU=
X-Gm-Gg: ASbGncsEEBfAco8irAm000UkH31CgOTwwpFN+qpjMF0YRXkjhwPRJ3942ju+uk2G2g/
	cYjDxfXUrILmmFo8T0UCVNL262o4oiyAsP4xiJD3zvXwwNHbbbSGaf/YqVKz/y01TbI+XfgP/VL
	XF5TdRwTrE/C/awRMTdsCyIjNV8T50MqacEba+HMThEUuSZElFguJSDw25j6/7XmASwst5LFnKI
	FR4g2kR2hpJ8A3EuMX/1tm+cLvYgqjqYUlVtbYgHucGbXEoa2TeYWTXzd9AdSJnAzliPasqj2Q+
	QAzoHmrbWD5x3pmv43dDIyTz3yXDiyztN4p8MzSldWjiD6m8y1AE1Un79pfQwCHvUILW5dCRwH6
	G/QVpplQ1FThrxRUt
X-Google-Smtp-Source: AGHT+IGMgggDnrWmfF/y7sLrYD7q8r2h5NmHNdzY2iKqbrQlHfhi5a/4jD0kNAv2DXNo1e1e/iX9VQ==
X-Received: by 2002:a17:902:f792:b0:224:c46:d167 with SMTP id d9443c01a7336-23c6e501a07mr21381315ad.16.1751433315023;
        Tue, 01 Jul 2025 22:15:15 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:15:14 -0700 (PDT)
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
Subject: [PATCH v7 09/24] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Wed,  2 Jul 2025 10:43:30 +0530
Message-ID: <20250702051345.1460497-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221515_959922_6CABBAE5 
X-CRM114-Status: GOOD (  14.29  )
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

Add device tree bindings for the RPMI clock service group based
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
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
