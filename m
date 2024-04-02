Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFA5CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 17:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5s6qtcRdGI2dmK9MpjU5r6KfJX45wCovTEVxsPTcVXQ=; b=kzFud0Te3YSD5XjynytPIVTezF
	cr70np/uKY1BBRHrToNA3YphJyQ45mAhAqZAgVYMeA2UlieCrhDqjc3MML9UdwJ/8ttP3aSzlfKsG
	o7o1xMNzWH1tgrWu4gE00oBLxd47xV4DNr7xSKD+GfsJFilqIBI7iSG9OKs/gHGOy7NbFKBYRcdQl
	ybEjYUTcDJmd4SbOtEYUEUZudWb7sHtdYwyi6xqvln5F+12cKZesAuILPUK5Ack1OSsdIaYpruuzz
	6gz+Yf8oCakIzd3reKzFXaL5m4RQdQJoEAN1JCOTOSmXzFI3pCVG9Qhsn0/YQ2+e2dyUXjscH5/dh
	pa6gPK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rri6M-0000000CE6r-4AOq;
	Tue, 02 Apr 2024 17:39:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rri6H-0000000CE5d-0neV
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 17:39:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 580BDCE1D63;
	Tue,  2 Apr 2024 17:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4EFC433F1;
	Tue,  2 Apr 2024 17:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712079545;
	bh=iuUzdNaQSKYbJhisLenP0E9J+WcZmYbuya8DASpXt2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKVKUlw15t7FfFKLMMtxwRqwjPeFGT36YApX7IhVNk3b/q3ijsFahhBFtlje5u+No
	 l2/U9B75nnNLyZ6U2sHgLyfwP69C7AnTfc2nvctjtN0kQfvXwG6zH27EKxgph1JuUV
	 1lNGWeIaZ+PYxIDuAVSoSbGen5qcTP889I6D7552on12CgDSmX90EcD3o//b8ngv3l
	 PmqNUInpu6ypYoHSUx5klqlwCUXyyRfEY6ttbU0SxI5lFnhCJ5svNDwU147MfiOXqV
	 tcyuQdf+U/buPHlFGCD28ZWYSfgcpozRWVFkGuQ7gRsVE/H0BVKmmsPXrryHBBEaTb
	 IwMWaZypB+Snw==
Date: Tue, 2 Apr 2024 18:38:59 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Pu Lehui <pulehui@huaweicloud.com>, Stefan O'Rear <sorear@fastmail.com>,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Manu Bretelle <chantr4@gmail.com>,
	Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
Message-ID: <20240402-ample-preview-c84edb69db1b@spud>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
 <20240328-ferocity-repose-c554f75a676c@spud>
 <ed3debc9-f2a9-41fb-9cf9-dc6419de5c01@huaweicloud.com>
 <87cyr7rgdn.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
In-Reply-To: <87cyr7rgdn.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_103909_607544_C0EC6719 
X-CRM114-Status: GOOD (  28.14  )
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
Content-Type: multipart/mixed; boundary="===============4514414584345950637=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4514414584345950637==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rDUw0N+1zEfzL5kD"
Content-Disposition: inline


--rDUw0N+1zEfzL5kD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2024 at 04:25:24PM +0200, Bj=F6rn T=F6pel wrote:
> Pu Lehui <pulehui@huaweicloud.com> writes:
>=20
> > On 2024/3/29 6:07, Conor Dooley wrote:
> >> On Thu, Mar 28, 2024 at 03:34:31PM -0400, Stefan O'Rear wrote:
> >>> On Thu, Mar 28, 2024, at 8:49 AM, Pu Lehui wrote:
> >>>> From: Pu Lehui <pulehui@huawei.com>
> >>>>
> >>>> This patch relaxes the restrictions on the Zbb instructions. The har=
dware
> >>>> is capable of recognizing the Zbb instructions independently, elimin=
ating
> >>>> the need for reliance on kernel compile configurations.
> >>>
> >>> This doesn't make sense to me.
> >>=20
> >> It doesn't make sense to me either. Of course the hardware's capability
> >> to understand an instruction is independent of whether or not a
> >> toolchain is capable of actually emitting the instruction.
> >>=20
> >>> RISCV_ISA_ZBB is defined as:
> >>>
> >>>             Adds support to dynamically detect the presence of the ZBB
> >>>             extension (basic bit manipulation) and enable its usage.
> >>>
> >>> In other words, RISCV_ISA_ZBB=3Dn should disable everything that atte=
mpts
> >>> to detect Zbb at runtime. It is mostly relevant for code size reducti=
on,
> >>> which is relevant for BPF since if RISCV_ISA_ZBB=3Dn all rvzbb_enable=
d()
> >>> checks can be constant-folded.
> >
> > Thanks for review. My initial thought was the same as yours, but after=
=20
> > discussions [0] and test verifications, the hardware can indeed=20
> > recognize the zbb instruction even if the kernel has not enabled=20
> > CONFIG_RISCV_ISA_ZBB. As Conor mentioned, we are just acting as a JIT t=
o=20
> > emit zbb instruction here. Maybe is_hw_zbb_capable() will be better?
>=20
> I still think Lehui's patch is correct; Building a kernel that can boot
> on multiple platforms (w/ or w/o Zbb support) and not having Zbb insn in
> the kernel proper, and iff Zbb is available at run-time the BPF JIT will
> emit Zbb.

This sentence is -ENOPARSE to me, did you accidentally omit some words?
Additionally he config option has nothing to do with building kernels that
boot on multiple platforms, it only controls whether optimisations for Zbb
are built so that if Zbb is detected they can be used.

> For these kind of optimizations, (IMO) it's better to let the BPF JIT
> decide at run-time.

Why is bpf a different case to any other user in this regard?
I think that the commit message is misleading and needs to be changed,
because the point "the hardware is capable of recognising the Zbb
instructions independently..." is completely unrelated to the purpose
of the config option. Of course the hardware understanding the option
has nothing to do with kernel configuration. The commit message needs to
explain why bpf is a special case and is exempt from an=20

I totally understand any point about bpf being different in terms of
needing toolchain support, but IIRC it was I who pointed out up-thread.
The part of the conversation that you're replying to here is about the
semantics of the Kconfig option and the original patch never mentioned
trying to avoid a dependency on toolchains at all, just kernel
configurations. The toolchain requirements I don't think are even super
hard to fulfill either - the last 3 versions of ld and lld all meet the
criteria.


--rDUw0N+1zEfzL5kD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgxCswAKCRB4tDGHoIJi
0mUNAP4xNbI++bzEaHK6ZDR1lMX+P5ARgZL9DZ1skHQEVLlnYAD9GL99/nj02IYH
DN80f4mQlfeKWfcBAemilpEjnr5KugQ=
=6qti
-----END PGP SIGNATURE-----

--rDUw0N+1zEfzL5kD--


--===============4514414584345950637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4514414584345950637==--

