Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAF4C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 236D26103B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 236D26103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Ls+yhbJjpk3DhwILL9gCbTPCtXLHhMLKEGiXF+ttsc=; b=Tzw1zXwPPBmzrW
	SJMjdmpzRHHDhuFbOHvatbi00pNK2wgeD38EFA14FXm9+NBcMIpzYQYyV+qdPL1dLPKsIojkaJ3aA
	EmK6MOgUv9oWXaH30NyxNrnabxwYiKfIrEq1+grWukAZ6WjBtMc5RvtnITC95SofJ2c7ElyfZPbzn
	tNIZkDoO66qol8Ad4YBF27r5O+NsstsHtH87b3W5aUFQ/+s4nztxc4emD8UQCOx2Fax2mklMDCUoG
	Npnnrydvq4EPqFdJP6beOHC9vkpqB2jBScmvl0hpA9hzRBgI/85LuLtAFeViorRyWXyXqD/Qj4dL3
	FkwA+att2VtL7njjGgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzyM-0023li-Gb; Tue, 16 Nov 2021 15:02:10 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzyH-0023iN-LW
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:02:07 +0000
Received: by mail-ed1-x52a.google.com with SMTP id z10so62702246edc.11
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 07:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kwOqS25+fnMo9GJvwogRvkSXHbo1/cDLo9u1ngNcW+o=;
 b=mLUNVMzEK4BUMCYj/cCwCmE+w1wvqXCOGEQzypxCUoFFocWcls0OeUtnDUyq6+oGKs
 tlow4gZ45rhNmRho6SkHcIMSs6mVIw1YZHvM1XdUQ0a773/plSOpbMxSAbrjb10h6pLi
 05TefkG23ckZYTCAP9mOeN37dkPStJEx7OoAFR+CWSXs7KMq47Zr0aRKrHYfvv5zt2aU
 jZV3bz8vl0zFjNJQpcsUf0KIN6i34yERP8cWapimlrb+uGz2iyFBCSCzq4B5Z/6nhhlt
 4yRVBiC7x4IyzhzIhGcu38WRCYWz0WtDsqiDu8pvna6IvAPVkyilPyuupo8qUTO367EJ
 Kkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kwOqS25+fnMo9GJvwogRvkSXHbo1/cDLo9u1ngNcW+o=;
 b=vXm7z7mIpOGrTDeqZtdcd4SlMpqlTWORZOPxuqvpXyd8/lLPoAArTpboij4e8uOk/a
 Vg4VkPK92MQymYjBLxGOD7swM8FPG8EgC+AONiaPpA+/ADX41/3On9RyUBy8XsnErLFe
 w1NRY/5VTLM37xE56hhtQPzpAJ6dq7nqIw+XbRYiMD0wS3m5hCAYc/cq3KjL1onTGd1W
 2W6WefqKSt0JHSve0Q/4jTATxqrlSoye2M32+K10oyqUdikmGsAhjsbpKR2fhLUHptp8
 ZfcwdwV1oRKVYhtUZyWg6XtoZlpbFL6vAt7A6HZNp545jv5Gh2pzpuLrZuJYKi7xaWAa
 6FCw==
X-Gm-Message-State: AOAM530rMdxQwzXMwf8E7/zMIFNVRnS7UKb8sQnFQDPIl/8MG25dPW9w
 vKRtFESa+PHd46txfERX2Hwzi3RhfcHXtQ==
X-Google-Smtp-Source: ABdhPJxOwmBLJRGEymtyDR/CSk/4eR8EGR3xmUs9k6uS5SqLM/PTc3h+SoBlFXWLHbHILAZQ8ndnGw==
X-Received: by 2002:a05:6402:182:: with SMTP id
 r2mr10743518edv.313.1637074922523; 
 Tue, 16 Nov 2021 07:02:02 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
 by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:02:02 -0800 (PST)
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
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v4 08/16] dt-bindings: reset: Add Starfive JH7100 reset
 bindings
Date: Tue, 16 Nov 2021 16:01:11 +0100
Message-Id: <20211116150119.2171-9-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_070205_733258_E7BB3176 
X-CRM114-Status: GOOD (  13.20  )
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

Add bindings for the reset controller on the JH7100 RISC-V SoC by
StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/reset/starfive,jh7100-reset.yaml | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
new file mode 100644
index 000000000000..300359a5e14b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
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
+    reset-controller@11840000 {
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
