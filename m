Return-Path: <SRS0=UnsP=HJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C05EC433E9
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D32A464E3B
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D32A464E3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ndn6te/sz3mdePW5tHgwvH+Ot6tYmmRpXbfK4S9IcOQ=; b=TTxFcsUNd+eoLg7FxkE9jDt3f
	uwMXSCXiyV2z2a5FCNggi7A4dLlfyb85W974bNu0EDMhyOK1VEhD8opHb1XgjyH2wXWjDSpBSnhg7
	fS9DlAX5Ai36m9+wx6UqMKTEOi8WatjRoDG6kyS+A2nE5V/crvlTL4lmyybb17bC9M7UBw2EGVh+9
	L+AYaxG/+MD5fOI6PlEF2v00vebJyts8te31G6zMjSpw4CqhsedospVYD74NLrpEcXaBHE4Vgd7Ht
	txbDGWDgYIzDVaWhL6AMwU6G1aKjcX6M0QyZGCNns1cPk8NP6a0dX7gRCXG5Bc00Q8c+ofjqFpF1o
	zynnjFfGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8tEr-0006Nd-Fx; Sun, 07 Feb 2021 23:13:09 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8tEo-0006L7-En
 for linux-riscv@lists.infradead.org; Sun, 07 Feb 2021 23:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612739586; x=1644275586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6K57gJ4d4JJEae1PJW0yBIWM0fdObKVyG7NMETneATc=;
 b=gDE2yO+Kfgq0rHEUeMroitIZySUX1gpOPttBguWyfMK6eDonGCD8ydMg
 wRi1/63JZIFoUcUgA2iya2pU5OzIs3VF4Q+5kkG6/V9oT/+HghVVrT5mW
 TV6iTJWT/I5uwQAaEn0FTLf/6c4TgnTw8qTbTFnRQbiwZNC7EiuhIdwvu
 ofXqj97E7Z1XtJ4ES2EhjxVGrZivXS0jLr4PxCsF8vEPzrKiK0syirRhL
 pBrGQQloUTraBZnetRwOdOStroY5wDYm0RmtTrdISpd/BaAsg4uizolwH
 0vqNYViccnHTXMVOgGQrIKWr4ZHsAsQXGk15ezXTUFdrSXg+rwsNQUwl3 w==;
IronPort-SDR: LLnS00h+Ws8cF+ErLjH+gQfKpsjQQTglLWY5Mtmik8yz/+LvqWSnzubr8XjHvrO67gasHkVFsa
 X5eBwot4oovRPA8GsVRf4Ji8qJqht1E/PesGasNDl4VGMtJrx42MlitfyC1IkeKgCd72aMzfTY
 +Zq/+4Y0hZjDcfcnlHKULme7qzsSMEkvOg5t6f3yUAJtU5Wv33pNpnkBhSOV2Wu67NDM7is+/X
 vLrSoSVKsPzaJq4PJALLIps4ijdGbnWgNoUXVAMBZgkRCIkDXYnWf0Rrt9PFgZ45nWG3IlA8ix
 h3U=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="163861256"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 07:13:06 +0800
IronPort-SDR: oklhY0WRFh4bd3k3gibsPHixNvY0RXfsKcqXccqzB4v5LZScYqTwt4gGvuHRWVyJUzN2pELck8
 gH1QzhSSUmXRfzAM1KEvxvaT04aw2S8Ycn9O2FgLRhTW7ZpnftbpgdoHVNtiyYHTb1GDiROYCH
 sUsb3GhQ3SQhyB6eRBi7XUm5FK9q/BglryCdxwUoMNHsd0VefYlfpAgIEmIFt8zJYS2btPNSTw
 9eon4RsPcw/W8CReqOcs2jdIj8qqaVfw819883EFKl9k+RlUnoVyaa8KfPEnaetKtWKPp5h7La
 YGqD/8D1NVhKatICkYXwh0vl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 14:55:01 -0800
IronPort-SDR: GZpnlkHSqUSIz1nLJHVnoFn/yP2F6QQ0+fdh5vknXlqFx0EVk+X7bc+1aj6Kjv7exdCVpJK3Pc
 9jik/n472IR6V2Gru/35ssynQ9utMmEvzTCEeWayRBpEpGfOirFxEeHaaaOh8hNHbvZHF2fK01
 VZQK4+qcE1uh8SbWJHmhwgtJyHKiVuKzVBBPPD4NMMIa9KPdLLeomsJ0jj2CmaTkHlVqcLoTcv
 27hh6HrIdOs8IQ5Gw+hxHn8+1SOwjSBEycDhuxZYK13C21renIOPr0YQJIRsyiZL2MvtwHlUCJ
 CEs=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 15:13:05 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v17 03/16] dt-bindings: update risc-v cpu properties
Date: Mon,  8 Feb 2021 08:12:43 +0900
Message-Id: <20210207231256.115130-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207231256.115130-1-damien.lemoal@wdc.com>
References: <20210207231256.115130-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_181306_631986_01150FBB 
X-CRM114-Status: GOOD (  12.10  )
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
