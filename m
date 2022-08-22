Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8203C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 20:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hx0aauc6g0JS2r26Yu2RafpbIkGxPbxXPwNOkVbBA2E=; b=EqezMzK8xeIx35
	mmB/yhjSBQYcC+0cflHSImscombleeEx65lyC9mjF7/eZxzub55W7PA3f4tq6t2OdzLPf5inU2FzR
	PsWVTW4lxGvdmTl6eryqJ3XhMnWl8RM79GjDIPFZgPPoZRx/E6iqFXh+c4v9QRZ/rGcuRv/TdtSZg
	xrH/XJS+nhLOcl5tlXEe8S9R7IczNO4w8LTnVOo1uZ9H7jtnLRf7qwKdVKEoXGGgjHmB3+OQxLXoN
	p8TOjb6I1B5NpHKendqtsiRzC9oQscBW1bO2AgiViWsX0l4RMS7xc12GNN6CJrm8GjfONESS8Annq
	fq/FE3mprUryzI6apb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQDuQ-00EVVR-0K; Mon, 22 Aug 2022 20:20:30 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQDHx-00E9SU-Oe
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 19:40:47 +0000
Received: by mail-ot1-f54.google.com with SMTP id r1-20020a056830418100b0063938f634feso1186528otu.8
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 12:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=ZD+9Y+YHgSc74uZmGcIl7GpjcDtMGqKPBLpD0+ZP414=;
        b=UGxz7Cu6uDWcdgooelryS202Fh453oBOPgKT1KRX2ihb5MKAkR3MMK1PWBC3JUdzaG
         NZleMtPwm+0eDwx9qAFiWJ5tmwTYk9ShDYs2GWPWWqHdB4kZZ9xBrYvtW1jOSZvjzRzH
         GDI5T5Q3KE62CVnhDeqWHkcE4ek4vRi6aq+ghQjhzUrg7QkbesLklWAN5tZAf3RzzwJ2
         FXKSA6Na3t3+EMo1tRsmNZDqzjM02pDc4r1esjU2I+2M506Y43uKdWTikBAhRdwrd9LC
         g6d6Mtmr+KJLun+PtfRp5A1UcJnbpHxjy7zo66RZwCglPFp0IgRNHk9Up+r+VlIZyafW
         jUHQ==
X-Gm-Message-State: ACgBeo0oBcJ4tKEZEH+TowfkXV1OOamCkrUzxPU/mzP4r+/mlJiAt2n1
	F/uOqQsRkcbY8KsblozFFw==
X-Google-Smtp-Source: AA6agR5d+cG/pMsqLg7MLuteBtnn/svk7s7yyhuSdlYHrm/7zVl0NJnmkHkqF1iNOCpu0ncOlHcOOQ==
X-Received: by 2002:a05:6830:6505:b0:638:94e4:f0c9 with SMTP id cm5-20020a056830650500b0063894e4f0c9mr8355925otb.270.1661197244562;
        Mon, 22 Aug 2022 12:40:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s63-20020aca4542000000b00342df642fd3sm2735031oia.48.2022.08.22.12.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 12:40:43 -0700 (PDT)
Received: (nullmailer pid 413610 invoked by uid 1000);
	Mon, 22 Aug 2022 19:40:42 -0000
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Hugh Breslin <hugh.breslin@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-clk@vger.kernel.org, Daire McNamara <daire.mcnamara@microchip.com>
In-Reply-To: <20220822112928.2727437-3-conor.dooley@microchip.com>
References: <20220822112928.2727437-1-conor.dooley@microchip.com> <20220822112928.2727437-3-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: clk: document PolarFire SoC fabric clocks
Date: Mon, 22 Aug 2022 14:40:42 -0500
Message-Id: <1661197242.557172.413609.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_124045_837169_021FDECF 
X-CRM114-Status: GOOD (  12.75  )
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

On Mon, 22 Aug 2022 12:29:25 +0100, Conor Dooley wrote:
> On PolarFire SoC there are 4 PLL/DLL blocks, located in each of the
> ordinal corners of the chip, which our documentation refers to as
> "Clock Conditioning Circuitry". PolarFire SoC is an FPGA, these are
> highly configurable & many of the input clocks are optional.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/clock/microchip,mpfs-ccc.yaml    | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.example.dtb: clock-controller@38100000: 'clock-output-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml

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
