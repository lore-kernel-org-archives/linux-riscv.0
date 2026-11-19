Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55859606A324
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WBrFOY0X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDnVsLn+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RlBIY9fkuK+P1f7I/Va+zDZJcMBvh1PyRexq1CWQKNc=; b=WBrFOY0XdI8w1XsiF2tYKKF4+j
	LUH+qJEhF6YGI0DR7VE1DsUk2kaS1yGmlDwYuSACAW8fI3G9vuipEGQFZnrYs5hHJ5D84ervZIFrM
	00cOkSUVVuHtke4UAmup89LL/MY9GTAW3y+pq5NKWtOJxxM+PC86/A3ItaCn5YPnTXWndjiTK6rxl
	7TgMwbEpLJu6G34I5C36vaPWP9xTYcWUxEYhNFIXuyndfz//mhw9LcH2qRtq+OlH+dVjRSCYSMZhC
	ckibHGfw94YKmRjECPuxHa+Coajx/tgqJ4IZyxMQHL/Da4WjaiMNqcH3EDV/vp/KG/lsrNdfNLzwc
	wlcg/8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU021-0000000BfZI-38OH;
	Thu, 19 Nov 2026 11:10:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU01z-0000000BfZA-2Eyq
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 11:10:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 574FD61AE5;
	Thu, 19 Nov 2026 11:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD43F1F000C4;
	Thu, 19 Nov 2026 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795086618;
	bh=vlXcs7mjCdcRGxHYT6jDvDJ2VAf258HQRNLzkFKinuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eDnVsLn+onMpj4FWOq7Ow5lKH+8u3sMUP0vM+4ahBTJwSW49eu3FfkXOjO1QSMXwO
	 hPQIuncMCtLTFwUNXbteH/EA2/vjK6xbXMuM0IEWqffJ23YtdXH7vujJBvY8E5ECj2
	 YKbMElttXoAW3yzULJOegY2BO3Elfar2STT8ews6JIHlLjw4yVFi6jAH1mEuGYCr9+
	 +1jDeJgusrIMn6qwspPXyk5B29/gtA/sWLWlWozLJ+pTokYc2gXOnEpEkHshSoOGkY
	 YY/HcU3zkWUKRouxnLVaA7cgbtIXf2JAMPB5EVXwnDPvg4WomuEiUAbLmktqAhCa11
	 yjRjh9QTrh4Yw==
Date: Thu, 19 Nov 2026 11:10:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Wang Yang <yang.wang@deepcomputing.io>
Cc: Aurelien Jarno <aurelien@aurel32.net>, Yixun Lan <dlan@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	broonie@kernel.org, yh_chung@aspeedtech.co
Subject: Re: [PATCH 1/9] dt-bindings: bus: Add SpacemiT K3 eSPI controller
Message-ID: <20261119-celibacy-parole-87117f5578a9@spud>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
 <20261118085742.1817536-2-yang.wang@deepcomputing.io>
 <20261118-backdrop-scrap-1bee34e06336@spud>
 <av4iWQb33bya48G1@aurel32.net>
 <20261119090553.1886090-1-yang.wang@deepcomputing.io>
 <20261119-defy-stumbling-72b230220a49@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261119-defy-stumbling-72b230220a49@spud>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1680032887093474336=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1680032887093474336==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ThY01y4AItJZWe4b"
Content-Disposition: inline

--ThY01y4AItJZWe4b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 11:02:03AM +0000, Conor Dooley wrote:
> On Thu, Nov 19, 2026 at 05:05:53PM +0800, Wang Yang wrote:
> > Hi Conor, Aurelien,
> >=20
> > > How is this "eSPI" different to the eSPI described in fsl,espi.yaml a=
nd
> > > implemented by a driver in drivers/spi?
> >=20
> > Thank you, Aurelien, for clarifying this. K3 uses the Intel-defined
> > eSPI interface intended to replace LPC. It is a different protocol from=
 the
> > Freescale/NXP SPI controller described by fsl,espi.yaml.
>=20
> Ah I think this might be confusing af, because that device also
> supports what it calls "eLBC"...

As in, I got confused while looking at the documentation for the fsl
device between what they were calling eSPI and eLBC, and also didn't
realised that it was lBc not lPc.. Too many similar-ish terms...

>=20
> > On K3, the controller exposes a CPU-accessible window for the eSPI
> > Peripheral Channel. The EC client accesses its command, response
> > and memory-map regions through this window, rather than exchanging
> > ordinary SPI messages.
> >=20
> > The proposed controller driver handles clocks, resets, link
> > configuration and window setup. The EC transport handles the EC
> > register mapping and host commands. The distinction is therefore
> > the protocol and access model, rather than the use of MMIO itself.
> >=20
> > I will make the Intel eSPI terminology and this access model
> > explicit in the binding description.
>=20
> Please take a look at a similar series from Aspeed and see if you can
> cooperate on creating something common between you:
> https://lore.kernel.org/all/20260313-upstream_espi-v1-0-9504428e1f43@aspe=
edtech.com/


--ThY01y4AItJZWe4b
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav7ZEwAKCRB4tDGHoIJi
0uWdAP0eNqiDJGtzGxm6n4vpqjW372f/8LLDhHExDcL1vkJGvQEAmAMw6HF3LruW
HG73JprYThSdt3/6oUWMkUShybcKSgU=
=wznF
-----END PGP SIGNATURE-----

--ThY01y4AItJZWe4b--


--===============1680032887093474336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1680032887093474336==--

