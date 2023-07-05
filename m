Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9B0C001DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 06:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtBR/jW+7Y5F50to8fb99QCQ7C0/XxWYRPCZB9/gbqc=; b=GnmdX+/Ki+PCsA
	qFb3mkYUeOY0V2vVVFFsF1aYraT/0TZ7EXmLzePyCqKN7oTEm0QHuwBS+o6XCAFYAoONKGyCOOpeS
	GRaT3+SUVITJsXYaD/ld3j0igYV0ukEyzStgm8inbUEM1hWzBbtAIZH3DQxjLrFWsioR/jdmGFhqE
	CsTnaXOAVCljRFJzDToPBXzMQQ0OXoUrWIti+MtOdWgVkYegXaLOvCPhH84MihjrqP40YPMrEAgjH
	7XNdyv1MVn1NTCkuBHacZQqxTUijPjlgcco0Ldpys4/i5uHWttP4cJ8h4M78PmVxOgoIRlrVe3aCZ
	1/6cIRxaaE/sD3jAJxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGvtU-00Et7B-0h;
	Wed, 05 Jul 2023 06:21:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGvtR-00Et62-1U
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 06:21:38 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99357737980so376577266b.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 23:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688538094; x=1691130094;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXzJTSL0C9SwjgGDM+8y6l17lgOMSjsuE+XiEFarJNk=;
        b=JDdijNyMs8YO+LoLmY4HtiDvBobZ9JptXvaqMkpbUBszqzxc6cq82TNPImNYZaxV+Z
         qVgDrM42GC+z+i/lDPscyQIdo7LhRdC/XvFuhUzJABKTlViN2SA12Fcz8cgdPk461T5h
         kDkzai8vvYJh1JE9gbcmeO2YwOtODRh0hIKYCxfH3VBrBTzYbbsX0BIMNfhe0aS4nqYm
         UVM2Efp07zXFMmzkeJj47bifN4lnYOc5ynTauIMCGQFABMTTmPb3FVyUvlgmLMGL6KX/
         tJSBpp3ci2IU9TOPefsDNkNGDmnasJL0Yk7WfUeBpJqqcsXf97ZIQnM0XmF245GpqUoK
         r3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688538094; x=1691130094;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXzJTSL0C9SwjgGDM+8y6l17lgOMSjsuE+XiEFarJNk=;
        b=WPfs9AwISiVEcKFqV9pEfYMasRzUgZvwlP+HRcMe9CNoVAIgUGxKPHKnVFWO3gpGxk
         MX+0pJJBgQQiOW0yUB3jmDLDDznHqOPwJuIQbYAeR+M/hseJvrGiab6MHSlXSMzPpTku
         1OPPPKMVzYF89ViWJVVKwnW4PpehWhgMFi3C/VgAiejo+z7zxk96iT3Ll+ioqRLCcTKR
         2kih46fkguMiESWSM6Go9nFk1L+35rPa8HWr9oxnnAbMKMZWzb0FyIMB5Uzschr/UJoW
         SFP5OFGQ2rt/RqC0tJV6oN2mtPYE2RBbHCICBEYSXgFZgNn7eVPL85HNDFGHGLG5VK3x
         DYhg==
X-Gm-Message-State: ABy/qLYhDlm3R9YeTkOSytsGJmf+QuWmuABqDRDCjEP8eoJbNX3WY2mD
	t7uHQ4B5xWxcEC9GUDTfLaYrKA==
X-Google-Smtp-Source: APBJJlExSLHdFgXPPpShsvfpLnQ1I9K6lq+Cv1kUvCmlpBxjhMhTXaJcgj6YoR1Z3h3+qYtEpvI1Ow==
X-Received: by 2002:a17:906:4f0a:b0:965:9602:1f07 with SMTP id t10-20020a1709064f0a00b0096596021f07mr11480125eju.39.1688538093774;
        Tue, 04 Jul 2023 23:21:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e8-20020a1709062c0800b0098822e05539sm14050847ejh.191.2023.07.04.23.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 23:21:33 -0700 (PDT)
Message-ID: <808dac44-a72c-4675-1e4a-0ed96190efb4@linaro.org>
Date: Wed, 5 Jul 2023 08:21:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Ziv Xu <ziv.xu@starfivetech.com>
References: <20230704090453.83980-1-william.qiu@starfivetech.com>
 <20230704090453.83980-3-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704090453.83980-3-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_232137_516733_13A29353 
X-CRM114-Status: GOOD (  10.45  )
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

On 04/07/2023 11:04, William Qiu wrote:
> Add QSPI clock operation in device probe.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306022017.UbwjjWRN-lkp@intel.com/
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202306040644.6ZHs55x4-lkp@intel.com/


>  
> @@ -1840,6 +1858,8 @@ static int cqspi_resume(struct device *dev)
>  	struct spi_master *master = dev_get_drvdata(dev);
>  
>  	clk_prepare_enable(cqspi->clk);
> +	if (of_device_is_compatible(dev->of_node, "starfive,jh7110-qspi"))

Don't add compatible checks inside the code. It does not scale. We
expect compatibles to be listed only in one place - of_device_id - and
customize driver with match data / quirks / flags.

Comment applies to all your diff hunks.

> +		clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
>  	cqspi_wait_idle(cqspi);
>  	cqspi_controller_init(cqspi);
>  

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
