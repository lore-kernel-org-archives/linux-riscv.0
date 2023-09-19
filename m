Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FA3CD342E
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 01:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFyaWqUJwXLitq6drQ5tMvqkuEoFvpLL3+hBm0/WRtc=; b=NaSvhGzJty6etp
	bFhlG/KRCl42b8t6xwyh3WVHw8DjCUzxtB29rQgdk19eQSJYo4oaPhUdqhjTSiClZnkaUlHiThSry
	xbndxkKNiSP8w1D/Q3KJJfBwXFu3DTjWezqFuR2/KfDNvp/oEG+CZCmyFneBdNmnxDC5bW+KSv6JN
	Sw4FpxX+rasGV8b0AglfqJmTALIKXoCOLw/pjpzGCbqnoMUYrn5nB7Eiwp3VTn9JePamfJP0xeKQb
	4awCHV4asB2mm7y6UsNG9Y1YZzgdVbLZ1xxQcaCe84ZWYBNgT4+Aq9I7PxXrJMas+nOyqr+T5Re6J
	RvUFrffbkagvgVyPzF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiPSN-00GePK-0m;
	Tue, 19 Sep 2023 01:23:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiPSJ-00GeOT-1j
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 01:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695086590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8rZEMBXcWAsOd1JUxhybBTc4j/duZaFTPteC/Fr9lkM=;
	b=FtA3w0XeVotf1iW5q6N+Vh9jAK/1v7a4TuX3AKoWOCUcCDL2uhzBhdGyTJISJgDXHeK6qt
	vVjFaQUYkYHCdEU8yyyekNPuAnk9+tqsxJLCW/8Nq1HsMuqFHiFny2GSYIzk/Q2hTEbiA2
	9EVjvlQ2grEjb8fU3cwn+I3Lf4r+VdY=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-uznrPoekNnOkEmTAHop47Q-1; Mon, 18 Sep 2023 21:23:08 -0400
X-MC-Unique: uznrPoekNnOkEmTAHop47Q-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1c56bab69c4so12734745ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 18:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695086588; x=1695691388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rZEMBXcWAsOd1JUxhybBTc4j/duZaFTPteC/Fr9lkM=;
        b=iGWT/Fggzy3IVGvc3ZEQdt3sDIsEeDcrLioQ8JwTIQ+CdrfZsyyNQvV/HgcPD+eHim
         7nrkpJYRHmdlxYbWaQ0wCpTUkzfVXR/dwi3r5+Y7GdQGWFXTr1/yp1iMlHxkjCLsp0LI
         RZqNG38e/YLhlrB6BvYGqIqi60yvua9lY1m9bFeyw1lGwncHVEapKADGL7j4xK5iXOzV
         OvjfiPcENJcbqxTgYFYD9dRzUmaOHKmyjmYpPLpBJCKZFfrauWhfPtwnHYUbU/FbZPFd
         uJfkF8WyNUEIGtOEWDFSPV9xyeEJ3tQQhzSYTqyxCo2XyR/JQn6mlmPUpD4vCEy5JR/j
         ytuw==
X-Gm-Message-State: AOJu0Yy58ev8f9NCQjlQzizeLMbX8V93sxUu48TecOEbKp8Eg4OafQ6C
	/rXZnEqOeXYjVPwGlMxWzf/yDnyndFm9iOCeQOL+nClsbV4PDddtozuG0o+t+ZbF1YOTnG3Fo52
	RidbuVlWVZZv+lJpQdqUmmtxOaV7B
X-Received: by 2002:a17:902:d4c7:b0:1c3:c687:4793 with SMTP id o7-20020a170902d4c700b001c3c6874793mr10025101plg.63.1695086587821;
        Mon, 18 Sep 2023 18:23:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoDFw/kgFjKPQwWTf0Oet8p5HAvy+YamWqASTKA/sRdSVgiuLoUsA4+OwthgzDWlhTMjCURQ==
X-Received: by 2002:a17:902:d4c7:b0:1c3:c687:4793 with SMTP id o7-20020a170902d4c700b001c3c6874793mr10025086plg.63.1695086587495;
        Mon, 18 Sep 2023 18:23:07 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id z12-20020a170903018c00b001beef2c9bffsm8873509plg.85.2023.09.18.18.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 18:23:06 -0700 (PDT)
Message-ID: <f45820cf-3ea5-6f5a-7702-bb4b14811e56@redhat.com>
Date: Tue, 19 Sep 2023 11:23:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 28/35] arm64, irqchip/gic-v3, ACPI: Move MADT GICC
 enabled check into a helper
To: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 Russell King <linux@armlinux.org.uk>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-29-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-29-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_182311_663100_E8B59ED9 
X-CRM114-Status: GOOD (  24.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 9/14/23 02:38, James Morse wrote:
> ACPI, irqchip and the architecture code all inspect the MADT
> enabled bit for a GICC entry in the MADT.
> 
> The addition of an 'online capable' bit means all these sites need
> updating.
> 
> Move the current checks behind a helper to make future updates easier.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   arch/arm64/kernel/smp.c       |  2 +-
>   drivers/acpi/processor_core.c |  2 +-
>   drivers/irqchip/irq-gic-v3.c  | 10 ++++------
>   include/linux/acpi.h          |  5 +++++
>   4 files changed, 11 insertions(+), 8 deletions(-)
> 

With Jonathan and Russell's comments addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 960b98b43506..8c8f55721786 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -520,7 +520,7 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
>   {
>   	u64 hwid = processor->arm_mpidr;
>   
> -	if (!(processor->flags & ACPI_MADT_ENABLED)) {
> +	if (!acpi_gicc_is_usable(processor)) {
>   		pr_debug("skipping disabled CPU entry with 0x%llx MPIDR\n", hwid);
>   		return;
>   	}
> diff --git a/drivers/acpi/processor_core.c b/drivers/acpi/processor_core.c
> index 7dd6dbaa98c3..b203cfe28550 100644
> --- a/drivers/acpi/processor_core.c
> +++ b/drivers/acpi/processor_core.c
> @@ -90,7 +90,7 @@ static int map_gicc_mpidr(struct acpi_subtable_header *entry,
>   	struct acpi_madt_generic_interrupt *gicc =
>   	    container_of(entry, struct acpi_madt_generic_interrupt, header);
>   
> -	if (!(gicc->flags & ACPI_MADT_ENABLED))
> +	if (!acpi_gicc_is_usable(gicc))
>   		return -ENODEV;
>   
>   	/* device_declaration means Device object in DSDT, in the
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index eedfa8e9f077..72d3cdebdad1 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -2367,8 +2367,7 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *header,
>   	u32 size = reg == GIC_PIDR2_ARCH_GICv4 ? SZ_64K * 4 : SZ_64K * 2;
>   	void __iomem *redist_base;
>   
> -	/* GICC entry which has !ACPI_MADT_ENABLED is not unusable so skip */
> -	if (!(gicc->flags & ACPI_MADT_ENABLED))
> +	if (!acpi_gicc_is_usable(gicc))
>   		return 0;
>   
>   	redist_base = ioremap(gicc->gicr_base_address, size);
> @@ -2418,7 +2417,7 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
>   	 * If GICC is enabled and has valid gicr base address, then it means
>   	 * GICR base is presented via GICC
>   	 */
> -	if ((gicc->flags & ACPI_MADT_ENABLED) && gicc->gicr_base_address) {
> +	if (acpi_gicc_is_usable(gicc) && gicc->gicr_base_address) {
>   		acpi_data.enabled_rdists++;
>   		return 0;
>   	}
> @@ -2427,7 +2426,7 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
>   	 * It's perfectly valid firmware can pass disabled GICC entry, driver
>   	 * should not treat as errors, skip the entry instead of probe fail.
>   	 */
> -	if (!(gicc->flags & ACPI_MADT_ENABLED))
> +	if (!acpi_gicc_is_usable(gicc))
>   		return 0;
>   
>   	return -ENODEV;
> @@ -2486,8 +2485,7 @@ static int __init gic_acpi_parse_virt_madt_gicc(union acpi_subtable_headers *hea
>   	int maint_irq_mode;
>   	static int first_madt = true;
>   
> -	/* Skip unusable CPUs */
> -	if (!(gicc->flags & ACPI_MADT_ENABLED))
> +	if (!acpi_gicc_is_usable(gicc))
>   		return 0;
>   
>   	maint_irq_mode = (gicc->flags & ACPI_MADT_VGIC_IRQ_MODE) ?
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index b7ab85857bb7..e3265a9eafae 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -256,6 +256,11 @@ acpi_table_parse_cedt(enum acpi_cedt_type id,
>   int acpi_parse_mcfg (struct acpi_table_header *header);
>   void acpi_table_print_madt_entry (struct acpi_subtable_header *madt);
>   
> +static inline bool acpi_gicc_is_usable(struct acpi_madt_generic_interrupt *gicc)
> +{
> +	return (gicc->flags & ACPI_MADT_ENABLED);
> +}
> +
>   /* the following numa functions are architecture-dependent */
>   void acpi_numa_slit_init (struct acpi_table_slit *slit);
>   

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
