Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2EBC001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 10:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPM5y/+kEXPxNnquVX87JKkpRQBX63cpSIKqkJ6oLS0=; b=zR15DNt0nLSk3594D/7EYQCz5L
	56kXvz/MqfQNx+m9D37KDHkByP7gPVC26yQsNZlZzxu6Ysr3qFpoEZ+YzMEoYanz5K/A1xUEVbDGO
	IjQhemXm8YBxniArW1+vXf2fIQyNVps1cuhDqVuPhnkp89NClqM1OwJTWdwqawvBL/CT5SqSVoQjx
	luC++zAByjF6X/n05kKz3cS3KOcWBwmitonH4kdnUW3nCOrouT0rYIM0l8xdaSpHUlG5dmYvGMzW0
	xxhzUICm9XABKNOTGAndjYnStfGH2DRmyb02AENtcAGcYAQTFaAAYsAke6naFG5j/LF/vjHak0ZfE
	g41iApAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTKCq-002KsL-34;
	Tue, 08 Aug 2023 10:44:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTKCb-002Kh6-1e
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 10:44:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7896624A0;
	Tue,  8 Aug 2023 10:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294EEC433C7;
	Tue,  8 Aug 2023 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691491476;
	bh=V/umhZTGl3evHtInzC211fdgJQGdc7LiET+/8luRldw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DfFlpldYwSRpM2j1rpKqckV466YsUzwY+XAIqjL4gid3Zgl2JNmmxgeNVToD9nTBt
	 dugoK7A2LEEwRPz0mJtNzvhYSKhigNLrAy9sOIJPi9iY/KOo9Axdw0sUX9j3Y/MJuk
	 8b0ZBH5Nw6LtWQOgJRUvWMOPY8mL+TnkDxRMemgR8zjnDtfZv76rqxyO46XLx3q1FU
	 0Ke9D+42xkd6yBtTMa4subvtzbIKu4m4lJhBHBCend65RpLsbzAFqQ1YiMNsOZ8AL9
	 3aj76VJkpzWOIyK+GyPZEraKxwYRXAL2lKqqj/3M/DhZyJpEbfCwFJ995r/LAqG+o8
	 Dkur1MG63RPKA==
Date: Tue, 8 Aug 2023 11:44:31 +0100
From: Conor Dooley <conor@kernel.org>
To: JiaJie Ho <jiajie.ho@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] riscv: dts: starfive - Add crypto and trng node
Message-ID: <20230808-fiber-stifle-430ab25390be@spud>
References: <20230808061150.81491-1-jiajie.ho@starfivetech.com>
 <20230808-despair-calm-40ca60de2afb@spud>
 <6c26992dca244c6eab05b64a16be0d0c@EXMBX068.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <6c26992dca244c6eab05b64a16be0d0c@EXMBX068.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_034437_617790_A29E4797 
X-CRM114-Status: GOOD (  17.27  )
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
Content-Type: multipart/mixed; boundary="===============0847425850780420158=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0847425850780420158==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RgPVqGKbYiebNqo8"
Content-Disposition: inline


--RgPVqGKbYiebNqo8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2023 at 10:17:22AM +0000, JiaJie Ho wrote:
> > On Tue, Aug 08, 2023 at 02:11:48PM +0800, Jia Jie Ho wrote:
> > > The following patches add hardware cryptographic and trng module nodes
> > > to JH7110 dts. Patches have been tested on VisionFive2 board.
> > >
> > > Best regards,
> > > Jia Jie
> > >
> > > Jia Jie Ho (2):
> > >   riscv: dts: starfive - Add crypto and DMA node for JH7110
> >=20
> > >   riscv: dts: starfive - Add hwrng node for JH7110 SoC
> >=20
> > I only got one patch, where is the other?
>=20
> Hi Conor,
> My mailing server failed to send out the 2nd patch.
> Do I resend the patch or send it out together with other fixes in v2?

A fixed up v2 please.

--RgPVqGKbYiebNqo8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNIcjwAKCRB4tDGHoIJi
0qjkAQC1Ijbj5bIIJ9R2E2WPDNjZr3nVjnA6RDcKtkWkXI0ATQEAoi1Wsv4j9Qiq
rV/3HbsbpW1FWrJT7qhMXFwBYWIqjAI=
=sG6w
-----END PGP SIGNATURE-----

--RgPVqGKbYiebNqo8--


--===============0847425850780420158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0847425850780420158==--

