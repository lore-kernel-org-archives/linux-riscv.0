Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7BAC64EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 21:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wudwrRUCd8EqrrdbJB+cLiSW+eY3kxlYptQFwXIFCOo=; b=Xb9CGokrZNCz8vl7tZT39t8BDm
	c7CqTvpEQtMIUdYh7tWVJj0B1aIu3ml33dJ9a7HuS8WOvmq8LnpXnpwAvBNrpI7ij1jJsxdRjw9is
	vF8E7g3btL9l/IR9LUNLeDztE38rcyhjXOGzvB8q+8K/IVcIVh4PhoVIKSt/9bPYxkULgCZb1NwvZ
	V/kvJxUXp0FO0RbfI2461aR//2rvU+DT+RKQwVKAHM+yop1zljuY4lopns2pE4/7KaIgrM7SVWOGc
	OaKeh+OLy8ig2elXzfpm5kxN5JS2+GIn/r9kFwhpZbQPNP6HCGteuX0OttX/ZUyEn9HKt3sgiUKzW
	6kbHlpJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7xo-00EPBv-JJ; Tue, 28 Feb 2023 21:56:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7xm-00EPAk-3r; Tue, 28 Feb 2023 21:56:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C9005B80ECF;
	Tue, 28 Feb 2023 21:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441CFC433D2;
	Tue, 28 Feb 2023 21:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677621403;
	bh=S8lArU8afl+FZofTeoyMgzmCP7SiMn5vwh2R/3DZBHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTnOmkiSrrcvXLqb23p7iecO7gYO9DO7ij5XwxGxJ96BCipXunN2lqrUxV3oTZ7iR
	 c+kyCANjoFiIFyb5QzYsid9wjh0PPjEqCG9xCFdawApISHIjwVsbbw+IHH+//vUAIH
	 nVQPf7+x95TMdb7IpdlzVNWWwR5C5A9Jgb2kljR+jrWcvgcivJc2wlL6/p3efRwiO6
	 LiQcAFh8BQKaScrm65OpfJH2jWe27XYZUrxjCybTnCIIcloQPAsw56V8M33FCKPVBp
	 holjrGCZ3LXZL4fdz3TjoO4WNldoKJPFsjn49TRvHKnfRZUBm9MDsiTbUJnJkYEQU5
	 zEAWNZnfGBIvQ==
Date: Tue, 28 Feb 2023 21:56:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Guo Ren <ren_guo@c-sky.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Nick Knight <nick.knight@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH -next v14 01/19] riscv: Rename __switch_to_aux -> fpu
Message-ID: <Y/54lWWZcx4sP5KE@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-2-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-2-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_135646_317720_558DFB27 
X-CRM114-Status: GOOD (  11.36  )
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
Content-Type: multipart/mixed; boundary="===============6251582658914383634=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6251582658914383634==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AmPj++hEXIEO1fE8"
Content-Disposition: inline


--AmPj++hEXIEO1fE8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:01:00PM +0000, Andy Chiu wrote:
> From: Guo Ren <ren_guo@c-sky.com>
>=20
> The name of __switch_to_aux is not clear and rename it with the
> determine function: __switch_to_fpu. Next we could add other regs'
> switch.
>=20
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

Suppose I shall tack myself onto the end of this list...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--AmPj++hEXIEO1fE8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/54lQAKCRB4tDGHoIJi
0j5jAQCIrjBp1393Twe2BrHYeQyeiOv8wJ4vK9IIMw4cWM+k1QEAqiBDe+dgYFPH
hiidtfhhhbRNB3L9TloRKGC9iudVxgA=
=YHMe
-----END PGP SIGNATURE-----

--AmPj++hEXIEO1fE8--


--===============6251582658914383634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6251582658914383634==--

