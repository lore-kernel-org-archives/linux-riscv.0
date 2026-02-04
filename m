Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A5BE83EF9
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GaaHNLUxbk5ELHui8RLOPrcq//lVEKAgfzr5g2twFHY=; b=GU7dtAZemfVe5F
	LVxh8/9B16dMiUnI1fMawfBOor+KRg1GLFgCq8GMue6XLBPFWq0z/VeRrSF+o2BgmptYD38Lx6LFC
	QBQEqo7GLtJ2AAoboDdbFw1wcNHR36nuhhdwphMioZhwH4hlFJp5XMPgzC2VeqcDnUdYDLRN3bdyX
	89Wo6OJRs+BtzQX5NsO3rJaDLa+sF2IRPertsq5lbZVhVUS8BnGcDgUnuB0KkKpQX+hTsUtV4MGuB
	7UxCnIBP0itw0ETyElPtKCek7zElH6leLwbNi8AuGlGFZc3Zzk0WiPdobyVSkWkKEFuUHpYMA4Nrj
	nDcHqZJcU6OglQyH6jMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZ3V-00000008CY9-3hUL;
	Wed, 04 Feb 2026 09:20:13 +0000
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZ3S-00000008CWO-3URa
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 09:20:12 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 6149JgsS096272;
	Wed, 4 Feb 2026 17:19:42 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Feb
 2026 17:19:42 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <atish.patra@linux.dev>, <anup@brainfault.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <tim609@andestech.com>, <cynthia@andestech.com>, <ben717@andestech.com>,
        <az70021@gmail.com>, Charles Ci-Jyun Wu <dminus@andestech.com>
Subject: [PATCH] perf: andes: support ANDES_CUSTOM_PMU on ARCH_ANDES
Date: Wed, 4 Feb 2026 17:18:37 +0800
Message-ID: <20260204091836.1713729-1-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 6149JgsS096272
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_012011_264672_F4FCAC66 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

From: Charles Ci-Jyun Wu <dminus@andestech.com>

Modify ANDES_CUSTOM_PMU Kconfig dependency to include both
ARCH_ANDES and ARCH_RENESAS platforms. Previously, it depended only
on ARCH_RENESAS, which prevented PMU IRQ from being enabled correctly
on Andes platforms

Signed-off-by: Cynthia Huang <cynthia@andestech.com>
Signed-off-by: Charles Ci-Jyun Wu <dminus@andestech.com>
---
 drivers/perf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 638321fc9800..39e174d36336 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -117,7 +117,7 @@ config STARFIVE_STARLINK_PMU
 
 config ANDES_CUSTOM_PMU
 	bool "Andes custom PMU support"
-	depends on ARCH_RENESAS && RISCV_ALTERNATIVE && RISCV_PMU_SBI
+	depends on (ARCH_ANDES || ARCH_RENESAS) && RISCV_ALTERNATIVE && RISCV_PMU_SBI
 	default y
 	help
 	  The Andes cores implement the PMU overflow extension very
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
