Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC63D41C1E
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 09:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbiBkttKxH7g30EHi324krj/b0hs07ozQF6+cav6co4=; b=mTvjYo4tReU7M4
	DItC+geYugh20UYBUV0U4GgEIUz50gOM+j//8jjgBe91M3tavccO7fx+bAWrut57j6QhMbwtzdHhC
	6/O77oOZshv01im46sO2xP1zV1sI2rj9Ze2D20IYUb1AB8K4XRDV1v9oDMahQjWd1wC1o7O/f3OTi
	ae3oyd8/4h0lgQEFcthVzb1qFBsjSicnd9y3Qc0p9KzJC840uKFvtpwDW3bDm0IekMRuFz22vnhvw
	iXl7foij1n/5EQuWaRj7/wSmhUndoi74Rx2Ox0Ynwg2Oa0MkqkA0mosSqnlJ+R/a4pzOWDRVG/UvT
	MZ7dJuLhl6k9tRF9io/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9ZT-00000006EFR-49jD;
	Wed, 13 Nov 2024 09:21:55 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9ZQ-00000006ECn-3VQk
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 09:21:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hBI9I71xjbccnvxI+0pJNoiS07n+0Eec1yG0dvS/NQI=; b=WdfBY/Pno7ZO02sAut/v60vBkU
	ZdxPp/7W4YzZOwoMiarAJgWTuLwDwMPz5YQOgTMhuzak5yPeQwmKKE9PQoApLimIosuDjjpjVGDTR
	5taGBeAm9I/jSxNQZ0WOc2f7EcxxuQyDTpjKg1pItxHdM/TFs7WMd6jn8W3Z0RSOOATJbqTm9IEk5
	Qf8RH5lRkEEpzQxPZ58ftyF1Li/q4z/rArCVpSwKsRSHHCK099ez2rxNzDHSS6s18jOYpIwYSJhUu
	1Uzc9h3nt5BK7Ey9JEWTscLugpfgV/pS6S0SworpDxipn/zPENGhmxQkuMpKjUsPpWka9Zp5WkXNt
	Evulw0DQ==;
Received: from [63.135.74.212] (helo=[192.168.1.184])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tB9ZL-003uyD-SV; Wed, 13 Nov 2024 09:21:48 +0000
Message-ID: <45408e3d-5b7a-40cc-bfca-b58cf3737c9c@codethink.co.uk>
Date: Wed, 13 Nov 2024 09:21:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: traps: make insn fetch common in unknown
 instruction
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, ajones@ventanamicro.com, alex@ghiti.fr
References: <20241113091703.3133017-1-ben.dooks@codethink.co.uk>
 <20241113091703.3133017-3-ben.dooks@codethink.co.uk>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20241113091703.3133017-3-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_012152_935709_E62B084E 
X-CRM114-Status: GOOD (  18.17  )
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

On 13/11/2024 09:17, Ben Dooks wrote:
> Add the trapped instruction (insn) as the second argument to
> riscv_v_first_use_handler() from the trap handler so when we
> add more handlers we can do the fetch of the instruction just
> once.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> - fixed wording of patch from rfc
> ---
>   arch/riscv/include/asm/vector.h |  4 ++--
>   arch/riscv/kernel/traps.c       | 11 ++++++++++-
>   arch/riscv/kernel/vector.c      | 11 +----------
>   3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index be7d309cca8a..c9f0b02cd975 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -21,7 +21,7 @@
>   
>   extern unsigned long riscv_v_vsize;
>   int riscv_v_setup_vsize(void);
> -bool riscv_v_first_use_handler(struct pt_regs *regs);
> +bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn);
>   void kernel_vector_begin(void);
>   void kernel_vector_end(void);
>   void get_cpu_vector_context(void);
> @@ -268,7 +268,7 @@ struct pt_regs;
>   
>   static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
>   static __always_inline bool has_vector(void) { return false; }
> -static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
> +static inline bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn) { return false; }
>   static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
>   static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
>   #define riscv_v_vsize (0)
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 51ebfd23e007..1c3fab272fd1 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -172,11 +172,20 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
>   	bool handled;
>   
>   	if (user_mode(regs)) {
> +		u32 __user *epc = (u32 __user *)regs->epc;
> +		u32 insn = (u32)regs->badaddr;
> +
>   		irqentry_enter_from_user_mode(regs);
>   
>   		local_irq_enable();
>   
> -		handled = riscv_v_first_use_handler(regs);
> +		if (!insn) {
> +			if (__get_user(insn, epc)) {
> +				/* todo */
> +			}

grr, of course as soon as it is sent I notice the /todo/ here

Not sure if we should print something if __get_user() fails for
what /should/ be an good instruction addrss.... should probably
at-least bail out of do_trap_insn_illegal() if not also print a
warning.

> +		}
> +
> +		handled = riscv_v_first_use_handler(regs, insn);
>   
>   		local_irq_disable();
>   
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 682b3feee451..b852648cb8d5 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -168,11 +168,8 @@ bool riscv_v_vstate_ctrl_user_allowed(void)
>   }
>   EXPORT_SYMBOL_GPL(riscv_v_vstate_ctrl_user_allowed);
>   
> -bool riscv_v_first_use_handler(struct pt_regs *regs)
> +bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn)
>   {
> -	u32 __user *epc = (u32 __user *)regs->epc;
> -	u32 insn = (u32)regs->badaddr;
> -
>   	if (!has_vector())
>   		return false;
>   
> @@ -184,12 +181,6 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
>   	if (riscv_v_vstate_query(regs))
>   		return false;
>   
> -	/* Get the instruction */
> -	if (!insn) {
> -		if (__get_user(insn, epc))
> -			return false;
> -	}
> -
>   	/* Filter out non-V instructions */
>   	if (!insn_is_vector(insn))
>   		return false;


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
