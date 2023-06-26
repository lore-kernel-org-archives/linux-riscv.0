Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD246EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9TLKk2eYA/Ex+Ag2UmmeIkR4PBwSbz0stZpsMz7nmw=; b=uA4CY6qqpEmDDF
	dqQO7o3+wpDvQMAWUbH4icMr1VBPKqU90yPHabD/ruCv4j72CMryCHUMkARlMNOb0d508Ets9xN4X
	3PxeJr4aYOsOzMVSvwY6sWzyzyVgtkjzVp3MlyML3u+If3QXCVPPsBNURX+6Q23i5xUjVNPjitS6A
	Sng+g9yZpRZI9WuwIyMgtlmDq5c0McSUJZNhzVcbwzk0LXgPUOxHbCfUY63zkTULqQAnLKc8iRxiq
	OWtSQjCHxsT7CfvbnwOMDyF95FZEy+ul8wjq6B7M5bFalS5iCe5KoDALXm2FuiywFU+Nc43h1vh6I
	VpgoJ6qwHqgi6q27PhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoHi-00AWEh-0T;
	Mon, 26 Jun 2023 15:37:46 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoHe-00AWD5-2s
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:37:44 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso1499862e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 08:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687793858; x=1690385858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fKkRNwsx7OGC3htuJ6t0WseieN66ntYIb/oJ43FaioA=;
        b=ZEN2E34gix3aICYfeshAMb+/jjQoPlHL1kcE+BnBdWbhW8yG1Hc7rBJ7WOpX8yeNpf
         29u20Me+Mn9NKpGGTav87InA/JqZTZGCAH+efEmdB/FctQs/KwY9OGoD8uPVW3WlaEeA
         0FRyVSikgjIJK2yN318Q2ARbt55FsjaBhMGJEJIeRG/LKLWeN+MdwVRUmKl1Zt1lJNg+
         hTE2joZ9gHZr+bW63O4fWxMpSYiRqz+nkWyxDGc8ALWVnWK0qU7DljlonGMT7iHd+Sst
         +RJckniERxbN4R0G6I8b1z/0gildcKdDUqQxXuY6ZhMNhI1zhTZJTkMuoX7gHtnDsS4+
         gcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793858; x=1690385858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKkRNwsx7OGC3htuJ6t0WseieN66ntYIb/oJ43FaioA=;
        b=RW6/gV4ZVAfYvisKX0raUEMjVtzsXun+baaF4B5T5E9DnmWgVxT+dDPaE83tOspCNR
         LltLZbRb2foeyhzxg7wxgm4ymu3NUEOjOSmA0+dahtEkPaE/wznaVuIJeMRyb+tzB0xX
         d8ZAd5cG+UTCpkgwcO4mpebsCOspYe9zr3JtM0PkMvwxWBb3H20sRY+weC7tQRVAxu48
         emXrqGg6VD9GH7USa1XAPbhPQKpVBY+yb2XRFfS4SsWZeCZKfR3uYW+iFQmhBqcITgxo
         /9dy/RKnrLS8Ol6PAv45KtePdeCDVvcVCEnKmvf+rtfSM4f61JsAPUkENEPnOnIY9ZtG
         Hg7A==
X-Gm-Message-State: AC+VfDwp1hIozkLvOinFi/D3I8hMnSmcytjKG/RtY+8rJbxE4++GkEZH
	VDNU+HsY3n0npl35qk7jt0y08A==
X-Google-Smtp-Source: ACHHUZ6jMYjdJZ1HoyYgAU6kz2QdE7jTIOjWgnOMeoRoMCekZ5ZDXQ2IpPk81NPGk7My2L/36+mmzg==
X-Received: by 2002:a05:6512:3290:b0:4f7:5f9e:fc59 with SMTP id p16-20020a056512329000b004f75f9efc59mr16963278lfe.39.1687793857818;
        Mon, 26 Jun 2023 08:37:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z7-20020a05600c220700b003fa999cefc0sm2350762wml.36.2023.06.26.08.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:37:37 -0700 (PDT)
Message-ID: <2a0154ec-7949-f1b1-760f-3ba64d2cff3f@linaro.org>
Date: Mon, 26 Jun 2023 17:37:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 5/5] riscv: dts: starfive: Add JH7110 PWM-DAC support
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
 <20230626110909.38718-6-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626110909.38718-6-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_083742_939374_48EBB3EE 
X-CRM114-Status: GOOD (  13.97  )
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

On 26/06/2023 13:09, Hal Feng wrote:
> Add PWM-DAC support for StarFive JH7110 SoC.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 50 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 13 +++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 19b5954ee72d..5ca66a65e722 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -36,6 +36,34 @@ gpio-restart {
>  		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
>  		priority = <224>;
>  	};
> +
> +	pwmdac_dit: pwmdac-dit {
> +		compatible = "starfive,jh7110-pwmdac-dit";
> +		#sound-dai-cells = <0>;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "StarFive-PWMDAC-Sound-Card";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		simple-audio-card,dai-link@0 {
> +			reg = <0>;
> +			format = "left_j";
> +			bitclock-master = <&sndcpu0>;
> +			frame-master = <&sndcpu0>;
> +			status = "okay";

Drop

> +
> +			sndcpu0: cpu {
> +				sound-dai = <&pwmdac>;
> +			};
> +
> +			codec {
> +				sound-dai = <&pwmdac_dit>;

You said it is a transmitter, not a codec...


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
