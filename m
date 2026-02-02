Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D457E73158
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 11:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3HB63WXTX3C5vK/+NursEAh3tt7ANEn4yE7fxSF22M4=; b=cmGwK3ACrc4Tu8
	2z/LaXuMGm2+vN/CxjVQR3i7CCz/uA83oj9PKEUxHAkp1bFbzRcasTba2oT6rlV3kehRq4kb+tb3X
	Bvuivzyb1z+zFtghfEFmZFM0aeYis8psrhPdcW9aoS2J6CH5yVtoxapc5x8gkgH8sE4QDZIRa1yVn
	oIJ5GfsxGEX08ZcmdV8h2PNK66VpMFVbTE64bwzSLEce85SoS2+4th53HBy9Dt+NDGIPSCLsIMBAH
	CThrUCTuR5YaPs9KZZNznBm5ysnjrRlCLScsWxeULaOdlF0DA7F6VFqqkMmobmUIuy7+KnocoXBpV
	PvLhieUG+qPatUCtIc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrwX-00000004szc-0xgZ;
	Mon, 02 Feb 2026 11:18:09 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrwU-00000004syw-1RjX
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 11:18:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8230d228372so2251080b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1770031083; x=1770635883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QyoII6nqzBeIWsDGEglX8EZ/BM8yJuMFD3qz9JYR7y0=;
        b=cnTWSmkopJ2HRQVo6BTfM3j8yNcxwdWOG3XkBdmASX0jMg85i2d5NV9WkA4/F/joPU
         +i6FnrTR/JkrTd2pPkTnDWJuyKZiK2fipGzCljAUJNZCZmgaQ9B+eLT+SRGrxNWhj+mI
         TTmpfHa8J07LfwiK09P0uJQPtK5Iszp4dRb4eBT3mLJ1UarIsW6XX65N5mvbU2BPT4A2
         qCBO2tlhUU0TDnFHdc//sQivcXAIHhBb7If9F35ZsZOP2ZcO5X4j6o6dExDP0O6sDMKo
         pvHIf2A5lt5xapAMKrpdE+QWKnjyLhj8NMShOLF4QQqNdf7BfGPm62ytMYhtYiiGkNL1
         o8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770031083; x=1770635883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyoII6nqzBeIWsDGEglX8EZ/BM8yJuMFD3qz9JYR7y0=;
        b=pWrBGWOPv8xlQd7YijmgNs6frRWV0Q1G5EFd/orihioC1wcNHa0D5HReNJHEJNv6lW
         +VMNAvQ+yVsv4WNkeaRQMqrut8Y2zbb7Hx6p1WLklfrBTqUYVOx7lz2Mf5mlNi8kESZ2
         1FeLTcsAVdN7dH6V7JZJGxpZclYWXRrQPsDBdfZt1112hETqZWd8VTS3RmNJNOdgTU+X
         GIZwEkixDPe6wuxrZeQpJBZUC1gpVzi/c6LgiY8uqRZ4z6y4YvNquk1OGNaAa16EcnSE
         Fi4LlyoeFrTO2fsezfu/qW1nmpOVU/amNuhaPAaQpi280tcSJPJ9U+TQDmdDtDQJJ5Hy
         2h0Q==
X-Gm-Message-State: AOJu0YwXkrEcDdyu/+fBj9RCP91Zkj2OfMXsJdi+li5zbjBkPUMcQa0t
	eLi9bi3w8LRIQDK5+9B1Eas9+M4h9cyBnmWu71kIlnUs1XmPKSEFe2i5zq3zCLkTRmiAAoSCgaF
	9EynDIbw=
X-Gm-Gg: AZuq6aKhtDMAfr0AJPfOSw61pxXMcopwPyzSAqY27CSIool1sqyz5xyoD4g69QZF1Zl
	Qg/32vkthAVcZxT2U8Z0YjQywnIQTgYgklPdslPwSk9TNhHb2N6j+57GiywpWyYk7lRvP/RfhE7
	Ao9WnNmH5BC4AOYRcsG87nniPImuP+1++r6pPntB1aumHa5hCeJzIWw+9vMh3rnv5IPkL0SlO59
	qHrYSMDBmrwkleHs5ujUzsn8tSEpenYwlcl93Vqn//BEQSRD1FxiekQ72bImU8VaX4wBDTM0bZB
	HhrCIxC8hMgNvmMfxivKRD66q3hfTi4cCSygmeOudsPEPH68Vf60Gqh6KlS6n9qYcn1wap20Cu7
	C4RpyFG6PMi/sb5jkSTO6IEhwnX7gW1eOIINPAsZ51RPsmDOINRDcIm1eAOC0aEq5vDzalS+n53
	qXw/k=
X-Received: by 2002:a05:6a00:1249:b0:823:9b7:9c0e with SMTP id d2e1a72fcca58-823ab75f14cmr11353585b3a.34.1770031082825;
        Mon, 02 Feb 2026 03:18:02 -0800 (PST)
Received: from n37-012-226.byted.org ([240e:83:200::8a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c32944sm16015811b3a.57.2026.02.02.03.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 03:18:02 -0800 (PST)
From: "qingwei.hu" <qingwei.hu@bytedance.com>
To: atish.patra@linux.dev,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH] RISC-V: Skip stopping cycle counter
Date: Mon,  2 Feb 2026 19:17:28 +0800
Message-Id: <20260202111728.4067036-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_031806_383216_A0762C68 
X-CRM114-Status: GOOD (  11.51  )
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

From: Qingwei Hu <qingwei.hu@bytedance.com>

In the riscv_pmu_sbi driver, pmu_sbi_stop_all() is intended to stop
all available counters. However, counter 0 (the cycle counter) should
be excluded from this operation because the counter may be used in
user mode by rdcycle.

Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 drivers/perf/riscv_pmu_sbi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 7dd282da67ce..2bc0050dabd2 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -900,11 +900,15 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
 static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 {
 	/*
-	 * No need to check the error because we are disabling all the counters
-	 * which may include counters that are not enabled yet.
+	 * No need to check the error because we are disabling all available
+	 * counters (except the cycle counter) which may include counters
+	 * that are not enabled yet.
+	 *
+	 * Cycle counter is excluded because it might be accessed by user
+	 * mode via rdcycle.
 	 */
 	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
+		  0, pmu->cmask & ~BIT(0), SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
 }
 
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
