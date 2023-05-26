Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF637C7EE2C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zm7EkdxWWfVjqPZEUMOlhxOhxjSS/fQ05eZVl4zqPOA=; b=R91NIw0hgQKbaRSUZQIOQOBUO+
	IU619WPWso5CQj28unpzyG+DfyWD4faHU4VbtHsiix4RNIc1NUkxlK6iAxS35jEyjNxAisAefEkBU
	wEKpo6oToqEQAZDn6hbteSD40Pn0lJhXW5m/ONeS+gfyfa2RjOJCCQUc2djBel8+6e8B5de4DdXpa
	mYCzkhGb6/sdiQHOOsPI3HZnkYhIYKTQV42VKUe1+n3AEISXyg3d+IfnbUFszmrqOLb0dpDhhA0Nf
	cuM23TaW1GvTDsuiF0OfO+LUKLUSY8Mu954seG3f324/f/S3+W3izzXwqA0CtPY96LpUJnWJNir1K
	tBQs7Wvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2aFB-00374u-1D;
	Fri, 26 May 2023 16:24:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2aF8-003747-1D
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 16:24:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB46760F9F;
	Fri, 26 May 2023 16:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FC0C433EF;
	Fri, 26 May 2023 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685118281;
	bh=AJ+BxxK52gVymsZFoUp0CRgLx8gr8FZ2nrPsRRsuDBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rNPY2tCWSOOazWLhjnQD0SMygLanbck+s66Z9oBgfYBb2HWMbjZVYZqcSWa3Yz6bx
	 brohvBunWS8D/c9QAcmHy+8rIw1Hjx6gJ+YXWfsNIzZsZlnUJz/S47GxfXEER8ia96
	 65K1DbWeSL3baiTJDULkSA4uE/qsQP6MDNNfawRCNV171nRdqPVzSdoUa4lP0y2zQB
	 tuv6s4K2hg/rctGZf1lX/aHfqIFsH5MpraX+Q6iTUIUo6WBi7y9DGVmauDRk8yjh4i
	 hfrPB2e7/ColiAl4SySkXBiMuwOPasb1/5qgJ6IbipXZ61C+bbIFHIlU+eot/HYaOX
	 VxMb7c3Ld032A==
Date: Fri, 26 May 2023 17:24:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Message-ID: <20230526-clergyman-wriggly-accc659a3fad@spud>
References: <20230526154630.289374-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230526154630.289374-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_092442_476861_508BF5ED 
X-CRM114-Status: GOOD (  17.80  )
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
Content-Type: multipart/mixed; boundary="===============1579248559196269488=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1579248559196269488==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NlMLFogaEAENvQ8Y"
Content-Disposition: inline


--NlMLFogaEAENvQ8Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 05:46:30PM +0200, Alexandre Ghiti wrote:
> Early alternatives are called with the mmu disabled, and then should not
> access any global symbols through the GOT since it requires relocations,
> relocations that we do before but *virtually*. So only use medany code
> model for this early code.
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>=20
> Note that I'm not very happy with this fix, I think we need to put more
> effort into "harmonizing" this very early code (ie before the mmu is
> enabled) as it is spread between different locations and compiled
> differently.

Totally & I'll happily spend the time trying to review that work.

> I'll work on that later, but for now, this fix does what is
> needed to work (from my testing at least). Any Tested-by on the Unmatched
> and T-head boards is welcome!

On 6.4-rc1 & v6.4-rc1 + this patch, with CONFIG_RELOCATABLE added to my
config, my Nezha fails to boot. There is no output whatsoever from the
kernel. Turning off CONFIG_RELOCATABLE boots again.

I didn't test on my unmatched.

Thanks,
Conor.

--NlMLFogaEAENvQ8Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHDdRQAKCRB4tDGHoIJi
0rRcAQDJerk30eDdIobCPL6gLNU9EYo1FLQnN2rS7TRV5QYwOAD8CHZqfwZranmk
N+rYrgoF8D/+0QK4z99Lgy5drkF1TAQ=
=QYWY
-----END PGP SIGNATURE-----

--NlMLFogaEAENvQ8Y--


--===============1579248559196269488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1579248559196269488==--

