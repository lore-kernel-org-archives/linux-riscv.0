Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C32E95A61
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8WoWVMT31GMpTdVzL3awX37ogAMUBRcZLpUlYLi9Eg=; b=PiHGZHwOdahURpO+nfuDjBXuiy
	hrf3PfUMAGySXW7rqOTmpeVLE95VEXLTfkrXS7i9GksItqZxZec8nxM5N/P6BrDGtrLIWBtqNoMAY
	lG8Y9WqEhuzn8NjgnQoiiiGv4w85nRtu5r6KdyBcQQSCt7esH1/34128AH0LAX+H5k2fgRGqblHF5
	QHdosh/ygtxfTnSGy2ilFP6dN94BqjzYFhx4/ZEC8u60Tt0IUUrQC1bAKn505n6cKb5GvBcZmz/QL
	3EpXL4+gU2rLUJO9nJeZN8chBHW+G6TkWImQjmR8EpTfUmVgRAQOmpZoigougNc9OpyvhuW2vXMi7
	E5gDZNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp6YU-007YKT-0d;
	Sat, 07 Oct 2023 12:37:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp6YR-007YIn-2F
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 12:37:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BFD960EC4;
	Sat,  7 Oct 2023 12:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAC8C433C7;
	Sat,  7 Oct 2023 12:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696682219;
	bh=wd3K4oxHlD/woVxzd2nYXKDZbLbHeSvR4ulHU8RrABg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EKLiB6j6LeN/5G7rq025d6MXeimCJ78gRoaXsUQ6ZM5jUfzApzdY+olS/bxvLo6Go
	 1xFMGcJ5/ijD1jmZdNCXV+acnA549eUzeSGwOgBxcl1SytX6Wiawv+GzzyweuOaz1q
	 G3CFbS+6Q29NuFCeZL3z0l4MS8MqULK8VFl470q5MibBHL6iRNR3+ZACKr18jh6V5s
	 u1Q5Pvcskcai2FE9nw+gyMDHaWIlJ9E2O1qLL1PiWnNsH2K5Em6qLKrBRCmPlQmVDe
	 p4u88jZNOXQfOJKAiQuxR7NMGEL2lmAX0TGxERtq+X63jYchFbReuwUJijAL+Y1N+e
	 Y5isgWmtwA/Pg==
Date: Sat, 7 Oct 2023 13:36:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, devicetree@vger.kernel.org, guoren@kernel.org,
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, apatel@ventanamicro.com
Subject: Re: [PATCH v5 00/10] Add Milk-V Pioneer RISC-V board support
Message-ID: <20231007-green-correct-11d08f650ddd@spud>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
 <20231007-grasp-retake-0463858c13df@spud>
 <MA0P287MB0332F80102F534CBD7412ED3FEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <20231007-kennel-lustily-59b0a9867aaa@spud>
 <MA0P287MB03329460B9F3B79B1148A6FDFEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB03329460B9F3B79B1148A6FDFEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_053711_863083_A650A368 
X-CRM114-Status: GOOD (  21.49  )
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
Content-Type: multipart/mixed; boundary="===============5824790963649614546=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5824790963649614546==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tf1cZ/0kl4RD2FsG"
Content-Disposition: inline


--Tf1cZ/0kl4RD2FsG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 07, 2023 at 08:25:55PM +0800, Chen Wang wrote:
> On 2023/10/7 19:04, Conor Dooley wrote:
> > On Sat, Oct 07, 2023 at 06:58:51PM +0800, Chen Wang wrote:
> > > On 2023/10/7 18:17, Conor Dooley wrote:
> > > > On Sat, Oct 07, 2023 at 03:52:04PM +0800, Chen Wang wrote:
> > > > > From: Chen Wang <unicorn_wang@outlook.com>

> > > > > Changes in v5:
> > > > >     The patch series is based on v6.6-rc1. You can simply review =
or test
> > > > >     the patches at the link [7].
> > > > >     - dts: changed plic to support external interrupt
> > > > >     - pickup improvements from Conor, details refer to [8].
> > > > Did you? I only see them partially picked up. I'll just replace pat=
ch 8
> > > > with the patch 8 from this series I think.
> > > Yes, only the patch 8 of this series(v5) is updated for plic node. Fo=
r other
> > > patches, I just cherry-picked them from previous "sophon" branch.
> > But added my signoff? I ended up seeing my signoff on the patch where I
> > disagreed with the commit message, which was confusing to me.
>=20
> Oh, I used to think I can keep the exising signoff and I didn't mean to a=
dd
> it.

I added mine when I applied the patches. It no longer makes sense when
you resent another version.

> Anyway, I agree your suggestion to create a new patch with only one
> change should be better, I will follow this in later work.

:)

> Regarding your changes on sg2042 series, I have acked in another email : =
https://lore.kernel.org/linux-riscv/MA0P287MB0332BA73D0135CC73CAEA16DFEC8A@=
MA0P287MB0332.INDP287.PROD.OUTLOOK.COM/.
> If anything else required, please feel free let me know.

An ack on Jisheng's series for the cv1800b would be nice.

--Tf1cZ/0kl4RD2FsG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSFQ5gAKCRB4tDGHoIJi
0pn8AP9lSD88TcKQzLgGJZ2jLjHvd4kbFCFoxErzLHVKHTarEwD8C/COpPh0Tv0y
BHrAiTYX9e+RiWYdxS+p74nRdO0/Fgk=
=8x9P
-----END PGP SIGNATURE-----

--Tf1cZ/0kl4RD2FsG--


--===============5824790963649614546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5824790963649614546==--

