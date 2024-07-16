Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14990C41513
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 21:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1qZ+nkNm24+4RHwEzOpPe7Zrmxbyuobzn8SBprKhfE=; b=eBD56aGd3boFbRXsu+cQHfWqhs
	PfhZEyOqf10226+91kFxxk8GsirFLHPV8nj4XqLh9chys/POYSMX1HIzR/4BvpP3E8BvmshsINmz6
	C0lG/xfUUpMVq6/Jb8tt+PoYUaa11GehcafDazNgCRyUMbCc9qmVSTickLGbcY2UbmA6pjM2P/hxa
	hvdCdDvLOBFePKHSiSfAB5YJX3/ie0tZA2jsSTUlNpUu4VkZWKVasNhe9xElYMWMUmnTOOloqxXVY
	RxBUhs5BCjvVU5RVpPgW0Q36b/YNwl0IaiwLdP4mFJtVyTs42WVrIXo6po71GKpo6aONPsUC3oyRc
	iVXoY8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTprE-0000000BrBl-2LKk;
	Tue, 16 Jul 2024 21:37:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTpp7-0000000Bqel-3qOC
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 21:35:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BFE961335;
	Tue, 16 Jul 2024 21:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861B2C116B1;
	Tue, 16 Jul 2024 21:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721165700;
	bh=E7N7rngP7mS/xaHZaXlmnzvsa8X81bWMHGl5AYxhH5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B6fXRi4I/VGikByKYlAEfmHbiHKImthJgQFo+H/p62F+vOd+SEiQXDsDLTJKhaut1
	 oKQ9n/5cd0U8e5X1MAd1pqXegUrsLVW6/W0SOmhOKtUwe2tKXkJResgRS0fDa5TCDV
	 eOy0nbuTM6iIyB8gFKILi8KJc3RTuFXWgdrxv5LuXUsSH0tfST+zUpzo+Lo9kHpCVG
	 qQpjkpAxCp/Dc2O61ZiMIF33reEcpqh0+Rxl7asL9Jtj08kQCQ1cKdmMTpsCBy5NCl
	 7SrYoJATTbIePdG5s6uIll/eCedDTvct7BPqCR7w0d2edNhzQne6n5i6fNOcqfYcgz
	 Pe6k39rzaziRg==
Date: Tue, 16 Jul 2024 22:34:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Daniel Maslowski <cyrevolt@googlemail.com>,
	linux-riscv@lists.infradead.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Daniel Maslowski <cyrevolt@gmail.com>
Subject: Re: [PATCH v2] riscv/purgatory: align riscv_kernel_entry
Message-ID: <20240716-lushly-knoll-f0661ff5aea3@spud>
References: <20240716204047.7649-1-cyrevolt@gmail.com>
 <87o76xf2x2.fsf@igel.home>
MIME-Version: 1.0
In-Reply-To: <87o76xf2x2.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_143502_193599_71C98F40 
X-CRM114-Status: UNSURE (   8.45  )
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
Content-Type: multipart/mixed; boundary="===============7485583003737617351=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7485583003737617351==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fc8/or7RGy/hil68"
Content-Disposition: inline


--Fc8/or7RGy/hil68
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 11:22:01PM +0200, Andreas Schwab wrote:
> On Jul 16 2024, Daniel Maslowski wrote:
>=20
> > This has been tested on a JH7110 SoC with oreboot and its SBI delegating
>=20
> coreboot?

oreboot is coreboot without the c :)

https://github.com/oreboot/oreboot

--Fc8/or7RGy/hil68
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpbngQAKCRB4tDGHoIJi
0rUiAQDQxKb7RLA1+RsYqyi5lElFH0Mcp7HN7vFSKFIxcpijBAEAgvyd/6tun8pc
bg80RVgTSzdnaugJoWlORfvBPLmNnwc=
=huA7
-----END PGP SIGNATURE-----

--Fc8/or7RGy/hil68--


--===============7485583003737617351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7485583003737617351==--

