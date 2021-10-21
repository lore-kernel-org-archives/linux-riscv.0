Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488D7C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCB7C60F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCB7C60F9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cozHNyyVUq1yEkfhTR3Fy6hzRNbD0cED0hL5GtsUfAg=; b=GoRJBddPYAxnZX
	+pU0n8imFMEo6D7pmJtSDyq659a8LajZeU4sn3+aSBmth96v9JNOVkq4BnuKwB7S9zC/QeLEEdpxp
	mvPXZ1EH4mJS+z1Q2kFQQSpB8fmx+k73dfcErRKSWkZmITIfJydO3cLtVr5PNkup/bwkpQ6JGMoOG
	u/LDUKvB6ETeaoKs3NO1aHiR5//5ASDpc3+ZouRATNSQLzmUhWRhYJzPrnv3xFfHEC3z3oZzDDsYh
	JEmVRhWhwrVADeQx6XYnvo3bzZxPhNpwmjU2temUdhXObkUbeyCJmpVS2RWcDjzpEXZ8L3EzGa8kH
	zkg89kwpZPJh1W1N6sHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdc5s-008WXN-Hd; Thu, 21 Oct 2021 17:43:08 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdc5V-008WDx-A2
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 17:42:47 +0000
Received: by mail-ed1-x52d.google.com with SMTP id r4so147720edi.5
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x5LltJm0AHQyj+WPNUjS5e7tQDzNwCAlJ2whlsgxBts=;
 b=qzuVBqgmXZSmarIfC9EXtckDjvas0GCObPlRUyYZinOo74LNnvmxj/S5YfibPG0mVk
 Cdfy1+cu5nnasZCjg4hZhO6QDZMnwWfeTW2DCeFw5V6I8i6DCQYMsWmXYFaXxSuwQ9Jk
 56ZHDTkBjHsmsRfxf3mxMslrMRPekBB3oRHOd197hYrZ/aVDK/v7kE7lwGO2xD/8OWn9
 4Uc74ZlhYVOvgsXSQWx3q493CQefECPgPJUPvG9j+0jHtbM7DrVWkMUQJ7al25Q/E6rf
 MMuTWNIm/bUgrmDVJRboqjq/yJZPIFHnJ74Lk0Kk6Thja4cEWHKSCL9i38xmgupg6CTD
 VDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x5LltJm0AHQyj+WPNUjS5e7tQDzNwCAlJ2whlsgxBts=;
 b=wzvTvoAb3N41piRbXUpo5rOdHFNGrDNsOfhhDZvK9vhJYu25UVMb12Im4mIBhfLzk3
 HcbNlncNauaW19Cwf6LYtlOGfR2qn9psfUnxAK5Ym19eFlvBp83KO3QB3NbdRl9HI4ai
 nO/pWeIiIpPdSslVPAeJh6RqJ4ScMeCCQSZK8lOAsB+qRdwvanRHrnzjObzIx/IGPhgQ
 81WFw4D/FaihAaT/IiNK2srecurc9P6KVC811aenpwD7JItHYCbcSFZXIZeHi3xRqgn0
 IfMA6hPUhsvGW33dGO8z764qWgaz3GwsvBOQtM+3/9JlkMcWIUplpBUfMBtbWj3lasGS
 QLhA==
X-Gm-Message-State: AOAM531QkbnydWDnZb9d4mZx6ATHQL37BDGeJfYkO2FdjkIz8u0XjCYx
 PkcAW8ptwzdbVLAcLrhnfHE52XRynrWTGA==
X-Google-Smtp-Source: ABdhPJysKYORNZ7zZCL2ud5ZvrT3iD96H3agntQ4dKJKrS7uqqXSGW81BnZASTrSohmnX+3HRgs+HQ==
X-Received: by 2002:a17:907:16aa:: with SMTP id
 hc42mr8757697ejc.39.1634838162614; 
 Thu, 21 Oct 2021 10:42:42 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 10:42:42 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/16] dt-bindings: reset: Add Starfive JH7100 reset
 bindings
Date: Thu, 21 Oct 2021 19:42:15 +0200
Message-Id: <20211021174223.43310-9-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_104245_403651_165632F5 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the StarFive JH7100 reset controller.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 .../bindings/reset/starfive,jh7100-reset.yaml | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
new file mode 100644
index 000000000000..c6ad5d7ad100
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/starfive,jh7100-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7100 SoC Reset Controller Device Tree Bindings
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+
+properties:
+  compatible:
+    enum:
+      - starfive,jh7100-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    rstgen: reset-controller@11840000 {
+        compatible = "starfive,jh7100-reset";
+        reg = <0x11840000 0x10000>;
+        #reset-cells = <1>;
+    };
+
+...
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
