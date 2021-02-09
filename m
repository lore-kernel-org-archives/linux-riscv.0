Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C1EC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8093C64EB4
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8093C64EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hQqmwUGTRtLWJ/g8j/lY8xYgjNeH8yAgWBiPvspHh6s=; b=TKWt4NYu1rWGyKFAfDp/csIzj
	YHrpMWv6oZ2Q2B5waQ+3ZNdxoPvbIrFIK9tpsOFRX9DfiqL+FVeUi3iOuepf3fAhCxV6xzLTNi+2U
	jzC+ev5YnR6eilj10hor21meeT8DWi2z/K1M0opNxg45xF4QTyWi/Jxp7wpW9J2I1SZS48JlVeDqf
	j6QzAYAIF3Qr2O19gf2dXpE4JR5fVrv/tQ8b7ebUmobSNMaRJPZoQuIR+G9h8ZlQfLUOHpY5dAobF
	sLyVhcO5c7ZvUMRIMTzhnzZeeZymjslKikdtN6D2KBFR2ZYAmsVj2BjwPMCpEuwphf/a14C4PTAWM
	Ok2AMzl8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9SA9-0008CR-Le; Tue, 09 Feb 2021 12:30:37 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9SA3-00087n-W2
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 12:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612873832; x=1644409832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CdDSnYoUg4x8z9E5kd8zeW/UQhTCXdRY19IDHVs+Ulg=;
 b=bRulR+qLrriyNYu3/atsd1KlF7RhG5aEGDh4SYYUAFDf4QZGSK0QFhcC
 P5cVZguTkuLbOscq7VqaKabzkkOMTHj2Yf0OFXdDV/OSj2Ia8rIi3PAaA
 3RupQ8c6k6NLIFiQLXaKXynpcKbMkAFijrxdu7tb+xD0mvbQRayzPYIJ5
 uPXk2JQFJDAH+an0UnHxLxq8zXT4NWFiTyNQcgNtDag/VP+NWzIW6H0kh
 WW3mkNjWBkiVzTZoammn9l2rldYaUqHMd35WevLgIEkw8zx0QXOaXaiXF
 9i2efgsI4WiPXdQeizLqA73WSFujyi/F5yywjJGdKNLbqQp+BME+Hmtpt A==;
IronPort-SDR: 2q3Dr+7iDtIgmldnRmlW+R5ceONlQupgA53vb1fp6cpChGE545RgL3lwjROp14Bu06ScY+bxcC
 /S9C4M6FwoYok21ZwBIW71qff8HEwqcbXUv1rKz4qvPLBRLr2cj9rbII7FO6TYsv0tQz/U1MtF
 oi5kKhmiC1nqG1HBZi4Tcssxag1w5tiEOGQWmFHVJ2opxzyDv6+lDYgrh39vDviXopEPulZt8U
 A5gXHjH5SQn2CSnSs1AqNNmxhQC2Jcj+jnY1oTiFFwj0unwtBDdVYF/HjwEktGsCXuFpLTB+DZ
 dko=
X-IronPort-AV: E=Sophos;i="5.81,164,1610380800"; d="scan'208";a="160707562"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2021 20:30:31 +0800
IronPort-SDR: vrPCIQpMEUotvoWKol5W/7ybDMTmoEQVYfaCf08yUWEigl01itzcclvvBw6Zu4kDeZCCKeP5Jb
 LURNR6GBYd+arYAaGoRCHO8gu2pc0WOT1SJkDclnGPaGO5E8skoYAsrVyawTZiIQrhrrrb15FD
 KGLWOq1ydPoSgpa475iPd4TemxFnaOxvyHfLadkmVzIQo+DEVo1XP4iGxPHiYgdtDm3YNB95d5
 gECS2vJAGllfBgvVOgclfkFi6On2Uk/DmFpY8vB6re44M2AIg//fjdBk+GORdRZGPQxQgMTk0c
 Yp6Kfe7+PWuhbUtGlVK2CZdQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 04:12:25 -0800
IronPort-SDR: 5cL0Thx6WDBaCz2ayEZmhttWOulinwOkASJ58p4pqWuqpATlAHpqsmZu+ufE1HNQ+rWJJvyBM2
 pOJM1RsFbp5sbj5v8eOIe2BqVcWDtR6ql7UgCvI5CQus3Dfirvb6Ax2U92qv98GZjRooqFrOSC
 2KuyjVFZM/3aQsH7CMhztdTtwCEnvBAllTAu8TCVPVz292D04e2nPnVxrKL8LfKH3Z3uCABFQL
 4uTG3uoqr8/JPHFIgU0iZu2vuuQ4YWj3PRduaUvkme3KMdNZqD1LtQuoobGYyMrJjl2eJMKKiC
 s28=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Feb 2021 04:30:30 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v18 08/16] dt-bindings: add resets property to dw-apb-timer
Date: Tue,  9 Feb 2021 21:30:06 +0900
Message-Id: <20210209123014.165928-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209123014.165928-1-damien.lemoal@wdc.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_073032_190002_0541E759 
X-CRM114-Status: GOOD (  11.22  )
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
