Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6A9C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 13:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCTrOLVV6MXYSLdlLCkL8+4abR6N2uLB0CT3tMZ0Chc=; b=ZBeGFdL0XwnfiGRIzvzBcoEM4L
	p/bKzlM14Zbdg1QNve+r5F1u5OeUXiGsYebaZqYOYxnQwO2RBvjPw+zTBcsxW0da4yYDtxzMMMObN
	PhZRvIX45yrF1UiAgWtlv2PYdCuN2JitIzs+zopu5TCUiC360IMKCdwqKrPc6l/7Dibz8Fk9100kg
	BP/KWvEhn8/4Nxev6z72S8ROPV/FdmwA3lWS6io1DbkdtnaIh0KFPRjAPVyp8rrLp41EeBhhWFakd
	YTu0dseQUy9okvPkONQfYw/7uW/PDnF7b4RAWHqOkQUSGVJKW4G5vgQ0IcjTDH8DF3yUDUOn/Y/0+
	xFGqBb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVu29-001geD-02;
	Tue, 15 Aug 2023 13:24:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVu26-001gdi-16
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 13:24:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7001627DB;
	Tue, 15 Aug 2023 13:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B82C433C8;
	Tue, 15 Aug 2023 13:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692105865;
	bh=z+8p1dL8kDdwAQA2PlBM33EqpsDED40nAYRvKgPVvmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxq08N+7yY3ECoBwwligRWnXI5uBTosYxQ6foQyor33BHq6lm5ZLBFn/i9nsdtKWJ
	 Jix5Kmsu8dgc+/mfpSH4Cn0Ay2c17AEqlr3AFKejMr+cR7xd62PxgYtbmzV8UCAt16
	 29Mh75vya8tsnZqOhUZP+2tD2yQzD6mMpyXNyWfCj3kLrvOtbKgqBV6RNduwPFkkHK
	 SGufCljpX12RTQKXvb0gU2kNeQmX1H/fRU+CGsivdjdsANeaygdjb39gKqogSBJIXF
	 qyMruTjCeO4QTSE88nIMthM1AtGbObiVQ0tUb58KS7pQkL05/UFQLi3lkYdniyFH2c
	 GYWtzlzlZILrg==
Date: Tue, 15 Aug 2023 14:24:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] riscv: dts: starfive: fix jh7110 qspi sort order
Message-ID: <20230815-timid-appear-8ebd95431ed5@spud>
References: <20230815-scurvy-jujitsu-4fced586cffc@spud>
 <CAJM55Z8moyAcmQWZV0TyP-XO9fMN5_inDk-vtmDkuqCYic_-4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z8moyAcmQWZV0TyP-XO9fMN5_inDk-vtmDkuqCYic_-4g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_062426_436328_4DFC7213 
X-CRM114-Status: GOOD (  13.25  )
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
Content-Type: multipart/mixed; boundary="===============2392975501881013364=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2392975501881013364==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aK2AWRQ44Yig/gRR"
Content-Disposition: inline


--aK2AWRQ44Yig/gRR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2023 at 12:42:25PM +0200, Emil Renner Berthing wrote:
> On Tue, 15 Aug 2023 at 12:38, Conor Dooley <conor@kernel.org> wrote:
> >
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Emil pointed out that "13010000 sorts after 12070000". Reshuffle the
> > entries to be in-order.
> >
> > Reported-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>=20
> Thanks!
> Reviewed-by: Emil Renner Berthing <emil.renner.berthign@canonical.com>

Should be pushed. I'll send it this window if I am supposed to take the
Beagle Ahead bits, otherwise at some point in the future...

--aK2AWRQ44Yig/gRR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNt8hQAKCRB4tDGHoIJi
0rT2AQCRVuCWUBKrUWV9ECHH+3E40jwqgk8Z1c311HaenCIHJQEA5tYRxERU/vq2
42YSxQhTPfy6dsuzpdXVqJZW51loGwM=
=LBA7
-----END PGP SIGNATURE-----

--aK2AWRQ44Yig/gRR--


--===============2392975501881013364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2392975501881013364==--

