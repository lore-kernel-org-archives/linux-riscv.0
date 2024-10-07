Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61D4CFB446
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 16:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZd3WEBtOyCPgtl+rtwT0eEORyzuzSqEhHvOnC8pvCk=; b=aTLFqNKYYxMfKXlHtVBp8OgfCX
	rFZJw4xhXKvriKcD2XyaVJjLdh0qF8eaETTegdB0019f+QskYL3X+C1veZFyUJV66jkFOQ8Q31enu
	lmsLHMpQUtDSV5B+X/G/rV2hccbf8ydoQgEismqIgTEhZe1MZusvS4iODYZESkrUJLT/rgy5knFn3
	rpkQ/hlgF807BpXRxfLP7LA7FdAN7JvzQYwn2krl01C9tYeZQtWcVCn6y+QRrQ/NZAQZuFWguguQ5
	ImBMHmXplRTfYQGEJ+wv8RZ/G++K5dPBdTi5XLWGIMGd2KsE9ucdFqVtknz49zYxKkQsQfC11d0wz
	teBMVLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqUX-000000038UT-1SOH;
	Mon, 07 Oct 2024 16:21:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqUU-000000038Tn-0wVk
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 16:21:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6962C5C5CD8;
	Mon,  7 Oct 2024 16:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E6DC4CEC6;
	Mon,  7 Oct 2024 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728318105;
	bh=PoWOtQj6nr9yo/vCoJ1K+oh816ywT+jG0OzA4+bxEvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4c60YB/3QXa3mURnfXL8Ghv/b6KAgZmA2FrqRnKW8h4XQIysndHls9cl89GK2UJI
	 +fQF0ig4Jt+4Sg4XSbRrhyMD5Nj7fao2ipJT0Lp3bray3rnjJrNJ9igw3z2QAT8ney
	 IXB1ExI6sxdOlBNw8FCufB+FiriiVxjDRSwYHUXAaldJYU/qsbwvGNIE0BmPlgTOHP
	 dgi8ggs14XXIpDtt0iJ9NwbgHRippzrwajCbBQapPZTWB2kgrJ0LzxnAJfZ2aneBgn
	 cWtYSj+8EuxHwY1lBTENiwUfvmhuCjvK881WNPTnnUoBfxQY+iU0/rtQZocWA5kjNx
	 Jto0n4hRkqxww==
Date: Mon, 7 Oct 2024 17:20:21 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH v2] selftests: sched_ext: Add sched_ext as proper
 selftest target
Message-ID: <ZwQKRe7iIzZjjEQd@finisterre.sirena.org.uk>
References: <20241007073133.989166-1-bjorn@kernel.org>
 <ZwQBqlG6MShCkNrU@finisterre.sirena.org.uk>
 <87r08rnbra.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
In-Reply-To: <87r08rnbra.fsf@all.your.base.are.belong.to.us>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_092146_328549_BF70CCE6 
X-CRM114-Status: GOOD (  12.68  )
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
Content-Type: multipart/mixed; boundary="===============1218390533533645683=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1218390533533645683==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mdbUJb1cNu8O2f9z"
Content-Disposition: inline


--mdbUJb1cNu8O2f9z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2024 at 06:00:57PM +0200, Bj=F6rn T=F6pel wrote:
> Mark Brown <broonie@kernel.org> writes:
> > On Mon, Oct 07, 2024 at 09:31:32AM +0200, Bj=F6rn T=F6pel wrote:

> >   CLNG-BPF create_dsq.bpf.o
> > In file included from create_dsq.bpf.c:9:
> > /home/broonie/git/linux/tools/sched_ext/include/scx/common.bpf.h:33:17:=
 error: use of undeclared identifier 'SCX_DSQ_FLAG_BUILTIN'
> >    33 |         _Static_assert(SCX_DSQ_FLAG_BUILTIN,
> >       |                        ^

> This is most likely due to incorrect VMLINUX_BTF_PATHS, so that
> vmlinux.h is incorrectly generated. Try grepping for
> SCX_DSQ_FLAG_BUILTIN in vmlinux.h.

Yeah, it's not in the generated files:

broonie@finisterre:~/git/linux$ grep SCX_DSQ_FLAG_BUILTIN ./tools/testing/s=
elftests/sched_ext/build/include/vmlinux.h ./tools/testing/selftests/sched_=
ext/build/obj/bpftool/vmlinux.h
broonie@finisterre:~/git/linux$=20

I didn't actually build a kernel, if the build system needs a kernel
it's just silently not detected that it's missing?

--mdbUJb1cNu8O2f9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcECkUACgkQJNaLcl1U
h9BY3AgAhgSd/gtJOHhPdgDJdlWHAcccsg0/qZNJNyUwqLK62pnBWJtCXAN3P1ur
6wfsjd2wIRRomHekliWei8/9wsP3Ag+/uUSMbeczP7xDAouuwtPUZlDDjQq8hMrk
2bSTZmTIa2qpjrrfKJRLsX5RDGziW+Q6C3A4hSSa5+l2Ys1lU9Z4rr96eMzoDvTM
sAyppbbqUPHE59Wqn2L8vHA4qO9ODaYc+VmEZkZPOS661nN9pcImXFu9jd3sbquR
ZhCA5Jzmj83gP2U4rmSlhWna45c+io68Nd5Zf7ZrdFYceR5VFPkKWRry+a/N/bPg
JuUBz8uQVlPVg5VsbFNnqbcT+b+SGw==
=AxkR
-----END PGP SIGNATURE-----

--mdbUJb1cNu8O2f9z--


--===============1218390533533645683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1218390533533645683==--

