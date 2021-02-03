Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E759DC433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CF5B64D9D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CF5B64D9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=duuU8IRyTL8y2PsqV433j9RtSJEa5Y/r0w2nUj5JZso=; b=Em4W+KHKa0xZQBtnwNIYH1rz2
	uA09MUDqJx5L1zAdVvqUv+1Vmwm8amqK0JBH7ExqY1GA3RgBpk/cxgXfiIUmhDfIxBrsWF5rG73MK
	wOGH8srbOrYbfCtJIrggYhBB6MNlpVrZvAaCj7qUR6w+Z1pttF1y/lcClUvMJVnKlS1ysOoQhpXOE
	OxNM1Sc8/WmLaHcZhESJOoNjqjnTJTrqIiw8wNggaTu1pmOgyz76WszfrJkORZk/8YkMO0jigPCfS
	R5pfLFsQqjP+HjFspU0Nt7OHbedsvkUhseE4cPrm+XvcGDdDiPZX/u57n8uDhaWZBBMOpI5GFOlY7
	xiP5k9GyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7HlA-0005rV-W6; Wed, 03 Feb 2021 12:59:53 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Hl6-0005nO-9E
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 12:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612357189; x=1643893189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PM7gAVPPOPJE8psIKumgDdsYrcLYZwGhuiJjB6JnJKs=;
 b=Ucbzm/B8DEWVZrP/ZT1YBg01te99ypDoFKGvqmJYTvtVCf6hYHRLNRkJ
 H+P8JMbTklikOQEg/Srlyg8LbJWeLOtmoHVD1TfXrbEJD89TH0PcmVWMu
 B2FAPND7mvIF0S2YzZn16hekKChIa9dQJVHUfw3rqHzm52d1buzoVLyj0
 1thZMNDgr3YWO8c2r/odRIRhXBlsydQ7glTlzB+VA9ziIiyRnwBJRd05I
 Z/Oxr+YkEpgRuUHPTq24lQXAgJ4rYya+xP7xWBF4yOp8QR1+hnlgwcwNg
 HmW0dSpzNcs3HCH0SDop6rgddZB83HCrxXFAFhNrsuq8oDPrdHY5u0O/B Q==;
IronPort-SDR: Bks20H9tf5QNibNYap9sNCQSnL2yQnaTE88rBW4K+5xgTSkknpIRU81jEoXJbQnsHmsh6rKdLe
 wpEeRecLhF/eRAwu+JCAxZG2yObAk5ltzaA+3nhdUXAWZFyXU6hOxX6fW6EYvgyT2mN73ukoQF
 Mcj38fEAfBHh4QN2/panmyvDI0SfITxsZlTFpsVZhd4atsUL+Ug1yl/c1EbFa5YgrBWA8/I4R4
 MgC3b3619ry2AQw8c/ZnuiiDtD00dYi0XfG3szvJ9LJiZA/UuTGfQ7jaBlS8QemnkX8JdrNlLr
 WQ4=
X-IronPort-AV: E=Sophos;i="5.79,398,1602518400"; d="scan'208";a="160202879"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Feb 2021 20:59:48 +0800
IronPort-SDR: PiwedDAfx+4HbEX9/GuHDA3miQios9vccZhCRmErL9v6TuKPn02PTNALDxuUYRLDSkIi2NvM+e
 AifpPh9M+REoVOvLQmrX9QL+mLJZgpV/5Qc9mHKATzM0jGjjO2Be55WRMiA80uweMRnPOfVWjc
 grTR2/Rm4Mx0KoDcLIAd73FPbMafXJC7KIOeYOZ490xchsN3tbVJTs0exlRwrO7VX9I/nA6iAb
 i5f69fcZGBAdHp6tbnyPf8amcRpRR8g6PuWG68wLg7vVXkmfHSGgpIgWR4qVk31I/CqJtYzOXx
 6Lvwt/YDEMP9BWMWBzqv+cU4
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 04:43:48 -0800
IronPort-SDR: biTLdoxmtiV/VDj4H0HxNOSpdbTrE8AocVsKBQRR0nJQNMpjFP3XU0YO7qusZCwk1wGALDTLi9
 BhEd6OPJkngaxKMcpZ5XXSZJ44Q3CX2B7vzNW8DuVn7g3tpFl5aGr3ezAtag004yI0IuDnv7tu
 G8aaOhR+Hlp1+VBJri/Hff2sDrK9pWq1PmthZYwenJTck+6ka0toujuQDmWnNiT7VvRtqQS02T
 /dwGgO+gwnCir66Vw2+KAHsmr4XbJljiWeVmSreG1wFg1Iuw1uzQuffg99t/oWkVNGR9YV/wbd
 nAk=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Feb 2021 04:59:46 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v15 05/16] dt-bindings: update sifive clint compatible string
Date: Wed,  3 Feb 2021 21:59:02 +0900
Message-Id: <20210203125913.390949-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203125913.390949-1-damien.lemoal@wdc.com>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_075948_607939_CD5D5951 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: Atish Patra <atish.patra@wdc.com>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the "canaan,k210-clint" compatible string to the Sifive clint
bindings to indicate the use of the "sifive,clint0" IP block in the
Canaan Kendryte K210 SoC. The description of the compatible string
property is also updated to reflect this addition.

Cc: Anup Patel <anup.patel@wdc.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 .../bindings/timer/sifive,clint.yaml          | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 2a0e9cd9fbcf..1a7d582a208f 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -22,16 +22,23 @@ description:
 
 properties:
   compatible:
-    items:
-      - const: sifive,fu540-c000-clint
-      - const: sifive,clint0
+    oneOf:
+      - items:
+          - const: sifive,fu540-c000-clint
+          - const: sifive,clint0
+
+      - items:
+          - const: canaan,k210-clint
+          - const: sifive,clint0
 
     description:
-      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
+      Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
       Supported compatible strings are -
       "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
-      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
-      CLINT v0 IP block with no chip integration tweaks.
+      onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
+      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
+      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
+      integration tweaks.
       Please refer to sifive-blocks-ip-versioning.txt for details
 
   reg:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
