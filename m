Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2DCECAAA1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 02:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1BV6LqAljDgCS4/7W3kKnQdXQ57N8nCZ2QLO5I1L3Ww=; b=XCgwLyoWekwrkm
	WkJMg4IXclToIDsfG323yFe3oZJEAFyQL6xs9+SCKDmEMt0DUEg+LrEHykYgPGg41zWMDd4Y2YqnZ
	+LbYGyaW2l4MpR1FUwTu9PO6NkvKMZifVesuJhYbIZ/Y5OQpMKQQ1kiADST65BYKjT2muchDV979Y
	xMYaV5BIK+2GUU4zSWmGd3pH4aWujN4KqwLJSBWUDz8eKnzW3WBaQMrpBWCnKQl/8TpBZIai0zQ1t
	Rtcd6paUdRACfg5K9JopU3wYuw2mxVkTduYK+cRPwqgkcVbAlreZcWipEcYw/K1gB8qZSGWKzIwpf
	CbyRDAhzmHRcnm7sJVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZN7k-001cj1-8z; Sat, 17 Sep 2022 02:00:04 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZN7H-001cRg-TW; Sat, 17 Sep 2022 01:59:38 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MTvFv11TLzBsMr;
	Sat, 17 Sep 2022 09:57:23 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 17 Sep 2022 09:59:28 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 17 Sep
 2022 09:59:27 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-csky@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <guoren@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <hca@linux.ibm.com>,
	<gor@linux.ibm.com>, <borntraeger@linux.ibm.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <naveen.n.rao@linux.ibm.com>,
	<anil.s.keshavamurthy@intel.com>, <mhiramat@kernel.org>, <namit@vmware.com>,
	<catalin.marinas@arm.com>, <peterz@infradead.org>, <mark.rutland@arm.com>
CC: <liaochang1@huawei.com>, <chris.zjh@huawei.com>, <zouyipeng@huawei.com>
Subject: [PATCH 0/2] make weak attributes in {k,u}probes
Date: Sat, 17 Sep 2022 09:55:20 +0800
Message-ID: <20220917015522.44583-1-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_185936_140392_459AF09E 
X-CRM114-Status: UNSURE (   3.94  )
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

We have some function implementation under some arch does nothing.
We can mark it with weak attributes to improve.
1. arch_init_kprobes in kprobes
2. arch_uprobe_exception_notify in uprobes

Yipeng Zou (2):
  kprobes: make arch_init_kprobes as weak
  uprobes: make arch_uprobe_exception_notify as weak

 arch/arm/probes/uprobes/core.c     | 6 ------
 arch/arm64/kernel/probes/uprobes.c | 6 ------
 arch/csky/kernel/probes/kprobes.c  | 5 -----
 arch/csky/kernel/probes/uprobes.c  | 6 ------
 arch/riscv/kernel/probes/kprobes.c | 5 -----
 arch/riscv/kernel/probes/uprobes.c | 6 ------
 arch/s390/kernel/kprobes.c         | 5 -----
 arch/x86/kernel/kprobes/core.c     | 5 -----
 kernel/events/uprobes.c            | 6 ++++++
 kernel/kprobes.c                   | 5 +++++
 10 files changed, 11 insertions(+), 44 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
