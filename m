Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1819DC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 12:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/s4hpsek+93YCOCTBEdkFk+6nUCtNTOjIoLzWJhNoU=; b=jTsZCmALdLqPT1
	YIQCPHNOs+c2op1Ij+K26uHfwpeddSKQKeUdWmwQv5vVaDddb4QBzf4JasgnsGp4oI6epnDLzOEsH
	Kp7R8ZYpSkTnCnY0Z0nXXluhzI8BVxrvocnItItIdYrH5MgEIw2uDF05wZMhXpP7plh0mAGv8+wdh
	kCRSF4x2p8xBHE/oN7Ozh9KPmliWlamXpyY9Lvxpl9YtZ7vdXawzbdr6QgxJdQoJrVrvpeP/XEk7/
	bM7mtJrDDeq0Ez0wvV+PrWnvr9czVB5X3c6QGXYHY5SGW49lQNbs5/4GYotuFEeRk9G6I7KZXn8dM
	blqzte0I7CZTgrxXP0HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXGb-002P7S-QN; Fri, 24 Feb 2023 12:33:37 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXGW-002P61-O1
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 12:33:36 +0000
Received: by mail-pj1-x1029.google.com with SMTP id oe18-20020a17090b395200b00236a0d55d3aso2540493pjb.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 04:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=33SPJrepXDYssJSSelUFbYD0nTs1piiuF+fmKofYKbQ=;
        b=HZjYKspC5Lg+X2Vc9+J+jE4cCFYNqipGB40OShgGw1NkXykEcvmXTg3EkUMMJ0Krvq
         GirqMJEO2TtJ9E3eYI8I6jWMOAqAeSJuiQT4psC4ab29hORjztAwkbW3JR8govjoCuZX
         kq+dIR0feWtHrGqS5CIxTm+uAdbbY94+z1t/F7ehxZ4bSnq9O6hyqHht8cm/ZSXec9w/
         hN7Hxvf33LQJF9T6ZiavpINS3coNhyiK68zbYhbTpEeJAesWNHBSTRkFkCcqq3JuQaHX
         9SnFSd188NFbKPg0sqNBf11jT074nHgWyuurp4rkBXTfn84I6WJI9Ymsbiwl9RinrKej
         ZQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33SPJrepXDYssJSSelUFbYD0nTs1piiuF+fmKofYKbQ=;
        b=vveHP0+8Cvv8rkDjJc5BkzBljDKV01iHlcTT32jf0ssURKFinCzEBnke+FVR2WBXvY
         vHTL0zY81rgvsZGg1+LKf6fw/7zMJSTimwrtKL1D9HeCcw9sIvZFMlbdql1A7aCncXvs
         mq8rYu4QrxX00X4Rooovlng5/aSSjMA184Vhst8Cwwfnt1P98sgAyPc2tfDpmF2LJdRq
         z8yzvmBPVcodSM+V+ucwALxfKeU3CmRU7wpXXI2MWXixm7Z8a8Uec4dle3YreGxq+uA4
         Fv4O3XF6tgvAvTxOrye2BRm5l4c8+zQYFu49mXg3Sh4Od7FrE9TWIL+NN7XwTcJ2wNfn
         w+bQ==
X-Gm-Message-State: AO0yUKXzSK++QpuwlMW8Ldi4jyX4CqOJH9ndZirKJ4+oCPwOdB7MABQ2
	85MVdJGl3uAO6TSSBxNbb4LjPQ==
X-Google-Smtp-Source: AK7set8lh4oq9Ny2jUvEaopudjtRsPWRkWSe2qv0BwYCD1GzQdlvIN5SMUosnRA8cejuyeAa/JHwWg==
X-Received: by 2002:a05:6a20:a020:b0:cb:db9d:f78d with SMTP id p32-20020a056a20a02000b000cbdb9df78dmr9506579pzj.47.1677242009581;
        Fri, 24 Feb 2023 04:33:29 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id u2-20020a62ed02000000b005e0699464e3sm1835833pfh.206.2023.02.24.04.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 04:33:29 -0800 (PST)
Date: Fri, 24 Feb 2023 18:03:20 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 17/21] RISC-V: time.c: Add ACPI support for time_init()
Message-ID: <Y/iukIjBKO0wRm/X@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-18-sunilvl@ventanamicro.com>
 <20230220195808.reyuclvefujucpsq@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230220195808.reyuclvefujucpsq@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_043332_806548_751991EB 
X-CRM114-Status: GOOD (  21.28  )
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

On Mon, Feb 20, 2023 at 08:58:08PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:39PM +0530, Sunil V L wrote:
> > On ACPI based platforms, timer related information is
> > available in RHCT. Add ACPI based probe support to the
> > timer initialization.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  arch/riscv/kernel/time.c | 25 +++++++++++++++++++------
> >  1 file changed, 19 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> > index 1cf21db4fcc7..e49b897fc657 100644
> > --- a/arch/riscv/kernel/time.c
> > +++ b/arch/riscv/kernel/time.c
> > @@ -4,6 +4,7 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/of_clk.h>
> >  #include <linux/clockchips.h>
> >  #include <linux/clocksource.h>
> > @@ -18,17 +19,29 @@ EXPORT_SYMBOL_GPL(riscv_timebase);
> >  void __init time_init(void)
> >  {
> >  	struct device_node *cpu;
> > +	struct acpi_table_rhct *rhct;
> > +	acpi_status status;
> >  	u32 prop;
> >  
> > -	cpu = of_find_node_by_path("/cpus");
> > -	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
> > -		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
> > -	of_node_put(cpu);
> > -	riscv_timebase = prop;
> > +	if (acpi_disabled) {
> > +		cpu = of_find_node_by_path("/cpus");
> > +		if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
> > +			panic("RISC-V system with no 'timebase-frequency' in DTS\n");
> > +		of_node_put(cpu);
> > +		riscv_timebase = prop;
> > +	} else {
> > +		status = acpi_get_table(ACPI_SIG_RHCT, 0, (struct acpi_table_header **)&rhct);
> > +		if (ACPI_FAILURE(status))
> > +			panic("RISC-V ACPI system with no RHCT table\n");
> > +		riscv_timebase = rhct->time_base_freq;
> > +		acpi_put_table((struct acpi_table_header *)rhct);
> > +	}
> >  
> >  	lpj_fine = riscv_timebase / HZ;
> >  
> > -	of_clk_init(NULL);
> > +	if (acpi_disabled)
> > +		of_clk_init(NULL);
> 
> I think we should be able to move of_clk_init() up into the acpi_disabled
> arm rather than add another if here.

Yes, will update.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
