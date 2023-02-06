Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059DBC636D3
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXEir4Mcb7KovJQYLueGBWyqbX8xCgUD4aZCsf4Fl2g=; b=e4HINjhQ4BdGMp
	JalfXV3oc9dJgfyshrAu9GgowHHQhG90pDwax5PEI4MbZ+gvlRPLphqGszjLRXhj5ZjXCFnLDCX7l
	sKzJbTHLbyoenrjlLWMDHM69wQNyNFqLFA8ynAmhYXHKhfhOdCCvWQS2chALOVvW2g2kOXFyVCdpB
	ybf09Qa4vHlZ6qJOLFn/0KATvmPHsnUkBalggmetz5K6Ror9IrLU5hKvjs632labXOCVwSR1eKmPw
	sgq/UEN2LSseOMheq6GsI1HC0cV3qTUm/ff2/Cjow5kC7+prOn5BrUzKAZJ3KYk6TbcSkC8t7P2R0
	q505sg13eM5qlw4NzC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP4A0-009FvB-Sd; Mon, 06 Feb 2023 16:16:04 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP41W-009BsK-Sv
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 16:07:20 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-16a10138faeso9312418fac.11
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 08:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUYFUHd6K0M2VRLqa+pQ0iy4AsAh6s44qKhPHJX0uIM=;
        b=5r4iBC6XGDC/VYrgt4g0MD0Knn3LHlDizRwXvPxy8aqPA7Eamv0gTgT5zbR/O2k2NC
         TiU9j1H0xvtjx3VyLlPwsgYpe8mZoxLTWeLuECdN118suE/q1I7gVkosUmih2bSnGGyt
         RdxyU7/AL8JSWfVGWQDC/4e5tWFFYAXAQPnAr7Vd6Ot2wJwzGW1x6ZadUYgFfHAYW9h0
         HtAefsV/Zz+zPtrMgwKlD9EMr4BR1eNox6RxWGZf9r/E2GNOscC5bCs4AoOIVOttq5dH
         nmfCyYzxvr/rcuNDqhTzA7LW/tzj0AixcY3NxFuUDRrTnsCAV2iCJmg01AnJLmUKBEAN
         /7jQ==
X-Gm-Message-State: AO0yUKXxPg1QFQe8NAPLOeoIMJ69yrdB7ufHViTgqCx92wz5RZqJQ+e7
	3risu3OzT0G/fH0uqyJxbw==
X-Google-Smtp-Source: AK7set8FTeOCEtJ39OQ7PP71M+KY8FxvIZVQjRY913T0OytVnPbTdf3sQqmUTHhKJlvWoDl2eSck+w==
X-Received: by 2002:a05:6870:9706:b0:163:3283:f366 with SMTP id n6-20020a056870970600b001633283f366mr11056442oaq.24.1675699635269;
        Mon, 06 Feb 2023 08:07:15 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t22-20020a056871055600b001600797d1b5sm4241889oal.41.2023.02.06.08.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 08:07:14 -0800 (PST)
Received: (nullmailer pid 156485 invoked by uid 1000);
	Mon, 06 Feb 2023 16:07:13 -0000
Date: Mon, 6 Feb 2023 10:07:13 -0600
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andreas Schwab <schwab@suse.de>, Linus Walleij <linus.walleij@linaro.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jianlong Huang <jianlong.huang@starfivetech.com>, linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: pinctrl: Add StarFive JH7110 sys
 pinctrl
Message-ID: <167569963291.156426.9284511556590253143.robh@kernel.org>
References: <20230203141801.59083-1-hal.feng@starfivetech.com>
 <20230203141801.59083-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230203141801.59083-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_080718_967181_17E18F3E 
X-CRM114-Status: UNSURE (   9.81  )
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


On Fri, 03 Feb 2023 22:17:58 +0800, Hal Feng wrote:
> From: Jianlong Huang <jianlong.huang@starfivetech.com>
> 
> Add pinctrl bindings for StarFive JH7110 SoC sys pinctrl controller.
> 
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 141 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +-
>  .../pinctrl/starfive,jh7110-pinctrl.h         | 115 ++++++++++++++
>  3 files changed, 260 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
