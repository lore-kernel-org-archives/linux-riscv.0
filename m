Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22BFECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 20:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9AhqiVA7oTQCu1TF0tSepWjydo8o9ePGkykdtvpews=; b=48aDTM7xGBGYsa
	HpVtcvBX/Dda3ojsvXpIyQHokByzjuciSrOuH2XCh3tp7ncSCEJ657WBG1JkO5xoxW3TyHZKOTgbZ
	LTplA1TZv904BQxVkjlFWIoW1ct63uDbFgWsB1tz2HRHGI5sQ/oOODqtuJVlM07Yi4aEoTLzd5Rvu
	xgjOV+B5M6RRClYsu2eosifuT+chwVpXSxO6UfzzLJ+UJuZS0+rTW0Apjs+eDV5YQjssjRY0PTAYU
	pQXzerCXxiKg6Sxfyvv6ZtHqyuBfoQpzli7le1DHX2DoFiOrEtYSwjNIXQCLOuFL77mHF+nyOSxDG
	el6MCig+CdYxCgTqQGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opEyJ-002tk0-Cd; Sun, 30 Oct 2022 20:31:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opEyG-002thk-NB; Sun, 30 Oct 2022 20:31:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3ADD760EC6;
	Sun, 30 Oct 2022 20:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65679C433D6;
	Sun, 30 Oct 2022 20:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667161911;
	bh=KLTiuj++u0onacWu7gXl1Y1dT5VAVZ+DxdxO8qhwlBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sumo74Y0FyM+C6+iqNZa8lLVHvDhVzy0s1v6o/pth+tqQXRUHPVzMlmCyoHy8qZCY
	 4uS3XHfzQt9iYcWfQQQHXaLnKPXvzmcj+P6hMu6BFsW568i6wEIpWnP2uwAuiY+HkH
	 5zPXBZNFBG6m2vGbqciXFkabLtMQnz+RD5lZ7JPat1ddJq9PT4ZOEt9OOrj+Rrxbmd
	 lDJB+Vdh8cGeSYBMRt/ki0Jox02dlg3lf0ySCfACfb3G4PPJBimo8YJ8EQJqov2Z6R
	 IfL8Zp/1jRiv3b7Y4a44ZhG1S2reUAxEYOKac5pmHSWpeBvlGCYjLliJGFg2+1g/SH
	 D4zkIj9bQucGA==
Date: Sun, 30 Oct 2022 20:31:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 1/9] RISC-V: Factor out body of riscv_init_cbom_blocksize
 loop
Message-ID: <Y17fMkRRkTIbEX+r@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027130247.31634-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_133152_857643_9D1A55CD 
X-CRM114-Status: GOOD (  21.79  )
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

On Thu, Oct 27, 2022 at 03:02:39PM +0200, Andrew Jones wrote:
> Refactor riscv_init_cbom_blocksize() to prepare for it to be used
> for both cbom block size and cboz block size.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/mm/cacheflush.c | 45 +++++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 57b40a350420..f096b9966cae 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -91,34 +91,39 @@ void flush_icache_pte(pte_t pte)
>  unsigned int riscv_cbom_block_size;
>  EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
>  
> +static void cbo_get_block_size(struct device_node *node,
> +			       const char *name, u32 *blksz,

Is there a reason you called this "blksz" when we are using the spelt
out "block_size" everywhere else in this code? My OCD would appreciate
the consistency :s

Other than that:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +			       unsigned long *first_hartid)
> +{
> +	unsigned long hartid;
> +	u32 val;
> +
> +	if (riscv_of_processor_hartid(node, &hartid))
> +		return;
> +
> +	if (of_property_read_u32(node, name, &val))
> +		return;
> +
> +	if (!*blksz) {
> +		*blksz = val;
> +		*first_hartid = hartid;
> +	} else if (*blksz != val) {
> +		pr_warn("%s mismatched between harts %lu and %lu\n",
> +			name, *first_hartid, hartid);
> +	}
> +}
> +
>  void riscv_init_cbom_blocksize(void)
>  {
>  	struct device_node *node;
>  	unsigned long cbom_hartid;
> -	u32 val, probed_block_size;
> -	int ret;
> +	u32 probed_block_size;
>  
>  	probed_block_size = 0;
>  	for_each_of_cpu_node(node) {
> -		unsigned long hartid;
> -
> -		ret = riscv_of_processor_hartid(node, &hartid);
> -		if (ret)
> -			continue;
> -
>  		/* set block-size for cbom extension if available */
> -		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> -		if (ret)
> -			continue;
> -
> -		if (!probed_block_size) {
> -			probed_block_size = val;
> -			cbom_hartid = hartid;
> -		} else {
> -			if (probed_block_size != val)
> -				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> -					cbom_hartid, hartid);
> -		}
> +		cbo_get_block_size(node, "riscv,cbom-block-size",
> +				   &probed_block_size, &cbom_hartid);
>  	}
>  
>  	if (probed_block_size)
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
