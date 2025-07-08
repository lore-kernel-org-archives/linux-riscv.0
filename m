Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04216C83F09
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 17:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skfiWlR26s/ksIBwmRX3q+xSq5HgDOYNKkCN5G6t/eI=; b=qlZw4AaUfaHisG503BpkWmGt7B
	l3Y6w1KFPAMuxR81xHYsyKiCsZ/MFd5V5AEbX5kmPp4TlQINHLKZHyXbVgFAtGubOuTFWmG+PmOjI
	pI8XRq3r4ZENjUG9biYEfKLFgDuzGkMemFXHL6N92ADp7RMt/+n49LBeL6/vifuqa7vhy7X0uZuVx
	nzAF6HD3Ps7GNvD+emZAOb6r/WZyzQrzNz6akKgKxer+zE0YETMO0JObnxTE0mU25dGdyhc8XIo5B
	6kDNzschEygZ3Mj+SimrZgV4DZeBW9yfFRD4KZQhdEVMMQXbin7w06bTGewP5paFYPV/tWXDOl8xy
	yNJx3gMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBtr-000000064xz-3ZWv;
	Tue, 08 Jul 2025 17:14:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBWQ-0000000618t-1WeB
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 16:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 677EFA5415A;
	Tue,  8 Jul 2025 16:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A293C4CEF0;
	Tue,  8 Jul 2025 16:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751993421;
	bh=8A40c7RkWLHp2FPC7aBzNnB7TI99rPspv5sgH1fkE8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u4oOoADhfoGvM18Nn3/ykD59LMcHlKHrizmm2uAARvweNBAoOGZOSVmcbNHR68RRO
	 lti+FK/MwEGlTEPEUP67aAArp+eYz7Usn7oN6xCwv1n4Yo2hKGvfgea4982oM14o2k
	 w48iC0Z6TEy3rTGSwSiytK/b6adEgxwyKDQsr/aZUC8sdt4EENGzwR4pJeBUnxrab3
	 QQ/YWuHCyWcpOGrrwgN1wE1vUzvFn5XkpAW3XFbxGiHI8AWvDhGkPoQO4ouDrXSSyO
	 6Yx5zdt2oq9VKNLj2dpYLHRH1UH3ZQUYVcDlq9LRnBMKB3HO2pQbOSa0aCpr3pVheB
	 d4XnQZs/nmR7w==
Date: Tue, 8 Jul 2025 17:50:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Guodong Xu <guodong@riscstar.com>, ukleinek@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	drew@pdp7.com, inochiama@gmail.com, geert+renesas@glider.be,
	heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com,
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com, elder@riscstar.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 6/6] riscv: defconfig: Enable PWM support for SpacemiT
 K1 SoC
Message-ID: <20250708-wildfowl-curtly-1993ed320572@spud>
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <20250429085048.1310409-7-guodong@riscstar.com>
 <20250707222910-GYC408198@gentoo>
MIME-Version: 1.0
In-Reply-To: <20250707222910-GYC408198@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_095022_468337_6656726A 
X-CRM114-Status: UNSURE (   8.81  )
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
Content-Type: multipart/mixed; boundary="===============4649438732116871437=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4649438732116871437==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tqHe0xDpc9gw5L64"
Content-Disposition: inline


--tqHe0xDpc9gw5L64
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 07, 2025 at 10:29:10PM +0000, Yixun Lan wrote:
> Hi Conor,
>   Can you take this patch? I've checked with riscv's tree for-next
> branch, it's still applicable and meet the "savedefconfig" criteria.

Sure, done.

--tqHe0xDpc9gw5L64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaG1MRgAKCRB4tDGHoIJi
0iMqAQCkQXOHEt1A4XzvWbSQcalLMF/bZO3zekAoxRIfbLq98QEAmuuZF9e149/a
Dr4NUIYP7HDgky9w/jvCn45mJPQCOQM=
=tdoU
-----END PGP SIGNATURE-----

--tqHe0xDpc9gw5L64--


--===============4649438732116871437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4649438732116871437==--

