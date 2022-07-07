Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7E0C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 20:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmoKkq5/lio8ylIXsD1gl+fwLgTS7hLkmS+PMUDazT4=; b=Fxaynlvp2aopKoglJgkvMb9P86
	TI4gcRon437hUb+uIwG8Sw/VUD2rJsaPk9eix9YNLuwsPaxdMBZ6EYiNAIoP6Cy8sTg58MrI8Tu+H
	oyUykiu2/6TohiEIbNYUdZfwfPnLUrnPXffZUR7SiGtKxva/pb46PKCkh0UUCt8/l63qgKhhGhwNw
	ZRHHdXoil7NqgcbJCgPOwh1pSePO8zc55TJz4IWNk8V3Qb6s3L0QTIBdu8blFBmyqiimyo3VRPteD
	fIr6z60xkb0JjYY3iY3/Tq+efsjxm5pI1Tk++LhtmIN/mfTu3rI2KAIenqf4RvmDuzm+iUzeb3/Fw
	gbwdK84w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9YVn-000Bw6-Tu; Thu, 07 Jul 2022 20:54:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9YVl-000BuX-By
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 20:54:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C992CB823FD;
	Thu,  7 Jul 2022 20:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBAC7C3411E;
	Thu,  7 Jul 2022 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657227246;
	bh=uQAyobK6yKXVb4BXuOxq/raZz11LUeChS71KkW7tWKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ieL1U9MW2ZG6Zv85PHOylr8gVwMe0JYSNKpjdTc2fxOtsilWrZDRYJ5samyxz8eMJ
	 YNpy5kewnJfc7pSx+MOLMeGPtFUrd4KQNvg6C7ofLeMyfBipw9k6R8r8KKmmIqxBCH
	 BrxmdpTAjpcLJE3iEnP6CkvGPycJT4YmR6rHhJhJfq8/HtO5AFOa6ZDNFekbZreKr1
	 h6C4gggsdcxvXxQbt3VOZwqihyJ+dF64MUAeq/BCdGsOU5I7Qd6PwPCPKBe/FijmlH
	 EAToCVao1vBlCZhm2IbhIEI7ETzaLtKUCYNUty9rnnHVS3g/01kQi58LZarh99dtDg
	 pHAoZKfljkwmA==
Date: Thu, 7 Jul 2022 22:54:02 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Conor.Dooley@microchip.com
Cc: linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Daire.McNamara@microchip.com
Subject: Re: [PATCH v7 1/2] i2c: add support for microchip fpga i2c
 controllers
Message-ID: <YsdH6oDsW6Dn7zl+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Conor.Dooley@microchip.com,
	linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Daire.McNamara@microchip.com
References: <20220706141313.2504237-1-conor.dooley@microchip.com>
 <YsXhyB9GrfUQjy4n@shikoro>
 <0e28e644-a25a-173b-caeb-826cc4fb4537@microchip.com>
MIME-Version: 1.0
In-Reply-To: <0e28e644-a25a-173b-caeb-826cc4fb4537@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_135409_598654_3E0B64D0 
X-CRM114-Status: UNSURE (   8.16  )
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
Content-Type: multipart/mixed; boundary="===============1986650995818477263=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1986650995818477263==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Pqu5MabrEmHzPoQ"
Content-Disposition: inline


--/Pqu5MabrEmHzPoQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Already upstream :)
> Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml

Oops, I only checked commits in master..next :D Thanks for the heads up!


--/Pqu5MabrEmHzPoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLHR+oACgkQFA3kzBSg
KbaXbA//boPXkya367wWNavYryeCbB8fwgD6sVybTUWCPgTSP7Uo//N4GRK40ovn
SbZoO9d8TowKZSIOyc0KtYU3J/SP7CMWdZqulh2puXG/JsYyBuvCVUUneq9tzvk5
7vZ+9i8XyNXdCdxyKTXOqpuZPI0T1stlY8RqlH/0iMgo5wgpX+IEKy3Xe/dJYK7W
NTCS9+NtWjJisOtO2oB680uzvcnwd3quPcWoe+wvcteMvGD9I31O08Lgv2WWbCHs
aN35/VWCDN6kAaz3LmRLosl3mQbXvM9HplPt6i2UaM0wBEutkmMlfKx5Y1xCgQJp
e9BWzjLk7EyDAtaoRvTmENj1sI//p78LtZEJl8CO7ymyFNvmB8qmQXuffP1UvFFl
hGJLTEEh/8mvgiQJnKaZYRZqaT9tPgjGqi+/MHkDjjd4du+sxizd0TeG7n9K7qpL
/Y0a6FKrGr5ZwwR5ggo+SQ1YM/0pCuaFMyOH05olDusfZ+Ld0ZLFwWWJOuE3uoKr
sbKjv21Bbvw06ZUyUkXFAMIsWYzqnArfX8/Pn96AqQ8TiZJwjtbmO+hkUxPtNTZs
GP8KEhPInuMikpIWINChrEPFv8EWSekOklAlfPeUL3M6LuKzZyv6NHIRoUP5GsZ8
HXd60tvF+AFOpflHUD4/Qz99mL6Bi7Xw6XuUGJ5/Sl5qr0lKwtk=
=36FT
-----END PGP SIGNATURE-----

--/Pqu5MabrEmHzPoQ--


--===============1986650995818477263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1986650995818477263==--

