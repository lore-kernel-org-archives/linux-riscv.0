Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0373E8FDDB
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFdM+RknKDFyTn5kkGsprKWIJOj29JV3+byN7JIwyzM=; b=Qu02k8uug85S40
	8yYx02MZ08CGUqNCQ8Iy5Zai54ofudzw4lyEMxcvIEq6LArAAzjNImH8MPLLBy4qNpXIyRsh0/A3C
	N5RxN8G2wq8os17xhZRrSl25j0A+ZNsA0Fey6kwihyu477jCF6SpMyZM6xB7y1FEQt2KufNPOqOr4
	EBSzUwksp2cZUO4/0Bq+1/Zx5V8cN92SlowZ5Oy5zx1KWg31CbwGkrFXWhvNJdDqv8QdS6UkSW/di
	1nx6oLOk6P/vqtawPcNXND3dpTvg48yi7T4+N2Y3N5L0wIVVb2qStbtqqcb2WAfWK2pYKiDP6iYnB
	8BPu5KWbufhI5icKpJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxK7-00GqgC-0x;
	Wed, 04 Oct 2023 08:33:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxK4-00Gqdi-0M
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 08:33:37 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-532c81b9adbso3153945a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696408413; x=1697013213; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ESJK41d6OgR3seh2ygAk4MlFIHKl40A8SsuP64iwTcA=;
        b=H+KZpuL0Qx5tMvrXAIHpNc6vzdXw2zpt75b7lyTTYDKwZEiQuoNubSjPKp8ihOB6cY
         PTT6kGu9qqkYDnR/xGBQ8dTWZ6nz4w+mcSkC/v5OFowT7JLkJj1wOL2j6NIWijt0b/lQ
         38buXSigqtItzvLBT9j+4k6ZIVYAHTzv5hR1yzkOkUg7AbrO/LKoVglzfovgLl4dgwxP
         eDQu4rx/iB2mIW8NNdPyvVulgnBYv1Bwl+Vp0CjBrtdAYZv24YVBgSlZFcVXPBSj4ckI
         A9GmEyYESvL6YQDQ9y9SSx9d3BP+DB0lP3JSvOEERS8ymOGAtUdJ7YrMdgs1F1QOBiIK
         l4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696408413; x=1697013213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESJK41d6OgR3seh2ygAk4MlFIHKl40A8SsuP64iwTcA=;
        b=F2+kPJz6mUXGYko5w/VJJ96+1hC3dNtpHnx7uWSXGlTw3M69hwW+WaTZjwbC3SBEjY
         ikVqZ6pvgIvG3IS5HSxrjM5UfFgEN974xb6Ny9M/mPhd46vM3PiAnN5dxUK0ZWhw8yIP
         GMj0hBz85SpusbU1a+x3EAGm/Qm3R0qjLctdEMwxaPFQxUzGMH5SqmGQHp/vAPDulwzH
         QBP5vwIprkkR2Xjlm1qPtWjIBcmYdzG6LJbuiluLSrYaRrlq+9f/SV9kuAyvSlz3fjNI
         OMfDBa5RSObLGiejQFF+IwcNOa3ZULZWPfp9kJxXQi4YvuIIa5hNrmeMKZVzPsTBBNKu
         R6yA==
X-Gm-Message-State: AOJu0YxwMsDNqQm2FJtuTCLruyqk6ykVubnbDL2XwlGbPNk+sDwe4/O1
	txarv7r3J62SPXN9UXz9WxUU2Ghq90j+sULGKQE=
X-Google-Smtp-Source: AGHT+IHsdVSR3lB99ndZrLstTMj2simAYzH+/ZkHt3CEzPElAq0jjok3rxxGVIpBP3HZkwlLU0Q4TA==
X-Received: by 2002:a05:6402:1843:b0:522:580f:8c75 with SMTP id v3-20020a056402184300b00522580f8c75mr1245485edy.17.1696408412466;
        Wed, 04 Oct 2023 01:33:32 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id w9-20020aa7dcc9000000b00537708be5c6sm2069890edu.73.2023.10.04.01.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 01:33:32 -0700 (PDT)
Date: Wed, 4 Oct 2023 10:33:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Subject: Re: [PATCH v2 -next 3/4] RISC-V: cacheflush: Initialize CBO
 variables on ACPI systems
Message-ID: <20231004-58af76b11b3db2e64a93fd55@orel>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
 <20230927170015.295232-4-sunilvl@ventanamicro.com>
 <f4ab7464-3dfb-4d10-8bed-76e7084abd3e@sifive.com>
 <ZRzof1sH/GJNQp4V@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZRzof1sH/GJNQp4V@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_013336_152606_672A1B8C 
X-CRM114-Status: GOOD (  29.61  )
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

On Wed, Oct 04, 2023 at 09:52:23AM +0530, Sunil V L wrote:
> On Tue, Oct 03, 2023 at 02:50:02PM -0500, Samuel Holland wrote:
> > On 2023-09-27 12:00 PM, Sunil V L wrote:
> > > Using new interface to get the CBO block size information in RHCT,
> > > initialize the variables on ACPI platforms.
> > > 
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > ---
> > >  arch/riscv/mm/cacheflush.c | 37 +++++++++++++++++++++++++++++++------
> > >  1 file changed, 31 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > > index f1387272a551..8e59644e473c 100644
> > > --- a/arch/riscv/mm/cacheflush.c
> > > +++ b/arch/riscv/mm/cacheflush.c
> > > @@ -3,7 +3,9 @@
> > >   * Copyright (C) 2017 SiFive
> > >   */
> > >  
> > > +#include <linux/acpi.h>
> > >  #include <linux/of.h>
> > > +#include <asm/acpi.h>
> > >  #include <asm/cacheflush.h>
> > >  
> > >  #ifdef CONFIG_SMP
> > > @@ -124,15 +126,38 @@ void __init riscv_init_cbo_blocksizes(void)
> > >  	unsigned long cbom_hartid, cboz_hartid;
> > >  	u32 cbom_block_size = 0, cboz_block_size = 0;
> > >  	struct device_node *node;
> > > +	struct acpi_table_header *rhct;
> > > +	acpi_status status;
> > > +	unsigned int cpu;
> > > +
> > > +	if (!acpi_disabled) {
> > > +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> > > +		if (ACPI_FAILURE(status))
> > > +			return;
> > > +	}
> > >  
> > > -	for_each_of_cpu_node(node) {
> > > -		/* set block-size for cbom and/or cboz extension if available */
> > > -		cbo_get_block_size(node, "riscv,cbom-block-size",
> > > -				   &cbom_block_size, &cbom_hartid);
> > > -		cbo_get_block_size(node, "riscv,cboz-block-size",
> > > -				   &cboz_block_size, &cboz_hartid);
> > > +	for_each_possible_cpu(cpu) {
> > > +		if (acpi_disabled) {
> > > +			node = of_cpu_device_node_get(cpu);
> > > +			if (!node) {
> > > +				pr_warn("Unable to find cpu node\n");
> > > +				continue;
> > > +			}
> > > +
> > > +			/* set block-size for cbom and/or cboz extension if available */
> > > +			cbo_get_block_size(node, "riscv,cbom-block-size",
> > > +					   &cbom_block_size, &cbom_hartid);
> > > +			cbo_get_block_size(node, "riscv,cboz-block-size",
> > > +					   &cboz_block_size, &cboz_hartid);
> > 
> > This leaks a reference to the device node.
> > 
> Yep!. I missed of_node_put(). Let me add in next revision. Thanks!
> 
> > > +		} else {
> > > +			acpi_get_cbo_block_size(rhct, cpu, &cbom_block_size,
> > > +						&cboz_block_size, NULL);
> > 
> > This function loops through the whole RHCT already. Why do we need to call it
> > for each CPU? Can't we just call it once, and have it do the same consistency
> > checks as cbo_get_block_size()?
> > 
> > In that case, the DT path could keep the for_each_of_cpu_node() loop.
> > 
> I kept the same logic as DT. Basically, by passing the cpu node, we
> will fetch the exact CPU's CBO property from RHCT. It is not clear to me
> why we overwrite the same variable with value from another cpu and
> whether we can return as soon as we get the CBO size for one CPU.
> 
> Drew, can we exit the loop if we get the CBO size for one CPU?

We want to compare the values for each CPU with the first one we find in
order to ensure they are consistent. I think Samuel is suggesting that
we leave the DT path here the same, i.e. keep the for_each_of_cpu_node()
loop, and then change acpi_get_cbo_block_size() to *not* take a cpu as
input, but rather follow the same pattern as DT, which is to loop over
all cpus doing a consistency check against the first cpu's CBO info.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
