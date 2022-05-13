Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA52C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 13 May 2022 01:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OK1sP0hN7D/C2AJ+jOFINwORZ/rDKCxlIM7ThCKzfaI=; b=pNAkpvVakkQA7J
	/HhCtbiU4anlCFIXQBr9vJ3tM4SieUTUdNAgNPplFD71OJbAni2t5rFkVBtf1tTbEYFOa5cyzaedP
	KqLPBPrBv/vTodBaD3pZgPvLVgZGRZ7wcUZmYWlEf0AEakCuuti8ALlUHORIMP5aMcaDx91UgSzfk
	8jfeu9Vc6dc3FEfw0DxHKBhAzE836VCZSPF6DZyRFkBFEl26kCJq/039hk0Bk5VjuFhJv4BCvtSEQ
	xOLzKswZzEXScEPNko9TkMDPrFlb6BBFY2eOA2OHz7Kf2rH3eacR3vlrenJqn+kET9XOkImuNP5GS
	lUXsVxI862rgRsCox6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npKWt-00E8KT-EN; Fri, 13 May 2022 01:55:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npKWo-00E8Is-Kb
 for linux-riscv@lists.infradead.org; Fri, 13 May 2022 01:55:39 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so9480475pju.2
 for <linux-riscv@lists.infradead.org>; Thu, 12 May 2022 18:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XLnu5Z1M7spTOfkxmzGNMq9mvJnGiQu2ymVbvg/7Y4o=;
 b=Gw9bQQPrN9NnofVD2CZg8l8560k0Eu4jmDNZcgA5mtLk3BTLKuqBahKfJOhcT/w+HK
 OcHyg8B7V8t/tKMDwTCzbyIZqlz41e7HY0vrshiOofh2SCWGRGU6vp7WVjGtfXB902AH
 CvA/5xrCJeVoELhc/hwxxiuF91TqeRLlf9GEUXrd4NGWXyRx5ENi2UYWvI8LeCTlzGB1
 4SPJ3vbr5iDzq93NHAszxeIOOrsK8dPPL+s0r2HpwNazNR713H3ZnADeh33QR+NuNBpt
 QBO36hJEof9BEbvyFpe58WHDLZKbz1SmRN2r3IA6v8MjIRrqD1A2SHafZvpWEt36WyDL
 3BqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XLnu5Z1M7spTOfkxmzGNMq9mvJnGiQu2ymVbvg/7Y4o=;
 b=lbx1HuxdkNw8B/EOL+EppdpKUicrDVWu8Rx7DtWgzO5rj1JdSFC+nH2ZLjH6geeheo
 pUZpONgD8Vg8nNILNqZIiEm1HyOH7ZYu21dlTEF7KTNYw6g1M0hwfVPu0SwFlLWIXU6q
 AI3XCyqrpRUWYIayA90pd9cIbWx4oT6RBfCYWtf2cVBqFF4lNBaJZ1ILXpZ1/X+nJaVq
 d0F3QQWdxlbf5wq7RRerpYEx5dXstkQD1yi60sIqH6BYvZmsClwBxtdLPm6GG+z4FSrj
 SC/ei2bWlpeUYXNTQNbIHOQKuyb584cJwCOH9oSapR9lt4jUKM8Xtk7gdg2ViHgoXPP2
 26KQ==
X-Gm-Message-State: AOAM533YH8k6QE3t10zdLcn/lg/tayVM/LnW6FvYmC1+qEl2D6Z+RlMC
 rOBYO0F/QL0eQstDr+qX+0/T0Q==
X-Google-Smtp-Source: ABdhPJzO+Hcgg8hisxLU7ADgG8gGPtljLastMpjQQFp1cgf81i34Pr2jRZcEr4RkNp+OCFqqJd9VjA==
X-Received: by 2002:a17:902:8504:b0:15d:2c7c:ceac with SMTP id
 bj4-20020a170902850400b0015d2c7cceacmr2623328plb.130.1652406936838; 
 Thu, 12 May 2022 18:55:36 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a6561a1000000b003c14af5063fsm365883pgv.87.2022.05.12.18.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 18:55:36 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2  1/3] RISC-V: Fix counter restart during overflow for RV32
Date: Thu, 12 May 2022 18:55:20 -0700
Message-Id: <20220513015522.910856-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513015522.910856-1-atishp@rivosinc.com>
References: <20220513015522.910856-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_185538_711560_D514A005 
X-CRM114-Status: UNSURE (   8.46  )
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

Pass the upper half of the initial value of the counter correctly
for RV32.

Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index a1317a483512..1e6c150c892a 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -525,8 +525,13 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 			hwc = &event->hw;
 			max_period = riscv_pmu_ctr_get_width_mask(event);
 			init_val = local64_read(&hwc->prev_count) & max_period;
+#if defined(CONFIG_32BIT)
+			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
+				  flag, init_val, init_val >> 32, 0);
+#else
 			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
 				  flag, init_val, 0, 0);
+#endif
 		}
 		ctr_ovf_mask = ctr_ovf_mask >> 1;
 		idx++;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
