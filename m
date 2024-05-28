Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E26C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 15:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haTmOQ97tGpEvY3ldwEHh7gV+kPoSO/3BOpVNG+JDDs=; b=WxzfM9NqZrp0co5X3mRjMuo3X6
	8MgNxv6Z4qPEsaVlYoP4deZ523FEnJM3NncUs1Pc4ZdlVdpZsDrF5SoQYzfHWRznUOXNKXIOvTxX3
	xxEzuR6Y6Bt9ZkOBRp+4l/+JmMnD+CaW7zCZUii9WCAcBKI5K2NqZ9s5ZKyrZkAK2gOyfN1Gr7YCx
	k5Cu4MIKrXkSEj2Ct8SlDdoPqyLvNqZbz/8VnPSR6w5ieFrVxynqYYyY5TrVQT8Y6twUVd92jEo5r
	uPA9ov3YS9ETA9j8odkyE9mJkn/gVRemwaw2AlN7WgtHPhN93iWExwnSYO7em1q64YivsocmVGJ4K
	gkF5TwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByup-00000001Gpw-37Vc;
	Tue, 28 May 2024 15:39:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByum-00000001GpC-3Nbm
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 15:39:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D16E621AA;
	Tue, 28 May 2024 15:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F513C3277B;
	Tue, 28 May 2024 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716910743;
	bh=DF1SyvC/MZMzA6HY8m/jHm28CfGPXLZdj+xqP2V8MhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0rIxd7Ni2RUqwiZxBjZHBC6a/p6roA0uztJkxME3SO2+xeZahPudti/lmQoJONDl
	 glm7CsdcgYtnZJ++caMLymIee/7GM67D70B1D/W+s9YCXW52gsKWMMGezcqvlHFo6w
	 upnqC3Lwtta8VSiaesHF/+/dmVkOFPa4+SZyt5LyM/qqQmQIZJiA3g0Jf9zU3tiAx9
	 fd+pHUxDCWfO9/zoc/XUV1btddeoPmdZtE4vhUnSzt7LKxSWr7zcVEpWcRGU4MIiET
	 zUaa9aOlKoa6CpBh6lLlWRRSIsrfZPvtNZ9HPRvp+b4WkIM406RfZf9fYsGDevGCIv
	 yQDRUB7C+nStQ==
Date: Tue, 28 May 2024 16:38:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: Enable Bluetooth on JH7100
 boards
Message-ID: <20240528-likeness-outrank-203235db1b62@spud>
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
 <87wmo2nmee.fsf@linux-m68k.org>
 <CAJM55Z-F6N6ua5LoqyMFogDtLp=FaRPoDv4osXFDMjR1b8r9nw@mail.gmail.com>
 <87zfsy102h.fsf@igel.home>
 <20240528-outpost-subduing-2e84f77427a4@spud>
 <87ttii54n7.fsf@igel.home>
MIME-Version: 1.0
In-Reply-To: <87ttii54n7.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_083904_906259_40E7B09A 
X-CRM114-Status: GOOD (  10.22  )
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
Content-Type: multipart/mixed; boundary="===============2949900239731410137=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2949900239731410137==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SU71k9OfCAjrB0pw"
Content-Disposition: inline


--SU71k9OfCAjrB0pw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 05:37:32PM +0200, Andreas Schwab wrote:
> On Mai 28 2024, Conor Dooley wrote:
>=20
> > Looking at things to apply post -rc1, are you still looking into this
> > issue?
>=20
> I don't know what to look for.

Fortunately for you, it is Emil I was asking :) I thought I'd addressed
the mail to him.

--SU71k9OfCAjrB0pw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlX6kwAKCRB4tDGHoIJi
0u/DAQCB8pdGfzhDav26IupTirOHbUvJR+udBVopIhQ5HFVtlgD+LIvTWn/Sjj2l
71AxmORSmHlaRUwuyH4N8MtPEvg1IAU=
=7l+D
-----END PGP SIGNATURE-----

--SU71k9OfCAjrB0pw--


--===============2949900239731410137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2949900239731410137==--

