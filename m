Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A76C02198
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 02:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=59AXPLg+bSVWmoPOiEAbp10n8eZidVthMmNDy+NgYcA=; b=FO7eh0Y//DYgaf
	QDLXSiuBCa7VjaXK3Saqb2mmXYEWa2tek/eXV5bB+N8OfQP0groccB2MlYyFjMVrW7NPsPUzCli7c
	Ly8KpEhrofGvTXJG5ja9s54sIj7C1NsZvviD3jnS6VBN6JPL8Crk8Hu2lqxYB9IGRsSirhvKdmnLz
	EioO0SOK5JbEIuGKPox99qWRBUvI97FuahPVPaiMR091uQDuhFR0gOpgHyzICbLkk25hdjs483KTU
	RlkVBLwcHmoa3X6F/P0sohcxvxBT1guswt7sC4a78MulqIDlnNdun1qPibaLdiWkjef5xBunf94Ki
	TRwTyz55JOwpM6JtPzWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOfG-00000009Svh-0CME;
	Thu, 13 Feb 2025 02:09:18 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOfD-00000009Sug-3X0s
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 02:09:17 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7c07c83b388so11318485a.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 18:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739412555; x=1740017355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMzBCZUxKjxBjINW4Q8NZwZbLLoL9o1dpVjVjazylMA=;
        b=bz/cyW6ygMlrIGG1AlhLD3Ljg6yk12AUwhLBLNe7ByTzeOwwATcac7Coi7GxHqrMpL
         B6Pt251Jc8tEr49xdTrSTk6y/02dexBgwofaN1WgA8Hi8ZCynmFBWU3MFrl4JcRoW4Ot
         XANTD3Q4Z040AXBo02d5PqhbI5gWPEg3z2LK/G5y201Ttjhmmw6vGVBuPH7xPAJdSaRn
         PqKMUkOTrRErnxnAISCa4f9wLDPWrN0697tJgBkBgjzDwnM2wO9SDtKfGbXFcyQQBMH7
         3RgIN4s+1Chfn910o53Hjt7W+YQqJnHqc/KpdjN3PNDl1YnlcrWFeBv4ou+OSaYsFQWm
         QxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739412555; x=1740017355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMzBCZUxKjxBjINW4Q8NZwZbLLoL9o1dpVjVjazylMA=;
        b=WKGWCwRdASLB5viHtjl7vgWQY551DbM7qcD0HdKbpvvvbe46fQfE/WaiHozBBSvuPZ
         Fv8PupgCM3S6W7SfK8AckLduNr3ObeeJo/wSoVJocsvOQwjYhDq6tu9Ez1xDwXbFNgqC
         qqG80SNcWHJ7iqBZnihZ3JfkEXY+SdVwj+CShFY0FdHBPVYjsC+jooXwyODZ5682rO40
         TEvX+h+/3EOoXYswa28Jx4l/xcC5ICXyUEZQm1SJ+UGK1oonE/28jzt0I3RGL8xbhN7u
         pYb/mZXl2sH6aTtDuXtnZj8z9M8uXdXKfdsT/iEPA9BlJSbSYYLq5EREIXzaB0Rf5h9U
         y80g==
X-Forwarded-Encrypted: i=1; AJvYcCWoOMAay5XTkPxfqvHhXdULpfSQjmOYUU7RC6YpiihNjLCXCyNvrdQ0K8oasxBMHJrqOFhk7XESCu/S/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrLBgsI77CdbgGn3KskVYztjE7isnTbyPvUz1b0O3Ugnc8YBoR
	TTUHgsiA0+s7+uexB1bOw0OngECvSXkbkQs3+beZQyx2XUnIT5D2
X-Gm-Gg: ASbGncu7KV+bvzMaeqmBLaHfNPZ1VtTInAHw1MacD3TVwIcxmfWwkV5fuBpBRtLNyId
	L0HUisl/2Hj4zSbuuUhRa9o37Pl/ZDXU+1g+J88zRndkMRCviJ5SK6R7Mx9iCVExcJ8uDHxDe5F
	I9MHVKmyylNvuihZtsPC/WLXXupcQY3RedGuSzM4smJ2HIrnzJqMauGtvZXiexTdAWXl6SlWwQB
	oR6DGrxCen7xqtLYrdlgeuBdlDHWyK+jlt6zivxEU99l8tdnYf7ozpembX7jKDb0ok=
X-Google-Smtp-Source: AGHT+IFzSpeYmkmhYNfuU0USr4lEMhOa2fMmDdTe/rH8ObQkGxuUEDVUfTkUCRajwBoAp/WW8kS3Xw==
X-Received: by 2002:a05:620a:2a06:b0:7c0:7c49:a435 with SMTP id af79cd13be357-7c07c49a614mr89674885a.52.1739412554676;
        Wed, 12 Feb 2025 18:09:14 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c86e4e0sm20092685a.91.2025.02.12.18.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 18:09:13 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/4] dt-bindings: reset: add generic bit reset controller
Date: Thu, 13 Feb 2025 10:08:54 +0800
Message-ID: <20250213020900.745551-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213020900.745551-1-inochiama@gmail.com>
References: <20250213020900.745551-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_180915_881351_F6C57BDD 
X-CRM114-Status: GOOD (  13.39  )
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

Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
a simple reset controller by toggling bit. It is a hard time
for each device to add its own compatible to the driver.
Since this device share a common design, it is possible to
add a common device to reduce these unnecessary change.

Add common binding for these kind generic reset controller.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/reset/reset-simple.yaml          | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/reset-simple.yaml

diff --git a/Documentation/devicetree/bindings/reset/reset-simple.yaml b/Documentation/devicetree/bindings/reset/reset-simple.yaml
new file mode 100644
index 000000000000..77584e23e8e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/reset-simple.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/reset-simple.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic BIT Reset Controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description:
+  Some reset controller devices uses a simple method to perform
+  assert/deassert by toggling bit. Some SoCs from Aspeed, Allwinner,
+  Sophgo and Synopsys have this kind of reset controller instances.
+
+properties:
+  compatible:
+    enum:
+      - reset-simple-high
+      - reset-simple-low
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
+    reset-controller@1000000 {
+        compatible = "reset-simple-high";
+        reg = <0x1000000 0x1000>;
+        #reset-cells = <1>;
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
