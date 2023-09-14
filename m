Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83DCEDE9A4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovOMMOQ+PXf7j13R8OpYzGDCPieTBxWpvJltMhVUFXI=; b=VFttcZ6hNTIm0c
	sfho9UU8ur7S9p8nKWOJCeAoCySxug6/SLW6v4uBRVRvXuxah9wXh5hIHLs61hljeCqKWqGQdoQWc
	nN8xMp9/N3hFVLlZWLzm9qSVn0JUiovfFDG6zNWrw358AqQYCwvThf/JUoxV8Kb8MjEMGTLBPXTNd
	deufN6stN31ToajhwwkPdZRHR8hs3HVhJC2yoqqBgSPDJO5bLQXVYNFEtJjNcmcyNoOALvw/Lh67S
	Zum9U2dIjZy04dcc7cE56WOZAbF6tGfeLao0A+EiGGJd68vTaB10l+k5zr1fg9SXiEFGQkCgydfAP
	DTn4u93/mS+H+AXr5e3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkKe-008D0u-0z;
	Thu, 14 Sep 2023 11:16:24 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkKa-008CzQ-0K;
	Thu, 14 Sep 2023 11:16:22 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmZTc4Qg3z6HJdP;
	Thu, 14 Sep 2023 19:14:28 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 12:16:13 +0100
Date: Thu, 14 Sep 2023 12:16:12 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 04/35] drivers: base: Move cpu_dev_init() after
 node_dev_init()
Message-ID: <20230914121612.00006ac7@Huawei.com>
In-Reply-To: <20230913163823.7880-5-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-5-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_041620_278286_1E7C764C 
X-CRM114-Status: GOOD (  14.34  )
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

On Wed, 13 Sep 2023 16:37:52 +0000
James Morse <james.morse@arm.com> wrote:

> NUMA systems require the node descriptions to be ready before CPUs are
> registered. This is so that the node symlinks can be created in sysfs.
> 
> Currently no NUMA platform uses GENERIC_CPU_DEVICES, meaning that CPUs
> are registered by arch code, instead of cpu_dev_init().

Worth saying why this matters I think.  I wrote a nice note on that being a possible
problem path as node_dev_init() uses the results of cpu_dev_init() if
CONFIG_GENERIC_CPU_DEVICES before seeing this comment and realizing you
had it covered (sort of anyway).

> 
> Move cpu_dev_init() after node_dev_init() so that NUMA architectures
> can use GENERIC_CPU_DEVICES.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/base/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/init.c b/drivers/base/init.c
> index 397eb9880cec..c4954835128c 100644
> --- a/drivers/base/init.c
> +++ b/drivers/base/init.c
> @@ -35,8 +35,8 @@ void __init driver_init(void)
>  	of_core_init();
>  	platform_bus_init();
>  	auxiliary_bus_init();
> -	cpu_dev_init();
>  	memory_dev_init();
>  	node_dev_init();
> +	cpu_dev_init();
>  	container_dev_init();
>  }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
