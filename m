Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E357AC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 21:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iv8Za7my0bQMJ22d9riEeTaMnQMEg4mwtvf7Dn3Ah+M=; b=NmR50OcWDIogw9
	24WPpwKgIVVsKq53eoqU4J3qpaxgMaRcJzD/lt0olkN+9PTZbHBDAPU0q+Wh69shFkv8nP58l9OpT
	4TvP6j5a/+P2FCScSwJIhO9PD/B4j43MeU6jK1kcVaDhIWUyQLwVVrz3FQGfeE6+u5P9E++PbST50
	66ggSD+Q193oOfbwpnugU8emQFkUa/jYd6KP8QtQp2e+52C//7Lqf66FThgPa7+VBI+E0sTSLSoND
	muJKaSywWOsqImXcxF4w0G87A4lD4E09UJCkfcgcwaHPDcAswd5a1q7VwOtfuo0FjpZ8VMPWAnyfk
	Tlr4vFoyBQP35pMOrx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxE40-000Kkr-Po; Mon, 21 Nov 2022 21:10:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxE3x-000KkM-Bh
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 21:10:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE8F361477;
	Mon, 21 Nov 2022 21:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF947C433D6;
	Mon, 21 Nov 2022 21:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669065044;
	bh=wgXhA1V/D2pb+oIfFK+cZa9q7Str/LyaiLVk1+km9N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aR/tdGKg39lLzLyQ3fFu6wbyWzr+0SwXrkUD/GH3de+xT26VuBfQLFFAPxZWhw/dK
	 H+Ks83eBhTlR79ktC9EdrIfQ35RVhmrrGMxTE43Mi7w8OCmTarbSJPWCfS0cvZH6al
	 AJEmfVPR3AuquPRs9jYK9jTPfG5r3TD1WDpkecNsYmgkqOZ4oTRl4BHQ/ftQknKenk
	 TjjLBwb2cA+EfJ9jcIKpA1od75+lideVx4XZnmF2qS/CIsf0vlwpSJQtnIFAIPzwNX
	 FIo2T1aTVkfAIqC19HIIMV+x8qoUeBsRZso//LGCvsSivdzSy41Co5ep65rWEaU8S6
	 P4CJIeC5Jhbhg==
Date: Mon, 21 Nov 2022 21:10:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: anup@brainfault.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@rivosinc.com
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
Message-ID: <Y3vpT2XoylY4i2kx@spud>
References: <20221121205647.23343-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121205647.23343-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_131045_464628_B4281220 
X-CRM114-Status: GOOD (  22.20  )
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

On Mon, Nov 21, 2022 at 12:56:47PM -0800, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> As per [1], whether or not the core can wake up from non-retentive
> suspend is a platform-specific detail.  We don't have any way to encode
> that, so just stop using them until we've sorted that out.

For anyone playing along at home, Anup had a proposal for encoding this
information (yoinked from the GH issue below):
https://lore.kernel.org/all/20220727114302.302201-1-apatel@ventanamicro.com/> 

> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98#issuecomment-1288564687
> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> ---
> 
> This should allow us to revert 232ccac1bd9b ("clocksource/drivers/riscv:
> Events are stopped during CPU suspend"), which fixes suspend on the D1
> but breaks timers everywhere.

FWIW the revert is at:
https://lore.kernel.org/linux-riscv/20221023185444.678573-1-conor@kernel.org/

Commit message is probably a little lacking as I didn't understand the
problem when I wrote it. I'll respin the revert with a tidier message
tomorrow.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index 05fe2902df9a..9d1063a54495 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -214,6 +214,17 @@ static bool sbi_suspend_state_is_valid(u32 state)
>  	if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
>  	    state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
>  		return false;
> +
> +	/*
> +	 * Whether or not RISC-V systems deliver interrupts to harts in a
> +	 * non-retentive suspend state is a platform-specific detail.  This can
> +	 * leave the hart unable to wake up, so just mark these states as
> +	 * unsupported until we have a mechanism to expose these
> +	 * platform-specific details to Linux.
> +	 */
> +	if (state & SBI_HSM_SUSP_NON_RET_BIT)
> +		return false;
> +
>  	return true;
>  }
>  
> -- 
> 2.38.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
