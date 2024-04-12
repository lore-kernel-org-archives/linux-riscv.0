Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065C2C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 09:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLTQ6g53yomLLbwHa3gPgHhxU/KXvscTK84MihyNo9A=; b=tBuDqadOuFG9Ol
	9qduFXILC7runJWItTVm51TTtGXqHQGhNfosWeQlKQDk2dY7A6lOrMrV8dtZEOBjgmP3/igkwjwtV
	P3UISRi7Bo3ZAmv9vqBq6zF2bLJ0hAxmn6L2eeX7ZqLt8iyw17XyUQDv64t6LNdlq+uLrOu9vbTcU
	oYVKqut1hH1wpb3fNiek9WxY1R+jW3VJbijpREsmQ44LIXNZ243LG26aLe7H7Mr0nwoc6fHTLuVow
	T4WtZEDbj5HxO78clPokLSbBgGyuOhUx+9YUWMMJkOFt0YsyfPIcvbF7hOeStcHU6O3qxKHw/Vxzf
	RSMa2ILsLtoWMZDrYqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvD4d-0000000GPCO-3Q7x;
	Fri, 12 Apr 2024 09:19:55 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvD4R-0000000GP2E-0O4B
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 09:19:52 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-56fe8093c9eso608287a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712913580; x=1713518380; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bgd8iTM8jYzI4GBbVZWg6A5Y54CVMr5y4lgBoQ1W9Wk=;
        b=a0AYfe2ILNIRThqlOgXgdvM82QCiaK5wpUau5o25g2YpLtNPK+d6rP0K5gxd6kRfrc
         4Kuy+IYMSAMDL2Km36N2Z7Pv5mqgbOz0vRWn7MTHZRjntt2plf6zNYGec1bEfEOMEZ+7
         Ds302FK818+cuiTAgHQKFZdGu4aJ1uLTEmORVnaYb0ZwNQsR94y2HdW9o9KIqXA6q372
         8d6zlcxZg/ar9D36tu4th2TkBdgjn2/WLzwGMcgsPK7y/q3muF+2iTB5osqSn4ZXIMi3
         3EXSW1olZS70fSGs/j1vLGVZiXf4bCHb7Pf2A5rvuBKXJX9k25yaBMCbVcgqeytfcr+H
         8hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913580; x=1713518380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bgd8iTM8jYzI4GBbVZWg6A5Y54CVMr5y4lgBoQ1W9Wk=;
        b=jN3adAzK7yJqiQDHR3jxEz3sUFf+VeCuVofMCGyzVxnrfBJ4+h/0O1+5I0g17xSxUI
         c/+AzjBvOCkr8KLcgXFgRoaJCliNNm42fXYU7nH8RKIPykZj5ZQKunmhBTXmQ3V+coor
         zJTrsFTvN5rxxx0VRXiqqQQpjqQnyPuaGfITywzJvskJkrixBx6IZA60L+tkuvDnVNE9
         zCulG+t0QeQYKdgRLyQpClF/ejxM++zYxkisTLoJZvaWCyrDPKuadcb4PhWI5AdAq3Az
         ThyfBpz7KQ7geCdP1t/teQ7Fw3NDNlm1uzI2bd1Vumv8x0XVGjyRoP/hbBDk2i0O5byH
         1D7Q==
X-Gm-Message-State: AOJu0YysUg4D3nrv+qxD3yMAuc863Uy4mhdH/vVAmynr3SYtGpGfrOL4
	hg6kdnl9Rzj8qRqRO5jNLf9qQy9d1EIjQk03RkN1jkTtdyDSab1mJMNuCXJdk9o=
X-Google-Smtp-Source: AGHT+IHl0klW+ni5NaX1mEP0HWgseFackRu4sAodSgA5uGOTmK055be71fNeT+lP2FBtIE3EhUCv3Q==
X-Received: by 2002:a17:907:1b1d:b0:a52:2b39:879b with SMTP id mp29-20020a1709071b1d00b00a522b39879bmr1309977ejc.46.1712913579910;
        Fri, 12 Apr 2024 02:19:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id bi6-20020a170907368600b00a51d3785c7bsm1588980ejc.196.2024.04.12.02.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 02:19:39 -0700 (PDT)
Message-ID: <ccdef80e-4d8e-403a-8b7f-e52ef9e3fc66@linaro.org>
Date: Fri, 12 Apr 2024 11:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] riscv: dts: thead: Add XuanTie TH1520 RTC device node
To: wefu@redhat.com, jszhang@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 guoren@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20240412080238.134191-1-wefu@redhat.com>
 <20240412080238.134191-6-wefu@redhat.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240412080238.134191-6-wefu@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_021943_544646_BF2A7B58 
X-CRM114-Status: GOOD (  14.02  )
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

On 12/04/2024 10:01, wefu@redhat.com wrote:
> From: Wei Fu <wefu@redhat.com>
> 
> Add nodes for the XuanTie TH1520 RTC device node on the XuanTie TH1520 Soc.
> 
> Signed-off-by: Wei Fu <wefu@redhat.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index cd6bc89a240c..62e588dbc942 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -463,6 +463,17 @@ timer7: timer@ffffc3303c {
>  			status = "disabled";
>  		};
>  
> +		rtc: rtc@fffff40000 {
> +			compatible = "snps,dw-apb-rtc";

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

> +			reg = <0xff 0xfff40000 0x0 0x1000>;
> +			interrupts = <74 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc_32k>;
> +			clock-names = "osc_32k";
> +			wakeup-source;
> +			prescaler = <0x8000>;

What is 0x8000? Why is it in hex if this divides the clock? Clock is in
Hz and we all operate on decimal units.

> +			status = "okay";

Drop, please don't upstream directly downstream code.

> +		};
> +
>  		gpio@fffff41000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0xff 0xfff41000 0x0 0x1000>;

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
