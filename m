Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855B4E7B5E5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BcALuVimgszNgGNUcYsnXZawX5SoRUJko68g7n9UgHk=; b=OAamAP99Jx8LXk
	ruW//OZy/8QCRAfRzPPF8G2FNYKgXaHCa6+aLFg33hvpeHhRU4tCNLO5VOmP764PHSpclfitkHG4u
	7zhkwFGD/Q7QNF9SIJ8wobjnrAs6nOjv7LkEDL4MZjTIAvCx/DdTGFXGM2dA+l/E/gZ1SRxnRRdcy
	AuUA0Nv/L1NcVKpxDMnl1/xF2cps3f19poY5cxnqQEQ2uwlXCoTUNp59Byp8MoIYCScnAZwAmAO71
	hjsRvwAhehpM3/D3VWz3l2X+JuumoMXCgorl7KB2NrfxuQ5uy690PAlWe+CAcT5Vf+f03ok0hZ+T6
	vQPfBw+Q0puUxPIvhgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnysh-00HCBg-0y;
	Wed, 04 Oct 2023 10:13:27 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnysd-00HC95-1C
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 10:13:26 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-79fa5d9f3a2so71042539f.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696414401; x=1697019201; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=naQ12yZY9bgpmnWgAWPGFuKak0Xrn0cHsB8SeG3i588=;
        b=ADFLkjIJwYMuJ91hNNYH0+Sj+JvgD0rWaiFAavlg87GhUXj0Pal/pGco3Ht/785kNA
         GgfNBUA7pXDX4UjoG+elRnVCyNa4s6r3R65fMcnND8LImpicJa4IeJ2/57K8TdwTyoVn
         ZaJ6tUWu7NHcUhny8viYcT8K4T1QFWTFtGUlQk6+PQcUSgz1kGSp/0Of+xi5fyFuTYg5
         UgpfMmYkO+C5osHXBzl8BnRyCNTE11tYVlhWlyx4uxR2kTWtF0l7alJWXh9uSoTMTaZY
         1t1clbwhhCG+88y1WAUMkP4qmO+28CVBhZFpOWgut8QWnm4t/o4zq/+EbGcwWwezGwXy
         1Oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696414401; x=1697019201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naQ12yZY9bgpmnWgAWPGFuKak0Xrn0cHsB8SeG3i588=;
        b=HSkzOUtAsMtiXuROPojqGC9ZuBLPcJ/aSLhV75wpm+BWnW27wKk7vEr40y5wY30E5c
         6sY3He7BbOZyXDr44z9uzmAu2O5Mqr4jH9+7S8CaYaOcBdYwB15lxvHxB30/lbl/3Nlm
         YzSm51M0yyZqNco1WyIKnCjL9EO55xyG2/aBUQjzNqUeIoduNPefkestA6ukY0hmiosp
         AeKoqFP2e4W3wj5FTVjBPLH3jXK3jmILcIXoVfbTifVqOTOLHC6EwUQLaMQY8swkk/vd
         j4L0eyF4ihpqtin3KQBoU8JAD532OsF5vCcRBdN3JZjXvYtBxqfqWmxZKKm8g5FFGmIb
         UoUA==
X-Gm-Message-State: AOJu0Yxm/xrbfFYI0/hz2Uf1qPJg131tV6VPMBnxnqNxhk8Rv+Vsixvi
	IuyJHOLe5iKIaPJkSiNK/sOZbA==
X-Google-Smtp-Source: AGHT+IEbM48u0GUrbP675tX7PYXIUL94dARAyy9rnprgPNaHW3R5wUSTDSKo4NbADnyrnWBlyy8OOg==
X-Received: by 2002:a6b:7b05:0:b0:791:280:839e with SMTP id l5-20020a6b7b05000000b007910280839emr1987378iop.16.1696414401162;
        Wed, 04 Oct 2023 03:13:21 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id ep10-20020a0566384e0a00b0042b09bde126sm861366jab.165.2023.10.04.03.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 03:13:20 -0700 (PDT)
Date: Wed, 4 Oct 2023 15:43:07 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2 -next 3/4] RISC-V: cacheflush: Initialize CBO
 variables on ACPI systems
Message-ID: <ZR06s5ZvK1S5XtIJ@sunil-laptop>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
 <20230927170015.295232-4-sunilvl@ventanamicro.com>
 <f4ab7464-3dfb-4d10-8bed-76e7084abd3e@sifive.com>
 <ZRzof1sH/GJNQp4V@sunil-laptop>
 <20231004-58af76b11b3db2e64a93fd55@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004-58af76b11b3db2e64a93fd55@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_031323_426283_B3218B7F 
X-CRM114-Status: GOOD (  32.63  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 04, 2023 at 10:33:31AM +0200, Andrew Jones wrote:
> On Wed, Oct 04, 2023 at 09:52:23AM +0530, Sunil V L wrote:
> > On Tue, Oct 03, 2023 at 02:50:02PM -0500, Samuel Holland wrote:
> > > On 2023-09-27 12:00 PM, Sunil V L wrote:
> > > > Using new interface to get the CBO block size information in RHCT,
> > > > initialize the variables on ACPI platforms.
> > > > 
> > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > ---
> > > >  arch/riscv/mm/cacheflush.c | 37 +++++++++++++++++++++++++++++++------
> > > >  1 file changed, 31 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > > > index f1387272a551..8e59644e473c 100644
> > > > --- a/arch/riscv/mm/cacheflush.c
> > > > +++ b/arch/riscv/mm/cacheflush.c
> > > > @@ -3,7 +3,9 @@
> > > >   * Copyright (C) 2017 SiFive
> > > >   */
> > > >  
> > > > +#include <linux/acpi.h>
> > > >  #include <linux/of.h>
> > > > +#include <asm/acpi.h>
> > > >  #include <asm/cacheflush.h>
> > > >  
> > > >  #ifdef CONFIG_SMP
> > > > @@ -124,15 +126,38 @@ void __init riscv_init_cbo_blocksizes(void)
> > > >  	unsigned long cbom_hartid, cboz_hartid;
> > > >  	u32 cbom_block_size = 0, cboz_block_size = 0;
> > > >  	struct device_node *node;
> > > > +	struct acpi_table_header *rhct;
> > > > +	acpi_status status;
> > > > +	unsigned int cpu;
> > > > +
> > > > +	if (!acpi_disabled) {
> > > > +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> > > > +		if (ACPI_FAILURE(status))
> > > > +			return;
> > > > +	}
> > > >  
> > > > -	for_each_of_cpu_node(node) {
> > > > -		/* set block-size for cbom and/or cboz extension if available */
> > > > -		cbo_get_block_size(node, "riscv,cbom-block-size",
> > > > -				   &cbom_block_size, &cbom_hartid);
> > > > -		cbo_get_block_size(node, "riscv,cboz-block-size",
> > > > -				   &cboz_block_size, &cboz_hartid);
> > > > +	for_each_possible_cpu(cpu) {
> > > > +		if (acpi_disabled) {
> > > > +			node = of_cpu_device_node_get(cpu);
> > > > +			if (!node) {
> > > > +				pr_warn("Unable to find cpu node\n");
> > > > +				continue;
> > > > +			}
> > > > +
> > > > +			/* set block-size for cbom and/or cboz extension if available */
> > > > +			cbo_get_block_size(node, "riscv,cbom-block-size",
> > > > +					   &cbom_block_size, &cbom_hartid);
> > > > +			cbo_get_block_size(node, "riscv,cboz-block-size",
> > > > +					   &cboz_block_size, &cboz_hartid);
> > > 
> > > This leaks a reference to the device node.
> > > 
> > Yep!. I missed of_node_put(). Let me add in next revision. Thanks!
> > 
> > > > +		} else {
> > > > +			acpi_get_cbo_block_size(rhct, cpu, &cbom_block_size,
> > > > +						&cboz_block_size, NULL);
> > > 
> > > This function loops through the whole RHCT already. Why do we need to call it
> > > for each CPU? Can't we just call it once, and have it do the same consistency
> > > checks as cbo_get_block_size()?
> > > 
> > > In that case, the DT path could keep the for_each_of_cpu_node() loop.
> > > 
> > I kept the same logic as DT. Basically, by passing the cpu node, we
> > will fetch the exact CPU's CBO property from RHCT. It is not clear to me
> > why we overwrite the same variable with value from another cpu and
> > whether we can return as soon as we get the CBO size for one CPU.
> > 
> > Drew, can we exit the loop if we get the CBO size for one CPU?
> 
> We want to compare the values for each CPU with the first one we find in
> order to ensure they are consistent. I think Samuel is suggesting that
> we leave the DT path here the same, i.e. keep the for_each_of_cpu_node()
> loop, and then change acpi_get_cbo_block_size() to *not* take a cpu as
> input, but rather follow the same pattern as DT, which is to loop over
> all cpus doing a consistency check against the first cpu's CBO info.
> 
Ahh OK. Thanks Drew and Samuel. Let me update as you suggested.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
