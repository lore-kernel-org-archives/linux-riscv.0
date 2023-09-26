Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49446E7E62A
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvqS+XPDjOp69Hb/YReD0YKvVjjKJ0bCkoMmRd2c4IM=; b=oJdcLUsXsvRK8U
	YjLZx+kjSxZ/asQHpB+nLtQjAnXAV4B08mBuugsmE87u0Lcti6r1+97zoJkPpd7Q007SPdLcoTLz4
	8lX3/Sutw8NN/no7r7M1RUvMNIx/bM+VnbTqNl4yvP6N7JyJajOMVXnM5+d6m6lxfyNcV8bO+2RFp
	k1EbsfKxC974ICHQGafC2v1sybR/K11+wJAwxSNEBly9NDRmaValpoQKZL8+iZmak/kemJ4qBZqXD
	s8DnIDwhUijl6s9o41hDT9SIX2AL5+VUL0Vmm3QiwwpSQdHaDs0hHa4uJ0AFtqSTlV/mHEGr9X0Eg
	jyDac9YmzXf+C3ix/FnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6ZM-00GIVx-1v;
	Tue, 26 Sep 2023 11:49:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6ZI-00GIVG-38
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 11:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE15F6144C;
	Tue, 26 Sep 2023 11:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDFEC433C9;
	Tue, 26 Sep 2023 11:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695728971;
	bh=BDIUttsZQQFkLvxRNL0OyVkQfC2FmRbuUcsXNdRp1pY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kW0wi9LEkIMVJnvXmXp+torrf3YvFpAzeV7qP8iLknnUYyG3mXazThOmML5lS+zg5
	 deyni9oM3UNTFP71+6qqIheiTpN2SKneXqjLO6TQ2vvn+eyLvzkEI953nC2qXEQt+I
	 dR+tZnHfXMfwDhD4DJ92hqFzCS7BoixKb8h7RHeQ=
Date: Tue, 26 Sep 2023 13:49:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Edward AD <twuufnxlz@gmail.com>
Cc: conor@kernel.org, syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com,
	jirislaby@kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	guoren@kernel.org, alexghiti@rivosinc.com, liushixin2@huawei.com,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: fix out of bounds in walk_stackframe
Message-ID: <2023092617-polish-modify-3acb@gregkh>
References: <0000000000000170df0605ccf91a@google.com>
 <20230926114343.1061739-2-twuufnxlz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230926114343.1061739-2-twuufnxlz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_044933_052088_5792EC46 
X-CRM114-Status: GOOD (  22.72  )
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

On Tue, Sep 26, 2023 at 07:43:44PM +0800, Edward AD wrote:
> Increase the check on the frame after assigning its value. This is to prevent 
> frame access from crossing boundaries.
> 
> Closes: https://lore.kernel.org/all/20230926105949.1025995-2-twuufnxlz@gmail.com/
> Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
> Reported-and-tested-by: syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/0000000000000170df0605ccf91a@google.com/T/
> Signed-off-by: Edward AD <twuufnxlz@gmail.com>
> ---
>  arch/riscv/kernel/stacktrace.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 64a9c093aef9..53bd18672329 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -54,6 +54,8 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  			break;
>  		/* Unwind stack frame */
>  		frame = (struct stackframe *)fp - 1;
> +		if (!virt_addr_valid(frame))
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
