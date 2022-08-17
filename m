Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C89C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTnPAjeGR2hpmrnlvmcTjuMLIsBsRk2wzRsN8J33r2M=; b=OOE2sHeO0L3EE3
	g5iztMvmdk/M1aJDp1/T+zHLkOoj1M6U7lbie35MgNPosK1HN3VyW4ZYCPc1HoQ5DuweWRmNYA768
	Q5S4DpTwrwjd/m06rsMjRKTvRO55An79NFwiblI9RmEivANKBxI/LakKg1FAOE1s4OxhqCNzdfUJy
	VhgS6E+zurmKwF59IEDNJ6OQW53i/ew3WLNzJHEtSheP36eOlQF/6Kd1GkA/AZwM9QRa8H28S/UXD
	Brw5Cs93VbVMyHskeGu4ltEJ0kzdfT0zgBlj4krtQBr3we3ef00Kd/z/hSGmWtiQiwo0H92l2SObB
	b3Kha+l4ZI3rNmUL1RzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOEQg-00F6fk-TU; Wed, 17 Aug 2022 08:29:34 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOEQU-00F6Hb-MI
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 08:29:24 +0000
Received: by mail-lf1-x12c.google.com with SMTP id x19so18122370lfq.7
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LlRoK8GCouttuQaBiu3XZNyJMKx9NckoSxJlAPIv4MY=;
        b=BNa4kzN4tStk2kyeoWATpkWYOOrU/u42HkDaDm2RyGzskUGA1OS98DKDu1ZO8TeyAc
         BHlGTLFvooBdLrQ7bsGjHyYLXjT7U/XTPw5XtNXVB4DmN/k3ooISitVoSvRIe0jo63MY
         lCcg1xcDs63reLeAyJgfToUbtlbtP1e/bJcsgIb9/ZFKekQUywKC+kfTTRYYfXkQpiVa
         GBXTd4Fhe8jOx6NHT4i8DvZN66P846rCuttcsOqO2aigTpUnw0k/d/vy7Kragknk0xEl
         +uTxBH1xVZUqPd1mz5kYCWkyV36LyiV5EWF/Ik0hqjJXCxdqwHlu2ac1m7hso6chDzRi
         QFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LlRoK8GCouttuQaBiu3XZNyJMKx9NckoSxJlAPIv4MY=;
        b=II/5XBpy5wewFksPGBCv8rD5ZJtg1uQFJs3LcF5VbkrR9eEK6jfsudt5GoRZmrg+7Q
         ZuTq6+0h9JIZaXdRxrA3WAPK9Ko2WyPsS9BfNOA+RrI+XVAz29BKLMyDz1JvXlVSCYRY
         tkU+GlwXzkzJm+f5oPqB44bGvOYuOllBhzwaE+K7+/nrDC2p0JoROouTq2W6Uimpk2zE
         dPzb1bpXMX7jCmhmZa9xD6jOfKXCVG69ytDD6N/LxZG+ojte9d3DzKVdHnhjCcoXX168
         l9mNWplW0q4eXnVZLBBDibRNyt8lV2Tvzy5uzVpJ5JNQFTLq/gRG3DndZJi9YV7qdYj2
         sgRg==
X-Gm-Message-State: ACgBeo0nYcNiZVY8PTKh2BHjab2GuEjIBm9NjOxEeFgrRxDc/kvhnUQI
	yL5Kw9ge4Zu58suWy9Swrjxl6fmiqmlzv8aN
X-Google-Smtp-Source: AA6agR4HHYiX+08ES6ynJULFRUES7PlCFeft6BMZRI/rn6fM+kl/t2dpDlDozOXX4PW1JsquPkATig==
X-Received: by 2002:a05:6512:3e0c:b0:48a:fdb2:f1c4 with SMTP id i12-20020a0565123e0c00b0048afdb2f1c4mr9470671lfv.379.1660724958883;
        Wed, 17 Aug 2022 01:29:18 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76? (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id e7-20020a05651c038700b0025df04af0f0sm2123207ljp.51.2022.08.17.01.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 01:29:18 -0700 (PDT)
Message-ID: <f9729b31-c487-ea0a-d329-2efb7765d5fe@linaro.org>
Date: Wed, 17 Aug 2022 11:29:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-7-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815050815.22340-7-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_012922_820976_0C4FE64D 
X-CRM114-Status: GOOD (  10.20  )
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

On 15/08/2022 08:08, Samuel Holland wrote:
> D1 is a SoC containing a single-core T-HEAD Xuantie C906 CPU, as well as
> one HiFi 4 DSP. The SoC is based on a design that additionally contained
> a pair of Cortex A7's. For that reason, some peripherals are duplicated.
> 
> This devicetree includes all of the peripherals that already have a
> documented binding.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

(...)

> +
> +		codec: audio-codec@2030000 {
> +			compatible = "simple-mfd", "syscon";

This alone is not correct. You must use device specific compatible.

> +			reg = <0x2030000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			regulators@2030348 {
> +				compatible = "allwinner,sun20i-d1-analog-ldos";
> +				reg = <0x2030348 0x4>;
> +				nvmem-cells = <&bg_trim>;
> +				nvmem-cell-names = "bg_trim";
> +
> +				reg_aldo: aldo {
> +				};
> +
> +				reg_hpldo: hpldo {
> +				};
> +			};
> +		};


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
