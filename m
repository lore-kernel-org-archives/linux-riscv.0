Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E510ECD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXaXX72omCSzR0fNAAEZ726zIcWgpZGHCWxGoDigfOM=; b=q0y/R40R7KWyd+3aEVjR0+74F4
	mCueOhMbWkdVqR3TfAEuJ+EkDI9r3DKZgGEsN6wGGEgIj1bPlP5G9i1cR2/N8PQaF2IOzrXk2RdGv
	gibAoskejSFWOUCXJmItrdTlS2Pxlo1lS9rOQZWSF0x/doFMXqWzxzr96MrN1DFRBE1ADBX5yb9jK
	6GCkKE5SvsOSMfFUE7t0CtUsQCyFlyCtuxAJc5LibVL1h+VXTh6lQI763UWfm3EcZkwr8nWZKgSzl
	8QB3vo6uEs820I/6C6FMIgtO/Xec0s5kJlAdv/+vQLrFtWX8MHzh4XbqrkOMD7/5U+gB2H13gw8WZ
	5SFl8z/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrzkg-0000000Fwwz-49OJ;
	Wed, 03 Apr 2024 12:30:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrzkd-0000000FwwJ-3qJZ
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 12:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 045F7CE29C9;
	Wed,  3 Apr 2024 12:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76B4C433C7;
	Wed,  3 Apr 2024 12:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712147395;
	bh=17nw4mBwdw7o/BMzv+AdA/BNvdIhvtEGu58LPXIywWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxDTG0Y0ZNLCTZsOVSyrxsIBoEhpVmvIMmny1/TM2qgOH0VUnoowjDsDOGICA1yDJ
	 vIxUahUjS5hea8LZwB7N5FHram9vFUY1yOw8WfIfDY3ZyUsSH+dfhuBSCE2BBTDRKK
	 NGfjCFkSaIXRNMGo09Wjp7bssxBcX9/R2tCyOO2IPgnDSY5BWibcVcd/HKiJuhvOA4
	 ZZig2iKJjHbD1PToatsm37Hphwp7ZpogsP0qbnjOixphkNOVc1xnNMGLBCCPUiyP3j
	 nJ47aCz+q6A4QxmnhxZHXLUghr/D6qNLW8vZmu7Gdv5lRESsRepHg61+99gv/OBWgN
	 Zx+NK3JJAdIog==
Date: Wed, 3 Apr 2024 13:29:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Stefan O'Rear <sorear@fastmail.com>, bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
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
Message-ID: <20240403-clanking-undress-b18346aa4cef@spud>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
 <20240328-ferocity-repose-c554f75a676c@spud>
 <ed3debc9-f2a9-41fb-9cf9-dc6419de5c01@huaweicloud.com>
 <87cyr7rgdn.fsf@all.your.base.are.belong.to.us>
 <20240402-ample-preview-c84edb69db1b@spud>
 <871q7nr3mq.fsf@all.your.base.are.belong.to.us>
 <20240403-gander-parting-a47c56401716@spud>
 <d6eae62b-60fd-4f3c-92e4-7ea5f1c4fc68@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <d6eae62b-60fd-4f3c-92e4-7ea5f1c4fc68@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_053000_153859_F0200730 
X-CRM114-Status: GOOD (  11.20  )
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
Content-Type: multipart/mixed; boundary="===============1718813723140701117=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1718813723140701117==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sTVykUQukqcz7+L4"
Content-Disposition: inline


--sTVykUQukqcz7+L4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2024 at 06:05:38PM +0800, Pu Lehui wrote:
> Hi Conor and Bj=C3=B6rn,
>=20
> Thanks for your explanation. I totally agree with what you said,
> "CONFIG_RISCV_ISA_ZBB only controls whether optimizations for Zbb are bui=
lt
> so that if Zbb is detected they can be used.".
>=20
> Since the instructions emited by bpf jit are in kernel space, they should
> indeed be aligned in this regard.
>=20
> PS: It's a bit difficult to understand this,=F0=9F=98=85 if I'm wrong ple=
ase don't
> hesitate to tell me.

I think your understanding is correct. Sorry if I confused you at all!

--sTVykUQukqcz7+L4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZg1LvQAKCRB4tDGHoIJi
0mlqAQCxxkdbSEap3IEfCOExj7NWGtaUdUrEOON0RDSxpdgCYQEAtp5IpMEHfa9u
V7IQVi50lwcIe+Z0M4FzSa+afLjRWgI=
=AuOI
-----END PGP SIGNATURE-----

--sTVykUQukqcz7+L4--


--===============1718813723140701117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1718813723140701117==--

