Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9817AC77B60
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6VpCu3NWeKy3NRVeAIpwoNki9MaON2GHY27l5+j5zM=; b=t9hI3+Z5yZrJbq
	iG/ppmuUKJpl+EX6N6c5pjM+pyzMgv9Kd/qSHyNpebuTFE9SHW3F+hOdEEYSXcmcQ+X11UzJO6nKU
	UpyFeqe1C4mIoWM0PnP8fpms6EpFwNtT7EBp/1cdczLLyS8cbSzQQ7gz5e0Xy2Mexq1lqyGqLhC1p
	UjMqmAv1W8830s04DwKjA6L/ltIxCTFCLJXo7vsup/5O0q4fTdJRdz+AFiGjNcgkhWbaoxJbncuXy
	zryxhFqbuIZePYivG6Ep59vh0yxz7TpVrv+kp2gqo0is902zxlUljqhon5pcrR5elDOrolRUN52Nq
	C44kG9Nv7X8AEyHD1y6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prbhr-003LsO-2O;
	Wed, 26 Apr 2023 09:44:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prbho-003Lre-0g
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 09:44:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-2f4214b430aso4242282f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 02:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682502293; x=1685094293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V/IGGADZhdXqGyELkssyerkCwrvqv8FKR2wx4hOADtI=;
        b=CYPRgwN8BcHy9Hl31pPeGginXJGobHEjaCVlPgtrwZtC1xRXBLqDeGEtIhbaP6iAvw
         nTrbukMF6LiAZQn1lOMm/lIpVq4dn9dLrQAwgv6dcyhkgi7xmiP/JsF4ZYscbZ4ojzwL
         uBtP6jt3cwtwyu5nmh9QRU18oLkQ08tHCxUA4wk0SEIho4nLzZJzlrq8WHHmgha4O97L
         ULJgvCyUk2IMhvJsumEPXVFRtJ8M59krDoHvTP6/lcQUl5+VRekYNX7Mr5dTy1XRh3CQ
         32RE+xw+vdjwu5q/ESNYTpg9rUQFz0ESg54eQXyUDl53p4v8rctpiQd2wuAqkNADZ7cF
         vGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502293; x=1685094293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/IGGADZhdXqGyELkssyerkCwrvqv8FKR2wx4hOADtI=;
        b=f8dAzse5WSEr1lUO1Z7AQA4liO4pxQVKO71M0pPWbM2xHA0G46ij8Z+lWXrQC+Xk3i
         cIsuuBEnw4pRqbVJtgbXp6rpRQNz0rEioosBddsYblRMBrTh/1EWPH0+E7pCQNoyOwxn
         2vQm9+GRi0eM+fs+1+/ZAeqCTl6Z4yiDT9I9b6YJejXxkNB+C1KstYI6T88Np2PQEvHw
         HvN/wY8k1ezTg3C4+pHuWSrL2N6Wb6T7HTkD2v85NhIMKGvPbNWi5fbCMTNri2iZYnoa
         nkutXW8dojHN/zGQFweoxHPKSMoZ7jZ6j08Uj3ahxjCWegV2wvmY5cPGoyaf9TXA2Aej
         Nxig==
X-Gm-Message-State: AAQBX9c/ycO8EjAj2uzdkQCHQ/+Mzi2Z/sTI5mrqS1g8tDF44WUpH1zF
	D2u6nePSyp3Qq3O3WVMO4lpoyg==
X-Google-Smtp-Source: AKy350YQ3srjPhGGApWandMudboVxYKZ/a0dxTAA1HsGoL3vfwXik3j+j/1ZVUYONJSQZqQEMqgJUQ==
X-Received: by 2002:adf:db09:0:b0:2fb:9995:f707 with SMTP id s9-20020adfdb09000000b002fb9995f707mr13450462wri.67.1682502293717;
        Wed, 26 Apr 2023 02:44:53 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id e26-20020a05600c219a00b003f180d5b145sm17440315wme.40.2023.04.26.02.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:44:53 -0700 (PDT)
Date: Wed, 26 Apr 2023 11:44:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, kito.cheng@sifive.com, jrtc27@jrtc27.com, 
	conor.dooley@microchip.com, matthias.bgg@gmail.com, heinrich.schuchardt@canonical.com, 
	greentime.hu@sifive.com, nick.knight@sifive.com, christoph.muellner@vrull.eu, 
	philipp.tomsich@vrull.eu, richard.henderson@linaro.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 1/4] RISC-V: create ISA string separately - not as part
 of cpuinfo
Message-ID: <ndutxbscghgblr2pftn4dmri42wbor5nw6vr7fhkysb6gmgyat@fwwdzcuiwfdv>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <20230424194911.264850-2-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424194911.264850-2-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_024456_269428_6139D9C8 
X-CRM114-Status: GOOD (  31.13  )
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

On Mon, Apr 24, 2023 at 09:49:08PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> The isa string is a very central part of the RISC-V architecture, so will
> be needed in other places as well.
> 
> So in a first step decouple the generation of the runtime isa-string from
> /proc/cpuinfo - its current only user.
> 
> The resulting string should not differ from the previously generated one.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/kernel/cpu.c | 70 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 62 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 3df38052dcbd..ebc478f0a16c 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -193,10 +193,33 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };
>  
> -static void print_isa_ext(struct seq_file *f)
> +static int strlen_isa_ext(void)
>  {
>  	struct riscv_isa_ext_data *edata;
> -	int i = 0, arr_sz;
> +	int ext_len = 0, i, arr_sz;
> +
> +	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
> +
> +	/* No extension support available */
> +	if (arr_sz <= 0)
> +		return 0;
> +
> +	for (i = 0; i <= arr_sz; i++) {
> +		edata = &isa_ext_arr[i];
> +		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
> +			continue;
> +
> +		/* string length + underscore */
> +		ext_len += strlen(edata->uprop) + 1;
> +	}
> +
> +	return ext_len;
> +}
> +
> +static void strcat_isa_ext(char *isa_str)
> +{
> +	struct riscv_isa_ext_data *edata;
> +	int i, arr_sz;
>  
>  	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
>  
> @@ -208,7 +231,8 @@ static void print_isa_ext(struct seq_file *f)
>  		edata = &isa_ext_arr[i];
>  		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
>  			continue;
> -		seq_printf(f, "_%s", edata->uprop);
> +		strcat(isa_str, "_");
> +		strcat(isa_str, edata->uprop);
>  	}
>  }
>  
> @@ -220,19 +244,49 @@ static void print_isa_ext(struct seq_file *f)
>   */
>  static const char base_riscv_exts[13] = "imafdqcbkjpvh";
>  
> -static void print_isa(struct seq_file *f, const char *isa)
> +static char *riscv_create_isa_string(const char *isa)
>  {
> +	int maxlen = 4;
> +	char *isa_str;
>  	int i;
>  
> -	seq_puts(f, "isa\t\t: ");
> +	/* calculate the needed string length */
> +	for (i = 0; i < sizeof(base_riscv_exts); i++)
> +		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
> +			maxlen++;
> +	maxlen += strlen_isa_ext();
> +
> +	isa_str = kzalloc(maxlen, GFP_KERNEL);
> +	if (!isa_str)
> +		return ERR_PTR(-ENOMEM);
> +
>  	/* Print the rv[64/32] part */
> -	seq_write(f, isa, 4);
> +	strncat(isa_str, isa, 4);
> +
>  	for (i = 0; i < sizeof(base_riscv_exts); i++) {
>  		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
>  			/* Print only enabled the base ISA extensions */
> -			seq_write(f, &base_riscv_exts[i], 1);
> +			strncat(isa_str, &base_riscv_exts[i], 1);
> +	}
> +
> +	strcat_isa_ext(isa_str);
> +
> +	return isa_str;
> +}
> +
> +static void print_isa(struct seq_file *f, const char *isa)
> +{
> +	char *isa_str;
> +
> +	seq_puts(f, "isa\t\t: ");
> +
> +	isa_str = riscv_create_isa_string(isa);

Shouldn't there be another patch in this series that switches this
to using the new riscv_base_platform. The allocation/regeneration/freeing
doesn't seem necessary each time we cat cpuinfo.

Thanks,
drew

> +	if (!IS_ERR(isa_str)) {
> +		seq_write(f, isa_str, strlen(isa_str));
> +		kfree(isa_str);
> +	} else {
> +		seq_puts(f, "unknown");
>  	}
> -	print_isa_ext(f);
>  	seq_puts(f, "\n");
>  }
>  
> -- 
> 2.39.0
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
