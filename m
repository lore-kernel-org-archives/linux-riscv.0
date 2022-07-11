Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C82DC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 23:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qEi6FVwPakwv8DXPV+jEJ7YXNRypQtv+OyTM93ZFu0g=; b=CMcGjorTssLaZu
	YKNCbe8fMD8fWJOLZcj2255XwOQTCQFW7Lorq34xZIiu7o6Wph3YRro5Y7JO1lI4gXPbTqj6j4+/V
	Lbo9CBXeNR6s7q6sIVelpDnR310nSU+W4djNNxzKYl8GlcCJig3ZNQ0EH3Cyx17p+rYULRmzC/EE/
	mYF5BOai/U2gtqDqjOmQ5LBYEQIXR3si5MYn2g2pLWWvZlFsCDAOQpst5cRs5JRe77mcDR/zx1srw
	Rrj1+ImzCmViMUYPdwQ6Ut89+fEs58cffoFS7/10cw79HQWmsdhzP0ALLELVJrMncNBdpvI0n14GQ
	RRgiklt7z38mjfIjzeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB2UU-005Ucq-QD; Mon, 11 Jul 2022 23:06:58 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB2UR-005UZv-Ql
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 23:06:57 +0000
Received: by mail-io1-f46.google.com with SMTP id n7so6350390ioo.7
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 16:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jKnFEt3v9Ij4sGBUlCkc8S9Apq19vugwTmTpFoHS/4U=;
        b=E0r+OMdE1CWoV1QMzLO2h/jEAD6J650AOvRYu4c593gj4ZlKXPhctQNL+3/k2bKNTr
         B9EJwWZpxi9FQB4v1KjNQ9uFSJkBMiF6U7ahRAuTWGYfC9+xuvKfbzIoADv4OJb8nWIM
         S0a5BhHEmDrbT0P/JkkQzI9gtCdruvVL2UWIS/WbZbiQr+Yx5+nSRp9AxscKKtooQJAm
         ZIL2AOiz3iv4xqQiweuLLK1x3s/6v037DYeG3L6PkGi2AnqRxug2koKhPsTBz8DHP3q6
         NkyFPkNhp1l2wuLUzcEJWjuFwUPm8QYj5OR6gxiMs0C6pQD2jq8nkY46AaXrMyJ3GCdX
         Vc8w==
X-Gm-Message-State: AJIora+qH1r3BzuEK1SSsEpt46jPeOmtuOcjNw43SjT4QEwBHQJB/sYP
	m/XrRfDmJe9WZb0ndULdSA==
X-Google-Smtp-Source: AGRyM1viSKiUNw6YfRQlp5Lz66WqirzHrgbr9bZGtdkZjNdVo6JOFKiC/ZhAfq1WhdMv+gAYL9IYxA==
X-Received: by 2002:a5d:8d94:0:b0:669:64ff:5172 with SMTP id b20-20020a5d8d94000000b0066964ff5172mr11088052ioj.163.1657580813735;
        Mon, 11 Jul 2022 16:06:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id y12-20020a92090c000000b002dadcb25d4esm3090474ilg.59.2022.07.11.16.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 16:06:53 -0700 (PDT)
Received: (nullmailer pid 438820 invoked by uid 1000);
	Mon, 11 Jul 2022 23:06:51 -0000
Date: Mon, 11 Jul 2022 17:06:51 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/4] dt-bindings: pwm: fix microchip corePWM's
 pwm-cells
Message-ID: <20220711230651.GA438786-robh@kernel.org>
References: <20220708143923.1129928-1-conor.dooley@microchip.com>
 <20220708143923.1129928-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220708143923.1129928-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_160655_906875_F0FF05CF 
X-CRM114-Status: GOOD (  10.37  )
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

On Fri, 08 Jul 2022 15:39:20 +0100, Conor Dooley wrote:
> corePWM is capable of inverted operation but the binding requires
> \#pwm-cells of 2. Expand the binding to support setting the polarity.
> 
> Fixes: df77f7735786 ("dt-bindings: pwm: add microchip corepwm binding")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
