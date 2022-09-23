Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C49C6FA82
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dQpGtniEKW349yX+CxPoQ+OGh4Z2tEDuPzo2dTyeYyo=; b=bFw3HTiMql4/iE
	JvyoePqXcu2pw6uwzoCUljg38cp9yjQquYzQHi9LPqmEvQUS755ehS8DpmdJ92OsFfrIKMzTV2SfO
	vBfKt4hZFF+6fB41+AvxqKbHkEwOcSEyVDDAhk117225JBH98YzqvQvTOKc8Ck8z49oIYeVmZdvki
	x80qaQbg77wkqgYvZsfbZm694lw7owdYiGjZSQSBM9oSnHzsyFIgbpIjPkV4KteRKNoqzAhcjkcua
	m9t0lrJ4kuu7rknNlfkYUBKNtXpaG2nULnUaD0dD9BmmG5PkacADyofI+4vitMZkmP0nfMaG/B+rJ
	kiJPMfAsJnLieOb6+diA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeP1-0033hl-DB; Fri, 23 Sep 2022 08:51:19 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeOS-0033Q8-St; Fri, 23 Sep 2022 08:50:47 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MYm5R4xnjzHqQg;
	Fri, 23 Sep 2022 16:48:27 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 16:50:38 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <guoren@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<mhiramat@kernel.org>, <rostedt@goodmis.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <liaochang1@huawei.com>, <alexandru.elisei@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-csky@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH V3 0/3] kprobe: Optimize the performance of patching ss
Date: Fri, 23 Sep 2022 16:46:55 +0800
Message-ID: <20220923084658.99304-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_015045_124164_E4954259 
X-CRM114-Status: UNSURE (   4.56  )
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

Single-step slot would not be used until kprobe is enabled, that means
no race condition occurs on it under SMP, hence it is safe to pacth ss
slot without stopping machine.

v3:
1. Drop duplicated I-Cache maintenance for arm64.
2. Add Acked-by from Masami Hiramatsu.

v2:
Backport riscv patch to cksy and arm64.

Liao Chang (3):
  riscv/kprobe: Optimize the performance of patching single-step slot
  csky/kprobe: Optimize the performance of patching single-step slot
  arm64/kprobe: Optimize the performance of patching single-step slot

 arch/arm64/kernel/probes/kprobes.c | 7 ++-----
 arch/csky/kernel/probes/kprobes.c  | 6 +++++-
 arch/riscv/kernel/probes/kprobes.c | 8 +++++---
 3 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
