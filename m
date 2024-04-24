Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B2BC07E8E
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtoZyaqvgtC9XeE02EdOBdkTDkOi3w5YNcr1i0PlPE0=; b=KiloCHT+nWO23xAhbniNLPuTcC
	zo8MOu9Bms1Pjl2GjWCiIaDz8PZbhfBVdgg/TB2LnRzWs+nB907OHIx7keniCFvVxfA+RTYwBpX7a
	WdMwxAK+wAnqIMpeYFd6PGu4sfQkm4dtzYAd11cRlJDHl9wNFVDuoPgW3Ye7J5UbSUTJdpZmmdXuJ
	lKfXw554JeRXlFc+vPgXVYl9H5nMq1Z1BJBLq4DVYFWfZtfm5dAiLjvyvpPmZfa+GCUiPJgNElzr8
	M+TebRrXPjJAMeHX8tMd40b5ttn+7c1AENFDWee/b00V6VrhC9VAGraSrWONXdpZg3Xp75PaERiD0
	WAW8bmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaCH-00000003lRn-39V7;
	Wed, 24 Apr 2024 10:49:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaCD-00000003lQX-0XVM
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 10:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 43623CE136A;
	Wed, 24 Apr 2024 10:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA7CC113CE;
	Wed, 24 Apr 2024 10:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713955786;
	bh=13Hi6ZoedF7xEUK5sGqH0Sjd7YNhbMjL1SAgv6avwWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khQ5FhJT5PNr6HWVYFrPZXydqeSHrF0F3rLggVHJqLhR0jsFTHBtnFms6eixSLKNa
	 vCWBfATJSsIT9q4Z3jTkkomxD/o8Y38zHWifEZhLepdOPXBqA4gkcoBbWFGqBoC85w
	 3d3qPFsX87FWPQC3ivOza86kHUEr5uwfBZ1BQfpH8cBCYJd7OY4aaWZJA8Ia4jOcnu
	 WKh14ZSN/Mm3dLaPCzyxYpH0UyUhM5MPPjFAqEuIgt3p/m0I8kl4OGIXdzQIrIxpq3
	 ODoftLnsP21x2NUgPg/EftL3rgJ0BsGG7ny0xHU8hd7DxAFo5mFqOQzi2ImL7rSFxn
	 2meeXkPLUTvBA==
Date: Wed, 24 Apr 2024 11:49:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org
Subject: Re: [PATCH v2 5/7] riscv: Pass patch_text() the length in bytes
Message-ID: <20240424-math-recapture-49618e9f9b11@spud>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
 <20240327160520.791322-6-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240327160520.791322-6-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_034949_364324_3EB4A847 
X-CRM114-Status: UNSURE (   7.52  )
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
Content-Type: multipart/mixed; boundary="===============0685835721443903355=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0685835721443903355==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sqfgg+TcvaEXDvan"
Content-Disposition: inline


--sqfgg+TcvaEXDvan
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 09:04:44AM -0700, Samuel Holland wrote:
> patch_text_nosync() already handles an arbitrary length of code, so this
> removes a superfluous loop and reduces the number of icache flushes.
>=20
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--sqfgg+TcvaEXDvan
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZijjxgAKCRB4tDGHoIJi
0qvcAP4r2MrLGz9H1r7SbjaqoHG7Zb6RvXCN/VmJFpdJYnXfAwD/QEb6Rj6izInw
SNqGMSWRNoFweZB4bLuaxlv7QL37bwo=
=z3sD
-----END PGP SIGNATURE-----

--sqfgg+TcvaEXDvan--


--===============0685835721443903355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0685835721443903355==--

