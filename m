Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6668C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TS4HYS7wTadqMnOD7DAsdAX5cbj4asOSCqqVm4BRF9g=; b=1JCnQ4Or9p2p2q
	fRXylSgNpa/+Q+X1Hs6DX4KQsPC14TN1d8zk3tPLVtvKHYVg47yk8swX5nqvynDlajskcrlnyQNZ/
	wDh/3PY4H/fhjDndyU/+ad9BXSrEc4xg8RdTRmrppHpKraYrutiQfs8cxnMH+/qvZ22vlQ/NvsG5X
	6naNlS3QYpv3VWO68/v+62MCAGD+AhwCjWIPj2p+HHz7bdnxcWfcWtVWrR6TTTGKRAjZT0YqgrtMI
	0slQ5mcc9JIVRI+yTxL9xP3HxdhJLID508LqvheMf86rtwf+JTKVjF4z5ug0CkjR/KyD22a5MwFVA
	Hc5rmaW04HGCH+maKk5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcqv-00FicO-FM; Mon, 13 Feb 2023 17:42:57 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcqs-00FibU-BJ
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 17:42:55 +0000
Received: by mail-pj1-x1036.google.com with SMTP id bg2so3355622pjb.4
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 09:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63tgpONA5oEu3r5P/vFkJgnRoA403HiDXnWl8FkdsxY=;
        b=CVfpMPtijfInoSnQpBF8R6F6pOwoURmAmUhAO0Ls5W0RJ19Kqny2+q9xHUtsqxuMFE
         4VoIyg7DLnr/Kv1UtH8rj/8j/Ef50RH/8nHsHONO1lJ8ORhIQjnSUpnu1Q/i2fJwhJTu
         dYyCbgxrwmZIZh/+bCnMDaB7q38U9Yb75ltIpkZwIMSUUAmAdPPb+clSG24WmGTeRgV5
         kkHmwES5ttEJkxeYuw6x5nORJIV2GsQMk0RauPIsYPg/j3ebpXAUGVpTG4REF1wXYfOK
         AeypvyUChsBD3cBxc5x/hEohE1TT5FpPtaVATqkfdiR29VOpLKsfZTK3tSEArG9s1W80
         dgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63tgpONA5oEu3r5P/vFkJgnRoA403HiDXnWl8FkdsxY=;
        b=S1Kq2lrE4Y4pw3pM98EIMwHSOyNZIGLHlXcC5VgX6quk7yB9195DG4BLDwxqI3r6hY
         HjsQ0OiP11sjKsWfO0XIQuDGwE3pqmVvSpUVLx4FDI/cxlsHMCDmbLoAZyqH3t/P6Jtv
         5LCUAULS4nWs47Slb8dFgDbfxaTwaJWGTaff/xsynLOLiHhG+tIsTDT0p6KZmYYm5C+k
         93BboeuSkWr0x56BhIuyZ1bInMz2L+6p8dbckbrJM2/yrXLWYG3nWf5XyIu+BbeVYL6v
         ghfz8tNgRnHfxiXFwr59xcEmm7eHLp1j38BLQRkafeCZxu3txQW9gSjPmVQRPA/MiYFo
         pIjw==
X-Gm-Message-State: AO0yUKX+uj//UrtUVmJ7Z5uJkInob4CEnGiNnIUrl7kN4evOCfYf+9t8
	tmlBjlExo7Q0gSRAqBRP0y1FdA==
X-Google-Smtp-Source: AK7set86hl+mztS6xB+aIB6Jg2wbDUvNJaUXGkDMvsSk3YuBBmWG2qIWwzDKoxBGkz7EE3uL9bZIbA==
X-Received: by 2002:a05:6a20:6d27:b0:bc:80bd:462d with SMTP id fv39-20020a056a206d2700b000bc80bd462dmr13919386pzb.46.1676310171263;
        Mon, 13 Feb 2023 09:42:51 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id u5-20020a17090a890500b0023086d280c5sm7609169pjn.3.2023.02.13.09.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:42:50 -0800 (PST)
Date: Mon, 13 Feb 2023 23:12:40 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 20/24] RISC-V: ACPI: cpu: Enable cpuinfo for ACPI systems
Message-ID: <Y+p2kKdfogLkhkj2@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-21-sunilvl@ventanamicro.com>
 <Y+ViASnch0Fp1rju@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+ViASnch0Fp1rju@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_094254_434382_709BDB03 
X-CRM114-Status: GOOD (  25.62  )
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

On Thu, Feb 09, 2023 at 09:13:37PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:21PM +0530, Sunil V L wrote:
> > On ACPI based platforms, few details like ISA need to be read
> > from the ACPI table. Enable cpuinfo on ACPI based systems.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/cpu.c | 36 +++++++++++++++++++++++++++++-------
> >  1 file changed, 29 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 1b9a5a66e55a..bd6c0fcfe4ce 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -3,6 +3,7 @@
> >   * Copyright (C) 2012 Regents of the University of California
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/cpu.h>
> >  #include <linux/init.h>
> >  #include <linux/seq_file.h>
> > @@ -256,26 +257,47 @@ static void c_stop(struct seq_file *m, void *v)
> >  {
> >  }
> >  
> > +#ifdef CONFIG_ACPI
> > +void acpi_print_hart_info(struct seq_file *m,
> > +			  unsigned long cpu)
> 
> Surely this fits on one line?
> 
Okay

> > +{
> > +	const char *isa;
> > +
> > +	if (!acpi_get_riscv_isa(NULL, get_acpi_id_for_cpu(cpu), &isa))
> > +		print_isa(m, isa);
> 
> Do you really need to guard this function? Aren't there nop'ed versions
> of acpi_get_riscv_isa() and get_acpi_id_for_cpu() in acpi.h?
> 
> IMO, basically any use of ifdeffery you can cleanly remove from a c file
> is a worthwhile change.
> 
You are right. Let me remove ifdef.

> > +
> 
> Extra blank line here FYI.
> 
> > +}
> > +#endif
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
> > +		if (!of_property_read_string(node, "compatible", &compat)
> > +		    && strcmp(compat, "riscv"))
>                     ^^ this should be on the line above
> TBH the whole series is in need of a checkpatch --strict run IMO,
> there's a bunch of coding style issues throughout.
> 
I just moved this line as is. Sure, let me fix it. Thanks.

> > +			seq_printf(m, "uarch\t\t: %s\n", compat);
> > +		of_node_put(node);
> > +	}
> > +#ifdef CONFIG_ACPI
> > +	else
> > +		acpi_print_hart_info(m, cpu_id);
> 
> Delete the ifdeffery here too please :)
> 
Okay

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
