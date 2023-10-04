Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6489E8FDC7
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 04:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwjXWBmGxipqmHHVNmQl63j1+8UhNshoIocYqmW8vVQ=; b=sCrTJvlG1x03Bi
	NPvgweC14nkA8u1ddT9L/1rQ4oaVE7xWrbibHDy48UvIZ3AfL7NCrp7e6FNuNgC7eBCCgcU87zg1C
	vJLow6mFPy9o3oe/IbaVPcI+Tc6+c7mgSImfEQjboajERx3gC+dfLiyhhyv9tf0i8LnT/xIgzZt3j
	LyPpcOqD7PWuX9ySnLhINqUFh9oh/SbeFYU0pfgkvPnTMwDoHdGsFcwa0RdpYx9ETS6VlXgBR1K24
	pJ44mXRQ6Y7ZumhR7wMFS2G/2vwIXBmJNg+z3RG3Bka+RXnWKk4NC6y0KbGAl9k86TNPIkQJIWlRH
	N8YOIt1jAGf8WW2+6BlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qntPG-00G8X6-01;
	Wed, 04 Oct 2023 04:22:42 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qntPB-00G8VD-1v
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 04:22:40 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3528bc102adso6287155ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 21:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696393354; x=1696998154; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ew3FEUrbn98SAij00MK4fNBMQRr8yEG76Zxf5H8HMB8=;
        b=ondiUk9EfQyCObeG6ZEOSo3xSnZ8WoRknEem7LydMClL2lJ8OPBjGPL00+rTVn8Yic
         2Nwkz2OHS4AvxisHCQAn6lXknFUyG0v7xJWhJc7ibNR2vwTM3J1heQ+INpwO4i6k6MIN
         ktbT0c7z3Vh3b6kRYZoCRUHDW4FYgNDxVTvjOSg5duHc8sfCmw4wSuDg4yJW3Tjy9fIG
         TwvheXSoZUdlTpf4jNFKHoyh+lEQ0jB1qTt8cDT6ZlQMc8eqz4A1ICE9H75EJfQsjN2e
         XxrNKDzizGFPBI7cw6SXS1wqQpQG8vCmVgUTs8be2oqrLL5MrsAK1O+BoCxgmC3tGPQc
         VULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696393354; x=1696998154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ew3FEUrbn98SAij00MK4fNBMQRr8yEG76Zxf5H8HMB8=;
        b=YbB3EScEb8uyGfscGVBXaSZsivyMbxYol3wkc86W+BLCPdIhhHsU+ElqOUUyJlHJPM
         z0HsxMBX4A86gUQpsWXfZktpqFqU63dAEDOpscv/omoSFU+ukgMGFfO4jKtuhl6MQIHv
         mtRxoriBAtoXDJsFrGm2k6Y6d1w3Skp2eDHZ733kN/WYwwYscpHrhoB2SPll/Dlzrc4c
         Tu/2U30MvEzw86fBCcAy9+tt2oO/fL8muVR4iG6eWHZiLMpI0bRaQejXPMmb3hYWxTuP
         434ssKPiUCG7duxwPTGEQCSGaipBHlLkHKCZG+QfsZ6Y4/jH0b6IfHbVe/QGZCnJomFc
         xVWA==
X-Gm-Message-State: AOJu0YwzG03x/CP0uy1Nn+UiAIBYn+02YfKevr4rRxBWLvV5rMyNnsHG
	99awDzUfbU6u2pzjF+I7OMRgxw==
X-Google-Smtp-Source: AGHT+IE2Cb8xhdL0QFGsL31ie56dFxiRNfd0SJDXoxFJNEeXrWtrLrX9h9FOPQ4tHmue2X3/RdQE5w==
X-Received: by 2002:a05:6e02:11ad:b0:352:5e6d:b775 with SMTP id 13-20020a056e0211ad00b003525e6db775mr1028822ilj.27.1696393354243;
        Tue, 03 Oct 2023 21:22:34 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id x9-20020a92d309000000b00351268dfbd5sm762830ila.57.2023.10.03.21.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 21:22:33 -0700 (PDT)
Date: Wed, 4 Oct 2023 09:52:23 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>
Subject: Re: [PATCH v2 -next 3/4] RISC-V: cacheflush: Initialize CBO
 variables on ACPI systems
Message-ID: <ZRzof1sH/GJNQp4V@sunil-laptop>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
 <20230927170015.295232-4-sunilvl@ventanamicro.com>
 <f4ab7464-3dfb-4d10-8bed-76e7084abd3e@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4ab7464-3dfb-4d10-8bed-76e7084abd3e@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_212237_659270_7A0C5EF8 
X-CRM114-Status: GOOD (  24.67  )
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

On Tue, Oct 03, 2023 at 02:50:02PM -0500, Samuel Holland wrote:
> On 2023-09-27 12:00 PM, Sunil V L wrote:
> > Using new interface to get the CBO block size information in RHCT,
> > initialize the variables on ACPI platforms.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/mm/cacheflush.c | 37 +++++++++++++++++++++++++++++++------
> >  1 file changed, 31 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index f1387272a551..8e59644e473c 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -3,7 +3,9 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/of.h>
> > +#include <asm/acpi.h>
> >  #include <asm/cacheflush.h>
> >  
> >  #ifdef CONFIG_SMP
> > @@ -124,15 +126,38 @@ void __init riscv_init_cbo_blocksizes(void)
> >  	unsigned long cbom_hartid, cboz_hartid;
> >  	u32 cbom_block_size = 0, cboz_block_size = 0;
> >  	struct device_node *node;
> > +	struct acpi_table_header *rhct;
> > +	acpi_status status;
> > +	unsigned int cpu;
> > +
> > +	if (!acpi_disabled) {
> > +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> > +		if (ACPI_FAILURE(status))
> > +			return;
> > +	}
> >  
> > -	for_each_of_cpu_node(node) {
> > -		/* set block-size for cbom and/or cboz extension if available */
> > -		cbo_get_block_size(node, "riscv,cbom-block-size",
> > -				   &cbom_block_size, &cbom_hartid);
> > -		cbo_get_block_size(node, "riscv,cboz-block-size",
> > -				   &cboz_block_size, &cboz_hartid);
> > +	for_each_possible_cpu(cpu) {
> > +		if (acpi_disabled) {
> > +			node = of_cpu_device_node_get(cpu);
> > +			if (!node) {
> > +				pr_warn("Unable to find cpu node\n");
> > +				continue;
> > +			}
> > +
> > +			/* set block-size for cbom and/or cboz extension if available */
> > +			cbo_get_block_size(node, "riscv,cbom-block-size",
> > +					   &cbom_block_size, &cbom_hartid);
> > +			cbo_get_block_size(node, "riscv,cboz-block-size",
> > +					   &cboz_block_size, &cboz_hartid);
> 
> This leaks a reference to the device node.
> 
Yep!. I missed of_node_put(). Let me add in next revision. Thanks!

> > +		} else {
> > +			acpi_get_cbo_block_size(rhct, cpu, &cbom_block_size,
> > +						&cboz_block_size, NULL);
> 
> This function loops through the whole RHCT already. Why do we need to call it
> for each CPU? Can't we just call it once, and have it do the same consistency
> checks as cbo_get_block_size()?
> 
> In that case, the DT path could keep the for_each_of_cpu_node() loop.
> 
I kept the same logic as DT. Basically, by passing the cpu node, we
will fetch the exact CPU's CBO property from RHCT. It is not clear to me
why we overwrite the same variable with value from another cpu and
whether we can return as soon as we get the CBO size for one CPU.

Drew, can we exit the loop if we get the CBO size for one CPU?

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
