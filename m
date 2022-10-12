Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2BCC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 09:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BN8anSX4hrMpyC15OLLR99pe1IiHhiD4yfl58J4sPM=; b=Ho2Hkfne3Bh1lN
	35Qc0sMkLzZWSQWo78N9pvaBvcoK7132HzEfTelw8uFZmuM176Tea4844Fe4tknTB/IXOOr9e88My
	5HpIJozTakQpQWEa1IgpuaXKnkbuWl/08aao28jSCV52hDbYf8QZiUEfHDfyNlAzpJ12BXjUGuNuv
	QfTt3I04rYy7GwZpnkkYFmTDhtmTvWDOpyKLXFuM+2l3Th5UcR6+DZa7YAmsSQPeBjhzBoTpsUEt+
	2Q37hR2psgcoG8vjEfTDCvGo/qAs318ltvZuEk6hR4gR+9Uj8pyWjiIR7sNJoRk3cKnu4uIQ9JLn9
	sirdf5WWgSSE1W8xJR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiXjD-007TCC-JV; Wed, 12 Oct 2022 09:08:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiXj6-007TBH-Hq
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 09:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665565712; x=1697101712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=frqKpQ/GfZmnAadzzaN+14iYXqvO5TCT0DXBBbMT2eA=;
  b=T6iPvBCIY6QEfCRQJR0aP5tntN5RAUJ+hcGwmHDdFa3tl6X8fy9bJKv3
   rJn+IZSphhiljk0JbQDbUMUVjr9KaAsd7rSAgEnr65s0SW7C5TU9p/xv0
   Ps5xCeEs9Ih5wTJqyXFDSZnGO0Kq5fGo1nECOqWOSO7kKF2GGV0swAFyH
   3eDKcelx/MGkCgmNuXWsrS6edMq9ZWdQZvJa7yuJ7JpZz64t8On2/oc+O
   DqeWJayjvOJj646bbuzw5mTP7ncFP8Uxg44LbdDRIGFVZFrg1/txL6EBr
   cHwj6yBjVy7rdLfAPN4M9lUvDQWphQD4k+IVsNZGvT3MoSFE+E/n2fIHJ
   g==;
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; 
   d="scan'208";a="184456017"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Oct 2022 02:08:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 12 Oct 2022 02:08:27 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 12 Oct 2022 02:08:26 -0700
Date: Wed, 12 Oct 2022 10:08:03 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v2] RISC-V: Fix /proc/cpuinfo cpumask warning
Message-ID: <Y0aD81hx9Cn6sa6C@wendy>
References: <20221012082949.1801222-1-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221012082949.1801222-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_020832_689544_97008CB9 
X-CRM114-Status: GOOD (  20.63  )
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

On Wed, Oct 12, 2022 at 10:29:49AM +0200, Andrew Jones wrote:
> Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> start and next seq operations implement a pattern like
> 
>   n = cpumask_next(n - 1, mask);
>   show(n);
>   while (1) {
>       ++n;
>       n = cpumask_next(n - 1, mask);
>       if (n >= nr_cpu_ids)
>           break;
>       show(n);
>   }
> 
> which will issue the warning when reading /proc/cpuinfo. Ensure no
> warning is generated by validating the cpu index before calling
> cpumask_next().
> 
> [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Cc: Yury Norov <yury.norov@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks

> ---
> v2:
>   - Got comments on the x86 equivalent patch and made the same
>     changes to this one
>     - Added all the information I should have in the first place
>       to the commit message [Boris]
>     - Changed style of fix [Boris]
> 
> 
>  arch/riscv/kernel/cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 4aa8cd749441..63138b880b92 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -166,6 +166,9 @@ static void print_mmu(struct seq_file *f)
>  
>  static void *c_start(struct seq_file *m, loff_t *pos)
>  {
> +	if (*pos >= nr_cpu_ids)
> +		return NULL;
> +
>  	*pos = cpumask_next(*pos - 1, cpu_online_mask);
>  	if ((*pos) < nr_cpu_ids)
>  		return (void *)(uintptr_t)(1 + *pos);
> -- 
> 2.37.3
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
