Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEE5C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 19:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5Ps3J0b4JsZhS50BTTSBAMhw2FvfoYhhPw8fJbTF7s=; b=sibuPm5FKf6e6siF6zN3L7KDK+
	WuAdwyJK23jBEASJ9INhga5yE7mNExvHUwSSFOjq4VwL5c9idFQbZvy/lR/ZAew4GAOi37oi7xh9b
	naxke7H0r0FB/I/ppwSODqo0FNfsjks15IiPis6nIhvru+SLbI8iuBkw4kVOHVBjDHYmMU5W6VtkH
	hvKHmxUJKJ3M0YHjlwEQ0GkwrKdzxp/nAQrUXlfGnKr6GDbi89QbsX8ic5SaV6SO+Ev9+9SxExL4m
	MbEMu+0ZkOwUhen5FWeOR3EM3ZA6yc5xUW5AO2qrQWh2zr2RRvoqkxR3LTuPCI2anc1Erqhk0UM4I
	T9PL/EFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropiW-00000001WTX-0GDA;
	Mon, 25 Mar 2024 19:10:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropiT-00000001WT7-1XOc
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 19:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87D3B61136;
	Mon, 25 Mar 2024 19:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B6AC433C7;
	Mon, 25 Mar 2024 19:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711393840;
	bh=YM908c+j5fTB0+d8tviHlAjBkwLbRaCWKwimpN6KDuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XTqfAjRA00stt7hYeZ5sCjX5qkPjrMqAXOXztdxABRY1gZpyvo+FHTcTXgICgk7uB
	 3sydLdwkOWIa+HbviwUTgMhry2H1+ktxDgLE1Ao+ap00TsgprTfp2R6zhP1MBL5hIW
	 ln5naleeG6L4zUc8mdmgfp50zzgF0DR+yJ3xcW/Fg13+OGyhgOInbf1e8ZI4YwLtMW
	 QyTLmEI0N2g9uZfiXE5RTSsNQKbv4uWLdS6QrTEqlcJaqzZeDkz1wlDukTaNlkF4hS
	 ZaaMNesACzyZyxEouqRtMzSh2nAKUB6YyAYmydAWR4itmNRbOdf7C57uUF0ia/Ue5T
	 +UGg/ucn825vQ==
Date: Mon, 25 Mar 2024 19:10:33 +0000
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
Message-ID: <20240325-nineteen-unvaried-cb5cb5fd3a73@spud>
References: <20240325155434.65589-1-puranjay12@gmail.com>
 <20240325155434.65589-3-puranjay12@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240325155434.65589-3-puranjay12@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_121041_472909_FA3A7269 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7585042797084941650=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7585042797084941650==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="71chSDPH9+bsHkEY"
Content-Disposition: inline


--71chSDPH9+bsHkEY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 03:54:34PM +0000, Puranjay Mohan wrote:
> LLVM generates bpf_addr_space_cast instruction while translating
> pointers between native (zero) address space and
> __attribute__((address_space(N))). The addr_space=3D0 is reserved as
> bpf_arena address space.
>=20
> rY =3D addr_space_cast(rX, 0, 1) is processed by the verifier and
> converted to normal 32-bit move: wX =3D wY
>=20
> rY =3D addr_space_cast(rX, 1, 0) has to be converted by JIT.
>=20
> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>

Doesn't compile for allmodconfig:
  ../arch/riscv/net/bpf_jit_comp64.c:1086:7: error: call to undeclared func=
tion 'insn_is_cast_user'; ISO C99 and later do not support implicit functio=
n declarations [-Wimplicit-function-declaration]

Cheers,
Conor.

--71chSDPH9+bsHkEY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgHMKQAKCRB4tDGHoIJi
0pNmAQDHYFRpN53l7wvgU0xtapilGEKe+kTzj3USSRCYuZ7l/wD+KKyZpPzhsx8y
1uaOjd8prQZDz9yE3MkMa+iuSm8fegU=
=yW/s
-----END PGP SIGNATURE-----

--71chSDPH9+bsHkEY--


--===============7585042797084941650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7585042797084941650==--

