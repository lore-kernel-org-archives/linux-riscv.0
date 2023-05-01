Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97377C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=t5Fh++xhjSTnq8YE30y6SFMOtigt8Re7SRb35veFfjw=; b=ejbKY20320y+UhLXT6YFYdkRMX
	Z9U24PCJv9NK4uKJkQ8U+gcfo9vXpmF/Z97eV9XygYdzMuMNB/YOgPNe4PN7uL+tMqSdXgvb1lj3x
	QR51qzOYCmVE554ztmu3zw0CMoen+okCGH3TJ8hjA3KOHhAT0nLvoTGWApI1DTlxnArzEBo6+ODb9
	R/dVkRfexaDNSmXVt5qi85nlEUXSI1lparDQhvhif7dgurcF0vU2eyVb3IeGZ0jBcejkJu696ql1k
	czFKTM2Xs6wSm+8GLCBUL9hsF8iB37cjflBXdKjjMDSN6JnwFk/ye+up5b5O5CYh4MfdL89I8J5V2
	P0j8M8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptUtO-00GAnD-1u;
	Mon, 01 May 2023 14:52:42 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptUtL-00GAmR-2J
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 14:52:41 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-24e14a24c9dso331947a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 07:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682952758; x=1685544758;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vWKczLk0ay+PirEjdR/euEKVb0wOolvAqOmXbb6hoY=;
        b=fKvrQspeK3vHIkH7HvniQdYwJYS7cUol31iL2lby2obvx8MD2OZBUSOevjDj3XXZDf
         9DqM0CQ/a4jfO6cdPKP50ez2dyj4Y/jHA++LTVLLpnpsukwJMyvuRsmieTnx8X22M66i
         +/7FuD+DkNH3UJjEQHhBGv0DAKdQJNVAtWMCw47GZM+KaDJZnfhAbaZYbG5RLjnlkqSh
         Y1e97qnl51qHkVr+0FILstW6Zxm5T1Rk+H3gow1sHt5qIBjaZy6hdjvXhWv8RvTWe693
         jY35JAImsg5hWT2ubka+M5JEFROoqp88Frcak630myw0g7TrNmKJfRJBA28DeMjGFB/D
         nD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682952758; x=1685544758;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vWKczLk0ay+PirEjdR/euEKVb0wOolvAqOmXbb6hoY=;
        b=FpgjmdDk72UPmmb5DzEO9lxGLKICkfn3BTZPyMAfdFU1FClRPI6BCDJ5UcB8KdT/PT
         L58LwqMK3NpG0Kr1TMI196RfmAyfLHx9+yETOOK1tMbJl/rjQFu5LwY2PgjHZx/rdutR
         Swaw0VFttopaGcKFC+f3UAiymyUjypiD3G+za7EwLWgjVLsEWuoieFIGEX6Lv07KDevZ
         1WfF8X9I0NpX4Ge9L/51caeQLd2tTD3TjfYVknCmUF67eG1VpdYnjZLl07e6oA0z5ZEK
         ACoVPYvmkqZtF08bDR+cVlse1KkqCnrXCr6c4PybJSykmAP9n9w99UcDVSPXs736rppD
         +jTA==
X-Gm-Message-State: AC+VfDzZ46CZmS+SkWCoDEDaE4wtPwp9vZyoKUDEMTb1qF+WCUmteBhP
	euQuGwTCfOzeyK1CQPIwHiGmIaiqX0WPQvfLEbs=
X-Google-Smtp-Source: ACHHUZ7+smUJsucOHCm4fLxW1PuTF5cktUoaYTYRmHrSI81Jva2o7gHqxFrnrDEEQssLEZg1UWS3iw==
X-Received: by 2002:a17:90a:930b:b0:247:1c17:77eb with SMTP id p11-20020a17090a930b00b002471c1777ebmr14612152pjo.27.1682952758235;
        Mon, 01 May 2023 07:52:38 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id f16-20020a17090a639000b0023d0c2f39f2sm19070570pjj.19.2023.05.01.07.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 07:52:37 -0700 (PDT)
Date: Mon, 01 May 2023 07:52:37 -0700 (PDT)
X-Google-Original-Date: Mon, 01 May 2023 07:52:21 PDT (-0700)
Subject: Re: [PATCH 1/4] RISC-V: create ISA string separately - not as part of cpuinfo
In-Reply-To: <20230424194911.264850-2-heiko.stuebner@vrull.eu>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  heiko@sntech.de, kito.cheng@sifive.com, jrtc27@jrtc27.com,
  Conor Dooley <conor.dooley@microchip.com>, matthias.bgg@gmail.com, heinrich.schuchardt@canonical.com,
  greentime.hu@sifive.com, nick.knight@sifive.com, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
  Richard Henderson <richard.henderson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
  heiko.stuebner@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-1a552bd2-9e29-4095-b932-15d411a1e10d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_075239_751701_7B29A1F3 
X-CRM114-Status: GOOD (  30.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 24 Apr 2023 12:49:08 PDT (-0700), heiko@sntech.de wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> The isa string is a very central part of the RISC-V architecture, so will
> be needed in other places as well.
>
> So in a first step decouple the generation of the runtime isa-string from
> /proc/cpuinfo - its current only user.

I'm also going to leave this one out, both because it fails to build and 
because the proposed second user isn't going to fly.  I'm not opposed to 
the refactoring, but too late for this merge window.

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
> +	if (!IS_ERR(isa_str)) {
> +		seq_write(f, isa_str, strlen(isa_str));
> +		kfree(isa_str);
> +	} else {
> +		seq_puts(f, "unknown");
>  	}
> -	print_isa_ext(f);
>  	seq_puts(f, "\n");
>  }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
