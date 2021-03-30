Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40154C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 09:21:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5CD76024A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 09:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5CD76024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vG0BCyKlMsf3XY23oNwAkh7D5Gpk7KdjhOTwZ0WSpa4=; b=OHcVnHMpyZng8RHstrf3h8HfK
	GJmuaIqW0XdPQGxldDww0Nc6AgLgvUExVX5vsbYmt0Bk+pg3422uYZPV6h1+iUVlaj0zBRK2NXSED
	0qqxXo6MP7rNtztsTEuiIP3lypmgX/vtcPAj4bKCamOtMqc1wmFh5SL746T1ns79iBVxXDBrZo+FI
	9SS1Ug4eXylz2tPgM46pKeDAmb3xAPVDiX2/2VSjkoSPeLk9hysy8tPpVVuwEwNHTM/VptVt6y2oT
	NvQEDJygZOFSxbjuVCwgmSKBFPLKwU6t8hEKSynmgNH4ZPWW8Gpq373pMhMKZ7SwzX0b8aSaJwyOj
	Ehs4iSQYQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRAYp-003Bn8-B3; Tue, 30 Mar 2021 09:21:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAYk-003Bku-31
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 09:21:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 451A36024A;
 Tue, 30 Mar 2021 09:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617096070;
 bh=4R/2RqA5Y/KuA/x2pUUPA6JHkojRGW/5pd8HtMfeQY4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cy2uNLDJC2WSJyN5Jhbvad2rPcKnpg0I9jfbw3PLlljdmZpPLSILGPwooa2EXBj03
 WjRWby+w3gfdlmyTBktRFaetLTiIVYiLPHBJNAPsUbGYQUUDksWyzIJSCKKOfA+f99
 9D4Y66szN9uxWbtgnVlabzIPI8gUvJn2h8/nC5Z5fiHRvsuYtaq3GbfZVWJWsvwOHK
 HcaLhHA4c7LojzqaOHBAPBdd5fy9U/6d1o00/zSb7dMlii9SA70oytfZQQcbWUY2Ft
 8wPZu/UzuVGTIhOlT04n60C7ewEzzsHUyGatHRedppAAzldHVdEFXzBEblVS0pS5wd
 uEoOlxcERpuQQ==
Date: Tue, 30 Mar 2021 18:21:05 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@linux.alibaba.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: add do_page_fault and do_trap_break into the
 kprobes blacklist
Message-Id: <20210330182105.47a24038fc014ba0dcd917a4@kernel.org>
In-Reply-To: <20210330021226.2fc7b2ec@xhacker>
References: <20210330021226.2fc7b2ec@xhacker>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_102114_353791_E2FDA78D 
X-CRM114-Status: GOOD (  13.46  )
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

On Tue, 30 Mar 2021 02:12:26 +0800
Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:

> From: Jisheng Zhang <jszhang@kernel.org>
> 
> These two functions are used to implement the kprobes feature so they
> can't be kprobed.
> 

Looks good to me.

Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>

Thanks,

> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/traps.c | 1 +
>  arch/riscv/mm/fault.c     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 0879b5df11b9..1357abf79570 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -178,6 +178,7 @@ asmlinkage __visible void do_trap_break(struct pt_regs *regs)
>  	else
>  		die(regs, "Kernel BUG");
>  }
> +NOKPROBE_SYMBOL(do_trap_break);
>  
>  #ifdef CONFIG_GENERIC_BUG
>  int is_valid_bugaddr(unsigned long pc)
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 8f17519208c7..c5dbd55cbf7c 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -328,3 +328,4 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  	}
>  	return;
>  }
> +NOKPROBE_SYMBOL(do_page_fault);
> -- 
> 2.31.0
> 
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
