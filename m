Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5618BC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiLiyElZF77HVoSuJc1KiGRKMpEUzF2kxLItlKeMX10=; b=H+atIci2GcI90F
	d10nKRnNNt8WOkJsKpgtRoiUGBDbSqYqMslS9fb7f5+ej9gSF8icc1HFAomld3iIWG1wNKoU91ZWv
	yps/0f2Qq8ZIkc+iRJNlebOT8noFb/EYgZLsPxbAGFPnfB+Vi7ENxwVdhiUYbHK/TwS7NHG+guRrS
	xpcrGN6lDXcSP6fUh14yi7Ib3v+K7NrGxgDimY/2AZT/3uVyRBLZsaN2WevUV8hKB0KBjDZPW1lmD
	9GnS0YY5lUb2AoRAKYgwBWkFWU2hwqR1OJ3Acb07X1900bhNAON9qnsclBRVabWPotOP7oih8AV4P
	c9QOU2kUmJaNFJ5Y2oRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOIvt-00000003wER-43Os;
	Mon, 01 Jul 2024 15:27:09 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOIvq-00000003wCt-1k5N
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 15:27:08 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6b06e63d288so15023606d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719847625; x=1720452425; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VGtKsAafTDSpHUpnTbaoLrGWrMjaJvN7kW+LOjav24E=;
        b=Q16zYiyEfAjpoWQaFuSeL5XcdWj9Gp2xAm1TS7Cccf4jJ5oQUZpi8vbu+FIZlAZ2+V
         TjZYz4hMZWGDpH3t3n05loKm06UT+cDmFjFTwhJtmid+0ELzjwOV8LUNYJdt30oSGhmq
         vaNm4SYkjjDD1lqJiuaOA3pO71IVUe3YifEOW/jShVOiumluRqQE6wt3C+cuhUBk04zS
         Adz7VfXkr3M2C3WrqP+23PF7HL5naGpDahff1WL0LvKKcsO/dFRKbBUeTNfX/MyoOaM0
         vija8S6OefKWvUljR8s8/xS/7YwQ2mckI8nfWelTnaUGNL0neHOb/ax5gWyDfkN3MhmT
         2peQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719847625; x=1720452425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGtKsAafTDSpHUpnTbaoLrGWrMjaJvN7kW+LOjav24E=;
        b=HlOKXtjvdmjrpYqtxoDpSen4w0/YnAmw2ZSL4EQiduMKP5ZPNtSPRSSmu1AvOf9zqZ
         abO5/PjSzDPOUe5HLrGpYLhTPEW+PKULBwjxxLP7smqP06Kpem4mh/oXfqWbsdkDEsK2
         nl1sI9RUh8qAzcuCaE84itfK7KCUe32+//IGIJ4gQgkKTWaCHTWO1fBjUTQZKZQE6CR2
         iTz412Bn1DA1rP2xuQPYsS6CEaEnG+BJConLfptQNwt/2GFRIKzDLkNguzp8TNFXyjXX
         LzQqWQrnJ37rbcdj2So8vpRgo4Jb/8QLxjo5a/4HScZCDR/ySzSjmfdGLYDtWOt0lh6H
         KoGw==
X-Gm-Message-State: AOJu0Yz0Z6FyJBwjK735U62prIzbxeyw8WK2B6ilNMekgQ4iwJyHo6hj
	lv5Ce9YbuurwCp7RdZsyVvBkhZwU34FnhvEW1vl6XYI4B5m+DtVDXm3jMB7RxXA=
X-Google-Smtp-Source: AGHT+IFm7J11+wdhrgMT/TGaX0Rc7thLKL2Wg4raKr9nb+KKvQo276Bk7ZpHF10bnd8Q9L9dV3BTgw==
X-Received: by 2002:a05:6214:19ce:b0:6b0:4201:3840 with SMTP id 6a1803df08f44-6b5b7148e19mr79621526d6.40.1719847625201;
        Mon, 01 Jul 2024 08:27:05 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b59e581ed4sm33779996d6.69.2024.07.01.08.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 08:27:04 -0700 (PDT)
Message-ID: <0cc13581-5cc4-4a25-a943-7a896f42da4c@sifive.com>
Date: Mon, 1 Jul 2024 10:27:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>,
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
 <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_082706_788630_10EF3480 
X-CRM114-Status: GOOD (  15.26  )
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
> The D1/D1s SoCs support xtheadvector so it can be included in the
> devicetree. Also include vlenb for the cpu.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-

The other C906/C910/C920-based SoCs need devicetree updates as well, although
they don't necessarily need to be part of this series:

 - sophgo/cv18xx.dtsi
 - sophgo/sg2042-cpus.dtsi
 - thead/th1520.dtsi

>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6cbe0..6367112e614a 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -27,7 +27,8 @@ cpu0: cpu@0 {
>  			riscv,isa = "rv64imafdc";

The ISA string should be updated to keep it in sync with riscv,isa-extensions.

Regards,
Samuel

>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>  			#cooling-cells = <2>;
>  
>  			cpu0_intc: interrupt-controller {
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
