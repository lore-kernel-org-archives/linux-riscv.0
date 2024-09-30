Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBDECE8349
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qm2aCA/g6bcAs91Rj14fDjxL4WjO4IHTs4BeJmzVwI8=; b=zqvLpxShiALAPP6MfBxKjW9w8x
	esWJWOcByYsgII1Oa+jqbfGU4cHsh1dq6IcffyOQcfafABiA5aquIomaJLXwkXjs4c8sOuCR59h1C
	jTj9n3jjvZwHD0H8g1Lpk6U7MW1QZcfuoZQGuMQSXAMlwJgkXvPRrIWSg7iXXbCB9Gdbfz1r9E6Gy
	vpW0CQSuQhuAGp7UWlhFE6T/cb4rMR0FeWz1dxaVgUxm+MzpwYT7HsX/c0kJqLYS7jLf417U4jJdP
	2THFuPv5PpQdimNSOvaGJFmFZqjewprKkcsFPt9KmyO6u15jN1Qi+nNBQQnN+rJbCyqGgwSFdHI9P
	P+nMjbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svH90-0000000HSeM-0UR7;
	Mon, 30 Sep 2024 14:12:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGew-0000000HLYb-3i6G
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10C3A5C033B;
	Mon, 30 Sep 2024 13:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C107C4CEC7;
	Mon, 30 Sep 2024 13:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727703713;
	bh=kkTbjYmmUtL4o0lZr/q/BfPDhvqxwi4Q0kpgSrt4B54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYJO/IKpnHnqxuBvWEZyRrcWjYWYASGSyvReh6IYUyAOGwvUA0AbzUh1a1Wb9u/nF
	 ymAclTW+qvRnOUHODtsoM4pzXfJLUpKd6HYoDMVNulv9+AQmUBkk7xXxN3t6r49HWp
	 CMdl0/kVmMxK3Q9GT+s3PuQNsip4DDkZXX0e9i4q9nvsYZNkk3/hQewWlocQT9cDfL
	 rFwckZKo9C38qkyVOXVPNrtEX+otW0g08F6F4IqpiPoQPkHDgtlbcp96NqvHoYsJTq
	 GpcjK+PEHbWHzQ6tszEdA9fM6AfPynRehvgNRBrQMRtZuXjn1shwZfccrQ3jqE3O+d
	 lJFfo9r4ONCPA==
Date: Mon, 30 Sep 2024 14:41:46 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 02/20] dt-bindings: usb: add PIC64GX
 compatibility to mpfs-musb driver
Message-ID: <20240930-retake-limpness-e4146e07b5cd@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-3-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-3-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_064155_011575_EEFE6896 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Type: multipart/mixed; boundary="===============7715034073587761122=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7715034073587761122==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ThiFJzVa0Ijeb/Ca"
Content-Disposition: inline


--ThiFJzVa0Ijeb/Ca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:31AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX musb is compatible with mpfs-musb, just update compatibility
> with fallback
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ThiFJzVa0Ijeb/Ca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqqmQAKCRB4tDGHoIJi
0oneAP9p9DNiQsEO0OewaLjqzJNAamer1DJKYTVugtYz1mJ1GwD+JCtZJC6yIA3N
S0GXaSJQBlLlCemMVODAO4MziXC4HQU=
=xPIy
-----END PGP SIGNATURE-----

--ThiFJzVa0Ijeb/Ca--


--===============7715034073587761122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7715034073587761122==--

