Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A821EC678D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 09:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DB/K58hDV7bhiiX/NdrdusPUlvvXWKPPujDDokZAVa0=; b=pN5IK1zfOijW/b
	5yf5iBEsynbtxuxXJN5BmVKEWnGtgj5H8oejW9SpzM/Dg/jXOhEeOFmHnBA+wOrMWxDJ3iGfESmob
	0e9VkaIAZCfOZBqMQkWGb4CuYwP+bTciVNGuyjjWj3hFUxxsiojC3wngSrbNkUpVMHxDSA0qVSi72
	Oow8ES4AFScLddG8yETwTYwFOxDGI8Z55OsxuUh/tYT34vxckeeSGy4nL7Kdcndwu5BWsmLa3CP3l
	N5Euyc5CfpYC1TT+Ga7kZXovlnzK6VetT2FDU716t2VMgnbvioVEeTxIDJfmm4b/vFXkuZZWPb6v3
	iW3eiMtlgEjVU1xYBTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTBh-00Gp6B-Tn; Tue, 07 Mar 2023 09:00:49 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTBe-00Gp4V-Jv
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 09:00:47 +0000
Received: by mail-ed1-x536.google.com with SMTP id j11so29858311edq.4
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 01:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678179645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0vYkOa0PoBId8dXA1mab0Y6HwS+Gs0X3+n+J6uDR48=;
        b=NV1Nd45GytToNw9aOikhQ9L8GzQvpYRbnNuIYOKVEo7JC+kURcPxlt+GROykAFoDEb
         rIAx6QgPWEtDz6GU31X52VBqcMtUggzwZghOHSgL35MNZMAN3bkgLKgNKtYK6ZK4IWbn
         OqXSO6ccpSvh7OgzhIXHXzLBP+XNPm2VgrzeMYSBFvKrxZPOKgcsK17TO85oYVAx1Hp3
         77jpgIT0laLuTw11bNB25AOLGSDboQx3hpVKR8SoJSb7/uEgEV2R0ITBPo1fmlWKkpzD
         oxRntkUT+4WIpFwmW721KLNCtY3+TPfEqr4MNo96mhC1kbIffLrUD8//jKnLXo9CheGM
         niDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678179645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0vYkOa0PoBId8dXA1mab0Y6HwS+Gs0X3+n+J6uDR48=;
        b=5o2IIKvIsqJP85zCphyYgUqz/tSiR0eeHeW5HIaQJdWKd4vM7sD4YX7ruKYuOnSESA
         nf66LTOifd4+HTATH+Kcq32wMhbcWNEbuTqOPloF6z/agDccKsEzy+CT1OYNxkzM0R6I
         sVT37ICSyzD47/b1t2qg4ui+Locsc8dy+rqZUYcElQ/QT2J1WKo8YSndfPWkwTS8hv0z
         cWCemYKas6HBlM0qbV+DdCTSbmgYp6sSd9nPgz6VupOgbxlRm3gXYewj6m6QJOxWtTaN
         7KGJ4tMYcJGwuN7EiR8A0o3hXJWLdZsjoRxPKxs9Cbd0Rxvhdrah1oWQ4tfkhKl6BHQQ
         h0cQ==
X-Gm-Message-State: AO0yUKXF5CJpC26QBCxsHiqzyYPQABTkEeCZM1QBPOYcErvdLBSfzj0q
	U2wytJs5VV4zwaL+Zm6tJxfvmw==
X-Google-Smtp-Source: AK7set92Dtb5JAFq5WWkgalNVpDdJ8rm6dEQZckxT+FZE6VibN618Liy1j3PEiMosIKVpJcCzfe10w==
X-Received: by 2002:a17:906:da82:b0:88f:9f5e:f40 with SMTP id xh2-20020a170906da8200b0088f9f5e0f40mr19949227ejb.68.1678179645007;
        Tue, 07 Mar 2023 01:00:45 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3? ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id v18-20020a17090606d200b008ca37f3eae9sm5730748ejb.131.2023.03.07.01.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 01:00:44 -0800 (PST)
Message-ID: <39ba7357-541b-a70e-5793-91bb9e038938@linaro.org>
Date: Tue, 7 Mar 2023 10:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/2] dt-bindings: syscon: Add StarFive syscon doc
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv@lists.infradead.org
References: <20230307024646.10216-1-william.qiu@starfivetech.com>
 <20230307024646.10216-2-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307024646.10216-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_010046_692684_9F8A7A4A 
X-CRM114-Status: GOOD (  12.72  )
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

On 07/03/2023 03:46, William Qiu wrote:
> Add documentation to describe StarFive System Controller Registers.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching). This is not "syscon" subsystem, but rather
starfive.

> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/soc/starfive/jh7110-syscon.yaml  | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  5 +++
>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> new file mode 100644
> index 000000000000..72c8850602b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml

Filename: starfive,jh7110-syscon.yaml



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
