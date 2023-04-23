Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B828BC7618E
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Apr 2023 01:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TifxM3CReJRRrJZKN+gVAgjDuqvXmvDuEhbXjsVY8QQ=; b=u+ICReQo1Jh+b/
	wcSx3pgGWcipTBhhfg0DWMNXrR2ezRrNLrQUnbcvn+4tN0h4srpXoj5ACIpee8aaX8K7EIlDilFfU
	28LOm7itoyFxt5IkH8riA5q+wx/Hb7sJJucLDcZcKaM3Ot0JbSkfoVa+/z5OPkcwyXQfCAreKQSfC
	Z+eiJpMtlsBg1wstdMk9TIGfw1EKtCrK/tWGsPA5DQrFDwmxa8BzJZhYmFBF6/OVXendZn01XvAOv
	X+gfJVzY0k9AMnHXcypVi6ZceuT3LX1241auYO/g2uJlNXVE3YS9qR/smWyoN6hxtmLztJEYrdWfr
	KX91qg/SwyqSbyP1djBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqORZ-00Dd5C-03;
	Sun, 23 Apr 2023 01:23:09 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqORV-00Dd4B-3B
	for linux-riscv@lists.infradead.org;
	Sun, 23 Apr 2023 01:23:08 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Q3r51163BznbqP;
	Sun, 23 Apr 2023 09:19:01 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 23 Apr
 2023 09:22:49 +0800
From: ruanjinjie <ruanjinjie@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.ed>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] riscv: fix kprobe __user string arg print fault issue
Date: Sun, 23 Apr 2023 09:21:14 +0800
Message-ID: <20230423012114.889546-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230422_182306_249665_C68E06C5 
X-CRM114-Status: UNSURE (   6.82  )
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

On riscv qemu platform, when add kprobe event on do_sys_open() to show
filename string arg, it just print fault as follow:

echo 'p:myprobe do_sys_open dfd=$arg1 filename=+0($arg2):string flags=$arg3
mode=$arg4' > kprobe_events

bash-166     [000] ...1.   360.195367: myprobe: (do_sys_open+0x0/0x84)
dfd=0xffffffffffffff9c filename=(fault) flags=0x8241 mode=0x1b6

bash-166     [000] ...1.   360.219369: myprobe: (do_sys_open+0x0/0x84)
dfd=0xffffffffffffff9c filename=(fault) flags=0x8241 mode=0x1b6

bash-191     [000] ...1.   360.378827: myprobe: (do_sys_open+0x0/0x84)
dfd=0xffffffffffffff9c filename=(fault) flags=0x98800 mode=0x0

As riscv do not select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE,
the +0($arg2) addr is processed as a kernel address though it is a
userspace address, cause the above filename=(fault) print. So select
ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE to avoid the issue, after that the
kprobe trace is ok as below:

bash-166     [000] ...1.    96.767641: myprobe: (do_sys_open+0x0/0x84)
dfd=0xffffffffffffff9c filename="/dev/null" flags=0x8241 mode=0x1b6

bash-166     [000] ...1.    96.793751: myprobe: (do_sys_open+0x0/0x84)
dfd=0xffffffffffffff9c filename="/dev/null" flags=0x8241 mode=0x1b6

bash-177     [000] ...1.    96.962354: myprobe: (do_sys_open+0x0/0x84)
dfd=0xffffffffffffff9c filename="/sys/kernel/debug/tracing/events/kprobes/"
flags=0x98800 mode=0x0

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eb7f29a412f8..c51f0d3227af 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -26,6 +26,7 @@ config RISCV
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_PMEM_API
+	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_DIRECT_MAP if MMU
 	select ARCH_HAS_SET_MEMORY if MMU
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
