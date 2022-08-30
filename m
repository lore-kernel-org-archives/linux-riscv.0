Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A14ECAAD1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 15:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=robk5IBppeOmNPjc4SnsWuW6x8YOz7zgyaqXL2lcNGE=; b=QytPahVzU9mxU5
	cdnuUhnXsRI4/Fq5HZPjIvn2Fk5Q79iYXbQSv2UP19gHOphvlq6isVPK47aI65F29joyIaXoypM2L
	bJ3GhVonEscxiqo6Ik2LfIq0X9qvR+NkwDKjRCalgkAhpNwXkqvGVu5cukXjQG24w6OMnQO/oKELc
	kAboY4+EgZIjH/8bxSqGwKCea8ivDwLDXs2XGW9rfjnkpEtcsyWgirwWbqlWFoqU87V2wXEabexPt
	iBFNXAL8tHA73FWEvZxpVF8B5qK4fcTdKDRbM3Jzm+Z3Zh5voE4pEeQtEP9ZCeBGqWpHzut6dRZrE
	4OltTj0YZpLBBy3X6qZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT3YH-000PKt-AL; Tue, 30 Aug 2022 15:53:21 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT3Y9-000PFd-1m
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 15:53:18 +0000
Received: by mail-lf1-x12b.google.com with SMTP id z25so16131225lfr.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qZ/tRjGC+rFtQqfZkbLuL4YV/NkMDTJHWDp2y3ujAUI=;
        b=jdyRaYG0eZMzL1p3BblmVB4HzUiybdEmn8Z1ivPxmsy1jWIZ44Oqupwo4Xp2zdJVrP
         gcNIvbhpPcyOymj3TCFg8gemJ5y6VRM9rFXNCob4JYgs1qP8305I2N7tCTh7pnXb++lk
         G43PaVicO+kpQuYDOdJ2l/LpD78oLst/S2c1cJvFmtA/KnbXs0AftewkCXDkDhKywWoW
         wwec7ancJdsAtTub6hXNEZeuGGAOMgdrrxc3izmDsi+IaeBeQzfT8BHlnN3vD6fDa0VY
         YxScE9XVrSNg2QqgS6UENphObjkzvra95UIAORBjIGjqCVGpaZv8qGxNWwgPff46kxwY
         2zIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qZ/tRjGC+rFtQqfZkbLuL4YV/NkMDTJHWDp2y3ujAUI=;
        b=RDdJXkPV1v6kzgQObONVNJ6MTzLCyIraAL2hO+StSTB58GFxuHlIubXeWmraiNGuc9
         hfB22nqEXsAizWpYg2PkNJeEB/1S25fTbzvl1LC0Vp95oBNGflW55y02AyuqW1JAQHZp
         YcEZIZwjm7wM1rMUL38oABJGQR8V/ozDPcn5oYMzeS2KMVW3YwJfH7pLJ+dqJpNOvfij
         5dPg8jDdiiKoh66ZqlwohykWBCk5ykMwyplojJEZcKPPWaQCZ1KLXFpmq8rtize5h2jO
         8++PJTNpIYQWnyTelc3IZd13xrKePXvvazfTGAdC7u5N7pX3u+Po2mi1Ui9QIYFPYxjn
         UyCA==
X-Gm-Message-State: ACgBeo0g9o5v62l4/K8BcdZYSGkj3Wy7+QtV+r1nvm+aEmfSwEk95qaV
	Z7+ORJyvdND4mr5pyt+W1SCfLlC8UzikMUct
X-Google-Smtp-Source: AA6agR6n19sQk5SoBPBMLxMyt7fmPB/0JQXD9onAZ1xJTE6xxNXL7ueSo7HYLME4gKw4hNE+d+YpMw==
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id y14-20020a0565123f0e00b0048a5edd99b2mr7510753lfa.124.1661874790530;
        Tue, 30 Aug 2022 08:53:10 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id t6-20020a19ad06000000b0048af397c827sm1646572lfc.218.2022.08.30.08.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 08:53:10 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 1/3] perf: RISC-V: fix access beyond allocated array
Date: Tue, 30 Aug 2022 18:53:04 +0300
Message-Id: <20220830155306.301714-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220830155306.301714-1-geomatsi@gmail.com>
References: <20220830155306.301714-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_085313_116260_740BA744 
X-CRM114-Status: GOOD (  16.11  )
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

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

SBI firmware should report total number of firmware and hardware counters
including unused ones or special ones. In this case the kernel doesn't need
to make any assumptions about gaps in reported counters, e.g. excluded timer
counter. That was fixed in OpenSBI v1.1 by commit 3f66465fb6bf ("lib: pmu:
allow to use the highest available counter"). This kernel patch has no effect
if SBI firmware behaves correctly. However it eliminates access beyond the
allocated pmu_ctr_list if the kernel is used with OpenSBI older than v1.1.

Fixes: e9991434596f ("RISC-V: Add perf platform driver based on SBI PMU extension")

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 6f6681bbfd36..8de4ca2fef21 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -473,7 +473,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
 	if (!pmu_ctr_list)
 		return -ENOMEM;
 
-	for (i = 0; i <= nctr; i++) {
+	for (i = 0; i < nctr; i++) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
 		if (ret.error)
 			/* The logical counter ids are not expected to be contiguous */
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
