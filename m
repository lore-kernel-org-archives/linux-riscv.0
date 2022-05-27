Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E700C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 05:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+b6u3vZLj9GKctLeMA3HvqPs3Ly+yt863vQJcHE/RY0=; b=r/Bff5SgaEUF9h
	nC2EHW1pSFXCdutJS613N+02QhEZMdYifpt8GcyxpLIxOr2xxMdymPR6lcNp8FTiusJWbIN/WUCSr
	2UT+MTeYX+/bugifFV/60PjfIkHK39UoBOzFhpUAbkBFwjt4jAYfQxfkZk13nsjOBVXq3HM210ebN
	hi2bxL6gSNSduggGM5aB2ZGuWL4JL/jTknwFLkiDXxNnI5Ib4JrWRxqlzfcsW4C7O/gQGj6lKdrLf
	YPnbTIudzM0z/xVTOJAlOvh8c07/p1LHlCCYM09JJo/0z5/sSPKZei0LjcZYXipwlfGVXmj2nLaIp
	EmsV0Ib51qhV1O3fWAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSMJ-00Gf2f-6J; Fri, 27 May 2022 05:17:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSMG-00Gf1v-VX
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 05:17:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id w3so3205478plp.13
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 22:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bL6Df2//IX4pFAb3Mx3gzCPAvEMkloxMnWPx42+jX1U=;
        b=d7xy2wQwMsehdJ8/csAbRhdFHRV18FJbDigzTsdFFlSSx18qbpjC0am5y6/QiAfpcj
         nmlTpbhkNfvsqn0wbUmI3ZITCQuL5/Jhr8HQX26cMTHpYFzMYmIZBaZARS6wYNjGB3vU
         OM3OxoDyqQREhDzMtEfgnp8bf9uA5r1Z1yvF1AaU9kC8grC/YiEGX9KxN1vSwu4JFUMA
         rmdwqsfr4uTr1haJds9+Khdj+hSRoPEHGohpTWp+q3IMM7bL7ZNnmkMq0I8ea2v61M7g
         CltUt6/M4IpCeVd43fOOoANadsC8yFQ8YCa6835W/ofGDyfCsSyDgY0UTwE2aBlEEdbF
         5KWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bL6Df2//IX4pFAb3Mx3gzCPAvEMkloxMnWPx42+jX1U=;
        b=0QBLSi1VzRHw33cT0XWkHr7/tvhPuBMWdX+pr0Azwm2qSqwoI7iJzcvirl3PTprqfU
         7pbu05US8Egqfv9yVD9vKvVihV6+n3hnoVF2KLdX1V1Tmjc3UA2O1caXlOAMHufCIJuS
         YaIGi7/T8IJ7g8lOfXImJectCFfAnDZXLw1quTQm0GxlD+UbJ3jkLQ8lx8at3Rg3SMB8
         no9kmNFFCGA/m5jbK329WvjtAXE8w4mOq6QRFpoXqWjRutuvmW9YY/sGlqSwhAiSL8Dq
         F5hJxCd0dO9tUyQo4v3OKRVzu4U6Pl+ZXriMVpxCzpIWSzvU/7DxoFbdJ65deOLCDkj4
         1uDg==
X-Gm-Message-State: AOAM532+X6SsAx00AmHkFrjRjr3Stdg3cYqvPNaO+AENYDqGDp+E+p4G
	yWek4/pj5vRh1Hqe7sctYK1pRQ==
X-Google-Smtp-Source: ABdhPJxU939mlWe9n1bFBHQ99ErpSK3PeMu6xqSEXm+Yj6j7Li6zpY/7t6s9OhrsV8MSR7T1bqxiew==
X-Received: by 2002:a17:903:228d:b0:163:8b78:c3c8 with SMTP id b13-20020a170903228d00b001638b78c3c8mr3585464plh.27.1653628674882;
        Thu, 26 May 2022 22:17:54 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id j34-20020a634a62000000b003c14af5063fsm2459003pgl.87.2022.05.26.22.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 22:17:54 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Sunil V L <sunil.vl@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V3 1/5] riscv: cpu_ops_sbi: Add 64bit hartid support on RV64
Date: Fri, 27 May 2022 10:47:39 +0530
Message-Id: <20220527051743.2829940-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527051743.2829940-1-sunilvl@ventanamicro.com>
References: <20220527051743.2829940-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_221757_052330_0073ED32 
X-CRM114-Status: GOOD (  11.57  )
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

The hartid can be a 64bit value on RV64 platforms.

Modify the hartid variable type to unsigned long so that it can
hold 64bit value on RV64 platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpu_ops_sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index 4f5a6f84e2a4..efa0f0816634 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -65,7 +65,7 @@ static int sbi_hsm_hart_get_status(unsigned long hartid)
 static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 {
 	unsigned long boot_addr = __pa_symbol(secondary_start_sbi);
-	int hartid = cpuid_to_hartid_map(cpuid);
+	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 	unsigned long hsm_data;
 	struct sbi_hart_boot_data *bdata = &per_cpu(boot_data, cpuid);
 
@@ -107,7 +107,7 @@ static void sbi_cpu_stop(void)
 static int sbi_cpu_is_stopped(unsigned int cpuid)
 {
 	int rc;
-	int hartid = cpuid_to_hartid_map(cpuid);
+	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 
 	rc = sbi_hsm_hart_get_status(hartid);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
