Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA892C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:03:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A18BC64DA5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A18BC64DA5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s3lMHQs2686kOaUx4VCAcLYGHZ0htX2An2c25uTbVSk=; b=gDRMUSQyf+NO5cjd/FwHibUXq
	mf7V1qCSU2T9rezJjAEGnvHrFM/QaS29ov0Mlm/TfdcTacg1kkvvsQ/8qSJ31kLF8sgPFKGa/EkIo
	B85aeYjif2S3z50vG6koSM4GveWB41SGuaXjVTH8K9xlM6X897CEoj65huax+ezhxiHNNPB2ndn43
	++NhIhjY9+VXbH8+4uetXA8UkAOx0KWQfbT4AgNk7lmZzHWUcHbrpKfPbuMQS4IEH3h6eROLeuvWM
	lrczKLyH5AS0z1tErgPByNeVHmDYDcSC5zQw67bDafyq+TV/aF8TR4CpqnqKcjB+RNNEci+t26q0z
	evtbkwXBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9heT-0003OI-OA; Wed, 10 Feb 2021 05:02:57 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9heP-0003Jy-Iy
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 05:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612933373; x=1644469373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y7+Iv4l5tkZ5CWOYSGe0JkPbRmlo89yMwmsefYp0XQg=;
 b=d+krjsObtckMdNxWlUKWp3BpMQwg590QfNXC0Z7hAmNBYQ5hNtCOya2j
 O3dzIYKPUF7xBT9agZ4TR+uNoaUzjTBN/UIyXtqm6OVHGH6tl+CuY020V
 5AXjtfQFfJKgHd4R5w3g5lva+maWzhZg1ZwazoNesz0Ppi1S9+6GxfId0
 SBRAvKW0ufxH6ZekjL+7zW8pH+nLXsJv8ETC39ov19aAKIADmOVzaESB9
 xLa/FVLLGhks5k3AIHdC1EaCN8f2hdEa9h9gkh57QrB9D0Xz7+elhc932
 xos9MNmjO+BArOt4Fb+cKxVHuRjIg0B2JLb1+limEbHdpOjZAHK2OuITF g==;
IronPort-SDR: H5HweYJ17e7bdxuVdIyP1UwBN0RJ6u5cGss/ezqZS0qF8CreRfo+WxVWYj64nacBrF2n+/PlO3
 xP1yqwYqXbDScqqEcpwZjhcul9vhA9F1Ww4ctPKDBqc8EmBVbjfg5Odp54UgIwaLOVLmSFDJB7
 0djAV4YBoNN/lyNPBsqJ8GBJH38W5XLStaPW7qigpmhZ3wEsvp3bmDX+acx6UsPQCmRaozT710
 TUkAv+GQc84fWgimv7wrKPAtmqp/G+tyNEhiNp4I2XAX4vMOi+hrwj/fUku+tj2vBz0SkHdatP
 QDI=
X-IronPort-AV: E=Sophos;i="5.81,167,1610380800"; d="scan'208";a="159592696"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 13:02:53 +0800
IronPort-SDR: 2lPlsTFtDUBqKPQmC27SUbGuz1RRHn6UpgeihKjY/HvyVpjQQJ1SiwXqLKjOHr0aW1bYyV+Eli
 bB7aTpwZyFh0cW7BMdUXYzzzpu/fIu3Yl3kkZUOqUvo7vjIQK0e/e5nfQ0MCGOEzlkI7CEKjpP
 UgePERbsdaRpVy8xMctu08W3yAw+W+dns3GGOodUBOoLhDQ156eGBKdsIM596YQmtv/sK6vwNF
 AlXgnh6uX2jWNaNlVVUCQIZ9mromnbThlxFq6dwf2FgSQjqy4hMkCqeKneQ6sU0FztGFE4SMK8
 g89f7N8BZCLmu+tUMkJYapck
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 20:46:37 -0800
IronPort-SDR: GLJ7214isQu4aJj2VIgRnA4s4WPiLkYcds8sD4UrutqqllhWHpPxz5Fh1Gv+kIJ/Y51+U+Su49
 5122uilUY/jZThOeUHc8yectbLpknVy450F9E81V/JwtYWH82W+Y1ALph1pw01IT2NJl5bexMh
 S4mcOfUoLlgZGWFADhn+9PjPX/zccAgm0/teRaJxjEMRgxffpegkiWQLb30Av54hEu8CfUDERI
 bouiJNI2JCdcyjwfB3EolyPkGg72AVh3laOW20le/OfhA2lGBlvoCo0hv7v73T4/Sv5wva6oFB
 5NA=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.72])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Feb 2021 21:02:52 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v19 09/17] dt-bindings: add resets property to dw-apb-timer
Date: Wed, 10 Feb 2021 14:02:22 +0900
Message-Id: <20210210050230.131281-10-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210050230.131281-1-damien.lemoal@wdc.com>
References: <20210210050230.131281-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_000253_810910_842340FA 
X-CRM114-Status: GOOD (  10.39  )
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
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
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
