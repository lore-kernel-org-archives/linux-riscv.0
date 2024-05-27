Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852D7C25B78
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KK8xTFbnkKo4DBSJLztIYbSgckyxOCoE5R+/h7dLUCg=; b=AC5oAI3XnNZEEsKp4PaASZe6ya
	7ZRjVpKgK3D+yfQwIb+1k/3imhBZwDMndRh7saTbd6MWXsWcd1acTFhzBwD8PE2UEPwyezD63BWUG
	Tp0cLM21xu2WpIGDqTctjiUfy8LxaIJMFd2EY1t7DbJexVJjmW0Lg5NvfFUrCd+c+CeHAHv589f6q
	L61jICTJ+noR63uVocMWxJTG4jk+ZMjHjEfgyrQJPraxgebhzWsc0LN++QKPPesIBN3lw5Rm72vCT
	H/oAvdrL5jv4urcLoYNu/ofmSsYrJVp/LOH4biZRxxkW8kAclDIjtZu/47sWVcoWNUJoDMtDDJHst
	91Bm5PQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdPe-0000000Ftu7-00Hx;
	Mon, 27 May 2024 16:41:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdPb-0000000Ftta-1Ds0
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 16:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7251BCE0FA6;
	Mon, 27 May 2024 16:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3AEC2BBFC;
	Mon, 27 May 2024 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716828084;
	bh=VP+qsmC54b19MmboZBNiJ4/Iw5W2tqYz1l0e+9i3aFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnkOyx5ALbSmHTXbPoXK+DoM0+zMLpr2uEBJ5j3VgIJhliFWJ8Pjd8SeVL2t0+VPX
	 h4/1TrQH2qC7up8kjrBV04Mxcmww++vsthpYV9knAI6o4MBdSeEpUymCzzn0Xx+vK6
	 q2fR2f/W3BbcV07a05oKKGXjURGn+XkB5Fyrm/5H7T5mVvmbisjUPDV1rUlMm4N7ST
	 sFNwvzXpPAzUp3/BDe9LQi0xzNrfEERm4HK7cGejaRsod80C5AVVcNjZuMkicmnLCL
	 lP82XuC03rUET7RlkWiTtGsmx52PuYhMjJAZhJqCTMSJzNp3nMvy0QsaRLxTkK8Fte
	 jRM8MbmkbIcOg==
Date: Mon, 27 May 2024 17:41:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 5/5] riscv: dts: sophgo: Add LicheeRV Nano board device
 tree
Message-ID: <20240527-skedaddle-flavored-a869c7918088@spud>
References: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
 <20240527-sg2002-v1-5-1b6cb38ce8f4@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20240527-sg2002-v1-5-1b6cb38ce8f4@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_094127_535370_566477F2 
X-CRM114-Status: UNSURE (   9.32  )
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
Content-Type: multipart/mixed; boundary="===============2298789879458910190=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2298789879458910190==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yw+/J0Tv/ZDAD4WK"
Content-Disposition: inline


--Yw+/J0Tv/ZDAD4WK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 12:28:21PM +0200, Thomas Bonnefille wrote:
> LicheeRV Nano [1] is an embedded development platform base on the SOPHGO
> SG2002 chip.
>=20
> Add only support for UART.
>=20
> Link: https://wiki.sipeed.com/hardware/en/lichee/RV_Nano/1_intro.html
> [1]

Just format this as:
Link: https://wiki.sipeed.com/hardware/en/lichee/RV_Nano/1_intro.html [1]

--Yw+/J0Tv/ZDAD4WK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlS3rwAKCRB4tDGHoIJi
0rOkAP9bRQj9cpTdgLImE92TIFi+ah9V2qy65P0BMYXUljfdsgD9GSKX367tx7hF
SgN63XgxVmLn9hrm7OQ1xLo883xL2g4=
=Pqk7
-----END PGP SIGNATURE-----

--Yw+/J0Tv/ZDAD4WK--


--===============2298789879458910190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2298789879458910190==--

