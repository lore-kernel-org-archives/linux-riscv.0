Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EF11061B13
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 16:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emmH//+5wkZYBJEjMhRNUYotOVPsGUpO8cT7Xasa8I0=; b=uDl7XaYQ6SHHy/Q0DHY5BTFdnS
	ZQ8ybI32Cqy/IEIBJ7ahbaD9msycGXb6pkXT/K6MxQwdX4dyaBnl1HZXmRu+OZKNCZ40/A+gZC0UZ
	RYvNS8r87jo27HReUQ1OuCsnf5gSNMsf7l6hK31zLXUpTHJtzSFWMC0C9S3N4PXNZKWy4gvCmWvf9
	NHoUwUUM6VTtzze2VPlEaEDo8lyjSFHBT6JIZrLDDarih/p+Hbb4jVxF9h+ockQUZBMsOf0jqwOJs
	dGD1t/UKyRqNCo25dLPxD+I1fz2FM016JOxmYLGzie+J7IrcWNIlD2bdSu4N4ovrl5GQ0d3Cx9LWm
	PLyVu2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7FM0-0000000BdnL-1vIs;
	Mon, 30 Mar 2026 16:20:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7FLx-0000000BdlK-3eBH
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 16:20:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20E2D434C2;
	Mon, 30 Mar 2026 16:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8E3C4CEF7;
	Mon, 30 Mar 2026 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774887637;
	bh=rvTE++tgOitsGs2Y5jYidVeu41glWxg6G+cKvLPLnGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GcthOs636sJ8lW8i4u5Tm1Cf2Jv6BhCic+msh3mNSCaVdzh/ZuI8fLi9/sMZvLfQX
	 DDSPrCAqV6jAmbAon1d+I8YVkEqbh7Tw530Lr0ti7FwccaW+fmOsDXpa2BJz9I4sPl
	 jzgTMJbIm809bTm30XHfPyeueKsFmob8RWsGVmjYERCklaM1WS6glROFr7MFg6xi6Y
	 r2fojM/A9oCsIQtxBHTrIBRfejmZAFuno2NMOYw0uxg3+Q3u9Id9VMO0c6Gh5sIksF
	 elEF5Exn5HSZhSW1dc/unEUpL6PVCg26OtTaYs8mbxGZsaK3ohGxoNXjsj4YxuJuYK
	 ivGtZyb1dkwVg==
Date: Mon, 30 Mar 2026 17:20:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: patchwork-bot+netdevbpf@kernel.org, netdev@vger.kernel.org,
	conor.dooley@microchip.com, Valentina.FernandezAlanis@microchip.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	daire.mcnamara@microchip.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, richardcochran@gmail.com,
	samuel.holland@sifive.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dave.stevenson@raspberrypi.com, sean.anderson@linux.dev,
	vineeth.karumanchi@amd.com, abin.joseph@amd.com,
	theo.lebrun@bootlin.com, Ryan.Wanner@microchip.com,
	haokexin@gmail.com
Subject: Re: [PATCH net-next v5 00/14] macb usrio/tsu patches
Message-ID: <20260330-repair-unclip-024a203a427d@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
 <177482042554.472023.12757157452690281696.git-patchwork-notify@kernel.org>
 <06a701dcc014$86def5b0$949ce110$@trustnetic.com>
MIME-Version: 1.0
In-Reply-To: <06a701dcc014$86def5b0$949ce110$@trustnetic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_092037_969366_CC0B6DF7 
X-CRM114-Status: GOOD (  16.72  )
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
Content-Type: multipart/mixed; boundary="===============2882698619048754134=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2882698619048754134==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcgC+RFxv1+AgoSL"
Content-Disposition: inline


--lcgC+RFxv1+AgoSL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 03:12:10PM +0800, Jiawen Wu wrote:
> > Hello:
> >=20
> > This series was applied to netdev/net-next.git (main)
> > by Jakub Kicinski <kuba@kernel.org>:
> >=20
> > On Wed, 25 Mar 2026 16:28:04 +0000 you wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Hey folks,
> > >
> > > At the very least, it'd be good of the soc vendor folks could check
> > > their platforms and see if their usrio stuff actually lines up with w=
hat
> > > the driver currently calls "macb_default_usrio". Ours didn't and it w=
as
> > > a nasty surprise.
> > >
> > > [...]
> >=20
> > Here is the summary with links:

> >   - [net-next,v5,02/14] net: macb: rename macb_default_usrio to at91_de=
fault_usrio as not all platforms have mii mode control in

> There are compilation errors after merging this patch set.
> I believe the error occurred where the CONFIG_OF is not set.

Thanks for the report. I have sent what's hopefully a fix..

--lcgC+RFxv1+AgoSL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqizQAKCRB4tDGHoIJi
0vdJAP4q7bBsSYMfBK0DvfsAPRaNeZNEhFURu2I2OdVoIv0TNAD/dzYFRnqFWKSZ
0+nhVpkTC1V1ckbvZ1/OPOxg5PN2mQc=
=kUgB
-----END PGP SIGNATURE-----

--lcgC+RFxv1+AgoSL--


--===============2882698619048754134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2882698619048754134==--

