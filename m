Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECB6C43219
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 22:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FNPJJ7Ierm+BxtiB2ktLDDfhNxtj7uUd8q9Zh1sXUns=; b=cRetPJcd5Fk7Fo
	yIN3qLr+dhddfwC+YpIgXW9PWb3AJ1G4/mNWrihXiREE7J383kkFdUu/rXaTMj5cTTcgvgM09DAmS
	EVWtf8gGIQ2qASGc1DrQ8d+Zgfebw3JbDjmWR0rhurkyvwXPL6LJDtvp+19lDMtBPVcJHyydft249
	ymRH/Wypx/qV5ZyTi16Moo1kdKrwTecidtLHyozvKNOyuVk96jwz1n8qUkSB83HDeWYwV2RCC1qVc
	pyX1v7Z6ALlaoSCzPHypr3vQlUz2o3esIh4CJb3Yhte5cAqXXJxQP03nEV+QanNInqzFSd+TiYRET
	WbL+M7iKr1NJE3EhNRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWma8-00CHzU-As; Tue, 22 Mar 2022 22:02:24 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWmZv-00CHvL-Jm
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 22:02:13 +0000
Received: by mail-pf1-x42e.google.com with SMTP id s8so19278706pfk.12
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 15:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=VBuD14D9jss6ixku9sfUZCOqSJnBe9a9BQaCUrE6LQQ=;
 b=fJanGXUXVx10X/Hm8J+xyICVn7kqq20SrCD9VC2HonNhM5J96ddWdrsnDr9l4C5SCp
 BixK8QDMURjn/re5FJYUWaGa6OFVJj9D09ML74yyt91zxTtXapvjcqgXOeac8bhYj37v
 FZw7oRQPSDEus3fHFeHmWWqibnBUawlUTx/zEuRBII3qxBJ0eDRxDZ0CgRrxg4yhpiKP
 CymunO5wgk+eqjp19SjkOTUT/uzdDtFH326xKSvUG3dz2XFzxEQi6YhA8QTdFCopPYAQ
 N5TKjEm+Ea6zxwUG9EVLlypVshR5xWi6iQfNUYM8YzhUMvyT2woYYCF8asiKAsdwlECR
 xpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=VBuD14D9jss6ixku9sfUZCOqSJnBe9a9BQaCUrE6LQQ=;
 b=0BxeDW778PBV7PwZ1Sc9qw8e876LE3t08EWYgYo4+SlsXigdOLMhIikm32Lve4CMN8
 KLK7nJavonHLvFdYb55VC07/RcRS2JgBLJIUEnHYCm1qenTNVYiUoaPipkXeyfcS7bkk
 wfMt6Qmyl2WTl0ONy3v39Y9QieLF8hFjwc80aRKlmwlsld3Kc0o3aV27bgaa4I5mbTw5
 2FjUi7499EGH/bGmY+atrmvXRtChzXjWxcu2Kns9SBBj2AICKj2bS3pWv+6SUK22zDr3
 Bjaatlot68mVF4IwIg2qqq9jUxYPYozbWv6OqtH7S0jCM+ip97zSm27hyisk58uRDzIl
 iJYA==
X-Gm-Message-State: AOAM532nW6tPAYdQnspUKWRNbkIIrOdohAYZ7AO18HCq5rNklvldwUrJ
 nG2GnBpaeShqnZNjDdK9C0FCMg==
X-Google-Smtp-Source: ABdhPJx1LeSLhNrfW7PIt93i5dhi5I1vv8HguPlKaZ8N+dB0Bhq3Yn9TyDdhCJPMmQ6dEeEEbFooAA==
X-Received: by 2002:a05:6a00:3309:b0:4fa:950b:d011 with SMTP id
 cq9-20020a056a00330900b004fa950bd011mr14139644pfb.24.1647986530494; 
 Tue, 22 Mar 2022 15:02:10 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 q20-20020a056a00151400b004fa99ba6654sm10332924pfu.115.2022.03.22.15.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 15:02:10 -0700 (PDT)
Subject: [PATCH] perf: RISC-V: Remove non-kernel-doc ** comments
Date: Tue, 22 Mar 2022 15:01:47 -0700
Message-Id: <20220322220147.11407-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: atishp@atishpatra.org, anup@brainfault.org, Will Deacon <will@kernel.org>, 
 mark.rutland@arm.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_150211_739172_E0547181 
X-CRM114-Status: GOOD (  13.78  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

This will presumably trip up some tools that try to parse the comments
as kernel doc when they're not.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

--

These recently landed in for-next, but I'm trying to avoid rewriting
history as there's a lot in flight right now.
---
 drivers/perf/riscv_pmu_sbi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index a1317a483512..dca3537a8dcc 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -35,7 +35,7 @@ union sbi_pmu_ctr_info {
 	};
 };
 
-/**
+/*
  * RISC-V doesn't have hetergenous harts yet. This need to be part of
  * per_cpu in case of harts with different pmu counters
  */
@@ -477,7 +477,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
 
 static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 {
-	/**
+	/*
 	 * No need to check the error because we are disabling all the counters
 	 * which may include counters that are not enabled yet.
 	 */
@@ -494,7 +494,7 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 		  cpu_hw_evt->used_hw_ctrs[0], 0, 0, 0, 0);
 }
 
-/**
+/*
  * This function starts all the used counters in two step approach.
  * Any counter that did not overflow can be start in a single step
  * while the overflowed counters need to be started with updated initialization
@@ -563,7 +563,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	/* Overflow status register should only be read after counter are stopped */
 	overflow = csr_read(CSR_SSCOUNTOVF);
 
-	/**
+	/*
 	 * Overflow interrupt pending bit should only be cleared after stopping
 	 * all the counters to avoid any race condition.
 	 */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
