Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F679CE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 22:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6b343OS7j9Lu4CxnCOgmfrZH4Eqw5HKhJ7cspOCvBrs=; b=2GuZL8lb3Ur4Q+
	xBvGSb212kpEWfEIZYmCpDL2+ypxo9zr6qoMn1Ep1q0Uesb5zo515gOmnM+3JhPh31s4CG9cRWQOg
	dnphE2qIi43iEThJLll5PvP4/h8OpGgJoTpI6LLE0D6XMDq0zahN65d1JB1w1DMobAhoCSe2r+jDL
	FR6ZHevksH89QohSNUnnWYgnu+vpNXsTH1IUrtUZ7lefeWqsfMXV2XK04AJyVhQp7kQyvr16FcGKm
	zogo/r2aQlCqbNSlNmKpNH/LlIvmuzGbrdhd6DJVrgudc39+ECfASsfFTBw7o0bbdL64M2UcvSWAK
	InXoCeUiEil+AG/w7HqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7qo-0000000GxZ3-0eDV;
	Mon, 17 Nov 2025 22:37:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7qm-0000000GxYx-2bX4
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 22:37:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A486F601B0;
	Mon, 17 Nov 2025 22:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD852C2BCB0;
	Mon, 17 Nov 2025 22:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763419051;
	bh=xDxKRjzNpJQd9tWAvceuE9e8NxUEtNSgHtGbSSwni7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fAZBAz0ZwXz3E5r/LGBedPvzHPND5WaVQmqyYqF5FxVwaLfxEBC8YeQLaTObnVUTX
	 0hM/g1AhTb9ClSTdH7i1EfQSlp1P6Ck/UeeagdJ7yw0Qrv0RPZnq8FLNcQitIv4djk
	 amO/Eq1FVTXjNbKr79NnHsU6dIDVDZMBqqwiIChbPhqjEmIBuLvC8wETappBAkGXrz
	 Pv0ZsmLNoorNrOUtSZbtvYncsIvqzdE14om+sUEZz3HKZciq2gicAaRjrSj74U8VQ+
	 Z7PZ+o7WljfU76CRYU9L42bs/J003O6Q1T49hzfJxZOhE/fLnnRGirCyV9thls3tcK
	 /PDyKc3C2C++Q==
Date: Mon, 17 Nov 2025 16:37:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] dt-bindings: gpio: mpfs-gpio: Add pic64gx GPIO
 compatibility
Message-ID: <176341904869.845657.970101427228139692.robh@kernel.org>
References: <20251117-grumbly-oversized-2215fe887181@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117-grumbly-oversized-2215fe887181@spud>
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


On Mon, 17 Nov 2025 15:59:18 +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx GPIO is compatible with mpfs-gpio controller, add it with a
> fallback.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> 
> The diff here is kinda scuffed, because for some reason this binding had
> an "items: - enum" construct to begin with.
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> CC: Bartosz Golaszewski <brgl@bgdev.pl>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: linux-gpio@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
>  .../devicetree/bindings/gpio/microchip,mpfs-gpio.yaml        | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
