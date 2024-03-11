Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89077C5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 06:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g/9/j/sE7IMwDGU2MR/m52iQ5gs/MCnnBY7By6soHUA=; b=CXcv/DUDRQ2uVo
	pXPB9AnQ9+SPkF2AMroElGXcd82acjI6t0Pq4IonpL8Jtn+OuMeN20kBgN8NJr11ycGuES2chLIXn
	0WdvuKtlSPuuXFCCGzF/mQjqzZPDGVIqndc9xCVlHFQeVvQbas2tQCn+TSf6Lh0v5l41I8u0mpgo/
	Ax4fq3gKr60OH8UoqQMcUb4zX5APHd+K09JwiRK6+6aMRI2Dlu0zZDcA11Rf+I9LJPcxU9FRiqN7G
	iLuq/moZYqOthC8LzKFNQQ/YhHN1w+ABNOK5CTtcnVPqR59UvR76fFAd2d7ZJNikw85lEDr64WZuA
	4LiSGSCnF9r4IX/MPXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjZBV-00000000NMT-289z;
	Mon, 11 Mar 2024 06:30:53 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjZBS-00000000NLs-23Gg;
	Mon, 11 Mar 2024 06:30:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e622b46f45so1923203b3a.1;
        Sun, 10 Mar 2024 23:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710138647; x=1710743447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ7Kf9VmIry7xZNUuPTcVhrx5As2GM5N21xZAtn+OAg=;
        b=mh6szFFBBdVu5yHL66qRjbz8QzJBoHgPQGarZ1SkfK+4jTiORVupiaZ5sgHv7E+/aX
         8JeWn8j0Xqw5b4dklLMEpHuaOsbv7Ou5ULb37BkOObDA+1fKOgOBSD59G2Zo3af+pA67
         ZbcZ6ZlyNbzDyOU7f5WMHwRmvxsW/48rkgH4ADhaqnNxvh5OzTgOa7WD/qZ3p5asQGqF
         MVJqP03sHB3LbTLY1F6bzKjFu5wzEn7pBqDWpvIhr7Eqe/0UmVjfz2W/U4kJR1sdIRXo
         PloBCtlDrZP8PHODshVTDq5m+2LvHIIV74WAjMZ3HBoL0gekaV8+UIeVLuS9B042MT3p
         Haeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710138647; x=1710743447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ7Kf9VmIry7xZNUuPTcVhrx5As2GM5N21xZAtn+OAg=;
        b=d7Hop/tzu+BbSgGGoBYAjD6s8+SJGqyQ1UsGxyEf3wzEQMkBnhX9NGc7FtAkvnVzSQ
         XAjY6mW85isI6MXWkzcjuUXcd9Qpwq4cpr4OVa21oCtt33N5U4aUEZd3K/HpVGgfzwmp
         8mFkeL71X5b1xSKiAfbq0i2YI68HZt4O+NslUX3+2W+ODd/Ri4X8e7Zm75T0xsw4Bysi
         PcMsPFWt/1LP6kFRz5ZECeoC3btavghYykt3LzdspG3mRCEt0aMF8Ey8819i4jms7v8S
         WS0uNOShE4eyBJpUrJlh9sWC39MBAwWZHRl+SibQCRS1/TrkSEzc6dA20HdtCxKA4QEH
         CWcA==
X-Forwarded-Encrypted: i=1; AJvYcCVpba2y9/fiCAMfyyiga8/xrPzRGgcXg5czGUUAgzOAzSIbmXsOmieeQy3qLCaT7ehLdae7iBNoTc2+KIOj+0QOxqlqxs3n54aoaBtIaiUKwsKqBkWuP3kfeXP8tHeFFlM3ulg47FmfxYAvz+JCmEX9TH4s91o=
X-Gm-Message-State: AOJu0YxyYQPfFKwztuj6jc4ltv8ctDURECVRDFiwcClSubzP2ZnG3OFO
	3zDJL5jUD5O7gRsLKut80MltAlEqdDVnAoO0VcHLarsavD7KHbiI
X-Google-Smtp-Source: AGHT+IE2d7g6KEx5Pi0QGiEbt7oNk3z4OQdctup+mwEl0Rlyqk0V6ap/+GtCZwJbxw1uSFnsM+m/JA==
X-Received: by 2002:a05:6a00:3c85:b0:6e6:35d8:9c56 with SMTP id lm5-20020a056a003c8500b006e635d89c56mr6841451pfb.11.1710138647023;
        Sun, 10 Mar 2024 23:30:47 -0700 (PDT)
Received: from DESKTOP-4R0U3NR.siflower.com ([2a09:bac5:80c9:183c::26a:36])
        by smtp.gmail.com with ESMTPSA id t23-20020a62d157000000b006e56277fd45sm3765410pfl.190.2024.03.10.23.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 23:30:46 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Date: Mon, 11 Mar 2024 14:30:18 +0800
Message-Id: <20240311063018.1886757-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240310_233050_558619_BFF58F94 
X-CRM114-Status: GOOD (  11.50  )
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

T-Head C908 has the same IRQ num and CSR as previous C9xx cores, but
reports non-zero marchid and mimpid. Remove the ID checks.

Fixes: 65e9fb081877 ("drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores")
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 arch/riscv/errata/thead/errata.c | 4 ----
 drivers/perf/riscv_pmu_sbi.c     | 4 +---
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index b1c410bbc1ae..49ccad5b21bb 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -125,10 +125,6 @@ static bool errata_probe_pmu(unsigned int stage,
 	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PMU))
 		return false;
 
-	/* target-c9xx cores report arch_id and impid as 0 */
-	if (arch_id != 0 || impid != 0)
-		return false;
-
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 452aab49db1e..87b83184383a 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -811,9 +811,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		riscv_pmu_irq_num = RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
 	} else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
-		   riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
-		   riscv_cached_marchid(0) == 0 &&
-		   riscv_cached_mimpid(0) == 0) {
+		   riscv_cached_mvendorid(0) == THEAD_VENDOR_ID) {
 		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
