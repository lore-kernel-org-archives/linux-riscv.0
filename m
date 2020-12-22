Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD53C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 15:58:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE8C221FA
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 15:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CE8C221FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fnQ86+OgPchXMG2SsSIa8E2oc0yXqXrYb6ARUyUH1Y4=; b=AApmz43sMPpa3N/A2DCRhX0PT2
	Kh1suNoI6w2Gnpf9U1WO61bDox7m++Ix2ugfTzAwGgRppkCdwA44K31OXs1W3shNLNAMRwuybSUvw
	/kRJ2wollmVtwGXtT/QwzNe6jZmsy+JemFI5HQ6gRFTnswX8wI/hXqLf6lwBtQLuvqCILV3NA718U
	dV9ZJjWYpRi6MDoSfaf+3zRe7G9kB+RdX4dzH5rs6WVlCG5VZSav1UBEeLCRvBQ106HbNeEVMpeyw
	IFeG94Hl0KRIpT5VKqwspeqhGk7gYyEKGmsx4HyVJxD6llOToW5xnZpUUQ1zx2oTJKAD7K4uDVHim
	WVGJintw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krk3S-0007iU-Tk; Tue, 22 Dec 2020 15:58:30 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krk3Q-0007Qu-Cg
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 15:58:29 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D0grN3mYkz15hYB;
 Tue, 22 Dec 2020 23:54:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Tue, 22 Dec 2020 23:55:04 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH v2] riscv: cacheinfo: Fix using smp_processor_id() in
 preemptible
Date: Wed, 23 Dec 2020 00:01:52 +0800
Message-ID: <20201222160152.180981-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_105828_844197_CB27467B 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: Atish Patra <atish.patra@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use raw_smp_processor_id instead of smp_processor_id() to fix warning,

BUG: using smp_processor_id() in preemptible [00000000] code: init/1
caller is debug_smp_processor_id+0x1c/0x26
CPU: 0 PID: 1 Comm: init Not tainted 5.10.0-rc4 #211
Call Trace:
  walk_stackframe+0x0/0xaa
  show_stack+0x32/0x3e
  dump_stack+0x76/0x90
  check_preemption_disabled+0xaa/0xac
  debug_smp_processor_id+0x1c/0x26
  get_cache_size+0x18/0x68
  load_elf_binary+0x868/0xece
  bprm_execve+0x224/0x498
  kernel_execve+0xdc/0x142
  run_init_process+0x90/0x9e
  try_to_run_init_process+0x12/0x3c
  kernel_init+0xb4/0xf8
  ret_from_exception+0x0/0xc

The issue is found when CONFIG_DEBUG_PREEMPT enabled.

Reviewed-by: Atish Patra <atish.patra@wdc.com>
Tested-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/kernel/cacheinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index de59dd457b41..9b5a8a347434 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -26,7 +26,7 @@ cache_get_priv_group(struct cacheinfo *this_leaf)
 
 static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
 {
-	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(smp_processor_id());
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(raw_smp_processor_id());
 	struct cacheinfo *this_leaf;
 	int index;
 
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
