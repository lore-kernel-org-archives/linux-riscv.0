Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54000C388F9
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 06:38:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89CC920B80
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 06:38:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pKh56JgI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89CC920B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cb0/SrJ8t9EzEtERDCleMQG58IbtN4hmp3FicEFu2ok=; b=pKh56JgIS63Sm4QV5zLtUAfYHE
	sPfLiixx9wpWvHDs3tJ5tHojhZ5mWScRy1YHvgBlJ9LOpo1xGeTvqHQblqV/YnXeoV5UDzwQW7TAX
	jTAGo+Cp+USkAfXnzPFBtHV2AGm64HoEsuMIfqaDhkjH0pFlPcgw4HZ1fi73vA/ai6PdItZPnQNxE
	4smC5lF5bdV3fHNknd+6W0IXa2AM+SmFsRzwlHnbJIeQvqsDGhhZVJFAjLLLHuuIB7zyJI5bsk+qR
	HGvYxKWdG34xkFM9sF4ZUhDAeKRTDX/8xAhYgoNv/QqGXwYRZ1HkyFj1bChg0tAR2jrSMH+uY/fV9
	mMvzKp+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdSin-0000km-RV; Fri, 13 Nov 2020 06:38:09 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdSik-0000iu-MS
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 06:38:07 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CXTL273lDzhd7Q;
 Fri, 13 Nov 2020 14:37:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Fri, 13 Nov 2020 14:37:46 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH 0/3] riscv: cover to ARCH_STACKWALK
Date: Fri, 13 Nov 2020 14:42:20 +0800
Message-ID: <20201113064223.103530-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_013806_976860_639F6D5A 
X-CRM114-Status: UNSURE (   6.23  )
X-CRM114-Notice: Please train this message.
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

Use the newer common infrastructure and simpler arch_stack_walk() interface
for stack walk.

Kefeng Wang (3):
  riscv: Cleanup stacktrace
  riscv: Make stack walk callback consistent with generic code
  riscv: Enable ARCH_STACKWALK

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/include/asm/stacktrace.h | 17 ++++++++
 arch/riscv/kernel/perf_callchain.c  | 10 +----
 arch/riscv/kernel/stacktrace.c      | 62 +++++++----------------------
 4 files changed, 34 insertions(+), 56 deletions(-)
 create mode 100644 arch/riscv/include/asm/stacktrace.h

-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
