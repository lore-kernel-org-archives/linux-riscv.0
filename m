Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AADBC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 02:15:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED23522EBE
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 02:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED23522EBE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZUNcMgRUc1miksb6j33Gtx2AHwstc8+YmVAr6IAqwZs=; b=rND0KZJkolcc68myifftCgpYPV
	ZeSC2/fYyfJv0xlJ0FrUezmuh+KIldKX/CITRKldMzHr96WU0/b64L3UJKk3Z3jdBXeDQZB/XxLNl
	pTjDpjt9/gxosLhLZMgzqwGrt0kjua69A4DEIAdsf7aACywmTkf1/sV3GQZXaCNPQFie3sjPRmf0S
	/zdHvJ1qFCXoITyOEj3ziYZ5rbTNyPfG5r5X2FDzvZqeqWNVhLi5zTpb1AKqcY5PGyzeVsuCMGSV/
	CVmd9INZJ/0eWasBto5U8hMg2XqHPbzztbm43Ff2Tt5M0c/JH2ZxwpolDgxUTvLSunGsPT5YP71h6
	axcXqoUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzVgk-000645-JN; Wed, 13 Jan 2021 02:15:10 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzVgh-000636-Gs
 for linux-riscv@lists.infradead.org; Wed, 13 Jan 2021 02:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610504107; x=1642040107;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n+D3e3LBPNxHm/PCQBMd7yYazWlq5+IGR1o85H1x/vE=;
 b=GW7HrKHG9+xbN/x93kqNtsw0lObt/gOWg9UuqpqU5FStdVtNLCXbg4h7
 j71WvxrEB+ctD5+UrrQ3VsThDdnI6w5KAPP9vlhg9lV4VR814rLLudRPT
 ih1b3CMR/OE8ppnYctEZ+O2/dpQYk3q/zY9NQWMOm1HTf1uTUqPghwNRe
 FDjITFSrCf18UkdBuOEENNO5P1GSOjHH1uTnnnNmcvp8ClTbF0cedhK3V
 VhOtgTHKpWw6Uu4uFZk4vjLZzKBH6yafRhGemfwcM5zA0sHV2J4epVewY
 149YUWaDh2uMQRkQ/KR3vBgLJJLhAK2pRSj7HrGzeMcuXW45Y2Us0v1zf g==;
IronPort-SDR: 6KyiSOmuD2CODLSoqLro5U838TdRFxLptcaQ9vcJ7XfF19mcQYMAggvHyk3pKdO0NO1jc0crKJ
 xtupIhJoRQz0uhAVUaeilO+TOn2lIBOA2sEwfJ7kpmdSK+8iEtRUm6wBHxHGw3X02IlvvaubSI
 sWIAXc+0bUT2OQHgvesmqz8kK27HCQyum5JPzpvgeF8FwiHWW6i3yRMvPEfN+OQtp2RX8ZuCxL
 ileVfgd9TJ/umn0iXwlZQGQf0h8lwjD8XRF95E7rOceFqqxan7+ngcHoV5BD76FRzNqSoXO6jT
 mDc=
X-IronPort-AV: E=Sophos;i="5.79,343,1602518400"; d="scan'208";a="157288945"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jan 2021 10:15:04 +0800
IronPort-SDR: DLrG9aSxQF3AVJ77f3YThCL0VVPciKaDFhmrfHIdzJJ0oQod16hoiuNtIctoYqLKBgmXVQl/e2
 77qsv1stRj/ZeMCQpUgSqbfn7VdKwINAJs3zNlqgUaNS1lkHkbiJb/3FWRkbiiOW3duPpx3z9R
 SaV1R5csmBKzokEK8UFKkPpx4y4jzXlG9t87VZfblQBLsMWWuAh6WiUnmD4CI5nZd4a1GgBbDw
 uzUUjQcqhqcS899elLaV3eiBJhBrW2p/ljZ2TplpKyEiKVXBBpO6YWVhaagXhS4AfDZjphSuFi
 jDnaK+Sd+qNZBgDnxwebbbZk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 17:57:57 -0800
IronPort-SDR: Y2PZcGmkO9KTePpIZm++yc/2Sq0i6Oxj2zn6B2BgORLuKSx2BIMDnpzcFkHOuqwXO0dB1rWhoU
 9MP29QOk8HVwm4o/dkqLNQEIAsD6TeCmBCLf/LWVvZxp5Z7ZVPUWvXxUGNTKN2zUp4hkbU0tFf
 EgJCN/tXz6cVMB5kgbRdkoy4xUEIxkpfWRbVVCv2bklDR2YAvz5HkwfQyd7kbH3yralVRa0+rp
 prPO4IE3ZRh24ALojLKRaOnrr4AlxkFlhQCeL1cR7Jjar9xkUzwgwn74Nm8yDo86yMy6PnsO79
 Dcg=
WDCIronportException: Internal
Received: from cnf008148.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.175])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jan 2021 18:15:04 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: fix build failure with Canaan K210 SoC
Date: Wed, 13 Jan 2021 11:15:01 +0900
Message-Id: <20210113021501.363913-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_211507_798853_E99A79A5 
X-CRM114-Status: GOOD (  12.90  )
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
 arch/riscv/boot/dts/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 4da40691c55b..406740a5da28 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
-subdir-$(CONFIG_SOC_CANAAN) += canaan
+subdir-$(SOC_CANAAN_K210_DTB_BUILTIN) += canaan
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
