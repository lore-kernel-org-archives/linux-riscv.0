Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990FBC5AD49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 21:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rc97uK6DzGdpUP+2NtwokLy/X6jliq6M9KKAfq2eYyo=; b=BpIhsjUrBX2+JT
	plqinHDKrt4FuaGpJDDE9nAh5+UjLovGbeNLuWd4YrA31IMRd5kRtRwmCl93hLeurCMK6dC90Gif2
	2kue+wFPUTOWVBfLGpTV3m/P6HcSQzpUruEMf6NYwq1MJYZKW8g3VL4ZtlSS/5KpMh91mMDmyhzt5
	U/THsTDM84EZn0EM0hnQkMNFo78flTIk9gI3kKedL/h9vk3LDsayUSnmnZYyQWY0j+/I5bU5u4Pul
	QChKo/HY6+YVgh6SZ/N/lKiJ+h/hb9kVeb4UJEpN1oH/fWvYhOHCwLmkNoySYghcY1mgaM6Jlre1P
	jA/5wnrsGeo1EN1BUKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJfkc-00000009Yrw-1sMv;
	Mon, 26 May 2025 21:52:54 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJfkZ-00000009YrZ-1tYi
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 21:52:52 +0000
Received: from localhost (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id F30B7342FB5;
	Mon, 26 May 2025 21:52:47 +0000 (UTC)
Date: Mon, 26 May 2025 21:52:43 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	drew@pdp7.com, inochiama@gmail.com, geert+renesas@glider.be,
	heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com,
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com, elder@riscstar.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
Message-ID: <20250526215243-GYA53128@gentoo>
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <20250429085048.1310409-5-guodong@riscstar.com>
 <paasmwjel652r25nxobidydtpxfjy7emerilmwqhvhtgrrtg6v@gowpzqdzvlfz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <paasmwjel652r25nxobidydtpxfjy7emerilmwqhvhtgrrtg6v@gowpzqdzvlfz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_145251_516721_7C6017AD 
X-CRM114-Status: GOOD (  11.32  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Guodong, Uwe,

On 18:54 Mon 26 May     , Uwe Kleine-K=F6nig wrote:
> On Tue, Apr 29, 2025 at 04:50:46PM +0800, Guodong Xu wrote:
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/=
boot/dts/spacemit/k1-pinctrl.dtsi
> > index 283663647a86..195eb8874f3c 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > @@ -20,4 +20,11 @@ uart0-2-pins {
> >  			drive-strength =3D <32>;
> >  		};
> >  	};
> > +	pwm14_1_cfg: pwm14-1-cfg {
> > +		pwm14-1-pins {
> > +			pinmux =3D <K1_PADCONF(44, 4)>;
> > +			bias-pull-up =3D <0>;
> > +			drive-strength =3D <32>;
> > +		};
> > +	};
> =

> There is a newline expected before the pwm14-1-cfg node, isn't there?
> =

Right, I could amend this and fix it while applying this patch
(so if there is no other serious issue, no need to resend)

-- =

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
