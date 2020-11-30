Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683DAC63777
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 23:49:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED521207BB
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 23:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OjZJwBAZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="R1D/orkg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED521207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xki+lMHp8WolsuteA9BC56bhXv3gkPt2Oy7lV9NUE8M=; b=OjZJwBAZnzg5eZAtT5JhZi/DT
	JWcP+fGeQpBel4zzw27vfeP6UPSMUTo53lrtb76PEDhHArRF5qYdPFNxoy9liZKJkZNUC6dVFM86z
	g77Po3w3ol89pH3p1vW+R8G7Ka5sAWjaopMLwuPSIAdpEUJrcGxT1zz3Kp9OphfQL5E2Sc/UcfRQg
	H7GowsiNh9uC33aFw+/aFyXrclkuKKiC1Qi8/p5dRYPxOnsDYzIcIbw/bOBj8RiwC9U8uS+3YUWOz
	IQSPpOXcn0KJbhqlJGLu83aNWTRU/abHU1UeatmY/wwBkxadcYx70w6QbCxKUSREuTVOsAWfvRw5t
	41CaulUFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjsud-0003H7-8p; Mon, 30 Nov 2020 23:48:55 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjsuU-0003B3-VT
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 23:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606780127; x=1638316127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TxrkKxa9B/FbbF02pP19+yravWB9f2iZvayjqKxqkXQ=;
 b=R1D/orkgUfVpMfF3wUe1qSY98CRN/MAJb7sxjLTBuzAzzanYhx5bs2e8
 0Oy3+QQ07j1vF8ZvN6y1aYSaQ3IzDz0elY/yU+4ZBEbya9/5sbgIx0oDA
 VZHCQdIbu06Np3AxPItBRGJ1Ar9R11O3oLH2PL+bvuBqAfF+ksPkZh7Np
 IxEviVPDxfGjqQI76tFgFUYl1tjztkIDQQqPeBjz7/ubLtpFQSNr3zJm9
 eAZhMJdrsXCmK5u2vGr5mgRHx8QkxrMmOpCwaOsvMPovabrPoKV0TVQP1
 sdekZ5MwhRd0R82Dfc7hO8VCMmzZhTTjyZ4r3hvY9uxV8DlEA4alnw5PF A==;
IronPort-SDR: NvW6+dIwCOTYUV//zx9Y45A4cg4FeeThOuRKhpXONRxP/KtZXwsBg80XF1ft22MAcRPA0lgnCY
 uBDZDNZLHjx2o8js+GJ9vB05bI9JmJnuGK25MijBM/UvgspVZawdKN/En3WwbFs2ggwnsYPiGX
 eltdkfTasRJt6TlYh6e/V6SVI+e75aYg6wp8UIUbQiKwHsV3Ai5ia9ECEzy7S6ZaLPqoGXZ9Kl
 vAmDzMdAVJ+RBs5uJVlG2oORYoSaDBTz2yFSUOrIUWTCX58F9wdUU+kyMtKVohqHmXfpGqa8l5
 qbI=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; d="scan'208";a="155058275"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:48:47 +0800
IronPort-SDR: wJKHn5sMZXd4bMvtJuYn+p8qbK5ZdCWCHo3eGMaF/86rx0EsE6WkIT9EFR7sVXDsK7Ky+V2dcN
 GGVQJ/YheRC3ij49xj4eloZpDTi4pfh4I=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 15:34:23 -0800
IronPort-SDR: YBZgtDEsIaewdFEfS18VeZvc05KlbVKZRdFWRPrN8LXeWhxttqcZJJ/SN500Ro1M8EmZ8TQq2q
 E5NmWXLdVv7w==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.196])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:45 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 06/21] dt-bindings: Add Canaan vendor prefix
Date: Tue,  1 Dec 2020 08:48:14 +0900
Message-Id: <20201130234829.118298-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130234829.118298-1-damien.lemoal@wdc.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_184847_278921_044E7220 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "canaan" as a vendor prefix for "Canaan Inc.". Canaan is the
vendor of the Kendryte K210 RISC-V SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2735be1a8470..a07231aaf3e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -179,6 +179,8 @@ patternProperties:
     description: CALAO Systems SAS
   "^calxeda,.*":
     description: Calxeda
+  "^canaan,.*":
+    description: Canaan, Inc.
   "^caninos,.*":
     description: Caninos Loucos Program
   "^capella,.*":
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
