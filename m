Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2F9C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMcjD6ICrcYuZH4UVGPl0P10cXB2S/z5ckiZP5ZY7PQ=; b=BpuicVNsCq5PE3E1Uqpn/lPRWb
	zv79ZnqgTbIm5k9WQFcoWC5W3trk/TP2FOwFaJ3+AOA8hqE1hAJWM5+Sfrp/nTMUMDdJX5CF7YBp9
	t4aJvqQbKY2h3qRtSzy9wt16XWhSacbGpnFp7Pe9vCElcHw1nsde2i4V1pHG/mq4f4pHeu7cB59vw
	5Wg2JLpmXmnUFsbeBbemoy+czvPtHgHDpH7AKV/6VRn43vMWXoabNQXQFRha5ngJlP56Oaw3Mqqth
	wF9acAJuxgeiz8DU7CKK1pYLF0fvGhLsiaEmxULqEYigT4YXLN7kuA55VGipYuAYD8jcM5P8S00SW
	fWuqlG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7dfX-00000005SXj-2BEM;
	Thu, 16 May 2024 16:09:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7dfU-00000005SWp-2Qrt
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 16:09:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8ECA561756;
	Thu, 16 May 2024 16:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BAAC113CC;
	Thu, 16 May 2024 16:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715875757;
	bh=BuB1lBuPqSHeYAZRlNth4Ne+6BiznLgjo9Q2PlJemPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ba/wtGx2vX3cqrPfKBAa+K8BYIBEfPXL8ABcCbOyBeoqITFyr9fmyoJQg9NMi0f9O
	 dOg9y0QrpMX/Dnos2RNeS/Tr/vUB6A5YjCP4l7On3vJPyGNRxmtIU9HxvzUAAUoSc0
	 OFxe37TAV2TjTQJUpl8uR2juQaJ0Dl7NDkj6iwb60KK33hByDxDzNJyF3Vlbuhyabk
	 I/rEy/Df6VMutIvLPlQJT5tkcqvCaVAbqBP7np5noNraJVIiDt9zb5AEkRLLGMXHVD
	 2ZU5xKaNpHk0+CUk88bjgNUn0S6gPpq/Oe/Ob/seUmaEiYEVrH11Zb/t41wwx2MCHK
	 Iwb6GrPT4jkfg==
Date: Thu, 16 May 2024 17:09:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <20240516-undergo-bruising-00b2dda7fdb5@spud>
References: <20240515-support_vendor_extensions-v1-0-b05dd5ea7d8d@rivosinc.com>
 <20240515-support_vendor_extensions-v1-1-b05dd5ea7d8d@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240515-support_vendor_extensions-v1-1-b05dd5ea7d8d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_090920_686979_A119410A 
X-CRM114-Status: GOOD (  11.86  )
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
Content-Type: multipart/mixed; boundary="===============0169988520264013031=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0169988520264013031==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IrlPhg3iJOawMNuM"
Content-Disposition: inline


--IrlPhg3iJOawMNuM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 02:26:13PM -0700, Charlie Jenkins wrote:
> Instead of grouping all vendor extensions into the same riscv_isa_ext
> that standard instructions use, create a struct
> "riscv_isa_vendor_ext_data_list" that allows each vendor to maintain
> their vendor extensions independently of the standard extensions.
> xandespmu is currently the only vendor extension so that is the only
> extension that is affected by this change.
>=20
> An additional benefit of this is that the extensions of each vendor can
> be conditionally enabled. A config RISCV_ISA_VENDOR_EXT_ANDES has been
> added to allow for that.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--IrlPhg3iJOawMNuM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkYvqQAKCRB4tDGHoIJi
0vPmAQCjYL7DFqx7XDKaJSfCyQ8gk+EFN+XsJQlo7vj1Euw1gQEAjxLQCPf6hokg
WsJvsba6+KjbLP00vCozW0FMGxUkpAw=
=hoDt
-----END PGP SIGNATURE-----

--IrlPhg3iJOawMNuM--


--===============0169988520264013031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0169988520264013031==--

