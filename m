Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1FECD342E
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAj2B2DXFnMGQShpKhmDYlDNkWlFRAY5Ev0yXbZQ0yg=; b=vkHncyKfiypgE1
	gHSg/ZkNpaXHjjpi05Y10auvQs94OUqxyoPYwXxjVTnhCDjRU3UZhMjomnqJcdwrOWmPdpyXtIIfM
	TPYwDTcJ+r/LROVuk5+nUzYdJqhd3DlfFWotdWtMeFn2Isj4/yxWyCZSjktXw16E6dNr1snCmPhB/
	vBw1R8/9ueREyQOav8deWiMGGh4W8MciFlsNh94KQzwXiaMviyAa7AJZFSloFmiM73nWbTiEvsCX+
	LKASYyWUX/ELEa6DQsz9+IHxEgdJJy+/K3dm9cvcAWEQXsKOHZL028Jl1meXx5OVkPHRdQwvHevh8
	hbT2CLU0MDF56NlrxQVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRaB-00GpNX-1Z;
	Tue, 19 Sep 2023 03:39:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRa7-00GpLd-22
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695094760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CBvJUlyaw2bkgeQrcu2quBogD5BtM2KTe/dcbAYZ1+c=;
	b=XRsOHo1xemZzdKUrTyBuUPUnVtHNLfi4LMok9ICS4ohNDi1j9iK8PErL35SMfmGdcQmhPM
	hta60y5U2Lu+UhpZC8kvzN6lWhJqp55szRXb/OF0t/TR0HRnJdw6L7Hocb3E4Z5yCKzkbw
	5QgbInSjNgxblMEkPnr9eVcnCxd14ZQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-Lr0WX9GhMYShfK7p0a3L5g-1; Mon, 18 Sep 2023 23:39:18 -0400
X-MC-Unique: Lr0WX9GhMYShfK7p0a3L5g-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1c467c33c06so14382455ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 20:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695094758; x=1695699558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBvJUlyaw2bkgeQrcu2quBogD5BtM2KTe/dcbAYZ1+c=;
        b=h+5jUQhaklronZDW5I6WMLsdIURTX2Ih1u0vCm+hE6WK+9UJGmtVB31aKS3yadBvKG
         cHn0NHcMFHP6ixhled/3DyXV87vT945YUxe44dGsivhRZEiiqnmnqErGBAFIJ2/LmDxH
         lxBTO+lRj4llDGJLO2PWAqpKbPPmyXvopJdFI3ZSAWcILAFepvEc8mZzq8tm0CgSacT8
         bJRGlutMDUgSawWYxol0h3LN+zaiVS5sGTRjCX4Uh7vhhXMHZR2DNkSG1MVjRjzlWFlW
         TgbYT7DM0yFZcM7azFMNVxckU6vqJXJhLKrB4jreGGrT3x3dAR2gJslwsWXfAW3mGrLe
         4EuQ==
X-Gm-Message-State: AOJu0YwnQ+0KRm1EQZbArE99T7byajSj526WGxWly4pBiC/bOiWtirzV
	YP90XIomujc4RoXwEExnk9ntIHT1GlR1Ztg0pOLFOd7F6VPwIa8YWaGVQ0mRFly3j+KclIOSp1Z
	4QjHadjjh3XC6OIHeEVmNKAwTMN36
X-Received: by 2002:a17:902:ecca:b0:1c3:432f:9f69 with SMTP id a10-20020a170902ecca00b001c3432f9f69mr2008955plh.23.1695094757879;
        Mon, 18 Sep 2023 20:39:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaoSZiSFZ7Dx5QmHpQ853bVS36OFRusCjmGB2jt3hklfrALFF9t8rRDnMvZC9r997ICNVz6g==
X-Received: by 2002:a17:902:ecca:b0:1c3:432f:9f69 with SMTP id a10-20020a170902ecca00b001c3432f9f69mr2008930plh.23.1695094757591;
        Mon, 18 Sep 2023 20:39:17 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id 20-20020a170902e9d400b001c567dcf22dsm2846570plk.281.2023.09.18.20.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 20:39:16 -0700 (PDT)
Message-ID: <31fa3aa7-c12c-3eb7-e9d2-5967a735ac78@redhat.com>
Date: Tue, 19 Sep 2023 13:39:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 29/35] irqchip/gic-v3: Don't return errors from
 gic_acpi_match_gicc()
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
 <20230913163823.7880-30-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-30-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_203923_766846_FABFEFEA 
X-CRM114-Status: GOOD (  26.55  )
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
> gic_acpi_match_gicc() is only called via gic_acpi_count_gicr_regions().
> It should only count the number of enabled redistributors, but it
> also tries to sanity check the GICC entry, currently returning an
> error if the Enabled bit is set, but the gicr_base_address is zero.
> 
> Adding support for the online-capable bit to the sanity check
> complicates it, for no benefit. The existing check implicitly
> depends on gic_acpi_count_gicr_regions() previous failing to find
> any GICR regions (as it is valid to have gicr_base_address of zero if
> the redistributors are described via a GICR entry).
> 
> Instead of complicating the check, remove it. Failures that happen
> at this point cause the irqchip not to register, meaning no irqs
> can be requested. The kernel grinds to a panic() pretty quickly.
> 
> Without the check, MADT tables that exhibit this problem are still
> caught by gic_populate_rdist(), which helpfully also prints what
> went wrong:
> | CPU4: mpidr 100 has no re-distributor!
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/irqchip/irq-gic-v3.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 

With below nits resolved:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 72d3cdebdad1..0f54811262eb 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -2415,21 +2415,15 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
>   
>   	/*
>   	 * If GICC is enabled and has valid gicr base address, then it means
> -	 * GICR base is presented via GICC
> +	 * GICR base is presented via GICC. The redistributor is only known to
> +	 * be accessible if the GICC is marked as enabled. If this bit is not
> +	 * set, we'd need to add the redistributor at runtime, which isn't
> +	 * supported.
>   	 */
> -	if (acpi_gicc_is_usable(gicc) && gicc->gicr_base_address) {
> +	if (gicc->flags & ACPI_MADT_ENABLED && gicc->gicr_base_address)
>   		acpi_data.enabled_rdists++;
> -		return 0;
> -	}
>   

	if (acpi_gicc_is_usable(gicc) && gicc->gicr_base_address) {
	

> -	/*
> -	 * It's perfectly valid firmware can pass disabled GICC entry, driver
> -	 * should not treat as errors, skip the entry instead of probe fail.
> -	 */
> -	if (!acpi_gicc_is_usable(gicc))
> -		return 0;
> -
> -	return -ENODEV;
> +	return 0;
>   }
>   
>   static int __init gic_acpi_count_gicr_regions(void)

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
