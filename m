Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4945C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/dVBgNiABNc9jW5/0s5GuYGRnaAvmAoxztX4UH7K/8Y=; b=XuuvAxkGoKzeLCzCU7U78ygRqY
	eRDcFbwRLGkFHhPI3Bf9sz3P8LMEs/ryvNJun+OXN6Fniug1S+BWfylR0Xl0RQnjPRJe878aO1YNx
	AZAl7DCTlSiCHUhjzc5pkKziApQJltQMZEtZfsK6RG2dlb8usJN0p/PEPTEJrSHI40uALKM0lbhOm
	Q/ZgLpuBzGXtagU0ijOW2lBJrKiMYizy+A7mIYbD2KkIULTEXxvIlPP9bcZFUJxY34KqDoGsXRERf
	G9cuYkGmZ9+P3i4zj/Y8aTBtcfpUyuu59IS2mp4qoZmbjbTJo3D9nPFkvIE7SCCh8v1LmgwqoT+1Z
	DHw5286g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q079A-00HDOo-1L;
	Fri, 19 May 2023 20:56:20 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0797-00HDMo-38
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 20:56:19 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so1428259b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 13:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684529771; x=1687121771;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GugnDVq0c7vfl3wxW3DkEvz8ZP8hJrKb81NPd+MbEgo=;
        b=w4XaHbcaoTeHwMKK8tq7/hze9Atyb1f5/XPGa2VJSxjgf1JOybobmSZXftt8JH1faK
         y+U3o7pUzV3LMpt+OI0BaTFQ9swX3VL4Aw4kija5c8VZh2y9uUua0MkAjfqpOTc5OvVW
         UcfUtIv3k49fgxyUekiCsGwXnfKGGSJgXmeR8whqCUKLI1Isz6Fy4NywgnLzGHDENMfD
         8FopzMsSrt4qH2Z8xA9F4YpBe0D/YiKCCfMkz8L5o61ICZdCyum6o+hoIeZbq4UyIN3I
         sncMKcT6+g4f2BOhFzAQMXoZYzLjITJefkC2xQ8gJpmMz3ZXY75+zCss7YyO7JFDBOao
         dgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684529771; x=1687121771;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GugnDVq0c7vfl3wxW3DkEvz8ZP8hJrKb81NPd+MbEgo=;
        b=kuavxwO+7+D1nj/RsjX29Zg9mjVwBbKDwgin5Qcw8LH9ymDl6uMOyVmt0QWHVvRikx
         L1KQeHNWRpnaqbMG+yrY0lInGV4HZlfTa9fxYDOTZ9BhkLzLtq+9ga5WRd6LYv/dUtif
         0eVTUUzrIB8q9Xb+tGYY40keMJ/L4lMmtDB2tdSyzjLfFmDuhvHUPa75cUYNphv6Ut8E
         DOAcq66N12NOPQShsaPWiQ/ifek9nulNehFyGb9q+QCes8i9n6ouaRL2U2K+SdOktCTy
         /vrbRulgoDGPiAUW01ScwMYiKUDojTVJI4X3TmehVQHgGBqn0uROSMZ3q38ycadmdpaY
         Xtxg==
X-Gm-Message-State: AC+VfDx9Y+Y1SSrdWb/ul4qfcL0xFq3jFscyAAr5CNKxz+d9WDC9tDBh
	TUchLEF2oWY9953JROyV0E/2S65ChfsZ27YXyww=
X-Google-Smtp-Source: ACHHUZ584jM3FqhNjul9su9bLGVwXpcyvsMFcD/0XYITdp4xBcWtq25UqUY3OaQPOuC57udHHaNAkA==
X-Received: by 2002:a05:6a00:2188:b0:64d:fd0:dd1a with SMTP id h8-20020a056a00218800b0064d0fd0dd1amr4522909pfi.16.1684529770982;
        Fri, 19 May 2023 13:56:10 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y23-20020aa78557000000b0063b8f17768dsm103656pfn.129.2023.05.19.13.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:56:10 -0700 (PDT)
Date: Fri, 19 May 2023 13:56:10 -0700 (PDT)
X-Google-Original-Date: Fri, 19 May 2023 13:55:47 PDT (-0700)
Subject: Re: [PATCH v2 9/9] riscv: defconfig: enable T-HEAD SoC
In-Reply-To: <20230518184541.2627-10-jszhang@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-e1d500da-688e-49bf-a2d8-bef0e2df48f8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_135618_197668_45B1D973 
X-CRM114-Status: GOOD (  14.34  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, frank.li@vivo.com, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, linux-riscv@lists.infradead.org, wefu@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 18 May 2023 11:45:41 PDT (-0700), jszhang@kernel.org wrote:
> Enable T-HEAD SoC config in defconfig to allow the default
> upstream kernel to boot on Sipeed Lichee Pi 4A board.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index d98d6e90b2b8..109e4b5b003c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -27,6 +27,7 @@ CONFIG_EXPERT=y
>  CONFIG_PROFILING=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_ARCH_RENESAS=y
> +CONFIG_ARCH_THEAD=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_STARFIVE=y
>  CONFIG_ARCH_SUNXI=y

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
