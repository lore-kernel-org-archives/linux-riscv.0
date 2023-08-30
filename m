Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E76C83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 07:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nn4w8ZNqrGRKK2qp6IGgzZ9lHDYpQ+kLdhxuYZ549Y=; b=mtuknr5rOHK+ef
	Pmp2yCxS4NJFPqEJ7li/QTHIzxYWoGL6Cya9ILxCPF6iN8NunVMSFavK46UGF6ZXVRSHLpr4cRR+q
	Rkfa6AiZeQR+yHSUrVc7ULg9rHj/cXXgNJH3Q2TwYxbH0f3QBJxGbkn4BZ6lJ4NSVYPYS1g/qR0u6
	w7+THEYwMoo1tFOvxCOgvrElPio2T4nX/5L2mGvDwde4gIntp8e2d/mJSd6M/aMUHxXTAinRxokyz
	QuUQxZ6eHQZqemXA63klXYuTJHQJlwa8irm03q78IAKYFwHTpzxGmrTxrOJfp+GKcft5A+Wx2db5T
	xkDd/NvRt82xApPJMCMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFdn-00D085-21;
	Wed, 30 Aug 2023 07:29:27 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFdl-00D07g-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 07:29:27 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-500c7796d8eso1679391e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 00:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693380562; x=1693985362; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iakEJtZPdxSu3loWtUm60QLK0RtulO60Tw6Q/Ct/Ti8=;
        b=OYegmQdqbWhKp3NrRdIqnQOUPvCVT26Vj/iuxlhOV76V8h/Cc17110GDbOqVHeA/DU
         JAJm6ucGR2m79aBiPPf2LRjc0UBdR0h76veFcjVk+qbTfO06OWXhFOYPn2rZdAvtzM9o
         qvqZJudPIuG6iXWblqGyg8FrIJAsrGvJHNDLg6hLqxBkLkDxiMu7spTOdWIes1JOlzGr
         wZpWVSTf6WWRkuobI5S4oirW8NDEFqYkouHiWhHVa9RDduq6xzI+AUsDw+hGbvfWNabz
         bE2O2HCikUSI+Q3L82F3CmXnFgm9gKtl0u5JRD6ity2oHeEVub8Cx0kSZBMlyfpTQbPT
         Bt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693380562; x=1693985362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iakEJtZPdxSu3loWtUm60QLK0RtulO60Tw6Q/Ct/Ti8=;
        b=CezMVmhr+Zr3n1EPO31tHxz4aB/lrQGcIkk2KOsJwwaenwDIJlo4/d8Sxmb/7I3rHA
         WZcI2wIEobLzsbAqvCaY+Hl3v+59JWFCLj3uc3xtUnzgE4WDeQgqfEsN3hxcDNwu6soc
         vYAiauJG51HHDcUTbdpFdgbTAoKs5RD+DfvKfC3WqQfW49zJd+oJjlJ1oK+tzPpQXnlB
         nLgPIvQGV2fzgvMdGcSJv9EM1CWZZc8zYWAPlUm+eR/drTQMeRyv+fMinZNKMigB4ug8
         2DslLNwRDnG7XYST1PwKo39mqNuUwzXNXIj0Sa7xQPkSqdxXBJb0Pgxq/FvrhYQhUh9L
         HrYw==
X-Gm-Message-State: AOJu0YzcsmNULPUqiL/qaubAQlM+xOYGOeguFfoWOKAY7G9QzVYJZqIu
	N5a22q5y8jDiHq+EsLj1pJkH4Q==
X-Google-Smtp-Source: AGHT+IEGnWlpcrzRAyVDAFi6dDUGQjQoD1ziGKw9kQ9wLhBjpqukVGu9aK7EcgK7UhYkENFAmJHs5g==
X-Received: by 2002:a05:6512:3d09:b0:500:7efe:313c with SMTP id d9-20020a0565123d0900b005007efe313cmr1135381lfv.24.1693380562262;
        Wed, 30 Aug 2023 00:29:22 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id b14-20020a05640202ce00b00522572f323dsm6417426edx.16.2023.08.30.00.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 00:29:21 -0700 (PDT)
Message-ID: <b375b88c-0d9c-30a9-21f6-283083cf3880@linaro.org>
Date: Wed, 30 Aug 2023 09:29:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
References: <20230830031846.127957-1-william.qiu@starfivetech.com>
 <20230830031846.127957-2-william.qiu@starfivetech.com>
 <20230830-commence-trickery-40eaa193cb15@wendy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830-commence-trickery-40eaa193cb15@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_002925_837694_23699719 
X-CRM114-Status: GOOD (  12.10  )
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

On 30/08/2023 08:50, Conor Dooley wrote:
> On Wed, Aug 30, 2023 at 11:18:44AM +0800, William Qiu wrote:
>> Due to the change of tuning implementation, it's no longer necessary to
>> use the "starfive,sysreg" property in dts, so drop the relevant
>> description in dt-bindings here.
> 
> How does changing your software implantation invalidate a description of
> the hardware?
> 

Which is kind of proof that this syscon was just to substitute
incomplete hardware description (e.g. missing clocks and phys). We
should have rejected it. Just like we should reject them in the future.

There are just few cases where syscon is reasonable. All others is just
laziness. It's not only starfivetech, of course. Several other
contributors do the same.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
