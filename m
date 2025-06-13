Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DDAC71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXtDneotKFHHwsylneNzAr9hMkzjvKTerHwJPmSYnsA=; b=psaWXr26fPkouLQOeyeb3Ajrlm
	UputKPcix2hfFOguqtS0jovlyqPDXBrX0lfcx1o2hNftq+6e6bo1X4iEKvDFKpAY9Tr7bf/D/EwnS
	FRXTnYC01IxctMD2zjNYrdC30RMXXUBzJv9y3EQfNQvwXaG1o83Xl0hqLSt+EimgNJyNICNTtBxMC
	6qeh8ltW8N3Lq8EeGgKgPCI0BBomjhJs0G6ieNL4r4Eq4Ox0Nw2YuM+AAh/RIoaZm4XaVKkzfw3Gy
	fIuLq+xPEagfaBuDNQ3b+KsBeDf7cuzNVO0i/IWqrIKZuF/CMd7lMyebj+2LbaRb8ZOYLklf1YlXS
	34+mPV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6cC-0000000Gwkh-1vxj;
	Fri, 13 Jun 2025 15:46:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5ct-0000000GjRI-4A22
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 14:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C07B45C65C3;
	Fri, 13 Jun 2025 14:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C1EC4CEE3;
	Fri, 13 Jun 2025 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825807;
	bh=FhXXXGmaRCUAiRGRLmZdTk6rfR0K44mNdX06Z2gh+Dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gU3VhMCvbEUpkeYtCm1sdiEbZCDtGB0/CaVg498QB4KCpsaQjBatRuDSK6B3/TBq5
	 LSrgWYiWAwWHVtD6pvP6Py13HIq+0odrKGJrw82l7KmXE9n+C2oLTOepY6ratFP9ep
	 YPat9WUK1PGkA83Y+YmS9m5Lt2c/OqN1Q8NqiZh3GWRnM/JEpWRgnN2jQN/u+5I77z
	 FH4YUNHjEfcJNrRFfsYO1VRmfGO+eEayCERolh84NFhe5IMYVAm7yZwe703o7UiFp5
	 lqAuKH45uxbeysx065G8tS23ws7+G3LN5HbQoPDXKhmOwRoCkQzOzcXgFrwWklKnvM
	 uZ63XxBS2i8/Q==
Date: Fri, 13 Jun 2025 15:43:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>, Vivian Wang <uwu@dram.page>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: Add support for SpacemiT
 K1
Message-ID: <20250613-charbroil-backlands-7cf485ac7f59@spud>
References: <20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn>
 <20250613-net-k1-emac-v1-1-cc6f9e510667@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20250613-net-k1-emac-v1-1-cc6f9e510667@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_074328_067747_9005D190 
X-CRM114-Status: UNSURE (   9.48  )
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
Content-Type: multipart/mixed; boundary="===============8157763443990646988=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8157763443990646988==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DrcNRgrkpAYQRveH"
Content-Disposition: inline


--DrcNRgrkpAYQRveH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 10:15:07AM +0800, Vivian Wang wrote:
> The Ethernet MACs on SpacemiT K1 appears to be a custom design. SpacemiT
> refers to them as "EMAC", so let's just call them "spacemit,k1-emac".
>=20
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--DrcNRgrkpAYQRveH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEw5CAAKCRB4tDGHoIJi
0mUZAQDOqutaHQTNkzdtMom2o9B3nbuwKSuSLIduFjJKalvmiwD/YsHTvrRH0WFf
qgTLhLoSPa5oUwkptRwAi4wYwCtGHA8=
=4VR+
-----END PGP SIGNATURE-----

--DrcNRgrkpAYQRveH--


--===============8157763443990646988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8157763443990646988==--

