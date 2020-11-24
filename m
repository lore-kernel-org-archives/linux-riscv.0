Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74803C64E75
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F37EE2085B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IkIzH6+W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="YYv6VgaQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F37EE2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xki+lMHp8WolsuteA9BC56bhXv3gkPt2Oy7lV9NUE8M=; b=IkIzH6+WDx/sS0pDg1vp68VPq
	birHnfAudPjgoUCY5ghHfRt1iW2euHIpvH55yZKsdknwqDe3Oi5owZ8lSquPMj0LryehuN3v0vXaN
	1UAZoa5LezdHFcgxoJ7l89IRPoEk87L40laYg0daPdQb7gyopAoghAjaES9d+Q9v7Lnb/qEPuNnoy
	XXIvFLu4oMvW6Qe+G/4+uGXISoCnHl+wkpDFO4o7i1+QGQcVxIjl1Yxi5ZJG4DwT0AL5KaTApkqvX
	my3mhWX5S0hKM5NxClNiy4HZhf2dUz1hFHK8bGJn1rgv74Hafr2EUEPPZUp4NnFO9PtTKtPvTkROy
	KYbD+agvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khQ5L-0007T5-S5; Tue, 24 Nov 2020 04:37:47 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khQ5I-0007Nj-A0
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 04:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606192664; x=1637728664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TxrkKxa9B/FbbF02pP19+yravWB9f2iZvayjqKxqkXQ=;
 b=YYv6VgaQF4hxxYwClQL2ps9EtsPoh/wU2dF+QkDh14goB1wC5X9fn+bo
 FiF+CCiBLcacfCxYweRMuCqpZdQWEJLXb7bAbtXkkD3C9Sd/agF8sTJA9
 v2pn/t6khnFPdZ6D8ZsKTlAfA1JyX0MEO+moc3E0l1geZe6tKtV1Tysae
 zuj8zYIbSg0U/4dPxoR6Jfh7VdhbyR6yLYmSfS4JxvRXq+tEKCJnvw6r8
 ZaTLQu2f3EuOkUtoOYDFH0kCKlJHX0w1jgyC0xygIpWsDRndgg3qq2wew
 z4sdw49hQGvD2S/Mq9FV6MRHYwBowLT49yy1k4uX6ppI5bFNigiBCL1/b w==;
IronPort-SDR: 53u1pAbLbjFOpFYenmrGQyarEqvLSES/YtbvdQou7gqQsk+UZ2yy0/nF32iKTHJStJQ8inDJhm
 pSeykmrz2Yakf0Wae42x8siNaWDuhFvOMGLmoV2EltxuwxcLzEC91XE1J6n7X8to7nRijewO8X
 XAy1KvXLrKkk8PhMdKOZX2HmK0bPp/iEmUL5zPuf0uhnjvegeQfsgx5Izl6580O4bMEOXNY4ee
 sSI/iVL0/tGkctzKiOZAujFBLfQ1F7CDd7zcsMOq1EGmQ2b0giJgoQz37ykPI+SHiN6X3rkiW+
 i1c=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; d="scan'208";a="157768583"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:44 +0800
IronPort-SDR: UMEdW58SjfHyuiyy0RHi60dTcaCOO/XflmzoS7Dp+ugYMl6I/tD7cZ5OjysGedC9XSKUqWhF9x
 o/cVh2DZI7YrHvLGCjv0DyWSd0eXGYuTs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 20:22:08 -0800
IronPort-SDR: KlHslSkjo5In5EB5KF4Ih7Hi5+5wfJxE9x6XT1ldqRLSLbSAG25QV9rP3cWZXwOfGMFfpwrae3
 vNGmyqdBsuEg==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.163])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:42 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 06/21] dt-bindings: Add Canaan vendor prefix
Date: Tue, 24 Nov 2020 13:37:13 +0900
Message-Id: <20201124043728.199852-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_233744_529876_79025DA5 
X-CRM114-Status: GOOD (  10.63  )
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
