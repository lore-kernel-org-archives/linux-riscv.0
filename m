Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57B6C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 11:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4CXVjEpN0Y1jwY8d7GfvBKmbzkzbtxF92FTSmnTMOA=; b=QZQrVD+CvoFfcU
	5J9bEazACOAI51PNFs23C4XJBoSX1vvAyEoo7WvR/kawMTMIwnFjL85vTbOySbGN+ElDdSFfyNGxc
	hRv4xqzU+8dc2LUUIe++AmVlg0y7H70YeAfWa48puZMRCQXRSluK1/yjLxxMX2tB2eMBVMVYTDfRR
	h12XxkZMuKoNBn2zDQPfnFnC66WYOD809x96naYTU2fD2TzoafVDhup6TQT8ALF9cUQtmIp11y/2G
	/aKNVsVvBaRKeheNtMlsLBdI6oWq3Z7mT/MIozDD5J7aJpW8GE83Ep24xHPJHlFIDTJpCm72czCON
	JsH7P2YvA5f+81b/Jvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKzrK-00AjvD-0L;
	Wed, 03 Jan 2024 11:56:30 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKzrG-00Ajtm-1M
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 11:56:28 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-556aa7fe765so1300940a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 03:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704282984; x=1704887784; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1w+ahe+6fF4Xvq18aSfd3iw7WLNztkXwapqNFYwZps=;
        b=gEoJ1YHOz8MEZCQwp2UK0YW++JFqJ9Q++dhRK/N6o+qJtJqjEK/G4gVmDm5xwvcq8n
         F1SxSSuRo8OXwi7DvcPkZnpvMFHlcbTAa3w+mSI96+M8qBHm4KpoH4sadmv8oI3odVPa
         L1jPouu1x5cltk0SORnW5WsyTkoG+aBrnLHQkUliH6VgNGwhUvoUi9e0weD8ujK8Ke0A
         bVIe70IAAGb11ZjP01gzPqb8Z2fEjlKGPwmSCjW9RSZkbUqWJC9tabV7rRScSgVLJEWw
         WONi6r8WdEcusXuLRj8xZgKNo9uEUy3sDYZjSFqGZRNRzWKgRFDWELb4Jdhu9zQuuaSn
         PleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704282984; x=1704887784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1w+ahe+6fF4Xvq18aSfd3iw7WLNztkXwapqNFYwZps=;
        b=Q/dOcHt1IRDA87VdvTI9t8lHH6HSrWuO6qfkYq2HoMi0TYU43iKs2fRu2JGCwI5Kxr
         JlFQ9nCUzl6ZtTe39XayjQMf3gPG6CQ5gIVnJq0dgZfZyimzu3BUuFtjC0LzFhbQaQNI
         SqbRry2rvvxy9Kt3jfYo5r+nitzTkheR1qYzDFsAEC+PHcO/pnw6rrz/0Llz2TEu4s/C
         iTy/LvEri2XiKrU16FniO/xTw3Asd7TaXWMbzhUxF2EDzDEHk1xOp4+4sXm9PXT92sQu
         1sVdqd0B4ciXzjxvbEWav3pcNW2URPPrMiTRXJ04FWxCNFBMGZCBiWA67CLQ3TlF5xDV
         z09A==
X-Gm-Message-State: AOJu0YyCoxV3qmFsOkZmp2xfHgSrzwVX/k9oA8VnsIc/CHQnok2vAxv7
	WHZYihPUeBnKurp8aqo0gf4B5YYH34sDQg==
X-Google-Smtp-Source: AGHT+IEPAlnfVbxd2sMR5+JjHkBK2BsKlvHArDwIl4WKQpiz0gmnfSPLQnxPoi85XwjZ/1LIjPAtEw==
X-Received: by 2002:a17:906:fe09:b0:a26:e292:394b with SMTP id wy9-20020a170906fe0900b00a26e292394bmr9258905ejb.67.1704282983328;
        Wed, 03 Jan 2024 03:56:23 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id wb1-20020a170907d50100b00a2300127f26sm12709680ejc.185.2024.01.03.03.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 03:56:22 -0800 (PST)
Date: Wed, 3 Jan 2024 12:56:21 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, apatel@ventanamicro.com, 
	palmer@dabbelt.com, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] dt-bindings: riscv: Document cbop-block-size
Message-ID: <20240103-ff49d0645e36f2822e755f4d@orel>
References: <20231029123500.739409-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231029123500.739409-1-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_035626_460632_165E135C 
X-CRM114-Status: GOOD (  16.04  )
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

On Sun, Oct 29, 2023 at 09:35:00AM -0300, Daniel Henrique Barboza wrote:
> Following the examples of cbom-block-size and cboz-block-size,
> cbop-block-size is the cache size of Zicbop (cbo.prefetch) operations.
> The most common case is to have all cache block sizes to be the same
> size (e.g. profiles such as rva22u64 mandates a 64 bytes size for all
> cache operations), but there's no specification requirement for that,
> and an implementation can have different cache sizes for each operation.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 97e8441eda1c..1660b296f7de 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -78,6 +78,11 @@ properties:
>      description:
>        The blocksize in bytes for the Zicbom cache operations.
>  
> +  riscv,cbop-block-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The blocksize in bytes for the Zicbop cache operations.
> +
>    riscv,cboz-block-size:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
