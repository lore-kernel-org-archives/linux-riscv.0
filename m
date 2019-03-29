Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E8FC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 17:15:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D636F2183F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 17:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lUq3YyAF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D636F2183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+W1tR/5spaaPd2mUqZtynT0D0SdHyI6hD3phMBiIbaU=; b=lUq3YyAFoiVubQ
	gKv9Bkv74NSY0oTIPoxSvt/ZhzyW7yS0U9m7OLTmrGzGGB7NykAwr4AaoNfyOcXD8466EuU50P5M2
	RQPjeVdzsKmkYhihIqHNrX4Pv5FD6LLBgWL/8b292uoRL7k1fwGb2PYkjZmvGXpaq5V/lCUC66wcw
	2iPHbolIsownim1OM0LrXHjM5qZ5NHb/psHr+mSwdTmgUl3F97if9FLbYBUocwFZA0McwIpfnbsvl
	7uZLEiZge7MpyqwgkGz7B3v9gI13xcfQnw+reNNbo3No8cBWpdgROKjJr9kxzIZFZAAgwD5G4orMb
	17rB6GBIIOF3YFd5CXag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9v69-0003Bv-EE; Fri, 29 Mar 2019 17:15:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9v66-0003BR-IG
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 17:15:20 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37D23218A2;
 Fri, 29 Mar 2019 17:15:17 +0000 (UTC)
Date: Fri, 29 Mar 2019 13:15:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: [PATCH] riscv: fix syscall_get_arguments() and
 syscall_set_arguments()
Message-ID: <20190329131514.3e4ec93e@gandalf.local.home>
In-Reply-To: <20190329171221.GA32456@altlinux.org>
References: <20190329171221.GA32456@altlinux.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_101518_620108_ABE70921 
X-CRM114-Status: GOOD (  15.33  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 29 Mar 2019 20:12:21 +0300
"Dmitry V. Levin" <ldv@altlinux.org> wrote:

> RISC-V syscall arguments are located in orig_a0,a1..a5 fields
> of struct pt_regs.
> 
> Due to an off-by-one bug and a bug in pointer arithmetic
> syscall_get_arguments() was reading s3..s7 fields instead of a1..a5.
> Likewise, syscall_set_arguments() was writing s3..s7 fields
> instead of a1..a5.

Should I add this to my series? And then rebase on top of it?

-- Steve

> 
> Fixes: e2c0cdfba7f69 ("RISC-V: User-facing API")
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Andy Lutomirski <luto@amacapital.net>
> Cc: Will Drewry <wad@chromium.org>
> Cc: linux-riscv@lists.infradead.org
> Cc: stable@vger.kernel.org # v4.15+
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> ---
>  arch/riscv/include/asm/syscall.h | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index bba3da6ef157..6ea9e1804233 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -79,10 +79,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	if (i == 0) {
>  		args[0] = regs->orig_a0;
>  		args++;
> -		i++;
>  		n--;
> +	} else {
> +		i--;
>  	}
> -	memcpy(args, &regs->a1 + i * sizeof(regs->a1), n * sizeof(args[0]));
> +	memcpy(args, &regs->a1 + i, n * sizeof(args[0]));
>  }
>  
>  static inline void syscall_set_arguments(struct task_struct *task,
> @@ -94,10 +95,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
>          if (i == 0) {
>                  regs->orig_a0 = args[0];
>                  args++;
> -                i++;
>                  n--;
> -        }
> -	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
> +	} else {
> +		i--;
> +	}
> +	memcpy(&regs->a1 + i, args, n * sizeof(regs->a1));
>  }
>  
>  static inline int syscall_get_arch(void)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
