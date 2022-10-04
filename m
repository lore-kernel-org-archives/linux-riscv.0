Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2DAC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 00:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnSlcyR2OMKfp1V9y7LtoA4sYyOueJW4Irc5HWIPfUU=; b=v/teJRL/vRskoK
	Nq7JR0MRbwFnd5iqKVicrXtyWTH5iIHInfnU81HsH2dEw5G7/qEYSl6bMCFJiLMkcYq76Vj8pQJ99
	gPC11NOpQ0YnPw4SlZaR97wRJSNlLXzdFSQUfJurIlU7g2jR2FwtBJNtDB6A+UtMbzLJDrqHn2MJi
	mV7TnGzAyD/oJCqHofM4wzu3j/wHQ2bepX4kSOKP6ViyJce0GdxmyUA5rtZQQvk5ltVUk6jpW5DQy
	U3VYbeKPe/ctC+nqyk7zg1+Xn2StT9b/wFAmz7KnEKqLdX9b0vob1T8iE/KTuTuaf6WpEFbA/iF2H
	59IjOX54BvpsEmMwOYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofVwQ-008BR1-D5; Tue, 04 Oct 2022 00:37:46 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofVwK-008BPc-UX
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 00:37:44 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-127dca21a7dso14823516fac.12
        for <linux-riscv@lists.infradead.org>; Mon, 03 Oct 2022 17:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:lines:status:subject:message-id:references:in-reply-to:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=wspkU8yNAcJmBJpqXk32uG7evf6evn6CxLk1FdE5/JA=;
        b=phZzcovMg/n6M1/Zr0C6V163vA3AQalU1EURq09erNiotWJCMDEzWC4JSVFSr25t6r
         GhnM4swzHBVIjXXRLuygNsOQin7WK0loNEosEKj7redIyG/OnE0fTueQW5qPIp+4e3Ri
         w0D91urqYNKkmPtXMb0Ntgp3SUbMAhB8bHvRsT1A1HX5uuQ9NK8r4frBDnrNcrrG7inD
         FNvX0QqrAZWqmb6LcxC/ClnAImlzxbgwjATDPd0EFI4VpSeWG5rea45X0qOXGKf++ISw
         L7oTm7k6Hcx4ENLPEu6ccuUQuHRFQCgLL7q1Uv6IV1h6FJuBA+GOqYCfYWUH2bcDWNIs
         bhbg==
X-Gm-Message-State: ACrzQf0i3d9it8TsTTcfzdp5UGFn41V7VqT+Y4TZpytPAnolWbL9cXht
	kqPPunO29xq4CtuIGQxM5A==
X-Google-Smtp-Source: AMsMyM4SztG2FOv2QeAO1z674pPHGq2S5oKi+1b3QiFpMmWS3yWsnDJbe/Tt2XXf7cSJT5/k6RCpJw==
X-Received: by 2002:a05:6870:a916:b0:131:9361:116a with SMTP id eq22-20020a056870a91600b001319361116amr6949075oab.172.1664843857374;
        Mon, 03 Oct 2022 17:37:37 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id fp18-20020a056870659200b00132741e966asm1178982oab.51.2022.10.03.17.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 17:37:36 -0700 (PDT)
Received: (nullmailer pid 3085955 invoked by uid 1000);
	Tue, 04 Oct 2022 00:37:35 -0000
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>, Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, Biju Das <biju.das.jz@bp.renesas.com>
In-Reply-To: <20221003223222.448551-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221003223222.448551-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-Id: <166484368600.3082797.1249010812402837811.robh@kernel.org>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: soc: renesas: r9a07g043f-l2-cache: Add DT binding documentation for L2 cache controller
Date: Mon, 03 Oct 2022 19:37:35 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_173741_029497_23E2F4B9 
X-CRM114-Status: GOOD (  10.83  )
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

On Mon, 03 Oct 2022 23:32:21 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> 
> The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> describes the L2 cache block.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../soc/renesas/r9a07g043f-l2-cache.yaml      | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'l3-cache' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'cache-level' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: 'cache-level' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/sifive-l2-cache.example.dtb: cache-controller@2010000: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/sifive-l2-cache.example.dtb: cache-controller@2010000: interrupts: [[1], [2], [3]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/sifive-l2-cache.example.dtb: cache-controller@2010000: 'cache-block-size', 'memory-region' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/sifive-l2-cache.example.dtb: cache-controller@2010000: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'l3-cache' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-level' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: 'cache-level' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-level' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-level' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-level' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-level' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-level' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-level' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'andestech,ax45mp-cache' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-line-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-level' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml

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
