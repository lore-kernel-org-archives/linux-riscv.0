Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9FDEE6427
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=942MXpZEPQj5B7g34lE0GMw1n7DpJp9FVPk/j1k9LOU=; b=t+9FS1CiyqmwnP
	50nxO+XwpNvESWXkhszyEJg2sC9ptnLxOvOI0Gcv0a4st8MuPAksT9CBQ00DS6JYVZpgjxjL+ca9O
	qG8o4/W7CQV13Q9+Of34mqoHLWkrscKHJvJfrM2JcjJwVUKsQGxfc2LzKpDRO1BXpo9jXNq7Z2AZs
	A/N9sHhjcAQU3sYWuM7X+jsFF7lmVR1qIngIJmF8uEQSv0FElffyG9SgdmGQceMAJVFbxk6buTciY
	mFQvgwc8IT1F5LBwhZue/dq3tV6bzcRsM3mPtm5h9Lfp8qvSQcoosQ7vxJQv5y65Geimq1jRBltyF
	xJLGj2KHiDfCJtFKrfpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3HJ-00A2yj-1n;
	Fri, 15 Sep 2023 07:30:13 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3HG-00A2wt-2h
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:30:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-401d80f4ef8so20353755e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694763009; x=1695367809; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2EYiqatqk/mmeH++F9aAHu7AJpxnj8N1J8p9RtMdAg=;
        b=YPLkeeIve0JKsUV0QOPpK/9pDMId3yHTWzPm4D2W5AMFTrxvwoy4+oLx0BK75R+tfA
         9GiIF6686EIZ1iT3piXiZ5KK34hJTupWhwmHX0V7C4ri6txKXEg8CKtQCXT1tcAcwm90
         1cqFeNAJyCTVILMphHxGDSoBKaikDwgZTeCG9B1cz+RwkuSLKNFl4TNw+2o+rSjhvrWF
         qfr7BTBzHo7NGi1f3YrKK/Qm5P52ReG78LLpq/jlkjPrGDXvKMRiqG4gSsqbtTN3foRL
         DJNb93KdVeaqOTwvBCqPfgK2L34Ur/SM1RElr40pumEXLHiWQjrT1OZYMhB/9zaFiWJE
         OzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694763009; x=1695367809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2EYiqatqk/mmeH++F9aAHu7AJpxnj8N1J8p9RtMdAg=;
        b=MrNdnffgQk+4DNFmM2nc7FSRqMOKobBgaAfnlQbnwxj7QHVtJck+By8ucGXhJlZ7Ix
         ncCe19qCAadmAhwyC+9xDZg5v0GopYoUh6C3hfedH/tbkswRzDfl0bLtj9Z/9Rz2UbIB
         1Xa42y21LO56nAiog+8S8WvDdCERVFOtgHIGN9OntTbPqZ8js7UMDh6r0yqFWto7/OgH
         hxXn33k816uo4YfKRLr6tO2IBsQzbBm5+kNmsHQvjF0/9gARRQInKmjyYDULxhAk/GLB
         47PErMXfziySNduE96tcUgCgq6ijzLKDbe9ihHnUBlGQJ1uhnZNmRM8zn1XQizoERUm7
         UD7Q==
X-Gm-Message-State: AOJu0YwdYBUdE+DsMa3R4FR9/ZXmMrWxnk5HxoVDSfIzdnAhMDVWpeBZ
	WmYIFErh74cPpG/JTaiMYehDmNdE8cXiTZRP/Zo=
X-Google-Smtp-Source: AGHT+IF7980nHByDaff0z5ewi2mUURn7ocVGdQTtGpw9rYCqn6ZZNLdUhnzi5ATsOWz+mZaHFsrIrQ==
X-Received: by 2002:a7b:ce93:0:b0:3fc:60:7dbf with SMTP id q19-20020a7bce93000000b003fc00607dbfmr843441wmj.41.1694763009367;
        Fri, 15 Sep 2023 00:30:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id s23-20020a7bc397000000b00403bbe69629sm3840766wmj.31.2023.09.15.00.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 00:30:08 -0700 (PDT)
Message-ID: <a57827f6-1af1-e914-fbcf-74e99413eb05@linaro.org>
Date: Fri, 15 Sep 2023 09:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 05/12] dt-bindings: interrupt-controller: Add SOPHGO's
 SG2042 PLIC
Content-Language: en-US
To: Wang Chen <unicornxw@gmail.com>, linux-riscv@lists.infradead.org,
 conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, Wang Chen <wangchen20@iscas.ac.cn>
References: <20230915072358.118045-1-wangchen20@iscas.ac.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915072358.118045-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_003010_871950_3D11E827 
X-CRM114-Status: GOOD (  11.59  )
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

On 15/09/2023 09:23, Wang Chen wrote:
> Add compatible string for SOPHGO SG2042 plic.
> 
> Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
> Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index dc1f28e55266..3abb1f68ea62 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -66,6 +66,7 @@ properties:
>            - enum:
>                - allwinner,sun20i-d1-plic
>                - thead,th1520-plic
> +              - sophgo,sg2042-plic

s is before t.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
