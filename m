Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9EACE8349
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UM/7xEuesp30NWx65wdkc0p9dJ6h4E11qIOY1QP1DuA=; b=s1rKUkCtPBhpUnXsuQqatIdm2c
	5EeiLkAgNOV/2oH2bzN3sRd5T1b/bWQZu0quU98nJvZCxBkZgUue4xrlBJHWAjgMTEkqOXup6Xtup
	54S5AlQ33+jdPgs6FmGgSerPmcMFrNOLNIspFq3yh19Cgi6SxdGE6v5p3Xm6sBPlvIfPy40vd0Pl4
	bcGgcEKA68SPvuO7kqyIxqRxEZRJp2pjbKAkrKZVQ52ryBPancd1rYrOS8s1dP+5FbCZPWRVnwP8w
	nIgPAvD5i3Vr8FUU27nqbCN5ao3J+UuCPbq+3XOJehFpWLCXrGEdZ+k/GrtK3z05y/GfILxp6pqnK
	gXcS4N0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAJ-0000000HT0c-3Rl0;
	Mon, 30 Sep 2024 14:14:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGll-0000000HNSL-0nMP
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0189BA4256A;
	Mon, 30 Sep 2024 13:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DCFC4CEC7;
	Mon, 30 Sep 2024 13:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704135;
	bh=mLxOv40+thabk1P2b32vNUikvJ6eQGXWajpc61FvYNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ayS6bjx2YId3rnhgA9QtkiJMUfIFDG0/uTe//BDRDTA4WoWSwAXLER98bXAupPJD5
	 H3uWwA/ReTdToHdIQiPrzd1tinyirhIvquDjZEJ5m8hxh51ulBbWrR8J4beQb6Exp1
	 BtSvdKwWziw30Ga/fjoZoEYGXYdhefn0ddI93yb0L68r9s3zK4QhLEjAJA/3vV1eGY
	 S7K+8xVGRYNAH/tnQemESmyg4WHzVoGGCtFPDwxbTCPN7MgQSYsoetWCoax0vlyWJa
	 LhUYFntwsqI/jj5lkQUv7CVMPgpxnSO+YoIvqMC2rdcsvmzAPZOgzFDn7IAxVjY0zC
	 v7gHc867uVeBw==
Date: Mon, 30 Sep 2024 14:48:51 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 10/20] dt-bindings: i2c: microchip: corei2c:
 Add PIC64GX as compatible with driver
Message-ID: <20240930-hunting-outthink-f8627440e467@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-11-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-11-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_064857_312548_B0E3F7C9 
X-CRM114-Status: UNSURE (   8.82  )
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
Content-Type: multipart/mixed; boundary="===============2093887410275335260=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2093887410275335260==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k080Mv3kRXZMROiA"
Content-Disposition: inline


--k080Mv3kRXZMROiA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:39AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX i2c is compatible with the microchip corei2c, just add fallback
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--k080Mv3kRXZMROiA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqsQwAKCRB4tDGHoIJi
0t7YAP9aDUIuBl8jWcIIhjpW26o6UvJxAOQG38tKO4CTvFfKZQEA2ay0zWhPrzvm
GKaKQvG58A/nuXv/xPthr9/IGACkxQM=
=B153
-----END PGP SIGNATURE-----

--k080Mv3kRXZMROiA--


--===============2093887410275335260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2093887410275335260==--

