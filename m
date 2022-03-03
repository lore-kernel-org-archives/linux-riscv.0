Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6633BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 20:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qqPpUxnVLiVkN7b5arxRyYy+1a//4AqrutYgjdinXfw=; b=Gw2H3UMimOEt1QFwXgQNWsA8mx
	hejGUF4E+GwEFgXC7fs0w5TRq9PBD9+HboQB2XZ+gjPm/Rlu7ZGU20km9p4RfptHjxOqPyEmce+lN
	cQArAA1IhgEmNTra7RVC4AItz+bHIUkywIenvy0iYiDsf2IBYNh7GC2QlieCH2iBrSUFAlPfSYC4g
	eL2X+elpSQjV+wRxuaNQCDauoDmdRArcxI3NT7RZ052aoMxXx0ggLmfM5WC1KG9cT2GUKestwVcrm
	aRr/KlRYWRU7VPLktENuz4tDSgGnKK3q7s6Y6VgThSprbK3QcrbYzjcayk2sahOJ6IwskvKDhaYOl
	udjm7feQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPsI0-007kLt-03; Thu, 03 Mar 2022 20:43:08 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPsHx-007kLM-Ie
 for linux-riscv@lists.infradead.org; Thu, 03 Mar 2022 20:43:06 +0000
Received: by mail-pj1-x102e.google.com with SMTP id gb21so5662210pjb.5
 for <linux-riscv@lists.infradead.org>; Thu, 03 Mar 2022 12:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HTR89W5+ss6GRVV0oMozBkIFam5PbYaQL2WB71lWBEw=;
 b=8B/UJDtoLmDYwgQ9oGjD3YPogMoFyFOGuWqvy46h/8BauDdyYjICwRbJa38W0euJcE
 qwKkEAPFQNmKQWAs+h4ZKWQUgNit0I6curvBFfT4uOPZvjXW5iWns+h9gAaBwYyCtCuu
 DKEY3jABkBHn5UAzByhcAtWtPHoejDnsvO+T2NXOUtpAqEr1yUMugSawFDxtYuYv7SuN
 f5u9PiBAxytWfy+D2D8C2x2n6Rm/LSM+9XiuwzWf1RGfqpWzf3zP/hVIt8G0dyPwyOmJ
 tfDoTPbR8/bchrZWmG/007xv0AY2JTG6V2yVrNbmY2JRxhLgABqtSrA3kzYKhgkqclJ6
 i8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HTR89W5+ss6GRVV0oMozBkIFam5PbYaQL2WB71lWBEw=;
 b=VUk7KQkAmOr/d/RD4KtKAdV6gZRWJnwVdlD/ZTnV3DGm7sxeAVenrLVuy1CpHCn8zi
 WmI1CV65kEHSAhVtgr1qPEn0AMxlIpJSbHPvoWyi1Cb7IY3Yhz6dOvnYTE40gAW2ugXB
 ZtJJDEuooNuMPNe80hs0UO55tJDcVqsTZ+Sbc4xlTyhH6g8i2UygB4Z02gCQHuzF/Jyb
 7NTXyWzHR/D36OKCcuNFNv0IcxBU10Yy+6JUiveJPX2qTZYcjfjgJKlYmo/uy+rVRE9m
 3N8l1Kq/BwEbN7enP+QenBpWwKHizldh49ftPP+aMRUGvftdIDOyPdO/o067KEsrhqKO
 SlIw==
X-Gm-Message-State: AOAM532odSG3ySFIxl1O33DFnUDbGj+BrmDBWXW4yBUI4pV5lff0fa/J
 sLmyvKT+WUNA4eKdC6pQWNOtQg==
X-Google-Smtp-Source: ABdhPJxcIHtPczEFvIPFR/wmyhNMqCqLzAH1yTfT5Co+PM3neP36KKqvDkB/pCPmWp9aweeOlWhf9Q==
X-Received: by 2002:a17:90a:7788:b0:1b9:d80e:e398 with SMTP id
 v8-20020a17090a778800b001b9d80ee398mr7219047pjk.162.1646340184756; 
 Thu, 03 Mar 2022 12:43:04 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 z5-20020a056a00240500b004e15d39f15fsm3485909pfh.83.2022.03.03.12.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:43:04 -0800 (PST)
Date: Thu, 03 Mar 2022 12:43:04 -0800 (PST)
X-Google-Original-Date: Thu, 03 Mar 2022 12:36:37 PST (-0800)
Subject: Re: [PATCH v5 1/3] dt-bindings: Add dma-channels property and modify
 compatible
In-Reply-To: <30430019105af445d52b7a48331c106f8e6d6816.1644215230.git.zong.li@sifive.com>
CC: robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, 
 geert@linux-m68k.org, bin.meng@windriver.com, green.wan@sifive.com,
 vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-f3224022-f6c7-4982-96a2-70a29c09df62@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_124305_645562_240A83E1 
X-CRM114-Status: GOOD (  19.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 06 Feb 2022 22:30:38 PST (-0800), zong.li@sifive.com wrote:
> Add dma-channels property, then we can determine how many channels there
> by device tree, rather than statically defining it in PDMA driver.
> In addition, we also modify the compatible for PDMA versioning scheme.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> index 75ad898c59bc..92f410f54d72 100644
> --- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> @@ -25,7 +25,15 @@ description: |
>  properties:
>    compatible:
>      items:
> -      - const: sifive,fu540-c000-pdma
> +      - enum:
> +          - sifive,fu540-c000-pdma
> +      - const: sifive,pdma0
> +    description:
> +      Should be "sifive,<chip>-pdma" and "sifive,pdma<version>".
> +      Supported compatible strings are -
> +      "sifive,fu540-c000-pdma" for the SiFive PDMA v0 as integrated onto the
> +      SiFive FU540 chip resp and "sifive,pdma0" for the SiFive PDMA v0 IP block
> +      with no chip integration tweaks.
>
>    reg:
>      maxItems: 1
> @@ -34,6 +42,12 @@ properties:
>      minItems: 1
>      maxItems: 8
>
> +  dma-channels:
> +    description: For backwards-compatibility, the default value is 4
> +    minimum: 1
> +    maximum: 4
> +    default: 4
> +
>    '#dma-cells':
>      const: 1
>
> @@ -48,8 +62,9 @@ additionalProperties: false
>  examples:
>    - |
>      dma@3000000 {
> -      compatible = "sifive,fu540-c000-pdma";
> +      compatible = "sifive,fu540-c000-pdma", "sifive,pdma0";
>        reg = <0x3000000 0x8000>;
> +      dma-channels = <4>;
>        interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>, <30>;
>        #dma-cells = <1>;
>      };

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
