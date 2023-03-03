Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DB4C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Buo/I2B3N/nFfFcJD0HE0p9/FJpnTmwbA+iC9jbKMgE=; b=X4m+SHKyD2RAaE
	ZbZizoFLK9P2QXWyKv1I4cND13DdCtDZQxk04Fsy6z1FuNPDVmSBKe++H1nidZO03+XiHBl+/Hc9H
	wi+NFkPrOR8fVJpTINU693jk5baMW1t6e0WcOIs3ci6sUF+OeWgahMxzw2fD2TdPihtjzCBlMbJzm
	OuV5syzNkRuEj3zr8AyJlZpjvTMswGVSdMHU6TUrW02GlpdrRLk8V9YHfErunFqioEzScj6kQdzjd
	P2ZyvVOREBVodLtjBS3XUIngUhuXkAd813G+H4iRiVoivW7DMPq+LSU/GI+4CiJTvS/9LUVCD68sf
	RR1r3oQt5/aakxJoBdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY85W-006nCm-UJ; Fri, 03 Mar 2023 16:16:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY85T-006nCF-Ak
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 16:16:52 +0000
Received: by mail-ed1-x52a.google.com with SMTP id u9so12473333edd.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 08:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=29lhwYiW98gSQjktyysEqQtqN3RT8BV1yMsZ6bnD5sI=;
        b=eSUDPW5xP/wrxbkAQZCoPLxpc0K1OMCa9agV1Wm10ELQIvysYEiVgYsOvmhXNOG5mM
         9ny/FmnBEGvCx2Y6zzysd/kC2b3/r8cRXNYKJ1DnyLdwe5I16cUQDYnsspWM0GWlOFCX
         qam18Hk4eI0Jn1Zsfan4YqLmAYElEMNFSl/6/Q5GW5EgmX8flCQV8tkG/fpF0DFpPTBl
         E4sD4NhZt3AVhUYf4gerQKt67ehCL0+Z/psyWyJycFft9VScKfjLrCWNVJHMIGEmvZtK
         tyvaQfY6Iv0R9scgm3mXheT5szkT7P1vRpCIQYWqFvolQ6oTCHLA57VKGz0nutMu8+ch
         VWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29lhwYiW98gSQjktyysEqQtqN3RT8BV1yMsZ6bnD5sI=;
        b=EE6j68/AzmPlkzMFRM6EnjsCxNxB+qTVDbf5btsbkB4zazb+BFA3N4weCe5eO2dS/M
         n1P8vmfDOh4vg4FrU2+9i4W2OSp8nL+SMGzXUkgW0SN8FltMh7EGXmrNMUvR7nS24zGn
         zT+L7Tbte+y+qL3vsskaq8Dz1qmjx0d8Nz+b6Ai8TnqAk4LA00oS8vJ4pOboSAOiJ9EN
         LGJUNY1qHtjhaf0ZE8Y5dLkjxqz+vKLMA700OUik7O2jtT4T56ZqkI0hxjPHSEIFxyyw
         uBu7hfjYrsuJr9F+xKkDD/w7irINpGW2M/EVsmFurTJVBIgKOAXPOckcOH/p07iaxZnd
         j99g==
X-Gm-Message-State: AO0yUKXXwbviljQrp62W6m7FppP/o7ZiPRt8XGtkjOfbxp7vxqLfFSwC
	SIjZYkQLOS/Gpi9prLsveMwjFw==
X-Google-Smtp-Source: AK7set+6XDP/s9CIHVzW8AetHwFP9jbTQ+AvZLr8/rl3luYfPyfzQuWgTqOO4r/yk8Zqgfvc3nCasw==
X-Received: by 2002:a17:907:8c09:b0:88a:888b:c8b with SMTP id ta9-20020a1709078c0900b0088a888b0c8bmr2512107ejc.35.1677860208550;
        Fri, 03 Mar 2023 08:16:48 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ga2-20020a170906b84200b00882f9130eafsm1107033ejb.26.2023.03.03.08.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:16:48 -0800 (PST)
Date: Fri, 3 Mar 2023 17:16:47 +0100
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
Subject: Re: [PATCH V3 12/20] RISC-V: cpufeature: Add ACPI support in
 riscv_fill_hwcap()
Message-ID: <20230303161647.mksonnutzaw4d3gb@orel>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-13-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303133647.845095-13-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_081651_416315_BE3CA956 
X-CRM114-Status: GOOD (  21.66  )
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

On Fri, Mar 03, 2023 at 07:06:39PM +0530, Sunil V L wrote:
> On ACPI based systems, the information about the hart
> like ISA is provided by the RISC-V Hart Capabilities Table (RHCT).
> Enable filling up hwcap structure based on the information in RHCT.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 59d58ee0f68d..478dbf129922 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -6,6 +6,7 @@
>   * Copyright (C) 2017 SiFive
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/bitmap.h>
>  #include <linux/ctype.h>
>  #include <linux/libfdt.h>
> @@ -13,6 +14,8 @@
>  #include <linux/memory.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <asm/acpi.h>
>  #include <asm/alternative.h>
>  #include <asm/cacheflush.h>
>  #include <asm/errata_list.h>
> @@ -91,7 +94,9 @@ void __init riscv_fill_hwcap(void)
>  	char print_str[NUM_ALPHA_EXTS + 1];
>  	int i, j, rc;
>  	unsigned long isa2hwcap[26] = {0};
> -	unsigned long hartid;
> +	struct acpi_table_header *rhct;
> +	acpi_status status;
> +	unsigned int cpu;
>  
>  	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
>  	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
> @@ -104,18 +109,33 @@ void __init riscv_fill_hwcap(void)
>  
>  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
>  
> -	for_each_of_cpu_node(node) {
> +	if (!acpi_disabled) {
> +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> +		if (ACPI_FAILURE(status))
> +			return;
> +	}
> +
> +	for_each_possible_cpu(cpu) {
>  		unsigned long this_hwcap = 0;
>  		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>  		const char *temp;
>  
> -		rc = riscv_of_processor_hartid(node, &hartid);
> -		if (rc < 0)
> -			continue;

The above is an unrelated cleanup and should be in a separate patch.

> -
> -		if (of_property_read_string(node, "riscv,isa", &isa)) {
> -			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> -			continue;
> +		if (acpi_disabled) {
> +			node = of_cpu_device_node_get(cpu);
> +			if (node) {
> +				rc = of_property_read_string(node, "riscv,isa", &isa);
> +				of_node_put(node);
> +				if (rc) {
> +					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> +					continue;
> +				}
> +			}
> +		} else {
> +			rc = acpi_get_riscv_isa(rhct, get_acpi_id_for_cpu(cpu), &isa);
> +			if (rc < 0) {
> +				pr_warn("Unable to get ISA for the hart - %d\n", cpu);
> +				continue;
> +			}
>  		}
>  
>  		temp = isa;
> @@ -248,6 +268,9 @@ void __init riscv_fill_hwcap(void)
>  			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>  	}
>  
> +	if (!acpi_disabled && rhct)
> +		acpi_put_table((struct acpi_table_header *)rhct);
> +
>  	/* We don't support systems with F but without D, so mask those out
>  	 * here. */
>  	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
