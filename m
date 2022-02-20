Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4A2C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Feb 2022 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQSNmLhjyeLrS2VcFLIkebM8FI/E/YC/ahQ9Z7gXVzM=; b=t/D9xH/jLbB9CVmwCjIyJFHj31
	GJSFiCvxlIUWCpAoyg2TsjJIHVeJJZlfnMv3hXpE3vR6vdy2Tt52NwoQhdzzDdjTiUGafAzMt6hH0
	6ust+tPitSOwTeArdyqangW0dd10beCnKgcwlHavcuhe7WpxVMmzANFS6dbzJMOxLx+5iYk1ySIlj
	QF98iqO3dbVN0xXpY3DWmlfHIiCMaIfeLaL6Sn8txXrDl0ddNu/WW73PSoXjp06hQEZpmN/syE+e9
	5dRxNozEZoYyyJbHEVbChTKCf6L30tYlIfJmJxW/CefMWFc7Hs7z7kqYjlAZcHO8fJn+NChIdYpbd
	EqebtGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLivs-000yQr-9A; Sun, 20 Feb 2022 09:55:08 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLivp-000yPA-4K
 for linux-riscv@lists.infradead.org; Sun, 20 Feb 2022 09:55:07 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 16E9C1C0B77; Sun, 20 Feb 2022 10:54:59 +0100 (CET)
Date: Sun, 20 Feb 2022 10:54:33 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Anup Patel <anup@brainfault.org>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Gleixner <tglx@linutronix.de>, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 4.19 03/11] irqchip/sifive-plic: Add missing
 thead,c900-plic match string
Message-ID: <20220220095431.GA5251@amd>
References: <20220215153104.581786-1-sashal@kernel.org>
 <20220215153104.581786-3-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220215153104.581786-3-sashal@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_015505_369473_E070D058 
X-CRM114-Status: GOOD (  13.03  )
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
Content-Type: multipart/mixed; boundary="===============3597948871012090561=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3597948871012090561==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Upstream commit 1d4df649cbb4b26d19bea38ecff4b65b10a1bbca ]
>=20
> The thead,c900-plic has been used in opensbi to distinguish
> PLIC [1]. Although PLICs have the same behaviors in Linux,
> they are different hardware with some custom initializing in
> firmware(opensbi).
>=20
> Qute opensbi patch commit-msg by Samuel:
>=20
>   The T-HEAD PLIC implementation requires setting a delegation bit
>   to allow access from S-mode. Now that the T-HEAD PLIC has its own
>   compatible string, set this bit automatically from the PLIC driver,
>   instead of reaching into the PLIC's MMIO space from another driver.
>=20
> [1]: https://github.com/riscv-software-src/opensbi/commit/78c2b19218bd626=
53b9fb31623a42ced45f38ea6
>

The "thead,c900-plic" string is added into single place in the
kernel. This means that a) it will probably not do anything useful in
-stable kernels and b) it is certainly missing documentation etc.

In mainline, string is documented in
Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.ya=
ml

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmISD9YACgkQMOfwapXb+vK9jACfQTLkUHy984y7w6PEcmacU/f5
gl0AoMGom32Nsn9qBUIkVf8Gzsw0x861
=5jIH
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--


--===============3597948871012090561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3597948871012090561==--

