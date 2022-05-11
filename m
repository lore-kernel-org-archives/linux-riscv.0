Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4883BC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 20:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ek51wyXXGaQgySWpHpLGETceip8FJ6FzJH8YLt40Qw4=; b=tYE/RoOifmllkf
	f0y5KOenVg6gMRtXENBaI0RLfwlO3BFt2M7V98xleLf71PTzYoQy2FivN4fwupkbVQdZ3S0gCKdWP
	IEZitOdYFPWW89+BQyEYAGPpD8OYdpui3JU9loSNClSbNd4ejKtirHlAO7Skt2L+TNVx3AISdV1dv
	ShDj9FEaX+RHM1KAqaGBd/+d/pYG1XyCM1WdLKa3C4XyezyJod1fjBj2Gi2JBPB7iFhy0t9wsFxU2
	qyRg796t4hwq06jU7vY9tQuwYY1Px/dZsyM4z/wuk0vo24KEwY7iLA+pbu2jAGyM41MTZwM2Wahsn
	oZdRpr1DIGqfZsbUwObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nosg3-008ToQ-Jv; Wed, 11 May 2022 20:11:19 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nosfz-008TnZ-7K
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 20:11:16 +0000
Received: by mail-pj1-x1030.google.com with SMTP id iq10so3275382pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 13:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=79gRXq38qdrOQl0EcXPRdMJlxIPQmIOrQMYd8f2rlaM=;
 b=4ILcnhhEsX0Vo0b8L3zzsVOnNHjiQnAr6Dt4gu39G/CtR9hd0G+eF/ZRGrHpHhkU3H
 +TjhXaGxGN5fYgjeVEeCVpP4ZtEXp5+9JZyZMUDf/wXuckRffvgtiBNukYCdPTtbWx7k
 lh6hMQuRGpYZQ9l9h2+PGT/ePKJDAJBNnWR11LKSIiPgqbw8KilrCQaH+3zxy5tuVvXW
 mh/TJpJBDiIdWr1IvaXIKN5YPZWNhXpWoGFFbe3Qn5yNppaoYtamNCTeenJfKKuPSggt
 XE8X1ozK/QX+IPLKpSvRk4YXgBQ7qiYcVcYkus+rdGUy8A6WNYyWZg6jvm/fkvGpNbVQ
 ZFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=79gRXq38qdrOQl0EcXPRdMJlxIPQmIOrQMYd8f2rlaM=;
 b=559GJqk0Mi+pTUWfvCUizPYm6Tmu9Cl18vZPtAKi+aE3Qp8PClOglSoiXy/PUo1HV4
 lscmWPrnuhxI+qThhly6Q+Pz9SiaoTm3KOuIjSDaGNg0GzgdtWU5H/qFaiBvBVIkWPyt
 EH8SsrVG910O80Rf5cGh06n8UcAsiQxg17bT4KSUbKFvjchTTJnB6UJwvo6AcmlUuGnL
 XHE6couzIdn3JQAvDfw1wDFMKp1JXCUsHZnij6zQykhfypyHr7Lu1SrJdYgyqm0HmEsE
 rsJxvxOJnnyj224K38XH/8CYgai5WqQ5jsDgG3OTVCkMdmlQpf9YyhC6HnTfUnI28241
 hPug==
X-Gm-Message-State: AOAM530PG4byGnwlOrXIJ9oh0+hMWUgjelENoxMX3gyRPbtDpRgX5rSj
 NMqWoTHsb+Ycx8ixTlvTXQBb4WynulwH9w==
X-Google-Smtp-Source: ABdhPJy7e/7Koc2I2MLGEhSh3Ggrbgf6vevcpUohB0dbVeRllc5YgAvBI/4++3Ik/MYFGC07zoQasQ==
X-Received: by 2002:a17:90a:4983:b0:1d9:ef5:29f with SMTP id
 d3-20020a17090a498300b001d90ef5029fmr7153299pjh.67.1652299873822; 
 Wed, 11 May 2022 13:11:13 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a170902c2cd00b0015e8d4eb2e5sm2259005pla.303.2022.05.11.13.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 13:11:13 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/2] RISC-V: Update user page mapping only once during start
Date: Wed, 11 May 2022 13:11:07 -0700
Message-Id: <20220511201107.2311757-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511201107.2311757-1-atishp@rivosinc.com>
References: <20220511201107.2311757-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_131115_298737_23D37326 
X-CRM114-Status: GOOD (  11.61  )
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

Currently, riscv_pmu_event_set_period updates the userpage mapping.
However, the caller of riscv_pmu_event_set_period should update
the userpage mapping because the counter can not be updated/started
from set_period function in counter overflow path.

Invoke the perf_event_update_userpage at the caller so that it
doesn't get invoked twice during counter start path.

Fixes: f5bfa23f576f ("RISC-V: Add a perf core library for pmu drivers")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu.c     | 1 -
 drivers/perf/riscv_pmu_sbi.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index b2b8d2074ed0..130b9f1a40e0 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -170,7 +170,6 @@ int riscv_pmu_event_set_period(struct perf_event *event)
 		left = (max_period >> 1);
 
 	local64_set(&hwc->prev_count, (u64)-left);
-	perf_event_update_userpage(event);
 
 	return overflow;
 }
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 24cea59612be..2eac5db2cc18 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -527,6 +527,7 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 			init_val = local64_read(&hwc->prev_count) & max_period;
 			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
 				  flag, init_val, init_val >> 32, 0);
+			perf_event_update_userpage(event);
 		}
 		ctr_ovf_mask = ctr_ovf_mask >> 1;
 		idx++;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
