Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8246D711D5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 03:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIt65PMnBBz4I0oOYt7eAwxOcjnwSoOFixWSwTrm/BU=; b=Re6qFCoQig7Bsk
	sazjPvoBCcxS8A4i9xiy9npWiN/VynLCbfv2RMaI87TFXY9iulvzc8HzFPaCgSIS8ZwiSRljONacG
	QSNurZPMiREZLubNlY0z1X9kk6LEuZDGYm49S0QdaPf8oh2aDX3+YN4UJpXlb03EySFKfY5aYCACp
	z4tMRFZxoiBKxdc5XStcuFUWft9OxMIUsab8frT2remlXuBIbCSu0RAa4aBbJ5QolhJsRta9zd8YQ
	Mpwm0Z7W9myf8yMUsAXBKl/Czg7ePTcHIihi9BfNCD6eW17pyGmRbYeZA1gmbqkXRGHFMdQ4QC/g5
	7Xa+dgEFody4yV4sT4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXWyZ-0000000D3Fx-04yz;
	Mon, 22 Dec 2025 03:52:51 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXWyW-0000000D3FT-1Fm6
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 03:52:49 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 21C9F340F69;
	Mon, 22 Dec 2025 03:52:43 +0000 (UTC)
Date: Mon, 22 Dec 2025 11:52:39 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] pinctrl: spacemit: k3: adjust drive strength and
 schmitter trigger
Message-ID: <20251222035239-GYB1977180@gentoo.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-3-f6f4aea60abf@gentoo.org>
 <408BBF8CF676D97D+aUiy2w1iP1LJoUOW@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <408BBF8CF676D97D+aUiy2w1iP1LJoUOW@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_195248_393092_1A6C3497 
X-CRM114-Status: GOOD (  12.63  )
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

Hi Troy,

On 10:54 Mon 22 Dec     , Troy Mitchell wrote:
> Hi Yixun,
> 
> On Sat, Dec 20, 2025 at 06:14:55PM +0800, Yixun Lan wrote:
> > K3 SoC expand drive strength to 4 bits which support even larger
> > settings table comparing to old SoC generation. Also schmitter trigger
> > setting is changed to 1 bit.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/pinctrl/spacemit/pinctrl-k1.c | 163 ++++++++++++++++++++++++----------
> >  1 file changed, 116 insertions(+), 47 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > index 441817f539e3..8ca247fb8ba0 100644
> > --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> > +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> [...]
> > -		val = spacemit_get_driver_strength(type, drv_strength);
> > +		val = spacemit_get_driver_strength(type, dconf, drv_strength);
> >  
> > -		v &= ~PAD_DRIVE;
> > -		v |= FIELD_PREP(PAD_DRIVE, val);
> > +		v &= ~dconf->drive_mask;
> > +		v |= (arg << __ffs(dconf->drive_mask)) & dconf->drive_mask;
>             ^^^^
> use val here.
 should be s/arg/val/, thanks for the catch!

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
