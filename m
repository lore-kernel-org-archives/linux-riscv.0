Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0633C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 05:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XBqzedBSsbfZXzfEZVCf2jl1iPlFvg6M66typswxFi4=; b=J3Ahz3CiUoCJqt
	n6K23atuByKbnzx3KQEPWOZBiz9iX7pcHjTAKmErPlJUexMOZJiD/TCQnCTJqZHFQVG4Xesu+DXhC
	o6opa9s5AOhex0IhCa926kyJfLqfn6E1WMts7qr0X6au2BZlZWOGRseS0I7813AG4bji6y6S1RAay
	iGOhK9Ua7NSPxNmIowKY0Z841o1xRrFTgcA6s+5FDEVkZibg2pjwhHT0zOXbJrg5BbCQU/8+fPFvN
	LaBCyOcVnXyxszCOvwQgTEDmgXiu4dxPX50ro3XjqCapDm8CNDVpd8CUAzKnbHEy7H7cz9C96NjFg
	r96y2FODgGyM3ONeBAAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSMQ-00Gf5A-MB; Fri, 27 May 2022 05:18:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSMN-00Gf3B-3s
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 05:18:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id n18so3230986plg.5
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 22:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a527G06H+rTZVQ9Z54L95xKvwRXeKSz+Vdkmm5vxnGU=;
        b=TzZc0MO6AfCtlteb9bCnmlhRJEVJvMRF3GI1QjfK6DuAUuzHwL6zhWECRnZ2JZl1JY
         Z77nIxa0np9ZOkDHvyfgQcFFUI8ptER4ES5juS2cPeaqTUslq9lNPZC+U7FuXLRK6TWd
         Qzy9wZ479GcfvWsXR1xDEHZK6oA7zDhwdg1oONTDxoMqhfpHKcUIQmqt+549nrdZWid7
         ln0vEhIAy3enxkwU+BHpwnK85yTozOM3ylbmNXqK0dC0fv4bMhROtEtVaeyM1tW4lBXP
         PK8nbF9aa4gb1QSDcJQE5slBaG9QgWoDlQ+mHUizYCzh/JBX14DiPHQMLGLnFIvMhK9B
         342Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a527G06H+rTZVQ9Z54L95xKvwRXeKSz+Vdkmm5vxnGU=;
        b=z/+qF1WPA1BF9x6nEpZNLdqjyglUzUuKajhl4e9Al9pABti+inXBk75pzu/588sbJX
         GtNWUqh52g+ldJ+dCA5zSHjvoLBWVPOo0mskbehJPnKN6C7lehkIuxWu8/7eavH5E+ss
         YX86xb2A0nhTFU8d799IX037Uupnq0drVUQXGif1/0gpEMlTBNCOh8XTlrKwC4XB+QOz
         UtMM050hBILBZq/0WKR7HzK4kAPpXhFteA0sC+44AFzv2FgGG9oaePNMuE+6yGCwkWmn
         WH15JRDY4dyW1S2nZupEPVpVu8ZB0UHHxNGBsDfuG8AYPaW//N9TKUPz54uvEAIxH4DG
         lOuQ==
X-Gm-Message-State: AOAM5300BF7aBESN7tHygs1am4tyXTwA5kbEt7BIAZQY+YkXaU/EWTx8
	biw+4XdalqRtrErdnVD36sGfFQ==
X-Google-Smtp-Source: ABdhPJww0P7BfKdwPMxOyVsREAc1pWap5/VTK+ciOW5Olpxk9SeJR3sDpMVAMRIM6moUHTH/ZUTdXw==
X-Received: by 2002:a17:902:cecc:b0:162:4d5c:3eac with SMTP id d12-20020a170902cecc00b001624d5c3eacmr15415645plg.82.1653628679351;
        Thu, 26 May 2022 22:17:59 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id j34-20020a634a62000000b003c14af5063fsm2459003pgl.87.2022.05.26.22.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 22:17:58 -0700 (PDT)
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
	Sunil V L <sunilvl@ventanamicro.com>,
	stable@vger.kernel.org
Subject: [PATCH V3 2/5] riscv: spinwait: Fix hartid variable type
Date: Fri, 27 May 2022 10:47:40 +0530
Message-Id: <20220527051743.2829940-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527051743.2829940-1-sunilvl@ventanamicro.com>
References: <20220527051743.2829940-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_221803_197315_FB56EC9F 
X-CRM114-Status: GOOD (  13.13  )
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

The hartid variable is of type int but compared with
ULONG_MAX(INVALID_HARTID). This issue is fixed by changing
the hartid variable type to unsigned long.

Fixes: c78f94f35cf6 ("RISC-V: Use __cpu_up_stack/task_pointer only for spinwait method")
Cc: stable@vger.kernel.org

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpu_ops_spinwait.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
index 346847f6c41c..3ade9152a3c7 100644
--- a/arch/riscv/kernel/cpu_ops_spinwait.c
+++ b/arch/riscv/kernel/cpu_ops_spinwait.c
@@ -18,7 +18,7 @@ void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
 static void cpu_update_secondary_bootdata(unsigned int cpuid,
 				   struct task_struct *tidle)
 {
-	int hartid = cpuid_to_hartid_map(cpuid);
+	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 
 	/*
 	 * The hartid must be less than NR_CPUS to avoid out-of-bound access
@@ -27,7 +27,7 @@ static void cpu_update_secondary_bootdata(unsigned int cpuid,
 	 * spinwait booting is not the recommended approach for any platforms
 	 * booting Linux in S-mode and can be disabled in the future.
 	 */
-	if (hartid == INVALID_HARTID || hartid >= NR_CPUS)
+	if (hartid == INVALID_HARTID || hartid >= (unsigned long) NR_CPUS)
 		return;
 
 	/* Make sure tidle is updated */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
