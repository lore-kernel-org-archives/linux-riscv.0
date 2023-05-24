Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1930DC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHRFu19x8um2gnc64T5y4sLRE1kozivNSZzcpVX3zwY=; b=CiJtWkx4q+UlFV
	dfxs+mUjgyb0CTPiNiKlYzSmBFrxEAgefkE0eRw7yUxcIjaJSMeOmMEiV1DyvSgtS9TAWeEU9UZ7g
	ntM/vksZfj7b1IhkwW6uP0cUDOJ4lH56tOfUS0z3fHxv/XDd0dgXxq3JZdlu/YjxLf+FNpuXM4qAM
	5QsmCkN/JN5X4PeCi7aMC/5VJOZwZbsELCWyAm5rQWP4EcGHWdmzYbo2X9DyfPgTspw4w+GMu6W/a
	ywrNFjjU9Apl9ZomWrh7PJYgq7IebNnFyBLL6YiuHomnnQNSKgYi4ZZ1Kl3AIMInatZgAobl7aXdr
	lC64QAc2Wq/1urs32PLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1mIj-00DGxT-23;
	Wed, 24 May 2023 11:05:05 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1mIf-00DGuG-1q
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 11:05:03 +0000
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4QR7ZS4FLmzLm9b;
	Wed, 24 May 2023 19:02:56 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 19:04:24 +0800
Message-ID: <93960845-2af5-ac2b-c562-d8c89ad961a4@huawei.com>
Date: Wed, 24 May 2023 19:04:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 4/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, Zhangjin Wu <falcon@tinylab.org>, Guo Ren
	<guoren@kernel.org>, Bin Meng <bmeng@tinylab.org>
References: <20230523165502.2592-1-jszhang@kernel.org>
 <20230523165502.2592-5-jszhang@kernel.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20230523165502.2592-5-jszhang@kernel.org>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_040501_936572_E82566FB 
X-CRM114-Status: GOOD (  20.37  )
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



On 2023/5/24 0:55, Jisheng Zhang wrote:
> From: Zhangjin Wu <falcon@tinylab.org>
> 
> Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> the user to enable dead code elimination. In order for this to work,
> ensure that we keep the alternative table by annotating them with KEEP.
> 
> This boots well on qemu with both rv32_defconfig & rv64 defconfig, but
> it only shrinks their builds by ~1%, a smaller config is thereforce
> customized to test this feature:
> 
>            | rv32                   | rv64
>    --------|------------------------|---------------------
>     No DCE | 4460684                | 4893488
>        DCE | 3986716                | 4376400
>     Shrink |  473968 (~10.6%)       |  517088 (~10.5%)
> 
> The config used above only reserves necessary options to boot on qemu
> with serial console, more like the size-critical embedded scenes:
> 
>    - rv64 config: https://pastebin.com/crz82T0s
>    - rv32 config: rv64 config + 32-bit.config
> 
> Here is Jisheng's original commit-msg:
> When trying to run linux with various opensource riscv core on
> resource limited FPGA platforms, for example, those FPGAs with less
> than 16MB SDRAM, I want to save mem as much as possible. One of the
> major technologies is kernel size optimizations, I found that riscv
> does not currently support HAVE_LD_DEAD_CODE_DATA_ELIMINATION, which
> passes -fdata-sections, -ffunction-sections to CFLAGS and passes the
> --gc-sections flag to the linker.
> 
> This not only benefits my case on FPGA but also benefits defconfigs.
> Here are some notable improvements from enabling this with defconfigs:
> 
> nommu_k210_defconfig:
>     text    data     bss     dec     hex
> 1112009  410288   59837 1582134  182436     before
>   962838  376656   51285 1390779  1538bb     after
> 
> rv32_defconfig:
>     text    data     bss     dec     hex
> 8804455 2816544  290577 11911576 b5c198     before
> 8692295 2779872  288977 11761144 b375f8     after
> 
> defconfig:
>     text    data     bss     dec     hex
> 9438267 3391332  485333 13314932 cb2b74     before
> 9285914 3350052  483349 13119315 c82f53     after
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> Co-developed-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Tested-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

> ---
>   arch/riscv/Kconfig              | 1 +
>   arch/riscv/kernel/vmlinux.lds.S | 6 +++---
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8f55aa4aae34..62e84fee2cfd 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -115,6 +115,7 @@ config RISCV
>   	select HAVE_KPROBES if !XIP_KERNEL
>   	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>   	select HAVE_KRETPROBES if !XIP_KERNEL
> +	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>   	select HAVE_MOVE_PMD
>   	select HAVE_MOVE_PUD
>   	select HAVE_PCI
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index e5f9f4677bbf..492dd4b8f3d6 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -85,11 +85,11 @@ SECTIONS
>   	INIT_DATA_SECTION(16)
>   
>   	.init.pi : {
> -		*(.init.pi*)
> +		KEEP(*(.init.pi*))
>   	}
>   
>   	.init.bss : {
> -		*(.init.bss)	/* from the EFI stub */
> +		KEEP(*(.init.bss*))	/* from the EFI stub */
>   	}
>   	.exit.data :
>   	{
> @@ -112,7 +112,7 @@ SECTIONS
>   	. = ALIGN(8);
>   	.alternative : {
>   		__alt_start = .;
> -		*(.alternative)
> +		KEEP(*(.alternative))
>   		__alt_end = .;
>   	}
>   	__init_end = .;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
