Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2D9C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 09:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqDN21w+IgnhEfCio8VuGV2KezSFYPg4RMEkOeoG9Ts=; b=m7LnOf64jArI1Q
	XtK/rJv6iLelxcu+CkLXX12DLFAL8KZe7Yoehv5XMeYNAFuANivhiQbCoHTzy4YlbO3RqygF1F5OT
	hslG9SLZwnOpEX7pkmMNsZjjKW2jrIIaV5KjEuWvn6Qt8GHJrIpK5uceIpHvfwBl0EZTJLiV8vI17
	uFTt6XQwRaSishMuRsEO632P+M72sMmSmyggKWTUIEMnt+GzrFF0G2j0PNOgame3SmAVRXkeG6jW2
	s2ZQVM7/tQAsT/nvpY8ScfaXuG0Qrw8WpEr6iaqAzh6qX4hbEt23d8Lv1LWoO/YXLYBDgW9p43FJS
	UJ/ThFxzeoVDa2Y2J2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVD8-00Dtb0-Ge; Mon, 13 Feb 2023 09:33:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRV6v-00Dqe7-IJ
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 09:27:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso10757741wmp.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYh18SRYWwEYT43tGPEGOedVgwnc/ZspcfJBm/Zqmek=;
        b=AKjeUMptruiqhGqwkQ5nHL5+lyE+zu52lmYtfXa5oRKvpSgDnmquHytkHfyWkATZK6
         P+ofaXVgQqlyfPI1iNH3JNSFSwMayGi/2EsRFdVRCNrsGLdBNCKHT9KOCF0sjFVZ7rVX
         zLBnj9KXTsvSqan5Dk9kjiXkerhXvVyW0dXjQVsHR5+S1Vfz0F7cSqG2TmfPVTxm+gpz
         vLs6RHE4dd25pDc52obVhfsPvypjEMQnXMv9VYbiWOdrzjifhTtottn/Uam/oYlBSk3a
         tCUrgfUDq4uSXv1+pZjndkwyBtyYm9nNy5+7bGVrFg4qhm1zV83ydSkVP2RGecBR8Ug6
         5+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYh18SRYWwEYT43tGPEGOedVgwnc/ZspcfJBm/Zqmek=;
        b=CgxM1I3lISgehi1FH+Dzt1ME1Z1t6RUOZJyV/j1LoNB8SSloCxFP+vu2Bx9/TKnLb1
         nF6EjCDEZPhNxU3yvEntIf89ZgD9t4ps9+F+XwZ+4soQ0as1IVBZX3YUhGRLkE3xORKJ
         Jw2Bpa0iqSoAlV7n3ZRCjq7xfUOyGI/Pjo9McQjtE3qdfQoJH3wUbUJx7QGltkgyStPC
         8WDsxcsLCkbOrGtggdGP/km1zCcKoYbTtkwi8H3oiwlQsMIOe17fYv4iWXIPt2VgAvrd
         Qx4QwUa5tGbAHjJGocRC/KImtSzQaHPpNZ10ObLX7IfwBZe2L+yZQBnKQ4M4Fce93xd/
         cyyQ==
X-Gm-Message-State: AO0yUKXib7X3R8Fl/QBhOWOvFJ3c+x5Qtmh5s0KKVl0ln9QWwA/72pES
	V24LbbstxP2mUOILnh8sPzfygQ==
X-Google-Smtp-Source: AK7set9WbqP7fVCp5aNzouWbxo5iZbnRURawxE90BjtXUD6SO1P7jgEKPf81opQ2QS1yr8C6vyNxIQ==
X-Received: by 2002:a05:600c:4a8a:b0:3dc:54e9:dfd7 with SMTP id b10-20020a05600c4a8a00b003dc54e9dfd7mr18140208wmp.25.1676280413915;
        Mon, 13 Feb 2023 01:26:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b003daf6e3bc2fsm23780634wms.1.2023.02.13.01.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:26:53 -0800 (PST)
Message-ID: <34d5e299-3b4b-d176-0010-a9af1220f2e3@linaro.org>
Date: Mon, 13 Feb 2023 10:26:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 11/12] riscv: dts: starfive: jh7100: Add sysmain and gmac
 DT nodes
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-12-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211031821.976408-12-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_012657_693523_B5F7DC54 
X-CRM114-Status: GOOD (  12.96  )
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

On 11/02/2023 04:18, Cristian Ciocaltea wrote:
> Provide the sysmain and gmac DT nodes supporting the DWMAC found on the
> StarFive JH7100 SoC.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 38 ++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index 88f91bc5753b..0918af7b6eb0 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -164,6 +164,44 @@ rstgen: reset-controller@11840000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		sysmain: syscon@11850000 {
> +			compatible = "starfive,jh7100-sysmain", "syscon";
> +			reg = <0x0 0x11850000 0x0 0x10000>;
> +		};
> +
> +		gmac: ethernet@10020000 {

Aren't the nodes ordered by address?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
