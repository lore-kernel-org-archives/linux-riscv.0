Return-Path: <SRS0=Oyqu=FB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46644C63777
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2020 11:43:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A424206D8
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2020 11:43:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lKcuVW0Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A424206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YOWVNmRp7t4F3tHQ9vrZIS0REgzFjk0FfjiLppRNWyc=; b=lKcuVW0QeddBCmGotpK60fUJQ
	pxtn9YR9UQps8RKfZmXKH+lDHoeffXOsSDLdaiRDY1YnSDzFlhNII2SOobdjlSpegjOYS4HscfSWh
	hqHxIMoLpq+pJmYjkyRbKQrER5yhUWg1YHqHdHEHAf1g2rv1+fq2ZLY/1+qSXmh9WPlbrKL9E+6Ph
	TraJUH7LZQtb0l7Bp98U+1d7HQvAU9G4vQQgTb24e7eOBMmRW7pdq24rqViCe/iuFKo5lSI/LRG8A
	t2j872Rgpz0kpXhJP0YP1elgREhXxztZvYJIjcDSpEnTVSZz4Tnwk/MWBWKWbbLSzunBFtKF7cm8S
	KRMpvn/Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kicA7-0004XZ-La; Fri, 27 Nov 2020 11:43:39 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kicA3-0004Wb-TL
 for linux-riscv@lists.infradead.org; Fri, 27 Nov 2020 11:43:37 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CjCRt59xFz74mm;
 Fri, 27 Nov 2020 19:43:06 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Nov 2020 19:43:20 +0800
Subject: Re: [PATCH] riscv/stacktrace: fix stackframe without ra on the top
To: Chen Huang <chenhuang5@huawei.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
References: <20201127084502.2133722-1-chenhuang5@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <22dbe32a-0757-97ad-8885-0f2ba55bb743@huawei.com>
Date: Fri, 27 Nov 2020 19:43:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201127084502.2133722-1-chenhuang5@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_064336_753833_FBF4ED1D 
X-CRM114-Status: GOOD (  16.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2020/11/27 16:45, Chen Huang wrote:
> When a function doesn't have a callee, then it will not push ra
> into the stack, such as lkdtm_BUG() function:
>
> addi	sp,sp,-16
> sd	s0,8(sp)
> addi	s0,sp,16
> ebreak
>
> Then we use pt_regs as a parameter to walk_stackframe(), for the
> struct stackframe use {fp,ra} to get information from stack, it
> will get the wrong value. And the call trace will be:
>
> [<ffffffe00066c56c>] lkdtm_BUG+0x6/0x8
> ---[ end trace 18da3fbdf08e25d5 ]---
>
> It should be that:
> [<ffffffe00066c56c>] lkdtm_BUG+0x6/0x8
> [<ffffffe0008b24a4>] lkdtm_do_action+0x14/0x1c
> [<ffffffe00066c372>] direct_entry+0xc0/0x10a
> [<ffffffe000439f86>] full_proxy_write+0x42/0x6a
> [<ffffffe000309626>] vfs_write+0x7e/0x214
> [<ffffffe00030992a>] ksys_write+0x98/0xc0
> [<ffffffe000309960>] sys_write+0xe/0x16
> [<ffffffe0002014bc>] ret_from_syscall+0x0/0x2
> ---[ end trace 61917f3d9a9fadcd ]---
>
> Signed-off-by: Chen Huang <chenhuang5@huawei.com>
> ---
>   arch/riscv/kernel/stacktrace.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 595342910c3f..d1d4c18335c4 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -57,7 +57,14 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>   		/* Unwind stack frame */
>   		frame = (struct stackframe *)fp - 1;
>   		sp = fp;
> -		fp = frame->fp;
> +		if (regs && (frame->fp & 0x7) && (pc == regs->epc)) {
> +			fp = frame->ra;
> +			pc = regs->ra;
> +			continue;
> +		} else {
> +			fp = frame->fp;
> +		}
> +
>   		pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
>   					   (unsigned long *)(fp - 8));

Better to move above code into else branch

>   	}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
