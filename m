Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAC5C52D6F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 15:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxJ1uTkQ91YPCpiLW08s21rYcZkORsyF1UK3wIgveQg=; b=C0+pTZj39CUlIk
	yTZuOgnDuQI2tEzH8Vg6hb4I5OsclCmcHyhltjFRRbCZrST+3rml+prxnuD1Pp90GqtE1B+upLQWi
	77V8bmw8xs6YfyGVfy3D0Okyw5NTr0RK4cTGb2KyHmEffXKLW2ow6dH6MG0Xqg3d+U59SXzzPhppk
	Zr/ud4uZl4uedZ4lxPfsjNGrYJCwyJWVBv9HtY6+BBZV6MqGjI+ZcLtw/4DwRp5doQUNUyJYogsMo
	mA2P6CdD9rXd7GzHW4ML69QmcTKN10Yr52BM0ORreQeeyA5nrntjsPkgNXlCxL91L8PH3Z7rioAGT
	LOSyH8wozJBmVeI7o3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sazXK-0000000GI6j-0j35;
	Mon, 05 Aug 2024 15:22:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sazWm-0000000GHvj-2aAF;
	Mon, 05 Aug 2024 15:21:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E03F460CEE;
	Mon,  5 Aug 2024 15:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C30C4AF0B;
	Mon,  5 Aug 2024 15:21:36 +0000 (UTC)
Date: Mon, 5 Aug 2024 16:21:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v2 2/2] arm64: ACPI: NUMA: initialize all values of
 acpi_early_node_map to NUMA_NO_NODE
Message-ID: <ZrDt_isszRHkFuLu@arm.com>
References: <0d362a8ae50558b95685da4c821b2ae9e8cf78be.1722828421.git.haibo1.xu@intel.com>
 <853d7f74aa243f6f5999e203246f0d1ae92d2b61.1722828421.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <853d7f74aa243f6f5999e203246f0d1ae92d2b61.1722828421.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_082140_730632_618C3758 
X-CRM114-Status: GOOD (  16.82  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anshuman Khandual <anshuman.khandual@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, James Morse <james.morse@arm.com>, xiaobo55x@gmail.com, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 05, 2024 at 11:30:24AM +0800, Haibo Xu wrote:
> Currently, only acpi_early_node_map[0] was initialized to NUMA_NO_NODE.
> To ensure all the values were properly initialized, switch to initialize
> all of them to NUMA_NO_NODE.
> 
> Fixes: e18962491696 ("arm64: numa: rework ACPI NUMA initialization")
> Reported-by: Andrew Jones <ajones@ventanamicro.com>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/arm64/kernel/acpi_numa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> index 0c036a9a3c33..2465f291c7e1 100644
> --- a/arch/arm64/kernel/acpi_numa.c
> +++ b/arch/arm64/kernel/acpi_numa.c
> @@ -27,7 +27,7 @@
>  
>  #include <asm/numa.h>
>  
> -static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
> +static int acpi_early_node_map[NR_CPUS] __initdata = { [0 ... NR_CPUS - 1] = NUMA_NO_NODE };

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

The patch makes sense but is there any issue currently without it?
Trying to assess whether it needs a stable backport.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
