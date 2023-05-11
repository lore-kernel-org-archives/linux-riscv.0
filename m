Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E6C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 09:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6ewcWSRh8HDR/QWX89nhBEC7+ULNLSjudSpucRZX9E=; b=HFuHQ6iC8e8iwc
	RWtZYGo655Cladan4ySj9DqUAs4Z46Le7eLpjHB+GwhzchZf1fjk9C3F+PUY+6LI3E24ueqJ9YkUa
	HrcRu645G+QV/cWZb345ZdAPYg8DUZ37vkdPu0ag9QjQOerEriU6dVqnhbd9e8Hs/1aKohzH0e5rj
	9mHbTHFJ15qb3bNcvQALmP1nfBA8ditjhpZbu1Lzx7lf0RQZAqtlZr5dJCfPJsKLMQom+jQc8aXj6
	dlqWl22t9wWWUUdmuxIMJjNWa5RaIjwTvA3AF2Ob4edWFfOVeWiC9aNkRSPc/ER9CPVuQLJutfYG2
	YYUvYhaqfYI40vDw/yfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2w2-008Nmt-26;
	Thu, 11 May 2023 09:50:06 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px2vz-008Nlk-1a
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 09:50:04 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50b9ef67f35so14875632a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 02:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683798601; x=1686390601;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZeuJxcLYHvnducoUZ2tfN6ldpdzeLGAaTYjya3TOvfo=;
        b=NFXGriYCOSUh+Lw7dIdqAPCMJ29f5l043OJhVsEeEP4U5lPIAu8F9ns0tM9PoNJs9e
         A5P4fNhWdJrw9ATAPy1aCfihrLmMBIwBp2vHqPJ9TpNE+fKFnqmI1BwDHged0cezzPEG
         wNdWRNr6Lz45V33NaZWsTqYIiL0afuSpLRdlRgo9szDyIEte41n2XgVbQXwoZjhEiQwA
         //EpOg9jzrD2r+dRHovI6H/I/xSj/3GEruXCtIxiBceaaXleRNCETiIy9C/j4+fjq235
         0AHhv7BLiuHiPB18sqgpErsRyVPPZ+zRakAJs27z17BzsfaMrJ2GrIPatVrRX2PGgXOd
         zwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683798601; x=1686390601;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeuJxcLYHvnducoUZ2tfN6ldpdzeLGAaTYjya3TOvfo=;
        b=PjMUkcCGnOdLc0kNfiRUxgw2ZfPEGu/rvidvIB94FcMJPE+ni+Ghv28QpPlay2ABhp
         8GFOe6TFtX81xrGrQG03SnI62f49f+Q3D/5CfGjWCv+hU1ac9wbgz029Y7klGKhGezEI
         slrfEHkfVvdcLDAn5C/yGFmsdiohyJlWBNG8bHnYSzJKspMS5EqGwrQcxXNwFPjdriuh
         wjNYOAchtIHYdFFFNrVjsuDMeMLQCYAgKThwYpZNBlRbMZOoypYr3rXMxOIhghcSr3jf
         FLvnckWfIGFHO2xdQ+OKo12bf89RCLEy1YKR7CNnknHMPCqB5OGOWxRNrN14JZ4xHaRs
         9Siw==
X-Gm-Message-State: AC+VfDzHg6VZD/WvYTJ50IRToczG5CmooAIXAqNnkAMOqVeB25JQmTcZ
	1+CNuY281wR4AcnDYIWQKSi+Zw==
X-Google-Smtp-Source: ACHHUZ7Ea2uusu9jGNU3bGYWIa2nIX2TkmMJmfdXAah2FwXvUQkusDiywyoV8u4oAqkUEMD6Z3cmBw==
X-Received: by 2002:a17:907:9495:b0:96a:7a75:aa44 with SMTP id dm21-20020a170907949500b0096a7a75aa44mr364203ejc.4.1683798600971;
        Thu, 11 May 2023 02:50:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e? ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id d19-20020a1709061f5300b009596e7e0dbasm3723120ejk.162.2023.05.11.02.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:50:00 -0700 (PDT)
Message-ID: <9dc6c0d8-fb49-6242-3863-8040e43e52e1@linaro.org>
Date: Thu, 11 May 2023 11:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 04/11] dt-bindings: interrupt-controller: Add RISC-V
 incoming MSI controller
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-5-apatel@ventanamicro.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508142842.854564-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_025003_537202_DCF28CA0 
X-CRM114-Status: UNSURE (   8.80  )
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

On 08/05/2023 16:28, Anup Patel wrote:
> We add DT bindings document for the RISC-V incoming MSI controller
> (IMSIC) defined by the RISC-V advanced interrupt architecture (AIA)
> specification.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../interrupt-controller/riscv,imsics.yaml    | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
