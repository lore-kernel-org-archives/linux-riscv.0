Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62FDE743ED
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hCgxZI2Vvybsqi6w4GJV4j3qDSG/O0nQteNd3sdrC+8=; b=gMwnCWg1nZ2hl1
	C8bsZilF78xnwcVHNi66PoatjS6eFJst5gg4CL3at5UQku4fbfDCfcGOAFS1LW9PToj4GKGG7FOMy
	H1R3Fu8rTzve9hhQ4NV14DCJIf82GuZDtBr4WO7BEHXnm7sycZDD36xP7MP0cWhwiJL+aU7jCw8O+
	grDM+uuH7lNjxhIv2O2Anre2tfZ+1xv73SeDh3onLU6Ugj+8UOVnKAT8lsov0FL9/aazCLPqybqjM
	aoEV7oSVgAwghAoj3/2c9AFJNL12hmYKm5pGiHSMQrCWIPBcGWEjonthRK/7esOKognhkGLz65F4M
	9gxNsn2Qud4umN5fVX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm6d7-007EIx-2w;
	Fri, 29 Sep 2023 06:05:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm6d5-007EIW-0a
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 06:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D7AB6B81E0B;
	Fri, 29 Sep 2023 06:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895CBC433C9;
	Fri, 29 Sep 2023 06:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695967533;
	bh=ApOaP/9oDp2rTN1MoBE5BwHQoNPxIFZOt3ooiC/inEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bj2RVsFRjqIrzSw1UWOT77b0SUWLKRghuoHYc/LJkFyuxYQVcBkatPheuVq18y/Jc
	 nkbREEB5jsx8AAW4g6M7mbMKp0FHO0/Z1w4jLZ9nZelNp9z6lX01GcHsI6sGbCHN3q
	 2EiVWKFdzMkCx8/rQSDwWOKs014FI+QVSjXI+dCs=
Date: Fri, 29 Sep 2023 08:05:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Edward AD <twuufnxlz@gmail.com>
Cc: alex@ghiti.fr, alexghiti@rivosinc.com, aou@eecs.berkeley.edu,
	conor@kernel.org, guoren@kernel.org, jirislaby@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, liushixin2@huawei.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] riscv: fix out of bounds in walk_stackframe
Message-ID: <2023092907-anybody-irregular-a30e@gregkh>
References: <f74665d1-4d28-01a2-5694-b06fde202d39@ghiti.fr>
 <20230928231239.2144579-2-twuufnxlz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928231239.2144579-2-twuufnxlz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_230535_486531_B9210A8E 
X-CRM114-Status: GOOD (  22.43  )
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

On Fri, Sep 29, 2023 at 07:12:40AM +0800, Edward AD wrote:
> Add vmalloc and kernel addresses check to prevent invalid access.
> 
> Closes: https://lore.kernel.org/all/20230926105949.1025995-2-twuufnxlz@gmail.com/
> Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
> Reported-and-test-by: syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/0000000000000170df0605ccf91a@google.com/T/
> Signed-off-by: Edward AD <twuufnxlz@gmail.com>
> ---
>  arch/riscv/kernel/stacktrace.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 64a9c093aef9..031a4a35c1d0 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -54,6 +54,9 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  			break;
>  		/* Unwind stack frame */
>  		frame = (struct stackframe *)fp - 1;
> +		if ((is_vmalloc_addr(frame) && !pfn_valid(page_to_pfn(vmalloc_to_page(frame)))) || 
> +		     !virt_addr_valid(frame))
> +			break;
>  		sp = fp;
>  		if (regs && (regs->epc == pc) && (frame->fp & 0x7)) {
>  			fp = frame->ra;
> -- 
> 2.25.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch contains warnings and/or errors noticed by the
  scripts/checkpatch.pl tool.

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documetnation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
