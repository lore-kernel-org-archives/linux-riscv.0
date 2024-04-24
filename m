Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807FCC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 10:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgyYqjgtZgb1w3uZ+y5OvNbGss7hXmjEUQcbENbDLFE=; b=aAB9kz40N0zmXEmM44WVlf8snw
	KaNDIFnaCuKPEQauIC9ViNShEVSI4s24YOEeUGPqHvCBQj+PQ34X7lTY/U91QLzH5sCRA1h6UPTA2
	rz340ccpaBjkjfdngnx7hhzHKR1rdZH1Eyo8CW5uEICWcD+0yt2fTRUj8kaaSuLqkeEq1rXilsRuJ
	Xz3RgtmYPe2XGnMRfynFuCwzTnmoXFpVh8mX6vZ1ge/8THJZb3hr6YmAof0mrCwmtIHZvXHLR5CHh
	G+rdkXfU0QAZ5+k6t9qEUsKtt0C2ReuKzbCH/BS6zWcGbXPNrnnqodbaR2ua56UiAJ2rsWSolGgUW
	TSxLoM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaGj-00000003mYv-2bnT;
	Wed, 24 Apr 2024 10:54:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaGg-00000003mYF-3eSw
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 10:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2388261A04;
	Wed, 24 Apr 2024 10:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7107C113CE;
	Wed, 24 Apr 2024 10:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713956065;
	bh=fkHyB5kj3Ej/ZXKY/45BZTmNjWhhIKPLZdiQon3VcSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JbyJFc2YnTcKJDIZRzIvhgWCjZzeHXxwCVeyeYiQ8XoOfPuatv+oEH/XcMTp03LY0
	 Cwu93uNJYhYGnGjULlzOCbfHN5DIiNllO30y62XE2JC35Wyslnh1B/r3bA2gdY/LNn
	 UbSraV0GL24QyqQh/LPQoj/bS9cMCEh6kxrbHwOpT/lZwWkljNC08IK7CWbt69mM29
	 zPyX1z25WUBlFJ4qxPbFFYWEgUFH2jhrPRwSG0HKfPiaVUhBgQ7WD8ctqGGJvWYj/e
	 4HxSc0UjxkCq6k8OTGLP2Zk9NRnFSbM/iYlZFGe6Pk31Pg9yGCRe5U4LsOGwrsIwA4
	 9d4cJ4AtE9V2w==
Date: Wed, 24 Apr 2024 11:54:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] riscv: Remove extra variable in
 patch_text_nosync()
Message-ID: <20240424-denote-alike-ee3858fadecf@spud>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
 <20240327160520.791322-8-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240327160520.791322-8-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_035426_997321_E9A31B02 
X-CRM114-Status: UNSURE (   7.99  )
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
Content-Type: multipart/mixed; boundary="===============4753573954964027136=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4753573954964027136==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SgmRl1SXMlQwXumE"
Content-Disposition: inline


--SgmRl1SXMlQwXumE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 09:04:46AM -0700, Samuel Holland wrote:
> This cast is superfluous, and is incorrect anyway if compressed
> instructions may be present.
>=20
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--SgmRl1SXMlQwXumE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZijk3gAKCRB4tDGHoIJi
0rb7AQCCj7ZCc8NyZE6QkSUhR01PWj04+Tq4L9okpcXedzoF/gEAwV8OBW1Nebs+
jrMyFx2hDjwDR8jmZUooBX1qvqS26AQ=
=d/Y7
-----END PGP SIGNATURE-----

--SgmRl1SXMlQwXumE--


--===============4753573954964027136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4753573954964027136==--

