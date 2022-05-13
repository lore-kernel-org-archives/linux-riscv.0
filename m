Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D799C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 May 2022 01:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NhueCEy/jv9cDVo/rH0FdV2JZU4sWC9qKvSRrwoCrk=; b=Dywo9mq/3STOXs
	YHqR+d4gCgSPbnxuZPhmGBwguFjVFONKrxV95AaBNo8XoBz/SgwE6Mb79n9Q0tvyOvWoMikWyoVBu
	8Znu0xWv4QEQjmcPAbJfzZcea4GMyAfWgqiPBzXvoNCOiFGSEZGujXwUUGUjaGUupIWIGNlFhSvLe
	xIZcJapGM2zxEiKB2FucUNKh5iYnA9T9B+qyIAvY6l3V2evKdjFTrOK0xTXwsqZlo594lGAjHGGu8
	6sotlKVbcK/goBS53n9HXI9I/Xo70+awl/KroLmdwev29aUqbBI0Sr5OM612N//v770gKtV2SCxKe
	17PpEk44AIid3SnACpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npKWu-00E8LK-UV; Fri, 13 May 2022 01:55:44 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npKWp-00E8J0-Pa
 for linux-riscv@lists.infradead.org; Fri, 13 May 2022 01:55:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id fv2so6782806pjb.4
 for <linux-riscv@lists.infradead.org>; Thu, 12 May 2022 18:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zwpzunAvrzpyNJwdCWF/epnILRDBBON3y9jarpPPVEU=;
 b=jn21sS9XmXyewU4HqxnDpg8Clt6oVSJiJy9/dzvwizTppgxJ4ATD5W8DkzU4MK4uGG
 RXp7gz1Tfo+f+k9qSNtOp4+qIl3++tOFwLmhSiqOr5oBSZ5ivYPXQ8LFk7qXNjDS9vq6
 kzydwxWF4Ivso12ENq3uSgByo/9DaPpCDbfCcpgBkqYTU+Su5s4iJwaxddAr86ZK5Wi7
 381m+o3ZHxVm8iYaSh/NygFxI9wjCXeGHZ4nin5B6ZlpPelKDPC3jSuu1xBsM1R2mvMa
 dK3OVNw438WaKzrUjF6y3PK5L2RGN3JP95T8qtHYZ2PqY3CFRYO2CZpo6UXlzOm5O2jT
 PwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zwpzunAvrzpyNJwdCWF/epnILRDBBON3y9jarpPPVEU=;
 b=eZ9QBEm6JYDu+oHiu9MMt+GA8V8VKGcAtxSzqbEbuJK80nqMXxM3YKMdaqJlaohBkI
 vWsyHV58GN1xiK7JcF4dHUuxgUKS8h30HMdLQuFl9a4Hfg/00plk0eg2X/z2UMDiVqwv
 AzyOD4JgkVeWjxgTDegxyl9xDDIdoa1DTg+WJyfb8ko+cxmi+RTcNUx9Kc938DVaFwo9
 5BWEkwa6o8WEwJk96ogz7mTOW1IsqNjnSMyAHWZ0M650GDurcN0uh1sWK63K0teSnF2U
 1DjGY+acO104y6QFtnGYG1b7uLw2O+JH1/0HzX4v0DDrEfE/nLNos65YBk39I2ySQooO
 JmDg==
X-Gm-Message-State: AOAM5306PufbtHEfAhc5tJ3tFlzeiiNJpdS92KYKvbgxE5HrsQDaiMNv
 xuqaPgfyVVEuQS5/kO5CxSWZt0aGZmZNTA==
X-Google-Smtp-Source: ABdhPJw4gZ6OHEXgL59faCpkeiUSlt9ozUYGPPPvK4t1UxngjnGeG6isTHOmFxPQjvPQmoPyltbyag==
X-Received: by 2002:a17:902:d54f:b0:15f:22cd:c6d2 with SMTP id
 z15-20020a170902d54f00b0015f22cdc6d2mr2572023plf.170.1652406938015; 
 Thu, 12 May 2022 18:55:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a6561a1000000b003c14af5063fsm365883pgv.87.2022.05.12.18.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 18:55:37 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/3] RISC-V: Update user page mapping only once during start
Date: Thu, 12 May 2022 18:55:21 -0700
Message-Id: <20220513015522.910856-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513015522.910856-1-atishp@rivosinc.com>
References: <20220513015522.910856-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_185539_867146_BD2CB4CD 
X-CRM114-Status: GOOD (  11.58  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
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
index 1e6c150c892a..7ad92039a718 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -532,6 +532,7 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
 				  flag, init_val, 0, 0);
 #endif
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
