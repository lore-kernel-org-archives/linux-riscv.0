Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B9DEB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eq1jsEAhhb/VOz3t7v8LUeqUWX8zwiztpkr8DQ7fUao=; b=hSqZgyDB8rnEwc
	JdkRBCd+CEwCSxqmEfN8OiQu+XyqprEiI3hRCYb7Plvq9MgXFrCw7LnVXoOOSoHXiz97z6raJpkqk
	XAeIJDGsZuIxCCN0nrAlC6wD1TR0vC5MGFvA/Ypd+MMTh1ktg5Hc7NzS7y751uV+O6An8cB0xxIWB
	DhKJ+ujRdtFvFXP0zixi8A3tO3J3WjbKX91LnND3VTVfMrUUwdzSSlGBLN5msKJ4mGCb4vUKqHs5N
	mEigORjEVTaEW7n0tuE0QAGsHVEXuKbcXYe+o6R0IwoXH4OAVH6cuIKr+vl9OZJ2V5n9hM6ixix7S
	aDmfxUtW39KQ7ZhDRYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDo9Q-00AUHz-1f;
	Mon, 26 Jun 2023 15:29:12 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDo9N-00AUHV-1D
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:29:11 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51d885b0256so3201033a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687793346; x=1690385346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bV69LujuUOskjbwAt+Ykc32yYmsOWfwLw8XOEZvRwcY=;
        b=f6laXhQxVHPkjD7kMD0jD9VZs+746R3zxFENrbzvjoQuSJ8sqpndwR2/hI7nGCj+zk
         LPb6iz12py5lzlQpVMbKYzPXM2eBlBXEfZkdAro08r/LiiGtcv3waA68zx3rGiYt5i1t
         iZHwBF1qET0Y1nODR32CuQNdK2dphW6g/Gqg3/39gfk4uvtKarRxfbpu7Ntza8JDjVSr
         CdUp+g9BTLRq0MtzBfjcdASS/kAMIRwD5BV6Ksx7vNCHJwiv+SdVHP+XNBPyE+YLLM5x
         n1aySynwhEIyW/zQxkO52xTdGuvgbOaAKtY4noCwiOslddizwRd8fiH47muMh6bdTv5t
         duIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793346; x=1690385346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bV69LujuUOskjbwAt+Ykc32yYmsOWfwLw8XOEZvRwcY=;
        b=f9KCsX0ye5GPqY2r63PROCZEJ/JyLYE8V/7Y7g3p1vtikXcNyZ3IOX6TmFjd9N4rkP
         3+BHfDWecB6wkvUwjjcEXHaTDtRFtNc1qJzVCzPAwcnHVLEHNhSuSZ0YWqyerLghYQSR
         hjS21SA86GsxxdO36D1V8J+aLaMzJDEhWFJojMt5N19Kq2RSO6UDC30Z3GrP1GKZWZ0o
         yA8biLNyp+DXz0D2MMkHf7opPdbNOGfoH0d5x93nJe7qwYJlRB7PEYGUbFELE+nyTpnh
         QBuoZMpfTB2TyeXDXUbrZsaPnSGNG6CWMBtT5RejCEJVVyNNSo7/4LIZhR1n7SI+TB3V
         Jd1A==
X-Gm-Message-State: AC+VfDyOnxfU9zFu+a/XFmy8n3JLzP3vz/RO0+SJX4CGbgfvaVmMxI6J
	Ovta0OtH/kuzJud7YWqBpkG2Ww==
X-Google-Smtp-Source: ACHHUZ6mpvDdVTSuCiCDJ4Uruk/XrW5nOpiqd0Ei9iT7vFRkOn52tmAjd/aWppvqEiGJFb8/vDwRDg==
X-Received: by 2002:a17:907:5ca:b0:987:59b6:c9fa with SMTP id wg10-20020a17090705ca00b0098759b6c9famr24557801ejb.19.1687793345961;
        Mon, 26 Jun 2023 08:29:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709060e0900b0098de7d28c34sm3308336eji.193.2023.06.26.08.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 08:29:05 -0700 (PDT)
Date: Mon, 26 Jun 2023 17:29:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 3/9] RISC-V: shunt isa_ext_arr to cpufeature.c
Message-ID: <20230626-79b06f642aa2996098c9353d@orel>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-endowment-crave-d72f9423c5b3@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-endowment-crave-d72f9423c5b3@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_082909_422999_B75EAA35 
X-CRM114-Status: GOOD (  31.47  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 26, 2023 at 12:19:41PM +0100, Conor Dooley wrote:
> To facilitate using one struct to define extensions, rather than having
> several, shunt isa_ext_arr to cpufeature.c, where it will be used for
> probing extension presence also.
> As that scope of the array as widened, prefix it with riscv & drop the
> type from the variable name.
> 
> Since the new array is const, print_isa() needs a wee bit of cleanup to
> avoid complaints about losing the const qualifier.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/hwcap.h |  3 ++
>  arch/riscv/kernel/cpu.c        | 75 +---------------------------------
>  arch/riscv/kernel/cpufeature.c | 68 ++++++++++++++++++++++++++++++
>  3 files changed, 73 insertions(+), 73 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index f041bfa7f6a0..7a57e6109aef 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -76,6 +76,9 @@ struct riscv_isa_ext_data {
>  	unsigned int isa_ext_id;
>  };
>  
> +extern const struct riscv_isa_ext_data riscv_isa_ext[];
> +extern const size_t riscv_isa_ext_count;
> +
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
>  
>  #define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 01f7e5c62997..61fb92e7d524 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -160,81 +160,10 @@ arch_initcall(riscv_cpuinfo_init);
>  
>  #ifdef CONFIG_PROC_FS
>  
> -#define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
> -	{							\
> -		.uprop = #UPROP,				\
> -		.isa_ext_id = EXTID,				\
> -	}
> -
> -/*
> - * The canonical order of ISA extension names in the ISA string is defined in
> - * chapter 27 of the unprivileged specification.
> - *
> - * Ordinarily, for in-kernel data structures, this order is unimportant but
> - * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
> - *
> - * The specification uses vague wording, such as should, when it comes to
> - * ordering, so for our purposes the following rules apply:
> - *
> - * 1. All multi-letter extensions must be separated from other extensions by an
> - *    underscore.
> - *
> - * 2. Additional standard extensions (starting with 'Z') must be sorted after
> - *    single-letter extensions and before any higher-privileged extensions.
> -
> - * 3. The first letter following the 'Z' conventionally indicates the most
> - *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> - *    If multiple 'Z' extensions are named, they must be ordered first by
> - *    category, then alphabetically within a category.
> - *
> - * 3. Standard supervisor-level extensions (starting with 'S') must be listed
> - *    after standard unprivileged extensions.  If multiple supervisor-level
> - *    extensions are listed, they must be ordered alphabetically.
> - *
> - * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
> - *    after any lower-privileged, standard extensions.  If multiple
> - *    machine-level extensions are listed, they must be ordered
> - *    alphabetically.
> - *
> - * 5. Non-standard extensions (starting with 'X') must be listed after all
> - *    standard extensions. If multiple non-standard extensions are listed, they
> - *    must be ordered alphabetically.
> - *
> - * An example string following the order is:
> - *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> - *
> - * New entries to this struct should follow the ordering rules described above.
> - */
> -static struct riscv_isa_ext_data isa_ext_arr[] = {
> -	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> -	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> -	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> -	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> -	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
> -	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> -	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> -	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
> -	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> -	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
> -	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> -	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> -	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> -	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> -	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> -	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> -	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> -	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> -};
> -
>  static void print_isa_ext(struct seq_file *f)
>  {
> -	struct riscv_isa_ext_data *edata;
> -	int i = 0, arr_sz;
> -
> -	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
> -
> -	for (i = 0; i <= arr_sz; i++) {
> -		edata = &isa_ext_arr[i];
> +	for (int i = 0; i < riscv_isa_ext_count; i++) {
> +		const struct riscv_isa_ext_data *edata = &riscv_isa_ext[i];
>  		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
>  			continue;
>  		seq_printf(f, "_%s", edata->uprop);
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index bdcf460ea53d..f0ae310006de 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -99,6 +99,74 @@ static bool riscv_isa_extension_check(int id)
>  	return true;
>  }
>  
> +#define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
> +	{							\
> +		.uprop = #UPROP,				\
> +		.isa_ext_id = EXTID,				\
> +	}
> +
> +/*
> + * The canonical order of ISA extension names in the ISA string is defined in
> + * chapter 27 of the unprivileged specification.
> + *
> + * Ordinarily, for in-kernel data structures, this order is unimportant but
> + * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
> + *
> + * The specification uses vague wording, such as should, when it comes to
> + * ordering, so for our purposes the following rules apply:
> + *
> + * 1. All multi-letter extensions must be separated from other extensions by an
> + *    underscore.
> + *
> + * 2. Additional standard extensions (starting with 'Z') must be sorted after
> + *    single-letter extensions and before any higher-privileged extensions.
> + *
> + * 3. The first letter following the 'Z' conventionally indicates the most
> + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> + *    If multiple 'Z' extensions are named, they must be ordered first by
> + *    category, then alphabetically within a category.
> + *
> + * 3. Standard supervisor-level extensions (starting with 'S') must be listed
> + *    after standard unprivileged extensions.  If multiple supervisor-level
> + *    extensions are listed, they must be ordered alphabetically.
> + *
> + * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
> + *    after any lower-privileged, standard extensions.  If multiple
> + *    machine-level extensions are listed, they must be ordered
> + *    alphabetically.
> + *
> + * 5. Non-standard extensions (starting with 'X') must be listed after all
> + *    standard extensions. If multiple non-standard extensions are listed, they
> + *    must be ordered alphabetically.
> + *
> + * An example string following the order is:
> + *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> + *
> + * New entries to this struct should follow the ordering rules described above.
> + */
> +const struct riscv_isa_ext_data riscv_isa_ext[] = {
> +	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> +	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> +	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> +	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> +	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
> +	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> +	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
> +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> +	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
> +	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> +	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> +	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> +	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> +	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> +	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),

I think we can either drop this null entry or drop the count variable
below. My preference would be to drop the count variable, and always
loop to the null.

> +};
> +
> +const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> +
>  void __init riscv_fill_hwcap(void)
>  {
>  	struct device_node *node;
> -- 
> 2.40.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
