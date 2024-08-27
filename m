Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08600C52D6F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esCTqBoKNmAsKK2KfAYhCFKb8BI0ukn2zU5kowHrVCc=; b=FPq3Ma8Gahb2SvMH6y5ka2bfw7
	cKeAfrjilStErUDXuOt/aazb7D+f6eUu9mbF2uuv7B8sKUMtWy/Vhv0E1H9B2iJkM1e7Vqp+S0683
	WyrF6t+dYr3G1kgogmdEbugZQLUPmmAeQwF9nTo9j9zYAhijCnbcErzjzfnGPk6aI5Aeo5SameycQ
	Y5x4wycRS0cEwI/kx6O7SyKecMkdlbZ0l+26+a86NTib4t/TGieyw55f9Q1WQVVhHrxedDHCeqYcR
	Aio1kR8KhW3x6EiO8tUfW0qZE3QVAK8U8ny9FLs6hn/D19Sp/VJY7v+rPi+HyISD5UOjT/Jd4KAj3
	Bo+zt+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirig-0000000AQc3-2RcV;
	Tue, 27 Aug 2024 08:38:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siriI-0000000AQVD-2gWo
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 08:38:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 02B00A416D1;
	Tue, 27 Aug 2024 08:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB228C8B7B1;
	Tue, 27 Aug 2024 08:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724747885;
	bh=3nRrCcNh+WKk3hvq0XOgP1afEtOult9YOcUxytPerZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1bN+dcawacxtmJn73wXDUWD3ZDFeOKXp8i2MOAZZeL7vLJ/cH951XwPUOmY0feve
	 5s936d3tdjJpgIwBrpMlVIXtMpKSJ2ZwcFBNppxhYBscyq0pp1ikZH7fpjh1nklkkO
	 Kx8cMYDcR1xEk/Py0qhyaOnXzEUSpn7dVpQ8haJrzo/014Wd4Pr/pyb5ljZySgiuyP
	 XgXdKDHQBnNeM9CjuK6xlmfTSlTVK0mLtBy8KjdBx24pb/F/C1uGgWWayxxcJOPE3U
	 Ypd9hynZDRIVaxM1RNXz8zv89U/CPqkP2G/wvdYyS8BuMd5RlftO842zXH3U9Tejc1
	 nuJXr8Xj4x8AQ==
Date: Tue, 27 Aug 2024 09:38:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix RISCV_ALTERNATIVE_EARLY
Message-ID: <20240827-striving-dispute-19b6cf97139b@spud>
References: <20240826105737.106879-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240826105737.106879-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_013806_761113_BF91E5D6 
X-CRM114-Status: GOOD (  12.14  )
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
Content-Type: multipart/mixed; boundary="===============1696034344335220717=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1696034344335220717==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WUoEQbA1AuWx5rCS"
Content-Disposition: inline


--WUoEQbA1AuWx5rCS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 12:57:37PM +0200, Alexandre Ghiti wrote:
> RISCV_ALTERNATIVE_EARLY will issue sbi_ecall() very early in the boot
> process, before the first memory mapping is setup so we can't have any
> instrumentation happening here.
>=20
> In addition, when the kernel is relocatable, we must also not issue any
> relocation this early since they would have been patched virtually only.
>=20
> So, instead of disabling instrumentation for the whole kernel/sbi.c file
> and compiling it with -fno-pie, simply move __sbi_ecall() and
> __sbi_base_ecall() into their own file where this is fixed.

IOW, this should fix the issue that we discussed here
https://lore.kernel.org/linux-riscv/abec162e-f3f2-488c-83d9-be17257a5df8@gh=
iti.fr/
also?
I'm sorry I didn't get to test that yet, we had some pretty bad IT
issues in the office the last weeks and I have been avoiding going
there. I'll try to test this one instead..

--WUoEQbA1AuWx5rCS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs2QaQAKCRB4tDGHoIJi
0s4HAP9R7DRRgtrxWKs/ooG2L716azXsarufF81XC3XFVzH61wD/WgnopbRqbSZM
rAkoD48sOPA15UGrJsrtmq7Aslc1SA4=
=gQhL
-----END PGP SIGNATURE-----

--WUoEQbA1AuWx5rCS--


--===============1696034344335220717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1696034344335220717==--

