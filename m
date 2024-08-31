Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76F4CA100B
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QX9tPDtcfaq5v15n4E+4rhmInWDEViLML0Y94s+bnBU=; b=VvLvSsOL4Ad1wt
	T7yHFkOoF4PO+ERWEeKZtsvfOdHp5RVQKndCVc3ysvS5avBbjYI1gChyE2aVc9P2fSJbgJxapKcsB
	r2i/YxD23+wTDgEW5mF6h/FTJYSuCMTh4D/Rx4CSN8pj56kQKoRxReK2me+LAt+OGKqInopw71kp1
	o6svQx7geEP7va/Qq14S7BFjkD7rcdVWWsrqXOEhwQULdDu/X5HEGlZ8lPbGj0o4Qf7iembWeoZbP
	X8Ou/JpGdg8l+vcHXEb2O3Tu57InLlSyiEv0+mUw0iyA+B/QkA7FkBCqqM4y/tGieGmeN6+vp2BZw
	0rDLCgk6c8SzcOJ8gFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skII5-00000008oCQ-3DdD;
	Sat, 31 Aug 2024 07:12:57 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skII0-00000008oBt-3emN
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 07:12:56 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WwmRn5CjGz4f3l1s
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 15:12:21 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 5A81B1A08FC
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 15:12:37 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgB36oBkwtJmVQfcDA--.5749S2;
	Sat, 31 Aug 2024 15:12:37 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH v2] drivers/perf: riscv: Align errno for unsupported perf event
Date: Sat, 31 Aug 2024 07:15:20 +0000
Message-Id: <20240831071520.1630360-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgB36oBkwtJmVQfcDA--.5749S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF17ury5ArykJFyfuFW3Jrb_yoW8Zw1Dpr
	Z8Cr4Yk3WrtF12q3y8AFZru3WrJwnaqFZ8Kr9Iy398Zr1rJrW5X3Z8J345Xrn5JFykZFy2
	kw45KrW3Ca4FvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
	1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jjVbkUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_001254_622783_F35EF90B 
X-CRM114-Status: GOOD (  11.03  )
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

From: Pu Lehui <pulehui@huawei.com>

RISC-V perf driver does not yet support PERF_TYPE_BREAKPOINT. It would
be more appropriate to return -EOPNOTSUPP or -ENOENT for this type in
pmu_sbi_event_map. Considering that other implementations return -ENOENT
for unsupported perf types, let's synchronize this behavior. Due to this
reason, a riscv bpf testcases perf_skip fail. Meanwhile, align that
behavior to the rest of proper place.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 drivers/perf/riscv_pmu_legacy.c | 4 ++--
 drivers/perf/riscv_pmu_sbi.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 04487ad7fba0..93c8e0fdb589 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -22,13 +22,13 @@ static int pmu_legacy_ctr_get_idx(struct perf_event *event)
 	struct perf_event_attr *attr = &event->attr;
 
 	if (event->attr.type != PERF_TYPE_HARDWARE)
-		return -EOPNOTSUPP;
+		return -ENOENT;
 	if (attr->config == PERF_COUNT_HW_CPU_CYCLES)
 		return RISCV_PMU_LEGACY_CYCLE;
 	else if (attr->config == PERF_COUNT_HW_INSTRUCTIONS)
 		return RISCV_PMU_LEGACY_INSTRET;
 	else
-		return -EOPNOTSUPP;
+		return -ENOENT;
 }
 
 /* For legacy config & counter index are same */
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 44d3951d009f..169c5157b916 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -309,7 +309,7 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 			  ret.value, 0x1, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
 	} else if (ret.error == SBI_ERR_NOT_SUPPORTED) {
 		/* This event cannot be monitored by any counter */
-		edata->event_idx = -EINVAL;
+		edata->event_idx = -ENOENT;
 	}
 }
 
@@ -543,7 +543,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 		}
 		break;
 	default:
-		ret = -EINVAL;
+		ret = -ENOENT;
 		break;
 	}
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
