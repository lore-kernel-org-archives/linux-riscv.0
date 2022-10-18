Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B2FC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 07:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pKHweUzYooBR4R78gUqoyg4dhR2OmxhHChGk8pWlwM=; b=Ff7SylKrsX0vbg
	f4uWGJnciWIzqPDG0Zvfh8R3FuicVMO0LAbjKLHn9a/rApXmXHsfbL14771/b4cRMtpLP74f0W4hR
	q+jAiOWRgAROwDNNz+ZIHxP39LFqpVS0RvunBApq6Z5ffVAKpROni4hgP8b1MMUu1D8w+AKuChIGB
	QfmCmRoqN38ZV4jnYS12bALYhOcuAS+jeYzgKEg5n/PJuMnl0PVIVY1GI3quSYtxdJZ1VXEkyZ7vD
	kauli5eMT56pu+fCBnYwdf4ShVW7PINJL4FQ1V4GSPqsVkdkjyDXYVUcY2jY8viFEDUHrIICJPULH
	1eDkvkZylvCEkU/wp8zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhE6-003wOo-Mu; Tue, 18 Oct 2022 07:41:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhE2-003wMW-34
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 07:41:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666078882; x=1697614882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+hQeQyCFY17DE0gSCTClGovh0NMTcpWzPO97ooNHdIE=;
  b=K67sZGQttYk0pGjBkcnSqvYvJzFHzIHUA0U3nF4b1QeJKs0Hpz0PDqSv
   FWiV4LHo4IFuYrac7ofhYGRls9ISN0yJJQnr3FYkLA5OR0WRpinxJzUSv
   H3yHkPDESMwG15pUXXZf5AxHIoSE+QUj/6XSxQ8QRFcbgX52K422r3VKv
   lxqFkQC4U5q96nLCUL2XuyXQN7jdIWHrarhqRVS+P+WGZoTOExnIiN4ad
   vNHqANUoXNE450ihTTP9lmesQEhyAiLlALbnPhqQeQ8OabFe+RxH0zYGO
   GtyQKbHFc4w14HYI73/tRaiKEOVKI2jQR1v51ojTG0yzmf+KGENQXYdVI
   A==;
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="182678392"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Oct 2022 00:41:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 18 Oct 2022 00:41:20 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 18 Oct 2022 00:41:18 -0700
Date: Tue, 18 Oct 2022 08:40:56 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yang Yingliang <yangyingliang@huawei.com>
CC: <linux-riscv@lists.infradead.org>, <yash.shah@sifive.com>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <conor@kernel.org>
Subject: Re: [PATCH v2 3/3] soc: sifive: ccache: fix missing of_node_put() in
 sifive_ccache_init()
Message-ID: <Y05YiMEaXu4jFtWR@wendy>
References: <20221018023149.1048176-1-yangyingliang@huawei.com>
 <20221018023149.1048176-4-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018023149.1048176-4-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_004122_215383_AB00DA7D 
X-CRM114-Status: GOOD (  18.41  )
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

On Tue, Oct 18, 2022 at 10:31:49AM +0800, Yang Yingliang wrote:
> The device_node pointer returned by of_find_matching_node() with
> refcount incremented, when finish using it, the refcount need be
> decreased.

Cool, patch looks about as I'd expect. Thanks!
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/soc/sifive/sifive_ccache.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> index 98269d056728..3684f5b40a80 100644
> --- a/drivers/soc/sifive/sifive_ccache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -215,12 +215,16 @@ static int __init sifive_ccache_init(void)
>  	if (!np)
>  		return -ENODEV;
>  
> -	if (of_address_to_resource(np, 0, &res))
> -		return -ENODEV;
> +	if (of_address_to_resource(np, 0, &res)) {
> +		rc = -ENODEV;
> +		goto err_node_put;
> +	}
>  
>  	ccache_base = ioremap(res.start, resource_size(&res));
> -	if (!ccache_base)
> -		return -ENOMEM;
> +	if (!ccache_base) {
> +		rc = -ENOMEM;
> +		goto err_node_put;
> +	}
>  
>  	if (of_property_read_u32(np, "cache-level", &level)) {
>  		rc = -ENOENT;
> @@ -243,6 +247,7 @@ static int __init sifive_ccache_init(void)
>  			goto err_free_irq;
>  		}
>  	}
> +	of_node_put(np);
>  
>  	ccache_config_read();
>  
> @@ -259,6 +264,8 @@ static int __init sifive_ccache_init(void)
>  		free_irq(g_irq[i], NULL);
>  err_unmap:
>  	iounmap(ccache_base);
> +err_node_put:
> +	of_node_put(np);
>  	return rc;
>  }
>  
> -- 
> 2.25.1
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
