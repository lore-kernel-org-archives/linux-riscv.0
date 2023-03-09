Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C285C6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 07:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mpp9dS9FgP5wldQHWa2LKECJkYoUlgK2ngKh4A3InBU=; b=GWGOpnjUyPgWtj
	MVwsida+NPpqYaP89nrdMP4EAQN2KzkaMVDFNHQwiNQxWVEtuQ21uJsdXlb0wDTwdFCDmBjzyWyLq
	LHKiQO9rSeo5K4j7ZIqoDLh+43gB1n799L2kxLtTZ+uhhFJ/X72QThm2cpHIefNFBNDvgLey+kvZx
	sd8dV0aIXUlu/xs8j74Gwh4Ron2Xq1xfR1VOHbLcSqFI6lJSGoDEY/LdaN9o9PZZW023SACIWiUH1
	EYtJyXnVfdAAFtpqt4Gj4f8i/AIGj8SK883TcTfodZ8EAM6ErZHwesC1q6AspXtRLoB8wizfRDq+6
	jZisyRXTgUHhuAo+b3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paAjB-008Exz-DA; Thu, 09 Mar 2023 07:30:17 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paAj8-008Ex1-S1
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 07:30:16 +0000
Received: by mail-ed1-x531.google.com with SMTP id j11so3350472edq.4
        for <linux-riscv@lists.infradead.org>; Wed, 08 Mar 2023 23:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/22MdafNm4FKoxnbLfNBQXnvqpzeoVWKMXqp2Oll14=;
        b=Vq36nEc8g7mIpo/VFbRKg5FMlaheTgvtr7tzK30IOy6RSEXsumDuSHT/6qQf210+iN
         5LGlhkHPNjU6dC1rBfySYwcWeTPtw2qEeA8aY9bG1XRBIBnE9IjpVtxxw4LTvTUA6j+0
         lNSJyYbVXW1JN8Ji2IGE6+7TjMHNNo2SbJcMhnEC6eabuqZO5MHCf+uYjO6vRnKQTV07
         25JZbhRccHw5LsXotBA88AEnaN5amwV6EB8rHG5PRgbCv9jUExgGKnOyrvb+WWQAFNgS
         7HP44UrIL6hw9EV+Qg7qKRVgBAsD1BDB6pD4Xde095n9mxAvvCDIeqSO5bQ6aZC2sUV4
         3ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/22MdafNm4FKoxnbLfNBQXnvqpzeoVWKMXqp2Oll14=;
        b=rrQSRMYRAJasUOxNRfsgfTFkTrQbM6Fw2TF5Ft7R0VU01b+Bv5YSiON27WgqYqpXlw
         OGwIvl/sjvQp9P5l81lj1Jiggn1VizQhpyPnp6VEgfjhZ50rW2TmNbkXzxFuUX1h3BQb
         6j80YeRYC25bFj2jwGGVl++p9L17eR4VJykJGWtHq77PhSjoK2wcaCwSVyPjSJEtbh9w
         uODpbFeboHq0czgpUm7lRuaBRSeHvnzG6lwPVBmSSgR9E+xSgu62nrC1Iqhe+Ax8WwGc
         YzV3uWOJ3rtJ/Xdqi64QqVQol+GVV6lVDgNy/vUcsLJ84Od5rq5E8DGGtMbtqeRJ0TFj
         OyDA==
X-Gm-Message-State: AO0yUKVlFL3VN0a8kqk+IMsWWysDWGYZ+KTHdN5m2CGaCqdbk6P4+GYq
	AjQxIF1ahwnxPh4hS6TWKo0J3g==
X-Google-Smtp-Source: AK7set9Mg1SPFpN7kjqfzf5y5X29pTuyYLdiehsZW6a1rjetEIlurobM2qIZJVgSOtKscqg7Ht2yyA==
X-Received: by 2002:a17:907:7205:b0:8b2:fa6d:45d5 with SMTP id dr5-20020a170907720500b008b2fa6d45d5mr26703620ejc.71.1678347010938;
        Wed, 08 Mar 2023 23:30:10 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id gq15-20020a170906e24f00b008b17b123a47sm8385818ejb.208.2023.03.08.23.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 23:30:10 -0800 (PST)
Message-ID: <94ba1427-21ea-86ee-d60d-7817f8e673fa@linaro.org>
Date: Thu, 9 Mar 2023 08:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/3] dt-bindings: watchdog: Add watchdog for StarFive
 JH7100 and JH7110
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org
References: <20230308034036.99213-1-xingyu.wu@starfivetech.com>
 <20230308034036.99213-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308034036.99213-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_233014_961954_D7B07352 
X-CRM114-Status: GOOD (  12.32  )
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

On 08/03/2023 04:40, Xingyu Wu wrote:
> Add bindings to describe the watchdog for the StarFive JH7100/JH7110 SoC.
> And Use JH7100 as first StarFive SoC with watchdog.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---

What happened here? You wrote in changelog "Modified" but what exactly?
How am I supposed to find it?

Provide detailed description, since you decided to remove my tag.
Otherwise, standard response:

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
