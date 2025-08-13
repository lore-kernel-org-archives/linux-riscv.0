Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADA9CA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 16:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dVlnt34hgKgePRSSuGBDEGpKM66xaEUm0t6ycLwcLPs=; b=JKPE31rqKyAy1l
	dpYl/0QSdWrEJ2t/9K0Nb8Ed4SYYCwAUp2/INCV2CCY0EddZ63N/3Rfm9xOpcZ4HWrQeSV+zWqeMc
	cQ+4vxQsNc+l3UxPz4gYfeUmNcaUjoYNkmp5VLV5ZsNcSxW81GXSSa5BJRoRl2hHruxx1cM0GdYcJ
	TtCDOJrHgbakR/qtbophIi+AXKX0oPyd2pnIZURv9ZgI+D/MJsu5uN+TXVj3u/+w5KY7dH1+u40A7
	WiML0ms4vI3JtTEj2fI9YnObQWR5JGaZ/+fACKjgSA+sHeyCY4o+iqWTSQdP8KxE0EF/pSKNmoMZY
	a0aH7QDnwp5COtQVfo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDtG-0000000EHnn-3MyI;
	Wed, 13 Aug 2025 15:59:50 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDFm-0000000EA6E-3461
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 15:19:03 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DFIusq1675660;
	Wed, 13 Aug 2025 10:18:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755098336;
	bh=vQzK+UfTqB2GkcvmGhYUquHMHQUf67xT2hc+6Ve6v3I=;
	h=From:To:CC:Subject:Date;
	b=y+zwFUq7j4GYVGgvnePZPG8EWSmLpKlz4/3rtHPunWgLnHbNbFUaxfzWl4IftAC5/
	 uo7kH1y6RstuxsCCMM+0HHIKBSNFW+3pufB76wK5XhKj8VNqu/lBUya77ttVpQfIAY
	 C/OAgpu+L2vxC76mf4m5ekzCu/gxCbMeCv2dHHWY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DFIuUk1060991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 10:18:56 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 10:18:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 10:18:56 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DFItYn2190095;
	Wed, 13 Aug 2025 10:18:56 -0500
From: Andrew Davis <afd@ti.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
	<palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH] riscv: sbi: Switch to new sys-off handler API
Date: Wed, 13 Aug 2025 10:18:55 -0500
Message-ID: <20250813151855.105237-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_081902_814367_F92D2E82 
X-CRM114-Status: GOOD (  11.76  )
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

Kernel now supports chained power-off handlers. Use
register_platform_power_off() that registers a platform level power-off
handler. Legacy pm_power_off() will be removed once all drivers and archs
are converted to the new sys-off API.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/riscv/kernel/sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 53836a9235e32..5e8cde0552643 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -148,7 +148,7 @@ static int __sbi_rfence_v01(int fid, const struct cpumask *cpu_mask,
 
 static void sbi_set_power_off(void)
 {
-	pm_power_off = sbi_shutdown;
+	register_platform_power_off(sbi_shutdown);
 }
 #else
 static void __sbi_set_timer_v01(uint64_t stime_value)
@@ -682,7 +682,7 @@ void __init sbi_init(void)
 		if (sbi_spec_version >= sbi_mk_version(0, 3) &&
 		    sbi_probe_extension(SBI_EXT_SRST)) {
 			pr_info("SBI SRST extension detected\n");
-			pm_power_off = sbi_srst_power_off;
+			register_platform_power_off(sbi_srst_power_off);
 			sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
 			sbi_srst_reboot_nb.priority = 192;
 			register_restart_handler(&sbi_srst_reboot_nb);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
