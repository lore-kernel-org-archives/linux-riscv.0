Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45865C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 31 May 2022 05:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jr41CbKWrSh/YsqnLeH5JDijTCaMK59hzFMbu0gPMOA=; b=cvIfMPd6QfLqZy
	FPIEhZdY4VRMTEF2vuZsrZc88mVzmcV1LV7tRN25dwmuc1HEf68HaAYH47wYzhDfN0hI+Zjp4M1M1
	USg2FZdrC9/vjCL/A+m78PTHuSF3fEKkuw3qvQGxlKTBsM8S4PXP7gyw2divCbd93EOtXI3wR71f7
	nij75IxVJhnOI2j2aZuKkdiMdNBDrnCJPKBLJanifb4R6syRdHl1HDcasOqPNc8ZhGiSH8Fg7jVhD
	LQAmDQkePndNPs+2jXL9bIDOJ27Ku4Orw8ZaoMbL45nttBNZRGndldFKs4AahEPq3B+z2R6/bOTrX
	eG6bosuXHd3Cziwl+OTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvuHA-009Kyt-JM; Tue, 31 May 2022 05:18:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvuH8-009KyW-Hu; Tue, 31 May 2022 05:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=AISHTQNOXWXhXBPrTXP8HMK36y6k19YKlAeaBaaAUYI=; b=gKD6MQBHVag/ja57KdP9OCrXJt
	JMr7iBjlXGr4ttu0zNTfWZgN3HtOCq8sgYWNQ8Pz5E3CQ46W6vyej4yDaJZjWduO8+JQyplcSOq34
	HuKNg6I0owcO8yBvsgAqj+9mSRkvsbHhQwCM/+mKPsmJ4L1M7yTcVEnchuGQ3p8WQbcdZj5yEjRZb
	uOV4Su6uSerjagYgp9h5qvy3Ggwpz6f27yR+pm8VKAq423eE+60yLieZfse4O88VN7KgV/DyJDVVQ
	+8ADRPvEuRDE6gKffhoZ/JlfK6CUw+Ctr3i2nxQgwYT2bWOztsO0F7f7kJ6EmfoRnZDtEp2ydyuEm
	t2IGHP2g==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=casper.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvuH4-0054Vg-GT; Tue, 31 May 2022 05:18:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [PATCH -next] riscv: errata: T-HEAD depends on !XIP_KERNEL
Date: Mon, 30 May 2022 22:18:26 -0700
Message-Id: <20220531051826.9317-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
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

Fix kconfig dependency warning:

WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE
  Depends on [n]: !XIP_KERNEL [=y]
  Selected by [y]:
  - ERRATA_THEAD [=y]

Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/Kconfig.erratas |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -35,6 +35,7 @@ config ERRATA_SIFIVE_CIP_1200
 
 config ERRATA_THEAD
 	bool "T-HEAD errata"
+	depends on !XIP_KERNEL
 	select RISCV_ALTERNATIVE
 	help
 	  All T-HEAD errata Kconfig depend on this Kconfig. Disabling

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
