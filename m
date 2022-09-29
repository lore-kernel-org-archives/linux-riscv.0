Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA080C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 18:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9erqv/3ISntvvFucPdOM7uRRMl2BevCnM2BQvQAKQeY=; b=EqfZ6Y1olB9myU
	k43OCviCpzqG7/hmEbjBAsVYHpqrWL1dwRBWjNMG8GKfA1cW0fFSJEMC/i6kztMZgM4cHVE9H7fxj
	7GU9ctNq9mtM/hMnJBSPWPPwB/tRPuMnCgoXMCdFI9gQgx56gaiS+cjBsOt+TexMA0+U8G5IIGDGO
	GQxz76fR6tfMk+lbYo2Jif8/YgJlzeguTqooY2JxoBwKsfAdbbmFdaU9utMPAMi0eC0nGoIXlZkTb
	ThapChybzwxR5F/22S0cGh49mUjOGCn8ts7JNotlNiZ/91uCDQ46zOikFiVsFAxN+epDWNqqd0HHW
	SPNSiuKQaGTW5AMTky/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odyAm-004tfO-1K; Thu, 29 Sep 2022 18:22:12 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odyAj-004tbN-5W
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 18:22:10 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-131886d366cso2772610fac.10
        for <linux-riscv@lists.infradead.org>; Thu, 29 Sep 2022 11:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=E1E+aVkZps6nOEgD+k57dmty/5orHNqHkP5Ys8i20lo=;
        b=fgUPu2A+pIno3VPZMBH2mPu6zLpOa68loEVPSIrjC2ZKvzLKaewE7LockxcGcp/3Ai
         TAmSZMaysh5O3YdbBZfy8IPsT2xEX3+5Co/frMDbhSXSbF3Op8zJws6uTsHX5F0SBc0p
         HzISfqDotKzQZmdEiBfLdbUnYmkU2YGHq7h22lA+EdatYf2ksyLeDK8MgGGShwWXepGw
         KRdih7eYpA0c/anr32R0mhwE/MX0KE7iWGpfByetM497TrVcoH75Qm6v1KMADLVG5yX7
         qbONf0UMw/DA9m8LQE1uFfzwM3TLR3Vq9f9jG8fr1iixO1ZrnoVmcn0lI07nCqtXnHYw
         S/2g==
X-Gm-Message-State: ACrzQf2js2fBBYdtIimaxLoYZ36XXo4kS/aOPyieFNmXEJxK+AEK+TUn
	y1HapiAHtfZbcygCY4gVPw==
X-Google-Smtp-Source: AMsMyM4PK1n2ewUg+rNJ24uv50FuD1odSQ6JC0CCIugoQsg1BgUKiJGYVAauz0ozKB3EAsP9iiimfg==
X-Received: by 2002:a05:6870:d0c1:b0:131:8c96:a1d with SMTP id k1-20020a056870d0c100b001318c960a1dmr8382943oaa.117.1664475718330;
        Thu, 29 Sep 2022 11:21:58 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h8-20020acab708000000b003511cab9cb1sm21121oif.19.2022.09.29.11.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 11:21:57 -0700 (PDT)
Received: (nullmailer pid 2518000 invoked by uid 1000);
	Thu, 29 Sep 2022 18:21:56 -0000
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
In-Reply-To: <20220929175147.19749-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <20220929175147.19749-1-hal.feng@linux.starfivetech.com>
Message-Id: <166447556924.2514425.231552070734010562.robh@kernel.org>
Subject: Re: [PATCH v1 12/30] dt-bindings: reset: Add starfive,jh7110-reset bindings
Date: Thu, 29 Sep 2022 13:21:56 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_112209_228604_C46A3DA9 
X-CRM114-Status: GOOD (  13.84  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 30 Sep 2022 01:51:47 +0800, Hal Feng wrote:
> Add bindings for the reset controller on the JH7110 RISC-V
> SoC by StarFive Technology Ltd.
> 
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> ---
>  .../bindings/reset/starfive,jh7110-reset.yaml | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/reset/starfive,jh7110-reset.example.dts:18:18: fatal error: dt-bindings/reset/starfive-jh7110.h: No such file or directory
   18 |         #include <dt-bindings/reset/starfive-jh7110.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:384: Documentation/devicetree/bindings/reset/starfive,jh7110-reset.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1420: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
