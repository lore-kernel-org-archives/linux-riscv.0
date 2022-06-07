Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC11C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 01:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScUGQpArKEfzl872efZvNzGk04lsKf1xqsSG9UgXPdw=; b=kwtDrfXtjMnDA/
	z+U+yxfLR1bQNYbOPtfWpvDDUUaic3uANGiiQU+nBsq6Iz505MvEnWcJf3pJPuW4gSZ69Smhv4qI2
	U4is/g3rzbDG9Iuw/PhCaNwSOgGibWhrKEvr7KgxiWwcwHinDzwFne2BrJZmRqFWHjRrBhV0OGegc
	lFcpO6KQKhjeL0tob1MIswrsvD4mixmuADcnmJJCIYxAuMOQeJDpGzLCi9jBkpvYtkj2WBpArTtnn
	7h2OcTmvofgzlStDJzkS/fMO+ZjEnDazFWCbhg9IhvmA9//ygQveFEUFFDpqsAii/v9eWAbk0saR3
	ziL3jnkRzKOl0E/K3cZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyNuz-003zTI-UM; Tue, 07 Jun 2022 01:22:01 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyNun-003zPo-Kd
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 01:21:52 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LHCGn27T4zjXPP;
	Tue,  7 Jun 2022 09:20:49 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 7 Jun 2022 09:21:45 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 7 Jun 2022 09:21:44 +0800
Message-ID: <b2a45f97-0f97-6621-bb7e-11f51282c468@huawei.com>
Date: Tue, 7 Jun 2022 09:21:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] RISC-V: Add fixup to support fast call of
 crash_kexec()
Content-Language: en-US
To: Xianting Tian <xianting.tian@linux.alibaba.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<philipp.tomsich@vrull.eu>, <ebiederm@xmission.com>, <heiko@sntech.de>,
	<vitaly.wool@konsulko.com>, <tongtiangen@huawei.com>, <guoren@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220606123750.2884245-1-xianting.tian@linux.alibaba.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20220606123750.2884245-1-xianting.tian@linux.alibaba.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_182150_082476_74CD36EB 
X-CRM114-Status: GOOD (  14.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2022/6/6 20:37, Xianting Tian wrote:
> Currently, almost all archs (x86, arm64, mips...) support fast call
> of crash_kexec() when "regs && kexec_should_crash()" is true. But
> RISC-V not, it can only enter crash system via panic(). However panic()
> doesn't pass the regs of the real accident scene to crash_kexec(),
> it caused we can't get accurate backtrace via gdb,
> 	$ riscv64-linux-gnu-gdb vmlinux vmcore
> 	Reading symbols from vmlinux...
> 	[New LWP 95]
> 	#0  console_unlock () at kernel/printk/printk.c:2557
> 	2557                    if (do_cond_resched)
> 	(gdb) bt
> 	#0  console_unlock () at kernel/printk/printk.c:2557
> 	#1  0x0000000000000000 in ?? ()
>
> With the patch we can get the accurate backtrace,
> 	$ riscv64-linux-gnu-gdb vmlinux vmcore
> 	Reading symbols from vmlinux...
> 	[New LWP 95]
> 	#0  0xffffffe00063a4e0 in test_thread (data=<optimized out>) at drivers/test_crash.c:81
> 	81             *(int *)p = 0xdead;
> 	(gdb)
> 	(gdb) bt
> 	#0  0xffffffe00064d5c0 in test_thread (data=<optimized out>) at drivers/test_crash.c:81
> 	#1  0x0000000000000000 in ?? ()
>
> Test code to produce NULL address dereference in test_crash.c,
> 	void *p = NULL;
> 	*(int *)p = 0xdead;
>
> Fixes: 76d2a0493a17 ("RISC-V: Init and Halt Code")
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
> Changes from v1:
> - simplify the commit message
> Changes from v2:
> - add fixup in title
> ---
>   arch/riscv/kernel/traps.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index b40426509244..39d0f8bba4b4 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -16,6 +16,7 @@
>   #include <linux/mm.h>
>   #include <linux/module.h>
>   #include <linux/irq.h>
> +#include <linux/kexec.h>
>   
>   #include <asm/asm-prototypes.h>
>   #include <asm/bug.h>
> @@ -44,6 +45,9 @@ void die(struct pt_regs *regs, const char *str)
>   
>   	ret = notify_die(DIE_OOPS, str, regs, 0, regs->cause, SIGSEGV);
>   
> +	if (regs && kexec_should_crash(current))
> +		crash_kexec(regs);
> +

It seems that the regs won't be null, right? except that,

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

>   	bust_spinlocks(0);
>   	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
>   	spin_unlock_irq(&die_lock);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
