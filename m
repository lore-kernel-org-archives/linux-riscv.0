Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A655C77B60
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 09:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XkC7E6otNTFq/4noAhrviH1plSouO4ADP5zMB+UwlM=; b=D4Y+/Qbb7VKFff
	aI4yKYjZR5U6gxiu5a9JH14NwAAY0UqbZVBQWPYy/FscMlopycuPE77ObeUb20iUTCt79/PmvwhAp
	djKvArTjZlqZxaoJKylruJltVCVsh39D6p4//x91tXec96LAKWtN1E3roMyg3Czs/H6lf2Pq5sIcA
	u8cS6uvOx6McSH9w+tXhwxLFr9vTEwk55VhkLkI9gOvFybSCIyyAw0sAECqb54/FcSxIo9Gkf22dW
	pe14BGjU2PnFxa0mK1OOa1JY9V5/VQkb15D21PyHVzhDuKMG2GjgvIcWm1/txDzDDP3aYeeiOJN9v
	w4Vs2+0ZQklbhbZlnvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prbau-003Kvk-0G;
	Wed, 26 Apr 2023 09:37:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prbar-003Kuv-1D
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 09:37:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-2f625d52275so6598920f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 02:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682501863; x=1685093863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GGzFSv98HDJv+ep2+uGlvHglFQwWd3hEUaewWLWJTeM=;
        b=FeUkYEDsMultKQCqlNuwdPzZXXJ8w3+yKweQ1IN3IxJsczSEQpi8fQFiw8xxxcRxm6
         l9Bd/Wrd3uvIUn6QdB6rS6RQ/HfbHGZMFNnCTzZpuIzTlaBC94c4lH5WcW8bQke2oSP4
         2MhLZZooI6oiAvZ//JzkgpfgDmJjJMuZU+Ih8RqbFb8gQ3rqRn3YHBclXcI8fclXPrWx
         ws1gz4pFYRpzokjUGtEa2ebrenmwvSQOrAoUn8iPoJjQTydesn2Oy0m7pT3ITUrfsAJy
         vqzklpLRaMUh9kRX57T2UdDofMCEguEo4kFFiJ5wAQojjNGDl25N784N0rco1be9/Mwa
         HfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682501863; x=1685093863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGzFSv98HDJv+ep2+uGlvHglFQwWd3hEUaewWLWJTeM=;
        b=JZQX6ifEOMEex8NNUwRr7synd7NVcDpLV8UqWKXt0o1XGiAtEBCyRPxmBKDcu355eW
         ytO8bICrA0GtrHXH14vY841FxSQq/7pu8np21DBQ51+jsPYQsAVVDNx+i1w9lJkF1mMJ
         9NIHlmXb0hWYBWD+uAqSHsro01jy9TNYJNg/WwR13ki9Zn1Hl3MUsPm4Kjb3ppaRrlHw
         sDiImFerXGS5854DBkTXvV1VNIzjEc/M1EkKohPwYp7zgJInh0OtrFRHGvd9QCSEEe9w
         6DSqqwITmZ0SFn4w6vj3nIprNd5OtrRJ7Q18k0Ym6IpVEOJm1h9dKD/0ZelXv3igfUqt
         3n2A==
X-Gm-Message-State: AAQBX9fPaftBf+fUbuVGUfDx+18ykRCsC39un0K/3L9fdjuwXrRu1K+a
	3HPL/aaOTpE0B1kd17U6oNw4oQ==
X-Google-Smtp-Source: AKy350YJ1K1zbrC6c+Kki0A/2SSZsAEfJnJYK7MMO6Is0v4g8MMDqnBoQ9d4/8EPfclfIUK0hbUwWQ==
X-Received: by 2002:adf:fc4f:0:b0:2f7:725d:e7b4 with SMTP id e15-20020adffc4f000000b002f7725de7b4mr13264555wrs.18.1682501863040;
        Wed, 26 Apr 2023 02:37:43 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4d0e000000b002efb4f2d240sm15266468wrt.87.2023.04.26.02.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:37:42 -0700 (PDT)
Date: Wed, 26 Apr 2023 11:37:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, kito.cheng@sifive.com, jrtc27@jrtc27.com, 
	conor.dooley@microchip.com, matthias.bgg@gmail.com, heinrich.schuchardt@canonical.com, 
	greentime.hu@sifive.com, nick.knight@sifive.com, christoph.muellner@vrull.eu, 
	philipp.tomsich@vrull.eu, richard.henderson@linaro.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 2/4] RISC-V: don't parse dt isa string to get rv32/rv64
Message-ID: <m5areidrpevtl6kbdoaikrvaxhq2cttgzklncqq3uygrsduzuf@anfyqmxtge73>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <20230424194911.264850-3-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424194911.264850-3-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_023745_415646_631A6675 
X-CRM114-Status: GOOD (  24.45  )
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

On Mon, Apr 24, 2023 at 09:49:09PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> When filling hwcap the kernel already expects the isa string to start with
> rv32 if CONFIG_32BIT and rv64 if CONFIG_64BIT.
> 
> So when recreating the runtime isa-string we can also just go the other way
> to get the correct starting point for it.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/kernel/cpu.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index ebc478f0a16c..06c2f587a176 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -244,7 +244,7 @@ static void strcat_isa_ext(char *isa_str)
>   */
>  static const char base_riscv_exts[13] = "imafdqcbkjpvh";
>  
> -static char *riscv_create_isa_string(const char *isa)
> +static char *riscv_create_isa_string(void)
>  {
>  	int maxlen = 4;
>  	char *isa_str;
> @@ -261,7 +261,11 @@ static char *riscv_create_isa_string(const char *isa)
>  		return ERR_PTR(-ENOMEM);
>  
>  	/* Print the rv[64/32] part */
> -	strncat(isa_str, isa, 4);
> +#if IS_ENABLED(CONFIG_32BIT)
> +	strncat(isa_str, "rv32", 4);
> +#elif IS_ENABLED(CONFIG_64BIT)
> +	strncat(isa_str, "rv64", 4);
> +#endif

I see we do the validation in riscv_fill_hwcap() and we also do this
#ifdeffery there, but I can't see any reason not to do

 if (IS_ENABLED(CONFIG_32BIT))
    ...
 else
    ...

instead.


>  
>  	for (i = 0; i < sizeof(base_riscv_exts); i++) {
>  		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
> @@ -280,7 +284,7 @@ static void print_isa(struct seq_file *f, const char *isa)
>  
>  	seq_puts(f, "isa\t\t: ");
>  
> -	isa_str = riscv_create_isa_string(isa);
> +	isa_str = riscv_create_isa_string();

Why are we still passing 'isa' to print_isa()? It's now unused and
print_isa()'s single caller only fetches it from the DT for this
one purpose, so that of_property_read_string() call could now also
be dropped.

>  	if (!IS_ERR(isa_str)) {
>  		seq_write(f, isa_str, strlen(isa_str));
>  		kfree(isa_str);
> -- 
> 2.39.0
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
