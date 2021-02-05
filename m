Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908F4C433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:59:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DE1264F3B
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DE1264F3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hQqmwUGTRtLWJ/g8j/lY8xYgjNeH8yAgWBiPvspHh6s=; b=bozU1XRlcj8Y6j/ZNIcxrnlGH
	AZ5mLOVMTFft/aPdm0m6854VjgHhCIk9mB0yidVViN9qVobes7WDnKwhXDvD8dAlQWRTnO16Y+3nJ
	kYoHWkUdVS6PbA0Kha+XiisPhP9bqL6LsdAJjDEm4e0GwQAHGsm7UWoe3Pg60has/HcIjJd9zMY43
	p6a9QqsKV22s7555k0M+nx/38iMGKsDd4ZDFPM1zlotBxdM1qzf4hr9d4rQBNVPS6gNPaXkoIfX5H
	RloMcm0NA/YszAs6b3zSHNW7RIniU9UkSKtoOQaCxbJzXXBe9PWWwGZgVgnt+fqlydQG9dXhQ3koe
	t39ljs2lA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7v4v-0004j1-Ie; Fri, 05 Feb 2021 06:58:53 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7v4q-0004g9-Rt
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 06:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612508328; x=1644044328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CdDSnYoUg4x8z9E5kd8zeW/UQhTCXdRY19IDHVs+Ulg=;
 b=ZkFpHgYAHfreTMey1m1fewPRewxBIDl2Mm4ZvcFbQSKSOHnvFfZylaQ+
 GI1pssYYdPngk9jxrA46PLuHiIjfWnc8vTV/XPc3rNC40U3oNy8Lg51sr
 xdqNbXoGtqqxxSfFMmI2nNaaM+esD1CitM/4dLzMfUUsb2Hgy5SC/MQwU
 +9OZxRcUkKq1uHXICCFOUSbMN1+to1YcUot+06KSjIWO8gq4MuDz5LXhK
 OYUaObTa68g7a3i8p1CFO5Dk9RAmvC/7zE8NoaZKV3f4ltxzznbYiv7Uk
 Akd1kyGDtAB3r4gDuwji+ehaWZm14VlAOgoSXT2mSwCiCA/KQbHXKUd+H w==;
IronPort-SDR: eMp3a4dW5XE703F6bojRA5O7YIPI1OG4PpsuMjcxrO3qg8KvK6j0FDcippnJRmy4aVPEwIjUd1
 0ev8ASgRNgSp9tdyDJw9dwzJ0L2uRxBRmr5xFjhL+rXE86ugC3POSEyQWj6TeorPClnxb42mf5
 AoC1MXxzMlAUY78huKEiqWh2A8NLKg9JQm5fdTyJtf8uL4pkcZKMOfGz4hSW5hd8obHWkf3xzo
 eKWmZim/lhMYQEOH0rbYd8VfUqUJEmKRi0F+XZ+ckUqq3R9vFC5f+WaCmTqiEMszWkFQNS9og6
 Rkg=
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; d="scan'208";a="163655839"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 14:58:48 +0800
IronPort-SDR: s/ZfFpdnbDSLA290ksTQwptyQqFXSj9y3mocNDuvoI0LsbVsfYXRSnlaUMo6iP2U04u+2eVLA/
 KXdfLyHo+0ErPEnLpPkw7PiSGvDF40iC/bfs/c89TOi84JDpJKG26qA38XoQp5SFXRj7SrMdDA
 yV8q0iiiiqFA4+Rr5wO0j114V2Isq4/6juL90lsC5CeneTcyvd9OjFBceRgPVFrIgWCGDIuzzA
 QYlP468G2HiPzrGg7dYxcShHP10EjIkrbMVqyFr5lW0PRgNKSNZJT444RdQTNK6uYiJLzStQpA
 ks79fqT+kXTP2C3LUhsMDNGJ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 22:40:50 -0800
IronPort-SDR: LJ4ijRoBawtS+Y/PSYZ+xUZRiROjnv9E/NRd25l/i7x2l1aXhvbcix09p9wjI2aESp4ETkJSeF
 ecWUaFTTAAUIMafv8g0+MnH5UYD0N2rVDgcpS7dt0VIHfRALGTNcAJ7+eZd6PVyiv5i62em3ih
 OdYBX8/yWMAwO0J/XYr/LHtsLYWLyPI45HH/A0r3Ng8hOojTlGgksIQgFNpi6zrGC6Oy8wRmJq
 VMgK3wrAx8mYjJpSLc7r3xbQ9yHc7AhJN3zFtd7DwGlwx8jFM6QXfIoOSuUzlKed+8NFnkr4cq
 o7Y=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Feb 2021 22:58:46 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v16 08/16] dt-bindings: add resets property to dw-apb-timer
Date: Fri,  5 Feb 2021 15:58:19 +0900
Message-Id: <20210205065827.577285-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205065827.577285-1-damien.lemoal@wdc.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_015849_080034_340C5E1B 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: Rob Herring <robh@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>, Atish Patra <atish.patra@wdc.com>
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
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Acked-by: Rob Herring <robh@kernel.org>
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
