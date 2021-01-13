Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B7EC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 09:44:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E317F233F6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 09:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E317F233F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6clmukAtXCTvopx+JBmIz8Nn4Je10zvnyVX2e/X+I34=; b=c99B/8FzbPaPs1gt0gOoMZI2Sq
	ZBcnoVMBCBQON0SxpPF9WDT/1g7FCAfqGFf1K6ePW3qEQ1PeJwKQaEMdf404wwTBnf6x9r2ebBy53
	RF8wXevyn9Gy4ENlZ99tpKd4h3aPP1sYWCC4om6iwn59PJzeE+345arwFkVsRU1OC/iw2iIMnzN2f
	3MihfPaM8yaVu6oLB7dyuqmZRBM5X0TQVSScM0PlMm9ryVBaxycOzf5O/oCC2h8MnaYdpKJKD/mnv
	x2yLnX/B/A/cGfcZiIWF1bOeVk+IqZNuRaD5yj4+lo9/lfZf2IscLGVf5rCtylRmSgk9iNEGAjcBh
	YGdIFbTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzch5-0007jy-Ci; Wed, 13 Jan 2021 09:43:59 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzch3-0007it-31
 for linux-riscv@lists.infradead.org; Wed, 13 Jan 2021 09:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610532074; x=1642068074;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LQf/JeHB09iYJIq/I3PAVCazPr3p+b251l/a0agWszk=;
 b=grQUkfJEpabvSEKrR3hxsfNg9TLUjY49lkuKVNbks4s2597avy/gtjZA
 CijUAJyEfy726p90Z7d7/BRjVDDaMC8n0n2bMtJUHAjLgQH3Q3X6d+YE/
 fDfXiIP7Frw7tHoUNT5tSdKBfV6cb/V6Dwe0VWmuxzKDzpoS5mMC9Too0
 3muG0uVRC3H5gNYcYpKqDmDjo37b6wvOGwpaZ+MPgOMB1dVari5bwezH7
 2MTNoXpc6MiuZHzAAZZOIA1p08USI2WZDpg6f2d9P4QdmQOCOKVQ8b4b2
 oNCm2fYjcwUo+HMT2Jl6vMKPXP+tteUB5BEryIj+PWwtcHrV8Fp1SC5yo A==;
IronPort-SDR: GpjunEyWE8zDeyrbLlHOljssqqgBK8+q951KYlkJiETXLFmnNhopU5g7KrP7NIDkccr5ltONV6
 hJ226kBaLN8OrmdbSrMU9BXP+xgmgZQ+q1YLbcKs7A6YSUVUMUy+IVJySsG+r41bsINyEX7QlJ
 6EIElStZI2NTuDfnkK3FrWuxQe0lYOvhygnRLiQA96Ul6QZdj3fmxnMp9w08n8uxRiX353+Zq3
 d1W5+QAg3pblY2m/OaIdNT7W9f0TviEA3bQyTxiUqHPxEgUpAadRR6ZEsp45YaToM47FoC8a8+
 zrQ=
X-IronPort-AV: E=Sophos;i="5.79,344,1602518400"; d="scan'208";a="261229333"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jan 2021 18:01:13 +0800
IronPort-SDR: 4D4sVvOxNE+ZAHSEiq90r7gig9qwFvgt66WS3IDGc6QU6L2FEQkQ7mujO1Yw2CnaiCvEzSc0zm
 OeLMeA/8DkRIPNZ8lQksIirrK66d8Q7k6QNCM/ooHEWCId1tMV9NLhmVjbzuVlJ1woi3a6y4ZO
 WZLieNnyOAJwJwz5MOFIYBHrtyMSLifCUbLOjD6okzfdHrZ3rmFQZsCzztnUgKkSieII+LO3m6
 6xDebwFbXN4ryKJqwoEbKD7ZkqTNnCjsPYKGA1fw+d5OPkMBcwHJW+/+IfJFdUiTCDE/eRsACS
 ZnGN8+jg5ivExcVn7rt+jowv
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 01:26:45 -0800
IronPort-SDR: ljBtAo8YZoJQmvvkHVttxrmG/JNiH3Lpypht5uiELOz7SqFHkg/xUTs5f1EXqHWY16qgdbyU/T
 WuDlwovip39CvZE4B1hZ2SeVyeaOhnTmfmxPnJoG8Cmxw1AIBL0jXI29BzgpRexZ4vhtAy//xE
 lpCz5pNvl3fi7Bb8XnyAa+S0g10CWXLV4jZCp4LWrGVAiV7WSh7QqXsfq55Iqt6HOegGpMwvXJ
 Y/kQf2tdzeMa1BOJ5BO8b6HLWBUZayO9+bmDlPAo/M5g7Me0cLokgqtWSal7LOvA9gCpgQ+tTe
 RXw=
WDCIronportException: Internal
Received: from cnf008148.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.175])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Jan 2021 01:43:55 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] riscv: fix build failure with Canaan K210 SoC
Date: Wed, 13 Jan 2021 18:43:53 +0900
Message-Id: <20210113094353.401690-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_044357_302318_98D500A9 
X-CRM114-Status: GOOD (  13.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fix riscv dts main Makefile to avoid build failures when
CONFIG_SOC_CANAAN is selected but CONFIG_SOC_CANAAN_K210_DTB_BUILTIN is
not set. In this case, the SoC device tree should not be built.
Avoid the failure by changing the canaan subdir inclusion based on the
CONFIG_SOC_CANAAN_K210_DTB_BUILTIN configuration option value instead
of on the value of the CONFIG_SOC_CANAAN configuration option.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 3c54e3125dcd ("riscv: Use vendor name for K210 SoC support")
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
Changes from v1:
* Add missing CONFIG_ prefix to SOC_CANAAN_K210_DTB_BUILTIN option

 arch/riscv/boot/dts/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 4da40691c55b..7ffd502e3e7b 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
-subdir-$(CONFIG_SOC_CANAAN) += canaan
+subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
