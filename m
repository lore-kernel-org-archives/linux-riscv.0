Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB976C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C75C64EB1
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C75C64EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ndn6te/sz3mdePW5tHgwvH+Ot6tYmmRpXbfK4S9IcOQ=; b=qoaydqfC4p+fZqQuKY2RDcMXi
	HrLkAGMbdUuOFKW6+abOExyso3h6vRl+68hLYw2mnxEqx4Q8kt8Y1LcxCzps52DntsP8VuHLL1mYg
	nAXEAM22AhnJNlGHISg1WdINPUTmywa7jwgC/dHaBJGI7UYQ7XVw/9XycQ9OTojpoXE4H/8RFNdkE
	JVCLU8Rxj4Xby8FPRc+4Y3fMJtg6h7BplTrlG6qT70ZPXXzgGVJw/YYBLrugt445E0v+j4GXtH2+t
	rgOplCxST+J+BcRHLdSMDO68GEQ3luIujSnUZCS1/XQPBWzOFLLOrNeE7Qz6mN4acrkFyhWbdGreJ
	YRXlVBqKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9SA0-00086r-2P; Tue, 09 Feb 2021 12:30:28 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9S9v-00084y-KA
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 12:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612874193; x=1644410193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6K57gJ4d4JJEae1PJW0yBIWM0fdObKVyG7NMETneATc=;
 b=JkO8KsvzhgQsZwhXtFLg4he2nPpfo+OjyPGp0I9FfNHyO+Z6HL1N3xs3
 FXclLdz2oOWi7jgXaE41lbuQVnr4i1G11vRqI+fc0mlUjEt3LgAOBUNsa
 oMI5iJfqDChZUnjcntWp9FlfgE0wmodNK24hwWFKo6UkmQ6SUfaYhfCVk
 y9bqq/mv+UmVcL+4es+NC5FC2pj4Q4OqunUyTDfaeGujuRHY3cXX6eHJj
 W/EWgBRfY7VRd00JyDjcDcAn1g4w5jaxZkotFEyt0EDBPcWtI743kDq8v
 kbIYj5wTWhy8mIP7PcGIKeQmwxs4kQbbjTM43NVtoDLBKfw+IBluuptR1 g==;
IronPort-SDR: Nx5oBFhQQIdiCGo7e1CeW/qYnv881Wnn9fy549wi//KBdeeshT6f/+34EVvmlLSUi3luO/aamG
 vWcekIX1FiosV4fHzA+8vVQ1WYzEbk5FpJdu03gybjy2GW/pbcGG1OZwiFtK0wYNsHthZpHMSV
 wLZ4HadpDOLqWUZO0ec7PVB6w1mMCopasAZFktsNNTgU0lziJ9ZPGHCMLM1B0FgfZFsuMA8dA+
 yMQQ55l5M+Iet3D5LRdSxmLDcrF9SGar4lu2LUZHi7caCcWCQNQdJKvy3IHfpulK/7+24sh2yf
 /mc=
X-IronPort-AV: E=Sophos;i="5.81,164,1610380800"; d="scan'208";a="263648821"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2021 20:36:32 +0800
IronPort-SDR: ROz8LF3QXK5ZNIonC0QWepfWTQiO02yG8PfaK1O/BNwQ1K+bRNRC0kmpZ0f00tNNlkOhlgiUNr
 YrAd0dk5AlicDWib47dc1+1CvPHWDQaCyFBhhJpf91FdOGqPZwELEbj8c5HDs0xwA5ntZxyxhx
 GysEMgboXKbk352e3ymqeejlwkIVbA3OWg3QGrKIAp71cwZUCZAsRH0woJWguNLwKniWAREA6k
 H+joBDFwf8FAPkIkQ87417Z/9vKlcGomenS3APoHJ2epTJy4K4+v4Qoqp2mihuv4vrFU03B6Q2
 2S8XOTOEsQAHJjafRoJJiHDT
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 04:14:07 -0800
IronPort-SDR: MQyDinRdhBof0TBzSa/ZG/iJFHUtLY0doAsDije0XaGZWciMyGH5/cORW0qEvTs8L7BatoGNBV
 pQiHsSW16XKkR2EoyGXY3gp/yrAIh2Y4SMkb4rilKGmYypm2kagnbJeiIUvIqLsvHof70ZfWgR
 1Vpcch7i5LHxJXuM+8XrM74AGueKNTU2fq0OMJ455h0kPJzfQBT9KKsQUr2s4dZh6PP/UyxhX0
 R+gbna/+JuuMBH/hXg2EAF9s9AH+yqsYWe8k7R6SYS2MpBCG6cFF8G7QuJA9kn1+VOqHr6zt8H
 i3E=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Feb 2021 04:30:22 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v18 03/16] dt-bindings: update risc-v cpu properties
Date: Tue,  9 Feb 2021 21:30:01 +0900
Message-Id: <20210209123014.165928-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209123014.165928-1-damien.lemoal@wdc.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_073023_791858_ED2AFA55 
X-CRM114-Status: GOOD (  12.45  )
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

The Canaan Kendryte K210 SoC CPU cores are based on a rocket chip
version using a draft verion of the RISC-V ISA specifications. To avoid
any confusion with CPU cores using stable specifications, add the
compatible string "canaan,k210" for this SoC CPU cores.

Also add the "riscv,none" value to the mmu-type property to allow a DT
to indicate that the CPU being described does not have an MMU or that
it has an MMU that is not usable (which is the case for the K210 SoC).

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index eb6843f69f7c..e534f6a7cfa1 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -39,6 +39,7 @@ properties:
               - sifive,u74
               - sifive,u5
               - sifive,u7
+              - canaan,k210
           - const: riscv
       - const: riscv    # Simulator only
     description:
@@ -56,6 +57,7 @@ properties:
       - riscv,sv32
       - riscv,sv39
       - riscv,sv48
+      - riscv,none
 
   riscv,isa:
     description:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
