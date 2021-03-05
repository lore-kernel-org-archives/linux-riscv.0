Return-Path: <SRS0=jthF=ID=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEC5C433E9
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:03:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C08EC64FD2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C08EC64FD2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YHOkg2LMS5FSSmATu7JDAu3eq3ei1E32zRxTAb8sXmc=; b=jiJcM0Y7HHH8fWc1JU3U5THZBM
	JLYQN0Dhw5L5vNbV0Oq+K76OvPMJKB6GyUeetKYaahFLq6bkhkCTH7jvsPUu6J7vtRLOzpHnD8esy
	a5fbGY+SgNbj1xYEmV1k5mTsbxmcUAvTALdi6ZC/ny0LBux6cBHn7XPrbp4lUsLpEfLoVPa6zZa8W
	EI0Ir3qE8zp/39vk2MCXknDDUP9smk5BROh73kDn7vzkrKdWQdpvT68AZE5vyR6mhxGFXzbLci4ha
	XWHOIrWXichUMw4xbryH7iAO6qXN6/cnFHscmf5/zdJKRqebIXaSnIgBAAnYvw3h+QD+M6GlUvUZA
	FI6L3ixA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI8Ef-00EftR-LD; Fri, 05 Mar 2021 11:03:09 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI8EZ-00EfoJ-4T
 for linux-riscv@lists.infradead.org; Fri, 05 Mar 2021 11:03:06 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DsPtX3GNgzjVcX;
 Fri,  5 Mar 2021 19:01:24 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Mar 2021
 19:02:40 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH 0/9] riscv: misc cleanup
Date: Fri, 5 Mar 2021 19:33:23 +0800
Message-ID: <20210305113332.428048-1-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_110303_689360_8024DEA9 
X-CRM114-Status: UNSURE (   4.72  )
X-CRM114-Notice: Please train this message.
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

Fix some compilation warnings,improve code style

Nanyong Sun (9):
  riscv: traps: Fix no prototype warnings
  riscv: irq: Fix no prototype warning
  riscv: sbi: Fix comment of __sbi_set_timer_v01
  riscv: ptrace: Fix no prototype warnings
  riscv: time: Fix no prototype for time_init
  riscv: syscall_table: Reduce W=1 compilation warnings noise
  riscv: process: Fix no prototype for show_regs
  riscv: ftrace: Use ftrace_get_regs helper
  riscv: process: Fix no prototype for arch_dup_task_struct

 arch/riscv/include/asm/asm-prototypes.h | 16 ++++++++++++++++
 arch/riscv/include/asm/irq.h            |  2 ++
 arch/riscv/include/asm/processor.h      |  1 +
 arch/riscv/include/asm/ptrace.h         |  5 +++++
 arch/riscv/include/asm/timex.h          |  2 ++
 arch/riscv/kernel/Makefile              |  1 +
 arch/riscv/kernel/probes/ftrace.c       | 16 +++++++++-------
 arch/riscv/kernel/process.c             |  1 +
 arch/riscv/kernel/sbi.c                 |  2 +-
 arch/riscv/kernel/time.c                |  1 +
 arch/riscv/kernel/traps.c               |  1 +
 11 files changed, 40 insertions(+), 8 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
