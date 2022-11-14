Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE67EC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 20:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DX4IuiPZlgWMEujQHZ+voar2R6WrsO3msy8fo+rDjz0=; b=QDxjuGv1HEDpue
	m/Fzu0BEPsFKU8hcmtESUXi+IX2EKzEHjrSonPY61n5BwBEk6HHWKlqZkIGKLO98SJXT7LtHCFYQ2
	2RaboWUmQd+ARzpbpcrFeMUSOWdgAeMsv5q4g/ejOEUZcYGgx5SnIYiSoeZUQZdd4kHw4O7n95AQY
	Tp2HWDTxUqUGQCvfG8V/9Yh+G+SSmLlDPPGvVE9Mu5F0tvGsfm+2tN5+vwzQYnqDjwNXUF55T4Vhp
	EmJoYbAV9X9H96280tfBqagBXfPfvpRy/t6FzG7chsLdAE/A89gtTONenXv7KRcQcggq/GoyPHAFG
	10OTMewLikpfOAlCoW/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oufhw-004TBw-PG; Mon, 14 Nov 2022 20:05:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oufhu-004TB5-9c
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 20:05:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ED2BAB8121C;
	Mon, 14 Nov 2022 20:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D99FC433C1;
	Mon, 14 Nov 2022 20:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668456322;
	bh=5Dor3eiQWuStolKphoUc/jifL5Ci/cPGI8MC80U7+qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VhqcddTaFaF2lcqeSJNmib4HaPOkcGvx6b4Ow8ZjbzR2uGN/LVqa2wgATXgYg/MVc
	 sChNbWGuGmR9gJhRJmbL0fvdVIrVK/AnTGnfm6p6q3JutdsQf9G/2MOCumYyoTDubt
	 zfuHWqiK8Nf+d3ccvh7HSnIEh5+lMIKDmn8cTiEmBCYO0QA5wNc5VUJojm1j28zVkv
	 zmdAnExNBsla6kj4AemeffGgaoudTGXtt8Nuh1FyC36PdXTvAwjy3yRorld11tkpQo
	 KZVmT7ql2oK4VpORU2E5qzrha50VE62dENrPz3PhWhgF76XfRmdHJEW43WM0kcjzY+
	 /hjgE8zZ0ZIQg==
Date: Mon, 14 Nov 2022 20:05:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Conor Dooley <Conor.Dooley@microchip.com>
Subject: Re: [PATCH] riscv: Update k210 defconfigs
Message-ID: <Y3Kffxz33QV1Vvii@spud>
References: <20221114013151.714578-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221114013151.714578-1-damien.lemoal@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_120526_642553_8E533BF8 
X-CRM114-Status: GOOD (  17.70  )
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

On Mon, Nov 14, 2022 at 10:31:51AM +0900, Damien Le Moal wrote:
> In preparation for SLOB deprecation, update the nommu_k210_* defconfigs
> to switch to using SLUB. To save memory, CONFIG_SLUB_CPU_PARTIAL is not
> selected.
> 
> Suggested-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Hey,
Gave it a go w/ your v21 branch. To me, seems about as usable as it was
before...
Tested-by: Conor Dooley <conor.dooley@microchip.com>

btw, what's the craic with that? Looks like you actually landed in
upstream buildroot fairly soon after you pointed me at your series.
Anything missing from buildroot, or did it all land?

Thanks,
Conor.

> ---
>  arch/riscv/configs/nommu_k210_defconfig        | 6 +++---
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index 96fe8def644c..18de91e84d1c 100644
> --- a/arch/riscv/configs/nommu_k210_defconfig
> +++ b/arch/riscv/configs/nommu_k210_defconfig
> @@ -23,9 +23,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>  # CONFIG_ADVISE_SYSCALLS is not set
>  # CONFIG_KALLSYMS is not set
>  CONFIG_EMBEDDED=y
> -# CONFIG_VM_EVENT_COUNTERS is not set
> -# CONFIG_COMPAT_BRK is not set
> -CONFIG_SLOB=y
>  # CONFIG_MMU is not set
>  CONFIG_SOC_CANAAN=y
>  CONFIG_NONPORTABLE=y
> @@ -39,6 +36,9 @@ CONFIG_CMDLINE_FORCE=y
>  # CONFIG_BLOCK is not set
>  CONFIG_BINFMT_FLAT=y
>  # CONFIG_COREDUMP is not set
> +# CONFIG_SLUB_CPU_PARTIAL is not set
> +# CONFIG_COMPAT_BRK is not set
> +# CONFIG_VM_EVENT_COUNTERS is not set
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_FW_LOADER is not set
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> index 379740654373..718d2729a03e 100644
> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -15,9 +15,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>  # CONFIG_ADVISE_SYSCALLS is not set
>  # CONFIG_KALLSYMS is not set
>  CONFIG_EMBEDDED=y
> -# CONFIG_VM_EVENT_COUNTERS is not set
> -# CONFIG_COMPAT_BRK is not set
> -CONFIG_SLOB=y
>  # CONFIG_MMU is not set
>  CONFIG_SOC_CANAAN=y
>  CONFIG_NONPORTABLE=y
> @@ -32,6 +29,9 @@ CONFIG_CMDLINE_FORCE=y
>  # CONFIG_MQ_IOSCHED_KYBER is not set
>  CONFIG_BINFMT_FLAT=y
>  # CONFIG_COREDUMP is not set
> +# CONFIG_SLUB_CPU_PARTIAL is not set
> +# CONFIG_COMPAT_BRK is not set
> +# CONFIG_VM_EVENT_COUNTERS is not set
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_FW_LOADER is not set
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
