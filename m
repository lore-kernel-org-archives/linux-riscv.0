Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02479CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpGiY3Fni6bMUffiwfIyjEQnX6of5r0Xgg4h/YJqktc=; b=nrW7CRIT3u56fd
	kVRVAxApjPCv5W90E/W5nWhphX1qPpbUduGGWJ6QvsRyWfnVSdAG0OhV2ui+aE49vh2thdlUBm6c9
	6WdWoF/5kCA0nhzdJ/EG5el+kQmoVF+94zhK5QsrlvCB3fopBf7ARCYFwWtwDQVMUMPtf1yGl7jtv
	2CrapWN3O7ijMPi2Fffc9ufLDO9kUJKv7CiIWF6w3191idrZd5ww3lTvA/drjgARZI+Syq9i/EbmU
	TZ6soUuH5fGqpY9sI8R+/eTnnRMw+jBOadDQdryfQWZH6oRdlgOWj7xCxDx3mHPnqHvpmDR4j4KIK
	4akRmqy579RNfA8JHlTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfdW-00BiPg-1W;
	Tue, 17 Oct 2023 08:41:10 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfdU-00BiP4-02
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 08:41:09 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso43428441fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697532064; x=1698136864; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vB/kfuKzCfr9/00WQN4N9vxRELf8bEUkzHFo66uF28g=;
        b=IBIJGEN4sSOLbEKmlELVHq0Kwx9V06w5XuwOrYZze1RvnGTdjL23UxnTzIRLpcCMSS
         PTLfugkKwp/RnzaL18MmIzUTWxSIau3qnqKTVmEZrJM0WFZdTXwuKXNztFpdj1PApLts
         Q8MWVKGE7wjFz0tncREIq3zU84k1w/A8eNJPQiHTpuKL8wjQ60JmYUnO42K0eapD1vnZ
         ZuV1YtA3ogX5NZ4YhSfs+rjny9NPoZhhC26YpMIdR3Tqg/76GHeDuXfw9z7VsEJ+GLTy
         /66XqQ4BF7vybvfIqilZrfkGOItHl55HxhhhseaR2eRCiug90xDYRkHWWez/E+Kfgu6v
         2l/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532064; x=1698136864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vB/kfuKzCfr9/00WQN4N9vxRELf8bEUkzHFo66uF28g=;
        b=Hv0f48MP9wd/zgTG1sXu/CfEitz9t3dO/dR0rFozdDmLpjEwmt70ZMrmTlzAtqJMXy
         rz09s4k+0tTZ1n8/+reup7MIXnCgyA1Q75XmMAo0J92wz1UvI5msBtVBpZAi7ZbSCxT/
         p2UertEJX3UDkT+0Eva30YhNsQeI/mIixcHoYuBk6Af0RuQL8un+74DljrTqDw1puxQJ
         NaSYAclLY7H/b3Xk9OSdSZH56GEjP5hjkinOxaVZuo09TUon0yZRA0RIfLMg6O86HgPi
         W/JhME7X/cjcmAgf8chUa3aAb91Ranpw4Qfw7SwZOh9w1Vmzal6SKNvPjQQiZ0FHdJ32
         wVBA==
X-Gm-Message-State: AOJu0YwnkeEFS6mbT8cyHfQ5lBKIOsNz1r2fFl55UwECVuwtdFrvZPh/
	M0GTh+ZGU6Lv/UlvQInnM/safT2gWkU/IncQUdI=
X-Google-Smtp-Source: AGHT+IGhiqrfDB4ZTR0M/BpXYyS+AZ/LIFG8yzd1vQg3LLGnmte00ytOqfmObo/yWeIIK6ortCSl8Q==
X-Received: by 2002:a2e:9214:0:b0:2c2:8f22:d9c2 with SMTP id k20-20020a2e9214000000b002c28f22d9c2mr1361491ljg.22.1697532064466;
        Tue, 17 Oct 2023 01:41:04 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d51c2000000b0032da4f70756sm1164746wrv.5.2023.10.17.01.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 01:41:03 -0700 (PDT)
Date: Tue, 17 Oct 2023 10:41:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 -next 3/3] RISC-V: cacheflush: Initialize CBO
 variables on ACPI systems
Message-ID: <20231017-e198b2c70475b6f09754d175@orel>
References: <20231016164958.1191529-1-sunilvl@ventanamicro.com>
 <20231016164958.1191529-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231016164958.1191529-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_014108_049616_BA8B95B6 
X-CRM114-Status: GOOD (  18.75  )
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

On Mon, Oct 16, 2023 at 10:19:58PM +0530, Sunil V L wrote:
> Initialize the CBO variables on ACPI based systems using information in
> RHCT.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/mm/cacheflush.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index f1387272a551..55a34f2020a8 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -3,7 +3,9 @@
>   * Copyright (C) 2017 SiFive
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/of.h>
> +#include <asm/acpi.h>
>  #include <asm/cacheflush.h>
>  
>  #ifdef CONFIG_SMP
> @@ -124,13 +126,24 @@ void __init riscv_init_cbo_blocksizes(void)
>  	unsigned long cbom_hartid, cboz_hartid;
>  	u32 cbom_block_size = 0, cboz_block_size = 0;
>  	struct device_node *node;
> +	struct acpi_table_header *rhct;
> +	acpi_status status;
> +
> +	if (acpi_disabled) {
> +		for_each_of_cpu_node(node) {
> +			/* set block-size for cbom and/or cboz extension if available */
> +			cbo_get_block_size(node, "riscv,cbom-block-size",
> +					   &cbom_block_size, &cbom_hartid);
> +			cbo_get_block_size(node, "riscv,cboz-block-size",
> +					   &cboz_block_size, &cboz_hartid);
> +		}
> +	} else {
> +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> +		if (ACPI_FAILURE(status))
> +			return;
>  
> -	for_each_of_cpu_node(node) {
> -		/* set block-size for cbom and/or cboz extension if available */
> -		cbo_get_block_size(node, "riscv,cbom-block-size",
> -				   &cbom_block_size, &cbom_hartid);
> -		cbo_get_block_size(node, "riscv,cboz-block-size",
> -				   &cboz_block_size, &cboz_hartid);
> +		acpi_get_cbo_block_size(rhct, &cbom_block_size, &cboz_block_size, NULL);
> +		acpi_put_table((struct acpi_table_header *)rhct);
>  	}
>  
>  	if (cbom_block_size)
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
