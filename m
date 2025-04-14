Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DCCC369B2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 08:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUvFVyaEuksXcxbkniRpx+S/7z5/r9kcA3GXQoioqu0=; b=KBystijP2QItOW
	CSHVjqBbsPQx3HCmV1jV9iD+yOaNBkGhh43X2QAujHKkECHzLP/dDWuf9nyarTyz0scnYHtmVyDVO
	lXMyImKrXqUtELSq7uaOEMpxFJWN5kA8koACsNEHiifr+2iP81R0hxt7OwANSdAwAEBY8pjutIu5e
	SedkqtTUETdqqsGANK7hfV2qnaos+5pQOg7H+fb9Wh74NOVyiaWqkq5+DlgYZmuFtiOYY8QNxpqdP
	ZhdBixufsnqx1P4FLdyTIxlmrbeNCtTegRyXmy/2Ba/XQUh0Gqt9l5cOXmSU7wtRj+RgFL9HSgJ2e
	ong4s7IicVrqV9Vonzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Eo7-000000011MW-1pVm;
	Mon, 14 Apr 2025 08:04:43 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EnN-000000011F6-06zM
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 08:03:58 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7AD2B343029;
	Mon, 14 Apr 2025 08:03:54 +0000 (UTC)
Date: Mon, 14 Apr 2025 08:03:44 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	drew@pdp7.com, inochiama@gmail.com, geert+renesas@glider.be,
	heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com,
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr,
	elder@riscstar.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 7/9] riscv: dts: spacemit: Add PWM14 backlight support
 for BPI-F3
Message-ID: <20250414080344-GYA28186@gentoo>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-8-guodong@riscstar.com>
 <5lfnxricxm2k3fuf6nfvjd6cbkmsjkx7inoi52uy5uwwvld7sq@abn4i62tdics>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5lfnxricxm2k3fuf6nfvjd6cbkmsjkx7inoi52uy5uwwvld7sq@abn4i62tdics>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_010357_085116_177207E1 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

Hi Uwe,

On 07:58 Mon 14 Apr     , Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> On Fri, Apr 11, 2025 at 09:14:21PM +0800, Guodong Xu wrote:
> > +&pwm14 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pwm14_1_cfg>;
> > +	status =3D "disabled";
> > +};
> =

> I wonder if the pinctrl properties can better be added to the SoC's
> .dtsi file. (Only applies if this is a canonical choice, i.e. there is
> no other possible output configuration.)
> =

I'd agree it's a good idea and should follow, but unfortunately in the
practical case, all pwm able to route to at least two different pins..

https://developer.spacemit.com/documentation?token=3DYiJZwXA2Ri4nJikV9E1cp6=
nqnMh
see section: 4.5 Multi-Function I/O Pin Assignments

-- =

Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
