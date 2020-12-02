Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB581C64E7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 03:25:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F069221E9
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 03:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F069221E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xki+lMHp8WolsuteA9BC56bhXv3gkPt2Oy7lV9NUE8M=; b=lHjSMBivQ3yc1A9hjUMZUdzGg
	9pm4YnKZD/Ib6aEeTRcMBvUcI1ZPLCQb7HlFiAisKhG1aD0tL07oJ27/SUFegG+9tEB1JD8yEnRPT
	MVx30E1tqRezj4drtiSwaya1InYEoiVTsAWG8oEoFU5iDD43KtjccWCSZZlu2OHhVQ3wGgS3fCa5F
	bzaXcrBKpSw5+4D9T33UFZTbKYrOKAptWeMuBrgSn1oJvF/SUBLkDspR/bsd2L5falagtZWD3tKvf
	E/md6otrz7njRJfu7sjwZp92lthtx2nBDbGczPIjTuMYeQoCXXgGL8DYTA732qWEb2ve7XvvPG5ab
	XEuxBQTiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkIlr-0000tI-IW; Wed, 02 Dec 2020 03:25:35 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkIll-0000nN-L6
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 03:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606879529; x=1638415529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TxrkKxa9B/FbbF02pP19+yravWB9f2iZvayjqKxqkXQ=;
 b=q9wzmS1Gi0SuXjPCyIXBpnCUe3Nwsy6M4rdpunQWsL7ztZBfMJrTHTT+
 9bDjXQSo+CzFOym0GDaZF2evl6hhzfrjACb1kaPQ86ktVyoDa6vICCLCS
 SFkV5FZrO5a4uOY/fxvu+ku4NLMFyHls6T+Rr1RZfRcIJ8SY19e0KroPN
 uLx1KYLLTNQioi6lYetLZYDoGhI/CFHx9knsmPDXvFaF6PALurvikGcDA
 JRocjrUXTiFWojEGDA/b+uzHFx5SOxJRBi9h6xNMsaXD/Jx5a1ufoLkqh
 kAZ3FimsvO0jtE30nzVtFhn5N6dPLiM2xfHLIbxSToxAZtqavmkCj91kB A==;
IronPort-SDR: a+BBThhv5lBuDZF5LYHny8bTlsuSF0N++B78ctG78Y7JeZ1ugAHawq+A0OnYTcL/R3hFNnkwsQ
 O0s5Se/J7JNuVMS4tvzVjQFP4Cia0DGHGaeDpzW3asnEnYjfinEv04fvEMxPU/axQucRAG2rg5
 z24f4+MfbFUaX7zGT9r6aWT9M1bTkFWqtfyf3rHIp81rt/3TP8t9uIaW7sDoOSk0xekatkOCUE
 N+WTKI7IIm6tcUEo/7NWcJOXXM24quXSnQKg+wYbd+T/fzy2n8aUh/A2VBkgQsvLJhvBoyh1sJ
 N/g=
X-IronPort-AV: E=Sophos;i="5.78,385,1599494400"; d="scan'208";a="153922346"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2020 11:25:17 +0800
IronPort-SDR: ABrSU171YzFcD43DVckvjTvINWafkytNCGpDvtDDkT0wgogPS83rmLQZzZyCSIoYSZYP4Qaur0
 hQ+mzLd4qetvJqfkAMZx+MgqAcFpdKuBg=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 19:10:52 -0800
IronPort-SDR: UMhMI5JpTKFTKtGn3DdPgcnteq6sFQbPAFAhYdqYis0wcnyiFOQHHg7zCHQa34l1OAI8NH8TsY
 xiEIwciQRj5w==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.196])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Dec 2020 19:25:16 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 06/21] dt-bindings: Add Canaan vendor prefix
Date: Wed,  2 Dec 2020 12:24:45 +0900
Message-Id: <20201202032500.206346-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202032500.206346-1-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_222529_866104_91BCD117 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "canaan" as a vendor prefix for "Canaan Inc.". Canaan is the
vendor of the Kendryte K210 RISC-V SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2735be1a8470..a07231aaf3e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -179,6 +179,8 @@ patternProperties:
     description: CALAO Systems SAS
   "^calxeda,.*":
     description: Calxeda
+  "^canaan,.*":
+    description: Canaan, Inc.
   "^caninos,.*":
     description: Caninos Loucos Program
   "^capella,.*":
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
