Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAB2C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55CC0223E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55CC0223E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3KLpq49Z7DhnFMT9YCHkkDc29eH1VqMlXGk7x/1PdRc=; b=3jE4YNwEDsMS6DztqF+jjrZY4
	ENVukJRdwQhs3m5aFDx+2G9ILi6dowB6aytXBuQuOCt59eWKP/qtyZaSJSw0z1Kx0rl4EAs25DsC3
	HOHmYvFo/KCwGfDjZYBftfLGUugvgSsw/xYwJuEZ9bsoZEsHqjG+w+PtOqpKDU4FgLp+tvIsY2jYj
	HinWiyQHqqBNMvRPBm7zNrj9rXIcDat5ovGSvjIupu47YWl/Noc58cd8yguegjOUGfZ6Pv/ftfDFG
	VQRtOSy6uP++/c/6VTTYXNhaEATV91R9FbnMI/p4ddEeBUO44IpR2Wlw5TRQn84VsJMB5rH6YfSsn
	45TPDjjoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Pii-0002wp-BK; Fri, 15 Jan 2021 14:04:56 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0PiX-0002r6-KO
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 14:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610719485; x=1642255485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CN0WY+YBp4RNoOYHuHqovxX2R6rFlSK3nLo4F3hEm8c=;
 b=MwXZbIt1yPylYMDYf6pXlnU/iie5WyTMIlJAaPCly6db0Ze4spGKoX3F
 pLxs+oUUhZ9Mahm28JNXjZAmlIfT4TGiYOSY1yHHxBLEP8kQ6PyqN/Ohq
 vcPHGFcI+BKNJeTGfvoclZnL5rq2FvJwJ816QJKnpOimRjww3KgOm2yyb
 dJ9b4TbIyK5b63vmtvGnC+2PCw2yRnt5TZeheXfHZYiulft0NRK+LsbwW
 7tqItPfRek9jhNWYLEhBOYDKxBxkZ8ZpN8jRSjFjDPlicX4iGsZ2phHuW
 6DS18unh4dCMc9jDt/t/xTF1x9wG1b4mqOGGXlFx1sEPrSLDMW3/06FBR w==;
IronPort-SDR: ydpbc5NojMt2dBZ2vGrOQ2IX8nADSeEtk5wG/fRHnf3H2RtA7//tp2zHW3pafKYPxWmN84zIYs
 pavFAC+ahIC9/TNM9weRhKmUqRvyPwJaEfENpgToZ5SW1CeKT4WxnjbcatzF9DjLmPpEeg03qd
 BTVbG8NhrIK5PZg6egwqJKE/YtVgS4knThh5Oif6hqOf0+FXIL/KC9b9ahK+iyEgETPdNMZdfi
 NzrdjE8a5KHJ0J1NUkW2SOVySygDWt/tvlKVCW8J9hYYSV+MHMbTCYFXLE1Lu4FVcDFZb8eY9v
 2Ak=
X-IronPort-AV: E=Sophos;i="5.79,349,1602518400"; d="scan'208";a="161955760"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 22:04:45 +0800
IronPort-SDR: zi9bi5f5wy2tlulyYMVPF7U7HLlIPBVJUPo64zY+C37uIVsI5MSbz0RGEM88hACBnKm1UBiOHZ
 WUOuKN/aSZc0odCs/YkH7DOiRh2MhlvuYCdhYlLkBCZOl/vjqa2Q2nOxnVwr39ULMArl+sku41
 Mptlve2td0fVp12nJvCYTYTrNOWyJfHp22GWqyzZ5pCkDXG6qz5Banjuc3tqu5tvGdeBK5DbHp
 OQy3uUYS3v6uIbuB7xUp3GbSuozbfDJ+g/NInTyRmfnNCrxZ2LexS6m0gNDYm72oP5na1mMnm7
 w0ASFfS7kzRqmcZdj4HX8sRf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 05:49:27 -0800
IronPort-SDR: Fn3rEK6WIfgU9zOzR3ARbUv9VcNsbosccCPrnWgTYWHMmo87uBBAmDczhH1AT9628znV+U34cs
 WGUzgOiONdK4XKuQOB0rxVLXeN88ktY2CluiC/pTVO6t7JrsGjbor1U/CXNqeDqWjVurQLfeVe
 epw5TwXvQw9F3FQEjWihOK9ijjARh2FHgYxgJIOzRbORu+JNeljHw0OGQnLEPfDhUqu/bio9xi
 kFJsajIEIajbIu6pM2/hEgU/1XQ0LIvjLH8JYK1kCZ9r2lVVPo8MYQeu6/xCYpVu8vkMVGWqDg
 NJc=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.177])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jan 2021 06:04:44 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 06/17] dt-bindings: add resets property to dw-apb-timer
Date: Fri, 15 Jan 2021 23:03:41 +0900
Message-Id: <20210115140352.146941-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140352.146941-1-damien.lemoal@wdc.com>
References: <20210115140352.146941-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_090445_897252_F8A66A74 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Synopsis DesignWare APB timer driver
(drivers/clocksource/dw_apb_timer_of.c) indirectly uses the resets
property of its node as it executes the function of_reset_control_get().
Make sure that this property is documented in
timer/snps,dw-apb-timer.yaml to avoid make dtbs_check warnings.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
index d65faf289a83..d33c9205a909 100644
--- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
@@ -24,6 +24,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   clocks:
     minItems: 1
     items:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
