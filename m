Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137E1C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 23:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQ5EDDU/C92LzXD5AAhhPsQPGf7kuqPY37Alzmox9aU=; b=H7AqSK07yTQGtWtBkvEmZuGusJ
	TEZQ+qezPnSb6dCIRBU88ry3LqCo4VIpB9Qx9gJl6vPz7Kk+n/TYRxlXcY45GW/HFBbRWej6+rRyh
	vWwtcZDzpvpJoJzjLiX81fxDgtKOtX7MWhBNLScWUQ32lavlO432CfuwsQ3nlC79obcown04NIfnh
	Byx6aDg2WwajQ9XNvOeTQ2NDJMXKrTqrA40bi8ncnaQwKiH5QF/BDxGXpYDpeYO6kz+pge7bjJjFa
	8r1NEKA1abN21zZmZDQyxuw/DwXsbAjNK2TmcrdBVOAeaXspqKOOAWK/6JBSPyVsFLtPNPtL6xZaT
	0SiPwhag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIHkm-002wnf-KM; Wed, 18 Jan 2023 23:22:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIHkk-002wnD-3K
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 23:21:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D8DA61831;
	Wed, 18 Jan 2023 23:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85F1C433D2;
	Wed, 18 Jan 2023 23:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674084116;
	bh=i9S00yMf8qyKo0oOTiPvurWtSMXbNJFJ77YkIhe5t5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2upfGLoOgCF/BO7wNwbw0zmOs/IH5KaUcAgR+WtytEGd3TIOcjEaMg494JQ0vQg5
	 +xd6jbXucRrs2bbFavMHNvSfIQUSNxl7tsQPa0Mik175+pNhiO2if7w3doJCmO08+m
	 3zxlRgCanZ5MOLYRlQWb+semP4UzRWhPBacSSrtwiJcq4r44ym70MmGI95Hv1TyqQ8
	 iC6rA/UMCi76PbYqwV5Ed0laNIzujEkvZP23U4OoCdrF2fdNTETEtFMy6Pw3Kmv4hA
	 IumOC6XmGFP33tHbJNLDQ3Eg4rn48ni1Rvj79PlZ1G+s37IgMm+21rit1JIA93VQPB
	 kofi6m4FLuCng==
Date: Wed, 18 Jan 2023 23:21:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v4 0/7] Add Ethernet driver for StarFive JH7110 SoC
Message-ID: <Y8h/D7I7/2KhgM00@spud>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_152158_198741_93CD53E1 
X-CRM114-Status: GOOD (  17.12  )
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
Content-Type: multipart/mixed; boundary="===============4594745844444290129=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4594745844444290129==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CP+gNPEkC7FNanYh"
Content-Disposition: inline


--CP+gNPEkC7FNanYh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Yanhong!

On Wed, Jan 18, 2023 at 02:16:54PM +0800, Yanhong Wang wrote:
> This series adds ethernet support for the StarFive JH7110 RISC-V SoC. The=
 series
> includes MAC driver. The MAC version is dwmac-5.20 (from Synopsys DesignW=
are).
> For more information and support, you can visit RVspace wiki[1].
> =09
> This patchset should be applied after the patchset [2], [3], [4].
> [1] https://wiki.rvspace.org/
> [2] https://lore.kernel.org/all/20221118010627.70576-1-hal.feng@starfivet=
ech.com/
> [3] https://lore.kernel.org/all/20221118011108.70715-1-hal.feng@starfivet=
ech.com/
> [4] https://lore.kernel.org/all/20221118011714.70877-1-hal.feng@starfivet=
ech.com/

I've got those series applied, albeit locally, since they're not ready,
but I cannot get the Ethernet to work properly on my board.
I boot all of my dev boards w/ tftp, and the visionfive2 is no exception.
The fact that I am getting to the kernel in the first place means the
ethernet is working in the factory supplied U-Boot [1].

However, in Linux this ethernet port does not appear to work at all.
The other ethernet port is functional in Linux, but not in the factory
supplied U-Boot.

Is this a known issue? If it's not, I'll post the logs somewhere for
you. In case it is relevant, my board is a v1.2a.

Thanks,
Conor.

1 - U-Boot 2021.10 (Oct 31 2022 - 12:11:37 +0800), Build: jenkins-VF2_515_B=
ranch_SDK_Release-10

--CP+gNPEkC7FNanYh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8h/DwAKCRB4tDGHoIJi
0kw8AP9GfecCx2UsoFt4mQLdt1S4n6zge+JkYT0BSfNEGwD7rQEAqPYvoYDK4Awd
bkmwzm7jj5RXNYNbs51sEKR/of7XXQ8=
=g7DT
-----END PGP SIGNATURE-----

--CP+gNPEkC7FNanYh--


--===============4594745844444290129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4594745844444290129==--

