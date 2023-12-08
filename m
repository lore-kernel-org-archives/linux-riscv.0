Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFA6C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 18:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9hoD3k0qPFvu1ZwPsKnwMAdQ1XF34/18zoKgrKYkQg=; b=2N342CUB9+E34O
	XV8dk1IWiIUKbMn0PXJWpm9HGwAXCHgKrY3KiFwE0orWhklBPQ0svHcL8+bjJllo2wrRdmKfB4mMr
	Itt70wD2XYCZ82I7vOJFhAhIZT1DxNybPeAlcbEyVf2EVfjp+WNjH+OwoQE82xR0nIZn7ZThcoQAs
	dlyCXF7S8JqfzvsA0VCI+JmF+imVtL9HTlvfiJR/l4uJhz8D536K6r1QwPCMc/PGlFyF+UuBCVQho
	J3TrSzQTgZ4GIGziex2tAsF+U//1Bl1if6/KwNrI5Md5PR3VHIxtKC97ymBgrXkQ+FqW3EGo/Ud/A
	45EKCRD9WVC5K9YcL2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBfcz-00GIvn-14;
	Fri, 08 Dec 2023 18:31:09 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBfcv-00GIua-0w
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 18:31:07 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1fb9c24a16aso1472217fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 10:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702060262; x=1702665062;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+yJeduNngKCWy3/DH0y84rogwCflce9ufqE8UYu448=;
        b=L/YxlM4iFYja8Fkv9n6I9STIJRWRqbsVaEE8Ibuptmjf+SN4sVmAyPDHXgJ/AfDMd3
         F7W0NOzebJvXKelOk5a9gFv2UOMaKRxTlr08pG4NrHFPwKRVO1LqFcnLfOWPhzNL2/l1
         ZOPlFLxkGs3H0DdLT32PKpAgut3JeC4TwpENzISTZD4kfk6+YK9SJqTyf49Vh/8GgFGl
         geEbs5oL3N+l5gtXKiq4nYdB+vf0+c4fGeILGlY+HU3drlIH04m6DzcdrnFVRU24/C91
         WAG7+TQChPpZ1y+fdifO4HQ3JI43lnScfWqruB2bZUyTwDHwHyfOSEBkvspeS/aoSDMG
         VFWw==
X-Gm-Message-State: AOJu0YwuVGo/kHbfo5Kwi/D/neSwtLRgcrjA8/U0Ym+xuah7YsLQoF8A
	Tjln9Ew0fge2je/l/ODGhQ==
X-Google-Smtp-Source: AGHT+IHXtCU+Df3narf9EUnnld4MDBZ1SkRhwu+ygUAtS6Zf9h8UB7gij98jquMR2wdiE98NTVaiyA==
X-Received: by 2002:a05:6870:7029:b0:1fb:75b:2fd4 with SMTP id u41-20020a056870702900b001fb075b2fd4mr579114oae.107.1702060262327;
        Fri, 08 Dec 2023 10:31:02 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id hb5-20020a056870780500b001fb1e0a25e8sm507468oab.26.2023.12.08.10.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 10:31:01 -0800 (PST)
Received: (nullmailer pid 2485978 invoked by uid 1000);
	Fri, 08 Dec 2023 18:31:00 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-can@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Daire McNamara <daire.mcnamara@microchip.com>, Wolfgang Grandegger <wg@grandegger.com>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Eric Dumazet <edumazet@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
In-Reply-To: <20231208-palpitate-passable-c79bacf2036c@spud>
References: <20231208-reenter-ajar-b6223e5134b3@spud>
 <20231208-palpitate-passable-c79bacf2036c@spud>
Message-Id: <170206026051.2485962.13304186324857333888.robh@kernel.org>
Subject: Re: [PATCH RESEND v1 2/7] dt-bindings: can: mpfs: add missing
 required clock
Date: Fri, 08 Dec 2023 12:31:00 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_103105_330693_585A56C3 
X-CRM114-Status: GOOD (  13.93  )
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


On Fri, 08 Dec 2023 17:12:24 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The CAN controller on PolarFire SoC has an AHB peripheral clock _and_ a
> CAN bus clock. The bus clock was omitted when the binding was written,
> but is required for operation. Make up for lost time and add it.
> 
> Cautionary tale in adding bindings without having implemented a real
> user for them perhaps.
> 
> Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN controller")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/net/can/microchip,mpfs-can.yaml    | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml: properties:clocks: {'maxItems': 2, 'items': [{'description': 'AHB peripheral clock'}, {'description': 'CAN bus clock'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231208-palpitate-passable-c79bacf2036c@spud

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
