Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3821EC4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:34:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E831023A6C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E831023A6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xki+lMHp8WolsuteA9BC56bhXv3gkPt2Oy7lV9NUE8M=; b=ul//A7Ihm4cpwGz0pupPbvUDM
	2snysIhpPSc3w2e/FIqYNfhr204k1TVrTXEki1crhDvUffP7GkHXXtafuXhnb2GsMD5lBuZOA5lmH
	5XEivEQ78xZzoRDIvNAAkdQsNA9c3IhyQO7B0beXWy0PTaBXoD8B9J+7jbHiKHvi/5reoJeiPl8JG
	qAnLR7PcsW2C6bvdcu9rK63n0oOGPkJjLOE4nwH50SWVlD++FAQTYSP3Z6ao9+KqQmpVlVA3V182F
	EuZzcM1rlJIsMCBkrRW20N/T7Qg8Foh0WTcv3lzCJsL88pENeJlFsY69xGorLfnvmJbWuhQ34A7KY
	Gii1RyGcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmXVn-0000Dl-VD; Tue, 08 Dec 2020 07:34:16 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXVl-0000CB-7e
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 07:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607412852; x=1638948852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TxrkKxa9B/FbbF02pP19+yravWB9f2iZvayjqKxqkXQ=;
 b=G/6Fmr3tD/ZX7FRwP716eWzJ9kuA0qQUXUnNy2NYtvWu/4WMEDzBB98O
 GVJqZKgR/CFdMX77j6DOvTMNEGfgDaE69esPWK6m88PPu8Bg2y/afS6E7
 kaPTri4sdPLFXvkH5aBJses7S7Y/lpbiP2pf8zCDFuVAmO/nxk3xCMPfN
 ery9k642cRW6FF8zJLoAl0Q7qBUakvoDOl3hjUKlgaFOILux3iaWXa1Zn
 G+BN1nif7GXFpz7+wTGBGB/Lxz44eKSDLHMNXeVnHMWqm54+StpwOVaBy
 BHB86FklXfXx7qVN+VtDGi2My0+vu7NhHFEqkc8zG2tEgdsI4prumC0qi w==;
IronPort-SDR: jE7TQXopFnQqnzINcuYNkrfmEv5Umi3F1ILHo4tKSEcxL0LZE1aArmii/KgI2gLuiMWBnTcBFD
 Hy4f0GkmCKb9ceiwIy+yrxCKk0RUVIxaqJk0g5pTeMS3IWu0c/ZoQGagnsPrjaAVENqbRCrPw+
 nsTII2KApX4v9YOmM2GIo+TlG5GInvFn8BUCqEjnzzzjltdW0Tafrvd5HT+rqN9j3VDaXN/O76
 qLWFR5WU2ISfNxWHcDcaIdossbqgPct2K8L7iRDASGi/fh+QRtELBIy8Gu/oZnA9c+/G03lSv3
 IBU=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; d="scan'208";a="154714894"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:12 +0800
IronPort-SDR: eGtI8pOEnDV+hwZrRzvFC3PXGR6By4d28NoQFswmDflt/BCB0cT9bGUpcy0lCsUteS4Jx2vN88
 3He1VQ56YxBTWYOmNpXpgOtfERgKaMkDE=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 23:19:40 -0800
IronPort-SDR: fHV2Oo0b5HDf/fIsYIhXendaxJV2mwKrHaAzoaX5oDnmVKuxOiJysLjFLvV8ck14mRsD99Dqd4
 smXOGbW8bhyQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:11 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 06/21] dt-bindings: Add Canaan vendor prefix
Date: Tue,  8 Dec 2020 16:33:40 +0900
Message-Id: <20201208073355.40828-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_023413_458390_DF575B64 
X-CRM114-Status: GOOD (  10.32  )
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
