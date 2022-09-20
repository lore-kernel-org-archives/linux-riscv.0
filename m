Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAB7C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZCWog1bxCLyJAK1iCTzfPnOqsXb2RK5330LmVT9vFAI=; b=TWAiiXPdMNnBO6
	LqxRGFG+gaF7bbavt2LIKYM+ov+j+AwtEimx/mWidHHVqLfbSsE8IcyigJBtFPkXRstI/6fapG84W
	KG4ifMeeiIWIoBzGDlCVtR664AyRWL5PuYy7KwrrkdFlnN9EHmoKSqKutl5OMh3qLBUhqBfxvwnZl
	oHmXpViDsg9nEZ1mfdZXG/rreWDkAkp/va75nUF51ZZDpKR4YiRIvXkE7wpCqGGYStirVAjCzb1QK
	srpXWDfQ6IsRo54gcHvYhJ+xNvQYHgkgOdfEAVKBF4oxWqdfgQwJqGq5Bjz49flkweNnPlUlf/pmt
	Zub9J4gGafx5796kQrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oakvZ-0072wE-Vp; Tue, 20 Sep 2022 21:37:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oakvU-0072qX-E3
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 21:37:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 74C61CE1B84;
	Tue, 20 Sep 2022 21:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8316C433D6;
	Tue, 20 Sep 2022 21:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663709823;
	bh=+xzlRnD5QpYBAQ+VHrXVhtmkLas9IA25UWpJsYQQjMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BgxndjadU8jZNlFqEBkPvqzR2jPDEZEmdD9IoeoTrbZfCzOVtrzjh2FrNqQSbxaW0
	 8J0q3gqQpGCaXuZZSepUSmfuiuSRM2LvMnqINmRvat5FgtGofMXUtFXFxDAGwg+VLo
	 DxQaxzpjPlIqUv62jEsscC45te/40W0fNY2PHY9MjY2eEWKPG18ErHLAWWV7r1lpLY
	 65QBD0L3RG/dGijLYZHdsdeFJm3tR2OntJzLShryaI1eQQ6i8bbITyX7/lFlJdBB5z
	 kX2z2ZzOiZde8aCwMt7lDCMWnExhpPmqalMFt/Me2WK4ckLFWrcox4S+DN8Xg6XcyF
	 eydAFPAYj839g==
Date: Tue, 20 Sep 2022 22:36:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] RISC-V: Avoid dereferening NULL regs in die()
Message-ID: <YyoyewwUNMMUgCru@spud>
References: <20220920200037.6727-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920200037.6727-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_143709_597760_8C5A4CD3 
X-CRM114-Status: GOOD (  23.58  )
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

On Tue, Sep 20, 2022 at 01:00:37PM -0700, Palmer Dabbelt wrote:
> I don't think we can actually die() without a regs pointer, but the
> compiler was warning about a NULL check after a dereference.  It seems
> prudent to just avoid the possibly-NULL dereference, given that when
> die()ing the system is already toast so who knows how we got there.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

I excitedly tried this in the hopes that I was actually hitting this
somehow with the crash-during-boot-with-no-splat that I am currently
bisecting, but sadly it was not the solution.

Either way it looks like a sane change so we at least can get something
out in an edge failure case.

> ---
>  arch/riscv/kernel/traps.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 635e6ec26938..f3e96d60a2ff 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -33,6 +33,7 @@ void die(struct pt_regs *regs, const char *str)
>  {
>  	static int die_counter;
>  	int ret;
> +	long cause;
>  
>  	oops_enter();
>  
> @@ -42,11 +43,13 @@ void die(struct pt_regs *regs, const char *str)
>  
>  	pr_emerg("%s [#%d]\n", str, ++die_counter);
>  	print_modules();
> -	show_regs(regs);
> +	if (regs)
> +		show_regs(regs);
>  
> -	ret = notify_die(DIE_OOPS, str, regs, 0, regs->cause, SIGSEGV);
> +	cause = regs ? regs->cause : -1;
> +	ret = notify_die(DIE_OOPS, str, regs, 0, cause, SIGSEGV);
>  
> -	if (regs && kexec_should_crash(current))
> +	if (kexec_should_crash(current))
>  		crash_kexec(regs);

Had to go down the rabbit hole to see that there is an if(regs) around
the eventual user of this, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>  
>  	bust_spinlocks(0);
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
