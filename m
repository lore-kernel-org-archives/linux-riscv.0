Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DADCD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xe6gnDdhXe0lJN40hSON94CaZ4/apZ+7Oajo0ttJuWY=; b=mfIK6n45EG4MPV
	+Wa1EQjYTIdvVWz4JpmUZPTlOkRYTU1wR1nHQ+WAwFqUuMRSGmmMb3ZyejWSD7EucI7Iex4CBFF/w
	FpVGyvCfxx7B2Wo+NuofCghD1unKGB5nq5ela/0EZgV0xQh69Qs7Sc+YIfG/uoZs0JD7dR52r9zhr
	AbpIlKzex2vKZuoYihrx2zaM4i3dTlSeqp5IglBIICRIF/+0lu7BHQcBBdAI7BzKyp8dqnqlOQZ2c
	5t8j6EdS11DdPJ+8jOkcRjVML4pbZHRyB/9KjuKCwxGj5+wlLwmiXRZOQNP6HoH7iRmWRgsBW0OjU
	WQJhvJNi5FFeu0dUOEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKrY-00000002IFz-27Nj;
	Thu, 04 Apr 2024 11:02:32 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKrU-00000002IEg-3m3s
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 11:02:30 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-56bf6591865so1219138a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 04:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712228546; x=1712833346; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WI/gpDqjLiJmsDmwk7gqvmJeMZiYROtcIjc07FyAt1I=;
        b=Y3HOqIdrhmLb+/BEYwCKXxQ8GezR3kTDXVLHPlfc4e0zgU4NwhrVeXAQv/LQr1yDux
         cDuOf2KiQuwub/iZU4MXqYan+lszqnmbnstILiklODv6e6YH450YdJPOSFMLTVg5n59I
         Cw9t80R2bovxKWx3SffA+YVxNuYJNb20F3rr0MYCSn52cHhe4EwzCypD+3UYWNGjSw1B
         sGtjs9hkOKgBA+XJiXkUJPEI/hZg5qmNCbc2QG9r0Lq1s4bmUVlcvUk2Mr2kD9dtbZ2m
         dKDYbRPTj+pw4UMpYPqS93uVEHlN1dWb4P7/se/Fg+pFka8j+e++zEPtvjYVD9Ptc5JD
         iFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712228546; x=1712833346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WI/gpDqjLiJmsDmwk7gqvmJeMZiYROtcIjc07FyAt1I=;
        b=YAAfCwUMTiGC+n4XQK8N5fQ1XQQ8PfmtFKgly83PaJ+8HEnU0/ir2sx2raI01AOA+o
         6t17B4CfB9CeynACJGyhLgsPQdM+Vd5TKsYan96io/hLx58cr3M6+WGLMD69jNt35dip
         LCzAhLNorATQt9mHKUTgoJYVsl6cd6rQSDvbRacXafRp9lsySoqj3e6276VEQKvb68aE
         3WBDO9koRkSPqOhSO2WttF9DeczJwlgcDUiKLOsVYPs3dFmBkIpCWnbStoLSKfHX7Auo
         Rc8IYS/TzYKeBcUnho/RrottzxHP2VC292Yi9t9lilKVcuJ3iupadd2fU7n/3QGJmLG2
         OAnA==
X-Forwarded-Encrypted: i=1; AJvYcCXWzgUD1jLKwfWZYSpnGRWfqcAQ2BPdWCCUywFMsCGDDFHTdhLOPtGFA9/U8R85L4fd5dLPWsh0f90JFqxfKuo65UZTVvPt0o90ruJ6qkup
X-Gm-Message-State: AOJu0YydGDf0o2RHA58CKoecPwovKtkHuNYHzG90iiR+h4f/L1bGq80Y
	ry0i06ecgzWl8n7o+Kcof3r0OB3llIhZ2LeWE46P5OLDRbr5QiHbfF8M3yI6bIE=
X-Google-Smtp-Source: AGHT+IH+cR5LnT4HHFFZfBDVpuneEFANhm0q0RefyMMIWR5DVI1nM63K0UMkrPub9LuoEZqin8kkoA==
X-Received: by 2002:a17:906:7954:b0:a4e:a068:7f with SMTP id l20-20020a170906795400b00a4ea068007fmr1635905ejo.49.1712228545941;
        Thu, 04 Apr 2024 04:02:25 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id an19-20020a17090656d300b00a4e58c74c9fsm5892101ejc.6.2024.04.04.04.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 04:02:25 -0700 (PDT)
Date: Thu, 4 Apr 2024 13:02:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, Ajay Kaher <akaher@vmware.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <amakhalov@vmware.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 03/22] drivers/perf: riscv: Read upper bits of a
 firmware counter
Message-ID: <20240404-89ee7d7f90a5fcc91809065e@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-4-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-4-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_040229_062752_4114E062 
X-CRM114-Status: GOOD (  24.96  )
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

On Wed, Apr 03, 2024 at 01:04:32AM -0700, Atish Patra wrote:
> SBI v2.0 introduced a explicit function to read the upper 32 bits
> for any firmware counter width that is longer than 32bits.
> This is only applicable for RV32 where firmware counter can be
> 64 bit.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 3e44d2fb8bf8..babf1b9a4dbe 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -57,6 +57,8 @@ asm volatile(ALTERNATIVE(						\
>  PMU_FORMAT_ATTR(event, "config:0-47");
>  PMU_FORMAT_ATTR(firmware, "config:63");
>  
> +static bool sbi_v2_available;
> +
>  static struct attribute *riscv_arch_formats_attr[] = {
>  	&format_attr_event.attr,
>  	&format_attr_firmware.attr,
> @@ -511,19 +513,29 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
>  	struct hw_perf_event *hwc = &event->hw;
>  	int idx = hwc->idx;
>  	struct sbiret ret;
> -	union sbi_pmu_ctr_info info;
>  	u64 val = 0;
> +	union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
>  
>  	if (pmu_sbi_is_fw_event(event)) {
>  		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
>  				hwc->idx, 0, 0, 0, 0, 0);
> -		if (!ret.error)
> -			val = ret.value;
> +		if (ret.error)
> +			return 0;
> +
> +		val = ret.value;
> +		if (IS_ENABLED(CONFIG_32BIT) && sbi_v2_available && info.width >= 32) {
> +			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI,
> +					hwc->idx, 0, 0, 0, 0, 0);
> +			if (!ret.error)
> +				val |= ((u64)ret.value << 32);
> +			else
> +				WARN_ONCE(1, "Unable to read upper 32 bits of firmware counter error: %d\n",
> +					  sbi_err_map_linux_errno(ret.error));

I don't think we should use sbi_err_map_linux_errno() in this case since
we don't have a 1:1 mapping of SBI errors to Linux errors and we don't
propagate the error as a Linux error. For warnings, it's better to output
the exact SBI error.

> +		}
>  	} else {
> -		info = pmu_ctr_list[idx];
>  		val = riscv_pmu_ctr_read_csr(info.csr);
>  		if (IS_ENABLED(CONFIG_32BIT))
> -			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
> +			val |= ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 32;
>  	}
>  
>  	return val;
> @@ -1135,6 +1147,9 @@ static int __init pmu_sbi_devinit(void)
>  		return 0;
>  	}
>  
> +	if (sbi_spec_version >= sbi_mk_version(2, 0))
> +		sbi_v2_available = true;
> +
>  	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
>  				      "perf/riscv/pmu:starting",
>  				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
