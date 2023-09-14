Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14552EEAA4F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLHgIctLBkE049I3Hf0hVYRDuJxqmtjgHgohNLLdmc4=; b=HxOUqr1Hn6hXYf
	Dii/mBIhCcMVXNgSCx/yi9mFR7vqvOgvTfTIUyco3obDjbBKhSYYGkztCreqYkwOiVAS/aclUN8S2
	jg8T28I/IHEO+5CagubTph35ag5Wp5SR3N4KXWV+8JYtSRsvcDrWli5bvj6cvIVSvJ2IeZWVeJytv
	jKMpLwI8qndUkd3TUi21+1g1XIylplrPbviGAsprTzvUPBCckw5REhqDLzTiIMJUOIniK43fq7+kM
	vn6CC8+tW5uOTaNSCRBTw/C0CuMKKN8vWN7CHtvGqdHayE0jeNXRkE4ki+tm+8PiK3eq348XP8u43
	42jjARe6P6SXq2WG//Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnYo-008fS5-2A;
	Thu, 14 Sep 2023 14:43:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnYk-008fQn-1N;
	Thu, 14 Sep 2023 14:43:11 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rmg5b623lz6K5pK;
	Thu, 14 Sep 2023 22:42:27 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 15:43:03 +0100
Date: Thu, 14 Sep 2023 15:43:02 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 26/35] arm64: acpi: Move get_cpu_for_acpi_id() to
 a header
Message-ID: <20230914154302.00001c11@Huawei.com>
In-Reply-To: <20230913163823.7880-27-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-27-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_074310_604268_0A4F3023 
X-CRM114-Status: GOOD (  16.17  )
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

On Wed, 13 Sep 2023 16:38:14 +0000
James Morse <james.morse@arm.com> wrote:

> ACPI identifies CPUs by UID. get_cpu_for_acpi_id() maps the ACPI UID
> to the linux CPU number.
> 
> The helper to retrieve this mapping is only available in arm64's numa
> code.
> 
> Move it to live next to get_acpi_id_for_cpu().
> 
> Signed-off-by: James Morse <james.morse@arm.com>
Seems reasonable

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  arch/arm64/include/asm/acpi.h | 11 +++++++++++
>  arch/arm64/kernel/acpi_numa.c | 11 -----------
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
> index 4d537d56eb84..ce5045038e87 100644
> --- a/arch/arm64/include/asm/acpi.h
> +++ b/arch/arm64/include/asm/acpi.h
> @@ -100,6 +100,17 @@ static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
>  	return	acpi_cpu_get_madt_gicc(cpu)->uid;
>  }
>  
> +static inline int get_cpu_for_acpi_id(u32 uid)
> +{
> +	int cpu;
> +
> +	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
> +		if (uid == get_acpi_id_for_cpu(cpu))
> +			return cpu;
> +
> +	return -EINVAL;
> +}
> +
>  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>  void __init acpi_init_cpus(void);
>  int apei_claim_sea(struct pt_regs *regs);
> diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> index e51535a5f939..0c036a9a3c33 100644
> --- a/arch/arm64/kernel/acpi_numa.c
> +++ b/arch/arm64/kernel/acpi_numa.c
> @@ -34,17 +34,6 @@ int __init acpi_numa_get_nid(unsigned int cpu)
>  	return acpi_early_node_map[cpu];
>  }
>  
> -static inline int get_cpu_for_acpi_id(u32 uid)
> -{
> -	int cpu;
> -
> -	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
> -		if (uid == get_acpi_id_for_cpu(cpu))
> -			return cpu;
> -
> -	return -EINVAL;
> -}
> -
>  static int __init acpi_parse_gicc_pxm(union acpi_subtable_headers *header,
>  				      const unsigned long end)
>  {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
