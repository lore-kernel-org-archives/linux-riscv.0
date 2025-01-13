Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B15DC02183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 08:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKj5hfPsBPIeJ56DwFGgbaEqqjABAwhNEFCpnCM1/bc=; b=X7OxKpH3Zj4Lh4
	5Gg8Mw/ik+9Bi6cRJrntNG17QlA0L0Vf9iLPji7SGlgtXX5ueIl8rfwNnJnqxId0HgGTR5gTF1dHc
	ge9Xp6f1FINTs938C3bZehO+74+RE4kPSwo7tjUGyNjz3DTE3Iw9a+X7es/ExzeAbwAzzLwnVCVRd
	vwfWMUZbRN1mbkTt4juOM32N/0oDwizMiWQ/+NgUp3nQHsTAsudd3TZMpXcll5OzP0u8HvggHbBDb
	ZBm2NZ09LeOjwcAheXhy/vIJFIiTVnGU+/sMxQ0NpN56k5+b7xfsHBOe0w+HGgOdELSIhWQdq995m
	Pj4UPKtDQIt8H2WVtMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGIP-00000004VPp-0Str;
	Mon, 13 Jan 2025 08:59:41 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGCw-00000004U9J-0ejH
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 08:54:03 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ab322ecd75dso58194166b.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 00:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736758440; x=1737363240; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pdlz8or/j2SZsqBQFu80d2cIXQqxqGv/i2pD+MRAWJ4=;
        b=d5v1oOxZO1uElBTrOtwzE/8IXTYSsCc5pkZ81QaCB2gKsrf+1Rohy9JEPfzzMEoY+O
         vGoQzppOyxtds6eUnGQMenG7GO3GqYocfJfAr9Pc3kTrhoM9iY15gNxlp7THPoFUdpFH
         RYNe8o8aE/Jw157fefzqqT074FQvc9YAgWxiQfDB8Ox+sztMXPPd4ccgw3Dn7enND3UT
         R5RHiCsNehH7ruAq+/2rCVf7riTzKM0zjMn0Jj9slGgoUb/AnoD79m7zNizvNGLawk1b
         riILw9WJKEGFD9mERevZzP006NHLj0tTWfcaYm7xg6ewdABn2mDkltzRi0pAOHsySWEU
         Uwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736758440; x=1737363240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pdlz8or/j2SZsqBQFu80d2cIXQqxqGv/i2pD+MRAWJ4=;
        b=ZQ4JzQ2C2+xWELCasQh9sgTq4r8Pavm5cYDudfKSU+kCu/9WVrGdSCm5WnoDq4IBzW
         2tweE9pxUR3jP54Hw9h/TizBGm6WiXVohK7p3cIWtxQkDhGzY6QHAeQ5sVzCLGpKnwE2
         zQtO43U+qsY9LIvifbZdf6Ayt1XLnhlp1mp4OrAs8bHMh5I0f8MDc0Jyq9yPtQMisnw3
         cFKueZRLnh5P+jaw2A0csR9eDNUFPJbdVDnbKJJs7GuAd1PBA6ezlEen4VevwY3+J8eH
         geqqLZ/4AZJDsNd/xqHKRuKQCimfYRgT7wMri5ASa6Ls08S/PJw1ravWZ85Z+03HvHs5
         vLlA==
X-Forwarded-Encrypted: i=1; AJvYcCWrml7P7B4oTJxWjgKJE3uUsuglkha5CzFsElVGNJM1/DiyJ59YIokQ0BmdpVme3fhXb8Zh0B65ECzbIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk+6+nsP9xYJN5v1McPNdaX+nap3b7rbIWGb9dG9WAGVR3jXaS
	yZJhnUUyijDF2MkklRhrq9ScirB58/YwI3OexJgbQo2Pp/IPEIUk6MyBA9G15S8=
X-Gm-Gg: ASbGncs9YrW4StI09YJ5UvXRWD0ohJLphabMool+jFFl9C+5xUII9VD31EfuomU1tRt
	c7c9oNvBgVwRivC2fJUf/1xLoiGxBE/ll2sVpX5gAybvYOnkdH883ewwJ0+GqoLjaecJvLEVxgg
	OFWQsq33RQD9UU+3CBSppsLhhPkwyLUorvthDympAVRhSZVSSe24Qu7eUNdRKCx09k5imn2HX+c
	ZzMKEYtxPmO/8tHSYN61ikx0tvNdlSpMu6LjHOvISWyHVWIkmQaJI7KsL/tbUjFFxPlk9YQnMV9
	C6yY69L1zGue0NNo7gUeiZhg1lqscSFwJpZ59mXhEg==
X-Google-Smtp-Source: AGHT+IGrUXeyMcpjKt8l6r7fafi2mX5rutzDSKCfV7zy1dqdywkWqv2gi/08sBQDRIu3dr8UvuvhZw==
X-Received: by 2002:a17:907:9447:b0:aa5:b1bb:10db with SMTP id a640c23a62f3a-ab2c3c2833bmr1266276866b.1.1736758440035;
        Mon, 13 Jan 2025 00:54:00 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95624c1sm474230466b.131.2025.01.13.00.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:53:59 -0800 (PST)
Date: Mon, 13 Jan 2025 09:53:58 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [PATCH v3 1/3] RISC-V: Enable cbo.clean/flush in usermode
Message-ID: <20250113-62458ced6e6997eca091f325@orel>
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113083635.73826-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_005402_194397_472CB69D 
X-CRM114-Status: GOOD (  20.24  )
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

On Mon, Jan 13, 2025 at 04:36:33PM +0800, Yunhui Cui wrote:
> Enabling cbo.clean and cbo.flush in user mode makes it more
> convenient to manage the cache state and achieve better performance.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c0916ed318c2..60d180b98f52 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -30,6 +30,7 @@
>  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
>  
>  static bool any_cpu_has_zicboz;
> +static bool any_cpu_has_zicbom;
>  
>  unsigned long elf_hwcap __read_mostly;
>  
> @@ -87,6 +88,8 @@ static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
>  		pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
>  		return -EINVAL;
>  	}
> +
> +	any_cpu_has_zicbom = true;
>  	return 0;
>  }
>  
> @@ -944,6 +947,11 @@ void __init riscv_user_isa_enable(void)
>  		current->thread.envcfg |= ENVCFG_CBZE;
>  	else if (any_cpu_has_zicboz)
>  		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
> +
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOM))
> +		current->thread.envcfg |= ENVCFG_CBCFE;
> +	else if (any_cpu_has_zicbom)
> +		pr_warn("Zicbom disabled as it is unavailable on some harts\n");
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> -- 
> 2.39.2
>

Please use a cover letter with a changelog or at least changelogs under
the '---' of each patch.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
