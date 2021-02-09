Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC17C43381
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9701A64EB9
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9701A64EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WMKUUrQCbcO+nF3Bv2V20DdXycmeQ/4m+KbZtp7RNZ0=; b=f/OncH7oY4pOjBQiY75747PeZ
	6N8ERsuMb9FDOXDc4Nq3IAo2ge2a3kpFm8BXX5Ncn8tMRZbUkjqZ+gg67UmCZn3PA0PnopbQfSJW9
	P1Vd77gxpX8LlQOyJQGZvvHS48hZSeQnWRswCipQyZwL+hJUt0IcoJ2Ty0nRT+IjAKZ2Rywej3hmU
	ZhcCrwNaXFTeyw0/h6NyPcGZf3iAUPm7RJaBu8TYwEbwdKOFFT/5YaYGVMpPoVanfnxwYKrYBkgVK
	CWfsctOIhD2og4mk77LAZhSS6qZt3XGh7FBLmFmgtPEQGFNnMnBreliobf2XBHHh6i9CjSH7hOwVq
	QjJTPDQVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9SA3-00088x-Sy; Tue, 09 Feb 2021 12:30:31 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9S9y-00086F-QS
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 12:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612873827; x=1644409827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vo/OPIAjkDR1OdjdExr2oFWyf1l5b2KQ57/Uzl/0wR8=;
 b=V6/53cM+NmdxD48OjsxoTivlm/OGtcMvxgituiaIIOGchR1RT3DEsfl8
 i0USda7PexiPIOMFVMXSvpen+5ftKCm23zjBPNEQnzoXzcqa9bUOysiiJ
 G9gc6DYAytYf7OS9Nu81gWFW8nT0PGFvmadUHtzPArdJGcnIywxHvZWvT
 pY+PSKlI51FMPDTuQ9lVM8zqAYwwRRh0e61g59R/ECGmWtv4LPF1dR22L
 KC0u/Xu6csxvoGI4St8E19YQiE8M7O3Y0Js0qwdZouxad8FDv+Z7fRXrV
 fXs+gzzGE5hhfDEfE+ftSrZDrpestckSpggB7wIkxW/jVYkgvY3Yyh4eJ w==;
IronPort-SDR: v04aH9wUTIkl8NsfnieHJQFnFTpbL8rfkGWUzlfwQU0HfWcVHpCoPqF+gWcxAp6+iOn7VZdjzb
 O/u7YRgbSvPblYwJOw3ZCMf6uv0IFhDnbbpBWNQUdUC4ygZ3hTWz7nPCYCXrcjs9YXY6dH2QgG
 J8lt+z8yW+lIoz1/YYl0zdy4gbgAz2HvMH7qmQmF08ytOUMU2oyTVsegr8QuGgRxT4s3Uvbyo9
 Z3p6e6mwLAj9bSaptJugd+auCy9zMf2C47qsKg0tQbfU+1PWimZUpFjuwYD8K8bjfvBSQwzxqy
 7DM=
X-IronPort-AV: E=Sophos;i="5.81,164,1610380800"; d="scan'208";a="160707551"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2021 20:30:26 +0800
IronPort-SDR: pxJgVrEV4kBjuN1Ztc2QLGPmHY7pi5gXfrPzE69Jvd3DqId2A6LoIb/H/6s7hY9QzFdklLLZIf
 9wk8Tt+9IDh84cplw1so+C9BSt+BGWBmSPth4uWKGhp7JTNl5IVxvFdEPy3U58qx7/p9ktF+vj
 8JdRoLF5CVvJ8nBlOGNx7r14M2p7XQfa5t9WEV+Q4XdFi2PZ/xe4huEFoHK1MRdNtLOrX606fd
 nYyNRTw7u2A25iH7FglYjXbvZwON5p3kt1q0B1hstLOMcgSLmerOrqyWzDIC+7EGncL/tCcztX
 bPpD7+pgbcJzPY0dhnJAG8aJ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 04:12:20 -0800
IronPort-SDR: cMmr6H2j9YehT9FwaFBGGz/CYFJi6MAaKnxJWQyGcxrq47/gMaasKj8n1RLjDQm2RllacyRmJj
 bsxl5wMPYmTXEySnWcqEBtsyqwXfpJJPBAWKS5xDc6FtGsV1JwYJbVAkPmmiw4upY6ni55bzDr
 8qjGeHTwwMNku7ePDQhoZyHzMcfd9tKgCbnAjKdqr4bth5cehStLn+i86d6ien0Bo5fj+DCIGK
 nXnZ87p1u/xF6UDRJ68LfPnf258f0D+JjzT9dlDfa75/l6o79+nbUs/VOgwhlQHXAfPSYgMWOA
 M9U=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Feb 2021 04:30:25 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v18 05/16] dt-bindings: update sifive clint compatible string
Date: Tue,  9 Feb 2021 21:30:03 +0900
Message-Id: <20210209123014.165928-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209123014.165928-1-damien.lemoal@wdc.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_073026_991581_78616C8D 
X-CRM114-Status: GOOD (  10.35  )
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
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/timer/sifive,clint.yaml      | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 2a0e9cd9fbcf..a35952f48742 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -23,15 +23,19 @@ description:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-clint
+      - enum:
+          - sifive,fu540-c000-clint
+          - canaan,k210-clint
       - const: sifive,clint0
 
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
