Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B191C5AC67
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 01:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YooGSbnPa3xWiPk5MzfA3y/8sdWrQKtDl3+M9B8VXhc=; b=us9Xct224Gk8rd
	6Gff/6Dta1JXj0s29Ho2a9WogOIasJ8gR/ENDbLaXYqdmCGyoQGJD1dcfNoFU8Pz3ZViQGp9OUYAf
	i525ok3rgXwEMcm8j/lZsLBMhBygrUuOY4ZRAF+oz6NmIOOHx9Dn9qBjXSUtiU2PCz7OV0xtgJ/lU
	8GI1Zc4ElhuUS/wPttKGmvIXZ+zhbqE+X652peBiLZk/4KWZwWYmzcIFOULfjCqB7krtsavj+v8/Q
	8ZEYrXY2y6T/rzTvsgUjdFcasqiZ8p5PwzYj2V/4E2exqt5JZQlOTVc6CULSI+VlzD4kJnebHLQD+
	MMYoe16KEoVnIerDYsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9Ar-00000006vVX-3lVr;
	Fri, 07 Aug 2026 01:15:01 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9Ao-00000006vTu-2NfQ
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 01:15:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bCi+eyrfOafLkWxzoWjEhXktdsApkRYiw013NIAHLPc=;
	b=PSczosM91C3apx3C6/XugiUh86f3tKytvd7DaeE5ubnTWaRB4OU7ZsABk/Xxea/ChmI0OZvAb
	BCo3cFk86D5+6x7pNugXDhZ2sMhD/h/Ce0iwlvC9I28Rpvm2c09QWJqLOzQcYqt1WxuPGusHad3
	MAvEpld7LYCt3+M5yJehuy8=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hGQsB4YDqz1cyPY;
	Fri,  7 Aug 2026 09:04:14 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 813204058A;
	Fri,  7 Aug 2026 09:14:47 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 7 Aug
 2026 09:14:46 +0800
Message-ID: <10c318aa-5158-4c12-9607-4a8a1aee84d7@huawei.com>
Date: Fri, 7 Aug 2026 09:14:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: ftrace: Fix ftrace_modify_call failure on kprobed
 functions
Content-Language: en-US
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Steven Rostedt
	<rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, Pu Lehui <pulehui@huaweicloud.com>
References: <20260802094929.3978390-1-pulehui@huaweicloud.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260802094929.3978390-1-pulehui@huaweicloud.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_181459_265099_6373216A 
X-CRM114-Status: GOOD (  17.35  )
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

Gentle ping~

Hi all, Is this commit looks proper?

On 2026/8/2 17:49, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> We are frequently hitting the following splat during the riscv bpf
> selftests:
> 
> 00000000026dc75a: expected (7c3ff297) but got (00100073)
> ------------[ ftrace bug ]------------
> ftrace failed to modify
> [<ffffffff03c44c1c>] bpf_kfunc_common_test+0x4/0x20 [bpf_testmod]
>   actual:   e7:82:c2:ce
> Updating ftrace call site to call a different ftrace function
> ftrace record flags: 80100002
>   (2)
>   expected tramp: ffffffff80043904
> ------------[ cut here ]------------
> WARNING: kernel/trace/ftrace.c:2278 at ftrace_bug+0x46e/0x4b0, CPU#1: test_progs/98
> ...
> [<ffffffff80008f4e>] ftrace_bug+0x46e/0x4b0
> [<ffffffff803d3e86>] ftrace_replace_code+0x16e/0x170
> [<ffffffff803d42b6>] ftrace_modify_all_code+0x12e/0x1b8
> [<ffffffff800430f4>] arch_ftrace_update_code+0x14/0x28
> [<ffffffff803e0324>] ftrace_startup+0x14c/0x2a0
> [<ffffffff803e133c>] ftrace_startup_subops+0x584/0x1050
> [<ffffffff804500e6>] register_ftrace_graph+0x4e6/0x1018
> [<ffffffff804cf9f6>] register_fprobe_ips+0xc66/0x12f8
> [<ffffffff8049abe8>] bpf_kprobe_multi_link_attach+0x5d8/0xe68
> [<ffffffff8050fcaa>] __sys_bpf+0x3d5a/0x47f0
> [<ffffffff805107ee>] __riscv_sys_bpf+0xae/0x168
> [<ffffffff80034d78>] syscall_handler+0x60/0x100
> [<ffffffff8228b4f4>] do_trap_ecall_u+0x174/0x208
> [<ffffffff822b69c4>] handle_exception+0x16c/0x178
> 
> After debugging, it can be triggered by similar commands below:
> ```
> echo do_nanosleep > set_ftrace_filter
> echo function > current_tracer
> echo 'p do_nanosleep' > kprobe_events
> echo 1 > events/kprobes/enable
> echo 'f do_nanosleep' > dynamic_events
> echo 1 > events/fprobes/enable
> ```
> 
> The reason is that attaching a kprobe to an ftrace-traced function entry
> replaces its initial auipc insn with ebreak. When ftrace_modify_call
> later runs, it expects auipc insn, so verification fails and triggers
> ftrace_bug.
> 
> The expected auipc logic remains conceptually unchanged, and kprobe
> single-stepping ensures normal execution. Therefore, if the first insn
> is ebreak, bypassing the check to continue patching the jalr insn is
> safe and avoids ftrace failures.
> 
> Fixes: b2137c3b6d7a ("riscv: ftrace: prepare ftrace for atomic code patching")
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   arch/riscv/kernel/ftrace.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index b430edfb83f4..be8b68514417 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -12,6 +12,7 @@
>   #include <linux/stop_machine.h>
>   #include <asm/cacheflush.h>
>   #include <asm/text-patching.h>
> +#include <asm/insn.h>
>   
>   #ifdef CONFIG_DYNAMIC_FTRACE
>   void ftrace_arch_code_modify_prepare(void)
> @@ -63,7 +64,9 @@ static int __ftrace_modify_call(unsigned long source, unsigned long target, bool
>   		if (copy_from_kernel_nofault(replaced, (void *)source, 2 * MCOUNT_INSN_SIZE))
>   			return -EFAULT;
>   
> -		if (replaced[0] != call[0]) {
> +		/* Bypass the check if the auipc insn is a kprobe breakpoint */
> +		if (replaced[0] != call[0] &&
> +		    !(riscv_insn_is_ebreak(replaced[0]) || riscv_insn_is_c_ebreak(replaced[0]))) {
>   			pr_err("%p: expected (%08x) but got (%08x)\n",
>   			       (void *)source, call[0], replaced[0]);
>   			return -EINVAL;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
