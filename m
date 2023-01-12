Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB03C61DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VWhkGxMyVVhvkjU/9Yc6ofjWFSjP7FdP0bmJ+ZfCXQ=; b=iXMuUbGW7fIZqmjVx+LaE8x5Dm
	3AlMquAZFeIGqNseY197Cvhgyj+E4WfYXBqA2oS3TSASX2r7PBhUQqNd+Q0sdev7n1CMxJ8ukTozL
	dx8I7DCXLkLM33pI2GxuummIDrmHudLQ8zESVL7VQtHulPGDn/BwN2DI4Td7ElFy/Y74Q5jZ2CQ5F
	EKPoh+XIcUPrV1EczIXtXSWhae/LZ/fvNkkPPYLz935EEhtkj4Yr3SuRxupevBa45ymHARUGESTC9
	dtTQm/GxJAzR2eSIfbAVkup8v8q0dVr86eR6Y0oqBVmW26uZkA4LQ32AzLBTvoH0/StmnhscaQ1xe
	21wMtgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4Lm-00Gyus-7u; Thu, 12 Jan 2023 20:39:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG48N-00Gt3w-NM; Thu, 12 Jan 2023 20:25:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0CDC8B81E62;
	Thu, 12 Jan 2023 20:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C079C433F0;
	Thu, 12 Jan 2023 20:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673555108;
	bh=9zwIgfryghF/hPAyByTTWjUD8VVtMbRU5rfWoB9mj9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K8gV+ziX4Q793ObSyocCG05xJsThWXKzS7TRBVtdKpg/OBjlzXUUQSr6oAlgo6f3B
	 xZIbkkRBpDgshI1VPcOjoX0pfF4b7wGjjpdyUE2HntCz9/Zs6FI15m/9VqD5zbulNV
	 n1zujl8AhaXgAF5C5/CgG9jNGffgadIH/B0XanePieaHUHFATgKT5zZhxyrnBUqltA
	 GVfYV4XeH0OY23RrukX0/07SCr6YqCDjt4NN4x8vIoDYFYL5oaXGIMowOImLtuNin9
	 gBoim/cppZw84M6yh7odJkWkTqDfofoPvL9s1PTkGtkgZLouMidrsOlMTn08t+2bzG
	 OsKOT/IAaRswA==
Date: Thu, 12 Jan 2023 20:25:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 01/13] riscv: fix jal offsets in patched alternatives
Message-ID: <Y8Bsn5Q0HYMNOt/R@spud>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-2-jszhang@kernel.org>
 <3268358.687JKscXgg@diego>
MIME-Version: 1.0
In-Reply-To: <3268358.687JKscXgg@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_122511_941116_C262387E 
X-CRM114-Status: GOOD (  15.44  )
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
Content-Type: multipart/mixed; boundary="===============3307573659555063191=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3307573659555063191==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ua1i9Pzh5KF+R9ch"
Content-Disposition: inline


--Ua1i9Pzh5KF+R9ch
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 12:31:59AM +0100, Heiko St=FCbner wrote:
> Am Mittwoch, 11. Januar 2023, 18:10:15 CET schrieb Jisheng Zhang:
> > Alternatives live in a different section, so offsets used by jal
> > instruction will point to wrong locations after the patch got applied.
> >=20
> > Similar to arm64, adjust the location to consider that offset.
> >=20
> > Co-developed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>=20
> looks good, thanks for fixing the issues Andrew and Conor pointed
> out in the variant in my zbb series. I've now switched over to this one.
>=20
> I guess as you said, we really should separate this out into a single pat=
ch
> [or if Palmer is fine with that, just pick this one patch to apply until =
the
> rest is ready]

Splitting it out may make it easier to flag for him during the pw sync
next week? Either way, I'm fine w/ it..

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--Ua1i9Pzh5KF+R9ch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8BsnwAKCRB4tDGHoIJi
0o5zAP9jGqZSSAdRHCE3N4G2XUAYUpvR8Zxi0U0OiGGa5Sr1eAEAng/g1Dt5Slg6
suspJyY0z/VoCFEReP2eDtHoy6Qzagw=
=+jG3
-----END PGP SIGNATURE-----

--Ua1i9Pzh5KF+R9ch--


--===============3307573659555063191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3307573659555063191==--

