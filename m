Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2FA606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 23:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ekneP99P;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TZLpeNvf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=742MUo/izlRPQ+hc6V35FRaYB2DTPrPwb7Mt/86+6zY=; b=ekneP99PU5meyyX1W//B9HVFBt
	KccK4DSpYe6SXm8/sbWyi/93J6/3+W4KyT/8QMjz2Nm8HxdPWU7PW+0lqo7V63ThuZ4cGuXJ9z/n9
	EToRjlVHa0l8m6Ue2tPRfyFDfd43jCvG1/0KDLpsIrHg929RY2U6o5KJLLqGDq2phHBU8ncd/FpP/
	Dtfc+7SgZ4eeM4D6DXydV6HKJOJG1d7CZ03qkZG1GT/52q/y4drjYWDJWZnfBC9jwneR6c/rKMSUf
	oskhwh4sfMB7iLz64qLifikXk78hLyVJJtJLcfL0RU0fUQp2ASUb2aF36pUXifh9YM9ttjgYPZcD1
	O111c5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpOr-0000000AX4c-2esi;
	Wed, 18 Nov 2026 23:49:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpOq-0000000AX4V-1YQP
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 23:49:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA659467D9;
	Wed, 18 Nov 2026 23:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7E71F000C5;
	Wed, 18 Nov 2026 23:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795045751;
	bh=xYB1iaZfxn9aboplMl5BCrXi9a5NkstArMixGPBonuA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TZLpeNvf3uDaTgOSrzcKZhIsz/WuzBpaMOoLmuWWKqL4lgUnyhvNwge5uXlDqpJro
	 VydTSxMzTYkGWzWxdYkEcHbYMbHYsCdPKljrVIx9SRyyIxV1Pf1pgEwPwFPdrWJvBE
	 YgJP73jjyqp8Q9d0yCTKqAcrtAUocl6ECLYookVSTINSE4we7kkx/rCucBvx+mVHnX
	 LfbhRFeNBWw9EjDLT9yP0r7llnJLP7bSNMnGF1FTZcm3nRxV8ko+GYOkDeK6BRUm8+
	 KhUpepxCT0MbfK7zdCJW3QjJLl/WDzFMzLLLh+Imh7N0iYfqAhBH6Lnnax0tOkkjOE
	 aDUtElp3t2IuQ==
Date: Wed, 18 Nov 2026 23:49:04 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: "Drew Fustini (Tenstorrent)" <fustini@kernel.org>
Cc: Sunil V L <sunilvl@oss.qualcomm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra
 <atish.patra@linux.dev>, Anup Patel <anup.patel@oss.qualcomm.com>, Chen Pei
 <cp0613@linux.alibaba.com>, yunhui cui <cuiyunhui@bytedance.com>, Reinette
 Chatre <reinette.chatre@intel.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>, Zeng Heng <zengheng@picoheart.com>, Conor
 Dooley <conor.dooley@microchip.com>, Ben Horgan <ben.horgan@arm.com>, James
 Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>, Adrien
 Ricciardi <aricciardi@baylibre.com>, Zhanpeng Zhang
 <zhangzhanpeng.jasper@bytedance.com>, Gong Shuai
 <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Kornel
 =?UTF-8?B?RHVsxJliYQ==?= <mindal@semihalf.com>, Samuel Holland
 <samuel.holland@sifive.com>, guo.wenjia23@zte.com.cn,
 liu.qingtao2@zte.com.cn, Dave Martin <Dave.Martin@arm.com>, Babu Moger
 <babu.moger@amd.com>, Fenghua Yu <fenghuay@nvidia.com>, Peter Newman
 <peternewman@google.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-acpi@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv_cbqri: Bind to RQSC platform devices
Message-ID: <20261118234904.0f6a0f17@jic23-hlaptop>
In-Reply-To: <20261117-acpi-rqsc-v1-3-381ce645751e@kernel.org>
References: <20261117-acpi-rqsc-v1-0-381ce645751e@kernel.org>
	<20261117-acpi-rqsc-v1-3-381ce645751e@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 14:11:29 -0800
"Drew Fustini (Tenstorrent)" <fustini@kernel.org> wrote:

> Let the capacity controller driver probe the "cbqri-capacity" platform
> devices created from the RQSC table. The cache is named by its PPTT
> Cache ID and the PPTT gives its level. Select ACPI_RQSC so the table is
> parsed and drop the OF dependency.
> 
> No change for device tree systems.
> 
> Signed-off-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>

Has the DT support landed? If not feels like a few tweaks in that
would make this less noisy.

If not, see below for one tidy up I'd make here if you can't push
it back to that series.

You almost never want to do manual device_node puts these days!

It's one of the nicest places to use the cleanup.h magic.
> ---
>  drivers/resctrl/Kconfig          |  11 ++--
>  drivers/resctrl/cbqri_capacity.c | 111 ++++++++++++++++++++++++++++-----------
>  2 files changed, 87 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
> index 844dfd75e2aa..491c867f8c5c 100644
> --- a/drivers/resctrl/Kconfig
> +++ b/drivers/resctrl/Kconfig
> @@ -35,6 +35,7 @@ config ARM64_MPAM_RESCTRL_FS
>  menuconfig RISCV_CBQRI
>  	bool "RISC-V CBQRI support"
>  	depends on RISCV && RISCV_ISA_SSQOSID
> +	select ACPI_RQSC if ACPI
>  	select ARCH_HAS_CPU_RESCTRL
>  	default y
>  	help
> @@ -47,14 +48,14 @@ if RISCV_CBQRI
>  
>  config RISCV_CBQRI_CAPACITY
>  	bool "RISC-V CBQRI cache capacity-allocation controller"
> -	depends on OF
>  	help
>  	  Enable driver for a RISC-V CBQRI capacity controller that
> -	  governs a CPU cache, matching the "riscv,cbqri-capacity-controller"
> -	  compatible. The controller's cache phandle gives the cache level and
> -	  id, which the driver registers as a resctrl cache-allocation resource.
> +	  governs a CPU cache, described in device tree by the
> +	  "riscv,cbqri-capacity-controller" compatible or in ACPI by the RQSC
> +	  table. The firmware description gives the cache level and id, which
> +	  the driver registers as a resctrl cache-allocation resource.
>  
> -	  Say N unless your device tree describes a CBQRI capacity controller.
> +	  Say N unless your firmware describes a CBQRI capacity controller.
>  
>  endif
>  
> diff --git a/drivers/resctrl/cbqri_capacity.c b/drivers/resctrl/cbqri_capacity.c
> index 6f3d06c4f74b..7013f1a50ffd 100644
> --- a/drivers/resctrl/cbqri_capacity.c
> +++ b/drivers/resctrl/cbqri_capacity.c

> -static int cbqri_capacity_probe(struct platform_device *pdev)
> +static int cbqri_capacity_of_cache(struct device *dev, u32 *cache_level,
> +				   u32 *cache_id)
>  {
> -	struct device *dev = &pdev->dev;
> -	struct cbqri_controller_info info = {};
>  	struct device_node *cache_np;
> -	struct resource *res;
> -	void __iomem *base;
> -	u32 rcid_count, cache_level, cache_id;
>  	bool found = false;
>  	int cpu, ret;
>  
> -	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> -
> -	ret = of_property_read_u32(dev->of_node, "riscv,cbqri-rcid", &rcid_count);
> -	if (ret) {
> -		dev_err(dev, "missing riscv,cbqri-rcid\n");
> -		return ret;
> -	}
> -
>  	cache_np = of_parse_phandle(dev->of_node, "riscv,cbqri-cache", 0);
Whilst you are here.
	struct device_node *cache_np __free(device_node) =
		of_parse_phandle();
and drop all the gotos. I haven't checked but if there is
a path where you want to hang on to it, no_free_ptr() that.



>  	if (!cache_np) {
>  		dev_err(dev, "missing riscv,cbqri-cache phandle\n");
>  		return -EINVAL;
>  	}
>  
> -	ret = of_property_read_u32(cache_np, "cache-level", &cache_level);
> +	ret = of_property_read_u32(cache_np, "cache-level", cache_level);
>  	if (ret) {
>  		dev_err(dev, "%pOF: missing cache-level\n", cache_np);
>  		goto out_put;
>  	}
>  
> -	if (cache_level != 2 && cache_level != 3) {
> +	if (*cache_level != 2 && *cache_level != 3) {
>  		dev_err(dev, "%pOF: unsupported cache-level %u\n",
> -			cache_np, cache_level);
> +			cache_np, *cache_level);
>  		ret = -EINVAL;
>  		goto out_put;
>  	}
> @@ -73,10 +63,10 @@ static int cbqri_capacity_probe(struct platform_device *pdev)
>  	 */
>  	cpus_read_lock();
>  	for_each_online_cpu(cpu) {
> -		struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, cache_level);
> +		struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, *cache_level);
>  
>  		if (ci && ci->fw_token == cache_np) {
> -			cache_id = ci->id;
> +			*cache_id = ci->id;
>  			found = true;
>  			break;
>  		}
> @@ -85,11 +75,74 @@ static int cbqri_capacity_probe(struct platform_device *pdev)
>  
>  	if (!found) {
>  		dev_err(dev, "%pOF: no online hart reports an L%u cache with a cache id for this node\n",
> -			cache_np, cache_level);
> +			cache_np, *cache_level);
>  		ret = -ENODEV;
> -		goto out_put;
>  	}
>  
> +out_put:
> +	of_node_put(cache_np);
> +	return ret;
> +}
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
