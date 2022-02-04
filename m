Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE84C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 21:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=WXTWRqTMUUBePGh2m1VsK42KJUdQVbI9H2MaIPSGD6U=; b=DV0/V+hgtwFHDAp/X+I96cdpwU
	Wymj//XbwEe6qpcTf3f1DSbkNbFTEAvGuimWoOM0pyxOi1iriQjxK21au2IX+K2GNrtfoLztluWJh
	RVur91bZ8FN9MgVLaOkEASsiXlNZUjBVC3rR6JqtOx4gp3PEich0l95JzsrWMOAHHtWb6yFFf2K+E
	pcS5NQNPvKCW+5F3Z+27FoG1Dizfi7dSNP74L+1KC8VNGHQW6HNMUugg3uCVdf68RHjdfTL97vUwq
	SbM4QIz/RFnEKYeccoHSsCqrULMnqVB5NhNL/yvDbIdBQkuLPpLPX5DL7RwemdnJe4n0NCqDu/sVe
	/RxKqESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG6ZH-005VA6-Cr; Fri, 04 Feb 2022 21:56:35 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG6ZE-005V9f-QG
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 21:56:34 +0000
Received: by mail-pf1-x434.google.com with SMTP id e6so6193171pfc.7
 for <linux-riscv@lists.infradead.org>; Fri, 04 Feb 2022 13:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=sVAEL1/KJCwmGYaCcxXp2lw6FUwS8oapDcHjiQKyg4c=;
 b=J9NvrugY0fz1DaakFJ4iHmhLh/ojYJfV5zisnlvURW1KHFAxEL1BhO2+aowxIQnCWu
 VgPOiSIbHTRKGPbsLTYMCwu8uh27U8nLaeDLVgKzGCNfGPAsXmzCYa/FR+nlDt07WSPI
 EMrt3zqDok7jlkMuOLXLRworjDROFPdH871/t0xLczY4aseEj5MXZGpPGa0T7veMqZE1
 Yx8EIWGr3K/1fejW5ECj9sV4KeMNngbFVR2Ck5aTXCkPfiZYblw+FEHoSKlrjGBxL/Y4
 T4JYjOA5tLnsAcs1yW8vEh8N/08TW5S1RUEsMTGlPsyms2W+qjjG0lP6ieUK7z8RxU4I
 wBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sVAEL1/KJCwmGYaCcxXp2lw6FUwS8oapDcHjiQKyg4c=;
 b=X6CG3e14yGJOc7vZR0HRDbWbmTZ+b10rJ2uDFsrOTXXBl0rLrhVlCGlhQIGkzJNGPv
 98tHdyOkKMOp8nCVF+v/9Cu8oXCjCQpRYsyNIst9Kmoj8j4OOCxLW7rotFM+FtHH3mbN
 hHxvi9pO7p7Ep79c98wmoDeylyll+MrWlBzaTckrMLwSwgNCcQ/1c7Lhj8lW5vStL3E0
 /QgY6Ip+218AQe0DaaDc2Y3XlneGtzmNepmHPrMlNQjY5FvX1sYI2o1lv4vF22ZsSDiP
 zZgp7v8sNP1p3THCEGqX7wkPm840bd0ZxF85sa3BtiWESN8W8ht1l7PwOKMHvNVi/5d7
 hW+A==
X-Gm-Message-State: AOAM531a/mfvEYfI/73SUX0yjU39DmpkoIBtg2DcE1Lx0M4GIyTsSEmi
 zJWO4HTB2ZfYcvj8lHdyauq0nw==
X-Google-Smtp-Source: ABdhPJwe8Cvsry9jnU9HSb0f+++KvGO+SPPNWTtcj4zbO/vScOO1egXVBXfqsW5oYRCTK+y5lX+PCA==
X-Received: by 2002:a63:6cc9:: with SMTP id h192mr821263pgc.486.1644011791772; 
 Fri, 04 Feb 2022 13:56:31 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id mn2sm3071827pjb.38.2022.02.04.13.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 13:56:31 -0800 (PST)
Date: Fri, 04 Feb 2022 13:56:31 -0800 (PST)
X-Google-Original-Date: Fri, 04 Feb 2022 13:56:04 PST (-0800)
Subject: Re: [PATCH] riscv: eliminate unreliable __builtin_frame_address(1)
In-Reply-To: <20220117154433.3124-1-changbin.du@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 changbin.du@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: changbin.du@gmail.com
Message-ID: <mhng-43e63f81-4c9c-4ffa-b514-b418d21b69d4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_135632_901158_2EFB70D5 
X-CRM114-Status: GOOD (  29.31  )
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

On Mon, 17 Jan 2022 07:44:33 PST (-0800), changbin.du@gmail.com wrote:
> I tried different pieces of code which uses __builtin_frame_address(1)
> (with both gcc version 7.5.0 and 10.3.0) to verify whether it works as
> expected on riscv64. The result is negative.
>
> What the compiler had generated is as below:
> 31                      fp = (unsigned long)__builtin_frame_address(1);
>    0xffffffff80006024 <+200>:   ld      s1,0(s0)
>
> It takes '0(s0)' as the address of frame 1 (caller), but the actual address
> should be '-16(s0)'.
>
>           |       ...       | <-+
>           +-----------------+   |
>           | return address  |   |
>           | previous fp     |   |
>           | saved registers |   |
>           | local variables |   |
>   $fp --> |       ...       |   |
>           +-----------------+   |
>           | return address  |   |
>           | previous fp --------+
>           | saved registers |
>   $sp --> | local variables |
>           +-----------------+
>
> This leads the kernel can not dump the full stack trace on riscv.
>
> [    7.222126][    T1] Call Trace:
> [    7.222804][    T1] [<ffffffff80006058>] dump_backtrace+0x2c/0x3a
>
> This problem is not exposed on most riscv builds just because the '0(s0)'
> occasionally is the address frame 2 (caller's caller), if only ra and fp
> are stored in frame 1 (caller).
>
>           |       ...       | <-+
>           +-----------------+   |
>           | return address  |   |
>   $fp --> | previous fp     |   |
>           +-----------------+   |
>           | return address  |   |
>           | previous fp --------+
>           | saved registers |
>   $sp --> | local variables |
>           +-----------------+
>
> This could be a *bug* of gcc that should be fixed. But as noted in gcc
> manual "Calling this function with a nonzero argument can have
> unpredictable effects, including crashing the calling program.", let's
> remove the '__builtin_frame_address(1)' in backtrace code.
>
> With this fix now it can show full stack trace:
> [   10.444838][    T1] Call Trace:
> [   10.446199][    T1] [<ffffffff8000606c>] dump_backtrace+0x2c/0x3a
> [   10.447711][    T1] [<ffffffff800060ac>] show_stack+0x32/0x3e
> [   10.448710][    T1] [<ffffffff80a005c0>] dump_stack_lvl+0x58/0x7a
> [   10.449941][    T1] [<ffffffff80a005f6>] dump_stack+0x14/0x1c
> [   10.450929][    T1] [<ffffffff804c04ee>] ubsan_epilogue+0x10/0x5a
> [   10.451869][    T1] [<ffffffff804c092e>] __ubsan_handle_load_invalid_value+0x6c/0x78
> [   10.453049][    T1] [<ffffffff8018f834>] __pagevec_release+0x62/0x64
> [   10.455476][    T1] [<ffffffff80190830>] truncate_inode_pages_range+0x132/0x5be
> [   10.456798][    T1] [<ffffffff80190ce0>] truncate_inode_pages+0x24/0x30
> [   10.457853][    T1] [<ffffffff8045bb04>] kill_bdev+0x32/0x3c
> ...
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  arch/riscv/kernel/stacktrace.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 201ee206fb57..14d2b53ec322 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -22,15 +22,16 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  			     bool (*fn)(void *, unsigned long), void *arg)
>  {
>  	unsigned long fp, sp, pc;
> +	int level = 0;
>
>  	if (regs) {
>  		fp = frame_pointer(regs);
>  		sp = user_stack_pointer(regs);
>  		pc = instruction_pointer(regs);
>  	} else if (task == NULL || task == current) {
> -		fp = (unsigned long)__builtin_frame_address(1);
> -		sp = (unsigned long)__builtin_frame_address(0);
> -		pc = (unsigned long)__builtin_return_address(0);
> +		fp = (unsigned long)__builtin_frame_address(0);
> +		sp = sp_in_global;
> +		pc = (unsigned long)walk_stackframe;
>  	} else {
>  		/* task blocked in __switch_to */
>  		fp = task->thread.s[0];
> @@ -42,7 +43,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  		unsigned long low, high;
>  		struct stackframe *frame;
>
> -		if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
> +		if (unlikely(!__kernel_text_address(pc) || (level++ >= 1 && !fn(arg, pc))))
>  			break;
>
>  		/* Validate frame pointer */

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
