Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09942CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYB9azlvYvKuyMJjlawKPSN6Mr0iYmXHSp1ijzR4ttM=; b=QtNDjUmOWOb1vtY9ZbmJjadeuT
	zZNLzxmFE0IZBisP/RVLKC0F+FaGYAPbtJpV96C1E0x09tTAUs/ICnNAmS3Q6/V3vWW1sXDpZ+gkn
	Tbt0p4oyDU5aQUaxwaT5ZO15RIO9pGLEcbkctcFuKd7czWXw7MlCFnw8/wb6RFVlYVBSczkIPj/bj
	+DekgQgeFSE97v3TLGOy+POjaGHr+QIiB6ANiA+aDt2+s47PAwyPcgXnZmon3jR4xzNKTgoIVfmQv
	/YJCw18ftphraGNRXANWgBYgIG3/oy+CCr5Dfd1IX67PhuS/Q/w7i4cxp7R/CHN2touSNeJI0DDEz
	4/pcTdHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvlS-00156h-1y;
	Thu, 12 Oct 2023 13:30:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvlP-00155O-1S
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B739361E29;
	Thu, 12 Oct 2023 13:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F96C433C7;
	Thu, 12 Oct 2023 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697117406;
	bh=dQxvGS+2v4I3+4JhOmBX1Y8jgCipdQJzwCyGIF1AXWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jAkCUc/dj93xB2UGXSBtYc87aRjeOzbj7sFnqhX/7L7wdzPXuaohn23NyJ3IqhXwe
	 WyQwXQO3ewwke351YWDZn6hjGH3IKdQP62k35J441vimEN9674ehgJ8ULyWL5Xy/Ft
	 IG0HZXgeOznCrOJUPzyUqCZvrQ926PmyYCsp0K6C16VBcLzsHqGZJnRAiBrR74Jhyh
	 Wy7tWYP6YJ0iK7mLOTI9XqBb+vq9pWnZ/G8MQ4sikBoplE2zthf1DuDYTq5PKfQdSC
	 j8ZUrwKDpYVvep+NUXJy6u1cXoiBYpegWk4yQC+CjfCh34jyQLrodYq4K95Is/ghW9
	 EqDJOknTHycmA==
Date: Thu, 12 Oct 2023 14:30:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v1 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20231012-powdery-demeanor-4d8dde576f24@spud>
References: <20231012072148.7010-3-ajones@ventanamicro.com>
 <20231012072148.7010-4-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231012072148.7010-4-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_063007_574459_B50FA00F 
X-CRM114-Status: GOOD (  14.55  )
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
Content-Type: multipart/mixed; boundary="===============2994312845791167598=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2994312845791167598==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LAuy9iPaIl9XRikG"
Content-Disposition: inline


--LAuy9iPaIl9XRikG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Thu, Oct 12, 2023 at 09:21:50AM +0200, Andrew Jones wrote:
> When the SUSP SBI extension is present it implies that the standard
> "suspend to RAM" type is available. Wire it up to the generic
> platform suspend support, also applying the already present support
> for non-retentive CPU suspend. When the kernel is built with
> CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> Resumption will occur when a platform-specific wake-up event arrives.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

> +static int __init sbi_system_suspend_init(void)
> +{
> +	if (!sbi_spec_is_0_1() && sbi_probe_extension(SBI_EXT_SUSP) > 0) {

Random thought I had reading this, was that it'll be possible to have a
firmware that implements SBI < 2.0 that provides the SUSP extension.
FWIW, I don't think that that is problematic, but maybe I am missing
something that would make it so.

Cheers,
Conor.

--LAuy9iPaIl9XRikG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSf02gAKCRB4tDGHoIJi
0kNVAP0c5LReLUQTOTC2AbH5JUBq653NNQaQTkp2nqMBiPHkLQD/XqiF6wfHTIhD
HENhS8hJOEhu0I5Uf96IHf1M7Bbulgg=
=cmi5
-----END PGP SIGNATURE-----

--LAuy9iPaIl9XRikG--


--===============2994312845791167598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2994312845791167598==--

