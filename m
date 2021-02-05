Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EE0C433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:58:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CFC764F9C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CFC764F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EviGUjcxBV9izVLWXjQZW+z51q8+d0OgXsqot4kDTDk=; b=Pzk7AQSW6DdSS73xy0w6xQOLX
	WBaYkiulQyGewqA8uYsXDcwbX2ZZIusEDn3liu4oPatT7cY+96oJwn9eg4A1+XNcvn6HjMa81BHm3
	+dG7doT7QiK4cdg0WbSm49NqrvIN6WXCqTx2ssDId8jKWTTF4lSWoGErHUU+03pprv7ySnAKFxd4E
	GFo3CGjeuaIui9hW0T1lKyJUEUpRNDG/7r1Qbh3Ku4Qpj9OiH+4uNPn/w5/0nD3EH8kLTLFCFhU8Z
	lnJgcJ9Oa14mEFxl4LDGHr2AMTCA4YOX9dw+i+MWZOfURcw8eXHC0t5HOGUH3jnVT3+pqtslrmvD9
	R4QP0jt5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7v4j-0004cM-NU; Fri, 05 Feb 2021 06:58:41 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7v4h-0004aJ-DY
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 06:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612508319; x=1644044319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Psza/nTy12u4z4eFovqg8PCnJ6Lt4zZtRvlW1Nk85qs=;
 b=XZsOGypwyXS2OBL0QN/VEqgmI5ZuaGVN+9Reb5n+4lXLTQEIBTmzDgWF
 yJdpJu6xGVctEJDyfAD6p1h3BELOwT+FMy69xAC+rDC4+XZDR+tqZ8QJz
 xg4KLMRoBesoDT7fHJFuVyoW7gXyyM2Bq1XduUesWlsVcBIaEKohPHYWb
 khFdwkuaCwTI4Uuy3lKGyfoXStLjcUkd7NbCtplA6JouLaUE6SC0b1Wkl
 23eeZ56jhI5NQ4II08aCAiLP1jQPDjLtxuJyKvSS8FeSw3Z9+PBgOMR0q
 9ypIxmFHg2zR51yyNC8J5ETDzf+bfIFIMWUb0brkyxWUXc62h1hAH9TmZ Q==;
IronPort-SDR: kzVhI2Q60EfpQmnmCP5pt+HWtDJtVhyLw/iJk/8bJnyr3/npJNZkZjZdgKRQvwkPaYHs4vvwW6
 s8lEfqwUMtHDV2PHK4Fzlev1pLEJJNNYfQ5U9r5jxqLW04BNgQvZAr0JBcQQmhsNciY4H8zJ2H
 y+4A5dccknWsBPQKY6xU7DDdBaeD2LN/Qvn3qYuUZmoZe37USFVvrtSWzOMgPS57tIeonTxFNC
 rBYswMSkpzBvfLCL5iSDPyrOz+4IeHLvvvdsCHQ6kNkuCItbOLQ9StQgqSfGcNFNJBZ4S6KRoI
 BVo=
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; d="scan'208";a="163655821"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 14:58:39 +0800
IronPort-SDR: hvDEA37kYx04zKq2HJGbPfAAV6Qc/PyQqreaYYpoor6K03XS1HzoX51I15TKD5iTMsMbXqFs77
 QOkAUarG946HnKa1k06Qbu44TNVGfTN/w6c1rcXckHtimLtJUyXyKjbzNNHYYUHdcvT2p6aScy
 26qyAwTk8oSr1vbQQVesy2KgI1Bg/D5YI4mm6SVkvpD0QhfpyDaD07psp26tTsKky1BoI16tt4
 gqUx6BZGouMnKx63tB2nRveGpzXfZV8kXUhBrfz9aqamVHyNepA8btZMucpleM3ndmGrmrFwVe
 Hw4AeCxrK8O4c/zqmRgYFpL8
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 22:40:41 -0800
IronPort-SDR: 4UQThxBkXkhPrN7IK9i+5fbRZ1hgfICpWMDU8lbTR4LtD8JNjkR97Xf2hAG11glW/2tlNj5/FA
 lkSw5GIuPTbBIF+576TQtbZ6YJbzlLSBWeb8VBFhWFUQJGOTelk7v+zbLjU92vZFJwLavbSkUM
 C5MlbHf3OgdX7PKpvm731Z9U0XdYdMQosik9Ffso0xI4e6wZ+Ua56e5+eaBDsXcQG8b90LcH1x
 4S9+iA+n2NHfz6h2ogxJvyyH7veYMODYrWxtHDGbMGq7uFEosx7nCNYsO1EnKSOJEKrZy0T61X
 x+w=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Feb 2021 22:58:37 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v16 03/16] dt-bindings: update risc-v cpu properties
Date: Fri,  5 Feb 2021 15:58:14 +0900
Message-Id: <20210205065827.577285-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205065827.577285-1-damien.lemoal@wdc.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_015839_669427_C66CA94D 
X-CRM114-Status: GOOD (  11.85  )
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
