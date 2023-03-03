Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DD6C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzDqgcfrzUX84SnMx4/TcKxIsYxh+sr7E6HLH0jwc6A=; b=STTWPJnauAfG3e
	CZU9OlFTtyUUZ2zZpNnG3Jtw5qJAtcQrYMeQ/NMs1maC447dll4WuR7N6L7DIWAOE1//6WnLlVch8
	xPz71mkt7PuYhwnFqoehx8uZ5B8ToFrCUvQIV9IsVTophUE400WqhGpxQkqV1tMzD9Rr7Z1V/nDNy
	6X6glG6E1qstIOvopv0Oqv8aWbZEHvxci6wen8/jdPh4vRSJMyvb/c7BiO0fvooqig69E91BcXGkJ
	KbpszUbZL6HfwKTCUDHbViG5IrTB1Rdk7L4kq3l8HUpbCHpuvCGsOhinb/4/WROWzUaFh9ntAV0yJ
	lEgmG4YMniHB0UEbSyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY87S-006nOO-5P; Fri, 03 Mar 2023 16:18:54 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY87O-006nMY-RH
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 16:18:52 +0000
Received: by mail-ed1-x531.google.com with SMTP id f13so12416266edz.6
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 08:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OFUF1lBawdy3HQTMvToE8tlc5+s1Z78NHFKh5Xpfejo=;
        b=dmxu/HtmCT/N/FbMcM0CxEtxN8TIOUKS/d6g5Fw6aH5SNapP6ZtIwiTmzTYiyqwCHF
         v28/pdBIm8n8TT63ky2K23Esq4AmQbUQ1eJsMJtUUO7OvYQlqP26dP23XVQ5snpjCKT1
         H/0eH8d0MDugpkwJQzpYeGa5iHJ0ulHki/9MSIiUUAZ82qfhOqJ+GxDmA/3wHAAlfFxf
         zDVfMz9bR3P/79vrN1umXds3o3Mj+5MTVfmyBwZeoIdWJvRRPOe48lnrDKJrFP44NpXg
         ceuMMXKg6iVA+kreLoZ1SaiXLk7OvDB8vYcRfTeDAqukj0Ac6jkIzGN9aCKkcinCdjaQ
         pFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFUF1lBawdy3HQTMvToE8tlc5+s1Z78NHFKh5Xpfejo=;
        b=c+yHpSpoOLImVGhMGcXL0jixNO/IKZrO+NbvObYkuip5xZs9L6gR+fW2IPxpD0XTMS
         Z6+dnvaxQwPDfe2micyv+TO+k9nG8jdBaQnKajA6CGUFoneEuzm7C1g0AaoGHlRyjQIc
         9Jd52JpcCGpMJdclyLdrsD7E6l4lv4w/9WzFWe1StnO9Bra7Go5cU8feDsY/YdQChE7n
         3m4yBCoSIAAcscZ7KQ+z59wYSuM69AF7dKtRNoH9eMMdbps97BNEHwvuhrb4zn/7uuOX
         2/tMSheuJxa0Ojhlaa0/L1D8aAq5YGA1RTT9qyvdRZ49aJChVPOoO8z6Um9ZB/OTqrD1
         p7RA==
X-Gm-Message-State: AO0yUKVjElcB8BTnmSPX9GAK5WB2OUk8hXdASl1KhFoZufyMIsti8MSX
	dfG8vpd1YlsjZXz2vOZH7is2sQ==
X-Google-Smtp-Source: AK7set9KFbKWbHzMH5IwdN7fAabZAjcAVpz6yuy3G52zPbL1ze7nJgA7ll7IYlauO19cTFJaipxlnQ==
X-Received: by 2002:aa7:d88c:0:b0:4ab:4c36:463c with SMTP id u12-20020aa7d88c000000b004ab4c36463cmr2491680edq.16.1677860327018;
        Fri, 03 Mar 2023 08:18:47 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id si9-20020a170906cec900b008c5075f5331sm1083378ejb.165.2023.03.03.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:46 -0800 (PST)
Date: Fri, 3 Mar 2023 17:18:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 13/20] RISC-V: cpu: Enable cpuinfo for ACPI systems
Message-ID: <20230303161845.rzx2bxmvcij5vrzr@orel>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-14-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303133647.845095-14-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_081850_940067_6972E6B8 
X-CRM114-Status: GOOD (  17.99  )
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

On Fri, Mar 03, 2023 at 07:06:40PM +0530, Sunil V L wrote:
> On ACPI based platforms, few details like ISA need to be read
> from the ACPI table. Enable cpuinfo on ACPI based systems.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/kernel/cpu.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 8400f0cc9704..80101bf77dab 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -3,10 +3,12 @@
>   * Copyright (C) 2012 Regents of the University of California
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/seq_file.h>
>  #include <linux/of.h>
> +#include <asm/acpi.h>
>  #include <asm/csr.h>
>  #include <asm/hwcap.h>
>  #include <asm/sbi.h>
> @@ -283,23 +285,32 @@ static void c_stop(struct seq_file *m, void *v)
>  static int c_show(struct seq_file *m, void *v)
>  {
>  	unsigned long cpu_id = (unsigned long)v - 1;
> -	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
>  	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
> +	struct device_node *node;
>  	const char *compat, *isa;
>  
>  	seq_printf(m, "processor\t: %lu\n", cpu_id);
>  	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
> -	if (!of_property_read_string(node, "riscv,isa", &isa))
> -		print_isa(m, isa);
> -	print_mmu(m);
> -	if (!of_property_read_string(node, "compatible", &compat)
> -	    && strcmp(compat, "riscv"))
> -		seq_printf(m, "uarch\t\t: %s\n", compat);
> +
> +	if (acpi_disabled) {
> +		node = of_get_cpu_node(cpu_id, NULL);
> +		if (!of_property_read_string(node, "riscv,isa", &isa))
> +			print_isa(m, isa);
> +		print_mmu(m);
> +		if (!of_property_read_string(node, "compatible", &compat) &&
> +		    strcmp(compat, "riscv"))
> +			seq_printf(m, "uarch\t\t: %s\n", compat);
> +		of_node_put(node);
> +	} else {
> +		if (!acpi_get_riscv_isa(NULL, get_acpi_id_for_cpu(cpu_id), &isa))
> +			print_isa(m, isa);
> +		print_mmu(m);
> +	}
> +
>  	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
>  	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
>  	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
>  	seq_puts(m, "\n");
> -	of_node_put(node);
>  
>  	return 0;
>  }
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
