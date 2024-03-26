Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109E4C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 18:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyM+a0XB7p1D2zK+jp4II7Hn4dbatPBwYbCPxW7ZJeo=; b=zHaNCvsElgcCKd5CIbnPIp8Y1S
	aDcYJHN5jeDUrBWXnKbmXUrY1n6dK1dbdYpOnwjqCYPz04/M7gnefQke2i3+GGt4pn4H7ki2jx3T5
	TSOMWAwf+5b2k2AKx3mNZymJ7+r+J8feJCCjX4pUE9td+/s9wmCjPMQfFpS/UhEGcExRTrGgqRWSS
	v/TH5E1p/ciPBUCYFkRt00GrKdv90oXIDKTVRK8ICc/qJlX5i6zJ3u4hWPpj1QuW2PmeuwoeFxmo4
	dhixGFsUFpCfesZ/1VlqdOYRrw7Qpcobq5idZAYG07caqYnIx+VQhJ6oaKDoeY5py4YzdvXc0MRvP
	u2DbcObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBlI-00000005y14-1Xg2;
	Tue, 26 Mar 2024 18:43:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBlE-00000005xzS-3KI1
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 18:43:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 85C1561355;
	Tue, 26 Mar 2024 18:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF51BC433C7;
	Tue, 26 Mar 2024 18:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711478579;
	bh=4jVrfD/KvnLbhutEiKxJwcAulEU3J50vmATSDtq9sqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IyialCPC3XtDBNWscY3/R0P7oEJ2BjULmLF15MUdpQ/pvuLKfcck53g46epTk9R58
	 GcoQoHy7q0tyoVKC4r2PeOMLJETm3V64gaZ6n0cpw2/irlliNf5Bz6Ix7/Jk6iiIvv
	 Uq8GFF1QvQUAQYnGCOhzMEDLT49PuPraYC/Xt0eH3RSMJwYnwuVLwWunZJ0YXiJGlF
	 T8d4fgIvrUCpB3xwMLXnx/t4UzEU/u8Bwc3L1mFyD90OxoXAJqCuDmclN+R0yWiD1L
	 PpBZCgmPohc/Oiom6oxYypolD90iiUaNY+Lr04O+HJ3/BolKbCj5SYbKxcLzJ81HLM
	 FE1yx4O0ZhDcw==
Date: Tue, 26 Mar 2024 18:42:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v7 2/2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
Message-ID: <20240326-cape-compacted-e76df066752f@spud>
References: <20240326134616.7691-1-jarkko@kernel.org>
 <20240326134616.7691-2-jarkko@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240326134616.7691-2-jarkko@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_114300_964425_59CC10CE 
X-CRM114-Status: GOOD (  17.11  )
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
Content-Type: multipart/mixed; boundary="===============6872922117486145162=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6872922117486145162==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZY3M3zfLOpMoFKjK"
Content-Disposition: inline


--ZY3M3zfLOpMoFKjK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 03:46:16PM +0200, Jarkko Sakkinen wrote:
> Tacing with kprobes while running a monolithic kernel is currently
> impossible due the kernel module allocator dependency.
>=20
> Address the issue by implementing textmem API for RISC-V.

This doesn't compile for nommu:
  /build/tmp.3xucsBhqDV/arch/riscv/kernel/execmem.c:10:46: error: 'MODULES_=
VADDR' undeclared (first use in this function)
  /build/tmp.3xucsBhqDV/arch/riscv/kernel/execmem.c:11:37: error: 'MODULES_=
END' undeclared (first use in this function)
  /build/tmp.3xucsBhqDV/arch/riscv/kernel/execmem.c:14:1: error: control re=
aches end of non-void function [-Werror=3Dreturn-type]
Clang builds also report:
=2E./arch/riscv/kernel/execmem.c:8:56: warning: omitting the parameter name=
 in a function definition is a C2x extension [-Wc2x-extensions]

>=20
> Link: https://www.sochub.fi # for power on testing new SoC's with a minim=
al stack
> Link: https://lore.kernel.org/all/20220608000014.3054333-1-jarkko@profian=
=2Ecom/ # continuation
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
> v5-v7:
> - No changes.
> v4:
> - Include linux/execmem.h.
> v3:
> - Architecture independent parts have been split to separate patches.
> - Do not change arch/riscv/kernel/module.c as it is out of scope for
>   this patch set now.

Meta comment. I dunno when v1 was sent, but versions can you please
relax with submitting new versions of your patches? There's conversations
ongoing on v5 at the moment, while this is a more recent version. v2
seems to have been sent on the 23rd and there's been 5 versions in the
last day:
https://patchwork.kernel.org/project/linux-riscv/list/?submitter=3D195059&s=
tate=3D*

Could you please also try and use a cover letter for patchsets, ideally
with a consistent subject? Otherwise I have to manually mark stuff as
superseded.

Thanks,
Conor.

> v2:
> - Better late than never right? :-)
> - Focus only to RISC-V for now to make the patch more digestable. This
>   is the arch where I use the patch on a daily basis to help with QA.
> - Introduce HAVE_KPROBES_ALLOC flag to help with more gradual migration.

--ZY3M3zfLOpMoFKjK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgMXLgAKCRB4tDGHoIJi
0kr6APoC8w1hFwYBq68SvRiP5k+lnvxzYoTYGxCdhojX1wA0lAD6AyvaCzZnOAGK
ej3FsxMvaVpbalYkFzvk6xtCRrliwQk=
=Qyv3
-----END PGP SIGNATURE-----

--ZY3M3zfLOpMoFKjK--


--===============6872922117486145162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6872922117486145162==--

