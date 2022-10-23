Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B836AECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Oct 2022 19:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXUAVaa03cs+ifanQTcBEUCR7DblJMmbGV5dbVx04fo=; b=gavdtC7CTWUc+p
	Gvw0ZCKPvLbVhMA5vsAyVLHtxImZ64R9zTwECT6Tf6kuJ9cTilwLNU56lXzJP9ugm0H7UFJeLzF6l
	l+EVwoRUW6VA6n6+R1NVnLYtkDtOYRD+0gcjvPYapNU1/acw3vEuSG8QIc35Z0x/aVKc4QfQNAnhE
	WrzDR9fwXHAhpUkCjkxLfjw95ckl+ZmwFA10bwVi1gqOTUD9zpeDqmgTHBv5W0JECHAgaIUHa+9JL
	cHpE6F/OgEpACz7eQ1wsLu5IOyMSUPRmuCqlbCBNB32kCU7PIAJd6u8TCvDr8fr2DkwJSsr1MTfN/
	UDoZ3zAmq7mU/l8DFShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omgoL-00G6on-0f; Sun, 23 Oct 2022 19:39:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omgoH-00G6o8-Fw
	for linux-riscv@lists.infradead.org; Sun, 23 Oct 2022 19:39:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B573760F2F;
	Sun, 23 Oct 2022 19:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B72C433C1;
	Sun, 23 Oct 2022 19:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666553940;
	bh=Khb5EznL/sGHGMfedrbMVtSAYVDrKigrf3Ki15q8I8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCtXDdR+HWgOB/CN7FOk6qv7kLTX6EICljzUJIqfl0MWeL4LxguG+KVqmcAyV6KkF
	 ePzvG4npvG0byabb6ztsUsQI6ZD/18aZ4vx/Nn5ZqH2P5RdaRjD07k3gVa5jQfvIvP
	 bPMTms/FFGc9KS82DUrxewYRr1tw0CSrSIvbJkS8ubYF7REgwl5iF+0Vz1HCeoi+HV
	 FanV8q08wtlj+iZ8xfKWqdNcHlBLonfVSUlWvnVXZEhq+tX8tOVu3NAk263fgBP4WQ
	 Hz0bi4H/7QVCx7zwwdPPjhTcEmCaPWsCsoCRDqV7dIYeC1Yaekvd9yJuLsolTCaV2n
	 9ql9QlDvGYDXw==
Date: Sun, 23 Oct 2022 20:38:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 3/3] RISC-V: Ensure Zicbom has a valid block size
Message-ID: <Y1WYT97IQy3Q6BhF@spud>
References: <20221021105905.206385-1-ajones@ventanamicro.com>
 <20221021105905.206385-4-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221021105905.206385-4-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_123901_673377_A14F7059 
X-CRM114-Status: GOOD (  24.90  )
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

On Fri, Oct 21, 2022 at 12:59:05PM +0200, Andrew Jones wrote:
> When a DT puts zicbom in the isa string, but does not provide a block
> size, ALT_CMO_OP() will attempt to do cache operations on address
> zero since the start address will be ANDed with zero. We can't simply
> BUG() in riscv_init_cbom_blocksize() when we fail to find a block
> size because the failure will happen before logging works, leaving
> users to scratch their heads as to why the boot hung. Instead, ensure
> Zicbom is disabled and output an error which will hopefully alert
> people that the DT needs to be fixed. While at it, add a check that
> the block size is a power-of-2 too.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 220be7222129..a4430a77df53 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -9,6 +9,7 @@
>  #include <linux/bitmap.h>
>  #include <linux/ctype.h>
>  #include <linux/libfdt.h>
> +#include <linux/log2.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <asm/alternative.h>
> @@ -70,6 +71,20 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>  
>  static bool riscv_isa_extension_check(int id)
>  {
> +	switch (id) {
> +	case RISCV_ISA_EXT_ZICBOM:
> +		if (!riscv_cbom_block_size) {
> +			if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))

Maybe I've missed something... Why not check if !IS_ENABLED() & return
false immediately rather than doing it inside the attribute checks?
I'll be compiled out of zicbom is enabled, so not like the non-error
patch will be penalised with an extra check.

> +				pr_err("cbom-block-size not found, cannot use Zicbom\n");
> +			return false;
> +		} else if (!is_power_of_2(riscv_cbom_block_size)) {
> +			if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
> +				pr_err("cbom-block-size is not a power-of-2, cannot use Zicbom\n");
> +			return false;
> +		}
> +		return true;
> +	}
> +
>  	return true;
>  }
>  
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
