Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B871C83013
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 05:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXZ/0j6dl2PwyZL8aBz10l+pQLp0tBqGgWgYTGnzQks=; b=vYyLHU7YQxol9M
	qQnDCcLQdpXuM/XagU+cJ7o2cPxDL2DfLMLbxh1sVl6CGrptfcq82x5e5gECXiyUW+XnvYTfvmmEw
	Ul4ohRx8M2LSgy77nhvGK4VDj6Gjb8BzCyAg2hDs54EoSg/xFTOyNTAfvlmZlCdP6ykDCE2wlcRR+
	Vj7mDarwWVrKap3bqwLUGdB+JgFJ8InjDSzDWush6VbJqX/NR9HkQ3rZ29ao+Kh00PX6MAG+dWn1Q
	jDmn2QzYLcs3ge9ndkm8S6rmytoc8HhiLUxHiPiNUZQzrLUI7gJ/kXdwJoIQCNQRsPWdmeIN0G45p
	MpFdgtPJpOv6wID/Tf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpuB-00000007HME-0lcl;
	Wed, 02 Jul 2025 05:21:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpna-00000007FkM-2Uvz
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:14:24 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-236377f00easo48259135ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433262; x=1752038062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=CzpxzpSSpqkPqjVp49MDvc9dyIcOdJFNGahrM9ZbuoQVZGfVl1RwaS5sxoo87zDdBt
         PdA7As/dZYFUh7lKTfySTnLwWjszAoIEgQHuRjrQKAdGaqEZ6Z55W3ufMA2mysoFHFm7
         Pjk4lNh7ciCaL9AvjP3l844AuNgoIZ8iDzPRPJmn91ACpoXMoAmPEjgXIYlZ7ksVcagv
         s50teN7l4rAeH2vTdADITQ2bmiquw9SwOOc0qOxntmvfXJF3/l9Fz9jQzxJp3FsLv3cW
         0SQ65P8IbrQBNL5BRvpH6/BotLCnLFcoYhARG8xCddTd0izOlhgsMPf+z50bZeU3P5Mh
         7pAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433262; x=1752038062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=iYtqnW6dE++X0H0QU3obghwKAYykqYgyaUcZ2jYYugq5rlQgqd1ooXefvilk1ShVFW
         5gEt5LMPuclfZf8y0KxhNyLE29cHOWcASvEacMMxOAmxLBhZu0XOvzEfDeF2XSZZxJ5C
         iPN4/AEOX1IdshK9bCTlJLo7W6t0iCU9tnuNuHEGvqyTHikHfkH5d1rq6oTVEygTafCg
         AJHo34KrfOQiiv67o/bfkH9WMkZ3Qf4vKu1/MnKLCI8r0jWYHCCv/nPywvyeybAg5a75
         AgN1yYKfM8A1Lqbq1W8Z5CCb0roHOsosdSdyzf5pU0lSEgDwPExXufI5S9YzoauJuCmk
         oMiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/sxSjLnC/PvJNraliFFXHZwtk4WcmFHZUwFVpKKNGTW0HCnrX/pZINloWx4GYipU1QAfVL09tyQiiWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlJxmVL3buJzkcg/7QpDVQoslTdaGuUj0cyN0bKdbJMRu30yeu
	BtR55pEQMF397N0dn4cWIJiBUTDjVs0UxbpIqB3QHWXEnVDxYxyOrBJLUCNJmShvD7Q=
X-Gm-Gg: ASbGncvbA4datUVUsPyrZkSMe5KFFeNaxSuOCH2yNk5D+aLktDXJC17OOlz0d21bdhe
	cewcqLyf2cH1fAlnLYa02Pv+oA8FNaaJx/54+rN0t71HcnuKQBzoJoTjRQtEqL8hrBC1P0BjNYE
	4FZvh3n1hUUtHLjTN+8sSkcH5CO7oVm8J8BlNI1CYg7ZW4jo8K8sWhhGxKhRh4aYrIu76M8vczH
	virX5Nd4ucP6oXPt93r9X0VwR0Ik82H+RYx7yszjsSQ3yJ9UGUtCyAb0lp56NRAPqbXyu57H42K
	Qz76wlC1EEkHXlzBgdRhKSvHP5iO/TCCZvN/BFxiiYgEgjPfhu8UFTWjafm02ctBMweYXDr03/d
	2k4Ve2wkeyji/21/p
X-Google-Smtp-Source: AGHT+IFyaNYbGu3J51YigXq7SSnInqGclIg3bY+r/3Kl6d4xMMAbKmX0D6qCx0IXUy6MpajxqM48mw==
X-Received: by 2002:a17:902:e852:b0:234:df51:d16c with SMTP id d9443c01a7336-23c6e5826camr22426015ad.45.1751433261848;
        Tue, 01 Jul 2025 22:14:21 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:14:21 -0700 (PDT)
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
Subject: [PATCH v7 02/24] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Wed,  2 Jul 2025 10:43:23 +0530
Message-ID: <20250702051345.1460497-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221422_631711_35ADF5F5 
X-CRM114-Status: GOOD (  14.31  )
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
