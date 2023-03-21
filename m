Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF652C7618D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 07:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvlnZGl1xhoupMCmJEQd3UyiaRePKwNkasVdQZECXy0=; b=nqm3SL2Cxwfvou
	Ub6sdcMbSv05zg3cxX64r9ziDuFohRtla3X+XOm3QwzgO2+N9QDYnf0zSbrz+R/enAZiavcLOw3jB
	TRG7fH87DJDA04yFFqpb2b6KNwlCz3q+oxZ+z2ZDxxqzCDNqRSZm6XW52NHfDeOXn1zP0TLJQzGa4
	XKXCyuv3krKKnw9XxbvNqArivSBgox5tMkQ88zwNNF+tmAmrwu0Hw3E3RnyKJ8frHYs54mnlI6D6c
	uWxh+Lkp8ood3kg+G/aqvK3qkK93wz+yLQIGeIOPojGDX9USpD7jD9btQYgXSxCecGKJe3s0IUb8s
	c5ELSgf5bkyQBRPZtOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWAk-00BUUJ-1n;
	Tue, 21 Mar 2023 07:12:42 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWAh-00BUTc-2P
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 07:12:40 +0000
Received: by mail-ed1-x536.google.com with SMTP id eg48so55767074edb.13
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679382753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dQDpM642Q7hh+JU6LrA9OjsR/cxj5kDzAwWOZcWdIbA=;
        b=aQrcQgyo11wxnnw3d2eAgZ89uaAIlZ++7g1L/eFVF190EH3F4piD9wWL7Vb2XIroHC
         41XYuHVmRxEODlVYCa+JlRTPAY8Q59zt7FmDTd6/h6gGueI3F0ZpxNyhfrVw/1Uo5s3b
         NEW/cocSysXhyWTk6bGvZ9W6lRpM0gPDY47WSdvhV4LPAQ/4s+X9UDoV0IAokhpp9MGB
         DrLonGdwBkY+qJiRkwhMZPzdW4y5Lu3WC/YqKDyG75YhPK+RYFJvyZoOYuCNazsKVXjO
         kWBegtKb7SbKDZl3n5EBwSPz6/fhA8/RGgfnMKQWtgjtXnqzID3u42bh4hxwuheuY1pk
         kbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679382753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQDpM642Q7hh+JU6LrA9OjsR/cxj5kDzAwWOZcWdIbA=;
        b=TPlxONsnwhblAN3l/UAtvziG5UsXpT5j5sLTOm4Au8ZjfMZjSTYXRV6TVetSf68zcD
         Vo4/6PYqo3k+0D9RbdY1UZE5RJ7AxShbheI08ZminoyrfGGL7VtcYThygbteOVLGTd2s
         uGmHDTqKZz87tdpZBdpW/pTo1KewQJ2Poh/hRiZ6FbeauAZEO05G/prk6ZvT/AV33+5g
         snl4TMieQPYfmyiRi2yb5yxL2ApkeC4epY7YgDjff17n5chGtRnlferrncWpwFGAxHNH
         NrJffM4w/4y73HDgpaj8zsVvsex/oR8kCH8eYeqMbFJlxkiMoLd58dmZQ0jZ3ZYvQmF7
         3edg==
X-Gm-Message-State: AO0yUKUTfOTOvx95FQZYPU+QwSsTVRCgYnKKpWCn0u0iIf4CFlNs4XUI
	GqlypCvPrao/5/mhuq1QHsxggvvdkHdnxwkE4Is=
X-Google-Smtp-Source: AK7set/PS7SqaShaVg8CYnFcSB8qQVtfJLlDmBlSv3yu/1LJQBxNneLuUdR681oROTjjAhpE4BSueA==
X-Received: by 2002:a17:906:5d0d:b0:931:9cd2:c214 with SMTP id g13-20020a1709065d0d00b009319cd2c214mr2276084ejt.66.1679382753642;
        Tue, 21 Mar 2023 00:12:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id d8-20020a170906c20800b0093a2160168esm282129ejz.35.2023.03.21.00.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 00:12:33 -0700 (PDT)
Message-ID: <8569e185-f49f-5095-ad87-f09c0a5719e2@linaro.org>
Date: Tue, 21 Mar 2023 08:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/3] dt-bindings: timer: Add timer for StarFive JH7110
 SoC
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20230320135433.144832-1-xingyu.wu@starfivetech.com>
 <20230320135433.144832-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320135433.144832-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_001239_790055_FCEE4265 
X-CRM114-Status: UNSURE (   8.05  )
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

On 20/03/2023 14:54, Xingyu Wu wrote:
> Add bindings for the timer on the JH7110 RISC-V SoC
> by StarFive Technology Ltd.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
