Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECE1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 12:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l48aJd1px86x7pjAGwYM9VHtjp2/E23+bnSg2oIbeLs=; b=tDcLuk/utynSNT
	M1EpP/5x7YHmRTj4F17kv1clbjsSxH/qHT3xODraoq0abVgBt5UhXRmdC23gZGGQ8duJtl0klXZY4
	ky0lrZZI8HNV9R9KkWOR7cpiGM5xsLckUP0NyS66sWI+/VYlA3NKI7ReDZDKsOh4gOkZ5IymiSIp0
	RrgD7//vEOXpkPjOFnm3oM0Gxmfz3Z9OtVM26WufCW3ECcKdmE3YDD9fuTQtzN4bCCz05oeTsfRKy
	5s9XnDe8442WR/HIjNZIRECzzCud9wazpUjjzBIyUx29mFKpEfDSLVOu8CPNYPD+msYh1r7clkryw
	8AOANFcvl15pJlYME0bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeEwN-0094u8-GX; Fri, 30 Sep 2022 12:16:27 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeEw8-0094gB-H9
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 12:16:14 +0000
Received: by mail-oi1-f169.google.com with SMTP id j188so4575555oih.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Sep 2022 05:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/065kmeBBgsqY7mGeD3pqFv3I0PvMxNoHX9Ksgu7T30=;
        b=3t/HP5/ErbclXpcG126qnWuhBXVZknaGq5BiWuokdvnLKHVNOwreRTtOdICHjLCcDr
         loTA19FCvUsQHAe0qn9kxvyOrjlc/ScVZ476gfh0mteeNQrDc80uRGBIGfZMFD2pzNJq
         oRV7Kqzfr/nDykC9PAGdkQ7k0z3z0BcurtTXe5zt5FFZ/88IIf9gfw1jUDHm7DlPxrVk
         JlKaxgpJxU9K2JZMx41v+gyHQ+6XpPNp9ppTQQixlmMRG9pdzDGz1PrttRDFhy+kYJkg
         ge8NzCv3N6JNA8zXzrZMTXG26h6uv7mP9WVHfm1mlZeVi31fPOIRFwe4H7M/3vuuuX+u
         tKFQ==
X-Gm-Message-State: ACrzQf2921SmIDb4UmPYSa08Y4wMjruJ2AmA1tevVxir2qDd0ckzFKA2
	EmR3pl6qp53qKT/a9k/p1w==
X-Google-Smtp-Source: AMsMyM6b4kW54HB8pp5Pi4ELHpIa42H84Xw0SVjZrdV7SOwG2N+Q7jofwCOuam7R8btNT4qq0a1f4A==
X-Received: by 2002:a05:6808:1a87:b0:34f:67aa:5089 with SMTP id bm7-20020a0568081a8700b0034f67aa5089mr9184129oib.108.1664540170945;
        Fri, 30 Sep 2022 05:16:10 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m18-20020a056870889200b0012d939eb0bfsm580825oam.34.2022.09.30.05.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 05:16:10 -0700 (PDT)
Received: (nullmailer pid 58498 invoked by uid 1000);
	Fri, 30 Sep 2022 12:16:09 -0000
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-gpio@vger.kernel.org
In-Reply-To: <20220930073845.6309-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <20220930073845.6309-1-hal.feng@linux.starfivetech.com>
Message-Id: <166453971800.15128.2899761905092626256.robh@kernel.org>
Subject: Re: [PATCH v1 25/30] dt-bindings: pinctrl: Add StarFive JH7110 pinctrl bindings
Date: Fri, 30 Sep 2022 07:16:09 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_051612_590177_0F541124 
X-CRM114-Status: GOOD (  12.47  )
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

On Fri, 30 Sep 2022 15:38:45 +0800, Hal Feng wrote:
> From: Jianlong Huang <jianlong.huang@starfivetech.com>
> 
> Add pinctrl bindings for StarFive JH7110 SoC.
> 
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> ---
>  .../pinctrl/starfive,jh7110-pinctrl.yaml      | 202 ++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jh7110-pinctrl.yaml:18:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jh7110-pinctrl.yaml:49:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jh7110-pinctrl.yaml: error checking schema file
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-pinctrl.yaml: ignoring, error in schema: patternProperties: -[0-9]+$: patternProperties: -pins$: properties: starfive,pinmux
Documentation/devicetree/bindings/pinctrl/starfive,jh7110-pinctrl.example.dts:21:18: fatal error: dt-bindings/clock/starfive-jh7110-sys.h: No such file or directory
   21 |         #include <dt-bindings/clock/starfive-jh7110-sys.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:384: Documentation/devicetree/bindings/pinctrl/starfive,jh7110-pinctrl.example.dtb] Error 1
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
