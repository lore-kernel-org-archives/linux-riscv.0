Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFCFD42BBA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 18:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWIrKyDMT2K3JkXI15oWQNmKM17rvGcx2WhPuQ+mMC0=; b=YXJ4PIehZBnw8l1WchO8awDRIo
	U1X/Oi9UnSJUEDalBJwlXlHjhWsbPUuHinxgIik0cYOKEqMZ9UYc0rn0gIQAkKGQOzYkCoMOZx0D3
	2Tma27oxFGSDtUunpwRl4+/QD+37sPJMNAH1YZM5KDC9q4SR6atnCAxVbDu+4Hn91Cgdpofvy0X4f
	d07+UZtpOPGiFcn0gPb3H/Cv3LtgRFUnqv8zwSNqYPwseSDtPejlk9BiLvmtcaTh1um63MsoMOy5B
	NOD/f3+IEkarL1iWi0fjVCcGLCf39Fy7YlELSLf6W0GrVGR6J1rcUbPZFvLYKXsaKjZMKd64mz7vM
	+KsuNG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvKT-00000004VCn-41XH;
	Tue, 12 Nov 2024 18:09:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvFA-00000004U1G-0Ryg
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 18:04:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E4885C57C6;
	Tue, 12 Nov 2024 18:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD84CC4CECD;
	Tue, 12 Nov 2024 18:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731434638;
	bh=kqF92FnpSa2OXbqzYAFWSrZYSfupDZ8zTDehmduwQM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLOottUAHgXyuaS5FZ7OFzdzu2OTg/oAzzpsqUYRe679Go3sEJL3g7LL3TvuXKQuk
	 kJLtqwgjzF4IRoHXQ/ovpRcMp9KVydXxhdY+BDVMmeAUTwui5EJbJh+73Q9Dk/bSsT
	 L3K5KjlKOKuIXuyz1MsPurXFFMgUBf0liqQJjIf4FpHhxhw+Tq6XoerTiuWe59eA7b
	 7aNPWrwpUH9saLrfUwsTao0yghQeqUECpbPEDYKdUKDkxj8J2lKO4knfMx1mIv7Fg3
	 BuGXXqqCkzwQI3PqJ/NXxmQu9skJgUekwOpP/ePQyLJiTqmtxXjwe96kUeZAhD3O+R
	 8Z2SQdJHdisEw==
Date: Tue, 12 Nov 2024 18:03:51 +0000
From: Conor Dooley <conor@kernel.org>
To: h1k0n <ybzjyhk@gmail.com>
Cc: charlie@rivosinc.com, ajones@ventanamicro.com, andy.chiu@sifive.com,
	aou@eecs.berkeley.edu, conor.dooley@microchip.com, corbet@lwn.net,
	devicetree@vger.kernel.org, evan@rivosinc.com, guoren@kernel.org,
	jernej.skrabec@gmail.com, jrtc27@jrtc27.com, jszhang@kernel.org,
	krzk+dt@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org,
	samuel.holland@sifive.com, samuel@sholland.org, shuah@kernel.org,
	wens@csie.org
Subject: Re: D1 vlenb
Message-ID: <20241112-blooming-reheat-d9a23401f6d6@spud>
References: <20240911-xtheadvector-v10-3-8d3930091246@rivosinc.com>
 <20241112021227.357-1-ybzjyhk@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241112021227.357-1-ybzjyhk@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_100400_306927_30DA9300 
X-CRM114-Status: UNSURE (   5.63  )
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
Content-Type: multipart/mixed; boundary="===============5126654616661542605=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5126654616661542605==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3sbg3BDZLVHaW7eG"
Content-Disposition: inline


--3sbg3BDZLVHaW7eG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 12, 2024 at 10:12:26AM +0800, h1k0n wrote:

This message is entirely empty FYI

--3sbg3BDZLVHaW7eG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzOYhwAKCRB4tDGHoIJi
0hjfAQCqq2U6n0j4CEI1t2O0Z7i8ABrvQx9u4Yq+TaBYhwtgLAEArAZcyVMA30do
BQbGW+93CZzpOrFMDM6b5Zs06UPQUgE=
=yLsb
-----END PGP SIGNATURE-----

--3sbg3BDZLVHaW7eG--


--===============5126654616661542605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5126654616661542605==--

