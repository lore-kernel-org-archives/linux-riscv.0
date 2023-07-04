Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFD2EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 13:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNFf0v6+9ZQa8XPVlqlE9qKRX/kizjlXcodEojNdNCc=; b=VKTTBeebuzFKyC
	ES+tAK3GzdFeu2ARF/6vmimsS/WI307+HevsU7LcUbYqp0p8oFLG5FKLye1XgEmS9Sxu3ucAsSBDL
	6CsiDXitJocLryqwn3qbd9nLjastXmGkn1JFVOidqDeOZC2mdck9iYLx2OgdsV8pd/RCLPD5jySSs
	BVZE7TJsVb9P+Pnb9DII1mrVvoz+OoZ7NP15Ylp2AbnFredG5yMFbcnIIGRssSR9rEmTG1od8Idiw
	5+ZP0ZatMG8g7TKy+hf3ZsI78bCktsyDuICDWeNX5VK7YJ5bHFeI79QwPihtn1Hwj7pvu9wPbhAkH
	8YDdYhlJM+dbr5Q/kttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGfyL-00DNke-1D;
	Tue, 04 Jul 2023 13:21:37 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGfyI-00DNjf-38
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 13:21:36 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9922d6f003cso688413166b.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688476892; x=1691068892;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBSF1NolQO8rskeUSMv3t8uDwxMXaGRNLk5ilo4Ryuw=;
        b=pNiEfh7s3N/B+0ZxCLnR0kBEzaW0kSO6X8+7eP1ur1DXCI6lW6OySCKvEMl3hfKhF5
         VNnmJuVnJfDw6Xo9akbj7qi1PsFZJ+XagzITJ9aRQmiGrVnXgPFqe5or4p4lYnNjzDa/
         Oi3cWN0Iv2VfnqMw+3BqoFYDG+i3CKppYBkE8BMVMRm5S/5qTvMNVcB3FYhHU8l6m6ba
         Vo8SLZJULu06uwSccIK2tEEIssQpPhph6+qdA/d7hzgDNFlE7EgndHOplSTJj8PY+sVz
         2HsEiP5QnrE91awtaGCmnIuxp3WjX47iPO5BCXcfgf9D6uJGeddnmAOAkCuIGOekoloS
         IDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688476892; x=1691068892;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBSF1NolQO8rskeUSMv3t8uDwxMXaGRNLk5ilo4Ryuw=;
        b=IajLnPZV3flGdr3bshtH4B+krPiBEIq/e+w3FpUNFjfkRm4TygRAgMurgxIDlNia77
         E6YK9nRS9W3VmiUTXUj8hLRAekStidjbbQVIC7uBvWTVP/O49gQjC4Yy2F3elWO4ou+1
         cGB4zL619kgJChHGIuct9uDSaYDlbTEv6dGL/YcRnOvNB6IBN1ODiIf+OA8Q8co/uDSe
         HF+QGcKgkjPZE5DGxibXJEh73at4XLr2UpebA9sOz7iYRQl5dgxFTvii2S5SLSJixvi6
         Jln62OBh0q6en854bS63Ednp6e+Snq/EAGxl6dcSlYCySk9Dd4Z5If7RzIu0akJfh4Se
         uZHQ==
X-Gm-Message-State: ABy/qLYMh+ipQjC1eCgforxSxDT68dXWmejr3WNmgdQElTLKDy8f2hv3
	2w+QPoyMD/FhlxFp2akkG+4ZmQ==
X-Google-Smtp-Source: ACHHUZ7GruU2SMpelDGt/k32whGmAdH3xrb4LP13iZfv51rQJZeKedemsN+25543YUVb0HiPq59Phg==
X-Received: by 2002:a17:906:af15:b0:987:9823:b9f with SMTP id lx21-20020a170906af1500b0098798230b9fmr10240987ejb.28.1688476892394;
        Tue, 04 Jul 2023 06:21:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id r21-20020a1709067fd500b009828e26e519sm13100150ejs.122.2023.07.04.06.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 06:21:31 -0700 (PDT)
Message-ID: <a8c1a5e7-9938-bf6c-6bb7-6c1e4d8ce08b@linaro.org>
Date: Tue, 4 Jul 2023 15:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND v1 2/2] riscv: dts: starfive: Add spi node for JH7110 SoC
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230704092200.85401-1-william.qiu@starfivetech.com>
 <20230704092200.85401-3-william.qiu@starfivetech.com>
 <7f3b600d-d315-22d6-b987-eabfe1b04fdf@linaro.org>
 <eba1e868-6371-42fe-91be-bcbee54d1aff@sirena.org.uk>
 <4afd90d9-f1bd-f40d-1c79-50fef1406ab7@linaro.org>
 <6307c5b2-64d2-405f-b1a5-696d4184f6a0@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6307c5b2-64d2-405f-b1a5-696d4184f6a0@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_062135_034716_3B11C9C9 
X-CRM114-Status: GOOD (  10.39  )
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

On 04/07/2023 15:16, Mark Brown wrote:
> On Tue, Jul 04, 2023 at 02:27:57PM +0200, Krzysztof Kozlowski wrote:
> 
>> Also see:
>> "every Co-developed-by: must be immediately
>> followed by a Signed-off-by: of the associated co-author."
> 
>> https://elixir.bootlin.com/linux/v6.4/source/Documentation/process/submitting-patches.rst#L467
> 
> Oh, that seems unhelpful especially with it not lining up with the DCO.

I assume the intention was here that if I attribute some co-author with
Co-developed-by, then I know that author, therefore I expect author to
explicitly participate in DCO chain.

Otherwise, just drop the Co-developed-by.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
