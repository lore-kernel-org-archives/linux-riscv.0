Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0538DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 09:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZnVqzNKNPqgkmT7iYvLI1i2vjP3UGcshsKn0mxKPEWc=; b=Vh1lwOAxcxQzFv
	AK9EBAMPEzEkrqc2pX9uX61JQePHjPuds9KzjOGZwNi7Xkw3DmZ5sFBsetvLrJ5oLCIBgZdgDXVcx
	WDl9YGDhSYcyKjYW7gltl25YJ2Woh7qKVvNDoYhEo9knmN2cSnoT+OnKSXdG5YM40ZwI8rhkHxyp7
	+OilnTWWAC9Nd5hbMD04yNbjzWWzNGyT2B0s/+aI++jTlRGnvRwr/V0o4rn7OQ4GRQunm3sjG4CKZ
	69b6pYInnhDjaI3zT9+XhoknMvjbWygNisabnbJHGsh6VrkO8T4C3QQoIr7pNcxY2iXq+DzNMh9eU
	H2c1GplcGQLT3DoG7wSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx4Xo-00DOgX-CC; Tue, 14 Dec 2021 09:56:24 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx4Xl-00DOfh-7S
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 09:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
 Subject:Content-ID:Content-Description:X-Debbugs-Cc;
 bh=hRdm0hDf8+odlarsU7FLIvo3kZ88Mi3L0AUJryy6A1Q=; b=czhIJkiDeNHhJX1y+bWq/xEhUc
 rcHUfVsS1cP8PkiIS9LlL5OJoz2EiZpoDdXGBNt0yhmRehtYFJ0aRa1U3bBthjnzFDHnSZUWOfEvE
 7UrWGfp7KQZRLbI0+CPqGtnGViTyrt23DYITz31sUXPIuLcmJFZ5kcFdrst32eISLVRzLf1dw/o5W
 cvfu1yTKBNk2xDRPhFzGolgMJszaeK40uiaKOOYiOpjZuenMbKffE70InznhkHBbhzuJeSfGar+yB
 dMBsIwaKIUPx8EFSA0H+AnGfo7nraGNNWKThEWp2R4tXXkKtH8iQN87/NLids84WueF/gpwZC7x8a
 xFI0As5A==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1mx4XV-0005fV-SG; Tue, 14 Dec 2021 10:56:06 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.95)
 (envelope-from <aurelien@aurel32.net>) id 1mx4XV-000uia-Ct;
 Tue, 14 Dec 2021 10:56:05 +0100
Date: Tue, 14 Dec 2021 10:56:05 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Vincent Pelletier <plr.vincent@gmail.com>
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: dts: enable more DA9063 functions for the SiFive
 HiFive Unmatched
Message-ID: <YbhqNY/w36XT5zx0@aurel32.net>
Mail-Followup-To: Palmer Dabbelt <palmer@dabbelt.com>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
References: <20211108214629.1730870-1-aurelien@aurel32.net>
 <mhng-7ab80707-35c0-4123-8340-cf1feca4cca2@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-7ab80707-35c0-4123-8340-cf1feca4cca2@palmer-ri-x1c9>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_015621_294340_164E62D6 
X-CRM114-Status: GOOD (  13.96  )
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

On 2021-12-13 18:13, Palmer Dabbelt wrote:
> On Mon, 08 Nov 2021 13:46:29 PST (-0800), aurelien@aurel32.net wrote:
> > The DA9063 PMIC found on the SiFive HiFive Unmatched also provides an
> > RTC, a watchdog and the power button input.
> > 
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > ---
> >  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > index 2e4ea84f27e7..c357b48582f7 100644
> > --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > @@ -70,6 +70,10 @@ pmic@58 {
> >  		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> >  		interrupt-controller;
> > 
> > +		onkey {
> > +			compatible = "dlg,da9063-onkey";
> > +		};
> > +
> >  		regulators {
> >  			vdd_bcore1: bcore1 {
> >  				regulator-min-microvolt = <900000>;
> > @@ -205,6 +209,14 @@ vdd_ldo11: ldo11 {
> >  				regulator-always-on;
> >  			};
> >  		};
> > +
> > +		rtc {
> > +			compatible = "dlg,da9063-rtc";
> > +		};
> > +
> > +		wdt {
> > +			compatible = "dlg,da9063-watchdog";
> > +		};
> >  	};
> >  };

Thanks. However, wouldn't be better to merged this patch and the whole
series instead:

http://lists.infradead.org/pipermail/linux-riscv/2021-November/010234.html

Regards,
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
