Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3E4C0218C
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jan 2025 23:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+k+ayeHjWyO3NdNb6kfCw3KYLz2utbEL5Ua4FloULs=; b=dWtCGepZU4NbKn
	a2P1QrFZXz9z62AYXk31GRgdm0kexi/OIErG3v4IcOfVYBH9s/5I/9D+uMDijZree4SyDW/FQ98kk
	wnv4aylb4G9pl2UBNfVVYq3SjKnLwLIaZSGJONY64BW8FdTUBN22g93iRfKYEM5YXPjDDVtM230o0
	Q7G/icr759gET8WiASDIczJWXJH4cLSXJsJeFCcekqalzpVk8wGDIL+pbrYvDBoqiRvclrQSadXo9
	npnYhV47dPiiAQon0l3Hwz3SuPAlGs2QG0Rx/7dGm/Xpo5BS4AbZhLJBsufqtny+A9xXClGNIf9A3
	Q5hsNvzdVnsrxP8L7hwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbpbY-0000000GypC-1Png;
	Sat, 25 Jan 2025 23:30:20 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbpbU-0000000Gyoa-380y
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jan 2025 23:30:18 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 63B2D92009C; Sun, 26 Jan 2025 00:30:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 564F092009B;
	Sat, 25 Jan 2025 23:30:09 +0000 (GMT)
Date: Sat, 25 Jan 2025 23:30:09 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Charlie Jenkins <charlie@rivosinc.com>
cc: Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
    WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
In-Reply-To: <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
Message-ID: <alpine.DEB.2.21.2501252313210.27203@angie.orcam.me.uk>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com> <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_153016_965833_8ACE397A 
X-CRM114-Status: GOOD (  10.10  )
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

On Wed, 22 Jan 2025, Charlie Jenkins wrote:

> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..9225c322279aa90e737b1d7144db084319cf8103 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -319,17 +319,14 @@ SYM_CODE_END(handle_kernel_stack_overflow)
>  ASM_NOKPROBE(handle_kernel_stack_overflow)
>  #endif
>  
> -SYM_CODE_START(ret_from_fork)
> +SYM_CODE_START(ret_from_fork_asm)
>  	call schedule_tail
> -	beqz s0, 1f	/* not from kernel thread */
> -	/* Call fn(arg) */
> -	move a0, s1
> -	jalr s0
> -1:
> -	move a0, sp /* pt_regs */
> -	call syscall_exit_to_user_mode
> +	move a0, s1 /* fn */
> +	move a1, s0 /* fn_arg */
> +	move a2, sp /* pt_regs */
> +	call ret_from_fork
>  	j ret_from_exception

 Wouldn't it make sense to save a jump here and make it a tail call, i.e.:

	la ra, ret_from_exception
	tail ret_from_fork

?

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
