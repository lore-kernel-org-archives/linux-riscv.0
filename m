Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B15C55ABD
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 08:08:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0FDA2225B
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 08:08:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1BErhi53"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0FDA2225B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jBzgIdxn8hjz+VP/9kIwKi4G3gs6GTUFULCu1pg1tfE=; b=1BErhi53XJP5G235ZKVm5wyLc7
	HY2V8l/Iy2Sxj8jL/Wlosz33tEwciWYVh6qcx1OEDXL9fly+9i5bhsf+L/LcCReg0Wz1y9LsBmhqg
	jeipUtU0rr2PJMJLi+70IdQZA3iY1Lyq1mcDOuISyDLtdtFKPwlQzZm5Eg8FZjbWjfepYbqcz6N8q
	qBUDU0UBJlt+SnaXAe4IwH8MX4QKJpM0hmzuBQFxQzLetAWEnTfHBwEm5Sw+MlA+0DQgP6Pl/zBbq
	2wrnKoj0upIj36/s8MVYbi8ncbm4PAlO0rpmDxzVDAHD7YBSP8CpccrQdy5GjJEgOjNZWrnN6nIFi
	DQ8ZK54w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keZYm-00046d-0w; Mon, 16 Nov 2020 08:08:24 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZYj-00042r-Gh
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 08:08:22 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CZMBZ4J1HzhbPK;
 Mon, 16 Nov 2020 16:07:50 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Nov 2020 16:07:55 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: cacheinfo: Fix using smp_processor_id() in preemptible
Date: Mon, 16 Nov 2020 16:12:38 +0800
Message-ID: <20201116081238.44223-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_030821_836908_91A51075 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Zong Li <zong.li@sifive.com>
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
