Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73910C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:02:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2541564E42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2541564E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CobTpFA9scSRrNTMd1NHma5ttxWf60hziFhI15Lh/2g=; b=Q6lawvXREJLwRmDSsy2t+bZ7M
	PXZ6h5t3s39i0qhia/t1Fp78aRuW+5R4D1kohjYBnqY3ltBUPde/EXBgYu4Y6pWEaC0dhRBWknRvc
	08VI8xBZrD3DGekOsbWgixCf3Yumr8FuWIQqJ1fUxEaeUkerfBzRyvfs6IuvfulFr9JLw+Cadaf4V
	zc+PSUfx6jufjuEw6E1ZqzebBjiWEGZXEKJ7irBubFwUkm2R43gw8z+iPVQ6GxFzJYte4Px9AkzlR
	F0tlasaCWSC085iQf7XNxj1zMJT48T0oaLiDEsvpzbdqc508zH3cs9CYBKLvLAaZd5iT+0AvSKvnQ
	RZlaFpa8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9heM-0003K7-N6; Wed, 10 Feb 2021 05:02:50 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9heI-0003GM-Uc
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 05:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612933366; x=1644469366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NGUiJ8C+bTM58/VzIl1j0v+4iWOTF+8rASnEfXwaBo0=;
 b=VBt5SLu6kBoV5dDP6EwINas6ZJdx7dsOAxrVSoIo79XnLVw7NWj24MnK
 2v1oYAbj6RG5eJNzBhIbbjvSK4s90NMewS3FEglF6UWlZVmH/TidXkvt7
 XHe5NFvUV3Npk06/izuuclrZ0r2vt2L0IBVKHFgooP8zy4ugCnpGeiu3D
 f8gt4e4C/wYziFgWG0W11QlWuiMge1sRHd9gGeFh8KCq3LHcILdThGAfO
 oWiXIHeGY/oXAfhyn1NAQCBdnJ9L0/p/XP2GNGf1PDFSDCuSJNdiyCdgs
 zmcobMHl1rguWfSsIFIAtd6dK7cikARQWW6oNBuopNXNugVNldm3UHXex w==;
IronPort-SDR: 9lp3xQrNhMaigbs7xIYCGzmX00u7B2B8GOSh7sUF9dp+XKI47AVf58m/8CkRit8AjxBaU3gex4
 PbFFH3rTnqdfp8o5iupIZZ+NeDVwMjX/YI9PgG2dlyfYsJfXPCJ8LrhVpX6E/JHNujl4R7NHcC
 u8YrOBF5PGNHvbkqUsh7tb+ATXELKy/dlIyr+jLjhIn/81HeTTlD3pWtabLgdMFyFC02jxreKo
 2c18JjEiTkZfaKRPe38hRUDp+FT9T02ioQp6GHNmawDeAKqpsTp58EEUxuqVZht/+Exk1fZzKj
 Uvw=
X-IronPort-AV: E=Sophos;i="5.81,167,1610380800"; d="scan'208";a="159592679"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 13:02:46 +0800
IronPort-SDR: Q7GqsKRQCOOeG5PKAoUN9hoSWOBU6+fAANBERfU2+sytqY/ErF5kqfBXXmpwmGVwAZTmKlWUSm
 H/NTQgpJJbWyYALEi6cFPve1aBY/ml6tvvqq5WvMnfWSoMsn34kF4bRQ0WO+MOz/0Eg9RpXOON
 1fWhPVbXPJ+n0ULCWI8XMvxKY14TY0v7CrVzNdrivi9GXCo4qXie+cdP0YdDA1h3STSPNySJEz
 QJM3QRwFJYGO7G/FEAyAp5xqJN7XfEOlE0hNVlwrpL+lH5lydvGbfoQ2WZ4THT1SyQjQFuoog/
 H6/Bf8ohdWsHMAaQ5BUaOhM5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 20:46:30 -0800
IronPort-SDR: anR3aufEAOAbTopRqS0vsE0DSj/cRxzosXSIjGf2SWwziO1dhrSssRVpMQgW9cz3ZRCx+0MxJE
 5hNmcA71DfqwEKfulJqld4uluIVw0Gwa9xECCf/2iUV0zOPWJKiu/riRirKUhyYWmz2e/DsA/X
 sp67aXrQLUW5wK/dQuwJX2NUPfT2NWJYDvgrrGyYWnnFEEkC9Lm94eNTpnWF50ZJDUJsyV0LJG
 hof4827Dq6pkHx2iGRT5SjTGCJVZ0Z710jguMP4le7mWewqPg68hRPZqifHM4r9injQ9tQ9AV6
 b8o=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.72])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Feb 2021 21:02:46 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v19 05/17] dt-bindings: update sifive plic compatible string
Date: Wed, 10 Feb 2021 14:02:18 +0900
Message-Id: <20210210050230.131281-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210050230.131281-1-damien.lemoal@wdc.com>
References: <20210210050230.131281-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_000247_221900_0E459B31 
X-CRM114-Status: GOOD (  10.74  )
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
