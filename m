Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FADCD54A9
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLSDhR/0FAC+n1H3ZXyp3+mOfkkpMxL+MNzV8lP76Y0=; b=ByCjG1vU7CvxE9QbTpfDGrObG4
	tyLQiLA1AKKISrs34zDc9oXsMalP58Z8gQyP6+ouSF7kLCPRz8TaDjoNNpie5zfJAoZW00X1cUrfM
	qkWqF1u9IAwJeb358sV51k2NAY0/W/sriyEOV67G3Sx3uZvAx4gxfjsSNXbvz0eaqHPuMiqJQMdQV
	qxYi7+e4/nFy1prTt9flonR69APWOziSiuNIo55rOXlD1ZWbMgENQAuCDfL92J3IonHfhtqsP4rjj
	GGYGAQ6X5a5BnuZ9kPU8AFHpOcvGWaArfzB3gzcR3mvx632hd7kJCb/DfoqEwAJERONtZw2C4j3d4
	MYCcRkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWOk-00HOJo-2Z;
	Tue, 19 Sep 2023 08:47:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWOh-00HOJ8-2X
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 08:47:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3AC9161502;
	Tue, 19 Sep 2023 08:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880ACC433C8;
	Tue, 19 Sep 2023 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695113274;
	bh=luFy040TJwhqSwX6q8NyoQWoiTXkeP9Qqccg14Kb0rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAIFlH97A7V8Ycm5uK/xK6ieazUEpI6YXPLvhBAsVWWi/V3P5Cl/gf+bo2KM6XzpY
	 FiD9pjJGvZgLyEPbAXtwZheJ1vghZLACfrHxcmSvosElzIq2o2lq5R9kKMbsS75SAn
	 RYRQVm290QV8qTTKyOZlH4A3dSINv/5Ao7gSizbOLtSmJAzY/44cJRkOcUf0qbsDuH
	 +Bu7I7wNfH2s7qGXk9e8jGslCoa0Lfge1lXBwzyrINlsDGeQvHZQEPShb6uScOGxGx
	 m1GGzvEU1PkEktT16u02UirNKQUM6SKWCoS06MCHogJlny3+FRkAkhCpfcJ7T7j1hy
	 fuRxCsIoi3WoA==
Date: Tue, 19 Sep 2023 09:47:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Kwanghoon Son <k.son@samsung.com>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jszhang@kernel.org, guoren@kernel.org, wefu@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	inki.dae@samsung.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Document th1520 reset control
Message-ID: <20230919-42333064be342f6ab125dd75@fedora>
References: <20230918045125.4000083-1-k.son@samsung.com>
 <CGME20230918045134epcas1p1b80b338b66512a976c3783cd0e51da50@epcas1p1.samsung.com>
 <20230918045125.4000083-2-k.son@samsung.com>
 <20230918-4ef7f52da269f3a7e4023bb3@fedora>
 <005301d9eab7$5688c920$039a5b60$@samsung.com>
MIME-Version: 1.0
In-Reply-To: <005301d9eab7$5688c920$039a5b60$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_014755_890192_3CDD6549 
X-CRM114-Status: GOOD (  17.37  )
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
Content-Type: multipart/mixed; boundary="===============0000256609695599859=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0000256609695599859==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1iibWnnp3IIIl0SS"
Content-Disposition: inline


--1iibWnnp3IIIl0SS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Guo,

On Tue, Sep 19, 2023 at 02:08:32PM +0900, Kwanghoon Son wrote:
> > > > +      - const: thead,th1520-reset
> > > > +      - const: syscon
> > >
> > > iDumb question perhaps, but why is this a syscon?
> >=20
> > This is good point.
> > In fact, I took it from the vendor kernel, and I tried to keep it as sa=
me as I could.
> > Vendor also followed drivers/reset/reset-imx7.c
> > As Rob said, if don't need it, I'll change it.

> I have investigated vendor kernels, but it is still not sure reset inform=
ation.
> I thought this is about sys_reg, but without datasheet, can't tell.
> Therefore, should be stopped patch for a while until knows better comes o=
ut.

Is there documentation in English you can provide to these people that
are trying to add support for your product?

Thanks,
Conor.

--1iibWnnp3IIIl0SS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQlgMQAKCRB4tDGHoIJi
0vyLAP9HZrpuOPBneDIXfpdgbTVat7I4LUqO20r1ekUdthdEhwD/brQ5aP+rZx8t
p7nYOH/eyRcDKWMoDlVvvHjOP+5T/ww=
=/q0V
-----END PGP SIGNATURE-----

--1iibWnnp3IIIl0SS--


--===============0000256609695599859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0000256609695599859==--

