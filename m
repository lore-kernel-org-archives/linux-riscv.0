Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA46D79768
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 11:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=luhPQSnvuU92F3RqzE6UKva2+SVLibuyw+2Iu3QQW/c=; b=BcJlZkNI3AFjFZ
	LTJr2hppm2gnmdMtBZInjQ3kKP6kLNkDSHA7ccYxszh3yPhJ0lAR1Hk6Fex2lZop0SIy07QT0I4jm
	LyZwTebENIdT1Zf7iENytWKJ9N1ceerG0EFzF+Uld4q2ekwPBZqRWST4+ZcXDxBdd9lesmv44vdZV
	hay9vvadREFphrK1uJvgLojH4S2FB4riKwFSLR/Eg0iCTXU2eqzkfBoWA+nYn/cj1/vciHYJuxPXy
	qgvd7C5AVLQeNSSbBkQxvz9ypH/eVDVoJDFPCyx+cXzz1Y8AjclF+IV53CrTwMNCwv5JWpy96XjJk
	pFJDJHJJXteR+5y+tlIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm969-00000002XP4-0oRb;
	Sat, 31 Jan 2026 11:25:05 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm965-00000002XNx-2WP6
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 11:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769858691; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=akXybSjiEsQDFdR5RqRjQbmk8U+vkxwa3dzuvwZ5qzU=;
	b=I//wplW5l9ZDiJDitliyAzA5PcUMvqIbOMUuiG7x1KXGsxZw2cOC64C7AKfJ97oHOXV9XOIvXYW8UAmKtOHp1qaQ8GbShoRYYD/cQZFvDny94e3cbJKpmNy71K/tG26iA6DTOFxzpupes9VpTNV3d9TMxmQVoQHFbPWTnk5Izlo=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WyDU-mf_1769858683 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 31 Jan 2026 19:24:47 +0800
From: cp0613@linux.alibaba.com
To: atish.patra@linux.dev,
	anup@brainfault.org,
	alex@ghiti.fr,
	pjw@kernel.org,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] drivers/perf: riscv: Keep the fixed counter counting
Date: Sat, 31 Jan 2026 19:24:40 +0800
Message-ID: <20260131112440.2915-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_032502_463146_F27792A0 
X-CRM114-Status: UNSURE (   7.45  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

The RISC-V SBI PMU driver disables all PMU counters during initialization
via pmu_sbi_stop_all. For fixed counters CYCLE, TIME and INSTRET, this is
unnecessary for the following two reasons:

1. Some kernel driver code may directly read CYCLE and INSTRET to perform
   simple performance analysis.
2. In legacy mode, user space directly reads CYCLE and INSTRET. (echo 2 >
   /proc/sys/kernel/perf_user_access)

Therefore, We keep counting CYCLE, TIME and INSTRET.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 drivers/perf/riscv_pmu_sbi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 7dd282da67ce..93aaab324443 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -899,6 +899,9 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
 
 static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 {
+	/* We keep counting CYCLE, TIME and INSTRET. */
+	pmu->cmask &= ~0x7;
+
 	/*
 	 * No need to check the error because we are disabling all the counters
 	 * which may include counters that are not enabled yet.
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
