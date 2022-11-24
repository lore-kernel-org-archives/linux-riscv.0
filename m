Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FDFC43217
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QU/0/gd2EdsmzIP3clNO82IMywZegmq8K3N52U97cf8=; b=lhHe5l6p7nA5pO
	5oDD6hfv7CPXKc+NmHAeQl+mqK08aukkqxtn0xRkFI/ctFqR1S6LiREJmkrtoby/M/19PkyM1qCrq
	rgXNtLROelPwprwRgmMtrYoJTFsGg56SU5g2t1rdhi8zTgYCWt/odc0AnGZWSj1wl+AFOVW16VKEs
	Gij5m4iDsjZaHdDgScv9ubyFHfptxrOpm0IrnZmVQJgKhbe91MrZLPvbJ+pG0no2anva18Zwi/ZXs
	R6Bzm8s6+0RhZTaxsW+2gN1coUkjizhmAgXI8RkZSTcYuNbsD9lT5Jnx12F4k1QYrQQ2T//qD314X
	58qIPEfNbiN6vbaEh4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyCUo-008tzp-Pj; Thu, 24 Nov 2022 13:42:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyCUj-008tud-Od
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 13:42:27 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oyCUf-00061C-At; Thu, 24 Nov 2022 14:42:21 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: riscv: fix single letter canonical order
Date: Thu, 24 Nov 2022 14:42:20 +0100
Message-ID: <7034611.lOV4Wx5bFT@diego>
In-Reply-To: <20221124130440.306771-3-conor.dooley@microchip.com>
References: <20221124130440.306771-1-conor.dooley@microchip.com> <20221124130440.306771-3-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_054225_824160_918EC213 
X-CRM114-Status: GOOD (  19.15  )
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

Am Donnerstag, 24. November 2022, 14:04:41 CET schrieb Conor Dooley:
> I used the wikipedia table for ordering extensions when updating the
> pattern here in foo.

	    ^ foo? :-)

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

So I have compared the new pattern to the isa manual,
and it looks like the order checks out, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

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
>  
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
