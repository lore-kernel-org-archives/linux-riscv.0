Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6F9EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXdPaato8e5z3gEADl9OL9K9ascp8U28UcoJcefwrvU=; b=C1rJxPsuM3ujhI
	EU8O9OSg15DjFuaOS1Ju/Kk58J5XJW/EimoTj0IkJ4+Vo7mIuX52HOy2arkApfc5jgL+lCgOt1/xi
	duSunJKIwPajm8JQc9Vs+qzUxQ4wutLEcxiUJQsgIpCsnYIFfXKV+vbWf5ISCFa/+M2sNMypZqVCA
	t9fv6TjephkQ3Ut5VQqxqyk33mVUbEXZ2bA5qkiOc3xdyeWfgpgDku8voDDQobof5RVwMI5wcBGqp
	pnrP8+NnA808hS9J5PGyk9EBSxX4uU0VH05wlj5jVfVDnS3OZvO8PBovcnTTVQ3AljN+0jLXmnRpO
	s4jDSFWOpDTv+DUD18Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnvA-00ASmK-0b;
	Mon, 26 Jun 2023 15:14:28 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnv7-00ASlS-01
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:14:26 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb41682472so2045981e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687792458; x=1690384458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sHPQ5iPvhDY3BGusjB5nG21y0Ckxl3USk0RX0IUeXf4=;
        b=i5iLe6epG+XFQGA+cbFQuzPgA7bxZ6+5UmmibeaJkdbr91/c5r44kg4ILWfU3/lO2O
         xoz9y2YRAoIs0DHpOm9/DjRbMMeryQEQOm7oTFdkHlRXiYc9r4RYLE+ztGyVUj2xUCVd
         MhCRlnHSZBQjJKFt49SJEeSWvdnxpEwg5pd88lsswbhzJtJ4Cku6maIVbcqqPHaSCCJc
         8vCoAiW4QEXE1A4jvqhdGc3pJYFbEgqc59Uciqu4agLKoGAOgrty8HR7C/HF2EZeZ0Qu
         yFKapxHZ/pNels1ZvR8DcizL/0w8Rut2dZMOqBAd09LYHNmNzfuO7goqlPbzZ+LT5J3M
         SfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687792458; x=1690384458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHPQ5iPvhDY3BGusjB5nG21y0Ckxl3USk0RX0IUeXf4=;
        b=YSctzamfA0SevaCRzjGd2nYI4QARlURbpUGGeekNFH8FWOFMXuq0WlGv24bsF3bfRo
         laFZYUrymQsiKjSe+5n8VRufSw3mBSDPZ78Z4GMtgSwbRxfbkhyT2YFaEHVs3dNRcoYR
         0jxTz0wqYBOT0OIs7SmBls0zY8Vyi0H3B0u8OcZ46FPhZtdQM52oklQthF9kctC97Fp+
         TreIjsZArDigbYyK9K1iNtoDJpKSEPX2eYyFwXIhRn0L4aQlCzT9REHHkDYGk70uw/CW
         pS8Y/0kdSqHkXrv6ggYR2i9g8S6Hr2FAEh/j4amc8S0xtRAI1j1ejVBI4PahSYn7n1CT
         1ePw==
X-Gm-Message-State: AC+VfDyQoFvgXpaAzdJgzfxqVlOlAeXk38vQJBZ8aR8sbX5hyBcDj3BB
	S+Vua++iic0NAXr2jAblL7Iqug==
X-Google-Smtp-Source: ACHHUZ6mxmDI2Qp25GlQT3n6esNr9Ydz9pNhGlZeEOzNxaLE29RqcZgb67QQ2i221weUCfP2m7J6Jg==
X-Received: by 2002:a19:4f49:0:b0:4f8:58d3:b7ab with SMTP id a9-20020a194f49000000b004f858d3b7abmr17736483lfk.4.1687792457237;
        Mon, 26 Jun 2023 08:14:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id z18-20020aa7c652000000b0050dfd7de30dsm2904899edr.94.2023.06.26.08.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 08:14:16 -0700 (PDT)
Date: Mon, 26 Jun 2023 17:14:15 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 1/9] RISC-V: don't parse dt/acpi isa string to get
 rv32/rv64
Message-ID: <20230626-e3ea7beb39c584bfbf7ee836@orel>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-silk-colonize-824390303994@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-silk-colonize-824390303994@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_081425_043935_6DEBA28B 
X-CRM114-Status: GOOD (  24.44  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 26, 2023 at 12:19:39PM +0100, Conor Dooley wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> When filling hwcap the kernel already expects the isa string to start with
> rv32 if CONFIG_32BIT and rv64 if CONFIG_64BIT.
> 
> So when recreating the runtime isa-string we can also just go the other way
> to get the correct starting point for it.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpu.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index a2fc952318e9..742bb42e7e86 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -253,13 +253,16 @@ static void print_isa_ext(struct seq_file *f)
>   */
>  static const char base_riscv_exts[13] = "imafdqcbkjpvh";
>  
> -static void print_isa(struct seq_file *f, const char *isa)
> +static void print_isa(struct seq_file *f)
>  {
>  	int i;
>  
>  	seq_puts(f, "isa\t\t: ");
> -	/* Print the rv[64/32] part */
> -	seq_write(f, isa, 4);
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		seq_write(f, "rv32", 4);
> +	else
> +		seq_write(f, "rv64", 4);
> +
>  	for (i = 0; i < sizeof(base_riscv_exts); i++) {
>  		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
>  			/* Print only enabled the base ISA extensions */
> @@ -316,15 +319,14 @@ static int c_show(struct seq_file *m, void *v)
>  	unsigned long cpu_id = (unsigned long)v - 1;
>  	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
>  	struct device_node *node;
> -	const char *compat, *isa;
> +	const char *compat;
>  
>  	seq_printf(m, "processor\t: %lu\n", cpu_id);
>  	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
> +	print_isa(m);
>  
>  	if (acpi_disabled) {
>  		node = of_get_cpu_node(cpu_id, NULL);
> -		if (!of_property_read_string(node, "riscv,isa", &isa))
> -			print_isa(m, isa);
>  
>  		print_mmu(m);
>  		if (!of_property_read_string(node, "compatible", &compat) &&
> @@ -333,8 +335,6 @@ static int c_show(struct seq_file *m, void *v)
>  
>  		of_node_put(node);
>  	} else {
> -		if (!acpi_get_riscv_isa(NULL, cpu_id, &isa))
> -			print_isa(m, isa);
>  

Extra blank line here to remove. Actually the whole 'else' can be removed
because the print_mmu() call can be brought up above the
'if (acpi_disabled)'

>  		print_mmu(m);
>  	}
> -- 
> 2.40.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
