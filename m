Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B11EC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 14:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUnqiqD7NDhOj24Xgse/eI4jMaNHG9ILb50zLW2HJXs=; b=wde4vdodhvjKqx
	LD+d46jQXwRa9p+3jHfttqx08192QCLfrFeUJAEr3h9zeKOpGu6ysaWUsmO18IRBWE9wJCTrzNl/N
	JJ7f5qbQSBZHOC2t22DDfNA6fLdLkWeESXBqUr/d3tMyZ+hPHVuCD4OlT+E49Bc8TtoiprjwgRD2b
	iqfrcnz0Rcsq89vR3zqHgYo+fuR5KBp9sPLh9ZB9NHE4YdOKWPTZu9fcOjps+DUxmK4I4TELBJWH/
	eiTuPL7YE9ume6uPoNYT7dZT9opnwpSV+hElX1iJSiRBhjoZd3myw5Iv26EpSZhlliEzOFKVamrsG
	jrFmGKaKZYDSMtoynuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjAK-0000000AhkP-3ayM;
	Tue, 16 Jul 2024 14:28:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTj9z-0000000Aha0-1TrZ;
	Tue, 16 Jul 2024 14:28:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBC8761286;
	Tue, 16 Jul 2024 14:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04739C4AF0D;
	Tue, 16 Jul 2024 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721140086;
	bh=UmdbGtbmZQyJpfQmuKbnXS9oiiqIqVB3hhw2q72TWmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZIWvjOZFVsQYK2go7LVFtFBGTa56COoafmi7HNlD0eiu6v6ZFTMfmlsOeJKAyc8eR
	 kR7fmZDZ9Gk7/idLO4KTvLoxoJkL6MhqDrsBpS0TSxMf+V9T+JqfLoSN+W0QDOE+Vo
	 YQ58vdGU9fn4pTDF5dnsLzlLlMhESknxJUI4ydnSa9Iat+mDcKpGmLPN5gGS+fmUPo
	 m8akOGynBtPiUBDmGTZmXTliRSNzmVxmvoLaa1tEXGdRppBhPH7Tn+zV8moQzmxqDP
	 wj9GnQ6XJieE+A8N9PBkS4KmhQu/eJgAeG1PFMZliD3dz7c/QjT5u2SZraDHIFlP0x
	 U6YgkcCf/1Orw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	atishp@atishpatra.org,
	will@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 17/18] drivers/perf: riscv: Reset the counter to hpmevent mapping while starting cpus
Date: Tue, 16 Jul 2024 10:26:52 -0400
Message-ID: <20240716142713.2712998-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142713.2712998-1-sashal@kernel.org>
References: <20240716142713.2712998-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_072807_461531_41341EA4 
X-CRM114-Status: GOOD (  11.07  )
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

From: Samuel Holland <samuel.holland@sifive.com>

[ Upstream commit 7dd646cf745c34d31e7ed2a52265e9ca8308f58f ]

Currently, we stop all the counters while a new cpu is brought online.
However, the hpmevent to counter mappings are not reset. The firmware may
have some stale encoding in their mapping structure which may lead to
undesirable results. We have not encountered such scenario though.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Link: https://lore.kernel.org/r/20240628-misc_perf_fixes-v4-2-e01cfddcf035@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/perf/riscv_pmu_sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index d80b4b09152df..ae16ecb15f2d9 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -611,7 +611,7 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 	 * which may include counters that are not enabled yet.
 	 */
 	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-		  0, pmu->cmask, 0, 0, 0, 0);
+		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
 }
 
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
