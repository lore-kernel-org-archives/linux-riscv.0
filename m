Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABE9C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 03:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FutJJQyNUBVFFTcz6ixe2S0yXVy8fGdWEW+G/Jcaekk=; b=I6TslO2QcjDYI4
	XtlFaMxfht+MVeX3k6PIJCvOGAOsxte1+iWZ6EuI7M1jTvey98yu5SVemcjoODx97Mn+MLRC5CZxv
	eLUujAjVw3xuw7f0tFgjTZoOLY0EqWBArrOePsj8/1Qi9Sh26SGjlowp1lccvXHqLa7D8G6HA0neU
	0RpPnXwENlEVtt+qfGKUQCLRmN4SvYucIl7VPs9EH0yNMxo8zUlJkK4m6l4qAPKivrigUGMtYAQ7H
	u3VtjEsWDPV6tjAXga6bqziJxGNTvp+9XLLntd0Og+oTIVzgDZaSgMM89JTmr9HODNyOMe0/lk4GR
	EuZ/4QbeinCTBTbl5k9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVk7I-00000008FMf-1qN4;
	Mon, 22 Jul 2024 03:53:40 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVk5u-00000008EnT-0eMA;
	Mon, 22 Jul 2024 03:52:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WS5nT6nVKzxSQm;
	Mon, 22 Jul 2024 11:47:09 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B0721800A1;
	Mon, 22 Jul 2024 11:52:08 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 22 Jul
 2024 11:52:07 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux@armlinux.org.uk>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <deller@gmx.de>,
	<javierm@redhat.com>, <bhe@redhat.com>, <robh@kernel.org>,
	<alexghiti@rivosinc.com>, <bjorn@rivosinc.com>, <akpm@linux-foundation.org>,
	<namcao@linutronix.de>, <dawei.li@shingroup.cn>, <chenjiahao16@huawei.com>,
	<rppt@kernel.org>, <julian.stecklina@cyberus-technology.de>,
	<rafael.j.wysocki@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 1/3] x86/kexec: Fix crash memory reserve exceed system memory bug
Date: Mon, 22 Jul 2024 11:56:59 +0800
Message-ID: <20240722035701.696874-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722035701.696874-1-ruanjinjie@huawei.com>
References: <20240722035701.696874-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_205214_377305_88F0F336 
X-CRM114-Status: GOOD (  12.74  )
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

On x86_32 Qemu machine with 1GB memory, the cmdline "crashkernel=4G" is ok
as below:
	crashkernel reserved: 0x0000000020000000 - 0x0000000120000000 (4096 MB)

The cause is that the crash_size is parsed and printed with "unsigned long
long" data type which is 8 bytes but allocated used with "phys_addr_t"
which is 4 bytes in memblock_phys_alloc_range().

Fix it by checking if the crash_size is greater than system RAM size and
warn out as parse_crashkernel_mem() do it if so as Baoquan suggested.

After this patch, it fails and there is no above confusing reserve
success info.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Baoquan He <bhe@redhat.com>
---
v4:
- Update the warn info to align with parse_crashkernel_mem().
- Update the commit message.
v3:
- Handle the check in arch_reserve_crashkernel() Baoquan suggested.
- Split x86_32 and arm32.
- Add Suggested-by.
- Drop the wrong fix tag.
v2:
- Also fix for x86_32.
- Update the fix method.
- Peel off the other two patches.
- Update the commit message.
---
 arch/x86/kernel/setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 5d34cad9b7b1..77b937dbd98c 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -482,6 +482,11 @@ static void __init arch_reserve_crashkernel(void)
 	if (ret)
 		return;
 
+	if (crash_size >= memblock_phys_mem_size()) {
+		pr_warn("Crashkernel: invalid size.");
+		return;
+	}
+
 	if (xen_pv_domain()) {
 		pr_info("Ignoring crashkernel for a Xen PV domain\n");
 		return;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
