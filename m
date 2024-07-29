Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69001C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 06:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNpEciao8cO8cuggZ0xm5IFMt1GiGcjW2VxhDL83vFA=; b=Fe4JJhbBVvbuya
	kLiU0d8pb/RqlMOBdKzhe7RILSLwoo/cPfYAbgYgj9dJ8d0ET8TxL4a0UPgRHdYVX8USWBb3l8HBX
	aeuzLzUB2fdyMLUWpn3ql5pT9yUF1yyRWyxb6KDs+g4nWelsktmiVejIsQDnlebbn9uEtOkz+1Gwx
	foFuUkXxpfaR46sbOE2e4NlsfeNoH/X714cOY9maSYWiRvqKCZMF5+Lv2OZXZvnbcMXg9+/TBFdqs
	gMr24En9BzvDZzPMzSBgO/AdTBQd+uyrq3GPrVOlCDnLAz+aRfu0347dLCbgH2DV6Z6JRFudXks5o
	LOE5CgXrWfSsDOXl9GqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYJha-0000000A8Dy-1PhK;
	Mon, 29 Jul 2024 06:17:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYJh2-0000000A86C-1sxY;
	Mon, 29 Jul 2024 06:17:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E994FEC;
	Sun, 28 Jul 2024 23:17:35 -0700 (PDT)
Received: from [10.162.41.10] (a077893.blr.arm.com [10.162.41.10])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2F7C3F64C;
	Sun, 28 Jul 2024 23:17:03 -0700 (PDT)
Message-ID: <34d81bcd-072b-4299-8791-f97a27872b55@arm.com>
Date: Mon, 29 Jul 2024 11:46:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ACPI: NUMA: initialize all values of acpi_early_node_map
 to NUMA_NO_NODE
To: Haibo Xu <haibo1.xu@intel.com>, sunilvl@ventanamicro.com
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 James Morse <james.morse@arm.com>, Hanjun Guo <guohanjun@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240729035958.1957185-1-haibo1.xu@intel.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240729035958.1957185-1-haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_231712_571816_A408FA1D 
X-CRM114-Status: GOOD (  11.34  )
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



On 7/29/24 09:29, Haibo Xu wrote:
> Currently, only acpi_early_node_map[0] was initialized to NUMA_NO_NODE.
> To ensure all the values were properly initialized, switch to initialize
> all of them to NUMA_NO_NODE.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com> (arm64 platform)

> ---
>  arch/arm64/kernel/acpi_numa.c | 2 +-
>  arch/riscv/kernel/acpi_numa.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
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
>  
>  int __init acpi_numa_get_nid(unsigned int cpu)
>  {
> diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
> index 0231482d6946..ff95aeebee3e 100644
> --- a/arch/riscv/kernel/acpi_numa.c
> +++ b/arch/riscv/kernel/acpi_numa.c
> @@ -28,7 +28,7 @@
>  
>  #include <asm/numa.h>
>  
> -static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
> +static int acpi_early_node_map[NR_CPUS] __initdata = { [0 ... NR_CPUS - 1] = NUMA_NO_NODE };
>  
>  int __init acpi_numa_get_nid(unsigned int cpu)
>  {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
