Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162A8EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cya6in16DiBVgLmOCr4Z5zan9xoRgSq9tS5hKkKuBxY=; b=GXQr5Omt80SBiP
	jW3iYm0V/rHUYaGf6z/SduTnCI3k9f8TT85ynfmP1zZGjgcIwHxpVRPqlpKtecy0n5QtqwhUa7ccO
	rAxZE4Wjwb8MaOgvlBxJ2O/EBfSsy9QJ81GuJmNVrMwf0tdPHRY5w45x9JOXhteupfcHeC7ti3qdU
	IVkozraRceh/q9bvkDRMuMFx1ZJscrcn9tvR4IljQS2F1OOaUIAqt93qfXS3kBWR6jyCSkwjmHi5d
	0Lq2TcdlCVeEaxzZLMHsUrMet7p6ZOzK9rd/6hxP34/tN//PjIFN8gGcrNVD9Ml/QTeRywRRwsSpP
	AH8VzRzHDdNr04zAKz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcZj-00CmFl-2h;
	Tue, 04 Jul 2023 09:43:59 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcZh-00CmFF-0e
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 09:43:58 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51d9bf5411aso6094060a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 02:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688463835; x=1691055835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jjVOyUTnAKMRHBkOAZFEZ2Gt/AchktqGDrwDJg3g/0=;
        b=WMnfo36Btbfm7d0ZlMf3SJM8X7nDp/s5XlMgIET7P+HRjpjlytc+l4t0U4hyXIc6+x
         Gq/K45vYX6Ib+pOG6NTFHwtHboFXecOitRXIHT9fLbn+KifrXzVXeoj9WPOtPpec7Pn1
         v4Wx9/tRn/1q2oAqdmyenxoo+yQydUrV/2jGrBUhcmeAGhAgKKQStcyg3ijkeuev5Ah6
         pgzUQ6o6/21yc/7cKq47qqR3mEFNwAdDOp2Qvllun3RaKnJdbi1219c0VW6rMu5Fq9M1
         Vq7m1lW0r9TfNqtSJrbe9cV//oa46CttOeWLHLAuKfiNhaiMMYPi8nUI6+79345jxXJR
         BjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688463835; x=1691055835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jjVOyUTnAKMRHBkOAZFEZ2Gt/AchktqGDrwDJg3g/0=;
        b=Gm4Yc8aDXxgI4zVNwendEvB7wne7Mbayf0sxCL9nBmAe8DvRcvooWmGiEdb90ZmHkl
         O7BzO6ZpFCr67kC2WGfE8RDO7jwXOfQ9GBPCXuEOOYarvLBJiM20xouiy5tnWw+nWEVX
         TQk86U7I9BV1JvYVzRIkJBxEbzPVKP6l41vzOeVC/JrGAO2hYlfXVYzwE8cCzuJClid3
         vTov4O+jXpwtw6N5EeCWzcHk4f07fg95aP6NqoruNnw8gUJO26XJHKmSOD1Kpb1eczS2
         GOzm5hhQgaam1wjuUqaKaoXIAU+CZbpCcZ7xRqScsacXJGy3mEKmnxKvRkMJ9Mq9fNUZ
         mxpA==
X-Gm-Message-State: AC+VfDwOGXOJCV0Pe8qh0i97ScR5TRAMDqkxMktNKQhYlp9lkD1wPHOU
	mC4hy2aN4sJCHwoYltoOifUvFA==
X-Google-Smtp-Source: APBJJlH2BFfowyRuGkZg/4gGurh7iScSfZUSYvUlWG8KR6PQzOga/kTW3dcg5eZE/mRNoT1lrgm9rw==
X-Received: by 2002:a17:906:46cf:b0:98d:d26c:e13b with SMTP id k15-20020a17090646cf00b0098dd26ce13bmr9263223ejs.8.1688463835157;
        Tue, 04 Jul 2023 02:43:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b27-20020a170906195b00b00991e2b5a27dsm10457201eje.37.2023.07.04.02.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 02:43:54 -0700 (PDT)
Message-ID: <552d39ee-0fa0-94c0-89b9-245e39e8586d@linaro.org>
Date: Tue, 4 Jul 2023 11:43:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: Add QSPI controller node for
 StarFive JH7110 SoC
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Ziv Xu <ziv.xu@starfivetech.com>
References: <20230704090453.83980-1-william.qiu@starfivetech.com>
 <20230704090453.83980-4-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704090453.83980-4-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_024357_258737_8ADE4B1E 
X-CRM114-Status: UNSURE (   8.44  )
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

On 04/07/2023 11:04, William Qiu wrote:
> Add the quad spi controller node for the StarFive JH7110 SoC.
> 
> Co-developed-by: Ziv Xu <ziv.xu@starfivetech.com>
> Signed-off-by: Ziv Xu <ziv.xu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

...

> +		qspi: spi@13010000 {
> +			compatible = "starfive,jh7110-qspi", "cdns,qspi-nor";
> +			reg = <0x0 0x13010000 0x0 0x10000>,
> +			      <0x0 0x21000000 0x0 0x400000>;
> +			interrupts = <25>;
> +			clocks = <&syscrg JH7110_SYSCLK_QSPI_REF>,
> +				 <&syscrg JH7110_SYSCLK_QSPI_AHB>,
> +				 <&syscrg JH7110_SYSCLK_QSPI_APB>;
> +			clock-names = "ref", "ahb", "apb";
> +			resets = <&syscrg JH7110_SYSRST_QSPI_APB>,
> +				 <&syscrg JH7110_SYSRST_QSPI_AHB>,
> +				 <&syscrg JH7110_SYSRST_QSPI_REF>;
> +			reset-names = "qspi", "qspi-ocp", "rstc_ref";
> +			cdns,fifo-depth = <256>;
> +			cdns,fifo-width = <4>;
> +			cdns,trigger-address = <0x0>;

Bus nodes are usually disabled by default and enabled when needed for
specific boards.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
