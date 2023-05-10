Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAE5C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 20:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/V3NWhnXvVTpZjl7Bo+MK2BUd7rJ2NOsnHBQApf2xM=; b=FID8R3fwEaEdhuA4OP13AtY7bb
	8BYFl/CQzihssirluB3+hK6ibvYIfyoJy2GZd2DHEB5HMDUoPvPk89nzzzp2CXJsLYfk3QnwtBFmp
	zjPxGh5fJYwzO/R4WYGoa4T7uER+l72D5m1LYG9mF+whraqze2Qepudw70BYbpVweanaFHt2iGGzL
	Sw1NqFdblzTXkbrYOIDguMrQ3tLhmzBlFkREa/0jOg7q4eFWlln8U+eztFfUwac2y9cqcUX23S61/
	1jzbQACRaYPXqC++9Biojloadk0IbUWQKjENvy06ajsef/KYVL97IB+8B3PmfR11xL6DhFWPDcwe7
	UG9V0TVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqKp-006vmI-2x;
	Wed, 10 May 2023 20:22:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqKn-006vlv-1K
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 20:22:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBD2C635DA;
	Wed, 10 May 2023 20:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E19C433D2;
	Wed, 10 May 2023 20:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683750168;
	bh=K0GUlOR4QFLJUalaWA8czdBLmxA0PE/dUqa1IdlNM58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQSM9Jbdo2MKbuEXEtf8mlc1NHfEJWAenPeiZ6OuxEetwTlENaz1zIaRwYfYm8Ybl
	 mFykHJOoMFRz9OcYJXjpEmX9rqgPXAw3sak4bRETTvDhiUaYwVlA3KXUNot/XL1ZM/
	 29aQj849FvN6rVYc6+QrSrevIUkvmUgDYXkwwqulhNuuRljN5Zhm8FP6j4u7OdGIlQ
	 oho0Pg8DGjdD9ccVsy9tnExQr6FOdhaTCaPZS+OVCnE+n5LzfTDGDiM+AlJ9ZL+nGq
	 Yau74pkriEmOH3fDEUkGLRn2Szn8IjR1yj/TCkSDIDk9zPXHGuSMkQyuMt0LnwT+Ut
	 zgnqc0soAI51A==
Date: Wed, 10 May 2023 21:22:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add tdm node and sound card
Message-ID: <20230510-riveter-ridden-3f056251e623@spud>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-4-walker.chen@starfivetech.com>
 <a0932e84-3813-bbbe-762d-948d75fbcd8a@starfivetech.com>
 <20230509-overheat-pliable-00d60523637e@spud>
 <CAJM55Z9AxMVw=ymfFBb=45nODq89O8dMebzRgo-XD0GKduDBYg@mail.gmail.com>
 <f27b7ee7-f23a-35a2-3b82-71f50871dfcc@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <f27b7ee7-f23a-35a2-3b82-71f50871dfcc@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_132249_524797_5F6E740C 
X-CRM114-Status: GOOD (  28.39  )
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
Content-Type: multipart/mixed; boundary="===============4190624431511991113=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4190624431511991113==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R5rGeiM6/5QEp4La"
Content-Disposition: inline


--R5rGeiM6/5QEp4La
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 05:21:21PM +0800, Walker Chen wrote:
> On 2023/5/10 16:33, Emil Renner Berthing wrote:
> > On Tue, 9 May 2023 at 20:05, Conor Dooley <conor@kernel.org> wrote:
> >>
> >> On Tue, May 09, 2023 at 08:52:48PM +0800, Walker Chen wrote:
> >> > Hi Conor/Emil,
> >> >
> >> > DT overlay is used to describe combinations of VF2 and hat.
> >> > Do you have any comments on this patch ?
> >>
> >> I seem to recall that he said at the linux-riscv sync-up call that we
> >> have* that he was not in favour of overlays for hats like this.
> >> I'll let him confirm that though, I might very well be misinterpreting=
 or
> >> misremembering what he said.
> >=20
> > What probably meant was that I didn't want a bunch of different device
> > trees for each combination board * hat. An overlay makes a lot more
> > sense. However, looking through the kernel tree there is a surprising
> > lack of overlays for hats committed already, so I suspect there is
> > some sort of policy around overlays already in place.

> About the specific usage of overlay for this board + hat, referenced to t=
he following example in kernel:
> linux/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtso
> That board is connected with imx219 sensor via mipi_csi interface. That p=
atch was accepted in 2022.

Hmm, so spoke to Emil again today about it. In the interest of being
fair, I did go looking at that particular board & looked through their
documentation for more information on why there are overlays.
They do actually sell the bits required to use the overlays, based on
what I saw in their datasheet for the board & wiki. That said, what is
done for one arm64 platform does not necessarily apply elsewhere ;)

I'm not against allowing in-tree overlays for hats/capes/daughter-boards
that come bundled with a board, but accepting ones for a hat that
someone decided to use theoretically has no limit! The "someone" in this
case might be a StarFive developer, but it could be any random one of
your customers next!
We've got to draw a line somewhere, so my answer to the overlay *in this
case* is a no. Sorry.
When you submit your next version, please drop the overlay from this
patch.
Thanks,
Conor.

--R5rGeiM6/5QEp4La
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFv9EwAKCRB4tDGHoIJi
0pgOAP9eU2ZWh7+ycauV2k2tsHEtiJcGiCvC1lBDQL6aVqzqJQD/St1K7BA7Q9BW
NSqEGApfEX6ctSZmnzWY8/sp72lCmQI=
=JAZI
-----END PGP SIGNATURE-----

--R5rGeiM6/5QEp4La--


--===============4190624431511991113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4190624431511991113==--

