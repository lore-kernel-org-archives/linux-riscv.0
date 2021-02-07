Return-Path: <SRS0=UnsP=HJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80DFC433DB
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9119B64E2A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9119B64E2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CobTpFA9scSRrNTMd1NHma5ttxWf60hziFhI15Lh/2g=; b=aRIWdx/4tIrQwRe+bsaUmvo90
	cch3v6R7en/RWWR/J1+OM/MsEUM3Qx8de1yU1Un68poJ3cmFHPvGPiccEk3T7ie3T27GutwKYU8iH
	BOAyYEw5I/eR4M/eu/WpT5T+JgH6e/vwRXKeZAgZNVvDjfbhtWa0d1PYKcheHUHtC+Q7UxLTMIKPn
	VvHvei5i04lcowtRfGpxEtn2SCR2k7skELYi39UxD7cltadWN/8sj82EOk6QkbsMmEgYg18R1GJxd
	PDYQR0LNk+GPZz9rMzICm71HUhVrOBsgwYTny5vu4SJC3Ejcpf1GAG7HqymT7oOY4nntC9ALKkijf
	KzCWVYJtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8tEt-0006Og-Bs; Sun, 07 Feb 2021 23:13:11 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8tEq-0006ND-Kz
 for linux-riscv@lists.infradead.org; Sun, 07 Feb 2021 23:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612739588; x=1644275588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NGUiJ8C+bTM58/VzIl1j0v+4iWOTF+8rASnEfXwaBo0=;
 b=ZtcPLaCX63+EYv5S/ByBHMdkcouc+WTaQ3unOelv9aur6xsP4YlcrIAS
 hgcLVtQebD3Yip+CKOKebNEAyDB/FEKvzsab7g6gS1DXmBRyljr705xqO
 nO99K57qYX2xO1D2tc/EBF8iG6ekfrJ6+vsn2Q4JO+HMjXJd7tAbzuNFa
 AUBtMCiz4yx3i3XW/XpMNneq111H2hGBjH9AM0Nt8TmKR2xhCy4PzSMuv
 gXy4vKXbUmu2Wdr7KhxEoUqLMflF0W1x2yUJ5FnMBxPOr6qx7ogMJo7zq
 SIY0CzVcMKSzmB/HTaGuTUPXe6zigW2yWZwXrnQYLNP57s3g7Ja6MnHvG A==;
IronPort-SDR: 9cE5XZmqCj2AbzZMqdJ4FMLQXcS+kgJCr/RnQD7FrISZR8r1OvOOh7XF9oEUvf3glLTKgncWmu
 v+YLd3m6eaIfnZhl95ZSNnbPRJoMRtjdS9b6Uoxpgd1Ww3Q6SLaTqi/wG73g4YrAlw6wnKLzxc
 61Ud3gHzVC9WygjopjUZMs/9ZOC4C2JubLT4IUrJV6YJnWGHgkvCO7sk/BhuHzltvu0gEa2qlC
 pDKzbzT4lE0a4XUS4zDs9EoY3UDnyxyfKQzhyXBR6MVbM1HaJfqJWqJ7C4LGwKXLnJyvYOun7G
 AW0=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="163861259"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 07:13:07 +0800
IronPort-SDR: GtxYu1ohhicXMODEZIZ927vto2x3fgQyNQ9DSUmwHyvLrbVFMKeIcMdNKQ5EvfK6qp4xjketnw
 y7JZpzNUried0kB9Y8zfhG8DUYRUmwNmPfs7xB9M6g/SawcHOCK6q5SV422OXVaKsVaE1Rr8Ev
 EVTioKk2cVcPR/ogxplwVCY+7gRjLsq+6Gn6xku88UNvujoP5L3MxUv5/im5okCwREu+CF5ae5
 bmujDW/yYci4AjpyBwaJuT6BSeUluDyIlNGBbigdgst3LeG/2gwBGCNV+TFc7+ZpWMxlKvBPCN
 BcZSoaHeXvW0SbvglMNOj1xE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 14:55:03 -0800
IronPort-SDR: XHHY8qAqUus4XDbOInV7na7FHby51DXVeI/QQvUGbg+HiRWwmBII0WTgNv6rHy9EEV2LLkFq+1
 veFL4igoAQVkKCsGFSOkhxNdG6y8ba6knVfEtzR/DzkADOuaA1XAAhwjsGsDx77sVw7Bb7RX9p
 DjKremtY01tdHYwpKFGufJMdUBE/fu6SOaQwT1tacR2akyeBpp6RiCo+FDxWNBqsf8w/uRCItr
 y9YfeQ1Vqgxps4HimSiUk+TqV2uobwOKgk+VF32rpLnrWOcUKQJMhsZfOf1cFEg4qrUp3SHJ6o
 xNw=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 15:13:07 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v17 04/16] dt-bindings: update sifive plic compatible string
Date: Mon,  8 Feb 2021 08:12:44 +0900
Message-Id: <20210207231256.115130-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207231256.115130-1-damien.lemoal@wdc.com>
References: <20210207231256.115130-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_181308_890671_E7C7F7F7 
X-CRM114-Status: GOOD (  10.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the compatible string "canaan,k210-plic" to the Sifive plic bindings
to indicate the use of the "sifive,plic-1.0.0" IP block in the Canaan
Kendryte K210 SoC. The description is also updated to reflect this
change, that is, that SoCs from other vendors may also use this plic
implementation.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../interrupt-controller/sifive,plic-1.0.0.yaml     | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index b9a61c9f7530..08d5a57ce00f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -8,10 +8,11 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: SiFive Platform-Level Interrupt Controller (PLIC)
 
 description:
-  SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
-  (PLIC) high-level specification in the RISC-V Privileged Architecture
-  specification. The PLIC connects all external interrupts in the system to all
-  hart contexts in the system, via the external interrupt source in each hart.
+  SiFive SoCs and other RISC-V SoCs include an implementation of the
+  Platform-Level Interrupt Controller (PLIC) high-level specification in
+  the RISC-V Privileged Architecture specification. The PLIC connects all
+  external interrupts in the system to all hart contexts in the system, via
+  the external interrupt source in each hart.
 
   A hart context is a privilege mode in a hardware execution thread. For example,
   in an 4 core system with 2-way SMT, you have 8 harts and probably at least two
@@ -42,7 +43,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-plic
+      - enum:
+          - sifive,fu540-c000-plic
+          - canaan,k210-plic
       - const: sifive,plic-1.0.0
 
   reg:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
