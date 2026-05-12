Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0173BCD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 11:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yA/QXAAK/Jjlphvclj7JYAT+WOygi5TFJZT0JP+PL1E=; b=WlMkwn6JVl+Da1
	jdkluJLd0OV5Lq5BbLw7MObbktFabvOlKjjsQf73cnij4QF+2a3hrWoLhyL0LE0s4qjAw5hJA2wh5
	NZ2imC9NMalE8K7fpbdL+KHtlgWQh80mboXHfxc4WmLHONpB2M4H1J9QvMXpwP6EDH/02jzTaPrPq
	HPuZAQ3KosEgNC1KCzj53PJxino8GsXtYUa0IZNVaqDcEOX2NDA34zpbzXqyEySIxvh2dBmoJW8T6
	M+5igaBcwpdEmaJL/4csGpUoAfhI9Ra1Ka5hep95zduvwBPYWBWaisH7wS6FJORhhoy3Z34/wEhCX
	D5KFv6ZLRZY1U7cytXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlOf-0000000Ga4I-13k6;
	Tue, 12 May 2026 11:35:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlOZ-0000000Ga34-2vkc
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 11:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C3D74416A;
	Tue, 12 May 2026 11:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D54AC2BCB0;
	Tue, 12 May 2026 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778585727;
	bh=O+s/qJ2aS0wV7WhC+jnpUOVvpf2JriqhRZ0N9HYUX5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ix+qxIhJdVyCjq8HoFIelgKUJ4U8HtdeEDYQCIxJAEUdWDp7yMTtcVHwJj0AtAG7k
	 k+X+0G5Aus19rHsGv/ZQpSlQ3iU+X7NIZxsoMVhxgAEgSTwYRk0OLU+Qa1gEdEQNIB
	 3QqZMzgZJQHewQ9TfBNuljK2yff9Xg7+51wTl5i4YXlJSMkpLinSr9QeLK10ayZdYs
	 Vzwyyo/FKn7GFO4F4wueiw1hbe/qMAkvEnmYMTlJTuquTa8lQlJQbdhGrdoytQ6fCe
	 gJkZAOsB51OcouNOzu8gDSRsPcxCsAJweyfP0PIewlsikQe3BXj1/yLlcQgPshPaJo
	 0VcLyYvPrp8dA==
Date: Tue, 12 May 2026 11:35:22 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] riscv: dts: spacemit: k1-musepi-pro: set default
 console baud rate
Message-ID: <20260512113522-GKG3624147@kernel.org>
References: <20260511111116.1109643-1-a.heider@gmail.com>
 <20260511111116.1109643-7-a.heider@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511111116.1109643-7-a.heider@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_043527_758758_A2D44375 
X-CRM114-Status: GOOD (  13.37  )
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


On 13:11 Mon 11 May     , Andre Heider wrote:
> Allow serial output with the same uboot/opensbi settings so the
> console works without providing a cmdline.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> index 2d3e30f0bd806..c8bf776511c94 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -22,7 +22,7 @@ aliases {
>  	};
>  
>  	chosen {
> -		stdout-path = "serial0";
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	leds {
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
