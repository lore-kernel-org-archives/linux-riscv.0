Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0807C52D70
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGLUdhfmdQdAklgTgdD6sZrWsu9suoyUCWVtl7LYhIw=; b=n/j/ijTdfvubhL
	BFbWQgLraDECA47QMh156EhzLcOxawkfvfh0ZCuHg24vH0UdTiQLmxtqC+VIYrROdDIfaxrWaReCr
	80odChdVutCcOcWYFKYViCaLyVrqMWFYNHul81tiiHLVq/EhCt0qvJFa93DaKtIQeU+eETaeYIGtC
	Sf4XyfOmS7TzCgooMLwhoyrBVU/VQCPg0AyRlYThR8OEGon4jtvjHttPx09F1anXmIHrWoqRDOS/R
	sIpF3/KzaOIinQUkAeDfpGx7Awd0RKIdSFLJ4jgoFjDI3QiaF0CAJ/wwcGcr0TQ7qo5msyxkYksXd
	CotN9e5Nkzpl7Pej14GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbN9z-00000002MsG-3cKm;
	Tue, 06 Aug 2024 16:35:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbN9Q-00000002MjI-2cHx;
	Tue, 06 Aug 2024 16:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ACCF8CE0EEE;
	Tue,  6 Aug 2024 16:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09AAC32786;
	Tue,  6 Aug 2024 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722962105;
	bh=uQqSa2ju/OwNtv4V5r1lb+pBWDYjfdDGks/rRhWKkQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rFbtzxU/9vfJ1XsILpQQPsivG1Pyogx2CI6NstcraYijdi2mzSCTxW4WvVPUs08Ko
	 6z0T8GGW5fCwuNikTj97SLFnGlJu3JkkfFsXiXnyII7JsnfqT1RxUwAQgkWX9v/zhS
	 4lGBViEWOHfWrzNRBp/GU5zVFKovj0T5LsBLwbtM/S0raRISU/kgybv+XkL39qeII1
	 vUpfdm2a4Z1/px0JCHRgBvGxTHDKC3dP8BFcfDo8iWier3zg/ajS+ejh6Oz+MzSPUt
	 yXkh0sFiqQ3wf+mN4LIb2snalsqq3hDlVCEbir0xKdtHa95lfwG+CoGXv8lXzKI+TU
	 4EntyrvOy7bkQ==
Date: Tue, 6 Aug 2024 18:34:58 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 2/2] arm64: ACPI: NUMA: initialize all values of
 acpi_early_node_map to NUMA_NO_NODE
Message-ID: <ZrJQsuOguTkbpMI2@lpieralisi>
References: <0d362a8ae50558b95685da4c821b2ae9e8cf78be.1722828421.git.haibo1.xu@intel.com>
 <853d7f74aa243f6f5999e203246f0d1ae92d2b61.1722828421.git.haibo1.xu@intel.com>
 <ZrDt_isszRHkFuLu@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZrDt_isszRHkFuLu@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_093509_146454_1A3532AF 
X-CRM114-Status: GOOD (  21.36  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, James Morse <james.morse@arm.com>, xiaobo55x@gmail.com, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 05, 2024 at 04:21:34PM +0100, Catalin Marinas wrote:
> On Mon, Aug 05, 2024 at 11:30:24AM +0800, Haibo Xu wrote:
> > Currently, only acpi_early_node_map[0] was initialized to NUMA_NO_NODE.
> > To ensure all the values were properly initialized, switch to initialize
> > all of them to NUMA_NO_NODE.
> > 
> > Fixes: e18962491696 ("arm64: numa: rework ACPI NUMA initialization")
> > Reported-by: Andrew Jones <ajones@ventanamicro.com>
> > Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/arm64/kernel/acpi_numa.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> > index 0c036a9a3c33..2465f291c7e1 100644
> > --- a/arch/arm64/kernel/acpi_numa.c
> > +++ b/arch/arm64/kernel/acpi_numa.c
> > @@ -27,7 +27,7 @@
> >  
> >  #include <asm/numa.h>
> >  
> > -static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
> > +static int acpi_early_node_map[NR_CPUS] __initdata = { [0 ... NR_CPUS - 1] = NUMA_NO_NODE };

Bah, silly me, sorry.

> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> The patch makes sense but is there any issue currently without it?

I suspect there might be - a cpu associated with NUMA node 0 when it is
actually unspecified in ACPI tables (well, probably not even a real
world bug - I don't know, that's why it was not caught earlier I
believe) but still.

> Trying to assess whether it needs a stable backport.

Whether that's a real bug or not depends on deployed ACPI firmware
tables; if all cores have a proximity domain assigned in the
respective SRAT entries this patch is irrelevant but
technically it is a bug to fix, yes.

Backporting would make sense, it should be innocuous.

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
