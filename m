Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52541CFB440
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 19:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zxDciFuaoAiA9HQnQqf79bv/VMCRlvx4B/cKtjGArk=; b=4Rd+wSpxMe6fQBvqUR56tS/g9l
	sGo4xleWyEFP3ljv8FmVRewUhG66VDDuna2WjfJfmhwLf6IQvIeI9tHxUuBpmSV91KEk7fUOkemAu
	sJrM/1hVD9f/NUi7mBclXpXnwgDQx+qLBcCnXE2Mr0qtBCoo8xF7wQE+ioSttcMtdIB6bUCL2flCM
	993FU+lPhestVlF1J4uYQpKPPk5/3bW3it6eD1Zd+drcSCrio2XXV6B8WNmHR+i8Xq6YxH6DbXFuo
	0LLvbPliQQuBGkYM41bZXj3Xy3iGC2SOL2dw/wpm+I278oDAlPFghyxk4Kc8XKxSUrHBcvkh9m+ri
	YtHJ1tGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtZL-00000003dhF-276F;
	Mon, 07 Oct 2024 19:38:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtXr-00000003dKg-1JGH
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 19:37:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 846D95C5DA5;
	Mon,  7 Oct 2024 19:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90FA7C4CEC7;
	Mon,  7 Oct 2024 19:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728329846;
	bh=A9OyLPY9DW1/5r91rpnNC1afVdx3Cj+2xoi5YvvORmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hHKuWIrtowbQC268R9KcD0OMgpg3cYrxT/I04IKLrYqWAYFIM9ZIwTKyvMrP2uvrZ
	 YH3EKYt0P/gky8Am8KlzevtFQ5zumLRqbzKWDMwXvE7ATGesnHEk0Po9+0CQG9qO/o
	 NTYvZmWNKfx7wZvGKtTK3D0Qm2PuoIfmfr1Q/NamQ1rrcxN+pot1JF3mrsPlVlxEWU
	 pfCROnB5pYyzBxZkkwyGDUQxU6FDR080EBi4pGqofS9tTSTaKFphR2r1SIZjQzpylX
	 9S9M3qxe32Jc/CLHGVoy1dljHTRA8SDb+jlfPJY2v2fzLLuyCs9MbTTwHIx4kYntYv
	 dXj7oJzXfPyGQ==
Date: Mon, 7 Oct 2024 20:37:21 +0100
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
Message-ID: <ZwQ4cTh85xuPuxnx@finisterre.sirena.org.uk>
References: <20241007073133.989166-1-bjorn@kernel.org>
 <ZwQBqlG6MShCkNrU@finisterre.sirena.org.uk>
 <87r08rnbra.fsf@all.your.base.are.belong.to.us>
 <ZwQKRe7iIzZjjEQd@finisterre.sirena.org.uk>
 <87msjfn9oz.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
In-Reply-To: <87msjfn9oz.fsf@all.your.base.are.belong.to.us>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_123727_417821_1942D0CB 
X-CRM114-Status: GOOD (  13.47  )
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
Content-Type: multipart/mixed; boundary="===============1494430813714478849=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1494430813714478849==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cswsmIXpifTmYM4u"
Content-Disposition: inline


--cswsmIXpifTmYM4u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2024 at 06:45:32PM +0200, Bj=F6rn T=F6pel wrote:
> Mark Brown <broonie@kernel.org> writes:

> > I didn't actually build a kernel, if the build system needs a kernel
> > it's just silently not detected that it's missing?

> It tries to find a kernel with BTF:
>   | VMLINUX_BTF_PATHS ?=3D $(if $(O),$(O)/vmlinux)                       =
             \
>   |                      $(if $(KBUILD_OUTPUT),$(KBUILD_OUTPUT)/vmlinux) =
           \
>   |                      ../../../../vmlinux                             =
           \
>   |                      /sys/kernel/btf/vmlinux                         =
           \
>   |                      /boot/vmlinux-$(shell uname -r)

> Similar to all the other selftests using BPF.

> (Oh, and at some point the BPF parts should be in lib.mk...)

Ah, that'll have found my host kernel.  There should probably be some
sort of check that it's at least targeting the correct architecture
since this *will* go wrong.

--cswsmIXpifTmYM4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcEOHAACgkQJNaLcl1U
h9AatQf/YyAIJ0omN6Wss/9SRbF4My0yTn3/KGAOgJpqptaAKcXqNdr6Pz5MEXJ2
uWV647EdwqUdo/yxeTgTwihqkXgjWyFIKIZf77E+05oCOedQNXuT9FaJN89SVopR
eMySUcORpVSGJnIWt8+ekFSZ5IY/Z72asITub3gS2lv5sRrGfZH6PfNdmU0EXeJD
29nEKx9j3RPMYlXab0kZXiyCdOFeUVlas+7HB/HNCrilUlwywpbzB6SU5ZC5cltv
NwLSqbzkCzUQ7ezkmNFQ0FelOQqoPjwnE2hg+1HzzNmZvaOXI6u9eYyv8Jb4Kpnj
NwIrH8Nub6PsrcUiIrKKemQ2EKZZQA==
=8Upo
-----END PGP SIGNATURE-----

--cswsmIXpifTmYM4u--


--===============1494430813714478849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1494430813714478849==--

