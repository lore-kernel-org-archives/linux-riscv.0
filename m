Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95CCD2629A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 19:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VZQWv0j3Dqy1aAGEuJF78Sv5neKz+2r8PzGQ8VzdF0=; b=n7Owo1GgRWpK8+MgNmdH1YbwJa
	P90DNGgx0u68ZPJH3k77VKkxQzZc21/Ybg8MozJsonSBEJ/fS/n/fLE0mn6XVvK+4TRCtuk3Amu/x
	Zu7WrIZ0Eiol8ElExTQYJEbzk8Spwig31HyzvHNvIA038sW7FOki5KXkl8UcMXfOwGHUEdUJUNCeM
	/duU7jw9oCEcnVStbN6pqd5jze1+A0A9440fWYAm4a+nadwqhNNi+EIs/IAoRXwpUhC8e5yUe/WOi
	L3NrdtvATF+mjfwbhhWcWJFR/WU8G/8U4JZNQpZEfVqe/CZexpFJL3//JRBwViTSPn9H9RHVrM3zf
	v6CdXMug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHqW-00000004PDt-2Ykg;
	Tue, 20 Jan 2026 19:57:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHqT-00000004PDZ-3Mv9
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 19:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67BDC42DCF;
	Tue, 20 Jan 2026 19:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCE3C16AAE;
	Tue, 20 Jan 2026 19:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768939016;
	bh=QeFUYFz3aozyXSi/U4D3QgIEainC2J2D25fpMJBvUZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qg55ZUl7PCwOKIJroJWinVWMECWA3yD4zu2Cn9R8ihsgSyb7HPDZ/nwBx9gUbwHmL
	 FFE/4srXmvOS1mq6CIegrdFIf3vaqq8Ums4uXDAIhNEKfxRuOD+qfsBFgfgBOhr3wd
	 9egU1PSGbmoiksrwoqxmwtt9JDz0xYDbFpjEpqOw13FhHpUqioV5ZCbDhjg0mbozdO
	 y+o2CA9hf/y+Lo1wtdY4AryLUbgs61V+4Tfpr+XsYVofj0ttWZasXpKREOuLtZcaox
	 NbdBLdVTtjlydzUx3R8fiYQbkhQkgQtrfD2atGTsl6oX8a0/aRhJL1w8OaUdiExiYm
	 IFx+/M+4GYMbQ==
Date: Tue, 20 Jan 2026 19:56:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B
 compatible
Message-ID: <20260120-stalemate-storm-6d9349600936@spud>
References: <20260120013706.436742-1-inochiama@gmail.com>
 <20260120013706.436742-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260120013706.436742-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_115657_868353_47EAAB90 
X-CRM114-Status: UNSURE (   5.78  )
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
Content-Type: multipart/mixed; boundary="===============6817594077329529764=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6817594077329529764==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fvA7/4Tf/YdW8VS"
Content-Disposition: inline


--2fvA7/4Tf/YdW8VS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--2fvA7/4Tf/YdW8VS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW/eAgAKCRB4tDGHoIJi
0lazAQCRt2lidCPRTllfO2VCKHegNgvFU2GNEZ2JMATcN9aC2wEApUBxlN+9o/jn
2DZBjLRSmlBy9UfONFhsGaoQKAlqEgs=
=SZSn
-----END PGP SIGNATURE-----

--2fvA7/4Tf/YdW8VS--


--===============6817594077329529764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6817594077329529764==--

