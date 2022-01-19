Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B4AC43219
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1ytWieoeunoziZPzII17NcPy2W03sn3QuQitbRpNec=; b=3T2hMRBq427qygBmM6DcNCidZq
	e1NiZGRta+o96MhN9uod3TutXCVcil5o5QktCZ0UxRFcUR5VI33PQ2uRMuProzh5kDF0PBJsx4BL/
	MGKWCBhHiENs9wiwldW6kO/CEepuGeAGdswzoeGCbJrJ1oCevRvyHWzQgFFy8iC4d+2+dYo/dg4Gg
	E3KGoePCEq2eXZT2ZP6l8d4ylnw2GL7ymC8tONfxxY16BXR1f1PUrsMYOvM/DIV8fhJQQmdUGFDD+
	3Xt2AxhqTLQmvMigt/O3hI8rjovuU72WwTxnU6MRMgffpYa1Yqjq5qUmZd3aiznfcepDLfFHtXWFO
	DGW7S1Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAD9h-006Cms-H1; Wed, 19 Jan 2022 15:45:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAD9e-006Cla-Hf; Wed, 19 Jan 2022 15:45:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1AB961518;
 Wed, 19 Jan 2022 15:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1238AC004E1;
 Wed, 19 Jan 2022 15:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642607145;
 bh=lGvpU5SU2oeO2Gj2gUOdONvIDUBxvoCyLVrP9LdAyK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uFHSCn+eRhus5s0gMFtlk4M/7JhocnfANlW1cVHA0G6W01cpJd8F+h8fndGiFBKZn
 nCZZCtAQC4k7abNvVhvbVvzHZ7dwbuD74/T+NiX/IT3CWwnmAbzJ0EI/MN3ouRA4NK
 JcMa2vYnHRlxojVgmRVHQy8kAseKCb6RYvwbbz/tuDQ+FYrQPMEKinDs+/J/QCmOle
 OH44fC1gV0pSNhO5CC8MUprlf5WJ73QIy9YW2JqYDexDIA+m9Gz2JyKjFMMikgheJ8
 PhLYlTQI+6mhi8SuY2B8vNy7F68ziMiWUL/NDEe4veZOx2TcwQKBwmk2W+zhD/Bwkn
 UzTQKF64F/eMw==
Date: Wed, 19 Jan 2022 15:45:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Vinod Koul <vkoul@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jakub Kicinski <kuba@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Sebastian Reichel <sre@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
Message-ID: <YegyGbGcwSNo49gY@sirena.org.uk>
References: <20220119015038.2433585-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
X-Cookie: This bag is recyclable.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_074546_691778_3EE06BBB 
X-CRM114-Status: GOOD (  14.03  )
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
Content-Type: multipart/mixed; boundary="===============4530758177909035433=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4530758177909035433==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="czK8d+IES+j+3Pl3"
Content-Disposition: inline


--czK8d+IES+j+3Pl3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 18, 2022 at 07:50:38PM -0600, Rob Herring wrote:
> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. Many schemas for
> phandle-array properties aren't clear in the schema which case applies
> though the description usually describes it.

Acked-by: Mark Brown <broonie@kernel.org>

--czK8d+IES+j+3Pl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHoMhgACgkQJNaLcl1U
h9AndQf6AqqY9YG2aSYiiYYVIPZoOOjUX2h6CnkvjYCVewt5gN+SxENXpgaLc0p7
vUq1Rp5AXTu7uFjL2ebgJ8UZPO5cjNIcj81k5OTqRYCvRBqWrPJpsacwSvuNAIUC
wrrUMNkFdRa0zaMGhMzVeaIAH9o5nqER6z2qXqGG9ccVbPBok8wg6W1xQCDlmyp8
wzYMD1gLPXMihGy7mzkZd/BHFVdUjKVmYlGiUNl7GI9MVp6v8wt8BbDP4qng30Yz
BLjhS3YyPDXdeYumU5Mvht+JzYmhn8Ihggw6dbQf6dO/UjwL+5ApN6em8mMhc0VH
9cXSuI+tv6I8BrIvDkVLV+hVCpjdBg==
=GpmZ
-----END PGP SIGNATURE-----

--czK8d+IES+j+3Pl3--


--===============4530758177909035433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4530758177909035433==--

