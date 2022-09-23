Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102B3C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rEWxSniaBA49or18N/uJZcrOepp9GqaWr+2ghcLMfE=; b=pznZM81l+/dQHk
	FQ1NZyD5drkvBu79FiDyWG5AUL52UwOPz/nJZm6QAiClNiwHFQUBJZowdjKqTNX9y6DGC5oQU8RKM
	jajKJGPraCdINH6t+PYUTuEQUiS62si1eqaHJohqe9H8kmpGHYQk8pf/GQxnE2TBa0qTpS9OaZuoQ
	UmtvngC9KR5lUZBoUYzs49+IxdQ+nLhgx8uQgX6tfPoLdkNihPiitVcfd3mLcKZJub+6DxK5zzWZB
	UArbbFqfbjM7pS5kp51WpwchVPTGShmwk8uEYA+YwmFMi0qiZ91XbpXAL9yJVwCjmzP4exXVVYcIq
	FADcus57otRe6sVpvcHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obns0-005Qo4-3V; Fri, 23 Sep 2022 18:57:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrm-005QYi-L4
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 52F57B819FE;
	Fri, 23 Sep 2022 18:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522E6C433D7;
	Fri, 23 Sep 2022 18:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959456;
	bh=WwKj/TG5Zso24q/CFC4VVP3zDX8Q0tT0OTR5S+9at+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XsxqhZIxxkAYUaM4q7ugyT0CMqa27ZhB59CuF/IqiyJsatg1ScKs6H1NVHLKzMr1g
	 SLA14DUzU+SxbxCnrvjal+FFK2ixHqCvuWsepKDPeU8bWHSh5giNvozrAY5vgXjvon
	 t3yi0SAtKYPna0hmSQ0nV44BWRVggRNF9IZ237rWFvBI0xWiHBMPgarHhK15yRw2Ir
	 WumEeeLc9iyMPOy5Xy8agRJdrUR3tWHK1riN2q6ojZaHAKNbn+wUPdOT7nCGakud4g
	 cAJwj3LsfXJZRMHcXA6O3mPjQ6KFnf/yZWudPjMgJtdYvAt2KqnER17DB1+4SHOzm7
	 iXd2XQCIBoNVQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 12/27] soc: sifive: convert SOC_SIFIVE to ARCH_SIFIVE
Date: Fri, 23 Sep 2022 19:55:51 +0100
Message-Id: <20220923185605.1900083-13-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115738_866528_4135EAC8 
X-CRM114-Status: GOOD (  10.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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

From: Conor Dooley <conor.dooley@microchip.com>

As discussed at LPC, the SOC_ symbols in arch/riscv are being converted
to ARCH_, so SOC_SIFIVE becomes ARCH_SIFIVE. As the entirety of the
SiFive subdirectory is gated by "if ARCH_SIFIVE" in its Kconfig, the
sub-Makefile can always be included.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/Makefile       | 2 +-
 drivers/soc/sifive/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 69ba6508cf2c..534669840858 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -26,7 +26,7 @@ obj-y				+= qcom/
 obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
-obj-$(CONFIG_SOC_SIFIVE)	+= sifive/
+obj-y				+= sifive/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
index 58cf8c40d08d..9f52227c3cce 100644
--- a/drivers/soc/sifive/Kconfig
+++ b/drivers/soc/sifive/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-if SOC_SIFIVE
+if ARCH_SIFIVE
 
 config SIFIVE_L2
 	bool "Sifive L2 Cache controller"
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
