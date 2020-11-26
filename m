Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EFFC56201
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 02:36:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 472D720770
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 02:36:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bXHXAGcp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 472D720770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eVlV2uM9JpAYhwuhQGec00iDEEkHRc6ukFCSinv+wGQ=; b=bXHXAGcp4VDL8zEfFf+TpEGaab
	Wq8DQP8nnO74+3pn2aYqCkKVQGdZW7wSy8T54ASKOrLYTT++D8v/wqKeR6DhAiluLSMu1xrdMnmEI
	b2Jqk54/7L5GUY3ZrP4ZXwSS53E9Qw0RNMXDYL+vG2j8sHzQIj03xLLL4ApEVdxxKGO44ZLoqan5w
	j18U0p5Tq0gA3wRk/AyiRg+HRJVGB2Sk5Zr9awXB+Bsa+B/DzPSpL2f74olHqHnzgEBQzNym0Tvvk
	0Jjw4ElMTJohkNW3XiKmasqA3HbPWV8GxMzrJwSi+by4Wf5/FFS9D7fsS4/gVHwg4lLg/TSaxliW/
	CKUeWyzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki795-0004lF-Kh; Thu, 26 Nov 2020 02:36:31 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki792-0004kq-Rc
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 02:36:30 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ChMMF1p9gzhhgV;
 Thu, 26 Nov 2020 10:36:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Nov 2020 10:36:19 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: Cleanup sbi function stubs when RISCV_SBI disabled
Date: Thu, 26 Nov 2020 10:40:38 +0800
Message-ID: <20201126024038.180680-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_213629_683731_F19CF939 
X-CRM114-Status: GOOD (  11.94  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fix sbi_init() function declaration mismatch between RISCV_SBI
enable and disable, as it always returned 0, make it void function.

Drop some stubs which won't be used if RISCV_SBI disabled.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/include/asm/sbi.h | 10 +++-------
 arch/riscv/kernel/sbi.c      |  4 +---
 arch/riscv/kernel/setup.c    |  2 --
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 653edb25d495..99dc77ba8e43 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -89,7 +89,7 @@ struct sbiret {
 	long value;
 };
 
-int sbi_init(void);
+void sbi_init(void);
 struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg1, unsigned long arg2,
 			unsigned long arg3, unsigned long arg4,
@@ -147,11 +147,7 @@ static inline unsigned long sbi_minor_version(void)
 
 int sbi_err_map_linux_errno(int err);
 #else /* CONFIG_RISCV_SBI */
-/* stubs for code that is only reachable under IS_ENABLED(CONFIG_RISCV_SBI): */
-void sbi_set_timer(uint64_t stime_value);
-void sbi_clear_ipi(void);
-void sbi_send_ipi(const unsigned long *hart_mask);
-void sbi_remote_fence_i(const unsigned long *hart_mask);
-void sbi_init(void);
+static inline void sbi_remote_fence_i(const unsigned long *hart_mask) {}
+static inline void sbi_init(void) {}
 #endif /* CONFIG_RISCV_SBI */
 #endif /* _ASM_RISCV_SBI_H */
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 226ccce0f9e0..bae6ffdc6e7b 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -560,7 +560,7 @@ static struct riscv_ipi_ops sbi_ipi_ops = {
 	.ipi_inject = sbi_send_cpumask_ipi
 };
 
-int __init sbi_init(void)
+void __init sbi_init(void)
 {
 	int ret;
 
@@ -600,6 +600,4 @@ int __init sbi_init(void)
 	}
 
 	riscv_set_ipi_ops(&sbi_ipi_ops);
-
-	return 0;
 }
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 901ac0c680dd..ef4f5c076d61 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -104,9 +104,7 @@ void __init setup_arch(char **cmdline_p)
 	kasan_init();
 #endif
 
-#if IS_ENABLED(CONFIG_RISCV_SBI)
 	sbi_init();
-#endif
 
 #ifdef CONFIG_SMP
 	setup_smp();
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
