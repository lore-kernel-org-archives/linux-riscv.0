Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C56C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 19:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ucYCIH7GqO83vJtd8rqm9DTZcF6FyomrBLN/jgIyfs=; b=KridjOYIsmL3QZ
	bPrFKhfSrofVbnUmYLGZB1KwnCJXu8hRBepwaykwOG2lQ2WQPsJO6cdY6hPQdvLs/uJGeGg8XFTnr
	qc3/Y33VyvlauyTYo6AAfUmqLVmu33QNX5oRUOa5S74oNruMQbKuSbWxt4m0om9lZjv+c92XFdtNg
	2RjmLCSkJ1/u0O17k2HSfD/Dmzg8Qy3qZaa2wXtX1aBVqrVKRnVqK+uT/BnAHzmBR5mQDdEpZLLRT
	3paeg1FZ5BjI93nizfmMosib5Zc6MdbgV5U0VMwjT9BohJTRHRNZHuD/C6UamcZZNedRLipiXsiCa
	rzVjr6djNQn+7i+PMOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p06Xn-00BAJc-SZ; Tue, 29 Nov 2022 19:45:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p06Xk-00BAIA-V3
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 19:45:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF1E3618A6;
	Tue, 29 Nov 2022 19:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EECC433D6;
	Tue, 29 Nov 2022 19:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669751123;
	bh=9b1CLsfQU5rruo40ypQKfbEmSZHzT3Ci1+pyOl+fkJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mkv++/gC/bQBl6UUmiBrRPmetdQKfp0/lmuIlkOh63REstEUEvOgqJ2IznaxZzqgQ
	 ACMFIltD8itc2QQbj/f8mMJljrr46UGBeCj8aJLNV6wpXoyjsQ2+G6Ju7T1zE8Pku9
	 w58ddTdRzEhgj7xoUMtU8XjFEQM4L12MXk0EdF6ExBs83UfDyOzvLvcF0x2hUf4rUL
	 pyUGke8WxDZMEzTznmVnquiRdP4LPZrYVATtyfZcp2cPF7MFEZDMaMzJiKUMh5X91M
	 HA7g/Oi/7+zOH48sDCBzgsgofbob4pIH6spC8qdZ3UydR1SJivguCzanw1TVO0l5tU
	 dtliU+SWoMVrw==
Date: Tue, 29 Nov 2022 19:45:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 3/3] RISC-V: Ensure Zicbom has a valid block size
Message-ID: <Y4ZhT3R34cE35a0K@spud>
References: <20221129143447.49714-1-ajones@ventanamicro.com>
 <20221129143447.49714-4-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221129143447.49714-4-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_114525_119377_1A318B30 
X-CRM114-Status: GOOD (  26.00  )
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

Hey Drew,

On Tue, Nov 29, 2022 at 03:34:47PM +0100, Andrew Jones wrote:
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
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

This seems to be failing on nommu :/ I've got host machines issues so I
could not reproduce it for you lcoally and paste an actual log, but if
you build rv64_nommu_virt_defconfig I think you should be able to
reproduce.

Thanks,
Conor.

> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 220be7222129..93e45560af30 100644
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
> @@ -70,6 +71,18 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>  
>  static bool riscv_isa_extension_check(int id)
>  {
> +	switch (id) {
> +	case RISCV_ISA_EXT_ZICBOM:
> +		if (!riscv_cbom_block_size) {
> +			pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
> +			return false;
> +		} else if (!is_power_of_2(riscv_cbom_block_size)) {
> +			pr_err("cbom-block-size present, but is not a power-of-2\n");
> +			return false;
> +		}
> +		return true;
> +	}
> +
>  	return true;
>  }
>  
> -- 
> 2.38.1
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
