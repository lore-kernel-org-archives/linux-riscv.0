Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CE3C43219
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 10:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2XumJwfHIJ9dzMLIOdJvTPSdm5BxI3sm0qmN/DkFMo=; b=j56S/HCbaepQXU
	UCBWkg2Eeam+aQDIh23enDnizNE+qOXWkHkCeX2xl8EMsWeQscakjm94iOeM35AivN1ZqTQ5H/Sab
	t/vHWnaq/YWl/rHbr/0/HSiYL3Y7FLJ1NN2d5/tylRQ074/53Mpk8hQ6vAgjGv6UkXbF3zvk4em+P
	4WkrLQzPVt7KlRdFMJ02JAXpvp0DZLN3zwr5+r1KFMBQ7uDk1kTtDrlyXOKLJtZjEfn9y62Vtk1Ou
	fCIremkWoLycCqnBxZKrtPsmzuLAPyeZEjyIX/X6/ssvgNS2Qn9jP1DpaYeeM4/ugN+ogsI8eH5BK
	4LOJvDRjK+oaELD/u6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3kN-00C7Lp-M4; Mon, 21 Nov 2022 10:09:51 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3kK-00C7JT-VR
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 10:09:50 +0000
Received: by mail-lf1-x12d.google.com with SMTP id s8so18060642lfc.8
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 02:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3YXumFsPw6lbI2IHMtFObomGfN5gHhNwcdgLP+EhJk=;
        b=jMQDqklr6GJhwiLPT9kPQTPmexECun/4HMUGVLBEqBvYISI8XEuWKkoKtj+dKN2kW8
         LnyRPehM4XhFvmvIv7o8L1T7/0ugBPOT9oMyWvlsqngtdLPsdhc4DftPtJVqPwZ3ajMF
         zB5BQky4xx8qaU/c7Wuq25mcd7cAeoJdiEwFZ1lptGOkknfifq8ztal99bBbiWwkWfeM
         5wjxp2czMpvgnJavWNh1b6EWfwNwQ9tncKAkyrzSefAaBJDi9YSwOtA9aR826sp/4z67
         iIIsu0EgU2jqZF5JijtlmtYruvIVVwTIl2+CscNbK7DLfXToq2+9aMY/qiUQ8lg2sfEx
         hQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3YXumFsPw6lbI2IHMtFObomGfN5gHhNwcdgLP+EhJk=;
        b=sdmfOLaeEbPXdYCDPokVkpeKyIGumVyE+vXTYN6HKadoUKsS5MMjb9KS67s/6rhBiC
         mubHeucRNdAXkJH7NUzdDUWQ3qgLjCGL5l7xyN2uQMBlcFVYZMRalmpeRTA4UCYL8LJT
         1+1KOmdbwQWXIR+0geYfERVIqeYYu/qF0Kp2c+2BR12DgPe5vdyS788uGI4PPTpEPTrE
         mTsoLtjRFqjXm0KUxgWXsc9dSjBxOl+1qp/bkEK30hBjN/ScHNm/+w5Y6XEkilDzJw50
         i+jBK/fiWOenCuU7pszsB4kaPESEpszCh+ZOHVeEwFHf1g0xmU0PQ8j990s/bI/A+y4z
         4oRw==
X-Gm-Message-State: ANoB5plNZPF6jqoTpESrzJlqEgr9wKBcvk6vWcZsWtEA7SFEmX0MeW7I
	Fd45zLMpm5110GCwM5w6n8oyXA==
X-Google-Smtp-Source: AA0mqf6DBfrEF5O0+Ktio6r059/CuVFDgOS3eqygqMtw5mUk3rI1/U6Kjd8+p/QbRjRwyx2S7laiMA==
X-Received: by 2002:ac2:5e2c:0:b0:4a2:243a:ef6e with SMTP id o12-20020ac25e2c000000b004a2243aef6emr942157lfg.454.1669025387158;
        Mon, 21 Nov 2022 02:09:47 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id be34-20020a056512252200b0049e9122bd1bsm1975586lfb.164.2022.11.21.02.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:09:46 -0800 (PST)
Message-ID: <9d287ce2-a826-5777-8d88-8e05e6924670@linaro.org>
Date: Mon, 21 Nov 2022 11:09:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/7] riscv: dts: bouffalolab: add the bl808 SoC base
 device tree
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20221120082114.3030-1-jszhang@kernel.org>
 <20221120082114.3030-6-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221120082114.3030-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_020949_038295_CFDF7FE4 
X-CRM114-Status: GOOD (  13.01  )
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

On 20/11/2022 09:21, Jisheng Zhang wrote:
> Add a baisc dtsi for the bouffalolab bl808 SoC.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/Makefile               |  1 +
>  arch/riscv/boot/dts/bouffalolab/bl808.dtsi | 74 ++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ff174996cdfd..b525467152b2 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +subdir-y += bouffalolab

Nothing to build there, so not yet.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
