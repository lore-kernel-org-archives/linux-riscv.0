Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2138C4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 09:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJYDth1ek7Vcgm4JNBKC1kDlcbEVe2lAUUtbMDJkgGA=; b=XtgmgiwpiEhRXr
	2qz+G9/mThjFLE6XIPa6JzQ33cCr+r6W4+K2mnJvUc5FytNGh5jSUU7brUjAA8hU6uJ3BA0k/1Zk5
	EUl/jmKrJpfRJx1oLhI7lzNIDa58mminxH3DsU4myAhsTyvBIODDQ4eIizcAgRyr7hVAsj/oDkqQl
	9Qjt53GanWR6mk4d4rLx+/4VB8VmKQXZtpiLvshTfIvnljW8AkhxQKWjJYdrCqsRnqitq2pa7IL5m
	/NXgUjG8Sv/UiLmjVCaQAZL+sSgxG4sNo/YrHvOqv1Xoz0W151SSHtYhq8EGrwYk5yW7DDVJQXiWO
	FGeNC/Q1zi0cYZieCJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPg2b-00Ba3U-11;
	Tue, 16 Jan 2024 09:47:29 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPg2Z-00Ba2T-0N
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 09:47:28 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a2d04888d3dso381079666b.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 01:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705398440; x=1706003240; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yD4vpBkbRBMO9QGAEAJHw9dn2BZMsbgBrgpZ8rNI5cY=;
        b=OfXEcdibMRKqCBTi6Vtk5vGfZ2/HP4c4MvHqYzGkjz/BGtok7nt9B9F2mtqqMeb39n
         qh4hcfW9Qfkg0XPf1fjxoFuz565rbM9b7gpQJiM8UKe7r1yua0Emzrn7TckoSVjCJpFe
         fruoWACVhT5j0trILrMBa1T05wq525ceaFGa6CyWlQIHeQ0LPJVtHelyCKa6XuUCTygf
         lcUn6mbLspooWK/Yxguptu1bbJxQxWBWxMk2fRBgnnYZuz261q5foITgWLt6r5jp5dnU
         yXHLdqE3qGfdaaaVIFdMSOLNR6nO+5IREOrwIuaQBdfb/nn/x7lZ+qwCIIYu2MjKUurf
         pEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705398440; x=1706003240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yD4vpBkbRBMO9QGAEAJHw9dn2BZMsbgBrgpZ8rNI5cY=;
        b=JQCOl8QzQOBQY6Ej61uR7yp0vqWATBg/uaG4X3VHQED4jLbvbg7HQOsGNQjWr/vonr
         acwmm9S9bUSsx69AbzcPMyxFFxEnp4XT/qSZNB4Fb2j3k4IUWGNTQ3/7XrHmiNMqMRbg
         fHvAibzfHaL4fGnwEq4/nmL+Tv8TXOc0auOIknor66zpST9tx3M88B6BN9oe7hTBWua3
         KrYzODQCY0HOrAWzAq8WXDzRrIawoPBqyylalU7ht5X0z3VZ8UN1qXYug7U1Wi4nMwQq
         hBOGeLTiCk/DMZwZOwf6uUlHB3eruvHp5kKd7dglHKzaZKk1C5qavqjDsqMOCYPVEjiX
         pLzQ==
X-Gm-Message-State: AOJu0Yx9Eb4H/+ey6Cs+rSjnEFjLdtFRWNN8X0LYBiYmiLS3WR0pqzwG
	x5MbRyNdeMdFdI/PxmB7j89Z6u2dhQnKSQ==
X-Google-Smtp-Source: AGHT+IFjvPOBynz+YR0y065oyYGLiC5+MNqe7+ONsHxQG+/V3n4GPlfrFCA4E+HdaInrOPxr6eVnZw==
X-Received: by 2002:a17:906:7253:b0:a2c:7df9:9e3e with SMTP id n19-20020a170906725300b00a2c7df99e3emr3354302ejk.127.1705398439990;
        Tue, 16 Jan 2024 01:47:19 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id mc12-20020a170906eb4c00b00a2b85ef0ca3sm6219090ejb.202.2024.01.16.01.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 01:47:19 -0800 (PST)
Message-ID: <a9f369bf-48ab-4b6d-bd9e-b51e47bbe535@linaro.org>
Date: Tue, 16 Jan 2024 10:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] riscv: sophgo: add clock support for sg2042
Content-Language: en-US
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com, samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
References: <cover.1705388518.git.unicorn_wang@outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <cover.1705388518.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_014727_155805_27FB5A06 
X-CRM114-Status: GOOD (  10.15  )
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

On 16/01/2024 08:20, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> This series adds clock controller support for sophgo sg2042.
> 
> Thanks,
> Chen
> 
> ---
> 
> Changes in v8:
>   The patch series is based on v6.7. You can simply review or test the
>   patches at the link [9].
>   

...

> Changes in v1:
>   The patch series is based on v6.7-rc1. You can simply review or test the
>   patches at the link [1].
> 
> Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v1 [1]
> Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v2 [2]
> Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v3 [3]
> Link: https://lore.kernel.org/linux-riscv/MA0P287MB03329AE180378E1A2E034374FE82A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM/ [4]
> Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v4 [5]
> Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v5 [6]
> Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v6 [7]
> Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v7 [8]
> Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v8 [9]

lore links are useful to previous discussions. This shows what was at
v7, but I cannot see my comments and compare whether you applied them.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
