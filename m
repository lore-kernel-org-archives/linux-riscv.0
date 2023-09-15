Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D01EE6427
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6l2QYaXKpXvcGjHt+o9YmABWHtjF5bv4r6rd3ugIsA=; b=SchVx95/E8Jzws
	ORxvaESBxqk7gFY30bkLgn/A8K52MkPxaXbL/cxoIWJkr25z+4nupiwQTH0Dm13Q+Sdu19QtHLVjU
	pEoaX97Ai8ZzTeR8oQmMZ5SiLrmp5cRjdr6DiITaYsedcx4bGTRcbigIZJUoLnS3mr24iOwWABviA
	UEGWRe6IhF2otFhMxjBnkZngU1aW7ucY8bWii1fjIXPEYAINgfgVDKQhqbv4aJLrcvvz+J17hvNUJ
	K9X5HsC6GpZ6gUROCgFlpaBYY8NFMUXL2nmSMk+vV94AqvX+FjDKgEghx64yZS4mg8f9m1mmtPy+t
	X5r/owlTNehHFtLY1NlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh37K-00A0dC-2z;
	Fri, 15 Sep 2023 07:19:54 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh37I-00A0cL-07
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:19:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31c93d2a24fso1630966f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694762388; x=1695367188; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWppzIvE71bQdSmepb9Q7KfKBm9EUT935/Q3Gt6YfSo=;
        b=gFKHLcMkN5hftrBF7J4hEp2xQZ8S4bbP5NiUrTLbLoOjzlGAWSFPyUyvLO2/s32Fx4
         O5IIjY4jeDidE5+s2hhFNelq+zSb4hl9M4Z446jxYTbh4IWVTcwTja14IG10DK8/5Bzw
         oDrrbiuB6KprtFWcHJ7ro3KFTdg5XoSy+TDx4hLuLCiaCR+L7TxKWbWOcPJCLupGmGhY
         rUizvEkUvJ31YYattez6nOu0mYj73Yyc98Y6elPby5E57YxwhcOssgVVhyN88t0Txio6
         DGLTOulOd83dZzyp7TftzFbh1GYYfE1z+bHkX15Jri+wCu3IMAITedSsppQjThFi9FFH
         lo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762388; x=1695367188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWppzIvE71bQdSmepb9Q7KfKBm9EUT935/Q3Gt6YfSo=;
        b=ttLuA1xqWz7solGhyIkn1swj1ZFnJoKLy4CcaG1f8t3nQS1iUojVe+FDrcAB8hp8wL
         uxGK6vyChvrVH8HFwdEZOWaKUQ3EqG2eWQzEGIIx9rsbxOwSG1xQAWVibCNyvfhViHik
         T9ZqFWLNvI6uxun9pe3ap+/J5C9K0xDFCuefPULESlS+fY+ymnqO+LaDbWctT1IYnDYw
         Uf3rrmajRWeSGJgf1si8g2dKK8TXSjrL/Ogqu7udIWOEadax4naFMGvR8nOd7QS7afnX
         xXdavIbAlXdkvzVGLtkfXwfU7d0PhbFUw9ElcSxdNNjM6jpOuTf7Ldd76jCKXmuTIIa0
         i2HQ==
X-Gm-Message-State: AOJu0Yzt1IGKsXyZ5qzdRDo+x7E3Yu7NNSuqB4wlGFXhBRCHzaY0V8Ci
	X8O/vCjvoCM+jrOgup4IR8XJpQ==
X-Google-Smtp-Source: AGHT+IEtogEt5SzjYHhCTVd0LkUEWxZ8PBeGANpHgtQjRN4h7y4lYJIqFvei9LFkm8l25UnU9mIeyQ==
X-Received: by 2002:adf:ef8a:0:b0:314:1ce9:3c86 with SMTP id d10-20020adfef8a000000b003141ce93c86mr794603wro.0.1694762388245;
        Fri, 15 Sep 2023 00:19:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id a4-20020a5d4d44000000b00317e77106dbsm3622789wru.48.2023.09.15.00.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 00:19:47 -0700 (PDT)
Message-ID: <e087f579-198b-49b9-97f0-b642400feaef@linaro.org>
Date: Fri, 15 Sep 2023 09:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 02/12] dt-bindings: vendor-prefixes: add milkv/sophgo
Content-Language: en-US
To: Wang Chen <unicornxw@gmail.com>, linux-riscv@lists.infradead.org,
 conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, Wang Chen <wangchen20@iscas.ac.cn>
References: <20230915071409.117692-1-wangchen20@iscas.ac.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915071409.117692-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_001952_106811_82DAEA66 
X-CRM114-Status: UNSURE (   8.36  )
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

On 15/09/2023 09:14, Wang Chen wrote:
> Add new vendor strings to dt bindings.

Why? Where is the user?

Why did I got only 2/12?

> 
> Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
> Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>  1 file changed, 4 insertions(+)


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
