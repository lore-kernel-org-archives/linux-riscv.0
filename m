Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA1BC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 21:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zuAChEuzauFcTjlOUgnAjgcG0r0qXhnRkV4Xejh+7lI=; b=ZauTFVjD5/bTSo
	TvfdI3ojuKhIqCus9IsuK8wf3rd9sYkwo5p74Jlsz6gJ/aLJ8SMY3fRTo1jnB6jLaL4g8XdDL20RH
	Zxeqb8yw0BeuQTxHIKXusLvWBWvGRMOLS9u3fK3DYfKUsQ86rmEaMQCkajp4606sM4yjCzzjBRDFO
	EkC45xCqTxNqHOLd9TjTTIPz/aOYExE6HS2wmEt+D2XCLD1/Ez8VcmxPA6ChnyY6XoKkwvveA3YJf
	FPfAdFp8wlvG55XfLIKq3c9YIPSFvFQbSXMplk04p4g2O6vxJSsU/9lYM+yLqYTSPIF/s+CqpXbnO
	ZG/WmnYhPsfbflKpOK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3OCk-00BRwU-OI; Thu, 08 Dec 2022 21:13:18 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3OCi-00BRna-3Y
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 21:13:17 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-3704852322fso28796567b3.8
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 13:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=soc6B9tEjBwoJB9lGsc2dEEhtgB2qWgmXeK3gpYqXsY=;
        b=q+PuMpZRFA+cdjBHh866YIQm0c38cAAl/UjxGeBl4OmlT+HR/AO+EDP8w4H3iDQOFI
         1bxoP7XR9Ix+xAhNsUpJ2ej06FGmLP5BcP0ggE/yH/flcVuMqLBU+925vO/g1sYzTdV9
         q1NSsNNa8is0K8ysC4+q66x2XisApu+g8UScZXUvdRSyVoCOmWHtUqwnrSHoHN8F68ul
         AzQdVMgjzmVb1eCPNpyfaSCZ+9ADJsQfncLoRQBjW9e+K7J87GeDFN18ez3MptEGiE8o
         YKKP2k2opNXGpT5UuXFwSolkjTLZWpO8KyDWptpK+Zua9RmvfVWWSisqnhvXwewo+7Cu
         JCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soc6B9tEjBwoJB9lGsc2dEEhtgB2qWgmXeK3gpYqXsY=;
        b=EmOt3PNqzYzx3NZt002R2eslxuNIhnWE1FG+kLkjCzabGURuhftlpbGueLK+atSM4z
         Er7KhyxxZr4zeyM1z+WbDoDasZzpEysYuu+6ZuDinLmVkLtVBA4RDvrq7HYSdoCeh/LE
         BLtBNswIa0JkMrBpKITS64XqNsCHGOOXTXel3WYssNyv+fwN1hptx2sA41lCzJQb8gYs
         Z5UroChfaa9usfOere8dqVnuXKw3F/unRSsbBozuIPLaoKDmuqBtbSYbDa3R6jcZ9O1D
         BYbg/Gx48ixnyp8z7Q1+Q8v1wGa9Rm3HsK4z/By6XAYX5FPU5o7e30uMbGrgOT4fX0XA
         9urg==
X-Gm-Message-State: ANoB5plRfI44N6IDaKSLlo66kWIE8ctIWAKDR1ajGQ1alCvxQxf0c1qE
	LaHLr+2weVbJe9CfS/i6XFWL49vWseqCE2MErOeVDg==
X-Google-Smtp-Source: AA0mqf5WRT4mHXfrsSBEeehzvRcsxHd7WGu3PF+0jUl9JAFmRJN5HORADxjGm1ZP1O59O1iaDIHHBzdX0L7xnrO4NGE=
X-Received: by 2002:a81:7853:0:b0:392:b19b:47e9 with SMTP id
 t80-20020a817853000000b00392b19b47e9mr9758426ywc.252.1670533995276; Thu, 08
 Dec 2022 13:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20221207131731.1291517-1-william.qiu@starfivetech.com> <20221207131731.1291517-2-william.qiu@starfivetech.com>
In-Reply-To: <20221207131731.1291517-2-william.qiu@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Dec 2022 22:13:04 +0100
Message-ID: <CACRpkdY6364RtQMgGAFA024Pb-9v6+xcTUJdH+-MvzooBGYnhw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Add bindings for StarFive
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_131316_187135_C2FABC22 
X-CRM114-Status: GOOD (  10.87  )
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

Hi William,

thanks for your patch!

On Wed, Dec 7, 2022 at 2:17 PM William Qiu <william.qiu@starfivetech.com> wrote:

> Add documentation to describe StarFive
> designware mobile storage host controller driver.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

(...)

> +  starfive,sys-syscon:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      The desired number of times that the host execute tuning when needed.

This is not consistent with the use in the code of the attached driver.
There it is a phandle, and it has three cells, which I am critical of.
Also this description is hard to understand.

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts

I don't think the syscon phandle is optional.

> +    #include <dt-bindings/clock/starfive-jh7110.h>
> +    #include <dt-bindings/reset/starfive-jh7110.h>
> +    mmc@16010000 {
> +            compatible = "starfive,jh7110-sdio";
> +            reg = <0x16010000 0x10000>;

No syscon phandle in the example: this needs to be added.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
