Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE11BC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 17:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5rq8GKZflmfJWsaIj3sz1S/BztafjSXfaDOYhe+sn0=; b=Dr3PcFpwGqTAn+
	xLS/g0cht0Rs2LDTU1iR0D4gBOmIBMN2j5CU2UwPHb2cNINFCw/Sm5AVbeT1fik5H//vUGBpMJkix
	Zl6FteiVAE4438r9qcPbCloqvJDm9cDieCXwZHwqxVFFJF09imSrH/xJ4gp56hQBE1Zh2BTBncz/E
	cQJqrE5U1v6RP4pgnEc6icbuRyvzs3vUfr49CNy3cYBGPIv0VYXTUlgqIydAutkN9o323jjS5HYyP
	LyzTjINgk5KwWL8KMwjlwsn1rbChFz8U5tst+2o9Hojfpop8eX25MS0Hklmbtz/bP6f+oxElO3Fk0
	Wunic2ptg2NB8rEWPFeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAae-008GFi-2P;
	Wed, 19 Jul 2023 17:03:52 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAac-008GEu-0A
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 17:03:51 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-634ddd17647so42329466d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689786228; x=1690391028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Y/1slnyFOfruKLlVgzy7Oy/yzYdM3htwk1fVwDtIRk=;
        b=mknpiap4VlzD98tl/hHtgiTz+hpghsQCUu8zc2R7FU+fC1+Nt2mEeusJNUbQixaHEX
         uiIKyyEd4Dq3OrVDcc7xtvLRXg2G1/PaVEesjc+x9BE0fBeSn6k4N0CVePpZCXsuzvUm
         f53gYdCf/JRwvyf8I/EUnFVVmyKz3IXYAm0WKTa8aitbsjmTaBeFMX2vpBLapTqThOg6
         Guforr1Np1vUUXvA9/bDfmuK/YMWXTCtZgWbzOdTK2IBv28LH7MzEfBcQROcZBM4AwHv
         mET3PbZWJqUfyPf/WEQmvJkhAzSJej7+WI+tfxMKl9I80SvyPB1YIWPKyx0ArDyCEi16
         LoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689786228; x=1690391028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y/1slnyFOfruKLlVgzy7Oy/yzYdM3htwk1fVwDtIRk=;
        b=gtr1rqc0Ad8+u1xZhNvPlXU5p40jmUoV/7rgpb9ncXCGFswtiFUzGbgyd+iUPR/VqZ
         ofaVaz2LuWH6t8JrMOEY9/kYSn09JrQ8HlkV3QBHyUiC7pFsaT6HpGvYKTZPQ7qQ+HLO
         kv1BExItMAB0IExePxckxdjeki9RjpFEDpWbJyWo3h55ImFpu1kSFgBWlRaqkCUnePiW
         XiL9l2lJIsFRCFbNtxP/ztJXoXcZTk69UYJEUckVq51prruXJC8TkIGEzj5DY1XihsWS
         aihJhued2th3gyjtchfDpXRBIOB3XTDen3GUXmSWbxY0n7556JKNuDdAJTTG0cuF4CmR
         Mj5g==
X-Gm-Message-State: ABy/qLbPMqGOnQ5tpGGEPHBYbX6FzzdKDj4nGV5E6ERck+/cGKD/sHYb
	57cp9g4sIco6mtn+VJlVep3bDw==
X-Google-Smtp-Source: APBJJlGo7WgU956qlMCfm5+kYjiJGtiIBkXK8Pxq+lmL3ldE9ZAtORUHqORdt2kk9hfe+8Fm+OlMYA==
X-Received: by 2002:a0c:a801:0:b0:632:1c72:c379 with SMTP id w1-20020a0ca801000000b006321c72c379mr15842406qva.51.1689786227785;
        Wed, 19 Jul 2023 10:03:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:8499:3c3c:78f6:f355? ([2600:1700:2000:b002:8499:3c3c:78f6:f355])
        by smtp.gmail.com with ESMTPSA id v14-20020ae9e30e000000b0076264532630sm1378783qkf.121.2023.07.19.10.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 10:03:47 -0700 (PDT)
Message-ID: <a3c4f1c6-444b-b3a2-c952-bdd5b0463f95@sifive.com>
Date: Wed, 19 Jul 2023 12:03:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] gpio: sifive: Get the parent IRQ's domain from its
 irq_data
Content-Language: en-US
To: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230719163446.1398961-1-samuel.holland@sifive.com>
 <20230719163446.1398961-4-samuel.holland@sifive.com>
 <ZLgVPv7zdoaiUCU6@smile.fi.intel.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZLgVPv7zdoaiUCU6@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_100350_097894_760AF228 
X-CRM114-Status: GOOD (  14.22  )
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

On 2023-07-19 11:54 AM, Andy Shevchenko wrote:
> On Wed, Jul 19, 2023 at 09:34:44AM -0700, Samuel Holland wrote:
>> Do not parse the devicetree again when the data is already available
>> from the IRQ subsystem. This follows the example of the ThunderX and
>> X-Gene GPIO drivers. The ngpio check is needed to avoid a possible
>> out-of-bounds read.
> 
> ...
> 
>> -	girq->parent_domain = parent;
>> +	girq->parent_domain = irq_get_irq_data(chip->irq_number[0])->domain;
> 
> For the sake of readability I would like to leave parent variable
> and assign it beforehand somewhere upper in the code.

OK.

> Also, can irq_get_irq_data() return NULL? Needs a comment on top
> of that assignment or an additional check.

No, the earlier loop already verified the IRQ number was valid. I don't think it
can later become invalid. In any case, we already dereference the result of
irq_get_irq_data(irq_number[foo]) in sifive_gpio_child_to_parent_hwirq().


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
