Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F8DCD54BC
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 11:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/O8Qa6NtToUx0+a9yO2O8OW6Ygx5nafsEmm+rCyXuIU=; b=kDVY2Xj7EvRJsEY2rFJxtJaLHo
	7yKQWC1wJELNoQYVk4YVwBh5mO58KzMLVfVK6SL4oKLnz72rwPdJv3sn6TJbPtvLYleF4/Hv2pv+b
	4WjL4EscW96nNpuc6ug0BcE2G99dRZoYlyCUn7unrArAxV+5tCVmMNg6fNXK5vgOba369rLwxpaQU
	C6IxxQzV25uT7tpUxeBvTbMB3vCl55Dm1FUEJ2cbDl28CsIYMsSGIWuOR25Fs+NF24xyxAXzlsa74
	R1YsH5ulvY8MGBeE5xrbynfZridRFSykE7Iyy0ycANOdl6zojBMHWzFzoEooLhRzSCnVhtWZAN8Q0
	AdqHZPQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZFp-000Kps-0B;
	Tue, 19 Sep 2023 11:50:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZFl-000KpC-1U
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 11:50:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 48D01CE1252;
	Tue, 19 Sep 2023 11:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDE5C433C8;
	Tue, 19 Sep 2023 11:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695124249;
	bh=9DucqhPLC8iD8mKt/UY5nRsFVFCE4cN3x0qFqAkFRdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0iuhkrNQTG8uLwqcqT0nDVxAg2xxiPBXj2MBJQ8uykOEz7d2GqljLc5NeiQCWpOk
	 iMU4dedJY5/1aJPwIP8xbCZwl+lfuRGbcqdMEQp2rkqs3cA+1KPHdebD5llnHxhj/H
	 5PipQbUhbWIPYEq1mVsITRvPNQMQ4eH0phahrl5on/8VKFLjKEc6+k07Bc0bAyt6kb
	 XyHXlKde1ZkBflGzOi5VCSK2p2s3lPo27BIzhzOPe4x16v4KnRjtYkRjE3lQe023U5
	 FGBHfq79gc/sP9M2TVYkaNBT21gHnmI3DMNVQ7PEnoGee1OUsES+uzhfrkMVk7s/gz
	 Hz8fH/TfC/YLg==
Date: Tue, 19 Sep 2023 12:50:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Pu Lehui <pulehui@huawei.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
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
	Luke Nelson <luke.r.nels@gmail.com>
Subject: Re: [PATCH bpf-next 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
Message-ID: <20230919-5f1894d892685612395aabaf@fedora>
References: <20230919035711.3297256-1-pulehui@huaweicloud.com>
 <20230919035711.3297256-5-pulehui@huaweicloud.com>
 <20230919-4734211982e4e411a93650a7@fedora>
 <8ebbd85d-857a-432b-be56-1f8f425b979d@huawei.com>
MIME-Version: 1.0
In-Reply-To: <8ebbd85d-857a-432b-be56-1f8f425b979d@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_045053_888260_7B6F84DE 
X-CRM114-Status: GOOD (  22.83  )
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
Content-Type: multipart/mixed; boundary="===============0993657169288118064=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0993657169288118064==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7aGyZq91J3TAjZi+"
Content-Disposition: inline


--7aGyZq91J3TAjZi+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 07:23:07PM +0800, Pu Lehui wrote:
>=20
>=20
> On 2023/9/19 18:04, Conor Dooley wrote:
> > On Tue, Sep 19, 2023 at 11:57:11AM +0800, Pu Lehui wrote:
> > > From: Pu Lehui <pulehui@huawei.com>
> > >=20
> > > In the current RV64 JIT, if we just don't initialize the TCC in subpr=
og,
> > > the TCC can be propagated from the parent process to the subprocess, =
but
> > > the TCC of the parent process cannot be restored when the subprocess
> > > exits. Since the RV64 TCC is initialized before saving the callee sav=
ed
> > > registers into the stack, we cannot use the callee saved register to
> > > pass the TCC, otherwise the original value of the callee saved regist=
er
> > > will be destroyed. So we implemented mixing bpf2bpf and tailcalls
> > > similar to x86_64, i.e. using a non-callee saved register to transfer
> > > the TCC between functions, and saving that register to the stack to
> > > protect the TCC value. At the same time, we also consider the scenario
> > > of mixing trampoline.
> > >=20
> > > Tests test_bpf.ko and test_verifier have passed, as well as the relat=
ive
> > > testcases of test_progs*.
> > >=20
> > > Signed-off-by: Pu Lehui <pulehui@huawei.com>
> >=20
> > Breaks the build:
> > ../arch/riscv/net/bpf_jit_comp64.c:846:14: error: use of undeclared ide=
ntifier 'BPF_TRAMP_F_TAIL_CALL_CTX'
> >=20
>=20
> Hi Conor,
>=20
> BPF_TRAMP_F_TAIL_CALL_CTX rely on commit [0], and it has been merged into
> bpf-next tree.

I see. I did check the cover to see if there was anything relevant
there, like a link or base commit, but since there were neither I opted
to pass on the warning from the patchwork automation we have :)

Thanks & sorry for the noise on this one.

Thanks,
Conor.

--7aGyZq91J3TAjZi+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQmLAgAKCRB4tDGHoIJi
0lhqAQCq1PZp2coB5qmzqa14vKJ4qyIbOxQvaXzCKk9mHyZECwD9E0i6/Nqg+6SZ
3xhMyPJa3N1LGnQPDMrfPnKQErAgoAk=
=w3wa
-----END PGP SIGNATURE-----

--7aGyZq91J3TAjZi+--


--===============0993657169288118064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0993657169288118064==--

