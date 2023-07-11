Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AB6EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9ZwRyEDCKvNCMZNhxzPp2H4O0TA6PTrISDdsXu3hhQ=; b=Li6j25VzHbCMc0
	MaJ0to/j4JexbaXhRNvj6tdYOHNFw9gVbegU9ynRYdYqjRCwQRAoMBqyjw+lRUlvWsGdoX5j0DLiB
	g7wP2fcrYHOUv0jzCag8e2XqJknn525ECKTWd3XheS3JGhd/V5dGh6e6mhZxr16JpHgA60DsXVs67
	jYnEgN/TZOAVnflVp4tV8XpgFbOfs1dmukAmt2+3ERfgv6yVavODNsZLiH/5jk6ci9WbIxlYfCJfc
	SSpePJr1YULnq3fGqev8DFjhQmjujYe5rY7H3Oo5zi9WJQAKxOd+4BWEIxRUUR9gGUOfCdP2Qe0GV
	JLmBRO5FEzxQZw9P5iww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJDNj-00Eyj9-0I;
	Tue, 11 Jul 2023 13:26:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJDNg-00EyiY-2E
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 13:26:18 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbf1b82dc7so58857815e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 06:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689081974; x=1691673974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PQ4QN8lSbvwIJvfCRdu3GsuuZZlEHhucGRO0HI9BGps=;
        b=PJfb3hZxD1mSUs9MjHm73olK4DicwNoMYeSMv4SmVst2QOScBvpV3bO73RyIVyoHe2
         N5X9vYfSQjWudLAtnv07WQmHT+QF23RRXHweVCqULhdmyAU6lMupirK5K4HztNkFWyWQ
         2BonOqwO8PwpW6inaCDuPcH8dnBfjj4oQja4PwPNtEx4cINT9RASxaO26SONHSkmN7uC
         L3t3ZnpFv/koV3TAy3ZIGOylsAL1TnJ3vnByQ693U3g0D+TkJLQVaAHuCVPTwt4JEGGY
         ocYZHKHXFlXnFMe6c0q9JWMZcKLKMz9OoOBk2eqh2QdR4ZjP84jq2L/ucSC3egH5t/m9
         i7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689081974; x=1691673974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQ4QN8lSbvwIJvfCRdu3GsuuZZlEHhucGRO0HI9BGps=;
        b=PgOK7sKK+KK6kDw2j/VtVgSiWFncVM9yxhZz97iXp3xRGCuQJyAp40l4DTEgNvf5Ss
         2HS3+aIOwXNocr3WtSEpaNoQiN6IZzl8FwwiOmH5ggXsecchs1R5lL3Hu/S/rTDPe6g8
         pmifNLOFfrUYAFP/QxLyYaX0EuSDvOIf5fGM14eout+Bvk0RWXbGtauqLZVgLYwjFtSF
         UFIWJKeP+Vupt38WBwzLCp5mB0LK0oFcVXnMQpFEOB8+E2NHesNZbVNAifqL9sj9qOpq
         yjRmxGn2MZ5SfJ7l1jw6UB8mE+YhrUWMD/rqfcFuYCgglWPFPaPZ48z7H9h4VDw72o3u
         l/1Q==
X-Gm-Message-State: ABy/qLZMxEYQqFCM4sYyZvaiKXIkRt3n8XnP4J2JnxsH9MWNdsyotGDo
	5mp/LdYi1igf3+si6J1BapcApg==
X-Google-Smtp-Source: APBJJlEGoS/Ne6jFT4BxyKW4qL53mJ8lQhsxyb/J+w7fzAoEB4xWcd9fSFFT0sAfAO0UhTmyjZjZHQ==
X-Received: by 2002:a7b:c5ce:0:b0:3fc:5a3:367c with SMTP id n14-20020a7bc5ce000000b003fc05a3367cmr9822539wmk.32.1689081974174;
        Tue, 11 Jul 2023 06:26:14 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c22d800b003fbaade072dsm2569934wmg.23.2023.07.11.06.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 06:26:13 -0700 (PDT)
Date: Tue, 11 Jul 2023 15:26:12 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v5 1/9] RISC-V: Add riscv_fw_parent_hartid() function
Message-ID: <20230711-3151a76400deb88b218e9f9b@orel>
References: <20230710094321.1378351-1-apatel@ventanamicro.com>
 <20230710094321.1378351-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710094321.1378351-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_062616_729130_A7A64BED 
X-CRM114-Status: GOOD (  20.37  )
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 10, 2023 at 03:13:13PM +0530, Anup Patel wrote:
> We add common riscv_fw_parent_hartid() which help device drivers
> to get parent hartid of the INTC (i.e. local interrupt controller)
> fwnode. This should work for both DT and ACPI.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/processor.h |  3 +++
>  arch/riscv/kernel/cpu.c            | 16 ++++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index c950a8d9edef..39dc23a18f88 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -81,6 +81,9 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hartid);
>  int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hartid);
>  int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
>  
> +struct fwnode_handle;
> +int riscv_fw_parent_hartid(struct fwnode_handle *node, unsigned long *hartid);
> +
>  extern void riscv_fill_hwcap(void);
>  extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
>  
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index a2fc952318e9..9be9b3b1f333 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -96,6 +96,22 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
>  	return -1;
>  }
>  
> +/* Find hart ID of the CPU fwnode under which given fwnode falls. */

This comment matches the comment for riscv_of_parent_hartid(), but I don't
think it will be correct for the !is_of_node(node) case since
fwnode_property_read_u64_array() isn't obliged to walk up its tree.
Looking ahead it appears riscv_fw_parent_hartid() is only called with the
parent node, so we could just drop this function and use
fwnode_property_read_u64_array() directly at the two call sites.

Thanks,
drew

> +int riscv_fw_parent_hartid(struct fwnode_handle *node, unsigned long *hartid)
> +{
> +	int rc;
> +	u64 temp;
> +
> +	if (!is_of_node(node)) {
> +		rc = fwnode_property_read_u64_array(node, "hartid", &temp, 1);
> +		if (!rc)
> +			*hartid = temp;
> +	} else
> +		rc = riscv_of_parent_hartid(to_of_node(node), hartid);
> +
> +	return rc;
> +}
> +
>  DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>  
>  unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
