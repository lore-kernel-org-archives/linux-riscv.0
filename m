Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE98C5478C
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6Hs6MI0G0Kbmds7mY9z1SBt/tnafmX2NFX5kBCBaFc=; b=QHTTgw5ScDdyWQ
	8hqoCBGtPxXb8YMCc+gHBkRhrDtbB3ef2NqH4mceXeNilvXIkF2CfiLw7To8Er6Mq99ggyeCnUQeC
	fOdVv+lslP+2Vh4wnJABQvljspF+rZt9uVWOgpABLw8UJz29MebO71Lsc4bK1qUKU8yYMH6IjALyu
	tPdrv/cjb7qi6+Nv2RTPZQQPBCPlyYvHplQX9Kl3H/QanO8vfNmsjgUk8wUbv/e2IAmQMbnICFWyL
	SHniDjjpip2R0ENDYp3A8Z1FdJ62NBLcnMyaRc/PmuMKpdYcxvOgQRjOlXQyvzIKWb3t4q7gksVgb
	N4V4Am9SE/5qYCh3wFUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzZG-0000000HFPA-1UWH;
	Fri, 01 Mar 2024 09:52:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzZD-0000000HFMi-0gJm
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 09:52:36 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a26fa294e56so355513966b.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 01:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709286753; x=1709891553; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j9QHyWahfs9gCWf7uMaefOcLnvNGoebBSGi+N5cc4JQ=;
        b=IWHHKlFxZu+/K6ZfTMpcMksO7Ol5Kr5VWUU/8psSx/yxzDsqmbFp8uq9NI4XaYRM9q
         d7tG3xr582gMVRsQI7Hh5yGsYavSrzHzWqXlfZYDTmkpGBxMX+3nB/IZxAW7N9oPkcxV
         bENfn0BK2alz72wL2dKIkoFRNXMol7DmXYRBdEHj0djjy5N3EDu/M297Vzxwgctgd5iy
         c4H4wseiR8dk3On22me8a833mh3LWi5rcPA45rM/BVfprEiZ0qTCHqcUE9lPfcMfboCI
         71tGowVEh6NvTHI6hD+az6jBqhWrE/LfsrBU8xOhm6OoSMlIxcw9/om7MozVrCQ5pRcg
         n9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709286753; x=1709891553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9QHyWahfs9gCWf7uMaefOcLnvNGoebBSGi+N5cc4JQ=;
        b=pYgu0FVcXa/UkD+EdVwDpsueV2J1Qgkw/PkJuJPBeKHBt6yz+1C6XV374E1xUIqKll
         CYTv9t8Nvinl4S6GP5xXsW0EbfOkpyNR1c/zHuj2pQL6lPAbsjPpCVgm7WCc4SLoVy8N
         q8OGnUS85PFkrCf7OwJ+eYjqt7b8FO/ilg9Uf3fMEa0TEZB6oYk5EzSq6KxxM9aB8bj4
         kY84m7N8eIMzhAcaxVKmuuPPny4cDGqt6O2yeIL6esn3IN8drxgRKkRoWflrE8h3llsA
         rhoqP46m3RryDcKa9/OeGKM02AODB0XOqcezUF/5z67Z0Xd0ki+ed8DBnyG+QQXAh+Rv
         lrNg==
X-Forwarded-Encrypted: i=1; AJvYcCWzicxDEyfSiAM1sYBUZ8Sqha19PRHSuH+btsWj4Q0suID53F6pi1HHqR3/6c+Kd0fOLki2r6bqkjP3ksPJjFrxRBbo7TobCbjf2vDjxGgN
X-Gm-Message-State: AOJu0Ywqk0bqrPTjjYX8P23CWeiV+35F973cZMcX9BBXTED3mBypS4EL
	rsTZZinzNbYR3Zweh1XduE2/B4c7MdBOjuUktiXSQpleKZ8G1yAg5EYaztkFgrY=
X-Google-Smtp-Source: AGHT+IFFb5bzOks+lqs/185Lu0au521O/ZsFgW4Nrk2H88MGDv0vRN/r6X3wkkf9qeHNHigHYwOjLA==
X-Received: by 2002:a17:906:a197:b0:a43:af0b:c1c0 with SMTP id s23-20020a170906a19700b00a43af0bc1c0mr980628ejy.16.1709286753092;
        Fri, 01 Mar 2024 01:52:33 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id vu2-20020a170907a64200b00a43bf7ef577sm1535120ejc.188.2024.03.01.01.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 01:52:32 -0800 (PST)
Date: Fri, 1 Mar 2024 10:52:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 03/15] drivers/perf: riscv: Read upper bits of a
 firmware counter
Message-ID: <20240301-36ababe3e198d3d7573f316e@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-4-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229010130.1380926-4-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_015235_247727_C0CE9DB7 
X-CRM114-Status: GOOD (  22.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 28, 2024 at 05:01:18PM -0800, Atish Patra wrote:
> SBI v2.0 introduced a explicit function to read the upper 32 bits
> for any firmwar counter width that is longer than 32bits.

firmware

> This is only applicable for RV32 where firmware counter can be
> 64 bit.
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 16acd4dcdb96..ea0fdb589f0d 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -35,6 +35,8 @@
>  PMU_FORMAT_ATTR(event, "config:0-47");
>  PMU_FORMAT_ATTR(firmware, "config:63");
>  
> +static bool sbi_v2_available;
> +
>  static struct attribute *riscv_arch_formats_attr[] = {
>  	&format_attr_event.attr,
>  	&format_attr_firmware.attr,
> @@ -488,16 +490,23 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
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

Getting an error here indicates a buggy SBI. Maybe we should have a
warn-once?

> +				val |= ((u64)ret.value << 32);
> +		}
>  	} else {
> -		info = pmu_ctr_list[idx];
>  		val = riscv_pmu_ctr_read_csr(info.csr);
>  		if (IS_ENABLED(CONFIG_32BIT))
>  			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
> @@ -1108,6 +1117,9 @@ static int __init pmu_sbi_devinit(void)
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

Either way,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
