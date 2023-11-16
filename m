Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B034C197A0
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 18:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDrJ0tpk0boIWGlGV5nG8Ny/AQcxACllhJaYMm4W1/8=; b=DpgcNhgM94ZPcs
	iXmiO0atBmraMeXBK/4r2E/xklVZfaW7WlO6ObzKH4Tqux54vg2hX/iTCyytWVinnRG37gt29RoF+
	DAdw6yaVbXexBC2rD8tIWt/wJW4IUh6X8idHJhv9eLmiYe/y9MJaAWBDs5RRkSi4mqrX2mG5pbjGR
	PXaSuyEq2LAWK38qhYVXxs4u9otg8xu9t0ufOjbr+HnVzQN+0Je2ike8x9OYSz6qfy4fZHNMLHLue
	ef0kkZSdZL05d+0+tBlvgVv9muwQrGS2Usvl+S8cCv7E/eOCErz/AQb0L1r1KhSqrmGKGj2e/TtZ2
	lIu1a4nbKKD/pQFPEUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3gxB-004IRb-1Y;
	Thu, 16 Nov 2023 18:19:01 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3gx9-004IQH-0O
	for linux-riscv@lists.infradead.org;
	Thu, 16 Nov 2023 18:19:00 +0000
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6ce344fa7e4so667404a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Nov 2023 10:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700158735; x=1700763535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mvdm8s7CLiAWc1zAvkwb+zCVPLYN6IW325FSx81hTfY=;
        b=kG+kAKFiPmWrPk7x98aSnXC8JtHt1+Ie/ATlWoMATV98SSUduYFfGalpC1fFy9K9TS
         MNLtvPEeEHLXDYbXPHnuh9/WnFDIuCCRsJigP6uljvMoTZfQM1Dj90rn1XRgUAGmqU+G
         QmxBM6IMIxs9MnRsXeyXIjUilDM9/DP5kj3Ktzs6wkXNce/xiPRvNNW/dk6T8ZmJ9/Sd
         ai/gkSQSMCO2vyxhqV02SHwMfoc0GtzRh/FFLWxnhloUbCsA0dVaEFxzyCfEtJAOswwf
         JZ4yG26fmf1uY3ab5u7A376OUw2JBV40Tz+F9qjxPvmS4bdPkEWH7p2ds/xbjsPVxqC7
         r9Dw==
X-Gm-Message-State: AOJu0YxAmdfaxLgh9ESCqTqC5qxWcL2ITQemIGjNc9FO8M3ag8kLTY0j
	0ki2oXQQaRger3YQrv54+g==
X-Google-Smtp-Source: AGHT+IEwmVU0R+k/HtPd1oq3ffY8WltHJ7y4wNFhcwB+B3/35kMpJHdybuQBwbbX2qDPkK5mAxrwNw==
X-Received: by 2002:a05:6870:418e:b0:1f4:be52:b14b with SMTP id y14-20020a056870418e00b001f4be52b14bmr21955186oac.12.1700158735208;
        Thu, 16 Nov 2023 10:18:55 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y4-20020a056870a34400b001e9ce1b5e8fsm2220517oak.15.2023.11.16.10.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 10:18:54 -0800 (PST)
Received: (nullmailer pid 2710216 invoked by uid 1000);
	Thu, 16 Nov 2023 18:18:47 -0000
Date: Thu, 16 Nov 2023 12:18:47 -0600
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com, sboyd@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 3/5] dt-bindings: clock: sophgo: Add SG2042 bindings
Message-ID: <20231116181847.GA2659392-robh@kernel.org>
References: <cover.1699879741.git.unicorn_wang@outlook.com>
 <1e5836360485b63e15bdf58da59e83139666b290.1699879741.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e5836360485b63e15bdf58da59e83139666b290.1699879741.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_101859_184046_91310E4F 
X-CRM114-Status: GOOD (  15.99  )
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

On Mon, Nov 13, 2023 at 09:19:31PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add bindings for the clock generator on the SG2042 RISC-V SoC.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../clock/sophgo/sophgo,sg2042-clkgen.yaml    | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml b/Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
> new file mode 100644
> index 000000000000..e372d5dca5b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/sophgo/sophgo,sg2042-clkgen.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 Clock Generator
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-clkgen
> +
> +  system-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to System Register Controller syscon node.
> +    description:
> +      The phandle to System Register Controller syscon node.

Forget what I just said about syscon.yaml...

You don't need a phandle here. Just make this node a child of the 
syscon. However, why do you need a child at all? Just add 'clocks' and 
'#clock-cells' to the parent directly. You don't need a child node when 
there's only 1 child node. Maybe there's other functions, but I have no 
visibility into that. IOW, define what all the functions are so we can 
provide better guidance.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
