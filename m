Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD84BC54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HleHjEU0KkaBNsMz/36EkznmXnhfi3wOohCwyVp2vF4=; b=iidXbG8N2XfumB
	8QodVJvKc3LE9OQOgI5KUhPdQXICsKsPcpXAH7gUr6dlKG160U7Ci7zqs8hQWtPF+LIYNzmn+MuLN
	9GR2P1Zn6nI1lWl4DQpS09dtMqhprbfuyPLqaQ1MOw6Emu3gfT491FNxKBOmT/nD0hEfE++ja5m03
	TpBD7f8kpbYmrFmssmUpQzFISW1aMqJEnH5awesMgDWIa1hWFgCr2g8k0g+MQkiKfryEympZOVJXf
	ihTEWNea+va/cB2l8/IS4BqtuBu24db4laNc6IVhT0TBUeW6cu/bBtfVg9gsqdPGhV3m9Advyb0E/
	9D85onVApQF0D/UwmGww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7s6-00000007JAC-3d6P;
	Tue, 12 Mar 2024 19:33:10 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7s4-00000007J8s-1k0W
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 19:33:09 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1dc09556599so49007735ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 12:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710271987; x=1710876787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ftTA/bI42ti4Fz3CgBot24iMh4CdOEErvPMHNFt7wY=;
        b=Xy97Yi7Fb4PMFCi23TX8wLKG1vSXR1EtoqFgTtECJ7kZShSKoFIYAEq3LAO75Nw8Qu
         eG15d7u02EyQYiRchZCMPaAiYqDQGmNIQHIwlydz7avjgynrT+HMtzOhsjigrpa6P5qL
         m6xwJ36I9k1Hk4qQRMRXtD/mOfOgF2Eko277xmy0ECLxczIFAMK1ypt46OiX5Xs5r0+n
         A33BgXDZ0eLNw5dUDFMaMt4COfqHSUC+6hnfX5utrNKr6KwnLGnk3zNmE6m4dUHRjO+q
         n2k650ikFK3g21LKbjPUe2kRIBGjm82eKygeM/N4/GphO4y569xS23UJ4IElb1BlPf4O
         jzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710271987; x=1710876787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ftTA/bI42ti4Fz3CgBot24iMh4CdOEErvPMHNFt7wY=;
        b=BrKA1KWWIPGdjvjzDWmkPqJ6hgHNawYfvE36Cv1zjyWLcsQ/IBQb50xKK0h+dyLppl
         nUdacwRaDPUTgPbMZB33nZkt6G/bUsHzV9GdqeXC5MP0qkWCLoI2bVM18FTc7PceOQ8n
         Q+PwvGbrdF5F8Ro635+/yOkDnC/xNGX3SKlWAigqB0yeOtToZDK3KtjDo28YFYXS/zi1
         UkNVFdDo/aL9mnQv74Msk68C8+z8zLjvW8CqitWTYrf7ocU5zMcLlxz3mWPyLt3JnPHs
         Xe1atcMRmQVWIF59XG2Pym1Y9AWOy/26h73gu0QLaoSuHX1AWIqFoHLjanBCclsUYDPs
         p7Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUGfp7ped6ftmhEPk6d5sHsI7NS5pp62zjD5VwpelVeN378wj8Xd8jyIdV6TKMYPY06NKCAdcKp0aB48SlvDwYz7FwB1fYDct/1WhzfTHku
X-Gm-Message-State: AOJu0YxsJdgTD/1GWwHLe+zgZshkU3sJzvG1RndA+9KInayg1Yt129Ij
	Vh0XuOXk4aT+TlWBYCkJRt9z5n5DNu1caZHIrGTunm/VZNVb0Wnj8Y2SF3Qvi8I=
X-Google-Smtp-Source: AGHT+IHMAaeTF22TajddSfUp+8UCNTmclqWbgeHaOV9+99pfD3RLiLJzSzhcL0gOzhuE960W3tWdnA==
X-Received: by 2002:a17:903:32c4:b0:1dd:998f:f21d with SMTP id i4-20020a17090332c400b001dd998ff21dmr8772872plr.22.1710271987305;
        Tue, 12 Mar 2024 12:33:07 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902b78400b001dcc3a46a6bsm7017385pls.262.2024.03.12.12.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:33:06 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] clocksource/drivers/timer-riscv: Drop extra CSR write
Date: Tue, 12 Mar 2024 12:32:47 -0700
Message-ID: <20240312193306.1814593-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_123308_495293_381BCADF 
X-CRM114-Status: GOOD (  11.28  )
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

On riscv32, the time comparator value is split across two CSRs. We write
both when stopping the timer, but realistically the time is just as
unlikely to reach 0xffffffff00000000 as 0xffffffffffffffff, so there is
no need to write the low CSR.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/clocksource/timer-riscv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index e66dcbd66566..eaaf01f3c34b 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -35,9 +35,10 @@ static bool riscv_timer_cannot_wake_cpu;
 static void riscv_clock_event_stop(void)
 {
 	if (static_branch_likely(&riscv_sstc_available)) {
-		csr_write(CSR_STIMECMP, ULONG_MAX);
 		if (IS_ENABLED(CONFIG_32BIT))
 			csr_write(CSR_STIMECMPH, ULONG_MAX);
+		else
+			csr_write(CSR_STIMECMP, ULONG_MAX);
 	} else {
 		sbi_set_timer(U64_MAX);
 	}
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
