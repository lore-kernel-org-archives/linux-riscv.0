Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C88C47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 07:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjFhUeUOe7YUeBOd7gIXGJC7j+f+/uXbFmlUOFeqR0I=; b=2eHTrSnWpqK0W0
	w+/ns+xRDZG8YnEaOJG+CiBNIN3AUUvKmnNgOMjr9LY9YDZRaBK2dW/PN4WiHc1VmyFF7Ia2fSmHq
	mzBPvH2SV8cp2Ukuo7dXo10j8hAYnzeS1wW8zO3sCJpJTlaSeXNZpY34ZLC50jDXbSpT6H94ymKPs
	3M99jnHCdfZb0KK9ChkYqw/yIbBanAFaKg8y3EZ6aNpw7Kr/cCQkxVbC6zvOyIsLf6oFK+F+BOC4g
	akw7krM1/2d1whx54hWIvixBOeP58X7/HsFiIhnaTWKKnenJEKVZ/ZbwMARnamVB9nK7ctgX/asih
	6+bRYUzlLzEhAM8L7HRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPeCR-00BIFV-2G;
	Tue, 16 Jan 2024 07:49:31 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPeCP-00BIEk-2x
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Jan 2024 07:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D14SLbjX1GLnHuhrFGkm5qKGMOubngFldvMxw9TZU/8=; b=S3DkldkGyxTTNmGxrtONYOIGTv
	Himxf9tlGYanGrHtK7yXjdlPPxx24gLmpDCZgXdmzeT5wyifOVD+5Z6VKXltVbqQzXj4mqovTgFT/
	S5M5M8hfCK4TNcd5DdjebW8VVC01NYgwWPR0OchezkXJrva++8EZOj9sb9AhTI9kmAIYob8cl+XBy
	yMgUYBO+lTBBTqGUUzPY7wRO0ftB3AbF1YUd0nQlkDRPVRsF2/PesK8NaTnC6GXWQAPEbPjzrfWGv
	pwJVTkI21tTgRNGIKcdWGFI9khAprgZN8coNPlljILobrPjg1ZZarKGa/mugy0ubrWbRdsY3yBdRg
	YVu/dMbQ==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPeAH-00DpsO-0B
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 07:47:19 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5534dcfdd61so16826476a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 23:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705391175; x=1705995975; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D14SLbjX1GLnHuhrFGkm5qKGMOubngFldvMxw9TZU/8=;
        b=K+EQxj1azR0HNIc7+sXN8NI04TXvNR+/PWMblHZpakiv6jnz4nxlWMG3iMMvFbynsI
         W4X/RjGEB+8fXefyDqbV9i6LDetDHKUq6O9cS8NEBsQH9rZmTHFwvL44ROgpMZFGnS8D
         UOqkq7Oq7jgkSeSCS5xY0v7YP8Z1JIvu9AeJJVzrThwaA/q9pzJkzYjR6QZ3UAzUmmbt
         kDUuHkRvevdyhNuWnuhN2ZtyTAYiq9L3z7kLBc/lRBh80+r/10hXE4hLEVlZYu29z1g/
         FgNAV3IIYCvXV+4R3svXa4dfnJFpyRQiS6HvBi+hyJgEut/ezdsx0+g7W3kSrf0ZTZak
         kNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705391175; x=1705995975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D14SLbjX1GLnHuhrFGkm5qKGMOubngFldvMxw9TZU/8=;
        b=iVKjGNJOzBRpaP0hPfR2XAJQv4dAdp+Bh+TFYSOBgQBiE+MByaXGfmE8Rcoz/wgp/U
         23U7iLD9MhhCgf72kozrrPg7n1ZDnTlj2cb9YYcRxjsdTIg2k1Ry/AErovZKga4xSduB
         X6fRHbtAYh6TL8Ldb5QawQNXMIy51QWn4LhEfkV6wzmQ159ddmeIFd3VFJc0wtkz2ska
         0pMAJwMHMTopYW+UQBFrQHhaKLvrkbl3FO7GWYevnzVKgoaAcNbCkBSsfjK55waCARh3
         8ix5kNEn/zOE0Ec6SB/MUwJkh5fCYiiefE88GZWI8sxPrspj+l6gQXFArifoxza2jS/H
         I84Q==
X-Gm-Message-State: AOJu0Yx7DQhBIGmsY5xHXYjzukdTgxoPCSo9QgUiAxfJqYAJIbA1IHoI
	ZUAEYMOq9/me29lBbByOZoMCmyIoaqU7vg==
X-Google-Smtp-Source: AGHT+IGtwjltligbfM9m1nCKR0fW9XHrubE+D9XLK0jeUszKhMCwmkXedDYerKE6e9uiM0EAUNvozw==
X-Received: by 2002:aa7:d5c7:0:b0:557:2be5:6620 with SMTP id d7-20020aa7d5c7000000b005572be56620mr7141794eds.23.1705391174991;
        Mon, 15 Jan 2024 23:46:14 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id n13-20020a05640204cd00b0055971af7a23sm1159774edw.95.2024.01.15.23.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 23:46:14 -0800 (PST)
Message-ID: <9a1c77f8-bcf9-4cbf-ab51-694353dd0ef3@linaro.org>
Date: Tue, 16 Jan 2024 08:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Content-Language: en-US
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, alexandre.belloni@bootlin.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 chao.wei@sophgo.com, unicorn_wang@outlook.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dlan@gentoo.org, inochiama@outlook.com
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
 <20240115160600.5444-3-qiujingbao.dlmu@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240115160600.5444-3-qiujingbao.dlmu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_074717_386419_E872A4E9 
X-CRM114-Status: GOOD (  10.73  )
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

On 15/01/2024 17:05, Jingbao Qiu wrote:
> Implement the RTC driver for CV1800, which able to provide time alarm
> and calibrate functionality.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> ---

> +
> +static int cv1800_rtc_probe(struct platform_device *pdev)
> +{
> +	struct cv1800_rtc_priv *rtc;
> +	uint32_t ctrl_val;
> +	int ret;
> +
> +	rtc = devm_kzalloc(&pdev->dev, sizeof(struct cv1800_rtc_priv),
> +			   GFP_KERNEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	rtc->dev = &pdev->dev;
> +
> +	rtc->rtc_map = syscon_node_to_regmap(rtc->dev->of_node->parent);
> +	if (IS_ERR(rtc->rtc_map))
> +		return PTR_ERR(rtc->rtc_map);

Why do you take the parent? Your bindings say this device is the syscon,
not parent. Your DTS shows there is no parent syscon! This wasn't tested.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
