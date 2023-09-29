Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C25E71D31
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4k/c9KM5UHr1qKJFQuZVHU370l40vr3if0o45LnRdMw=; b=V80
	VgXKqz0ODrWzDnWFXgDmxEprVMVmTLssxL7TimgThpT6JYUYuL77ctubzhhoknWE2LpZ0zxg+Ewnx
	VckQQNROiX6kkzKAfVkfAgpLSPqXgRl13PWSIPHeWtVvuKLb9KAWvivIWVTz+KG4eOHzdzylQ0Rqp
	4nLJhJug4HeWcM0FZytIOjmtTyn0T1ZUoAEyaQxF1skLZYD6X8lZ3f04Oj4w99bM7879Jh/MLFJ56
	8ZxSFD6keZCI+AzKE9u1Jokea3P4Uc2PiRHWLX4/pYWzRJhIKiL+RlPYMR8smCiWZjq8HdHeg8jYH
	EZvqllQ/fDR5cHLEXYNEyWzR89DKvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDQ5-007xMf-1r;
	Fri, 29 Sep 2023 13:20:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDQ2-007xLw-0G
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 13:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 85F2561EF4
	for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 13:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90F6C433D9
	for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 13:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695993633;
	bh=rEBB89NKImERZQzC3iwndEfZLFxcuVfRqSgcD62HDCc=;
	h=Date:From:To:Subject:From;
	b=SbGMUsrp5/dyswDVc+nZIfn60ft0wO8StTS7WVFhoVHEFZFMA0zPYu0lYK8WhQPPx
	 o5UZCIvUs597SXG8a1XJYnOp00+1jcVIIxmBQb1bLAdBqDGE1ra+W5PhfBQExOxgnI
	 QioNOYm1mfPfnhZ55kt4E9EJLB2g1uiQLwkovUIIoqLPmzorakHXiB2diukB4fgq0/
	 kqb2Wwo5t6DIKorcr8DrCAd8b8xR4PBE0b0J12Al9WREZbqi9ErftUOmqFbamW1lc8
	 1Po8MXUI583s10zcArEVy2raPBTjwB3DUZW6OKfvhxsjk0rYl8dI0iLdvyphiTbhb7
	 oOYH6/C5mq4DA==
Date: Fri, 29 Sep 2023 14:20:30 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: patchwork automation changes
Message-ID: <20230929-harddisk-marbles-274a8e35f9f5@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_062034_163907_70A95386 
X-CRM114-Status: UNSURE (   5.77  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5138173068564361882=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5138173068564361882==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Oqx+gn5xcLpT2OIL"
Content-Disposition: inline


--Oqx+gn5xcLpT2OIL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

We (and by that I mean Bj=F3rn) have moved the patchwork automation
outside of Microchip's CI and into some "generic" GitHub stuff.
While things are switched over, there may be some oddities in terms of
errors etc on patchwork, with some series being tested by both the new
and old system.

Just an FYI in case anyone sees weirdness over the next wee while.

Cheers,
Conor.

--Oqx+gn5xcLpT2OIL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRbPHgAKCRB4tDGHoIJi
0vFiAP48A0qFxYrALj8yUovmgg6BirXIdrtIbCDthSNX2dYLtgEAwbRC4xeInOtA
uzbg1wHaiZ6EoMeonf8Og+S8oIt0oQU=
=NhAh
-----END PGP SIGNATURE-----

--Oqx+gn5xcLpT2OIL--


--===============5138173068564361882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5138173068564361882==--

