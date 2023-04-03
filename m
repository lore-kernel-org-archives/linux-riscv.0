Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA7EC76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 21:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPt3B9Co2jRbkNJCGlCIWtUL13PBckwTefiRRs7W/GQ=; b=uQwLB+7n43yEUB
	jG6JVw2K99ym8Zld6CscMUmGJx/3H7BcvY4jLWcPYMZQ6RRfLuWhrqvFx+0Rv9oz+WcDD3svFHn02
	oMEci2A7+oVTetcktO2MWhhYmWYVIhqUeG14TcGEisMc43FuXTK6CjJOiYP/W2tVrYkLfdBAWf7+s
	aI+PLx2h4RGcVW2+dLHYGIqBk4HuRMiA2rPQCyxg8dNTBTZC1LPRCQTXTtawtZgDjIvN0vQ7Ahpn4
	kiXH/CHW4LHhIkYFzN609T2gs0jokmaQsvi1du3/nR0vjkiHsg6pDqgffaiucC1EsTixoMiywpIit
	KKnXarfHlYNeJ5NGfv2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjRug-00GwvX-1w;
	Mon, 03 Apr 2023 21:40:30 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjRuc-00GwuY-1H;
	Mon, 03 Apr 2023 21:40:27 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-17683b570b8so32339433fac.13;
        Mon, 03 Apr 2023 14:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680558024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjyuESymcsR2VMINdm5Bfho26ybLnXPxoDubHNZ3lbA=;
        b=URxzkaheelf3j0Hn5svw3Q6xY0QUoS0q/W3uilCjV9XcFv7TXiiIl9mwJMeOlDN2gn
         yov25g6xq4e8XXRDXZMGKtl/sbPdfB1rwYyTUhNNwItZwQ7tuksrtju9L2jUx5pJTt+o
         LPd9ZjI8eyl0qdnZ+34rHfnzlpYCD5HU5JflGxY2iBg6px+zXgViK4JhRGViqKrVwriK
         m05Mo8CW+FGl7qXVrDTXmkjM1gvtdYCS9RXz3IHzAAT/1nlRHS/AIrjinhkXVtLRuYWJ
         cVxAVRXvikVHC9JQjcBq+9+UCZuveaKhsARV/uhmmOVnwNwP2jEul/SvkT6+3pZJWXBx
         ImRA==
X-Gm-Message-State: AAQBX9fEcqKXuNnY9Z44oxElbOf/dgJr4Dz/FTMeuVRTkFpbow7gvaCG
	NZ9AVjSRRs1UnzrKCy+LdA==
X-Google-Smtp-Source: AKy350aFlhW6NPkDPCD/nqbhHu6uFB2MQkICizhIFFbEPL5jfztjWv/9j8uFDgl83EMtCrKL01hYiQ==
X-Received: by 2002:a05:6870:b38a:b0:177:c013:9dac with SMTP id w10-20020a056870b38a00b00177c0139dacmr366185oap.48.1680558024171;
        Mon, 03 Apr 2023 14:40:24 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d11-20020a9d5e0b000000b006a3170fe3efsm2942956oti.27.2023.04.03.14.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 14:40:23 -0700 (PDT)
Received: (nullmailer pid 1920507 invoked by uid 1000);
	Mon, 03 Apr 2023 21:40:22 -0000
Date: Mon, 3 Apr 2023 16:40:22 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, linuxppc-dev@lists.ozlabs.org, Serge Semin <fancer.lancer@gmail.com>, Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Scott Wood <oss@buserror.net>, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] dt-bindings: move cache controller bindings to a
 cache directory
Message-ID: <168055794093.1918674.10704326537545829066.robh@kernel.org>
References: <20230330173255.109731-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230330173255.109731-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_144026_456948_CC15DF4D 
X-CRM114-Status: GOOD (  12.74  )
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


On Thu, 30 Mar 2023 18:32:56 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> There's a bunch of bindings for (mostly l2) cache controllers
> scattered to the four winds, move them to a common directory.
> I renamed the freescale l2cache.txt file, as while that might make sense
> when the parent dir is fsl, it's confusing after the move.
> The two Marvell bindings have had a "marvell," prefix added to match
> their compatibles.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../{memory-controllers => cache}/baikal,bt1-l2-ctl.yaml        | 2 +-
>  .../{powerpc/fsl/l2cache.txt => cache/freescale-l2cache.txt}    | 0
>  Documentation/devicetree/bindings/{arm => cache}/l2c2x0.yaml    | 2 +-
>  .../{arm/mrvl/feroceon.txt => cache/marvell,feroceon-cache.txt} | 0
>  .../{arm/mrvl/tauros2.txt => cache/marvell,tauros2-cache.txt}   | 0
>  .../devicetree/bindings/{arm/msm => cache}/qcom,llcc.yaml       | 2 +-
>  .../devicetree/bindings/{riscv => cache}/sifive,ccache0.yaml    | 2 +-
>  .../socionext => cache}/socionext,uniphier-system-cache.yaml    | 2 +-
>  MAINTAINERS                                                     | 2 ++
>  9 files changed, 7 insertions(+), 5 deletions(-)
>  rename Documentation/devicetree/bindings/{memory-controllers => cache}/baikal,bt1-l2-ctl.yaml (95%)
>  rename Documentation/devicetree/bindings/{powerpc/fsl/l2cache.txt => cache/freescale-l2cache.txt} (100%)
>  rename Documentation/devicetree/bindings/{arm => cache}/l2c2x0.yaml (99%)
>  rename Documentation/devicetree/bindings/{arm/mrvl/feroceon.txt => cache/marvell,feroceon-cache.txt} (100%)
>  rename Documentation/devicetree/bindings/{arm/mrvl/tauros2.txt => cache/marvell,tauros2-cache.txt} (100%)
>  rename Documentation/devicetree/bindings/{arm/msm => cache}/qcom,llcc.yaml (96%)
>  rename Documentation/devicetree/bindings/{riscv => cache}/sifive,ccache0.yaml (98%)
>  rename Documentation/devicetree/bindings/{arm/socionext => cache}/socionext,uniphier-system-cache.yaml (96%)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
