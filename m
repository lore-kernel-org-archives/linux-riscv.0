Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5587BCD54B2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8R1XEQP2ga3DeQFFqGcPWnYO2kyMuF1c2Ubs4dzVpg=; b=rurfKpw0+JDhQ3BE+bUIzMCNYX
	/37JfaagLpcVhTWVnmKv47e1taeobiOek0A/DhxykAaXcdPdXcEAXcnQpkSIVLb9NGwqdUiqgRf5X
	3grCh217xSSjX6FbB3jiPoVbx7OTSWbRuikLudp8KwnjUgGSflCzzBZmSJ8304Q3nTJPU7vKUEjue
	h0gPmvveoTZ3FtkjdrhG7ZafocGYdeoK85KNY9u92GPlnuw/bPqJ0eqoJewfxgHa81+Zy0Wk0z5lU
	+ojicZDkW/dOpDipI3/Sapk9quBuUpNmCRITkpO9PsSzF8CCuNEYMAPkxNsr/aZMq9MwO/j5GiNzC
	WzuVRbow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYNr-000AAS-35;
	Tue, 19 Sep 2023 10:55:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYNo-000A7Q-2y
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 10:55:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A1C99B80D59;
	Tue, 19 Sep 2023 10:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D83C433C7;
	Tue, 19 Sep 2023 10:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695120906;
	bh=V3ZHghel975D5l0+VfRYVx+f9dKKd19GO7h1PnigH6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iXyoWMRVMEaVJVETE7W9BtZHmxSBU4M0Fl6qfLNyihi2C/VFYAjyQx5NceCCbCNN/
	 eBEqNgprqxmdVALpr6EjUZNFB6Zwyg85yajFpbQDayd7CBg94T/Y3kRhzTWYLTfn+1
	 /30oOyFnh3/uNFxSs4JU190BE0+LIRYrw3xFIY6zazxG/b/9tp5TKFEOWLsvjvBEbl
	 uA7KwVB++mPWrz2h7G8MY9dVGTuj/HSiUMZqF1ylR7ogbcf/jY7ytOfXBnlILvVPlX
	 M1yOYpCnmgBi4uTgBjmbiLUGrvxan8PUyPD/rlen3aHYqR883iAb/kEJXHhpWV01Cw
	 /K5w/BB8qWHew==
Date: Tue, 19 Sep 2023 11:54:59 +0100
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
Message-ID: <20230919-aefdbac65c773c6f02aedc76@fedora>
References: <20230919035711.3297256-1-pulehui@huaweicloud.com>
 <20230919035711.3297256-5-pulehui@huaweicloud.com>
 <20230919-4734211982e4e411a93650a7@fedora>
MIME-Version: 1.0
In-Reply-To: <20230919-4734211982e4e411a93650a7@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_035509_229201_4A8A9C0D 
X-CRM114-Status: GOOD (  19.37  )
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
Content-Type: multipart/mixed; boundary="===============2027230655059921090=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2027230655059921090==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E3FHUvLAOD3DVxgx"
Content-Disposition: inline


--E3FHUvLAOD3DVxgx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 11:04:53AM +0100, Conor Dooley wrote:
> On Tue, Sep 19, 2023 at 11:57:11AM +0800, Pu Lehui wrote:
> > From: Pu Lehui <pulehui@huawei.com>
> >=20
> > In the current RV64 JIT, if we just don't initialize the TCC in subprog,
> > the TCC can be propagated from the parent process to the subprocess, but
> > the TCC of the parent process cannot be restored when the subprocess
> > exits. Since the RV64 TCC is initialized before saving the callee saved
> > registers into the stack, we cannot use the callee saved register to
> > pass the TCC, otherwise the original value of the callee saved register
> > will be destroyed. So we implemented mixing bpf2bpf and tailcalls
> > similar to x86_64, i.e. using a non-callee saved register to transfer
> > the TCC between functions, and saving that register to the stack to
> > protect the TCC value. At the same time, we also consider the scenario
> > of mixing trampoline.
> >=20
> > Tests test_bpf.ko and test_verifier have passed, as well as the relative
> > testcases of test_progs*.
> >=20
> > Signed-off-by: Pu Lehui <pulehui@huawei.com>
>=20
> Breaks the build:
> ../arch/riscv/net/bpf_jit_comp64.c:846:14: error: use of undeclared ident=
ifier 'BPF_TRAMP_F_TAIL_CALL_CTX'

Probably should have specified, happens with allmodconfig, but not a
defconfig build.

--E3FHUvLAOD3DVxgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQl9/wAKCRB4tDGHoIJi
0tdsAQDPI/EQR5MQMfoAj8x2c5mqHyZNWDP7jqGMh6TxQBL/hgEAqYPb11jtbyAE
ky8ikWGnxSfocMvRAPm7BMuQUAlvKQo=
=iBFw
-----END PGP SIGNATURE-----

--E3FHUvLAOD3DVxgx--


--===============2027230655059921090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2027230655059921090==--

