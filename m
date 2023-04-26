Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3C5C77B60
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RucIt2H9/WwcBp898LCWy0Kg2t0CaDVAsInAgUUd0s=; b=BYBRD/cQq0Jc70
	Unxpzps9tMEZIQQnd5Ad67agxT8fxBGrlIrlkZ2oEXhtV0PZtlftaVk+G+T4385Mnc+iJ/EB531Jg
	W8oKBfRnn9EiiFqoCqtWt2xxgkWEBREBwj0HuBe8TRrcS0X+dtwUKfW1JDdS269IkQ7hfCLbuwn3R
	XLvVmXcrlHxbQQfAJaOwzi4fNYx8EWY5YSy7OT3P4vE0bajqrz7HIulG/zLAmHAmZ8rS2W4DPo/tI
	roeoC8wehX1kZrbTzkIjVp1E+qO09XCg6zv3TfWGhQz/tAmMXYnP81tPWw6fwYq8EA8NIC1zmCtqc
	CIS1hIH4Cnvflpeb1+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prbdD-003LGI-0k;
	Wed, 26 Apr 2023 09:40:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prbd9-003LFs-2z
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 09:40:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-2fa0ce30ac2so6209642f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 02:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682502006; x=1685094006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MCMZ2IMJd2Mg7ngIyTYsjSve7eNLUi3UfEwOsJMdk1o=;
        b=GzOISrM2ope9QrnhxkRH/bKx1q9TCuQyewhfJeCjh5rHwXtt8kn8I99JXMFpnXY2cx
         UeA6ZgsIuRt499NoBAO8+Mr1fA1w8FtMSbRGLiYGp9oanczxuQCg6s92Kzzp82UyZ6JJ
         TZyUB1a9sn0Ude8kNNB13sjRSft4PTMPN9RTY08X7QwfIHNkutTYwl7bGfMzxeXF6shR
         ZcRw/WciBGFTSqYlnjUWfWbULosdWZe0RndS2szzyzVq6xqcoZBBdxjDMMBrHQgqFAhy
         KRS7LDvLjnZ/Gb/oleR19m9gQSwYI/UfPIFPlyw6VA4kb6+nneCG+e7TF90bnKRO+xW9
         et5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502006; x=1685094006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCMZ2IMJd2Mg7ngIyTYsjSve7eNLUi3UfEwOsJMdk1o=;
        b=gxO0S3PSvLhhKfa96zscP2Hoe1YwF3Tge138177mM2h24pHw8DIXfRlQoMgL3bjPcO
         /pfRmrTBVyBWAVpGbmCKCtYnHOexhvcfGQlgVl6/Y/5wZih6Rk0YDJZ5MXsNIK60CBq7
         LweiYndxjcZpgvOVS34NCUauGkYHpaVtcTbwlWSPxJhZhFvubmkODVcZHhNYgfilrrBe
         xgdzLfNHQ+mNfAcfPO6lTrytBbKJzOmTjjDrtL+V6zeOxKE8LRgTa6J/FrCmldHuOPMV
         OkmFm9lL/sLBRutHmoavxTqHNkikDTgquM67B/Vj8mGSJYEpF5MY5xRbr6qbKCrweauC
         BbVQ==
X-Gm-Message-State: AAQBX9dUDima0wOIDWpkTpAjlUKnhA4G7+vLUgt7Z3k/Oje+cLlFk5HP
	IjiWTkArm9tr7PZyBduzo6hRmw==
X-Google-Smtp-Source: AKy350ZYnYCrMmjZAf8jC517i9hI+fORK7KGyz/IvtmdvWW9MwPZRaq1gyBB7pPl9gyVg2VV2T0qaQ==
X-Received: by 2002:adf:dc89:0:b0:2c9:e585:84b0 with SMTP id r9-20020adfdc89000000b002c9e58584b0mr13150565wrj.1.1682502006068;
        Wed, 26 Apr 2023 02:40:06 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d674b000000b0030276f42f08sm14021845wrw.88.2023.04.26.02.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:40:05 -0700 (PDT)
Date: Wed, 26 Apr 2023 11:40:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, kito.cheng@sifive.com, jrtc27@jrtc27.com, 
	conor.dooley@microchip.com, matthias.bgg@gmail.com, heinrich.schuchardt@canonical.com, 
	greentime.hu@sifive.com, nick.knight@sifive.com, christoph.muellner@vrull.eu, 
	philipp.tomsich@vrull.eu, richard.henderson@linaro.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 3/4] RISC-V: export the ISA string of the running machine
 in the aux vector
Message-ID: <tef7bmjygjiafy3cykdj6uqlkovej5om2xm5rcnbjcqp34e574@hxlta64oagat>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <20230424194911.264850-4-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424194911.264850-4-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_024007_987471_7013A75B 
X-CRM114-Status: GOOD (  25.00  )
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

On Mon, Apr 24, 2023 at 09:49:10PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Already defined aux-vectors regarding the machine type are AT_PLATFORM
> and AT_BASE_PLATFORM. PPC already uses AT_BASE_PLATFORM to identify the
> real platform the system is running on, so do a similar thing on RISC-V
> and export the ISA string of the running machine via this aux-vector
> element.
> 
> This way userspace can possibly adapt to extensions that allow it to
> run certain loads more performantly.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/elf.h | 10 ++++++++++
>  arch/riscv/kernel/cpu.c      | 12 ++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index 30e7d2455960..820ef627e83d 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -78,6 +78,16 @@ extern unsigned long elf_hwcap;
>  
>  #define COMPAT_ELF_PLATFORM	(NULL)
>  
> +/*
> + * ELF_PLATFORM indicates the ISA supported by the platform, but has
> + * special meaning to ld.so .
                              ^ stray space

> + * Expose the ISA string including all usable extensions via
> + * ELF_BASE_PLATFORM instead and allow userspace to adapt to them
> + * if needed.
> + */
> +#define ELF_BASE_PLATFORM (riscv_base_platform)
> +extern const char *riscv_base_platform;
> +
>  #ifdef CONFIG_MMU
>  #define ARCH_DLINFO						\
>  do {								\
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 06c2f587a176..71770563199f 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -118,8 +118,12 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
>  	return 0;
>  }
>  
> +const char *riscv_base_platform = NULL;

No need for the '= NULL'

> +static char *riscv_create_isa_string(void);
> +
>  static int __init riscv_cpuinfo_init(void)
>  {
> +	char *isa_str;
>  	int ret;
>  
>  	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/cpuinfo:starting",
> @@ -129,6 +133,14 @@ static int __init riscv_cpuinfo_init(void)
>  		return ret;
>  	}
>  
> +	/*
> +	 * Create the isa-string with the common set of extensions over
> +	 * all harts, to expose as AT_BASE_PLATFORM in the aux vector.
> +	 */
> +	isa_str = riscv_create_isa_string();
> +	if (!IS_ERR(isa_str))
> +		riscv_base_platform = isa_str;
> +
>  	return 0;
>  }
>  arch_initcall(riscv_cpuinfo_init);
> -- 
> 2.39.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
