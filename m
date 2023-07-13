Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C00EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0S91BbI1TY0XUIOxloDgU733wyGxVjVPbWCabR6NGqo=; b=mPDN6l3ZUkVl33
	fPu2BHLkfmCOaIO9z594qzMxDbC3EoA884ws0UQBvPO5nbH7iX0GmIATpT/bLYzli/2BZpUi1z76P
	d+3yxua4YrqdQ8R4zNS3QP/au+UWLE7bhWYQfnORgf9XCnEVWn5CJhJUCnupsQwqInuf/Cc/4mZxu
	dP5QXj/CkpkVjJp0CLvQimPFBMpRTmj51HaDsEJmXYHM6UBK0Q1QwJXxdTyL0s+mwk8RJBMDQduSH
	JJETI3X+si42rw+Z6VQoufGCMExZhaEXP/ZyyauwfqRs8Q2kk7Gpk1f6zWizS2oW4OXjWasRElgQW
	j0m/N37Z+KcFKjSZlfHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtJy-002m4B-2a;
	Thu, 13 Jul 2023 10:13:14 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtJw-002lzQ-2O
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 10:13:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso4688925e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 03:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689243171; x=1691835171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYyViDr4RsL7lZ2DDpCJ0dguzrcDcD4Ap3cfrYQ3a+U=;
        b=bxRBTkLJ7bAYtN2DWh9OzVLqa2g5xAh9ruzxNK7oUFtau/kOaCJ6scbme1yqNAAO2q
         u0zVEYfP/R0jCC3rrnp+/0wqnPsMBdiZDWgr734jXrXhMkc4fAj4rh6hE5hpmLLEM+qc
         oTIWKlfheXCmP01A1DIHW8wZV7/eLxxDi1D6yigCPm6c+6wsEQUNgVZEwwlE/kmTIt5L
         YtBNuzeNKX7FiK21w6/3ZMyRjv3jPrSDzdj3VLOPEO0ItIdF4v3omXDjRvy26v04Dprs
         zO6FCGu4fjLD2nEE24tNUXV4rxhtKDe7ZEHq/nBbzuwOq+865/1QP+Vf4kPo+rRsXq04
         Px0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689243171; x=1691835171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYyViDr4RsL7lZ2DDpCJ0dguzrcDcD4Ap3cfrYQ3a+U=;
        b=gP9fw+LZiS8YKLBJQZq7M7tMkafgp2hf38YXUOQLHsagjIjju+la0spZqtBFMoLgOp
         KU9JLLAnhu51bX29MAywL/6Gsip4qK9iibviN7HWysRFHsUpOKuYfmZy7HNbftGPO9No
         ohz9E74xemxh7EfFIU99vIwbjGX/uUwXrrzFbW9bqQkwi46326CTUqdNF+pu9iHKH0sF
         6hhC3W79jc2PF6ufyB4swKXfP/5BX6hFvempSgsvWlKBB19ZAdAIk5lgINcrUoGbpjaV
         jYlTR+GnN6IwTzLpZUun/uTsWg5VUmwNPJcvdLcvQkg7bddxboI4fSTEHSC1Nm5cgM53
         cWAw==
X-Gm-Message-State: ABy/qLZV3X0v/wlQrFwqirmIy9L5uYXxvrTQ8DccMIXO5CrK5lL9fqn2
	a0z7kExOtdn9bk0sVmrh81NA4g==
X-Google-Smtp-Source: APBJJlFbF3QHoEHYbwb9SpS88zZAyk8pQkFHYbal4mk2kHc7TVb7vTq9ytYXL3ZVFD3psiaETfag6w==
X-Received: by 2002:a5d:60c6:0:b0:315:9de4:92f0 with SMTP id x6-20020a5d60c6000000b003159de492f0mr1158373wrt.5.1689243171063;
        Thu, 13 Jul 2023 03:12:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f10-20020adff98a000000b003159d2dabbasm7470929wrr.94.2023.07.13.03.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 03:12:50 -0700 (PDT)
Message-ID: <3365c703-5e5c-de7e-3ce3-047c9ac560ee@linaro.org>
Date: Thu, 13 Jul 2023 12:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: add reference file to YAML
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230713090015.127541-1-william.qiu@starfivetech.com>
 <20230713090015.127541-2-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230713090015.127541-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_031312_786419_D6061525 
X-CRM114-Status: GOOD (  13.44  )
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

On 13/07/2023 11:00, William Qiu wrote:
> Add primecell.yaml as a refereence file to YAML.

This we see from the diff, but why you are doing it? Please provide
rationale and answer to "why" in your commits.

Also typo: reference.

> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-pl022.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-pl022.yaml b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
> index 91e540a92faf..5e5a704a766e 100644
> --- a/Documentation/devicetree/bindings/spi/spi-pl022.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
> @@ -11,6 +11,7 @@ maintainers:
>  
>  allOf:
>    - $ref: spi-controller.yaml#
> +  - $ref: /schemas/arm/primecell.yaml#
>  
>  # We need a select here so we don't match all nodes with 'arm,primecell'
>  select:

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
