Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E25FCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2LAh+H9BNmOI0GWddmxvVMeqyo2oAFMfkrHT55ONz8=; b=0PdnvzWeKqza0t2iv/2ojncCw1
	IEjmgUncLAWqKFHjOn3wBMYJmAKt6DQd+M/DSW0KJJtBwvBQFRX/BjUvCO78aITCHfcf3TNi6CvOG
	0lPXWGhjyAy4CoGHHw/agAQFTuzg7ghi3W0zIUwKXLV0mdsqB/8/0e7RwJ1yHsgvBcRW+DVxFiUwe
	LPbefNGIbzWh1bvkGp+IQii/EfMgAHkCmMHdby4FW7E9yM2L63mFV+p7x5tDQJyA2+AzMlgKHqpfr
	+d1JmOX1AY5ms7voQ9Nk6r3scvYptzphNytHRtcePpY80x9dSYxEL09MUGWWj4p9TuMgvPFUgv1F4
	0Juj9Mdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvo9-0015WX-2L;
	Thu, 12 Oct 2023 13:32:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvo6-0015VO-28
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 71EDCB82464;
	Thu, 12 Oct 2023 13:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04AFC433C7;
	Thu, 12 Oct 2023 13:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697117570;
	bh=qolZQNc6Bw5PgOa0st+MAuZxKcRLKLw/+5Uav9w3oi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmvuLWLoej4pZgzWZKd+rJ2p+SYM8c6z/qUfVQz7/qqrKX0QQkovtZ+Q2ZpomqCYR
	 xixSqzJAYandobrCitfU4a2hUrFHAjsduMaxYqi2qdBZ+TURFIaUN2x8C2m0A+b6zh
	 5d8djxLIrDGcsm21F129JyS8HZVV112EPE0gaW6YSr2KmUtM8tqBzR4tAon+lfxTQB
	 VhsVg41pEmnWwfW+eBLsP+78m4uqsGZvhexuM6AizC9w+7dfkC837HBx1wKgQasDTq
	 HjevIXG0pHAeULz6iwMvLbMmCHznbw2YzFAW6XQ/iEKh4VWh2Z0jI/vFICR5cxDQF1
	 xC+Q8RmMjqXUA==
Date: Thu, 12 Oct 2023 14:32:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v1 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20231012-pulverize-founding-f459336028a2@spud>
References: <20231012072148.7010-3-ajones@ventanamicro.com>
 <20231012072148.7010-4-ajones@ventanamicro.com>
 <20231012-powdery-demeanor-4d8dde576f24@spud>
MIME-Version: 1.0
In-Reply-To: <20231012-powdery-demeanor-4d8dde576f24@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_063254_908468_531CEF7C 
X-CRM114-Status: GOOD (  18.77  )
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
Content-Type: multipart/mixed; boundary="===============9184605903218264370=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9184605903218264370==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CQOr9NWImZpKyoom"
Content-Disposition: inline


--CQOr9NWImZpKyoom
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 02:30:02PM +0100, Conor Dooley wrote:
> Yo,
>=20
> On Thu, Oct 12, 2023 at 09:21:50AM +0200, Andrew Jones wrote:
> > When the SUSP SBI extension is present it implies that the standard
> > "suspend to RAM" type is available. Wire it up to the generic
> > platform suspend support, also applying the already present support
> > for non-retentive CPU suspend. When the kernel is built with
> > CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> > Resumption will occur when a platform-specific wake-up event arrives.
> >=20
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>=20
> > +static int __init sbi_system_suspend_init(void)
> > +{
> > +	if (!sbi_spec_is_0_1() && sbi_probe_extension(SBI_EXT_SUSP) > 0) {
>=20
> Random thought I had reading this, was that it'll be possible to have a
> firmware that implements SBI < 2.0 that provides the SUSP extension.
> FWIW, I don't think that that is problematic, but maybe I am missing
> something that would make it so.

Hmm, next patch I look at is from Anup's debug console series, and he
does check that the SBI implementation is at least version 2.0 before
probing for the extension. We should probably have the same policy
everywhere.

--CQOr9NWImZpKyoom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSf1fgAKCRB4tDGHoIJi
0sLYAP9/IMXJXHLPAnP9iQdy2zlTfA5HEvzDLmI7Zmzly7fAEgD/fSNESmrPCyE3
KyA2qossMvBAdPILsbLSWAm1puhYPgY=
=Kk11
-----END PGP SIGNATURE-----

--CQOr9NWImZpKyoom--


--===============9184605903218264370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9184605903218264370==--

