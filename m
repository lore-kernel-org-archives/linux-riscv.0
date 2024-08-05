Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE17AC3DA64
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 03:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CPhfhWHFLBCIRC712aGkLnFShjSQws9rRnbaLcEhNM=; b=t2MFx6xzFmHaUWwWXss5u11aM1
	K9umWDrRytza1FDKZ2erxo0jFI0C9reU2cbUBt0cFQ3P8dosaD+h3c9vC3KG503Xm0Z/xY1CaZI1j
	VemzGhGEFYQBLx3y07yYJayJd7vbUsqY7fc2dSHLBZJtPY5lfeSh01K/JiQ9XfOWxA/3QGnO7g+9A
	yNHr0owl//z0cZhgwk09l4ZiEBz5c+phkNK6ScC7pa4mI5Rb/8D2m25gZmqUSgJon7RuoDNOppq5F
	gO+HrovoE2dtY4PQwTmphRt62Sr3GYzS/NzMClIZrjsBb8cOT2pOcDRkrkdWN4JmehoIF4I6NC4JY
	l4tx7EYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saoHP-0000000EUG9-0VRj;
	Mon, 05 Aug 2024 03:21:03 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saoGs-0000000EUCE-3UtL;
	Mon, 05 Aug 2024 03:20:33 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WchTv2lFJzfZhN;
	Mon,  5 Aug 2024 11:18:27 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 24DD6180106;
	Mon,  5 Aug 2024 11:20:20 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 5 Aug 2024 11:20:19 +0800
Subject: Re: [PATCH v2 1/2] RISC-V: ACPI: NUMA: initialize all values of
 acpi_early_node_map to NUMA_NO_NODE
To: Haibo Xu <haibo1.xu@intel.com>, <ajones@ventanamicro.com>,
	<sunilvl@ventanamicro.com>
CC: <xiaobo55x@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Gavin Shan <gshan@redhat.com>, James Morse
	<james.morse@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <0d362a8ae50558b95685da4c821b2ae9e8cf78be.1722828421.git.haibo1.xu@intel.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <73d444ef-5367-da03-0e4a-e8116fdee604@huawei.com>
Date: Mon, 5 Aug 2024 11:20:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0d362a8ae50558b95685da4c821b2ae9e8cf78be.1722828421.git.haibo1.xu@intel.com>
Content-Language: en-GB
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_202031_581350_3EC35A49 
X-CRM114-Status: GOOD (  13.61  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024/8/5 11:30, Haibo Xu wrote:
> Currently, only acpi_early_node_map[0] was initialized to NUMA_NO_NODE.
> To ensure all the values were properly initialized, switch to initialize
> all of them to NUMA_NO_NODE.
> 
> Fixes: eabd9db64ea8 ("ACPI: RISCV: Add NUMA support based on SRAT and SLIT")
> Reported-by: Andrew Jones <ajones@ventanamicro.com>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/kernel/acpi_numa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
> index 0231482d6946..ff95aeebee3e 100644
> --- a/arch/riscv/kernel/acpi_numa.c
> +++ b/arch/riscv/kernel/acpi_numa.c
> @@ -28,7 +28,7 @@
>   
>   #include <asm/numa.h>
>   
> -static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
> +static int acpi_early_node_map[NR_CPUS] __initdata = { [0 ... NR_CPUS - 1] = NUMA_NO_NODE };
>   
>   int __init acpi_numa_get_nid(unsigned int cpu)
>   {

Reviewed-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
