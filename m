Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B75BC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKwsxELc6b9Hn0/GgG6zjRlG+p0asBE04Pxya7hiRH8=; b=Pry00vfdoVWxNm
	gB5D1fOalorWrVaLVfHKiYTVHp9Jwrh6lT5BC1pAdnSHb+sSVGzWAgBniCAhrI6XP5WXyIVuM7TQf
	9YbIraqc9yFfYoRMY0r/PshBH+5WMm/KpPwegJMXgxVNVg4sZfi3kZNVJ+SKm53UtfBqPiYIw9T1w
	zmCC4bWjrgwn/QvxpGc6K95V6aHh/qwrnprD7h4p/LdvJfZZRNXjX+C9AVLgqyAl5+LjSL+6RmjmA
	AqUafDdyLAYJFaIjDf3Jm2u4J59vNr2j0BvTH/g4zmfdBV4eyqLjNrgnBrfb5VINm9O+hVukg3Ipi
	QO2M/9AG1V3nyBqAbwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPOnx-009NoE-1Z;
	Mon, 15 Jan 2024 15:23:13 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPOnu-009Nnt-1x
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:23:12 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so1055547266b.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705332189; x=1705936989; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjb6yat6rTIqwLNK7lIYkpvumfmiEIYSpK/Qu84PmCs=;
        b=XPSwPtdmg08TU40mRFH+WNfzU2hEf91thpXDzx2b518ZytvVlV4AyJwnRPnQHoVEfD
         6VuxDqBpyryPw5t6tXUL2Cps+nC83Myw3mS1w4s8WrKZmCAjHMBx1m/gKcfxKvEQY1My
         AAG7v/wchhJVz7Hxm1usIeDy5PcmR6ZKoWUTdld0wf92dbbc17zOaULrcqktSH9WydGf
         W7pouHthDpKOM3Zp89hAB5W+mtiT99dotWkU6eGpNGdfF1fSuWw2OKBlBjpmeaa8w2uf
         imxDqK2Tj75cvUWtURWV9CPlb+tZx2BQgYk9hPMnPnt+De+deH3xirAA0nfpTrc/wIY1
         ChDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705332189; x=1705936989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sjb6yat6rTIqwLNK7lIYkpvumfmiEIYSpK/Qu84PmCs=;
        b=cACZ79YyM6Ya387dGrRPQ0Sfr/E8mqMydpi3qSTAA4pXKuRDUC29aIt6xZFaQXoKXj
         n0FBCdhKJPH324MLclrK3JTHot2NgWuxFBie95CdDqH3h4ZNnH4q+aASkAp9UtYHO7xc
         h6ExSbvBxK0dLF8sz+NpVCUd7H0tLvKpPqcEs4jnvooF1gBAkzYGN4Y/uljLxewY4xmB
         CoN5zZftdVaeTyVmc9ssT2sTmao+MJmEn3bEumYQzwCxJ36CPk1e+NVx7uuWVdRRj1TD
         Ef8q1jtk48ZdxwGpDumxWqJKH6R6WyKncHLCUdXGn8YJc873AkuIbtgJfSjEYqU4NVlw
         bBDg==
X-Gm-Message-State: AOJu0YxnNcChsjmsPb/e3pCRoC1MNPBQQzhFY3kuzbp5xkrL6KG2c/D+
	2ZHcIYpr83lrALbe9vaYkYx9P4qqO7dhRQ==
X-Google-Smtp-Source: AGHT+IHA8GBVAlaQ/G9+4YlfpGBti7K7zuQDjbKGggHHhNwvPhvQd31mN7o91Q5SxIzDJNMEKz+DEQ==
X-Received: by 2002:a17:907:3c9:b0:a2c:c648:dd03 with SMTP id su9-20020a17090703c900b00a2cc648dd03mr1381050ejb.110.1705332188553;
        Mon, 15 Jan 2024 07:23:08 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v8-20020a170906488800b00a27aabff0dcsm5467070ejq.179.2024.01.15.07.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:23:08 -0800 (PST)
Date: Mon, 15 Jan 2024 16:23:07 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 -next 1/3] cpuidle: RISC-V: Move few functions to
 arch/riscv
Message-ID: <20240115-b3536efde6699e67fa15ac65@orel>
References: <20240115101056.429471-1-sunilvl@ventanamicro.com>
 <20240115101056.429471-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115101056.429471-2-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_072310_673608_368574D9 
X-CRM114-Status: GOOD (  25.91  )
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

On Mon, Jan 15, 2024 at 03:40:54PM +0530, Sunil V L wrote:
> To support ACPI Low Power Idle (LPI), few functions are required which
> are currently static functions in the DT based cpuidle driver. Hence,
> move them under arch/riscv so that ACPI driver also can use them.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/include/asm/suspend.h    |  3 ++
>  arch/riscv/kernel/suspend.c         | 47 +++++++++++++++++++++++++++++
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 41 +------------------------
>  3 files changed, 51 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
> index 02f87867389a..5c7df5ab7a16 100644
> --- a/arch/riscv/include/asm/suspend.h
> +++ b/arch/riscv/include/asm/suspend.h
> @@ -55,4 +55,7 @@ int hibernate_resume_nonboot_cpu_disable(void);
>  asmlinkage void hibernate_restore_image(unsigned long resume_satp, unsigned long satp_temp,
>  					unsigned long cpu_resume);
>  asmlinkage int hibernate_core_restore_code(void);
> +bool is_sbi_hsm_supported(void);
> +bool sbi_suspend_state_is_valid(u32 state);
> +int sbi_suspend(u32 state);
>  #endif
> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
> index 239509367e42..a3b2e7e16a98 100644
> --- a/arch/riscv/kernel/suspend.c
> +++ b/arch/riscv/kernel/suspend.c
> @@ -128,4 +128,51 @@ static int __init sbi_system_suspend_init(void)
>  }
>  
>  arch_initcall(sbi_system_suspend_init);
> +
> +static int sbi_suspend_finisher(unsigned long suspend_type,
> +				unsigned long resume_addr,
> +				unsigned long opaque)
> +{
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND,
> +			suspend_type, resume_addr, opaque, 0, 0, 0);
> +
> +	return (ret.error) ? sbi_err_map_linux_errno(ret.error) : 0;
> +}
> +
> +int sbi_suspend(u32 state)

Now that this is exported, I'd name it riscv_sbi_suspend.

> +{
> +	if (state & SBI_HSM_SUSP_NON_RET_BIT)
> +		return cpu_suspend(state, sbi_suspend_finisher);
> +	else
> +		return sbi_suspend_finisher(state, 0, 0);
> +}
> +
> +bool sbi_suspend_state_is_valid(u32 state)

Also riscv_ prefix here.

> +{
> +	if (state > SBI_HSM_SUSPEND_RET_DEFAULT &&
> +	    state < SBI_HSM_SUSPEND_RET_PLATFORM)
> +		return false;
> +	if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
> +	    state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
> +		return false;
> +	return true;
> +}
> +
> +bool is_sbi_hsm_supported(void)

This I would rename to riscv_sbi_hsm_is_supported

> +{
> +	/*
> +	 * The SBI HSM suspend function is only available when:
> +	 * 1) SBI version is 0.3 or higher
> +	 * 2) SBI HSM extension is available
> +	 */
> +	if (sbi_spec_version < sbi_mk_version(0, 3) ||
> +	    !sbi_probe_extension(SBI_EXT_HSM)) {
> +		pr_info("HSM suspend not available\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
>  #endif /* CONFIG_RISCV_SBI */
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index e8094fc92491..a7f06242f67b 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -73,26 +73,6 @@ static inline bool sbi_is_domain_state_available(void)
>  	return data->available;
>  }
>  
> -static int sbi_suspend_finisher(unsigned long suspend_type,
> -				unsigned long resume_addr,
> -				unsigned long opaque)
> -{
> -	struct sbiret ret;
> -
> -	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND,
> -			suspend_type, resume_addr, opaque, 0, 0, 0);
> -
> -	return (ret.error) ? sbi_err_map_linux_errno(ret.error) : 0;
> -}
> -
> -static int sbi_suspend(u32 state)
> -{
> -	if (state & SBI_HSM_SUSP_NON_RET_BIT)
> -		return cpu_suspend(state, sbi_suspend_finisher);
> -	else
> -		return sbi_suspend_finisher(state, 0, 0);
> -}
> -
>  static __cpuidle int sbi_cpuidle_enter_state(struct cpuidle_device *dev,
>  					     struct cpuidle_driver *drv, int idx)
>  {
> @@ -206,17 +186,6 @@ static const struct of_device_id sbi_cpuidle_state_match[] = {
>  	{ },
>  };
>  
> -static bool sbi_suspend_state_is_valid(u32 state)
> -{
> -	if (state > SBI_HSM_SUSPEND_RET_DEFAULT &&
> -	    state < SBI_HSM_SUSPEND_RET_PLATFORM)
> -		return false;
> -	if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
> -	    state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
> -		return false;
> -	return true;
> -}
> -
>  static int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
>  {
>  	int err = of_property_read_u32(np, "riscv,sbi-suspend-param", state);
> @@ -607,16 +576,8 @@ static int __init sbi_cpuidle_init(void)
>  	int ret;
>  	struct platform_device *pdev;
>  
> -	/*
> -	 * The SBI HSM suspend function is only available when:
> -	 * 1) SBI version is 0.3 or higher
> -	 * 2) SBI HSM extension is available
> -	 */
> -	if ((sbi_spec_version < sbi_mk_version(0, 3)) ||
> -	    !sbi_probe_extension(SBI_EXT_HSM)) {
> -		pr_info("HSM suspend not available\n");
> +	if (!is_sbi_hsm_supported())
>  		return 0;
> -	}
>  
>  	ret = platform_driver_register(&sbi_cpuidle_driver);
>  	if (ret)
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
