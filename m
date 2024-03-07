Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB51EC54798
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 17:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ONVsl8Na+GCzUu1XCvvvnCWUrFz0v4HpoddiEdiYuA=; b=HuqKAefF21XRcEWQlbWUS2cry8
	uG6k5S0sJ11t8F8fAg+CHzQoNB3h9zXpjGLCZdozkB3JdGhWvBScKhxapaRG4d4Jj2riVw9CKWMgx
	Y6ZP9STXwLogLk/Onmgt0AlS/jQcCtT8kN+Kzfar6HrZEsfND0aJwL2+0h0YQRkcD7cSBOsOgLK29
	yxOSB8gHZvDqtvAYK8ONqmy2E23aAfrgBOhW5EaXSM7QUda47BsPOqR2fX5Py1az2Uii6O+kZU7EL
	9RFSCL5XTAr13zaEB2MaHZrIko0zuOCv4rmsExC7PN1fmS4/IMg1zDrYyXEeZTCmYohgvom8h3oZJ
	QDqPE3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHvL-00000005mFx-0Y1t;
	Thu, 07 Mar 2024 17:52:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHvH-00000005mEn-43Ze
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 17:52:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CFC8BCE25A3;
	Thu,  7 Mar 2024 17:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541A7C433C7;
	Thu,  7 Mar 2024 17:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709833969;
	bh=1ClZOi8SROF3/2EGEIpOzZLDcZRHrpi89pOQRoUF5g4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hzYD6xCKVPE+12412+X9UQuFFd2RRnMuJGsACJBTb/7CUUUNC1c4k8iFn/CrQBm52
	 hzy813fVf0bRI3lQPg9tARhWCNgS0gHFyuFj8zLB8xDxtNDcqawRrTAYzs0hkn6N4h
	 pGJJ4m5L4Ye5AhBTwB2wXDQokUrTJRr23pZDnbstFv6LaKDMXSjCHwAqxKjzfA52al
	 +0ff8cWY9zAhEgakXJ7/4RbGFG7sdQz0ySN5pK6829mMDeVQceJ/iWw01MOb64c9KF
	 BS9zWftTXKpBG4xr+uq7Kg6TPOymsbEwq3ATZbDfJ8Z9MmLCE0/zgO/MT82hwyircs
	 vSzMJk73Rnr4Q==
Date: Thu, 7 Mar 2024 17:52:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH] drivers/perf: riscv: Disable PERF_SAMPLE_BRANCH_* while
 not supported
Message-ID: <20240307-oat-mule-10441ef7e94a@spud>
References: <20240305155223.1823287-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <20240305155223.1823287-1-pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_095252_203412_2395DDFA 
X-CRM114-Status: GOOD (  20.22  )
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
Content-Type: multipart/mixed; boundary="===============4960290221844823049=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4960290221844823049==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y0Dtpe87eFaER5Lo"
Content-Disposition: inline


--Y0Dtpe87eFaER5Lo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2024 at 03:52:23PM +0000, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
>=20
> RISC-V perf does not yet support branch sampling. Two riscv bpf
> testcases get_branch_snapshot and perf_branches/perf_branches_hw failed
> due to not disabling such sampling.
>=20
> Signed-off-by: Pu Lehui <pulehui@huawei.com>

This seems worthy of a fixes tag. For what commit I do not know, but I
figure it is a problem currently in mainline and a fix should be
backported?

> ---
>  drivers/perf/riscv_pmu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index c78a6fd6c57f..bc42cb95a97c 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -313,6 +313,10 @@ static int riscv_pmu_event_init(struct perf_event *e=
vent)
>  	u64 event_config =3D 0;
>  	uint64_t cmask;
> =20
> +	/* does not support taken branch sampling */

Skimming patchwork, I found this comment confusing.
Isolated from the commit message, which it will be once committed, it
was not immediately clear that you were referring to the driver. I think
it is just matter of making this a complete sentence that starts by
mentioning /what/ does not support this feature. Is it the driver? Does
the spec not allow it? etc

Cheers,
Conor.

> +	if (has_branch_stack(event))
> +		return -EOPNOTSUPP;
> +
>  	hwc->flags =3D 0;
>  	mapped_event =3D rvpmu->event_map(event, &event_config);
>  	if (mapped_event < 0) {
> --=20
> 2.34.1
>=20

--Y0Dtpe87eFaER5Lo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZen+7AAKCRB4tDGHoIJi
0uSNAQC0ygLY7d+KZxYs9uH8DbuuQbv5GSbkf16CritRnRiMDgEA3Ev5pVFKqsJJ
mXnvkHf+BdnNDV6obRMrSnx/ayR2fAw=
=vaBk
-----END PGP SIGNATURE-----

--Y0Dtpe87eFaER5Lo--


--===============4960290221844823049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4960290221844823049==--

