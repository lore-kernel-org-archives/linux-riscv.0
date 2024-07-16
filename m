Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0925C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Nh5d1xKQES6LQawui8YLgQHKJ9Jg2wd3eZVJwENnNM=; b=pk3L8rCDedjQK3
	gvDZuJqD/2q6IMgK6rQ6mkOD2i56jizfOLhqa5/1XUM2Lpipo9Pm5etzeuk269L5QLLO/Qo7BR8t6
	ufOyIQuH1vYW2X4B3s9SaASPEG/472nKfKWpnW8RJUL/9ckMfloG8xNVPjP9b19lojs9iMCG2IL15
	bmJow1T/b/Og5BEr78aUgxSQ/XWrBo7hUGWaydVzHSPxe5JH7Og7g1CqZDQdT4ZfBdTxjMVA2b/ZR
	SwCAG2j7aCXHAZ3k9y5H21IfT8tIyxxWAvl4j96G0t6giVY3cD+l50yxcaw5vHAb99o5LU4hXjG3y
	rISUn2RsBJIxZ1YH/ffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjBN-0000000AiMx-0BFA;
	Tue, 16 Jul 2024 14:29:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjAy-0000000Ai6D-0PD4;
	Tue, 16 Jul 2024 14:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 74A7961236;
	Tue, 16 Jul 2024 14:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EEF2C4AF09;
	Tue, 16 Jul 2024 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721140147;
	bh=8DZ+UvYWXLieNDjcPqQu55JAO03uXEdFSEaxbU1vTcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UArRWzLGDf3luJrfdVfx52i99DlCUVDZbJ5y9wK7kOgkPoIz2GrKWHCIaJvB4bSjx
	 3X1KO3AcPxxbDmhMjn8vAN9SJ81D6xFDHe4dw5GWNX1UsxwItZ6F7rAL8vIF9c3exI
	 CvJB9dnVWEMbJMR1emqVjA/simawvf8KK8gRkEPVBq7JTweIjckgJy54G5QHrHZ/76
	 Zhm5JdNszh3i7KiX8PipzU45dSwra/KzK6S39tPR18WlGWEn45rL/A9t5qTQlvyYJK
	 Ahy4OhpCLWX5sKkvCmEXRyUDBuY58+IrCxREVv0V7TCyO5BMa8WUKxovDknqiP4Lae
	 0sVYHiOuEhx5w==
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
Subject: [PATCH AUTOSEL 6.1 14/15] drivers/perf: riscv: Reset the counter to hpmevent mapping while starting cpus
Date: Tue, 16 Jul 2024 10:28:11 -0400
Message-ID: <20240716142825.2713416-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142825.2713416-1-sashal@kernel.org>
References: <20240716142825.2713416-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.99
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_072908_340906_11F479ED 
X-CRM114-Status: GOOD (  11.15  )
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
index 382fe5ee6100b..5aab43a3ffb92 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -502,7 +502,7 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
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
