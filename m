Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB43C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 16:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuV5B3pvBNPv10qjQgkm/5q+cSjqRV9J6lgeo5uNgOU=; b=O/3fN0jruaVIPUVyf+UNl/bK0v
	FCQ9HhLxn2Oo4vNiicyXFYqKaW6g9sBVnPPiNWAlODEtCI7wc2NtMq6+SexI6YEfs0qJby+SLQ6tC
	1u/YnVCrHw53BxW1MlLvwrXiAb4Roa3cvgyN2uDlgIIIlNSVAgKaJMpT16FNABxZy9djCs33hw1id
	C8pJjk//h7cbOZN5COmHRfky+9r1lVW9MI/KYXSdoiqSBvAsf7N+G4GiwzOR2KIIU9+1qYz3MgNHt
	lcXBnWpQ/HBXtRbJyJzLDEKLyQ8NIDR6oVf5fvICTkNPp26RriJ30SSOrP3bbohkfqGWUv+Z4m90I
	vhzgjCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Cgt-00G4K9-2E;
	Mon, 05 Jun 2023 16:04:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Cgq-00G4JQ-0H;
	Mon, 05 Jun 2023 16:04:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 932B66139D;
	Mon,  5 Jun 2023 16:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0387C433EF;
	Mon,  5 Jun 2023 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685981055;
	bh=6qbih/vEQ3IgOXhLpHjEbAQXTz8MxqlIdSAHtD/Pfbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gW5cwihYbSD8isEE0cE+yobhRtfF9vEw94r7PkeRaaStg2e1/fROWxZfDtpRjH3x+
	 Mv8hOIU2+WvsoJ8QvGkYR0wYXAyX5NplAznMKUMl42ZsEqENKnyKKwzBPzlsPIgrBs
	 YbRd5iiTdDNYitNa2z52AV26E+WEFjB/Qtc60I5rR8DUATW4Dv7T63q/TdCotXq/FA
	 DhLhwSDXvPw+uZYzTMTcCtmWULNI6Mt1hFhqN6/ACCVKF2FlvLeJKPrKPckoEDKwG6
	 XSAYovwPnTzK4rGq3hKVT5NNJx1VyclG9A8m3otlVqOg390dOeX3+8oHzgHNjfFD3e
	 RO1Ak36QgG2Tw==
Date: Mon, 5 Jun 2023 17:04:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liao Chang <liaochang1@huawei.com>,
	Vincent Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Mattias Nissler <mnissler@rivosinc.com>
Subject: Re: [PATCH -next v21 11/27] riscv: Allocate user's vector context in
 the first-use trap
Message-ID: <20230605-creme-smugly-e7592c870dda@spud>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-12-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230605110724.21391-12-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_090416_167394_B0779F9A 
X-CRM114-Status: GOOD (  14.93  )
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
Content-Type: multipart/mixed; boundary="===============0287997041841546712=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0287997041841546712==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JDKQEQvRrSOz4/Yu"
Content-Disposition: inline


--JDKQEQvRrSOz4/Yu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 11:07:08AM +0000, Andy Chiu wrote:
> Vector unit is disabled by default for all user processes. Thus, a
> process will take a trap (illegal instruction) into kernel at the first
> time when it uses Vector. Only after then, the kernel allocates V
> context and starts take care of the context for that user process.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d@lina=
ro.org
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v21:
>  - Remove has_vector() and use ELF_HWCAP instead. The V bit in the hwcap,
>    if preesents, implies has_vector() returning true. So we can drop
>    has_vector() test here safely, because we also don't handle !V but
>    has_vector() cases.

I think you could probably have carried my R-b from v20, but I realise I
did not reply to you - sorry about that.
The removal of the has_vector() check seems to tally with the
conversation we had on v20, so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--JDKQEQvRrSOz4/Yu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH4HeAAKCRB4tDGHoIJi
0gMUAP90+rSr7Qh/b85tSAyFl+ycEwu104o3A+izAsQe5k6aXAD8CHaPrNUw32YG
9aVdc4VtljGYKMwlbMMXQrgfGv0FOQ4=
=4Lvs
-----END PGP SIGNATURE-----

--JDKQEQvRrSOz4/Yu--


--===============0287997041841546712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0287997041841546712==--

