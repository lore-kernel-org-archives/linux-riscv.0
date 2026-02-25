Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E83EEFD20B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHrg7rjRTZZUFxoDRJuPBJDZigBeptte1gYTpKzM0HA=; b=vkVd6jQOaawmzUED+7mR8m6yoa
	bqcAU7qrtK4GIhLIqSoqqCrwbWjJqR096s3dBMq+qstkSAfg2IwB06EpUrfSS+8rBcHT7DEfI/BVI
	2KFn43RwCu+uA8D16HkRemH8X3HLbRd3x07+GJyxhE4J1TICUKAtVphYlNByD6u+Jsrk+pldWyNu+
	luHNkVDqbY0kRkuz7e3OlrbeFygjD8cP0kMwXBXIeZsxUkeJLy2SiEKXULRKlu59HgiissQ2P0U7D
	kpBuPM3I0j0tHlBQpwwAsxk2tFEyg2Jdsju7byM5PDmgki+VtF8EaUC4XzBXZlNND6lElv8hoDt8p
	2NN9BvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAlM-00000003cB3-1dH0;
	Wed, 25 Feb 2026 09:00:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAlJ-00000003cA8-0BsB
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 09:00:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2F37443AC;
	Wed, 25 Feb 2026 09:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7FAC116D0;
	Wed, 25 Feb 2026 09:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772010050;
	bh=2a7701S4Mi5IG9kSi39+yELI5DzHglckNb/COUPetTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POo+GpwDttUyekYKznKcT/3oPuDr7QFPO3AZbqbCvC6USw6heSLkTy+gPrdkIhe39
	 Bw4nVCrtFZV4v4cqeio8PM80Lg2gY055xCmtRwGUK/cbeOoD10cPubP5Upm96zhVbZ
	 Up3A9pwe4mS0PH0KRzticScnW3sjEFTKAj8xU5hzE1YEIfU6OwgFIoChjRHE1mDrrd
	 6j2jxxPF0j4atXYzI2HfvFRKeonRerZuvyOIIWld3wt4Hy9vn+Hl5CKZJ9Kzj8pnlO
	 P/Or+2GPfuAWffjdkd2Ap71sHwcNRm/+tedPxUoLMkiBeCYXjDI8WX4v34sGNHM+OH
	 tFH20ykCtMLwQ==
Date: Wed, 25 Feb 2026 09:00:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, shuah@kernel.org
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <20260225-compress-moody-400a1e2f46fb@spud>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260223-mouth-plated-50294c7a6ac0@wendy>
 <CA+Ht8=aoxQp-RcFGWXXsfDyNarCn=zRhUOoG9rUCGeEw83BQvw@mail.gmail.com>
 <20260224-likewise-rimless-151f6a12b092@wendy>
 <CA+Ht8=Z-iaQ+zys5UOy6iNtdTsdtjq7mARwz=KJA_vbNYcfF6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Ht8=Z-iaQ+zys5UOy6iNtdTsdtjq7mARwz=KJA_vbNYcfF6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_010053_113069_41351C40 
X-CRM114-Status: GOOD (  15.26  )
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
Content-Type: multipart/mixed; boundary="===============6874319125856468778=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6874319125856468778==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AjaCghlLmTjE8IHY"
Content-Disposition: inline


--AjaCghlLmTjE8IHY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 10:33:27AM +0530, Himanshu Chauhan wrote:
> On Tue, Feb 24, 2026 at 1:33=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Tue, Feb 24, 2026 at 09:30:24AM +0530, Himanshu Chauhan wrote:
> > > Hi,
> > >
> > > On Mon, Feb 23, 2026 at 3:55=E2=80=AFPM Conor Dooley <conor.dooley@mi=
crochip.com> wrote:
> > > >
> > > > On Mon, Feb 23, 2026 at 10:19:17AM +0530, Himanshu Chauhan wrote:

> >
> > Did you miss the comment at the end about the remaining TODOs?
>=20
> No. As I mentioned in the cover letter, the ptrace support is not
> implemented here. I am actively working on it and these are
> implemented in ptrace work.
> The test is done using the perf events directly. The second patch in
> this patch set has the test application.

Then the patchset should still be marked RFC, since it is not finished.

--AjaCghlLmTjE8IHY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ66PgAKCRB4tDGHoIJi
0j7aAQCRzy8nLUKmsz7bSfr8WHMOrduALnY1Vt16X9cFKVFXfwD/Qii8NWCffQlb
YSlRu8VQOmemslO4P+v99emB+gugkQ0=
=5ol3
-----END PGP SIGNATURE-----

--AjaCghlLmTjE8IHY--


--===============6874319125856468778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6874319125856468778==--

