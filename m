Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6240C67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYKPj5Zrr/Izm8QuEQDpkHwOe5T+KM0ZYz9S6w95m78=; b=yyZA/St/X0S7qT
	Vj8Ek9X061jwEeMmQi1WmVkOwVJGF/4aXHjTqSKOJQxNC0EvVm1vQYmXyXvr7J2amXmjRIXOShzWA
	XbMoa5Xd7GuMcPgOg/cZhZjp91Wo41pBjVVwLEH5sqjYYYgqJlBlsm4fA8HC3KgJySjhNgacsBUFU
	87++w9DVT+jHmjV2Ks4sLwvN4iKEC1yfoHa9Dtq3UekoM5KGTc0SzoomvNSUdMpaPGaCaH3F8Ha94
	Jp3BFDRihoOML55WFs66gQ7m8ObvQ3VLYkFo+V4CqiLagPCH8P8d1sB5qVFMaZgEvBpd9YJrbWexO
	bX97zYA3l3GXf6K0qWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiYK-00000006tQg-21QH;
	Fri, 05 Apr 2024 12:20:16 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiYG-00000006tNF-0jGZ
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 12:20:14 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-56e2c1650d8so832714a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712319610; x=1712924410; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z3Ue/COd7xzip1h5OQAnlWq7u3bU48JD2sac4Wso5xg=;
        b=Cb5Q6NC+Gkp/v3gXabggruJ+vyGCdRJM+IN3ZQLytPL9NLpDHwBqm9zpAQES94li0D
         lA3vCdlqLE05yll/75Mo6ye6wIqzI1qR+oPuW5gTKB1nE/ldKs3k19Oq64LnIbP/ioUg
         P5Gaw315elrVmVCJjySSC3VH/LAeIwIZiPsvNaqQNTtqesu6Ow9EHzZrtwHIYhJMzswE
         FUIPGgDdTlMMMdmyc44sG9K8DD7BiiTAnjKTw0vnxKnVT/9vH+KSRjkIDK5jPbIlrA8O
         bMrNknjiBj4Gd43PlssOgoWqpLjKtkxVJSJei+jAY/4hJWFtFxZZZIlGiKnUABSxGPsJ
         WBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319610; x=1712924410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3Ue/COd7xzip1h5OQAnlWq7u3bU48JD2sac4Wso5xg=;
        b=tE1Jktj9Krvi1ENKjU2WveYkaG15wHq76LnO9KEG4WFw+wecMGmXpP51RMp5NbQFmq
         leSA+/u8thvkhqudIMiUGcr3CggopjnvYTd6Lrofw3mbf7c50jX/NXRPjZf5y5RskaHo
         mToEfVNEq05Uoi0FFjBqE8AawIT/L6vPiCQvn/v4OlLQ37d9M35tcw6O3yNOOkE5RRpK
         pCpieU2ACacbPvwbixMvQZw1LZEBs2Ggeb1aSsjXL4hHurL+Vg0k2pd+5I6jYJXiS4CQ
         V+nv1zDG99CgZSUPOg/ydswyQO8CJAFB9r+Sn+iVWGG+xBvJOJuLMmVZsHdNYcspl+qs
         jCEA==
X-Forwarded-Encrypted: i=1; AJvYcCUHQwFJq/ka7R53EquQkJfmhgYjpRe7WwBYEyAifLvaJhpYAft1E4l4cAv9m7xobS2gY1Emg8qIpw8D15lhJVTmb+Vy+ihxhWzghwulCfSX
X-Gm-Message-State: AOJu0Yxd2x2DDja6ZP5T3PFQXPlAegneU3pDl57TKKNOM1EyxILarmVV
	L5EbPY96XaM844BBs6f88xJnoJXc8CcaJFIppJ5xsOOXOU+9vNmFZOiCyVU3SSQ=
X-Google-Smtp-Source: AGHT+IF0CC6ogogXzpTL4zy1ENTK47UYVZiCW2YoU20z8kyqiFEfeNZFbwkqt8ICTVLi3dEuo7O6xQ==
X-Received: by 2002:a17:906:55d4:b0:a4d:b0e9:efbc with SMTP id z20-20020a17090655d400b00a4db0e9efbcmr973887ejp.17.1712319610180;
        Fri, 05 Apr 2024 05:20:10 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id u15-20020a170906408f00b00a4e583adcc7sm767504ejj.99.2024.04.05.05.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:20:09 -0700 (PDT)
Date: Fri, 5 Apr 2024 14:20:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Ajay Kaher <akaher@vmware.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexey Makhalov <amakhalov@vmware.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 19/22] KVM: riscv: selftests: Add SBI PMU extension
 definitions
Message-ID: <20240405-1f8409c47501740fe808adbb@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-20-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-20-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_052012_691394_A4C2997E 
X-CRM114-Status: GOOD (  15.22  )
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

On Wed, Apr 03, 2024 at 01:04:48AM -0700, Atish Patra wrote:
> The SBI PMU extension definition is required for upcoming SBI PMU
> selftests.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../testing/selftests/kvm/include/riscv/sbi.h | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
> index ba04f2dec7b5..6675ca673c77 100644
> --- a/tools/testing/selftests/kvm/include/riscv/sbi.h
> +++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
> @@ -29,17 +29,83 @@
>  enum sbi_ext_id {
>  	SBI_EXT_BASE = 0x10,
>  	SBI_EXT_STA = 0x535441,
> +	SBI_EXT_PMU = 0x504D55,
>  };
>  
>  enum sbi_ext_base_fid {
>  	SBI_EXT_BASE_PROBE_EXT = 3,
>  };
> +enum sbi_ext_pmu_fid {
> +	SBI_EXT_PMU_NUM_COUNTERS = 0,
> +	SBI_EXT_PMU_COUNTER_GET_INFO,
> +	SBI_EXT_PMU_COUNTER_CFG_MATCH,
> +	SBI_EXT_PMU_COUNTER_START,
> +	SBI_EXT_PMU_COUNTER_STOP,
> +	SBI_EXT_PMU_COUNTER_FW_READ,
> +	SBI_EXT_PMU_COUNTER_FW_READ_HI,
> +	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
> +};
> +
> +union sbi_pmu_ctr_info {
> +	unsigned long value;
> +	struct {
> +		unsigned long csr:12;
> +		unsigned long width:6;
> +#if __riscv_xlen == 32
> +		unsigned long reserved:13;
> +#else
> +		unsigned long reserved:45;
> +#endif
> +		unsigned long type:1;
> +	};
> +};
>  
>  struct sbiret {
>  	long error;
>  	long value;
>  };
>  
> +/** General pmu event codes specified in SBI PMU extension */
> +enum sbi_pmu_hw_generic_events_t {
> +	SBI_PMU_HW_NO_EVENT			= 0,
> +	SBI_PMU_HW_CPU_CYCLES			= 1,
> +	SBI_PMU_HW_INSTRUCTIONS			= 2,
> +	SBI_PMU_HW_CACHE_REFERENCES		= 3,
> +	SBI_PMU_HW_CACHE_MISSES			= 4,
> +	SBI_PMU_HW_BRANCH_INSTRUCTIONS		= 5,
> +	SBI_PMU_HW_BRANCH_MISSES		= 6,
> +	SBI_PMU_HW_BUS_CYCLES			= 7,
> +	SBI_PMU_HW_STALLED_CYCLES_FRONTEND	= 8,
> +	SBI_PMU_HW_STALLED_CYCLES_BACKEND	= 9,
> +	SBI_PMU_HW_REF_CPU_CYCLES		= 10,
> +
> +	SBI_PMU_HW_GENERAL_MAX,
> +};
> +
> +/* SBI PMU counter types */
> +enum sbi_pmu_ctr_type {
> +	SBI_PMU_CTR_TYPE_HW = 0x0,
> +	SBI_PMU_CTR_TYPE_FW,
> +};
> +
> +/* Flags defined for config matching function */
> +#define SBI_PMU_CFG_FLAG_SKIP_MATCH	BIT(0)
> +#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	BIT(1)
> +#define SBI_PMU_CFG_FLAG_AUTO_START	BIT(2)
> +#define SBI_PMU_CFG_FLAG_SET_VUINH	BIT(3)
> +#define SBI_PMU_CFG_FLAG_SET_VSINH	BIT(4)
> +#define SBI_PMU_CFG_FLAG_SET_UINH	BIT(5)
> +#define SBI_PMU_CFG_FLAG_SET_SINH	BIT(6)
> +#define SBI_PMU_CFG_FLAG_SET_MINH	BIT(7)
> +
> +/* Flags defined for counter start function */
> +#define SBI_PMU_START_FLAG_SET_INIT_VALUE BIT(0)
> +#define SBI_PMU_START_FLAG_INIT_SNAPSHOT BIT(1)
> +
> +/* Flags defined for counter stop function */
> +#define SBI_PMU_STOP_FLAG_RESET BIT(0)
> +#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
> +
>  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg1, unsigned long arg2,
>  			unsigned long arg3, unsigned long arg4,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
