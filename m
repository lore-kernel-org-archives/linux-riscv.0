Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8DFC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 06:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdZ6dg627gV+pUnUSq/hq3ppkGb0WMn825GmcL/Vttc=; b=eThhIQVNaYiVDv
	MK7QtN/lJzdgAlFTwjvGPowNJwahU50habe1kK5bh1GmIS1B42xDaQLZYyq+LqpTxju7pGl1BSBQ5
	VBG1+Xz6EiMZm4lyBXBiqeUh2fHHlLMKvt/kvEEKcxY7u4G+1L9FyavFRdsOFQWBqxUx6yzXcAPMK
	Y9P2FCtAOJjHxE0qMCMaIEJf/XEnp8BQSQwB+uDxkPkzDzwVYh+WSztm0C/tGF+0/o7gH9VzXYBDa
	42B0Fs1kYF6XiOz2wPm58hAhJvX4JWDBooyqmEuiust9CIkeaRLNxI6UMuq+JA2dmQRKdn+1AH9ai
	ZYEDVLJ36wPRQj3vKx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMP0-00B5eN-2q;
	Fri, 12 May 2023 06:37:18 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMOy-00B5dn-06
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 06:37:17 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so17214875a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 23:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683873434; x=1686465434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKQArbr+xtf09epgIWVQVcaD67YWPhsZPgDsQF54Z/Y=;
        b=X2+gtVsUYPPuW7qdNKW5Y27uqHZ/RayroYk7RhEolPL+QdJq526rPdIj/Nn24VmYMM
         XGr2lAtGekbx/bx2h9MDx+nn5heWlUi2F1LtoWbz6abxpfDSY0XpWTmaw/O3hUFYEvLc
         1RSx5oYmYjazJkGlfhXGDE10S7gXfqbnDIcVmWQCJJfNLKqZO/rkZDJeksu7+B69h0rz
         Uqq3oZOuHuUDGXkQLZSP2hnTgqXLtav2r5KFd9i5/pHM3AA8yl2OR8bSSi0eIgGb2OMl
         pk314ZM8gMCnfor+NJGY/zmmgrVqI5kbP8/h8pGzQDHSoghB0VpB4MBMamrL3H00TZRG
         GliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683873434; x=1686465434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKQArbr+xtf09epgIWVQVcaD67YWPhsZPgDsQF54Z/Y=;
        b=X8aoxXcNKomJVXJMwXF/OhZqJd/ADzUifIfr0c6duj8wru7aUCrF2hzKJNwN3KHnRu
         fWqqXvmkD8p9s1DFNIILM4pnNYCIvju5EwLCCRXrePAl36PmNsrzKSwy0hXq4xMiKbPY
         BG1WaD7O5rkMS/TYpzD6gyx+toosnjHa5o6drsHW6NCv47A5y5pPa1lBHnhy4ANSSCLj
         PJEQeeljaIkwxDFGP7f0cIJlQPexpeovGEZfLteNd25DGpFJ8O4vhkjAY/uy8aKV0zcI
         nttXkuvjJURDBO4hKF+vMRhB3eOKzbnQmz6He72Vq2reEFafYbVTVXfiKytdu1K8mhXQ
         IinA==
X-Gm-Message-State: AC+VfDxnSr+89m9k4UYKre3n3iRzow8rFv9FC6bMt07EwJ8Otm65S9nV
	b07x98cOu0Y4E6st7U9Rdju3KA==
X-Google-Smtp-Source: ACHHUZ6Qir9jHw9lbKC6t++22DfOfrTK74YUqakGyuC6Q1hQEyqV2RCesGT5QfSt+aq1kGIfLATB2w==
X-Received: by 2002:a05:6402:1016:b0:50d:f9b1:6918 with SMTP id c22-20020a056402101600b0050df9b16918mr3020743edu.9.1683873433648;
        Thu, 11 May 2023 23:37:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id ca16-20020aa7cd70000000b0050bc9ffed66sm3740060edb.53.2023.05.11.23.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 23:37:13 -0700 (PDT)
Message-ID: <c432c26b-27d3-80dc-fe6b-457996234871@linaro.org>
Date: Fri, 12 May 2023 08:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 7/7] riscv: dts: starfive: jh7110: Add PLL clock node
 and modify syscrg node
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-8-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512022036.97987-8-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_233716_393698_4AC3C74E 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

On 12/05/2023 04:20, Xingyu Wu wrote:
> Add the PLL clock node for the Starfive JH7110 SoC and
> modify the SYSCRG node to add PLL clocks input.


> @@ -465,6 +469,12 @@ syscrg: clock-controller@13020000 {
>  		sys_syscon: syscon@13030000 {
>  			compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
>  			reg = <0x0 0x13030000 0x0 0x1000>;
> +
> +			pllclk: clock-controller {
> +				compatible = "starfive,jh7110-pll";
> +				clocks = <&osc>;
> +				#clock-cells = <1>;

This should be part of previous patch. You just added that node. Don't
add half of devices but entire device.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
