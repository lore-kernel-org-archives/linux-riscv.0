Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B009C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19p2q+Br0jTGduw6v0D6AGc1rfCwjkZKq8vEegFINGk=; b=GnQ/Y1ACiG/Huk
	ruIkKn41WRdPC7AFfB6SBB5oP04igXn4g81sAGg+b29AcQHyD7DtI361MIb0il9gqCq1iVskqUB3x
	Nc7F6zvG015EEcJ5ScM4run1k5WB4fyFdu/qlDsrJxtNF318aPgtivSDkE/LBXtwaO9FXer/Ev2Ie
	YYengponB6B5dSj83sXyQ4npMmW/z7iPrkFSQZpeXCgqUpJJnQfYcW7ZfJsZ/WomzyVTNUsMxJ9vb
	9cIEuDQ9vjMCvpP0X2YgRn5Ggited3C4NrQkQx44HLUw8sf4QNjAHc1uc8qwsv0hg/vD2L9Qo/PqB
	8mLrxesMKcmSZVsh2zrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLK2B-00DNfr-2E;
	Thu, 04 Jan 2024 09:29:03 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLK29-00DNeE-0d
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 09:29:02 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a28d25253d2so31289966b.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 01:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704360538; x=1704965338; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvKedpzjdbUqqpWsx0w08cM96+nsatTobkXdlZaM6SQ=;
        b=D007DlR/E3hf4XNmTtxpiTMBt8WJOnpO8CKMMlCCI7ZHj/IVtOhhEkGi12c+fYU0gt
         sWcgtNMR5rTulCdM50X/txuBbDvT/FWXhge7WHegDC4pLA2bjULxWN2tiRhOyhjewf0V
         lqwNV9IndI+p0oksgqia6NofNzPkZL91Yq4r/zYltdGZeELyNcCceY/4+i1AB6JohsJs
         iBupysMtSnq5tFAOtympHqwX/s7PLFCJnAMIN1at7L0UGm8F9cju23gtMWXO+xVhVb4+
         pwqzxyl9nAytoXprKQyPqoUAuiivaTGVIswnHGmLLg7T4Gdnp0OE3QhZn03Tbb0EOt8f
         iYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704360538; x=1704965338;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BvKedpzjdbUqqpWsx0w08cM96+nsatTobkXdlZaM6SQ=;
        b=iARuI9xk115FBUs8TtbMISUod4qSfbjgFiVHgZVACvrO9Zk/anZhXJGqCjwLAqNKK5
         jqv0TKElp3ByBKH5sMR4fEvNJr7xJZ62wVzpXLghmUcnWRGVL4iO3NTRl+n8ZSdUEG3e
         SVLBL7vTYhWzIf2zNuEqImJvoG4hu1cBxFhDTagXiPctbqFTqyQGgqmFD/7Ty/ZCoeWX
         WwCz95XeLA0SwXUdou49b6M6YsghIjhP6Drx2y10PtYwlCgXqtqKuiLUpoeooWPcIBVQ
         PoAtzXxuWLGEolKU89bo5L7yankN/1iy8/te6t4FAhRJXk4INUPy/Uy4RNgZv9ir7Bvk
         GVlw==
X-Gm-Message-State: AOJu0YxlVqa7f76ytlaPd1pCKtLSka/4kyV4FVpZgUjiaqih9u/Y6qg4
	IJbXm+sr7RM+sMYFQ5VYosSf7xsLD5W8u8jXgf/pDu1eVqI=
X-Google-Smtp-Source: AGHT+IFX6d/hf4qADPdyTB6cGWUeu+PuU2X+JCrLAoJycR8jmkHysidP8MbdQerxBYKuel4j1dFPWQ==
X-Received: by 2002:a17:906:32d6:b0:a23:5cdd:fe31 with SMTP id k22-20020a17090632d600b00a235cddfe31mr167421ejk.117.1704360538417;
        Thu, 04 Jan 2024 01:28:58 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id f17-20020a170906495100b00a26b057df46sm9910107ejt.126.2024.01.04.01.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 01:28:58 -0800 (PST)
Message-ID: <46155b58-f952-42d5-b607-8a4e83a25ac9@linaro.org>
Date: Thu, 4 Jan 2024 10:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mmc: sdhci-cadence6: add DT bindings
 documentation
Content-Language: en-US
To: Alex Soo <yuklin.soo@starfivetech.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Yangtao Li <frank.li@vivo.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20231228065322.1176351-1-yuklin.soo@starfivetech.com>
 <20231228065322.1176351-2-yuklin.soo@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231228065322.1176351-2-yuklin.soo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_012901_265399_7FC7C3BC 
X-CRM114-Status: GOOD (  12.21  )
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

On 28/12/2023 07:53, Alex Soo wrote:
> Add DT bindings documentation for Cadence SD/eMMC host controller
> (Version 6) driver.
> 
> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>

A nit, subject: drop second/last, redundant "DT bindings documentation".
The "dt-bindings" prefix is already stating that these are bindings.

Basically your subject is pure redundancy.


> ---
>  .../devicetree/bindings/mmc/cdns,sd6hci.yaml  | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/cdns,sd6hci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mmc/cdns,sd6hci.yaml b/Documentation/devicetree/bindings/mmc/cdns,sd6hci.yaml
> new file mode 100644
> index 000000000000..97e28d720c7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/cdns,sd6hci.yaml

There were several other patches adding this, so please consolidate the
effort. You just duplicated a lot of code.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
