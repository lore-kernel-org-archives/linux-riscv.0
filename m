Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56A8EFCD9F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BRTScKRKHZkOQ/rG2Gqz7jK/aFEzK2X7WKPUeRAnFk=; b=OdqkOvwghklYnK
	Hx5dRnsJFxdBi9GZ1C57KEAIhIYxkWv+wPOF6wPaUwhbZcNi8kXn4OjkzbCB5mtKU1j3NaE7u1Lw0
	wZKHwI6wXpQNRXGT+Lm1IhVSahg4VcwWHIrct9Fphls+vwleHpFAoGFfQMy+ODH4Jhj8k+gt7U7JP
	HqM/5opSGL19fmjBI/Exg6geOgMJ6U5E5QDvEXYTOqIjYbAhWeuZXpz6pra7RAsBoiH7CmxU56PnH
	U9qKmxwkC1wDT2gFVTgmHKHAE4KSEZtypiaqUXmwc/QGfhnkaIIW5tDuAkK+z1K1V9xS3AeU5x5z5
	FY4YEPfvukrjxtyr00iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztUU-000000096r1-2vJ0;
	Tue, 10 Mar 2026 09:35:02 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztUS-000000096ps-2O7i
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 09:35:02 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 429FD341EE5;
	Tue, 10 Mar 2026 09:34:56 +0000 (UTC)
Date: Tue, 10 Mar 2026 17:34:46 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, Guodong Xu <guodong@riscstar.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: serial: 8250: spacemit: fix clock property
 for K3 SoC
Message-ID: <20260310093446-GYC318052@gentoo.org>
References: <20260304-01-uart-clock-names-v1-1-338483f04a8b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304-01-uart-clock-names-v1-1-338483f04a8b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_023500_631302_6AAE738B 
X-CRM114-Status: GOOD (  18.02  )
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

Hi Greg, Jiri,

  Do you mind if I taking this patch via SpacemiT's SoC tree? and if
possible, it would be nice to have your Acks..
(or either way works for me, if you grab it and merged via tty tree)

On 07:19 Wed 04 Mar     , Yixun Lan wrote:
> The UART of SpacemiT K3 SoC has same clock property as K1 generation which
> request two clock sources, fix the binding otherwise will get DT check
> warnings.
> 
> Fixes: b5024e804ee0 ("dt-bindings: serial: 8250: add SpacemiT K3 UART compatible")
I would just drop the Fixes tag, as I think at the time of Gudong
submitting the patch, the clock driver isn't ready, so he deliberatly
removed this clock contraint and provided with a fixed clock frequency
(the bindings match with DTS)

https://github.com/torvalds/linux/blob/v7.0-rc3/arch/riscv/boot/dts/spacemit/k3.dtsi#L414

> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
> index 73851f19330d..e9e07c2356bc 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -63,7 +63,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: spacemit,k1-uart
> +            enum:
> +              - spacemit,k1-uart
> +              - spacemit,k3-uart
>      then:
>        properties:
>          clock-names:
> @@ -76,6 +78,7 @@ allOf:
>            contains:
>              enum:
>                - spacemit,k1-uart
> +              - spacemit,k3-uart
>                - nxp,lpc1850-uart
>      then:
>        required:
> 
> ---
> base-commit: ec1fb4e55df47ed043ab2ccc6787e39b9d67e49b
> change-id: 20260304-01-uart-clock-names-551463132daa
> 
> Best regards,
> -- 
> Yixun Lan <dlan@kernel.org>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
