Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5110FC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 09:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pfku6miZCKmBIWBvcTYRjtfG6GI6L7mj3y0fI9GUn0s=; b=x2vigAixJuosWi
	iuJ1uHI60xTYtYNDD4cQ8HKrrl40msvtabmmR6xUzofwJ8PkydBkqPxDzrRwkoov4JixS+p9XJ01y
	sKhKMeQsEm7qzIwoVypW7VbU/vOPVlEC+MA+l6G3Thk5SY1V3jP5iqzEAJ9o4pWndp5RmqVoyh3U7
	9OGXfdvibraqh6GLROOk2DcE6ixU136d9dj+I9vxJPZXM82pWgIfGa4QmjBa0V73JYMqbAtk+Ksr7
	vjGdjtXnFf3fWHcjyXEPRlvuqYTO+BeXA7LoXVB7i5GomdOaaVqD76+puay0ayrUeV87DPQztY5HP
	OCVHvcFC5rRCVCyJ3NAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1NOX-000000028Cr-2SyX;
	Mon, 29 Apr 2024 09:33:57 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1NOT-000000028C3-3eG1
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 09:33:55 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a58eb9a42d9so205825166b.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714383232; x=1714988032; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EU5DwD+o4qYG2LMifv0uxvcF3WJYCYks9+vxzfiwTyo=;
        b=aPk2mQi4mAcHm3hwWQw+E1f3QW4/9eHOLHyrjYalU1vfIWFlGCkQ4i9Q1DRnFVrMEd
         7fo7jvqffPiRNDWw1Yg4VR+y19Bgl/fKqz6CoMzEKqRnQeEGIZOj4P7P5ZNNj5aK/XqK
         im3DPvF81mPh2wxHblxFBQKmHh9mNyX+rb+C/aO0WY83zN6GFOithTX9QPthj71gu/kG
         U1MpFLAEDdmFgNfP/cX7F82EDa4wWD6w7JgH7JJbYywdKCdxKhvPffQKKygkIMJ1NrMI
         6oFRMWTL/u+ZMa5WGKu03PkYZGMLwHY0FouxqluCSUQI22gTpUsUx2/OyyZaC1fcxUu+
         RUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714383232; x=1714988032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EU5DwD+o4qYG2LMifv0uxvcF3WJYCYks9+vxzfiwTyo=;
        b=Zr5pQLA5JmGSYCriUC6ZGhT6S8/fAhGukankFmSnKQgUFgJuVWt1Pn3MZGy3sVw986
         YUB//aSizVgOX3d4JO4ye/ISsz4J3mFCYMt5U8VZtUaCcfksWDUiBG4ZjlF5A477VPE+
         SCSl2t57urKXpWYpW2tXDbthTCNrajqDuJOecq/wR6RbWJlgMCojR/FHnOE8voiH+C91
         IIk4kc8KVQ+PB/BkCzNROCyxdEQegbHCP9//4JYsSHvrUXQVHM9V3o3Ky8oyYHuOGBU5
         3XOlIqj3MOz1Ybc3mSe9eqkZ1olwVKJiT77Y8iWiiBqbzi8a0ZYmBqLHxO4ceUtY0qWV
         sr2g==
X-Forwarded-Encrypted: i=1; AJvYcCVVhpOKelPaW7T6V/30ZJBWPyHdpb6D1BH3iyCfaCtO0vVv93ikKrAOU3ohfTCk1xQF126Y1qGEY8saS53GAkME9+pfsSRMNwZe4pA4mKcE
X-Gm-Message-State: AOJu0YzFkXsInBFNfWyaB3ijkqUaEzI7YgCrliPmlFigl42KlUnl+wxs
	dJV+bgI1k1CggiG/HDsXWwN+Sa7eauH552WWklR4p+AGjNlmEMDRyZzEtH2YtO8=
X-Google-Smtp-Source: AGHT+IERuDfoXTZsVEZYtHEP0m8zcYtgaeZ/2E5V9D4Cg4n2UY/ovyyJ51522Jpbw2aKwxKXDxdzFg==
X-Received: by 2002:a17:906:57c4:b0:a58:e969:1472 with SMTP id u4-20020a17090657c400b00a58e9691472mr3749136ejr.40.1714383231850;
        Mon, 29 Apr 2024 02:33:51 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bi10-20020a170906a24a00b00a54c12de34dsm13629698ejb.188.2024.04.29.02.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 02:33:51 -0700 (PDT)
Date: Mon, 29 Apr 2024 11:33:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <20240429-f6438977f19e44966d0dd879@orel>
References: <20240426-cpufeature_fixes-v2-0-7377442b1327@rivosinc.com>
 <20240426-cpufeature_fixes-v2-1-7377442b1327@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240426-cpufeature_fixes-v2-1-7377442b1327@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_023353_942780_EAD30530 
X-CRM114-Status: GOOD (  29.24  )
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

On Fri, Apr 26, 2024 at 02:58:54PM GMT, Charlie Jenkins wrote:
> The riscv_cpuinfo struct that contains mvendorid and marchid is not
> populated until all harts are booted which happens after the DT parsing.
> Use the vendorid/archid values from the DT if available or assume all
> harts have the same values as the boot hart as a fallback.
> 
> Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs")
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/sbi.h   |  2 ++
>  arch/riscv/kernel/cpu.c        | 40 ++++++++++++++++++++++++++++++++++++----
>  arch/riscv/kernel/cpufeature.c | 11 +++++++++--
>  3 files changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 6e68f8dff76b..0fab508a65b3 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -370,6 +370,8 @@ static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1
>  static inline void sbi_init(void) {}
>  #endif /* CONFIG_RISCV_SBI */
>  
> +unsigned long riscv_get_mvendorid(void);
> +unsigned long riscv_get_marchid(void);
>  unsigned long riscv_cached_mvendorid(unsigned int cpu_id);
>  unsigned long riscv_cached_marchid(unsigned int cpu_id);
>  unsigned long riscv_cached_mimpid(unsigned int cpu_id);
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index d11d6320fb0d..c1f3655238fd 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -139,6 +139,34 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
>  	return -1;
>  }
>  
> +unsigned long __init riscv_get_marchid(void)
> +{
> +	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
> +
> +#if IS_ENABLED(CONFIG_RISCV_SBI)
> +	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> +	ci->marchid = csr_read(CSR_MARCHID);
> +#else
> +	ci->marchid = 0;
> +#endif
> +	return ci->marchid;
> +}
> +
> +unsigned long __init riscv_get_mvendorid(void)
> +{
> +	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
> +
> +#if IS_ENABLED(CONFIG_RISCV_SBI)
> +	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> +	ci->mvendorid = csr_read(CSR_MVENDORID);
> +#else
> +	ci->mvendorid = 0;
> +#endif
> +	return ci->mvendorid;
> +}
> +
>  DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>  
>  unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
> @@ -170,12 +198,16 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
>  	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
>  
>  #if IS_ENABLED(CONFIG_RISCV_SBI)
> -	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> -	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +	if (!ci->mvendorid)
> +		ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +	if (!ci->marchid)
> +		ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
>  	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
>  #elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> -	ci->mvendorid = csr_read(CSR_MVENDORID);
> -	ci->marchid = csr_read(CSR_MARCHID);
> +	if (!ci->mvendorid)
> +		ci->mvendorid = csr_read(CSR_MVENDORID);
> +	if (!ci->marchid)
> +		ci->marchid = csr_read(CSR_MARCHID);
>  	ci->mimpid = csr_read(CSR_MIMPID);
>  #else
>  	ci->mvendorid = 0;
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 3ed2359eae35..500a9bd70f51 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -490,6 +490,8 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
>  	struct acpi_table_header *rhct;
>  	acpi_status status;
>  	unsigned int cpu;
> +	u64 boot_vendorid;
> +	u64 boot_archid;
>  
>  	if (!acpi_disabled) {
>  		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> @@ -497,6 +499,9 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
>  			return;
>  	}
>  
> +	boot_vendorid = riscv_get_mvendorid();
> +	boot_archid = riscv_get_marchid();
> +
>  	for_each_possible_cpu(cpu) {
>  		struct riscv_isainfo *isainfo = &hart_isa[cpu];
>  		unsigned long this_hwcap = 0;
> @@ -543,9 +548,11 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
>  		 * version of the vector specification put "v" into their DTs.
>  		 * CPU cores with the ratified spec will contain non-zero
>  		 * marchid.
> +		 *
> +		 * Assume that if the boot hart is T-Head, then all harts in the
> +		 * SoC are also T-Head and have the same archid.

The movement of the comment is only half of my suggestion. The other
suggestion is to remove the 'Assume' because we don't have to assume
anything. We can simply state that if the boot hart is T-HEAD, then we
don't want to enable V on any hart. (We don't need to assume the other
hart IDs are the same, because we don't care what they are. They're
not going to get V, no matter what.)

Thanks,
drew

>  		 */
> -		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID &&
> -		    riscv_cached_marchid(cpu) == 0x0) {
> +		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0) {
>  			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
>  			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
>  		}
> 
> -- 
> 2.44.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
