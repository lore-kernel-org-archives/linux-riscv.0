Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C61C77B71
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPppDvb7fv2deQnX4cT8v2N4PgkTCl0mpqTSCtJ4y4g=; b=Yf6HeeN+Y2nDMr6xxMQVUWJVBP
	iDtsT4rKIq7XLTgagdzI5zKKZllLmUwTmw6NATnHSwdMz5CWw0zVKUF7nMl+zpARms/8Ke5soFNz5
	+P8QoCiuH25/VAZyiP4vacIo5VSCvevoQwwVGWflj1E/ADVpC+mCfjlW58JffSVNOH7dHEK9PmOm+
	8jLR2jNjadp4JNEc2UDw0cOVEOkJaiD97yw8DTIrVnE0Jz7in799QORws9pzrB3TUuYOUjBGfDNtT
	kz6pu6NAGTVZGMpnZCAGJihBJu8pSOUGpMJ1zuaCu1JIqnPPG1/Kc8AxQtDVX2/fjTr9RVO8ZnSqF
	7Ydd5orA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMTm-00A8Il-1p;
	Fri, 14 Apr 2023 16:40:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMTi-00A8Ht-1t;
	Fri, 14 Apr 2023 16:40:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52DA764915;
	Fri, 14 Apr 2023 16:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6957BC433EF;
	Fri, 14 Apr 2023 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681490448;
	bh=+bsbFNcFaj5gJ3yfrtFwobAIBFwXygC8zktuMnqtTAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y34iTueB1ifRDeV6Isv0WDNMZGlBnhcZZ1uCNgJG3nLT5yhwSKyV0AyVts4gvbswA
	 e+AdwztVpPwhw9z+yLol7HMiiKoNDDyszoueN/sc5mTz/RBzasG2f6TE1bv3o5Yzyz
	 UTR9SxuAbNjdy7V2z5bh3fb+/5+y+19A5SvDemYIoUuYGmFIer5SCsmPrwPdh3/j4o
	 SE6tA1aNfobSAlnHernR9scc2/UO4jkm/kW2hYj/K48OIdgRzwusT+BLdfWCre05GC
	 /wbaiEBAf3r+wNDC2BnurySFNsV8egX6la7Q/tCvRQq9u1lfNOBRbNafx8wRQqCNIw
	 ezJ/cY3n6ObfQ==
Date: Fri, 14 Apr 2023 17:40:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liao Chang <liaochang1@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Mattias Nissler <mnissler@rivosinc.com>
Subject: Re: [PATCH -next v18 10/20] riscv: Allocate user's vector context in
 the first-use trap
Message-ID: <20230414-sprout-vengeful-f076776a08d7@spud>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
 <20230414155843.12963-11-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230414155843.12963-11-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_094050_680351_39F2AE19 
X-CRM114-Status: GOOD (  11.31  )
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
Content-Type: multipart/mixed; boundary="===============3471036922792055260=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3471036922792055260==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5xCGmRrbh4SbHigR"
Content-Disposition: inline


--5xCGmRrbh4SbHigR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 03:58:33PM +0000, Andy Chiu wrote:
> Vector unit is disabled by default for all user processes. Thus, a
> process will take a trap (illegal instruction) into kernel at the first
> time when it uses Vector. Only after then, the kernel allocates V
> context and starts take care of the context for that user process.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d@lina=
ro.org
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Acked-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

I meant to reply to v17 saying that you could re-add my R-b, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--5xCGmRrbh4SbHigR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDmB9wAKCRB4tDGHoIJi
0jWmAQC10lY6uQVT+9WcXeQcH4DlqcXAy+iPmVp3ThJ14aNolAD/Zbm6ynzF2B7J
HiJEUH9/tcfJHMCB5H3LLiXMNtUazAs=
=7brj
-----END PGP SIGNATURE-----

--5xCGmRrbh4SbHigR--


--===============3471036922792055260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3471036922792055260==--

