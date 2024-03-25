Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A8EC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 19:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLZcCi8gXXFnUW3PbMnN4s874uMprJtUZO1I3c+FZKc=; b=g2SdIpA9r8S1SlQPPyH4YB/SF1
	y8EgOjLFlai8VcAOOM4rkUP5kJ2/yOa0wp1gZPYdA36B0CvR1rmcsexAt0MkVG/nnAf79ijcpksqd
	D5rgRkoUVzGEf5ObV+sgR6nasWBPzNpIRFLxa/CyNgBYHSC0rsR2UBVXeeinUdsLy8nRHnvuz/4u1
	qxNgTxLBvxbqlEtfsMODIUgc1AlsOaVefEx0cXoGwO9EH+cB/rnyqAu4MmBmaunHdbrzuVWiPSHNL
	y6KwxleA9xgTDb7DvvBwM7PEKVUqrqoPx1XQYg4sURwbINlstkUU3qGVOgTXEF0Rgkvd6zcX43+qg
	ATgkUVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropr2-00000001YuA-3KFQ;
	Mon, 25 Mar 2024 19:19:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropqz-00000001Yth-3esR
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 19:19:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1138861161;
	Mon, 25 Mar 2024 19:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F160C433C7;
	Mon, 25 Mar 2024 19:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711394368;
	bh=6ur4nAJ4fwkwsjzeh2IAAOBPeg2ISaHYc8y9oEzYf0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sXCND9aJ3vGdPTUZkzw3cMJ5Z+8+y+sA3Uk5ODhmOoTed+Me48SbXmwHMI4vFE8q9
	 OiCwNyFZiIwGt211YsUirguF2WYHc0n7qVLfydSRisg1vsIENQmRU5sNeHlBkWg2X6
	 boT5bf8k5CSTQIQqX99uqvexvMmap6nQVi8qdsloo9afoa2C99WSfzQFRA7e7VON03
	 A5Jl1y6Q0BqnWGkJMbmGcJ99RzcFbojNzykJ6tf2KBnlQ2eWBcAGNe79laPQ7mdX3S
	 nr1V/mKPBZXumk7K4SPNyLpXm33p3Fbe6QtngW7xfbEy8vLqzRtzUMY+9rPVX24GD0
	 u6MCVVp5Qqfag==
Date: Mon, 25 Mar 2024 19:19:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf,riscv: Implement bpf_addr_space_cast
 instruction
Message-ID: <20240325-perpetual-liking-25f26e485b65@spud>
References: <20240325155434.65589-1-puranjay12@gmail.com>
 <20240325155434.65589-3-puranjay12@gmail.com>
 <20240325-nineteen-unvaried-cb5cb5fd3a73@spud>
 <CANk7y0gWtwN7EJ24aoY9-RB9629d5Ks-9fMc3wnAAjjERcZhFw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANk7y0gWtwN7EJ24aoY9-RB9629d5Ks-9fMc3wnAAjjERcZhFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_121930_033037_DCAEF364 
X-CRM114-Status: GOOD (  19.64  )
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
Content-Type: multipart/mixed; boundary="===============4175931927003035464=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4175931927003035464==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PLxoKXZPHO6ffd6M"
Content-Disposition: inline


--PLxoKXZPHO6ffd6M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 08:13:10PM +0100, Puranjay Mohan wrote:
> On Mon, Mar 25, 2024 at 8:10=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Mar 25, 2024 at 03:54:34PM +0000, Puranjay Mohan wrote:
> > > LLVM generates bpf_addr_space_cast instruction while translating
> > > pointers between native (zero) address space and
> > > __attribute__((address_space(N))). The addr_space=3D0 is reserved as
> > > bpf_arena address space.
> > >
> > > rY =3D addr_space_cast(rX, 0, 1) is processed by the verifier and
> > > converted to normal 32-bit move: wX =3D wY
> > >
> > > rY =3D addr_space_cast(rX, 1, 0) has to be converted by JIT.
> > >
> > > Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> >
> > Doesn't compile for allmodconfig:
> >   ../arch/riscv/net/bpf_jit_comp64.c:1086:7: error: call to undeclared =
function 'insn_is_cast_user'; ISO C99 and later do not support implicit fun=
ction declarations [-Wimplicit-function-declaration]
> >
> > Cheers,
> > Conor.
>=20
> Yes,
> I mentioned in the cover letter that a patch is required.
> It just got merged in bpf-next/master:
> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?=
id=3D770546ae9f4c1ae1ebcaf0874f0dd9631d77ec97
>=20
> So, rebasing on the latest bpf-next/master should fix the issue.

Ah, I see now that there was a mention in the cover letter that I did
not see first time around.

Bjorn, do you think there's anything we can do about these kinda
misleading CI failures for bpf stuff? Some stuff that touches bpf
definitely is worth us building, but should we try and build it on top
of the bpf tree instead?

--PLxoKXZPHO6ffd6M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgHOOgAKCRB4tDGHoIJi
0t9oAQClrCCsg/y60Dzf2CGlzqqLxZlv5uLEMxOHA+AgGxIQiAD/bo+9Ay8m4QJy
igs4VljEQzP535ZsiOlBcFy7XOh6nAc=
=InP6
-----END PGP SIGNATURE-----

--PLxoKXZPHO6ffd6M--


--===============4175931927003035464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4175931927003035464==--

