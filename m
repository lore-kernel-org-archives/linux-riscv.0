Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB3FCD343F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 02:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+U3HTOuzrhovSY44JE4UP8yRn1+rIadCpSMzVe5x8g=; b=ZDMxz0pikZ4bvm
	5rN5Gx8HdegeZrkySd6mBQ03sKDq9z6gkkPHjswovPvlDl/4ZtFMO/ZbaYjqj43auOL8mKTl1OGNG
	MU9GZ5f4EvWl47Eh3ahmhdaRFSWZr/xPA91b33WnZhTDhMWVTsiYPE2TqELFGcbWrNZSF71ct0rgn
	GczvprU3uvPuHGcnu55i6vAJJVZzHQCs3V9RUj6zfYHEeuLahRjLqounBcMEYGKHiMwsLDRC2P7YA
	CrKb/2TpGvVdJpbAlYOEDbyoSY9pkT1ghM5vDlzcVsmg15rgRwrloOxY6wabQlmOi8MJoLzwT2fr+
	PLc/8a7UReTQjsqraSuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMz6r-00000000uq3-1kb6;
	Wed, 13 May 2026 02:14:05 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMz6o-00000000up7-0rQM
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 02:14:03 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 19D2A92009C; Wed, 13 May 2026 04:13:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 13D3E92009B;
	Wed, 13 May 2026 03:13:56 +0100 (BST)
Date: Wed, 13 May 2026 03:13:55 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Zishun Yi <vulab@iscas.ac.cn>
cc: Andreas Schwab <schwab@suse.de>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
    =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
    Charlie Jenkins <charlie@rivosinc.com>, Nam Cao <namcao@linutronix.de>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: misaligned: Restore epc in error path
In-Reply-To: <20260511124101.3202094-1-vulab@iscas.ac.cn>
Message-ID: <alpine.DEB.2.21.2605130310130.46195@angie.orcam.me.uk>
References: <mvmh5oe1ixn.fsf@suse.de> <20260511124101.3202094-1-vulab@iscas.ac.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_191402_413992_8F147EAB 
X-CRM114-Status: GOOD (  12.84  )
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

On Mon, 11 May 2026, Zishun Yi wrote:

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 2a27d3ff4ac6..21a3ceb1fae8 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -303,17 +304,18 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
>  		shift = 8 * (sizeof(ulong) - len);
>  		insn = RVC_RS2S(insn) << SH_RD;
>  	} else {
> -		regs->epc = epc;
> -		return -1;
> +		goto out_restore_epc;
>  	}
>  
> -	if (!IS_ENABLED(CONFIG_FPU) && fp)
> -		return -EOPNOTSUPP;
> +	if (!IS_ENABLED(CONFIG_FPU) && fp) {
> +		ret = -EOPNOTSUPP;
> +		goto out_restore_epc;
> +	}

 Does it make sense to maintain this -EOPNOTSUPP special case given that 
this function does not otherwise make use of error numbers and the caller 
only checks whether the return value is nonzero?  Likewise for the store.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
