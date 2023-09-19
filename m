Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4833CD3430
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 01:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rtak/WnapD9C8V/jCSkg0fuo/tNF/vl5w18ARpftJjo=; b=S+2+sheksgVdO6
	uaepDpvmuLL7Q1lnwJ0B+Evd5kyDSEaUv7PNYVjnlY+9ktj6Mxr5hGQD2aNmNnMUD+UhcXpcc83L9
	Wn6dEHyjZAx8ndowZ2Pqu65iJBHtKaWBlks2XB3gvw2d0i/QCXKeKnDILeVBapAIh40KURAhlCYuZ
	mqeDloXQ8wOwShFxueLNrw6xOGNcAX1LQWF6/RT5RoekY7PG5ueoNgwDhhdDxeHKoAgUUx7iGhQ06
	fqVsF1hLXcj6B/4NzOwY6zs/IHp0FvAwXLTJBdI4SwZzbBrXCKIE7g9mHIzvfxU4wVvaScuUaTRp6
	Xq8bKZe2FynWK95GBO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiPMG-00GdsP-0z;
	Tue, 19 Sep 2023 01:16:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiPMB-00GdrP-2K
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 01:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695086210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=omPau9d/hvAoI0gDrC/4LG/Ef7KpyIVKvwkkyw1GuWQ=;
	b=J5gpzRCAWIL8p141j7ZUOPpjiO75/3KorwR0MlJlAe918MnW2Ycc+5ExKhSHF0tkccIGHt
	Hh9IN/yh7vR5cSDz+DT5rXsBCXvvXTjo43yQgM7JNMhtJcjLzS2c6pu4tPG2COA1QcDuWU
	Z0/kLZsKxMOEgZG3R11nxZiJTj2T/5o=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541--UlN7QvrMgWRe0gaQkEmBA-1; Mon, 18 Sep 2023 21:16:49 -0400
X-MC-Unique: -UlN7QvrMgWRe0gaQkEmBA-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1c08a15fcf4so44575525ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 18:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695086208; x=1695691008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omPau9d/hvAoI0gDrC/4LG/Ef7KpyIVKvwkkyw1GuWQ=;
        b=FCjDzavt8xWhyeV0LB/Yk1JQ7Xn51NoTvxN635e6jo9UsoiQ/Od3YobQcCkNSk+uNe
         NyoMV+VQ6ZBaRlk+x5yrFqfHnIVtg20B8BHiWztETzyK3upb04RqW8p3n+Wp/VT/2oBq
         vhIc+ShfdQKaCD6bl6VsRlmVGeHoyWTIQ2cKHz9WzoFqi2k7T09PWc12t89u6L6uSOLL
         va+pHbD5kSiwuDF5Be3LoM9+Jik8c01e6F1SFr1zGOzVrRuGcLQSiVUvhdXoxSXW1W8g
         BliKEDXXp8YJx3PjzIANPzJBPD8YUqAbjtGT99UN1DlhgreT51lk22/BWv8dgBuO94FY
         wVAg==
X-Gm-Message-State: AOJu0YwngHaYiltidYTA4TinyfNO2+bwhD0KG3CgsBdUW2zYTO6meRMi
	a7KZtCjLD0iVNmK4VpR9iVpSDstF+t7B2VUrpiaJk0FdJDkxh3/DdwDOJELtvZ2XF3OE/FMkQGb
	vCZWo6mlNmCJNDtuR6F+rviw3mnt/
X-Received: by 2002:a17:903:32ce:b0:1c5:82bb:223b with SMTP id i14-20020a17090332ce00b001c582bb223bmr3093057plr.60.1695086208304;
        Mon, 18 Sep 2023 18:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE1i0NJ56OK1RSneouzoLKNH0vI25vR0RRcS/LvZ7zADw/YiBXjO0kBQXVFFJFy1l+rs/4UQ==
X-Received: by 2002:a17:903:32ce:b0:1c5:82bb:223b with SMTP id i14-20020a17090332ce00b001c582bb223bmr3093033plr.60.1695086207927;
        Mon, 18 Sep 2023 18:16:47 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id g1-20020a170902c38100b001bc2831e1a8sm6580180plg.80.2023.09.18.18.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 18:16:47 -0700 (PDT)
Message-ID: <9ef55959-66f3-0dc3-dec8-e2b673f965a4@redhat.com>
Date: Tue, 19 Sep 2023 11:16:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 26/35] arm64: acpi: Move get_cpu_for_acpi_id() to a
 header
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
 <20230913163823.7880-27-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-27-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_181651_852513_D7F53329 
X-CRM114-Status: GOOD (  18.96  )
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
> ACPI identifies CPUs by UID. get_cpu_for_acpi_id() maps the ACPI UID
> to the linux CPU number.
> 
> The helper to retrieve this mapping is only available in arm64's numa
> code.
> 
> Move it to live next to get_acpi_id_for_cpu().
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   arch/arm64/include/asm/acpi.h | 11 +++++++++++
>   arch/arm64/kernel/acpi_numa.c | 11 -----------
>   2 files changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
> index 4d537d56eb84..ce5045038e87 100644
> --- a/arch/arm64/include/asm/acpi.h
> +++ b/arch/arm64/include/asm/acpi.h
> @@ -100,6 +100,17 @@ static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
>   	return	acpi_cpu_get_madt_gicc(cpu)->uid;
>   }
>   
> +static inline int get_cpu_for_acpi_id(u32 uid)
> +{
> +	int cpu;
> +
> +	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
> +		if (uid == get_acpi_id_for_cpu(cpu))
> +			return cpu;
> +
> +	return -EINVAL;
> +}
> +
>   static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>   void __init acpi_init_cpus(void);
>   int apei_claim_sea(struct pt_regs *regs);
> diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> index e51535a5f939..0c036a9a3c33 100644
> --- a/arch/arm64/kernel/acpi_numa.c
> +++ b/arch/arm64/kernel/acpi_numa.c
> @@ -34,17 +34,6 @@ int __init acpi_numa_get_nid(unsigned int cpu)
>   	return acpi_early_node_map[cpu];
>   }
>   
> -static inline int get_cpu_for_acpi_id(u32 uid)
> -{
> -	int cpu;
> -
> -	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
> -		if (uid == get_acpi_id_for_cpu(cpu))
> -			return cpu;
> -
> -	return -EINVAL;
> -}
> -
>   static int __init acpi_parse_gicc_pxm(union acpi_subtable_headers *header,
>   				      const unsigned long end)
>   {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
