Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0301DC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 12:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+J6HOccN524MjaO5FndwVdAZBPfW9AgQUHJEKF3rxs=; b=l80TnTxfqssnTB
	OMoUsxBCMvsRw7rx5tXGl1cGSLwRI1JlVbwQyizuYhe41umtKcd7nneTUuZJrTpWKtMALwxfBWxOg
	6eTeqEbxPjgF/rMw/MYvvPVpp5JXktrvNQDj0Kctb4tyc7Q2ggQIZiFPoWfxMAdfkGReqNS+hVIhq
	X2jc1GQ3NTDp+Qrvgbl4IkjnXgP6uIFZHErTERYa/zHzquEFs6TmJE+c7PckLn1aFpvcNDjvRl1cg
	0MLSFftk5HYo6TsIZF0aggRYnlNQoPIWNeYMyyfWjPgk96jcipUeBPttNqDApaxaQeo9XQB5lmTQN
	TNAHqcKXowoddXwJ9h7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXBH-002O8i-6R; Fri, 24 Feb 2023 12:28:07 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXBE-002O7M-69
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 12:28:05 +0000
Received: by mail-pj1-x1031.google.com with SMTP id oe18-20020a17090b395200b00236a0d55d3aso2521861pjb.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 04:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwYpSkYarWM8KK06DmjpU0SsZ80bpXD8ml+czU18ph4=;
        b=oTGbRFBV85WT/P+apuKTFB8ImIliAlw8Q1W+9qFq7T1rquTOiN7YtSjiu7ZSPKsbtz
         3TdWTwd8QJ5wX1ZII1KsmMnSOJhZliUJOv9OCs6BBYn+xlnJ6XCpllseBFj4NuicmRTt
         CIx1TZO6K1zeMl45l5bADxsZOnD281Hh4DMRbtZA6/y2Qonv7MjwQDV94kdFo3um9h1X
         9SURMFmrw6khKTBjyc9/m7ktkJtr1QH6lmbxGLxu9pXbjFhG/mZBv8U/vygcRGRvyE3g
         geryxmJTxC84mhl0ev42ge6nYequ28IDr4X3PRj3p1Dzp/6o9FRH18i6+WcZrjUuxpSt
         g7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwYpSkYarWM8KK06DmjpU0SsZ80bpXD8ml+czU18ph4=;
        b=uZnfrdkeQZQ8MFKK6Jf/upE46XuBUG4Cr4v3NmVzIlJtzewIW6L8LED1FWe/srR74D
         SW7GaxDMTuhYS/0smj53A89UavBuu0BhEMDES+tX+3d5bXEPoSqdpf38rXJns2fJsYpQ
         iqg5oyFGwP8LI8wYdVD3aY4rkKFp0zKHMwS5875/bitCmQcmIwedhH5zKYWChHZlyMVz
         CWnPw8qhzqNkUUvVRNwrkpbtK87Ajv7Qpqtvozzrg3crrQ9ofG2ZIDGyYlHHHIozwblg
         bWmWGsCmuasLoLIXAdqX3ahpigzQiSlr92GaS14RxaM9uhEVmApsHMIdWs5m0LKbfRjj
         DeSQ==
X-Gm-Message-State: AO0yUKWaEoPAF4EBNrEFUfM45IwYh0R9pI2YTyiTDDMHzNbHscYSNVpl
	F/TXSjoBFI5pDv11loxS6nZ2MA==
X-Google-Smtp-Source: AK7set/jhV4LyEc2Pc7U9dYmeepbpGtwrM+HLOiB2J748SFbDrW80kFfcTA8PubYOPn/br7Mj7juCA==
X-Received: by 2002:a05:6a20:8f10:b0:cb:a66b:3a88 with SMTP id b16-20020a056a208f1000b000cba66b3a88mr12686571pzk.1.1677241677760;
        Fri, 24 Feb 2023 04:27:57 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id h18-20020a656392000000b004fbe302b3f6sm1047553pgv.74.2023.02.24.04.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 04:27:57 -0800 (PST)
Date: Fri, 24 Feb 2023 17:57:48 +0530
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
Subject: Re: [PATCH V2 13/21] RISC-V: cpu: Enable cpuinfo for ACPI systems
Message-ID: <Y/itRLrYiWCJjCcc@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-14-sunilvl@ventanamicro.com>
 <20230220175429.dzojoryw2dhhbodl@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230220175429.dzojoryw2dhhbodl@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_042804_249255_E4B38EE8 
X-CRM114-Status: GOOD (  22.76  )
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

On Mon, Feb 20, 2023 at 06:54:29PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:35PM +0530, Sunil V L wrote:
> > On ACPI based platforms, few details like ISA need to be read
> > from the ACPI table. Enable cpuinfo on ACPI based systems.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  arch/riscv/kernel/cpu.c | 31 ++++++++++++++++++++++++-------
> >  1 file changed, 24 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 1b9a5a66e55a..a227c0661b19 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -3,10 +3,12 @@
> >   * Copyright (C) 2012 Regents of the University of California
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/cpu.h>
> >  #include <linux/init.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/of.h>
> > +#include <asm/acpi.h>
> >  #include <asm/csr.h>
> >  #include <asm/hwcap.h>
> >  #include <asm/sbi.h>
> > @@ -256,26 +258,41 @@ static void c_stop(struct seq_file *m, void *v)
> >  {
> >  }
> >  
> > +static void acpi_print_hart_info(struct seq_file *m, unsigned long cpu)
> > +{
> > +	const char *isa;
> > +
> > +	if (!acpi_get_riscv_isa(NULL, get_acpi_id_for_cpu(cpu), &isa))
> > +		print_isa(m, isa);
> > +}
> > +
> >  static int c_show(struct seq_file *m, void *v)
> >  {
> >  	unsigned long cpu_id = (unsigned long)v - 1;
> > -	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
> >  	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
> > +	struct device_node *node;
> >  	const char *compat, *isa;
> >  
> >  	seq_printf(m, "processor\t: %lu\n", cpu_id);
> >  	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
> > -	if (!of_property_read_string(node, "riscv,isa", &isa))
> > -		print_isa(m, isa);
> > +
> > +	if (acpi_disabled) {
> > +		node = of_get_cpu_node(cpu_id, NULL);
> > +		if (!of_property_read_string(node, "riscv,isa", &isa))
> > +			print_isa(m, isa);
> > +		if (!of_property_read_string(node, "compatible", &compat) &&
> > +		    strcmp(compat, "riscv"))
> > +			seq_printf(m, "uarch\t\t: %s\n", compat);
> > +		of_node_put(node);
> > +	} else {
> > +		acpi_print_hart_info(m, cpu_id);
> 
> I don't think we need the helper function for the two lines which would
> otherwise nicely complement the two similar DT lines above.
> 
Agree. Let me remove it.

> > +	}
> > +
> >  	print_mmu(m);
> > -	if (!of_property_read_string(node, "compatible", &compat)
> > -	    && strcmp(compat, "riscv"))
> > -		seq_printf(m, "uarch\t\t: %s\n", compat);
> 
> This will now print uarch before mmu for DT systems.
> 
Yeah. Let me fix it.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
