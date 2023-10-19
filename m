Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7906CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mc2s0Y7qS2AxID6R4JKN6gIt8BmNIpeoJP6geK6mOzc=; b=ozVGMe9GdoP9ad
	+16giaAf1vcGvuRoEywVVSn7JYay8nK/KVbTmbPPFomsDfCjz282MtNBkKUNNDtYEM3X45aDsz4r2
	2VN0t+4JxExg2XcDHtM7req/kxq/VnD6Jzca2woQLxTVEXIkC9egsClLY3aqIAJZQ/XAch19zsdUh
	XOJ/XekoakO8GrtPkgIULSZoxcMsFv7tE0enRDJNolh5HpBxcnIrzrL347v3I2Cbi/9yBPogZod7N
	CS9rQvJKZlma1xV2NAsIkkYDgTpxw/roscO5BU+PR/fSCpbZRZT0tjpesMMj7tXSVxnZrql2hzTII
	eoHYcqyvc9853JJNtbOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtWeE-000P38-3A;
	Thu, 19 Oct 2023 17:17:26 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtWeB-000P2e-2I
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 17:17:25 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-53e751aeb3cso9657307a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 10:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697735839; x=1698340639; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BARIemSwg2ER9/cXepbznbtP0D0n2Ke2bHxQ2VOoXIo=;
        b=Vks2FtYdRL0iTDsOe+OD6w0ZYt0XCKuggBy9d2rVXndE5TxVDt0weKhcEXhVH7JHd0
         QKTSKNMWx7tcFRrO04x7KUudLD5/bkYtz3TYBsXLzrpZ1yUBaWlgRzpr6V98vAiNx8bj
         +vdue/Mgdbk268L1mxIf90XhWt7fUmOzYF3CS9V4benw5XhIwvMfPENOi7P6gtVV4nK4
         fLJnGD8skOawarESBsFg19GOy6EhAPG8TyuJwOVg7PifGgRR2YN/KwlUzJdLAE1aLL13
         zYpM0V8QtOen+PC+/bf2dVAcV8hsPlrPc9oOJWgm2jKt3uYuF1f5pAfhMWecjldkW/xK
         ilTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697735839; x=1698340639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BARIemSwg2ER9/cXepbznbtP0D0n2Ke2bHxQ2VOoXIo=;
        b=hWBQpw2JKp4zmpfmANnL0e/SyBvL0fX0q6wm/tVdZWa96v/VuTe5YEioegsE+K4uTy
         KFPUiTA4gy+dcUTzoC8EKynXb/vEgRH3F+LuJyTXJOm4A1ynJP5+1jUq60MrplDr574p
         Vz6XGBB8gVHn5HR6oAmdRv8x1rA74HCfD3NaZf8BECu5LeG3bjxrAf/SCT49yh4lN7ZP
         4drqxh52UhNqhHZOwJ0Im+/8QkQ7+Nm56vzsWpGDMpGuaM0Fplnut9FNF1AfrrY0s1Vp
         W7Mi87c4k0xJWD5tGqzSWQELNyEKnIvZlHODjQh686TH7c6LVsonIwx7eSEv2uI+q4e8
         D6YQ==
X-Gm-Message-State: AOJu0YyNta26L0pBcv4vi7z3pNV7yigeEaXVxlsSh1Uaa3Q0qtICqpYx
	g+HU40xOhkuRpuZ4OPawFD5cYaYHKePSBSfZ/uY=
X-Google-Smtp-Source: AGHT+IFqT40WVP8Z+ClgNfUSSEgUV7SlC+UF1zZ0Cw9qc6IQiADSBkbYmmCZqgnBA5pxm8Jmxv25xw==
X-Received: by 2002:a50:d08f:0:b0:53d:b6ac:5f64 with SMTP id v15-20020a50d08f000000b0053db6ac5f64mr2317965edd.18.1697735839113;
        Thu, 19 Oct 2023 10:17:19 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id cn27-20020a0564020cbb00b0053eec17c889sm4752506edb.23.2023.10.19.10.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 10:17:17 -0700 (PDT)
Date: Thu, 19 Oct 2023 19:16:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	evan@rivosinc.com, conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v1 3/6] RISC-V: hwprobe: Introduce which-cpus flag
Message-ID: <20231019-ff7817229eb2cc818ea08fe5@orel>
References: <20231011135610.122850-8-ajones@ventanamicro.com>
 <20231011135610.122850-11-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231011135610.122850-11-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_101723_756672_16005164 
X-CRM114-Status: GOOD (  21.98  )
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

On Wed, Oct 11, 2023 at 03:56:14PM +0200, Andrew Jones wrote:
...
> diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
> index 026b7645c5ab..e6c324d64544 100644
> --- a/arch/riscv/kernel/vdso/hwprobe.c
> +++ b/arch/riscv/kernel/vdso/hwprobe.c
> @@ -3,6 +3,7 @@
>   * Copyright 2023 Rivos, Inc
>   */
>  
> +#include <linux/string.h>
>  #include <linux/types.h>
>  #include <vdso/datapage.h>
>  #include <vdso/helpers.h>
> @@ -11,14 +12,9 @@ extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
>  			 size_t cpusetsize, unsigned long *cpus,
>  			 unsigned int flags);
>  
> -/* Add a prototype to avoid -Wmissing-prototypes warning. */
> -int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> -			 size_t cpusetsize, unsigned long *cpus,
> -			 unsigned int flags);
> -
> -int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> -			 size_t cpusetsize, unsigned long *cpus,
> -			 unsigned int flags)
> +static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
> +				 size_t cpusetsize, unsigned long *cpus,
> +				 unsigned int flags)
>  {
>  	const struct vdso_data *vd = __arch_get_vdso_data();
>  	const struct arch_vdso_data *avd = &vd->arch_data;
> @@ -50,3 +46,59 @@ int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
>  
>  	return 0;
>  }
> +
> +static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
> +			       size_t cpusetsize, unsigned long *cpus,
> +			       unsigned int flags)
> +{
> +	const struct vdso_data *vd = __arch_get_vdso_data();
> +	const struct arch_vdso_data *avd = &vd->arch_data;
> +	struct riscv_hwprobe *p = pairs;
> +	struct riscv_hwprobe *end = pairs + pair_count;
> +	bool clear_all = false;
> +
> +	if (!cpusetsize || !cpus)
> +		return -EINVAL;
> +
> +	if (flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
> +		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
> +
> +	while (p < end) {
> +		if (riscv_hwprobe_key_is_valid(p->key)) {
> +			struct riscv_hwprobe t = {
> +				.key = p->key,
> +				.value = avd->all_cpu_hwprobe_values[p->key],
> +			};
> +
> +			if (!riscv_hwprobe_pair_cmp(&t, p))
> +				clear_all = true;
> +		} else {
> +			clear_all = true;
> +			p->key = -1;
> +			p->value = 0;
> +		}
> +		p++;
> +	}
> +
> +	if (clear_all)
> +		memset(cpus, 0, cpusetsize);

This memset will go away in v2. It wasn't very smart of me to put it there
in the first place as there's no memset available to vdso code, which
means it would segfault when attempting to use it. My initial testing
failed to find this, because I had forgotten that avd->homogeneous_cpus
would be false on a default QEMU machine since it doesn't set mvendorid to
anything. I actually found this problem when trying to add a memcmp which
wasn't skipped with !avd->homogeneous_cpus, and that promptly segfaulted.
(I won't be adding that memcmp either :-)

Thanks,
drew

> +
> +	return 0;
> +}
> +
> +/* Add a prototype to avoid -Wmissing-prototypes warning. */
> +int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> +			 size_t cpusetsize, unsigned long *cpus,
> +			 unsigned int flags);
> +
> +int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> +			 size_t cpusetsize, unsigned long *cpus,
> +			 unsigned int flags)
> +{
> +	if (flags & RISCV_HWPROBE_WHICH_CPUS)
> +		return riscv_vdso_get_cpus(pairs, pair_count, cpusetsize,
> +					   cpus, flags);
> +
> +	return riscv_vdso_get_values(pairs, pair_count, cpusetsize,
> +				     cpus, flags);
> +}
> -- 
> 2.41.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
