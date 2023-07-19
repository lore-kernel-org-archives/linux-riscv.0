Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01657C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPVCkCtzAWyS4dkw98X7D6AmoEL8osMnTi5ZWzzYFQI=; b=xwi+xxcFslIjw7Fx/82pPPlVl7
	vms3KwXo7/LTEAQorwo6H45tCboY0TaGng1XUCMoUyGI+nzGN0xl4Vq+3s20Sldp4jbC409+8bQ9Y
	+tMCSYMz+QRuSiQe7aRMPhsHEJr7AXjkQ4uDr9xJXrs6Dt40wlJDzaOofsrIW7x281cgCPpwDYZ22
	HkBpJtJQwdmichUU/rdZnqNaJO8RLs/riIEcCZKTPvS27ed20vYU19SBTrqWl9iTHczu9VOGE36fa
	+J/vClt7zR3vfjJjq8MtTX4ab2RrxM4BvOoIQF4jZmkweknCVNFQ+hfLkUBHBnQmIn4osvwSqzLXK
	mzzAc10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA1M-0088CV-31;
	Wed, 19 Jul 2023 16:27:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA1K-0088Bi-0Y;
	Wed, 19 Jul 2023 16:27:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 583B460CFA;
	Wed, 19 Jul 2023 16:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3237C433C7;
	Wed, 19 Jul 2023 16:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689784040;
	bh=XbEPmA31oZMRWiZN/wN85PIb96SLRdEKgq1J7m5vtxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J4tcxcqTKyyUqVyMbtaEo9Q0LzpqJnTIwaSF5IOWLoSRq/vBOfJ6cZZficeWnbUwR
	 cQCDLsiQ4wbppO2a67AkZt3aDAMlNM1HZ5UYO+36Qg+nsZ5+A2wza0py1DY/Qw8ifO
	 5niE7o3ewycZu1btxnRATrtutO+TpVBB4NllYiXvxbc2Vl8TRYNLWmVCJ1wIA1C0ns
	 n1Kr2035PTVxKQNKhktJ6yLP6yp/qX1sURPegGYynXkU9KZY30S90tXBmnj7TIrht3
	 uDYHkuYnZZUhezTAx5qOGrBdw8Mre5hs4/BOGOpP6ZZGtcXZr66xnUL+HIgnzAQBUD
	 SA22cyHWwL0jQ==
Date: Wed, 19 Jul 2023 17:27:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/6] RISC-V: Detect Smstateen extension
Message-ID: <20230719-egomaniac-precook-adf506f2a141@spud>
References: <20230719160316.4048022-1-mchitale@ventanamicro.com>
 <20230719160316.4048022-2-mchitale@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230719160316.4048022-2-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_092722_271556_E1E8FFA6 
X-CRM114-Status: GOOD (  12.93  )
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
Content-Type: multipart/mixed; boundary="===============3226159899854981871=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3226159899854981871==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YoZdAlb3QkXxrtyG"
Content-Disposition: inline


--YoZdAlb3QkXxrtyG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Jul 19, 2023 at 09:33:11PM +0530, Mayuresh Chitale wrote:
> Extend the ISA string parsing to detect the Smstateen extension
>=20
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index bdcf460ea53d..41c3aefcc53f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -301,6 +301,8 @@ void __init riscv_fill_hwcap(void)
>  			} else {
>  				/* sorted alphabetically */
>  				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> +				SET_ISA_EXT_MAP("smstateen",
> +						RISCV_ISA_EXT_SMSTATEEN);

This easily fits on one line & "smstateen" needs to be documented in
riscv/extensions.yaml.

Thanks,
Conor.


--YoZdAlb3QkXxrtyG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLgO5AAKCRB4tDGHoIJi
0hdwAQCVXZ9YozskVSwO6qEuTPksodH40aDOQlOMkZt70eca6AEA1Z9aSgvWPABA
hkPJfbccs7ZoU73NGMd/oOgLg13L5Q4=
=u+Sh
-----END PGP SIGNATURE-----

--YoZdAlb3QkXxrtyG--


--===============3226159899854981871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3226159899854981871==--

