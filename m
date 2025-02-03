Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B896BC02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 08:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQ3s2YLlI1tcrBlcnenUY3rBKde2HZKFn9ZuP65dnGg=; b=BrhESvyKrGDbT2
	8Vf/YbsUVIqyBV0bCmLOE4qXq8bvUG3vpnfJmtMgvGh1e4H3Y6HmQBbZmQEz63yhhGpBXqfxFTpN1
	5zgnxiMXQ1wU1GGEWSisgO6ALZ8NkoZXwAmbfEoOVV/k4JnLe1x9Oic+pKovYIph+7V6hGCh7Qhnd
	oJADnX3Zk5geODBIYx3PX+irdKF89bdZjh01VD5B+3Acrm+own3seJvf+RFKGToYPm76qpPF2KOim
	SSZ0Y3bXTpASuNf5K3l9mxUH9Gx09CvQp5ph49tHwGedAH7aTtmTMQzimxtIKXw91RBgeqqzXjNW8
	A6nmxLU51eRsWlmCGhqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tes9d-0000000Etqm-1uoo;
	Mon, 03 Feb 2025 08:50:05 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tes9b-0000000Etpy-2CLp
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:50:04 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4679eacf25cso26954451cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572602; x=1739177402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssg9a8o6gZjpZvchZzGUt0Qt044T+B0HdxLRYjAYuuA=;
        b=jkqVw1X9TMIK23aEQVIjsPPNIt96grFDoa9to8I/gSMGx4BBpogKvvMjs9CdSwfCVB
         n0LpTp9oVkXg5QVvEDgb5rsLNNBZW1hy4SYPbjMzvy35G+CQx1qD0tpP27VwXrm8Ouvt
         2YV645aZvu7Ifg6boJiSpbzM+wBp2tDNu7g35DQnVb5PteHuTLBmZIJ8QIkx7QxgcAxS
         XVxXOh6RKRis9eFMn4k9vfIlwwSGiAFfB1Tjh9csEhmHZyssnCVhqHngUjkALKGlwFRN
         6ojkYAKoFaS560oob+XL1VIyKrgBjVM0MiO3bTEHVJwLFPnSybHMMvSdpnNWUGYBLx9Q
         eaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572602; x=1739177402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssg9a8o6gZjpZvchZzGUt0Qt044T+B0HdxLRYjAYuuA=;
        b=sVenxNlRxbHMTwAaZ5XrKRSAz7+GeHcMhzQ2IAXq6lVFZQENAxohJmHTqlurxAUYAq
         kuOAP0iA7Rtc2sUqeJWivB5r05v+kVUp6toKsnl29O8sSE5b6Li5ExdkvQZ6tUNWWHvr
         kwZcVsq/bs5Pu8bCjgnD0Q+Mr7L2wdPWDl7BHJS5aiwPh+1FdXf+jRr2ob8/KO193Svn
         vzyCF19NBltRkkUsMsxl5VFe7D9TPfYBuhFN/THM7rtg873VwbQShIArOvlvlS4DgfJG
         470fCv19m69QXt4YX4w8BqcSw74liW28C2j73rzNcJ2hFl2GhcbCJBCrWgoe10xtNOGO
         k67w==
X-Forwarded-Encrypted: i=1; AJvYcCVeWJngpeUqRRXAM4o+c3bkpN2LuVdjRPG9E4Fx+8IbhVVJVzfwRVthsjNxANLt2IKwiy/O6QQjS/gx2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFkCpHAX4scBaCihv2/MwDgw4EydM5rFlZqq/RLrnvPz2yxveI
	ksD9lBtHkXz4LwRkOF9y6nyG2mGzIOeFTf4GIs0SFgeTbdv9Jg8fMVvv/MR22Io=
X-Gm-Gg: ASbGncslKsXsI4xuPK+8P8elEYzvHNjGrrCq2z9yFRt2+Rq7RB7xGOjwBrgS3GZV1yb
	ENoBXCUSViizRzsNZt0AAroaonxgyv+s0QnQcK0W0P9pMDWONPOs9eZ5OxuS7snggIePvq1YHfG
	GJWT3AEwex1g1LNGZ1EJMMpF7u/IJFBT+hIC1FV0jTown5p6SmmGxH1JvdCCJRTb/Rc1My000je
	2wgpj3DSL2oILrrkHMV+UwBSjsH6TzDVhAFFxb0zj0re7r+SNNcGq2KqXaVtZJ7YA0TKpk2XDIW
	UhJWxn+ev4fFzlaAxgcE31HVfVyXSot89ttMu1m++olzle6FE7sC9xw=
X-Google-Smtp-Source: AGHT+IEumBd7wOc/wh3jyz0afWhLZy8y7yKZMAluEJD5UqFuCGfrMInxfJFsvFE/QBEyK9tHDtTWWw==
X-Received: by 2002:a05:622a:5108:b0:46f:cc36:d51e with SMTP id d75a77b69052e-46fd0b68b70mr329868001cf.35.1738572602314;
        Mon, 03 Feb 2025 00:50:02 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:50:01 -0800 (PST)
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
Subject: [RFC PATCH v2 03/17] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Mon,  3 Feb 2025 14:18:52 +0530
Message-ID: <20250203084906.681418-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_005003_561782_C0ED4211 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
extension as a mailbox controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..8a05e089b710
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
@@ -0,0 +1,54 @@
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
+  $nodename:
+    const: sbi-mpxy-mbox
+
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
+    sbi-mpxy-mbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
