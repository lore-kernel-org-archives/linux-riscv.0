Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2014AC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:37:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B131C64EBF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B131C64EBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3KLpq49Z7DhnFMT9YCHkkDc29eH1VqMlXGk7x/1PdRc=; b=xs5QMpudusa58dCGuw1o32cGR
	WATlJNUHEco8wcRnLuNVVaMRfAAKe9WmKu4Njgq0UHZie/7jOw1emcgbctGwCDJMUBfWy2IMmLi2w
	Qu/1crPaKnyNpxfnraJk4DNFzNyexHvIknuoZfd9k6lr/EZBZtzJ3JigbTwsBgsqj2M1/qQx58Emq
	FEjCXqGMjersV/udWn62KjlQG/pjzKa/eHd3kJ8sVJO1+k7+icpCyFjr3VMkpZp6AqYW6LK6MV9xn
	hnKWJppvHqUfq0BXISisKb/i2gR9AaIyKrP1sgf/HaC97oh2ksKM8HVXeKTKR5JTWhYt5lnLeNnUQ
	0EUSPsDEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6t3J-0008Eb-6s; Tue, 02 Feb 2021 10:36:57 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6t3G-00086e-BC
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 10:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612262214; x=1643798214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CN0WY+YBp4RNoOYHuHqovxX2R6rFlSK3nLo4F3hEm8c=;
 b=BA45d7ViYUlCyynV1zNsK3A9o8SEnaxc5tBEBpx8uoiX4eTEjuAicY/2
 8Mpz5UF4V03YfuUFOayt/NColDjCK9Gmz/4oyfwyXSF0xfwr3Pt9oGEOg
 WeTMu3Ndj9GJKoPP2la5v2P8Gp9LIls7GLToYCDJvxFyjEfdDlkShJPxf
 7/Kizg1CXInHRvsayZ0qh9WnpZGD5S3qgY3qAjDKWKTXnv6u8h+vz3rik
 eUFevHnDgJoH3bOLsHQEwkVFOfEoE2zLd14e0j5d7etV9xuRc8eV06ppS
 kysoAeIi6d0kyWqk9EkQtOldOmjE1+I9dbmcxxsw4ACBTd9Rvl/jR9a9U Q==;
IronPort-SDR: WEw5AZEXmyR1amHspooiwd2L4X6eY5ANBtjzyb6+KRrq9A/aZpmAyDeuLlBBBGBuLnY4IRpi2y
 R8Ejb9LmwKMj/L09plov9JH6TZ14ivDIauSFIkVR9cIGsKS9REg40iaUTRiDyxcNpvHLgpDInj
 VzSqUN+zBKbxnt+Z6Vqtgg8jDnQqC24pwllOG58kW1LTR8qiEhcZM8n+eifVSwqxi3GDj8+Ivk
 HWMmPgDJurb14dvTBK66pXKWG5JsDoirV9pgKNSJoJ5qY8n3aPrT/YRHiSjsnMxiIsIRsWsy1z
 m7s=
X-IronPort-AV: E=Sophos;i="5.79,394,1602518400"; d="scan'208";a="163357069"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Feb 2021 18:36:53 +0800
IronPort-SDR: 09rweo7i3INnWpvFNw4hLgQxUP7u8Ra5R8o9tPn8eHxBtEiUj4QfI6fsI+rKawYo4oBzniKTDt
 YXrBZNi+P2/DtupQPqzRkIJTAaoerl27bCskDkEKL/cxPIoCUdp325ULjIKzHR5d6Xjvxxh9op
 g/p8hQa88mf3wdQrzD7+7bFELugblIDeX2diNla2X4/Qn9E/ZEp3xCa2vBQ2Zrv2v1WtoKPMFC
 uKrdclsqP3kpptZr26uPfr055ENgbl3oYLqn+7lrnSUWTd8tXNYyW6Qvx6oqh1XIcIK7ueksJh
 lggeUHjbi2G/6gFdercfX1Qd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 02:21:02 -0800
IronPort-SDR: 362wvnRVH3IHs6aQDGZksUt5AilGK+hPunyRpV7qLEPp4wUgFOjkchmb7RJukJT5eakYqRrZs2
 W0WwVJbOU0CQqaG6E5sQxH+5bbBNYr03xvunwhQUPP/mYW50qg94KDJXPM+7pVTRniQKGjr6aJ
 zIG6mXCVl4PsRaWQ8yzPxAYPJv8iS/CDd8kvjUfxPPOXBTjYA2Y3K9l1pYpaHlxHZdg546ZzZR
 01kcc2gPX7kYNDXUmPWymEB9I0J4pGVLcSNaZj39YF3R37nzLBTsrUOoCKUehuP1aNWE9J+kms
 blM=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Feb 2021 02:36:53 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v14 08/16] dt-bindings: add resets property to dw-apb-timer
Date: Tue,  2 Feb 2021 19:36:15 +0900
Message-Id: <20210202103623.200809-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202103623.200809-1-damien.lemoal@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_053654_581075_A3EFEFCF 
X-CRM114-Status: UNSURE (   9.96  )
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
