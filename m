Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CB2C531F9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 08:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoxRaOD88UsHlVjmN06LJCydsfOdAF4+9jYXUbZXiyE=; b=o0lpES8d9KeI56
	wS/EK8q7h5PttM0DYkXdpmvDwpLI3IvZtRDQA02MTIbnJ1YH3Y9xYW/W+co4j5y7337cbWWrGSId8
	R4Pb6WbGCoV3LQymYsi+9HJyPEgrlbVZ5u26D6u/9t0AcsXjCwo+RPhlaC6o7mnr08O304madpYrD
	fMUjY9LAoa/yXoKmYwcxGc8ou9Hz5AxwoJp3kFo2S1hxRMBTyJL40bo0BNK+OnjkQLcdJaAnst9JU
	ZjuSips/xGOXEFbaO3G66wCuGzarFRQoz3DgeePl/4yQqhdWu10VBNdOZy+3ekytHVj/QehA173ld
	dm/uUD8rTK9mUOyGltcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnXW7-00000000ApB-2ftk;
	Sat, 25 Jul 2026 08:13:55 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnXW4-00000000AnP-0547
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 08:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1784967180;
	bh=Q1wNwR7tIvEW59tXnUAq4uObdZlbHctBQ2RgzD/ZM+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OnV+l0WoJv/sdyIlExO4Gq+PhEkYP7GycUj9fdFV+6B+X9lmoUo2HdVM465G4NDmp
	 jSPSjOP0LHhtUg0wjigtySnOYMnYwSnh/qZU68PbFEQGRZ9VquOnmzubejei6WVtSm
	 al5IOoSka+a8eFZYsL8HAyxWVHMTK6XJ4V9fRPQj76UHF0o97ia+HnXhnuSOj9GTNj
	 IJln88Xh4R5+xdRyCtrfiz/FL1h3w3MaQ6Ab+DtLUjAjJfC4eIW0e2ASMlTztvJP/z
	 Fmxt7yNYLbW6psc9gNctMhp7KpFzNelIWFneA4Akg/plsstQDkFrnNG6nrOAdqYiHL
	 tJNrTkBVQl1AA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 9F302B2200E0;
	Sat, 25 Jul 2026 10:12:55 +0200 (CEST)
Message-ID: <9545227f-77ef-480d-bb55-6caf1124627c@freeshell.de>
Date: Sat, 25 Jul 2026 01:12:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Fix phy id check for the phy on
 pico-itx board
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260725005804.373698-1-inochiama@gmail.com>
 <20260725005804.373698-2-inochiama@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260725005804.373698-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_011352_539563_760FE255 
X-CRM114-Status: GOOD (  13.54  )
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

Hi Inochi,

On 7/24/26 17:58, Inochi Amaoto wrote:
> Current phy framework can not reinit the phy correctly, as it will
> assert the phy reset GPIO so the phy id can not be readed. Setting
> the phy id of board pico-itx manually so the phy id dectection can
> be skipped.
> 
> Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> Reported-by: E Shattow <e@freeshell.de>
> Reported-by: Inochi Amaoto <inochiama@gmail.com>
> Closes: https://lore.kernel.org/netdev/20260712045233.800748-1-inochiama@gmail.com
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b2a7d2d0d3a8..b9d2de878f38 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -196,7 +196,8 @@ &eth0 {
>  
>  	mdio {
>  		phy0: phy@1 {
> -			compatible = "ethernet-phy-ieee802.3-c22";
> +			compatible = "ethernet-phy-id001c.c916",
> +				     "ethernet-phy-ieee802.3-c22";
>  			reg = <1>;
>  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
>  			reset-assert-us = <10000>;

Looks good to me, aside from commit message spelling and grammar nits
("re-initialize", "read", "detection"). Yixun may just fix in-flight, my
R-by and T-by tags can stay.

Thanks! -E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
