Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00775106FD9E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGktjpVGv0H/q4mf0v1I5IflBP0gH6PeheDwKoxSWiM=; b=I5+Wpae53dstMAK2S0hl1U8sqa
	uEiqAq2tVFcfUPLD/w1muKoNHj/roNQLbpfdWmXiq0Btytr7ycmQosoi6QUnhWAcOiD+9GyJDkk8H
	7upOEWC8V+vIl5mU9jF7LdcHcINxXEIn963vmqUKLM/tlrX//wYT7DhlPrDDVICIlke8Of9mNJhd6
	TGQ7DwRIWiFPsF25fixoapV9JjGMnEL9xyHq89CFALZ09Mk0Ia5hgtX5bA+BmSXX8LjYFRLTIPMD9
	xdBsmCT4bQKBKbPZDQ4e0bNJpOxnyn/GFNc5RU6wcJ6Iag4lDePFt2fpBRq3lqjRFqzUmfgKLsEw+
	nPzw1XmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xrp-0000000HFTW-2Xfe;
	Fri, 13 Mar 2026 08:27:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xrn-0000000HFS0-27ht;
	Fri, 13 Mar 2026 08:27:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B75E660142;
	Fri, 13 Mar 2026 08:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7BEC19421;
	Fri, 13 Mar 2026 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773390450;
	bh=LjjmvM/vmaS4//USd0RW7tvsnLCWGGdQkTrz5/AWVp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DPPni+lYDoaOn1Ag3kuyj0AQj8FTTurKfSI6YHa2F1wcx6tllEIeZERg44A1o40lL
	 NBgrny4mrciTQTm+Braqu4OFRCMM3dcYEl1SHuJn4iDd9eRGqPxvL+UA852MIdW1xF
	 SU4qi3rDQEUScohJtYI4mFVdAlGmyojMScYhw3bsrx29Ctigy+thqVIS/BMMK8vkJE
	 GlSG9027eyW1Z6idxnfM4oYSyygA1YCYXWob/GSoDv3hKVvFXgmqIY+8tO+Vxxefc7
	 nE/NQGUNBnxc/LXfIESoIQGzHbiVGdOD+0wOJNk7YzS0cgMAr083vwFOGNaBac56TH
	 ZjMXgLfJ2F34g==
Date: Fri, 13 Mar 2026 09:27:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
Message-ID: <20260313-dexterous-lively-jaguarundi-72bfef@houat>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
 <20260312181654.2d9ba69c@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260312181654.2d9ba69c@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============3674931241724647008=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3674931241724647008==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="pxy5ukm7k3gyqla3"
Content-Disposition: inline


--pxy5ukm7k3gyqla3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
MIME-Version: 1.0

Hi Jakub,

On Thu, Mar 12, 2026 at 06:16:54PM -0700, Jakub Kicinski wrote:
> On Wed, 11 Mar 2026 18:03:35 +0100 Bartosz Golaszewski wrote:
> > Add support for the firmware-managed variant of the DesignWare MAC on
> > the sa8255p platform. This series contains new DT bindings and driver
> > changes required to support the MAC in the STMMAC driver.
> >=20
> > It also reorganizes the ethqos code quite a bit to make the introduction
> > of power domains into the driver a bit easier on the eye.
>=20
> Not entirely sure what the conclusion was in the sub-thread with Russell
> but FWIW this doesn't apply to net-next as posted so respin will be
> needed either way.

We'd really like for this series to go in, so fwiw I'd prefer that we
don't create a dependency on a series that has never been posted for
this to be merged.

Maxime

--pxy5ukm7k3gyqla3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabPKagAKCRAnX84Zoj2+
dq/cAX9HbQPDp+u+6RAvVqRXiVlUqq7qrs2GAioBq5qsajRY1mqIABlDjHVyOc8v
8oDz3SwBfiJTavhwpPgjJQ9YAcH4JcHjnzxAs88eFjbDLDYSe2mAKK7fP8U02MfH
qIGBmEr8gg==
=zTCu
-----END PGP SIGNATURE-----

--pxy5ukm7k3gyqla3--


--===============3674931241724647008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3674931241724647008==--

