Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003B2ECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6vZZ9o7MQ4Lqfj87NyjrbUr+15+OLq86xvIEjZ+3AXo=; b=q95drkY411w8Wh
	6oDgUV08rGYuTP8VG4bIZRr+JyhW3G7N2IwIWMiKl6qe6+akeDyP4+O7vVy36KKZBqtac/m1BtUOV
	vdjQ2QclxrGiXUmdBzz/e8ZM0wsSweKL7AszmtoJ1cNMqp+lXI45hUSX9VS4J/eZQqNLZW+wMi9BL
	cl5wG0ESl2FJav0QDmnInbh3BmkjxC5yeprnpsj09LpfixJpOiY5IxF0TalRcedpKmxTMBb3L4XZw
	HaAEvo6+l1BxeGjOpiM/Ofsn/Y/hOYGCYtQW1ikLEvAPIdaTm4utL1JqFd3waxAmLiBxZBtVlPF/e
	KcNYmC2b9GwSKqN1IPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThl7-00B82h-U0; Thu, 01 Sep 2022 10:49:17 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThl4-00B80R-Km
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 10:49:16 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MJHm06m4gznTxK;
	Thu,  1 Sep 2022 18:46:40 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 1 Sep 2022 18:49:08 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 18:49:08 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <liaochang1@huawei.com>, <chris.zjh@huawei.com>, <zouyipeng@huawei.com>
Subject: [PATCH 0/2] riscv: tracing: Improve hardirq tracing message
Date: Thu, 1 Sep 2022 18:45:13 +0800
Message-ID: <20220901104515.135162-1-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_034914_870705_0B4316E7 
X-CRM114-Status: UNSURE (   5.72  )
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

Currently, hardirq tracing log in riscv showing the last {enabled,disabled}
at __trace_hardirqs_{on,off} all the time.

We can use trace_hardirqs_on_caller to display the caller we really want
to see.

Yipeng Zou (2):
  tracing: hold caller_addr to hardirq_{enable,disable}_ip
  riscv: tracing: Improve hardirq tracing message

 arch/riscv/kernel/trace_irq.c   | 4 ++--
 include/linux/irqflags.h        | 2 ++
 kernel/trace/trace_preemptirq.c | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
