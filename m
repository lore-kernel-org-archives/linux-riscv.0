Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07687C77B60
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 09:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6MQsIhuT5rAlPd+WfJHy0RaxLAIgQOA7UDh9s7Gz5o=; b=ed5/uVI/mIRb4Z
	Fzu37T2Mhc9h3fvgOSAlWAxIXA5w79CqkeZNaGTmP5FgIjHrr+fwKJ/FFLckm2CI9liBHWNBD5G0n
	QFSlIK6g84QYmK/TbhW0+FdFEME1tXYllTGFEier6Gvj6mXoTkuHbGrXqsIvhFf2l8sCoIbnmL2L9
	j/FaInjpQlBW13P8P5wbIGasfGbz3St7KUSWujk0LfUD0K2aKSIvKuE7ke3hSp/T9LMMBXE8AcGGh
	1wPzjEMaGrZM2bAonmqgEpjqCqsHHc2QEIHC6IrCU5Sm6i9GXj/IW3IXomJAeeuOwyXOSksgf0Rcc
	1eMSrRKvUa3Yrmkv+sjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prbQ1-003IZH-2o;
	Wed, 26 Apr 2023 09:26:33 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prbPw-003IXw-18
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 09:26:32 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-2f87c5b4635so6190692f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 02:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682501181; x=1685093181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2o8Rym9HE9WsYI/KEsx3tF42jIFXLUlZvQ+TcxxaAas=;
        b=nZtWi2ZDxJ6CHxhBq3HsN39pcXVI2ltvAS1EQ7bjdLypg+/m9XvP82QTz5cPl6jfef
         NJI81BFB/SIeko3w2xbjrypx2RoLLGZeWBkp+qqjwvXsBl9TjIdDvukcKT1ThFdnV0Em
         SpD1foMMKQpRG9wR/NoEXBbROnRsecIXq0WVxIYkRbTYxP34+S0G9FIJBwXGf2EOnwp1
         GwAvGSf58jeS+Ol2+urreyUH/GbnCeDJHU+CJESS23YSn4hH4VJwboYlrpZbM2XZVJvl
         KAzO30bnZi2GsHWey+5WAzM6zl7Y58BPbrJ+xykWKwc5xAKMzLphQ5e8lqEqXJ5GsQwr
         W0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682501181; x=1685093181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2o8Rym9HE9WsYI/KEsx3tF42jIFXLUlZvQ+TcxxaAas=;
        b=MPiAl76qd8DXmvVv5713TUMRI82RYGSYpFjK4pVFnjNHJD3nd1dCnPD9STS2OGeRw5
         3324V8euM7rkg/a6SnuW8wFJjkXa9K9N1SCFxG6kcoeQ3xp9N9jQweiUlqav2HQa51kb
         VB6yIMaifITZArVcbc6MF0yjLchnHkOuN/zpqJO1LhUELrdtucxBdfWJgU73lSUCzmgO
         uTGJvkncv1jYyvoBUOGNYeGKLMqHFh7Lz3E/1yQvW3FeJdn+fjxW5+3xvZTlYobqG8/t
         sUuVx+vu2rOsvjZzwpVmojp9tXsUp3xQAxUXeGBJCsXl2/rxtWErWZBBGNoT53W/0Bv3
         Jngg==
X-Gm-Message-State: AAQBX9dVaZgL6V/mQiNcov7O1uUzMSBvit+Jy4u1TiiOJ8GH/k7OonOQ
	aW9pjkSEyDOZAuaUeoKXA7Su3g==
X-Google-Smtp-Source: AKy350bbUOr6rWD5f5Ho0C942Q+JOmVTmLWm7KFaHxLxJfCHNN81F6RAI7lRhT+zJCa8SPcrYazm/w==
X-Received: by 2002:adf:e952:0:b0:2cf:e74f:2957 with SMTP id m18-20020adfe952000000b002cfe74f2957mr14770856wrn.33.1682501181276;
        Wed, 26 Apr 2023 02:26:21 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id p17-20020a056000019100b002fda1b12a0bsm15341879wrx.2.2023.04.26.02.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:26:20 -0700 (PDT)
Date: Wed, 26 Apr 2023 11:26:19 +0200
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
Message-ID: <lv4pqquqf4zpzijewmiglzqb4smbi5gwxgymgzu3keeuvzv7j6@meua3tfpwjs3>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <20230424194911.264850-2-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424194911.264850-2-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_022628_388696_17F9F791 
X-CRM114-Status: GOOD (  29.55  )
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

I see this subtracting of 1 here and then using <= below comes from
the current print_isa_ext(), but it seems odd. How about just

static int strlen_isa_ext(void)
{
   int ext_len = 0;

   for (int i = 0; i < ARRAY_SIZE(isa_ext_arr); ++i) {
      struct riscv_isa_ext_data *edata = &isa_ext_arr[i];
      ...
   }

   return ext_len;
}

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

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
