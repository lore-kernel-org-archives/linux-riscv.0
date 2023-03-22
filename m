Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E15CC6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 19:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dv/f4p6QUc6i3Q8mFnbN+m3Bug7mFuH2CdFUOl3AVUs=; b=YEQ/tWrN2H6GgpLQVx8mhfhQpv
	vo8eXkAAUlugceHqsjApzmNisvV3lhJuw+4tMqKlua2VbHAIzJ6S7fTgFal2YCMjo4wZ/D5lIMwLZ
	RQFdrVt1v7bwMxMho0Vq6PtU+xt5LUxJ2oXCfatIC26c1qPrKahIBYhzDVTqtqIkUDT/qEx08BbOO
	mxM6gwtLx5veTK5yCe/naz3ZlakFB8y/onLLGWfSssJwexh/R36E6JLHqYu2iNFtdFFWHgHtEBzbt
	dgy0Y74pMIJQkbFFYc2Hkw4QJG5XswCHhA7BV3K+2hTU1hXQjBgxk3D6WiuLQqCz+85KUF5r1dV5I
	1oQsM3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf4Jt-00HDLt-1P;
	Wed, 22 Mar 2023 19:40:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf4Jp-00HDL1-2x;
	Wed, 22 Mar 2023 19:40:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B9FEEB81B97;
	Wed, 22 Mar 2023 19:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D4FC4339B;
	Wed, 22 Mar 2023 19:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679514018;
	bh=EBzQfLGDDmR8OFUnXBo0iGWECiRa2yLBZK2U8OkXqaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ae+SI/nqlmk9Rav6Dv6SdeVGyWi0CwFYGWRUXBCFBjoXbzufrccn1T14sGwPv5JSJ
	 AnL7cnJ+v4dHHOeU4iqiu2tF9hY4Qo8rQ6Apk6svn+LwEsOnNikUIHKPefX3U1QmK5
	 /x6Jf4DFbm6DM2G7D4sAFXlQNwjnuxHUEZZT8cj5Z+TvtSI1umiMRbgzUSftW7CmDp
	 L5iedxpBRWEqypSIku72dAFGMMITI7+chFHPVG2/lcPMCi77enpzF7VTnap96y9Y29
	 qVRglnHVFki6fdTUTI1LkaURPHP1VFGRLtq/yOl/wuj+mUsQu1GRQ7gmskWKy60AHR
	 SRsKW9xiHG6VA==
Date: Wed, 22 Mar 2023 19:40:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 0/2] RISC-V: KVM: Require alternatives
Message-ID: <6d263b50-e2f0-4331-b930-c54e27f52fcc@spud>
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230322192858.1189272-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_124022_094770_095EF685 
X-CRM114-Status: GOOD (  11.73  )
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
Content-Type: multipart/mixed; boundary="===============3874157461463710170=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3874157461463710170==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qzFV0cbVzxQH5Sqf"
Content-Disposition: inline


--qzFV0cbVzxQH5Sqf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 08:28:56PM +0100, Andrew Jones wrote:
> KVM makes use of riscv_has_extension_unlikely() to check for the
> svinval extension. riscv_has_extension_unlikely() is built on
> alternatives, which means KVM should ensure alternatives support
> is available.
>=20
> The first patch takes the opportunity to cleanup KVM's select
> list. The second patch selects RISCV_ALTERNATIVE.

Reminds me, I need to re-submit my patch doing that for the top-level
RISC-V Kconfig...
For the pair:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--qzFV0cbVzxQH5Sqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBtZngAKCRB4tDGHoIJi
0thHAP9fM06xD0PFHGNG9uUCovfVCeiQy2t0JjAhSmx9L0Ah0wD8C4w5CgbNnyOY
Mn5GU+zESOm1Axfv5YKPb5FjQzpC4ws=
=tSCU
-----END PGP SIGNATURE-----

--qzFV0cbVzxQH5Sqf--


--===============3874157461463710170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3874157461463710170==--

