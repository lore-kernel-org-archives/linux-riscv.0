Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6D2C54EE9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 02:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5LmMliYaQop+zcVpMJbCAMLLm+cg1it+oiJAYP11kLU=; b=cuXcpvaVXbbfgX
	/s9jWwm+PpKZDE+Asgdx0w+yUVotID1JsJqvvj/b+0aasHRZ9phtbEngciguJ1jXb3RXTYk/PAmsF
	rjnSoG59EY1sB70G6913EISnZSjdmGK1uN2tzn0PahA4Yu3Iy7m/Z4HuMyrJF/PHOUmreu6+nF6wO
	KhoNCyDGordwq+6NbjnK3XGBjdXHy9gj447XJNyW4IcJDGE9clPYKpRlCh68kCfy4Y2DEHsdMBdny
	yXlgH/qnFavPeGAUK9Rtlj5uXUMrjeoFxJcB/vBzD0xMG0ITuvEgmdXgAJW8dhxHDNBv5zKmoAQ0B
	bO0NVQNvQt9yNg6s9XiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWTw7-00BH2Y-Mt; Fri, 09 Sep 2022 02:40:07 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWTw4-00BGx2-82
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 02:40:05 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MP0V93j2yzlVqb;
	Fri,  9 Sep 2022 10:36:01 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 10:39:52 +0800
Received: from ubuntu1804.huawei.com (10.67.174.174) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 10:39:51 +0800
From: Li Huafei <lihuafei1@huawei.com>
To: <guoren@kernel.org>, <mhiramat@kernel.org>, <palmer@dabbelt.com>
CC: <rostedt@goodmis.org>, <mingo@redhat.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <naveen.n.rao@linux.ibm.com>,
	<anil.s.keshavamurthy@intel.com>, <davem@davemloft.net>,
	<jszhang@kernel.org>, <peterz@infradead.org>, <liaochang1@huawei.com>,
	<me@packi.ch>, <penberg@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <lihuafei1@huawei.com>
Subject: [PATCH RESEND v2 1/2] riscv: ftrace: Fix the comments about the number of ftrace instruction
Date: Fri, 9 Sep 2022 10:36:24 +0800
Message-ID: <20220909023625.149651-1-lihuafei1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_194004_506665_9CB85B36 
X-CRM114-Status: UNSURE (   9.50  )
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

When DYNAMIC_FTRACE is enabled, we put 8 16-bit instructions in front of
the function for ftrace use, not 5.

Fixes: afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
Suggested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Li Huafei <lihuafei1@huawei.com>
---
v1: https://lore.kernel.org/lkml/20220426015751.88582-1-lihuafei1@huawei.com/
v2: https://lore.kernel.org/lkml/20220819025522.154189-1-lihuafei1@huawei.com/

v2 RESEND:
 - Rebase onto v6.0-rc4.

Changlog in v1 -> v2:
 - Add the fix tag.
 - Delete the expression "4 instructions".

 arch/riscv/kernel/ftrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 2086f6585773..552088e9acc4 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -71,8 +71,8 @@ static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
 }
 
 /*
- * Put 5 instructions with 16 bytes at the front of function within
- * patchable function entry nops' area.
+ * Put 16 bytes at the front of the function within the patchable function
+ * entry nops' area.
  *
  * 0: REG_S  ra, -SZREG(sp)
  * 1: auipc  ra, 0x?
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
