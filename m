Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91F4C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 15:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1UKa81mHVafU5OK8Jq8kOACllX4YGRqbw5u9ZKss4E=; b=UTOX0RfKF4GAWF6uRdplWtHQU8
	j/m5GhZ6xzlvcftdEkEaw80HJn6NfCs1k4jk7HxZA3I95pQTHJpGQEKtW9lpPqsSGiCmuvxWnrxPB
	dMduOrk0FkowLvubr8Nb3/ekEJAjseXalx2f70m/M4rQQPvE2CKlN1eNU4C4tDjQ/GUDk+3aJD8ER
	4OaVwGUjWPNb1wubVM0xtqD00rjZGs+EAPAaiUxD3MuTPJ7sqoD/RzzDBIBdYQ9T8N16iy8fKhEpq
	fA5uZkGn4r7PtE2x0CPMVTPgR0XS9Yot2Eo5FQNTUqHtPrGDNwSfLuX+5mC1CgaDYWUsLCi1wHdSn
	VyTBAcFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q80hJ-00GTQA-2g;
	Sat, 10 Jun 2023 15:40:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q80hF-00GTOv-1y;
	Sat, 10 Jun 2023 15:40:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A527C60BFF;
	Sat, 10 Jun 2023 15:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDD7C433D2;
	Sat, 10 Jun 2023 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686411605;
	bh=/Ofoh0I1XnlXPrUcylaPl3zI8vSXYdbK5AqQOlhyJDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTaoUii41+/zbN5OnM2Xrz2U59v9x8zJlTSmJR5e9KOVhvdnpBNuwO7wFfRZjHk1N
	 BlbVt6KQEdybsiIJwqbeltnfJvzTD/Z1og+HgFBmanz8ghO5DTsqw+F218G+A38q0x
	 YKeKD0W8cvRfPS3BpG0BShu+OuPfGmdzD9ECN7SpVRxCrbY+0jpBYHt4L+EV5nX3Gn
	 6o1LHFnz3lOA15xh9m+934txSGLram2NB4QHAqjpyPiQsEzZuqDZWDgftHZoyvmBZL
	 bROCWlt2SjnE6MsckVPKaNGPC3q1hC1WIei/MaAKe8XOSMvmRy1p6KU4ck6oTJMf/B
	 cDsoi+TJrxWig==
Date: Sat, 10 Jun 2023 16:39:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, chris@zankel.net,
	jcmvbkbc@gmail.com, steven.price@arm.com, vincenzo.frascino@arm.com,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com,
	jeeheng.sia@starfivetech.com, conor.dooley@microchip.com,
	ajones@ventanamicro.com, linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH V2 3/4] riscv: hibernate: remove WARN_ON in
 save_processor_state
Message-ID: <20230610-immerse-stained-e07fa52fa978@spud>
References: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
 <20230609075049.2651723-4-songshuaishuai@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20230609075049.2651723-4-songshuaishuai@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_084009_762198_A91B0338 
X-CRM114-Status: GOOD (  21.48  )
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
Content-Type: multipart/mixed; boundary="===============8543139148887249318=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8543139148887249318==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rZXGa7jE6687ew2c"
Content-Disposition: inline


--rZXGa7jE6687ew2c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2023 at 03:50:48PM +0800, Song Shuai wrote:
> During hibernation or restoration, freeze_secondary_cpus
> checks num_online_cpus via BUG_ON, and the subsequent
> save_processor_state also does the checking with WARN_ON.
>=20
> In the case of CONFIG_PM_SLEEP_SMP=3Dn, freeze_secondary_cpus
> is not defined, but the sole possible condition to disable
> CONFIG_PM_SLEEP_SMP is !SMP where num_online_cpus is always 1.
> We also don't have to check it in save_processor_state.
>=20
> So remove the unnecessary checking in save_processor_state.

In the future, please write function with a () in commit
messages, so freeze_secondary_cpus() etc.
Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Fixes: c0317210012e ("RISC-V: Add arch functions to support hibernation/s=
uspend-to-disk")
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> ---
>  arch/riscv/kernel/hibernate.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
> index 395f835f067c..86f1c9ab6b0b 100644
> --- a/arch/riscv/kernel/hibernate.c
> +++ b/arch/riscv/kernel/hibernate.c
> @@ -119,7 +119,6 @@ int pfn_is_nosave(unsigned long pfn)
> =20
>  void notrace save_processor_state(void)
>  {
> -	WARN_ON(num_online_cpus() !=3D 1);
>  }
> =20
>  void notrace restore_processor_state(void)
> --=20
> 2.20.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--rZXGa7jE6687ew2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZISZTgAKCRB4tDGHoIJi
0vJyAP9EKfmf2sqixNnKmlQNpfPiKuUhZxNlT3lhCKkpFnqHngEAhvOHTbsZXvDm
ySeqtdfo8Ycj13L8JonolaCh/5o9uQA=
=qLxy
-----END PGP SIGNATURE-----

--rZXGa7jE6687ew2c--


--===============8543139148887249318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8543139148887249318==--

