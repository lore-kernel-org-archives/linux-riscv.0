Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5E7C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D4D64E4F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49D4D64E4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1gnjZUO2fgehnyy/4V4HTbh33/hmPdNk6sSv/vzeV5Y=; b=dUORP5PnvxAfumlC+biEPAfrC
	e3JtQfuPb7lOhO0RUMxYul+A6evVXqLxJO0G04aXkMSgZlzYv6nYGRmnHjRQqJJsx0BwoSAtJsGZ4
	xgIrTgO3L550Or0x7zLHskyCI4dX+wxTfniFshGvVspy9MGtlwXq/uIyLkjTxoKl5vK+AyqD4Kit3
	prwXhn5M+LvHyWpRszsX2UW2ew0RMjSICmN9H7bZCjJCDdBjmxxMzwLBEnIVoGIgLSbS/rT9wiPwr
	IScGI3XoUcGzj6IJj1NKT11sGPga3/6YLWxidgqKJbzUrjbKtB32OoVkqNxaEXE3ANkT0qpE+wVvP
	/VcDE35Vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7HlJ-0005wZ-Qu; Wed, 03 Feb 2021 13:00:02 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7HlB-0005rJ-Kf
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 12:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612357194; x=1643893194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sBO4dz7he5GLPA95Zeo5B595YhLnzXq0AGmRkHWAaCE=;
 b=SFMBWHKw5JThHndm21Ve/ph/ELAOTFanYCFQibAxTUEhlpC7RdKoi4fy
 8YFKc/VrpTEx/22FpwXqkgNS8P2NkwQjrD14Kg7XrO5WI93hhg4Ek+7qT
 HarUMFvHxvr6QGrfTaKi+2ph8tIyHWepfRfBKVN1XSt9fKuYM8s7iKuHc
 +I3/InPIqMCZEoUj0ITNKu9hrJ7XMzyTlZSUyN/gdPq1njz5ddrP/FML1
 kmviGKT5C7sK5AKwoKnPxMqTmfd+DLLKDiFPT1rhhTjlfDxUZR73qyqqp
 3sNhQNhvHhr91d4F0SEEWEeWNJfXLHzrPd9sFNmOrGqvjSDa9AVGPM5w9 A==;
IronPort-SDR: fKoXzHs64FFVQndIT3Dk/ZfCw6TlsP4mhPozy2cG/KMYDWJtpCz2vMVYog3r0DvpRf3QwtzZO6
 hvIPUgLRN/Ew4JS9U1RBpvd+X0NBV/5hhfSLO5BexekzRbzFax65KshzWJQH84wpIvt0MbhVng
 5TY85EKj/H3YgdWOBOan+rzokpTc/oiQdmdh99FiU3SJI8YQ2SqpT7jvn9z3FCLXwuXxD6nQpG
 CFaoWnpwTlmAfntDXnPlHlMQS+Wxvdhy51cM0jKIHOWY4xPFLIINnJNx+/1zHtaTnqkcY0wiJV
 zW4=
X-IronPort-AV: E=Sophos;i="5.79,398,1602518400"; d="scan'208";a="160202884"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Feb 2021 20:59:54 +0800
IronPort-SDR: 0Fhn9H2x5D1ZEpUHGeKXKI/5Lfo7GXHSzVmpr9etcfYHNQDeoUcoyLN5VkYSG8oDnvAV2OIAP4
 UZF6Hfa3gycEA6le76oEoSN6pv2SBfB5ZisVwYpREL0rZEpyaU9dCaEnW/TuOodt1ja31I22uc
 fR2opBa22wdAUx8KCzjp2DMm7LGmTharFJAOKZboim6neggKeuo4Z6zjeujMkmmdLiymVf33+N
 WJuQaYtPKACb/8zSWpiNbW3drxdZ6WqCFMETZAgvBL0Va9Cs9CIT1IwiOC1t9xs05BUmw4IlAe
 fQ0mmhrnpCm5oPWzDnJsOgQY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 04:43:54 -0800
IronPort-SDR: L0+tMOvq5FBqITOcvEMr/uhWTbbh9T8q3FEQE7uJ9fCnwEsrKjkn73qrJwRIGJxwQxK2KVltD5
 0C0ttIwHoQwuaSwBuzzAVUBKGQ41kBYHjJM/W89JNuQ2MFCQAgtHJCY+l5lUPEWxEFB0fil1ek
 qmdLf0znusdoWwMnJU9gxAylcHRxNv5R5fcQZ44hIWk6FMVy0S4Tk5Y/r8pYgDaBvTVD/X/moL
 AmUaaLTBaGw5nvHusxgE58XWaBI3YtddZYMP+WlwsyM8uO0IH8yRISvjAX4cVthLagCo8fw6UV
 nh0=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Feb 2021 04:59:52 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v15 08/16] dt-bindings: add resets property to dw-apb-timer
Date: Wed,  3 Feb 2021 21:59:05 +0900
Message-Id: <20210203125913.390949-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203125913.390949-1-damien.lemoal@wdc.com>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_075953_868524_35342087 
X-CRM114-Status: GOOD (  11.72  )
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
