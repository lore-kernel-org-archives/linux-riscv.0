Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D38ACD54A9
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 10:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2V2iolFEa7/QMTB+o69RgbZx4Ur9OYP4JeOYmXW3W2k=; b=PU63SVrtCyrdUbDNaQnOwAuCCM
	7vwwf61ZwK3jerjJGF1uM/3txlwBzrOxJOeDmoyUZ3VYkOPDbn5BgAp45+8qxHvk0A0i/77A8G+lu
	kpYpD2d6OtBt0nbNYniXOdVeXYlqlavT4TltiZ+GlggXpPt1Q1SfJCtDh/h1NXJ3vay5wch5eioX5
	D+P7kNkmVsZ6LpQL7vJeD/DCY04H810mygTAcojfBstRnnIQLTNGYvh3l/U70hPmB5o8y6ow6wMoe
	iT399GDZ75AwX/7VCStUatgwlNSV8doxWpdi8Bz7R5cUXB1QXojQXfvdDisB1w/g4ScEzPWQfVyn9
	rT6sTWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXbQ-00HaCL-30;
	Tue, 19 Sep 2023 10:05:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXbO-00HaBg-0q
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 10:05:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C9FE5CE12B1;
	Tue, 19 Sep 2023 10:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64294C433C7;
	Tue, 19 Sep 2023 10:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695117900;
	bh=UWm/jZ0BpAK791nEkanovA5cdga8NxQpAaGrGnuJ0tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwgAzIpwo9U7itbW+rxsSq6V6Qx5nb30gUuDuFgF+TQSRy9mFzkDDBG/ni+kt9HtR
	 XbapZhf4IS4n05WwagOY1/jPCaDPhix5Y8MsGfYCnBDPG1bBFj0S+IhS2OHVXx9Rvn
	 v7Gdf1qdNk+HAR/g4sEmBBAXG1gCDBqo00rPRCXRL7hOhXXv0tTUK2as/lWdXmrE6C
	 Fvxcfk3ApBKKhWdNOLtpgj9uuyfBmgfcKvpuo9yzX8DvcieMZXKcZdm+R3h6NVIX24
	 hjPlouJKkO6+oUB7FIS9gOJ/KKy57/BVGNzBcib8POQOl9VB36614l3nB2EBPZxv+4
	 7brJJWtXYaNNg==
Date: Tue, 19 Sep 2023 11:04:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
Message-ID: <20230919-4734211982e4e411a93650a7@fedora>
References: <20230919035711.3297256-1-pulehui@huaweicloud.com>
 <20230919035711.3297256-5-pulehui@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <20230919035711.3297256-5-pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_030506_496448_A220AF24 
X-CRM114-Status: GOOD (  16.05  )
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
Content-Type: multipart/mixed; boundary="===============4003139219485502814=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4003139219485502814==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ATOEW6o/+/ySUOUC"
Content-Disposition: inline


--ATOEW6o/+/ySUOUC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 11:57:11AM +0800, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
>=20
> In the current RV64 JIT, if we just don't initialize the TCC in subprog,
> the TCC can be propagated from the parent process to the subprocess, but
> the TCC of the parent process cannot be restored when the subprocess
> exits. Since the RV64 TCC is initialized before saving the callee saved
> registers into the stack, we cannot use the callee saved register to
> pass the TCC, otherwise the original value of the callee saved register
> will be destroyed. So we implemented mixing bpf2bpf and tailcalls
> similar to x86_64, i.e. using a non-callee saved register to transfer
> the TCC between functions, and saving that register to the stack to
> protect the TCC value. At the same time, we also consider the scenario
> of mixing trampoline.
>=20
> Tests test_bpf.ko and test_verifier have passed, as well as the relative
> testcases of test_progs*.
>=20
> Signed-off-by: Pu Lehui <pulehui@huawei.com>

Breaks the build:
=2E./arch/riscv/net/bpf_jit_comp64.c:846:14: error: use of undeclared ident=
ifier 'BPF_TRAMP_F_TAIL_CALL_CTX'

Thanks,
Conor.

--ATOEW6o/+/ySUOUC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQlyOAAKCRB4tDGHoIJi
0r/rAP0RRG8B+qpWNcU7qcE9Ft11M7jGHMnDR1qMquQuiP7XvgEA+UKszKDvr0or
aj3aTNgx/eXSCPPE7ouXf4b6WzNODwI=
=jgUK
-----END PGP SIGNATURE-----

--ATOEW6o/+/ySUOUC--


--===============4003139219485502814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4003139219485502814==--

