Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A7FC27C77
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2D5IuAD3L93NYiSqGOOaRkeBsXyvBxQfimZrm5gHDAQ=; b=W7Jws9UTNjA4Wt1BUrZlGDiWhz
	FfmOpaAUc4uYFyhU+9+H2Xs87WcZzqQnXaiEKvsIb8gLtwEM1DF3RTssL71lCd94ryYXFoyXOQyn7
	0RIc6SkbH3WJDUbmGL+y33SO6aS0A8eNtwK//Bb28DnltOvHOUmYSPAGNl2j8HV0bJag0ovU+ab5b
	7ZD3HoU7+8TZhOavdBfwvYLW7aqKRUM14gTLqg82412IhtQ7S4wYPdf38rU0ow8mAqVxfnTqIBz9y
	Q60Gl9rRsO5WOlA6GCURj1X5cesS2cKqce81vHWO+vZBQyMl2cj6iVlzFYOc+quGYidvXBVPoEEkv
	RXp0f/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHR1l-0000000DPjH-1tVC;
	Wed, 12 Jun 2024 16:40:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHR1h-0000000DPhW-0JhT
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 16:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F2F3614E5;
	Wed, 12 Jun 2024 16:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E9AC116B1;
	Wed, 12 Jun 2024 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718210444;
	bh=85XKwtq8lgNQ9l2YL8a7SauGQb3hZbNGMy8WU/0vk1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Onyhj8VnaDXMhsbCz7cO+Y8QwfDHUHrbPdQuUwf3RtVAPOQVp6hFN36QZkn8UZyjj
	 z1QiIOV9ySHhisFsBLEpfP2/jcgqX8ctchnG4WmeDsX3PaGsAEOnBNpF2HF8tMjpVI
	 wD+mXurj7sKz1FUlW6atUkUhBcvK35uqQ0c26t3unHt78YjVQJVoj7018kqF8S5LHR
	 LBWVa0N2JqW9XnK4rGJZskhVQOStjDYwhYUASlE46Z8ljlljsy1dHvta3r4ja0vywE
	 cEK/TmxyBAu12SgetSgLfa+6PAMVBdf4AzaMXC8ia2LsIELW/GWOx4VmHhJS1NWL/C
	 heUprjyrZFDQw==
Date: Wed, 12 Jun 2024 17:40:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-mmc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, cyril.jean@microchip.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: Re: [RFC v1 2/3] spi: microchip-core-qspi: Add regular transfers
Message-ID: <ZmnPh39YyfS4ocNU@finisterre.sirena.org.uk>
References: <20240612-brigade-shell-1f626e7e592f@spud>
 <20240612-uphold-dinner-a47b4c44be18@spud>
MIME-Version: 1.0
In-Reply-To: <20240612-uphold-dinner-a47b4c44be18@spud>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_094045_200937_477AC49A 
X-CRM114-Status: UNSURE (   8.40  )
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
Content-Type: multipart/mixed; boundary="===============5045928358895544269=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5045928358895544269==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MdwxjcRzQ3pyUpUj"
Content-Disposition: inline


--MdwxjcRzQ3pyUpUj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2024 at 04:48:32PM +0100, Conor Dooley wrote:

> +	//TODO: questionable robustness if both cs_change and cs_off toggle
> +	list_for_each_entry(t, &m->transfers, transfer_list) {
> +		//cs_change being set means we need to re-enable

Is it not possible to implement prepare_message() and transfer_one()
rather than open coding all this?

--MdwxjcRzQ3pyUpUj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZpz4YACgkQJNaLcl1U
h9AVQwf+MGtExjI/bWW1yGC4RO+HV4ZjtGV3c7j96NAiLdf+87svqV9in+GrvgRZ
Gv3J0UZoID/NR9sJoPYXZ1j9KR7cD/ps2pScjog4b8t7K1RKGzO1lck5WOlh+c4E
D9WThX1LgACsUO8N0tplHE2OK/86wJe6LiSrJttKezDV+RpuvevMMAFs1vv9M+CV
abVC0AHa//7OZ9gYfzg3tLeclZCtrnHSvfG6ftXwso1glyYK3ky6sR+JN0BwvoXV
4o8mXO6+SyWkx7p/8FVVZ3qM21w3UHodxvslwMKAlXmAIdXes8c4v1wlUUuzr4sK
sSThubOWebv8HG4Pc3SfyEldXQ6CHQ==
=pdjw
-----END PGP SIGNATURE-----

--MdwxjcRzQ3pyUpUj--


--===============5045928358895544269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5045928358895544269==--

