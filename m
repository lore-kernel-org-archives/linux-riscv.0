Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2C1C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 01:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nil/bGbGA+sVni3GjyTBmdyyZxRE1gDZge7iTklNnXE=; b=Po4FFnavprwghO
	W1zLBpZupDv3ijK4gAdgbr7JJ54uBVA9CcpMCJ2O3jbujyZiv8JHx/sNS/ySBLSq+kf+9HZ3+HIkF
	YDduQKpZPFevu1/I8P7VTVe0PGMTO8aRAmQEEyERm23re/YfviVDOfxjJo9xrNceYhwljbvhPpv0X
	EU2drb4H1FHz1PmDwyk4BvZG8lcjbCGf7tGyAT87CoIznTRkScNxnbblZj2CUsb0RfRKCVo7tHPwE
	YOGf9BKTJVytrLO84D3PDu8F5AOHIvNfXEW4xIMhZ9LoI1SGFi4kfnrFKpzeZMbeft0okXwMBvoLj
	+8+10CX04geoWGt+0QlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njATv-00C8Az-Vc; Tue, 26 Apr 2022 01:59:11 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njATs-00C87j-6R
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 01:59:10 +0000
Received: from kwepemi100020.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KnQ5v1kBJzQjBn;
 Tue, 26 Apr 2022 09:58:43 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 kwepemi100020.china.huawei.com (7.221.188.48) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 09:58:59 +0800
Received: from ubuntu1804.huawei.com (10.67.174.174) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 09:58:58 +0800
From: Li Huafei <lihuafei1@huawei.com>
To: <guoren@kernel.org>, <mhiramat@kernel.org>, <palmer@dabbelt.com>
CC: <rostedt@goodmis.org>, <mingo@redhat.com>, <paul.walmsley@sifive.com>,
 <aou@eecs.berkeley.edu>, <naveen.n.rao@linux.ibm.com>,
 <anil.s.keshavamurthy@intel.com>, <davem@davemloft.net>,
 <jszhang@kernel.org>, <peterz@infradead.org>, <liaochang1@huawei.com>,
 <me@packi.ch>, <penberg@kernel.org>, <lihuafei1@huawei.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] riscv: ftrace: Fix the comments about the number of
 ftrace instruction
Date: Tue, 26 Apr 2022 09:57:50 +0800
Message-ID: <20220426015751.88582-1-lihuafei1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_185908_442431_F8DCCB27 
X-CRM114-Status: UNSURE (   8.25  )
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

When DYNAMIC_FTRACE is enabled, we put four instructions in front of the
function for ftrace use, not five.

Signed-off-by: Li Huafei <lihuafei1@huawei.com>
---
 arch/riscv/kernel/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 4716f4cdc038..63f457650fa4 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -73,7 +73,7 @@ static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
 }
 
 /*
- * Put 5 instructions with 16 bytes at the front of function within
+ * Put 4 instructions with 16 bytes at the front of function within
  * patchable function entry nops' area.
  *
  * 0: REG_S  ra, -SZREG(sp)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
