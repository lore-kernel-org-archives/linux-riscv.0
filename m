Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35A1C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 01:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZyh5sjZd9q4MPn3XkmyCWuwwOPjAmEovWqmyQPtoAU=; b=QK8WmTev8bLCYZ
	JgheQrXe74uKTH80aQrl4FLjPZsNDHaQWbukUHzuYHHxizkeT39jv33hBvB9aPaba2I2bdvZ9Zm7d
	TQeg4YQCTYp71wZojNiy2XYkJYaL/xbtaBfZ2AGIgZOcYT1v++sZFu7+ui5qx0PaAlUwg48NQTrYM
	KbUPyVK6axIJsnLO2S8M1mfW5eWkQCEFymc/9hFYtJJJIIxJ8ACMsXUMbm+n4s5WBOolP3XPWmsg7
	mMoQARt8asoZP6Nnxf5VsUUe92DfxldBn5vTgNumFzRV3Gz8XY5AMLafcR5+szVDNdfj46v8AmfqO
	eePvY1Y1FBw/pu9nBfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyNHk-00C2r4-0b; Fri, 25 Nov 2022 01:13:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyNHh-00C2qE-4g
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 01:13:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B712562133
	for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 01:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFBDC43470
	for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 01:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669338819;
	bh=6wAMWrQT5K32dko1URWUvuBP/QI8koaN+Dc2CHOpfLI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E4d9Htr19Pyq8G7SRSdzRer5HpyVGZqnReUgqLEEz1yzPuMZhmJVUZ8rWPhXwNsF1
	 F/OnIu6/rLecGFZ93j+GrIvKica8f4PU//D8hh0nrqgGOpXV2OUD1P+9mHJpgJNCIo
	 Am70isZkh3adPawAT8KFz1sP/XpM68n7xmpGkYHAaCZfWUVTbIWXRVDW4Awjh5Pw5q
	 6KaSlK9HfhkcFLphX/W/nREGvdoQhpxN1JWMUit2t3H7IowN1J51/jhuApBTL7Sp2h
	 u6qh6v71xEeJLsvBVwBKejDNUWazhKGyj0R9hoQd+lcBti8qDo8rvKI9+bcTd2U9Js
	 Nm1tNf2CoXpdA==
Received: by mail-ej1-f46.google.com with SMTP id f18so7220836ejz.5
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 17:13:39 -0800 (PST)
X-Gm-Message-State: ANoB5plYnEAr5Ed72x9N8Sus5f6XtsfYux1IlvBprrC5EIWUmJtUGA4D
	uOupctAg/QLLZ8AzLvEApVIA80VnRftvPFZJAbs=
X-Google-Smtp-Source: AA0mqf6z230oM0JVBCd8skG0dRUC1eHOWIUCdnVZpOLRJGDgCM8enkov2cjezhiPVICTeyE6u1ZjeEMqwWq/0xzAh2w=
X-Received: by 2002:a17:907:9856:b0:780:8144:a41f with SMTP id
 jj22-20020a170907985600b007808144a41fmr30590572ejc.189.1669338817392; Thu, 24
 Nov 2022 17:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20221124130440.306771-1-conor.dooley@microchip.com> <20221124130440.306771-3-conor.dooley@microchip.com>
In-Reply-To: <20221124130440.306771-3-conor.dooley@microchip.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 25 Nov 2022 09:13:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSoySxChy5cgQeL6-4bGmXF5YnUKJRgL5FnE3K6Z9Xt+w@mail.gmail.com>
Message-ID: <CAJF2gTSoySxChy5cgQeL6-4bGmXF5YnUKJRgL5FnE3K6Z9Xt+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: fix single letter canonical order
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_171341_278549_E302461B 
X-CRM114-Status: GOOD (  19.41  )
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

On Thu, Nov 24, 2022 at 9:06 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> I used the wikipedia table for ordering extensions when updating the
> pattern here in foo.
> Unfortunately that table did not match canonical order, as defined by
> the RISC-V ISA Manual, which defines extension ordering in (what is
> currently) Table 41, "Standard ISA extension names". Fix things up by
> re-sorting v (vector) and adding p (packed-simd) & j (dynamic
> languages). The e (reduced integer) and g (general) extensions are still
> intentionally left out.
>
> Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
> Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index e80c967a4fa4..b7462ea2dbe4 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -80,7 +80,7 @@ properties:
>        insensitive, letters in the riscv,isa string must be all
>        lowercase to simplify parsing.
>      $ref: "/schemas/types.yaml#/definitions/string"
> -    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
> +    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
Acked-by: Guo Ren <guoren@kernel.org>

>
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false
> --
> 2.38.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
