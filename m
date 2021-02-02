Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229FAC43381
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:36:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3EFD64ED7
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3EFD64ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZxRok35mNF5LwnJZ2Lw5JvoHw7vnfSENFi7Uv+YB8Mg=; b=uX0StqOxBoZnolVXK7qU/tLRU
	CV6HjXCXH/RCTgygKxUe4pZNolTmSX5lwfCWIzUuGZinYPsK/NDRVf3HCDOKx9+F7zjnW9oFf8wdr
	q7LNLgFOmZlqhxqLkvgZTPM/6NjTAWP0WJoLh17jtjxt+FojDGaXuUHr+5qcgmH1jTSUbSg+29Q+J
	NSugpO8dxgNadUR3q5wtJOYEcrEHxPwOXK3C32Xevek2th3GcZn2RE3T/L4tSYMynKBCwsAPJvpR8
	seF9kPYN+l/Rs8SIBs8YbYZYCffAM5KL86byv2tgcQNQuvzyK39Nmp3WVyX/wlABLIz798z3Svf65
	kdxK53fLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6t3B-0008AZ-VS; Tue, 02 Feb 2021 10:36:49 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6t39-00086e-7D
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 10:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612262206; x=1643798206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PieD+HEsZTf13C6UeofD+u83C3BRDKwXIiv/iI9JJO8=;
 b=kz/zhjjeonzwzB6WpvTXHhWBCPOxG0MMOeaKmdX1e88zPlfcCOk//QF8
 iJj7jx6EugI3lC8F7XGb6+ugN1AmYeXgHALujnO78SRY9QQaetXF5F0Dc
 +A0XdxWd0zPOFm5kWV5W/Dd8yWn7luKJ/ky5WQ6eUpeOv82qY80gDlj45
 QtRHmspjOmcymEmJPPviN7VLXr65cT56th+/ct4TsKtK6WM6G0gJk3fxF
 vhUPB2eLW3tJf3rMSg6d4tANE6E8B+wDwpkXQ6+topyLaxpYlFWFfMan3
 EONTOJ+ClTe0ntsjKnrD17U2ATtleF303pGw2huCC1Q3wTkvadosgnekG Q==;
IronPort-SDR: 6cM+vGqbzEjlNr0XOt3DSur13GQ+FYN8eehrKdN5xoU3rf2ttW91S81/SNiuNgCmySa0RtiyIg
 QauwpHofj2w1CiDWgDcMz+wDNMg0sXuD795i0/ZR+PMVys8JL4avSz35NLcWFiB5R3kMSEASKL
 VDM2t0EQirv2rBFb/Rf6eHJyic60LiYIoufONzRUQM4FH8/UEupZYtEw3m9G16k9avzUp5azBx
 xAiaZ3C3G/O52wcRWIK2YhBRkIWW+XN9zj6GoAezS8e9cxVuioMt2aj0+lwrr2lAVrdaKbednY
 zto=
X-IronPort-AV: E=Sophos;i="5.79,394,1602518400"; d="scan'208";a="163357062"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Feb 2021 18:36:46 +0800
IronPort-SDR: a52ZeEBKRVv5JrXzZGoEGHpICGDk0A4QdEaR28hNDYkmNjjiijPjmrFtQu3G+BHanzq8ZGOGSU
 oIDrlD5rOrGSVM+RV8ilVWXkR8SwFZoQWohLIutTmLwLHXHyPo7XqAB3ksSCBEFHth9T4ddjb2
 lfgq8idnRU/r5pHb1Y0avPOA2ou7OWkrxEx8avRmYER1J0MxY6hTfWN1LE1BVJst7th2NgfndX
 javNUaIxkdrEQGKLUgtMdeqNXq718R23nKRDyvNwjre7Ub4hVY6NET1oU8++JIBLtce2tkzI+b
 CZn4HQ8cNF3O8KrhhFadHw+T
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 02:20:55 -0800
IronPort-SDR: BLkIKIC3a29Bg7sjGi6Ofmo2O1dRw04DNi504and2Jd6+zNNqzDYZXzETC4XOyaiX67yr9Oawo
 ROr7FDU7cLeE+kZcbD1x+TXF75EASAUL35eFwYgqZBAOrY588SjIAoYL2o35xnWQPRkFeHcDXG
 UvIG5MJ9+ojwbCufPhXa0opFzT9I1ns8er+FFqFb90jCzPqCAAlB5GbqCJnLzWFSyElTRHYXhs
 p+5b/8hjZXfiJ+I88lE8Jn4zKePvim0jyqFlEXqGryxAFVTBaxQC9XtzAOpJEh/m0/e4PRWM6N
 /FU=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Feb 2021 02:36:46 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v14 05/16] dt-bindings: update sifive clint compatible string
Date: Tue,  2 Feb 2021 19:36:12 +0900
Message-Id: <20210202103623.200809-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202103623.200809-1-damien.lemoal@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_053647_492616_3A5131DE 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
