Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2B8EE6425
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRyGx3Aj48xft3HMExiSciipWv1LPVI2KlIkgKCtxw8=; b=0eK+aKBpOiVkSu
	TJyxJJ0muu7Q2iXFEB0nK2C1IBfQpe0ihc7qJuM6iF2TSmKrcettEvlFebQb9L83FwJuUyki3QuPN
	BN/PPTNwXHCHNhtOUYgI4dxfn44rfdLuOXk5pUZJjNB5hshoCacXKivprTKoZOLjgNcVybxzcoeZw
	MK8c3QZqFWQDvR88T61zDkSdICJl4ELO78vsMm/CG1pENZEfni+M4AmU/cZv0dhPYCKN8QGpLO78N
	2/9jfY9QncbbYa5dxCG6KyF2a0cOBXVlLiEaZDUgm5ykoGICISLhxUI296dZSH5ABrKYLTrdkW67O
	dVVz5i/BMIk+fWx7s3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3IO-00A3Dd-0w;
	Fri, 15 Sep 2023 07:31:20 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3IL-00A3Ct-28
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:31:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31c5c06e8bbso1700091f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694763076; x=1695367876; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=psUYRiGcbU1OwB/5y/R6sSINX0z5CsdjGxmapbhxkEc=;
        b=Zj4LI7DaEE2xGJQx/EIhdX4eeCVgTCwV0HLs5V+R2kn2UG08m6wEGW8FUWNa5O1+l9
         v+5+eBcbY7+MCVVzYwBiX3YRE1qzHNIzYZzO05rCJN0uxt+XZuYBPcay5nxYpFpJdHd9
         J5M6lFyF3haIfIK250cy1keAPTazoa0R5bYXWNXvgWsLX6ufPTW9HcKoLXF1+LzgL0SI
         bZjl7HOSh+JEuUApfoXR/qPrIZFdIT87v797bvhLaaZVv3SKCUx+HJUk1pAbfTG8arX0
         NybGPQVYDZVvOIuEIj0wgqSDU2+TgTtCJ6uAbmxN4ujzhR4S5FUukzqebhsigX4ND9RT
         ssYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694763076; x=1695367876;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psUYRiGcbU1OwB/5y/R6sSINX0z5CsdjGxmapbhxkEc=;
        b=G7THxIDzDQMcVWXh7jbzhwaRnLhPqS5LFhSrCmfG4RvzEWBEMJ6TZVTvwpv/OnNIVC
         098geavvOO287UCSxS1PFXLyfjkvrNFKUVmPuj8d14PfRyPYHjp01kZS3nIdyiHa6GYU
         JuFJ4thGgEqhcaz+6sFgaytWvVOlzh2T3y6vDmrztPDgs3sjG7HYndrDGN5WycKXtXvj
         nkGTBERyyQCyHiMSbhjau7eCsHV+754S2jR0b72R7qDyFDJYizQcEf4ihwxcsjr3hDu3
         Kp33+ZXIlFx+WgXiXTHPQsf64ljnSz8ho+zjgNLzg62qttqk4Wfz1sXSeKVgrVDERxMi
         GgNw==
X-Gm-Message-State: AOJu0YzyeMp12VduiTgimgL4l5X1tIs5SzJhKz3ZtXZRjwbimdtLrwx2
	bV4Lyj3tR9kr+H0tbwVnkK1fYQ==
X-Google-Smtp-Source: AGHT+IEzcssOytMiuWez42gEHao5Kw2NkuxenhdyXU5euFPWe8NZ4zTEcTm0nySnu4uCOWK/ADVkQA==
X-Received: by 2002:adf:ed8b:0:b0:317:7330:bd82 with SMTP id c11-20020adfed8b000000b003177330bd82mr772813wro.8.1694763076095;
        Fri, 15 Sep 2023 00:31:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id e11-20020a056000120b00b003196b1bb528sm3719683wrx.64.2023.09.15.00.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 00:31:15 -0700 (PDT)
Message-ID: <0c059b65-181f-3e87-fb51-64435ad5bc0c@linaro.org>
Date: Fri, 15 Sep 2023 09:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 03/12] dt-bindings: riscv: add sophgo sg2042 bindings
Content-Language: en-US
To: Wang Chen <unicornxw@gmail.com>, linux-riscv@lists.infradead.org,
 conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, Wang Chen <wangchen20@iscas.ac.cn>
References: <20230915072242.117935-1-wangchen20@iscas.ac.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915072242.117935-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_003117_702133_6A8B9B62 
X-CRM114-Status: UNSURE (   6.80  )
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

On 15/09/2023 09:22, Wang Chen wrote:
> Add DT binding documentation for the Sophgo SG2042 Soc [1] and the
> Milk-V Pioneer board [2].
> 
> [1]: https://en.sophgo.com/product/introduce/sg2042.html
> [2]: https://milkv.io/pioneer
> 
> Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
> Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>

Fix your email threading :/



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
