Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F98BC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJqfoid9RB/UmrpO7f/RvK9B4+3841oF3+5vKWr3h7I=; b=gDSpNM3qmRiZtp+/JoX0Se+WNh
	vrQeaCu3w7FKIJtSZFtKbQqa9pTU8nRaizsHRwcqx1swX/bZd2N1kMK20lRbiwGH/1dXY6goQc+gd
	rSObbqdAos2fofX7k8pzyCLDhDUy8Y/JiR9+90yZEHPQsrmhs1mB9FfzqC4LXhlf68J4lF8cY9bI9
	F2okppv8wrcQdj/Aip34FBgSGjmrBI/1xC3/A+mZx2nKS0QKhqMKCvc5fuW8d71RFCy0DvYd0ljGx
	jocK2Q6x9ZVoHGiX54F2BOe72PKH53DCDAUQxO4kiqK9nV09J0+HqmnmpGI2nV2Q2w7hA79HHJ5kC
	a7CxbKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roqB7-00000001dkK-3yCN;
	Mon, 25 Mar 2024 19:40:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roqB4-00000001diJ-3QsD
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 19:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 145BDCE1C9A;
	Mon, 25 Mar 2024 19:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24BBC433C7;
	Mon, 25 Mar 2024 19:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711395612;
	bh=g659JFfs5AjSVYM1zIakNFUS3zlJBueU+/TZUE+qaBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gaOY5sQX73xGJ1WwJdYEk9DzGrGd4x/nYC1/t4EYJ/STpKzpCksYM/pu8XPqFaHMG
	 X9luV4z5WbBHm0t9j/jSRQlGL0oxs7b0+v0pm5pDTNdHg9AzTsco1Tc5/dKP+LoiUk
	 nBjKbARri3NJm/sqdxCZwILmkeGpo+GKpSBmHX0LuWiF8QqnCL2rhEUenl6pdcjPt+
	 cFbkekoZ4bwMugXMO+Ou4F/r7WEefbp5iM6+tNxGWV1DbOAtkQxJ60rbLu22Fxs7WR
	 r69Gx4tdOEMFLGSaL6UApteTt2w0irHgqXZhX167LzUgYhysZoHonbKJkWAGRQQ/bn
	 4DZdBXR+atfBw==
Date: Mon, 25 Mar 2024 19:40:05 +0000
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
Message-ID: <20240325-creamed-unlovely-4c80082e9b8c@spud>
References: <20240325155434.65589-1-puranjay12@gmail.com>
 <20240325155434.65589-3-puranjay12@gmail.com>
 <20240325-nineteen-unvaried-cb5cb5fd3a73@spud>
 <CANk7y0gWtwN7EJ24aoY9-RB9629d5Ks-9fMc3wnAAjjERcZhFw@mail.gmail.com>
 <20240325-perpetual-liking-25f26e485b65@spud>
 <CANk7y0jtURUC6PWx5nSDigMpScUT+p3qd=hTtqJkCqAN+Nq32A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANk7y0jtURUC6PWx5nSDigMpScUT+p3qd=hTtqJkCqAN+Nq32A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_124015_257518_480E4F04 
X-CRM114-Status: GOOD (  25.69  )
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
Content-Type: multipart/mixed; boundary="===============5646787909324707990=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5646787909324707990==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f9ssCXyqoxZRmlTY"
Content-Disposition: inline


--f9ssCXyqoxZRmlTY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 08:23:18PM +0100, Puranjay Mohan wrote:
> On Mon, Mar 25, 2024 at 8:19=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Mar 25, 2024 at 08:13:10PM +0100, Puranjay Mohan wrote:
> > > On Mon, Mar 25, 2024 at 8:10=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > > >
> > > > On Mon, Mar 25, 2024 at 03:54:34PM +0000, Puranjay Mohan wrote:
> > > > > LLVM generates bpf_addr_space_cast instruction while translating
> > > > > pointers between native (zero) address space and
> > > > > __attribute__((address_space(N))). The addr_space=3D0 is reserved=
 as
> > > > > bpf_arena address space.
> > > > >
> > > > > rY =3D addr_space_cast(rX, 0, 1) is processed by the verifier and
> > > > > converted to normal 32-bit move: wX =3D wY
> > > > >
> > > > > rY =3D addr_space_cast(rX, 1, 0) has to be converted by JIT.
> > > > >
> > > > > Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> > > >
> > > > Doesn't compile for allmodconfig:
> > > >   ../arch/riscv/net/bpf_jit_comp64.c:1086:7: error: call to undecla=
red function 'insn_is_cast_user'; ISO C99 and later do not support implicit=
 function declarations [-Wimplicit-function-declaration]
> > > >
> > > > Cheers,
> > > > Conor.
> > >
> > > Yes,
> > > I mentioned in the cover letter that a patch is required.
> > > It just got merged in bpf-next/master:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/comm=
it/?id=3D770546ae9f4c1ae1ebcaf0874f0dd9631d77ec97
> > >
> > > So, rebasing on the latest bpf-next/master should fix the issue.
> >
> > Ah, I see now that there was a mention in the cover letter that I did
> > not see first time around.
> >
> > Bjorn, do you think there's anything we can do about these kinda
> > misleading CI failures for bpf stuff? Some stuff that touches bpf
> > definitely is worth us building, but should we try and build it on top
> > of the bpf tree instead?
>=20
> Is there a separate CI for RISCV related stuff? is it public?

It's based outta patchwork, just like the netdev/bpf stuff:
https://patchwork.kernel.org/project/linux-riscv/list/

> I would be interested in adding RISC-V support in
> https://github.com/kernel-patches/bpf
> Is someone already working on this?

If anyone is, it is probably something Bjorn knows about!

--f9ssCXyqoxZRmlTY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgHTFQAKCRB4tDGHoIJi
0kRtAP9o7BqT/u++er+Bnqqvg6xK9tBATuUjDpdT+rOwJ1PesgEAh1ycTqG5uqxR
xFOf+YAsdnGI0ZmRxmxH+/5isoHdjwg=
=shXF
-----END PGP SIGNATURE-----

--f9ssCXyqoxZRmlTY--


--===============5646787909324707990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5646787909324707990==--

