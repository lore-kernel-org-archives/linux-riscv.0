Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E640C83F11
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23BefqAT1JwEGVv64jE94nj+ESstJO3P8JzykYvYfcY=; b=hBfXCmBTdtj6cQ
	QVuYDDcVjWeUvbINLmzWWgRDhYGHXZMaK16vqfhj2qyYRYqJbFjLFpkr3sI5FfRrx3tBKNZcZ1/iL
	urJrNSr6oc52O6uepnOwDTKx1M3fjQanJF8ZcReHK3rV8Phe+SAE3bC/zKgZW1+Ke18qKsnLZnN3l
	412S52A6AiaLQqR16q7GZUX18ZixhhU1DhwgFXWeUziJoaAmMSgY29Zecnnm1PhcTK0wF70nKIC5U
	rzo0i9XQe1tvfpiE/MZ3EEQWK3X8n8pdMXqZzlf0yY25CFEjSE4IrYKgftqX/8HBlfHIGkaZpbYK1
	c3da2TBxp/BznlQZTtRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZoKr-006Zxt-2P;
	Sat, 26 Aug 2023 08:07:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZoKp-006ZxX-0Q
	for linux-riscv@lists.infradead.org;
	Sat, 26 Aug 2023 08:07:56 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso1408770f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Aug 2023 01:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693037273; x=1693642073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fC4WZsMhyCohhKB9zSr+KT2wl5NJx/+h9RZP4Ctvhp0=;
        b=eOt95+E07ON6zeEGedPjyC1QMO71915I0XMuK8/WKOmzqvQMPYz9Bav8NYXv6TuSxf
         LlJ7b2OzmKVfy1szcDeH5Jzl88YTG5m3yGQ66552ll0BkUm8rtoKdEZZwD0Sudn1omM8
         3Y50icrJMQkH88wbl/RMvK+xizYYj61pWq1I5hGyvrErNJ3gnaODRS2OQI8D+K9OmQg6
         ygBWlTX7jym2bZsoyeyoPTD0a48AlDSpVxvN32zvZcodoQFQqin+tMYioFna0FioQGnT
         MGsYeJlwKJt+gPhHYH3nVLGbFCmH/JAe6rd0RhbYPTr5pcFVO1fE0nguulD1tPSK9cGn
         P8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693037273; x=1693642073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fC4WZsMhyCohhKB9zSr+KT2wl5NJx/+h9RZP4Ctvhp0=;
        b=gfalGM9wZgRQwRVmxHDu5OMvAG3gm13Rj6ULQtnY9LlEWPSrButXXNdXVi30zbyqmL
         oN1FLDLbpR8ovNSagNAlrc8SV4KH/7h6q8RU2uLn1KHmLzDwDilBfRufq4Kbx+EC/x46
         sAjeNnYamonfjNIzOlX0bddr6O2wedrvz6b8MeNTy5X/IENLj181+GKA3MeO8PJHq/lG
         eYaV/HYCCaAEbhe2kI+caEXDwKCE7Laf5DdsXv78h8bP+SMkpLwVDtNIjGlf0cMRinXd
         Vbo3rMz/0UuYOmvA38fr2Hq4hUwamdJcgTiYJH0wjzcXJEua0lHH4+MMWmfxIIIe3uNn
         iMPQ==
X-Gm-Message-State: AOJu0YzBR2i+Ae9NWrH9JVuuZpvBVB80HOe0uzRJYlUwRsUtZyxuAw9I
	0m1p5i8sUb5yklZkmbZidJwpiQ==
X-Google-Smtp-Source: AGHT+IGMPGXDXtGgESddQTOeTJz31uVZuHV/5a/MONPOXhu6E1qGsm5fbdMkp074B6aPRGLH0/NLhQ==
X-Received: by 2002:a5d:630d:0:b0:31a:c6b2:8c63 with SMTP id i13-20020a5d630d000000b0031ac6b28c63mr14226802wru.21.1693037272127;
        Sat, 26 Aug 2023 01:07:52 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id m15-20020adffe4f000000b003195504c754sm4252498wrs.31.2023.08.26.01.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 01:07:50 -0700 (PDT)
Date: Sat, 26 Aug 2023 10:07:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v5] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230826-323be460a0dcd2a5fc2917b9@orel>
References: <20230825231139.1145522-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825231139.1145522-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_010755_171778_A6B3EDEE 
X-CRM114-Status: GOOD (  34.07  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 25, 2023 at 04:11:38PM -0700, Evan Green wrote:
> In /proc/cpuinfo, most of the information we show for each processor is
> specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> compatible, and the mmu size. But the ISA string gets filtered through a
> lowest common denominator mask, so that if one CPU is missing an ISA
> extension, no CPUs will show it.
> 
> Now that we track the ISA extensions for each hart, let's report ISA
> extension info accurately per-hart in /proc/cpuinfo. We cannot change
> the "isa:" line, as usermode may be relying on that line to show only
> the common set of extensions supported across all harts. Add a new "hart
> isa" line instead, which reports the true set of extensions for that
> hart.
> 
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ---
> 
> Changes in v5:
>  - Documentation changes (only) (Conor)
> 
> Changes in v4:
>  - Documentation: Made the underline match the text line (Conor)
>  - Documentation: hanged "in question" to "being described" (Andrew)
> 
> Changes in v3:
>  - Add some documentation (Conor)
> 
> Changes in v2:
>  - Added new "hart isa" line rather than altering behavior of existing
>    "isa" line (Conor, Palmer)
> 
>  Documentation/riscv/uabi.rst | 12 ++++++++++++
>  arch/riscv/kernel/cpu.c      | 22 ++++++++++++++++++----
>  2 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
> index 8960fac42c40..a46017f57db2 100644
> --- a/Documentation/riscv/uabi.rst
> +++ b/Documentation/riscv/uabi.rst
> @@ -42,6 +42,18 @@ An example string following the order is::
>  
>     rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
>  
> +"isa" vs "hart isa" lines in /proc/cpuinfo
> +------------------------------------------
> +
> +The "isa" line in /proc/cpuinfo describes the lowest common denominator of
> +RISC-V ISA extensions recognized by the kernel and implemented on all harts. The
> +"hart isa" line, in contrast, describes the set of extensions recognized by the
> +kernel on the particular hart being described, even if those extensions may not
> +be present on all harts in the system. In both cases, the presence of a feature
> +in these lines guarantees only that the hardware has the described capability.
> +Additional kernel support or policy control changes may be required before a
> +feature is fully usable by userspace programs.

These last words imply that extensions listed in /proc/cpuinfo are all
potentially usable by userspace, but we also advertise extensions which
are only usable in S-mode (which is fine because of VMs). We should just
make that clear here.

Also, I frequently bounce between the words 'feature' and 'extension',
but, for documentation, I think we should try to be consistent. Or, we
could write somewhere that 'feature' == 'extension'.

Thanks,
drew

> +
>  Misaligned accesses
>  -------------------
>  
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 7b793c4321bb..100fb382b450 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -197,9 +197,8 @@ arch_initcall(riscv_cpuinfo_init);
>  
>  #ifdef CONFIG_PROC_FS
>  
> -static void print_isa(struct seq_file *f)
> +static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
>  {
> -	seq_puts(f, "isa\t\t: ");
>  
>  	if (IS_ENABLED(CONFIG_32BIT))
>  		seq_write(f, "rv32", 4);
> @@ -207,7 +206,7 @@ static void print_isa(struct seq_file *f)
>  		seq_write(f, "rv64", 4);
>  
>  	for (int i = 0; i < riscv_isa_ext_count; i++) {
> -		if (!__riscv_isa_extension_available(NULL, riscv_isa_ext[i].id))
> +		if (!__riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].id))
>  			continue;
>  
>  		/* Only multi-letter extensions are split by underscores */
> @@ -271,7 +270,15 @@ static int c_show(struct seq_file *m, void *v)
>  
>  	seq_printf(m, "processor\t: %lu\n", cpu_id);
>  	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
> -	print_isa(m);
> +
> +	/*
> +	 * For historical raisins, the isa: line is limited to the lowest common
> +	 * denominator of extensions supported across all harts. A true list of
> +	 * extensions supported on this hart is printed later in the hart_isa:
> +	 * line.
> +	 */
> +	seq_puts(m, "isa\t\t: ");
> +	print_isa(m, NULL);
>  	print_mmu(m);
>  
>  	if (acpi_disabled) {
> @@ -287,6 +294,13 @@ static int c_show(struct seq_file *m, void *v)
>  	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
>  	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
>  	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
> +
> +	/*
> +	 * Print the ISA extensions specific to this hart, which may show
> +	 * additional extensions not present across all harts.
> +	 */
> +	seq_puts(m, "hart isa\t: ");
> +	print_isa(m, hart_isa[cpu_id].isa);
>  	seq_puts(m, "\n");
>  
>  	return 0;
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
