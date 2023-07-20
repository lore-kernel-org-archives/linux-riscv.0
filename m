Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95181EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=FTnLPjUr/j9A0Ge0w0vhiG7kPdqu7P00mdaydnS6lRU=; b=coY
	BIY5jnfRzgo9MJyRx01dK6C/vvmiKQquotTdrVOUYhCk1rz0gSGLqnD/2/XLYA5WZWuO6mLX49l08
	p7zfLxuwL+hbfsVregwivSiDzR8pPiqF5lQrQsu2GjVysFO4m9FGj5RqeoQ39roqRoSjuHqP+kBPN
	hiNh5RZEpRK2HnUaSY0JCUM9gGKCV1MXu9DQ7DI63QOVvqG+iRUsfjyL+BTK0dGvb54mBx0s30ZYe
	eQECOvDYdD1VVvEkQJsQpe2LsiJZ05B3gQrNEkgSrub1q3zyBrCttaEIBLhDnAI6Oab/iYTBEaYFk
	97WG73JSL2VaALQvI6klR8gv3O3ROBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXoV-00Bpdy-01;
	Thu, 20 Jul 2023 17:51:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXoQ-00BpdG-2e
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 17:51:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1DB1761B86;
	Thu, 20 Jul 2023 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF38C433C7;
	Thu, 20 Jul 2023 17:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689875497;
	bh=8tErANCDvWMBNQegfLY+uc7Q9CL6QQl4djitPyDVgfg=;
	h=Date:From:To:Cc:Subject:From;
	b=NC3a3AH88/8H/sC82AIdxDLf1sgCJn8v5i45A8gnzcayBkULM55OtoX+YPMqn5KeQ
	 8UYQbJsUXNE4othBaPFT4V10uK+46RB3WfGgKYS06xwwGYp2sH/XijZ0bILC0Kc9KL
	 gLslBsQTPAuifFDFjXgCdQH94hGuNZh+wlC04zBdK8FbWZaMkfqmXYo28CiRRdkZuJ
	 xoZNUgT7ZKxbZ9QLFFA13Omb/WO9KutABw5UtvQGmblxNUR6nEJzyM4NT8cOZOGfYN
	 Qog5jdT9WX9uWxlkTW7A5o2xJR5o5kQbXHQ2MiE6qSnWBnHxd4j4rNeXdka5RbQ7gr
	 4wc3Ukp+OMu7g==
Date: Thu, 20 Jul 2023 18:51:34 +0100
From: Conor Dooley <conor@kernel.org>
To: walker.chen@starfivetech.com
Cc: linux-riscv@lists.infradead.org, kernel@esmil.dk
Subject: Jh7110 DTS Patches
Message-ID: <20230720-product-cheese-9f0fe22cc485@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_105138_900810_4C7EC419 
X-CRM114-Status: UNSURE (   8.66  )
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
Content-Type: multipart/mixed; boundary="===============7097742757753697609=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7097742757753697609==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4bXhZdTSSFgD8sGV"
Content-Disposition: inline


--4bXhZdTSSFgD8sGV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Walker,

I have picked up the patches that I can from the mailing list & they
should appear in tomorrow's iteration of linux-next. Could you get your
co-workers to resend whatever patches that depended on the syscons, PLLs
or STG etc clocks?

Some were still on patchwork, eg the TDM audio, that I could not apply &
will need to be rebased. In particular, it'd be nice to get the eMMC
patches resent, as what I could find on patchwork was quite old.

You can see what I have applied here:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-dt-for-next

Thanks,
Conor.

--4bXhZdTSSFgD8sGV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLl0JgAKCRB4tDGHoIJi
0h03AP0SU7cfBJBmALviE6o1egyzs8ggw/u4WWZoyZ4PRatjgQEAtH5n9M4MlmvM
+xOT2wF6m3zg+SR6mBSvQibPeG87mQk=
=tRps
-----END PGP SIGNATURE-----

--4bXhZdTSSFgD8sGV--


--===============7097742757753697609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7097742757753697609==--

