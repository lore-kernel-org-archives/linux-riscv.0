Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA00C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 15:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQgkJFSOdy/1noZaRrIZvO4HR7if5uoPAdX6SabqyeM=; b=48Rlmp6Bmr0i1T
	ZiUzcUxGi1/mWVBfj8l/VTbmTv0hN8ugr5eGa/DprdGaYp1fQgygHMlA0cvM3TsPVxjYeb8qjHVwP
	Q9K940aNGR9e/s5eIiLrPOCY7iFrNe7fKtZzHNDyPg9w4fURaWOHbntEpfsvT7ctWtu2He4Kh0mI4
	JO10HAZm9BBeZMv97vM282OziMbjnGlveKPREmJpaSNauTGiYu45WANHfSUcJ23LXaGrVxNocAxLw
	Ua92GUDfqYe6NcjV28MXW4+VdoO1GAdVQdzYOLwAyt6rUGdQJwye5XAqGFxrRqwd8eAElp6TTmrgX
	30ss3NSQb/dYnt64QXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJHU-000000040aJ-1ofn;
	Mon, 01 Jul 2024 15:49:28 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJHS-000000040Zq-1Dny
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 15:49:27 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-642035f8c4eso31807217b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719848965; x=1720453765; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umkqtCJW3Dg9JtpfzIAAg1v5vJehmts33cJFqn8dvR8=;
        b=FH30QEWy0H0qQHBrrJglIRjkA/WPImsHfy7ekxiGsMNF4Xv6L11R0no0Ol3U9DgJH7
         hEY3tQ+3coyODdiTCAavQU/dq9fmTkCM3t8QTbyzIJri8BmqJ/yweFJGH6dlphoUhsha
         2HMWRcx0ANf6ZkTdaF23fkR1gAV18REQ4MVC/hWZbV54aMk4vCihLvZ/mnvTJjUyY195
         LlbaD6IYz0JF0tHuIiLhScncIh32gXNbi4MKclVRShjOW/QBIG3rlPOrPgXJN4YJqESl
         UCkEruTMaFM5L7WN12PfQqt89RcP1JCHBXVzZOrB4lgjGBbiphalyU4h2GdEMG7tdjb0
         2F1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848965; x=1720453765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umkqtCJW3Dg9JtpfzIAAg1v5vJehmts33cJFqn8dvR8=;
        b=PSWRHWCuhQzbPgEp6lA2EiBqhAfKyvM7qM8XqJ+KlpJU0n3NK1iB5IYm6T36DgZDni
         ZKNmstZ0a69yd+KtwoICsKeGdpM7IufBWR4AiOuCinWr8N9p5HWXYyD1B3gDN7fKFe5K
         ruYeTdGOnr5SF02vkfkA5Ke1ePFDXoKJfMNoi+qVMbgLE5Py+vXB1tiyb0fuF1fqqTwS
         9Yk4RFgdDFEAo17gzboc3iC8U7NYoeboZqxcaIwtr9N2GH4TPO3ccqEDN4iF1NUybhkZ
         CuH8l+GCzuE9wneogciFAxP2a8pMaDSRUNCfuTW1Y1YP/djHr4uFYIz0p4teYgoA71IU
         n+yA==
X-Gm-Message-State: AOJu0YyatmMy25Lbzq04LHBJ9g8uN0PVmrws/UyXDUbw/2o4Psgdp5V0
	IhpconM46dz7NF7nL/c602gkl8N/wjremMmg74OllLA83tIfzEDZdfg56M7mxuU=
X-Google-Smtp-Source: AGHT+IGu9I2wc2U8NTdlZqwI73pTcvt2JvT2wJhK92JWQZzopvjsvNausRGAk2vO9Al2yPEEKQkmTw==
X-Received: by 2002:a05:690c:710:b0:64b:8e82:1f9 with SMTP id 00721157ae682-64c7123bf4amr65310827b3.18.1719848965244;
        Mon, 01 Jul 2024 08:49:25 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9c405c9csm14034647b3.128.2024.07.01.08.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 08:49:24 -0700 (PDT)
Message-ID: <54232f3e-4fea-4996-a90b-6de51e1c51e0@sifive.com>
Date: Mon, 1 Jul 2024 10:49:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>,
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-7-bff39eb9668e@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240619-xtheadvector-v3-7-bff39eb9668e@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_084926_525727_A1E11FEE 
X-CRM114-Status: GOOD (  13.30  )
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

Hi Charlie,

On 2024-06-19 6:57 PM, Charlie Jenkins wrote:
> The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
> has an encoding of 0x9.
> 
> Co-developed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 18e178d83401..9086639a3dde 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -220,6 +220,8 @@
>  #define VCSR_VXRM_MASK			3
>  #define VCSR_VXRM_SHIFT			1
>  #define VCSR_VXSAT_MASK			1
> +#define VCSR_VXSAT			0x9
> +#define VCSR_VXRM			0xa

These are normal CSR indexes, so the prefix should be just "CSR_".

Regards,
Samuel

>  
>  /* symbolic CSR names: */
>  #define CSR_CYCLE		0xc00
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
