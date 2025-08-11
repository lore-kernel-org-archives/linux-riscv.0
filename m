Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5E4CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 01:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+DmvOBrOwdBHKuxPURAt/t7Ygj12552Foyagg5c0+s=; b=OMbpdeAaL0OlwAWCGKy+U+7/3U
	U/Vki51pENAF9g6TqM+Xb7HY+4VIDCExC6tasr70zNIW6Czc1ZQ+7mFMdmgbRGhXWPyW04FepPx8+
	2XdCVO8vg7lhYtOOivPTn0VU+SWYeYwv3pM6twJtZ1hU49jgSedPMwwsw1UEIeVQ/44wStLgmTHb1
	0HqnHF8Mtw6MQ/rDU+vTZoiX0hF1WIicZDYUgxnbsJ0YcJ3z1DJc7yAWtroMQA1Gh3yGdjzhIPMoM
	JWEUtcZaHvX7HAqazK1eDA12Gzu+GWc6O0G4zwFDjmIxpgi9eeh44oUTQmjWjRS7iboaE8Oil8FrK
	fcS2gItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ule5I-00000009XTi-2ybe;
	Tue, 12 Aug 2025 01:45:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXmi-00000008rBQ-3Sp1
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 19:02:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E3769A57614;
	Mon, 11 Aug 2025 19:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1882DC4CEED;
	Mon, 11 Aug 2025 19:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754938935;
	bh=EuHdKiXutHB5yCcWa/HyoBa738jpXyt09EwqvOg7gbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9fmZlHNga6bWyg6CnIOo1gp7IQCRH5dWaiEV7mY1R+K+VhcuxldmtHC4I1nRoJJ9
	 lIe8TYW64z1QH3iefJojxZzNd/qZZZjXwLX5X9shFGSQCHbOPixQvOdybTlcpSDE8H
	 n4FfADLtHrLMSWTokWq9GXrhpvE83a184wgAMokm4Ls86nwN1LLyBBNxn5JpUGv8rN
	 dgom3tHM/avsNxExvmE8pIUZ6jfrj1UoGvw+tW8/tLaOb2AkzBHP54mJB52qvjZ9g3
	 WrH/uLw2kXV3w5udkBDV3nKeLIudl6YOcZjoNH0vDjOKCMdiIF5IS4eLRfvzxJxks7
	 MbLBoNoUkPfCA==
Date: Mon, 11 Aug 2025 20:02:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2] dt-bindings: riscv: Add SiFive vendor extensions
 description
Message-ID: <20250811-darwinism-punch-8eaffc197cb4@spud>
References: <20250801070112.12071-1-nick.hu@sifive.com>
 <20250801-lunar-stream-0fdb3f0febec@spud>
 <CAKddAkDMd27icz6sa5xONAiWGcb8Un8CddHKyX1=jQzH7DCvZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKddAkDMd27icz6sa5xONAiWGcb8Un8CddHKyX1=jQzH7DCvZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_120216_931515_01F95ADA 
X-CRM114-Status: GOOD (  16.00  )
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
Content-Type: multipart/mixed; boundary="===============9128340888164144258=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9128340888164144258==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4OtjcrCPRSA3bkmJ"
Content-Disposition: inline


--4OtjcrCPRSA3bkmJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2025 at 11:38:34AM +0800, Nick Hu wrote:
> On Sat, Aug 2, 2025 at 3:31=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Fri, Aug 01, 2025 at 03:01:12PM +0800, Nick Hu wrote:
> > > Add description for SiFive vendor extensions "xsfcflushdlone",
> > > "xsfpgflushdlone" and "xsfcease". This is used in the SBI
> > > implementation [1].
> > >
> > > [1] https://lore.kernel.org/opensbi/20250708074940.10904-1-nick.hu@si=
five.com/
> > >
> >
> > > Changes in v2:
> > > - Update the message to indicate the user of the extensions.
> >
> > This should be below the --- line.
> > With that,
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > although I suppose it'll be me taking this and I can fix it up on
> > application?
> >
> Thanks! That would be really helpful.

Done, applied for 6.18 material.

--4OtjcrCPRSA3bkmJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJo+MgAKCRB4tDGHoIJi
0n5qAPsG0vDUej4A1/tAPPvzmlAg+1iAGhdOffqUAqvFfV+VYwD/dz/DCllAxpE1
Uz0QYaCyQA2a9FBfGhnPm6F9Jrv0WQQ=
=v+qd
-----END PGP SIGNATURE-----

--4OtjcrCPRSA3bkmJ--


--===============9128340888164144258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9128340888164144258==--

