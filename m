Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A678ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Oct 2022 19:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdalczoFvPdSeceTGtKDp3/4zzAImOvXGv/d3X3EwB4=; b=EbKasmnLov566h
	KdHrv5M2pGBtRdQF8V92y7qkvV7jfbkDG/tGIDCEPMG/q85JeDWhVy77UHy1d+paIGeNES/C4+MaK
	wP/IyB4tiKAXGKFnRnaIAA/659pwL4JOMXLoB8PcKSgH3i50qwlFVhj4Xx9IFid3Cc0CVvZU5cDY6
	VbFLrVhgxPhURPexZ6W2E/za52KE5uzgTm6AIlh23TCS7mORx9Bdu/SQkczFpDRqwVJJrGYYaqhzy
	n8mPBafrCKYc8z2gTvdblhMMYd+UuahWMCHrELqyaekc0ZSTjnflsyk4uvhpBTc8w0BhO4D7XYcXS
	ugsU4DUC9FPlZnFfYd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omge9-00G5ip-Rw; Sun, 23 Oct 2022 19:28:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omge5-00G5i7-LJ
	for linux-riscv@lists.infradead.org; Sun, 23 Oct 2022 19:28:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B1DF60F49;
	Sun, 23 Oct 2022 19:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7316C433D6;
	Sun, 23 Oct 2022 19:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666553305;
	bh=6M351bmajQgGZdsUhHpLDOq0aF5/6/nhlpGFaTq0IJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JtUHSt7PoZ6GYmdDC2MVSAyD/mJqEfHjgxWgNdD6c3U3WTyP6wwUxbs3lXb6xVL+4
	 63C3RBlWIwr+kUUG2ZGq6sGA/QgHJHEA0RH0j81jYjhX9/UeOIWGN84iP6NmjEFkiy
	 qKDp9l1I9lcZ08gcrumRATYiJX884xXSIfXVw6TeZuRiVCgJJBAJ7RK/s/R7Aqp4YA
	 M0Tdu55VQJ3u6of7LTjeQuEMsWzzWFn5zjQR7ElQfUBhA2q1OmxXmd8iowtUPDgHGl
	 FS+E1eH1/9nl7CjbBaxU0jSPrWhoOrlnx3QhhKah1gsKoMgOxgiSA0vSe4TbQWVe/P
	 JlbNvx6oxuuHA==
Date: Sun, 23 Oct 2022 20:28:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 1/3] RISC-V: Improve use of isa2hwcap[]
Message-ID: <Y1WV1MmtTwvTlrcg@spud>
References: <20221021105905.206385-1-ajones@ventanamicro.com>
 <20221021105905.206385-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221021105905.206385-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_122829_802431_CC81FABE 
X-CRM114-Status: GOOD (  24.45  )
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

On Fri, Oct 21, 2022 at 12:59:03PM +0200, Andrew Jones wrote:
> Improve isa2hwcap[] by removing it from static storage, as
> riscv_fill_hwcap() is only called once, and by reducing its size
> from 256 bytes to 26. The latter improvement is possible because
> isa2hwcap[] will never be indexed with capital letters and we can
> precompute the offsets from 'a'.

Hey Drew, couple questions for you - mostly due to naivety I think..

How do we know that isa2hwcap will never interact with capital letters?
It pulls the isa string from dt and the no-capitals enforcement comes
from there since one with capitals is invalid? I didn't dig particularly
deeply into the code, but is there a risk that we regress some user that
has a dt with capitals in the isa string? Or is that a "your dt was wrong
and you're out-of-tree so that's your problem" situation?

Secondly, in the UAPI header, the COMPAT_HWCAP_ISA_FOO defines are
computed as I - A rather than i - a. Should those be changed too for the
sake of consistently using the lowercase everywhere, or do you think
that doesn't really matter?

Thanks,
Conor.

> 
> No functional change intended.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 694267d1fe81..4677320d7e31 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -74,15 +74,15 @@ void __init riscv_fill_hwcap(void)
>  	const char *isa;
>  	char print_str[NUM_ALPHA_EXTS + 1];
>  	int i, j, rc;
> -	static unsigned long isa2hwcap[256] = {0};
> +	unsigned long isa2hwcap[26] = {0};
>  	unsigned long hartid;
>  
> -	isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
> -	isa2hwcap['m'] = isa2hwcap['M'] = COMPAT_HWCAP_ISA_M;
> -	isa2hwcap['a'] = isa2hwcap['A'] = COMPAT_HWCAP_ISA_A;
> -	isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
> -	isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
> -	isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
> +	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
> +	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
> +	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
> +	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
> +	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
> +	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
>  
>  	elf_hwcap = 0;
>  
> @@ -196,8 +196,10 @@ void __init riscv_fill_hwcap(void)
>  			if (unlikely(ext_err))
>  				continue;
>  			if (!ext_long) {
> -				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
> -				set_bit(*ext - 'a', this_isa);
> +				int nr = *ext - 'a';
> +
> +				this_hwcap |= isa2hwcap[nr];
> +				set_bit(nr, this_isa);
>  			} else {
>  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> -- 
> 2.37.3
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
