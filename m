Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E951C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+X9WsEWSmR1LoM4jVAiLitQUEkGTTVQi7a6/imnJMA=; b=S6gMaCOC3Uz/XL
	uRyLtQ4Txw56a41PDv5EBu4wv9cKOSxLQRStKyNv+wJtplDQysxrcB6hB40j+gd6h3zb1wLE5GAG1
	5ecjeKQMxtKIqpFUXlmZgrMLJKupkzZqfpleHu6B9ViegVgppX/y/mhisfuwMwSUkHNzuTgiCO6hC
	w/IdxzB9XKd14bSHG7ByISIqyGdorKl0QssVzbGvid7eEIXGoe6MBUj/T5Ui3cdCjwYT/pi1NjpVo
	iTqo8l+haPT6jA6XS1vLEHvkGcgNF7OD2j6eumMA9CfXMZe+YFKD78d4Jj13a6EN5pJKigA74joZL
	dOPDpgwPcMcxcno4y1Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HVR-0000000BoFt-2250;
	Fri, 26 Apr 2024 09:04:33 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HVN-0000000BoF4-3uzP
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 09:04:31 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-56e78970853so5192757a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 02:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714122267; x=1714727067; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hzl4Ufo8fPsUKZxQXQJoooQsy8g61GqJ67h+tl5OxfU=;
        b=GZHiMLIlPxs1MndOWe32EEaxFcMU4FvDy0BdOZ5RkE62pNa4F16DwvRclY4DEs1m0p
         DBCsLCU8I2K62gGLJA+c0ioPWWnNfm2D0LlUvez7LCNfcaTX+h0rk7xoIKJIauSTIhRU
         vrZV4hUMbAlVAtP7Bq/8AG7gbbv19ZraDrdqv//PdmA8vbRJldcgsQxkqs2qppoAb4Hj
         U/iF7V2sHjsZIdjHAZGC9fJBqM31kkiDitBMhJINX/savQQYtGMaO7JjZQZQYfC4Qd5Q
         DZmKHYCFR+N2S7IsSH7NOHh1zH7Q6P2TROj5p8r9wRg31xs85W7FbAtc5N8SXQdfYr4o
         Yx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714122267; x=1714727067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzl4Ufo8fPsUKZxQXQJoooQsy8g61GqJ67h+tl5OxfU=;
        b=fNeorBTkVKFuLd9LY8UV8HFM+3dIIFp+ao056wSVUSCd2yfOQ6c4QMoTYFJiSiNPuQ
         VMpw9JdU2e/CkyG7WKfk66XOcYhh1BrHUCSsy8QrVmmS1GxIbcx/OBi+GkipvkOyybqG
         FM90rncTETLk/HwdDWCCvJfUZiIfLunmCjFP1fgvoDlc7rv7fQT2QlCNG7sHaITxRy+v
         4PxYXTZuFNE3hSBAaTx9MB3Vydl8LFLA/LAf8NnrASzwtuiT6XJXC2Y1FiJr1S/LwdYx
         WfF540+bIUPJCr0pKpFzizf585gH+YFvylmDFTZ+A5jLHZLPDsdD3XrNFYhmU6zATg0C
         9jJg==
X-Forwarded-Encrypted: i=1; AJvYcCWZisk1alYYQeKMsKBhoqR91Wxzi19PnN32m62qGTrQpeVRqoAPia1iE7FHh6hPspj/cj1Kf4VwGEtyilJPioZ6OAvSLlPnLHnwt9g4P+GO
X-Gm-Message-State: AOJu0Yyq4GGtxOe8TVibueq0LAyhbirO37+g1PioITTlwXQyAJyKCbJP
	jPvB5XC5DfXwQE1IVyYnDFfbr1WKuZmKE+5MPx+6Jz1YzPXLhK08G5gQPNg/MhU=
X-Google-Smtp-Source: AGHT+IGGQjMoum6nDXLgZtliFReM/nKG5LCeh8eEH857A0KequuLtsB621jAkhX12QtK6pYL9HvzSQ==
X-Received: by 2002:a17:906:c10a:b0:a58:a0b8:2a5e with SMTP id do10-20020a170906c10a00b00a58a0b82a5emr2344119ejc.26.1714122266694;
        Fri, 26 Apr 2024 02:04:26 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id hg7-20020a170906f34700b00a4e5a6b57a2sm10343313ejb.163.2024.04.26.02.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 02:04:26 -0700 (PDT)
Date: Fri, 26 Apr 2024 11:04:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH 2/2] riscv: cpufeature: Fix extension subset checking
Message-ID: <20240426-e532c061e4929c6e8babcb3b@orel>
References: <20240424-cpufeature_fixes-v1-0-585e73d2226b@rivosinc.com>
 <20240424-cpufeature_fixes-v1-2-585e73d2226b@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424-cpufeature_fixes-v1-2-585e73d2226b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020429_998871_BF9334D3 
X-CRM114-Status: GOOD (  17.40  )
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

On Wed, Apr 24, 2024 at 09:19:55AM GMT, Charlie Jenkins wrote:
> This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
> than if ext->subset_ext_ids[i] is valid, before setting the extension
> id ext->subset_ext_ids[j] in isainfo->isa.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
> ---
>  arch/riscv/kernel/cpufeature.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c6e27b45e192..6dff7bb1db3f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -607,7 +607,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
>  
>  			if (ext->subset_ext_size) {
>  				for (int j = 0; j < ext->subset_ext_size; j++) {
> -					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
> +					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
>  						set_bit(ext->subset_ext_ids[j], isainfo->isa);
>  				}
>  			}
> 
> -- 
> 2.44.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
