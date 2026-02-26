Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9405DFC590E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZ8t/F6Cdk3gG697tDNcJ4eOXg833RvNFcKxn5w+nd4=; b=r1wf/Jpy3NL4jikwxJeFs3K1QY
	A1Y06ZddtHvJrU+5rLa+Cy8AaqEWj3GzYpsie9JRHnUdwalTrAHmooBc3YYHhBHgIB5X577qbDdFI
	NlzVXqPVHCJT0HgykHwE2xIuAgY8rOfl8PUVCx38gSmFzRJrG/JNHdMgws7ODuK06ulVbm/Z7frKz
	XOWrt8hl1FaMQwvWdHO2p80tqjVHiNgEDzEjlXwFKMhMZL1vFNmYQrJpkN+YFZF+KK0rPKnphzYST
	uYcxxZLZpI8TiYCGBgtZAGqCce5IQlzzqHv0i+2oIywHNuFp9ut67bNLiqndjwgrwbSWCwXm3Fyj9
	rIT6GACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX2p-00000005h6I-1Ztk;
	Thu, 26 Feb 2026 08:48:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX2o-00000005h6A-0kKX
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 08:48:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86C9B60103;
	Thu, 26 Feb 2026 08:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B671C19422;
	Thu, 26 Feb 2026 08:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772095705;
	bh=nlFAYkBePwUiakKi3KJIX6r1MW8vXqAHpGfGYf2J9ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQqv9tcTAWzfp+TiryGk00/HXVZPwdHHCeTLxIUAPZGzlBbzCN8sZSH/71XyoP5tn
	 R988vE2NGHldbGjr0X2KzZ9J9JYY+XUjQ1H4+sPSbpDAhRRHw46KuW8QJIuShPy2fT
	 XeZjFF+DmY3wCAXEf7h4eniA4eVtOM2+MiHIPVh+OHcQIMZ0UDCbJbw460IY1q2L71
	 LMMTq7m9nA2m2ym2N1xYaimdYSPT55x7ZXnvWIq7IkdBze4Ob3G6hXAuxjZlLmlGKn
	 rEGPdJqf/PHKDeMvckg/PkR3p21AbA0uvNUWngPs25GmlBwYsduvCEx/NROxi3Q5nb
	 NeHuM89uD4SJA==
Date: Thu, 26 Feb 2026 08:48:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, shuah@kernel.org
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <20260226-sappy-name-e8aa49b42e51@spud>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260223-mouth-plated-50294c7a6ac0@wendy>
 <CA+Ht8=aoxQp-RcFGWXXsfDyNarCn=zRhUOoG9rUCGeEw83BQvw@mail.gmail.com>
 <20260224-likewise-rimless-151f6a12b092@wendy>
 <CA+Ht8=Z-iaQ+zys5UOy6iNtdTsdtjq7mARwz=KJA_vbNYcfF6w@mail.gmail.com>
 <20260225-compress-moody-400a1e2f46fb@spud>
 <CA+Ht8=ZF2nT+gWwtEi5QdoKuOQPX5ts66WmFcF2gaoTNKT8hgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Ht8=ZF2nT+gWwtEi5QdoKuOQPX5ts66WmFcF2gaoTNKT8hgw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3335682997277636213=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3335682997277636213==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5qqF07pXGASeadO9"
Content-Disposition: inline


--5qqF07pXGASeadO9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 08:17:47AM +0530, Himanshu Chauhan wrote:
> On Wed, Feb 25, 2026 at 2:30=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Feb 25, 2026 at 10:33:27AM +0530, Himanshu Chauhan wrote:
> > > On Tue, Feb 24, 2026 at 1:33=E2=80=AFPM Conor Dooley <conor.dooley@mi=
crochip.com> wrote:
> > > >
> > > > On Tue, Feb 24, 2026 at 09:30:24AM +0530, Himanshu Chauhan wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, Feb 23, 2026 at 3:55=E2=80=AFPM Conor Dooley <conor.doole=
y@microchip.com> wrote:
> > > > > >
> > > > > > On Mon, Feb 23, 2026 at 10:19:17AM +0530, Himanshu Chauhan wrot=
e:
> >
> > > >
> > > > Did you miss the comment at the end about the remaining TODOs?
> > >
> > > No. As I mentioned in the cover letter, the ptrace support is not
> > > implemented here. I am actively working on it and these are
> > > implemented in ptrace work.
> > > The test is done using the perf events directly. The second patch in
> > > this patch set has the test application.
> >
> > Then the patchset should still be marked RFC, since it is not finished.
>=20
> Why? I disagree.
> It enables the debug triggers support with perf. Ptrace will build upon i=
t.

If the functions marked TODO are are not required for the patchset to be
merged, your commit message should clearly explain why these particular
functions do not need to be implemented at this stage.

Cheers,
Conor.

--5qqF07pXGASeadO9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaAI1AAKCRB4tDGHoIJi
0uP+APkB/A2Iv/cu7UIBPwy7I3iD9GwXdS707KoKSkqBcZIhjwEAkJIMHOOpzXT1
QoHKAKdQrPNwSAVxO4IWorUrbc28wQ4=
=Df62
-----END PGP SIGNATURE-----

--5qqF07pXGASeadO9--


--===============3335682997277636213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3335682997277636213==--

