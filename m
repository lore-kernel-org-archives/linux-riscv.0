Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AF4CD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 22:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/3oyyAtVD/avmF0+rjOHMjgRucKwFzpjS6X/YISi3M=; b=CUKgkvd9Fjx141e3+JY2Q8fR8F
	QSORrwvzS7J9bXH+0uNXM/ePh6nFjgmKmkIkkRyEP4k3N/Kbg9uth/5M+xWIJVDDITlH08DDXx2X5
	ktfNVBzCRzhBsj3KuRW2RO9/ZCNKKkTV89CjyG6ekndcgKX8/ZxetZ2M1epLmOYHz2jczLi+OjEMu
	iJjChrUpn0Riue90Mtu9cM3UTTUJq2DM4cLpVH3v3PoIiDr4YDLLm8XWgmqzYf3a52UdHMushCdQe
	qndyK7oPG2kEplSUMNG7uvsFvbkoVx75gbPZ1WwHUf2oy7xvOZmXk7NHszaH2YbG3RbpkHwX46ZYn
	WkMLEwCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugEz-00000009Bl6-2Asq;
	Wed, 10 Apr 2024 22:16:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugEs-00000009BgV-31Aa;
	Wed, 10 Apr 2024 22:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A52A261F3A;
	Wed, 10 Apr 2024 22:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFE8C433F1;
	Wed, 10 Apr 2024 22:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712787377;
	bh=eSgO5pW5YMKLhnbQoXlFyr4GSxxlml3nI3ZwqFFRmh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9n8ET68D2ZFe/iSKlFkvb35l/MWCS9iIEfC5Ejo2JybPqCdX/Gl4U0OaQc+lSTEV
	 t3HyqvUBJBi7fybvhAaZrGJtgikm2g7kfT58aK5gt0ZvQMCoanJyiMNOxc79aZnNum
	 2BdjY3JuJB4rAtqJU6/AulLAX5jjmXTitatKhaV/gkYSeTn642ka4buGDYDnuGqXhb
	 v9MmIiHozPux3yibIUcOe/P12YDJY0G4GTDHZS0WniA/nN/tLQ03nK8KiuhArxrgVt
	 oAy5lBLEG4KQ4qpEI8qYpD4XnO4NFBybPaY86KamYElWChe/MAZwQN8SYkzj/z+VwA
	 9rvJIfDWdcoeA==
Date: Wed, 10 Apr 2024 23:16:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
Message-ID: <20240410-jawless-cavalry-a3eaf9c562a4@spud>
References: <20240410091106.749233-1-cleger@rivosinc.com>
 <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_151618_903873_3EC8DB3F 
X-CRM114-Status: GOOD (  16.96  )
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
Content-Type: multipart/mixed; boundary="===============0995070407022652978=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0995070407022652978==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DLrdOXAHzOvEYfLu"
Content-Disposition: inline


--DLrdOXAHzOvEYfLu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 02:32:41PM -0700, Deepak Gupta wrote:
> On Wed, Apr 10, 2024 at 11:11:00AM +0200, Cl=E9ment L=E9ger wrote:
> > Add parsing for Zcmop ISA extension which was ratified in commit
> > b854a709c00 ("Zcmop is ratified/1.0") of the riscv-isa-manual.
> >=20
> > Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> > ---
> > arch/riscv/include/asm/hwcap.h | 1 +
> > arch/riscv/kernel/cpufeature.c | 1 +
> > 2 files changed, 2 insertions(+)
> >=20
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index b7551bad341b..cff7660de268 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -86,6 +86,7 @@
> > #define RISCV_ISA_EXT_ZCB		77
> > #define RISCV_ISA_EXT_ZCD		78
> > #define RISCV_ISA_EXT_ZCF		79
> > +#define RISCV_ISA_EXT_ZCMOP		80
> >=20
> > #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >=20
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 09dee071274d..f1450cd7231e 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -265,6 +265,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> > 	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
> > 	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
> > 	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
> > +	__RISCV_ISA_EXT_DATA(zcmop, RISCV_ISA_EXT_ZCMOP),
>=20
> As per spec zcmop is dependent on zca. So perhaps below ?
>=20
> __RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZCMOP, RISCV_ISA_EXT_ZCA)

What's zicboz got to do with it, copy-pasto I guess?
If we're gonna imply stuff like this though I think we need some
comments explaining why it's okay.

> > 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
> > 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> > 	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
> > --=20
> > 2.43.0
> >=20
> >=20

--DLrdOXAHzOvEYfLu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhcPqwAKCRB4tDGHoIJi
0re3AP9QmK68/uYxyQ3GXl/aO2Y4Z5DssohLEjC19dZXe0kZCAD9GGfqdzucBPRK
8Oq4p/rBx7aglYaFYqQkMvbeIZStjwU=
=a6wq
-----END PGP SIGNATURE-----

--DLrdOXAHzOvEYfLu--


--===============0995070407022652978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0995070407022652978==--

