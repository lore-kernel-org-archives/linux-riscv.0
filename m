Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2509EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 18:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WTC4DDYku8CMgDh80C+EVcEpMU7FQ+W0AsF2IRYdSw=; b=TW0RBYrzVmYrsiaTksL6Evm64S
	dcX/2F0KKnk688RlA0dQ6A+wSkDpWfHGOa7jdtxoaQ1MahMJzpMbYsY1NBwBRL/K58G1j3qtwLzcl
	Z8yEXmn+gWknvvM4pE58fvhY5HkbSX9IAURn04/IUqs1A/vjy6wlJ+NUN8sAXueHCrRpnRsnbZ4IF
	B7swOlJK7JEp2GoigvK+tETdpK5W0CObQein+QWVX2JiGDRQDqj1r5rw8tEkd5zEyUHr2BISCSdpp
	oPnVuc5DAR1KiTPOUxTycTzKPxoyEkdTxCzMATLUKQVZl2UZoZ58UKoOs6oayWoPTNdSn6M5YhbfT
	XBKrTiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFJAU-004LGc-39;
	Fri, 30 Jun 2023 18:48:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFJAT-004LFx-0P
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 18:48:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6EC4E617E8;
	Fri, 30 Jun 2023 18:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FB7C433C0;
	Fri, 30 Jun 2023 18:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688150907;
	bh=iuRNxaXfE0hUWrCc8jY/81IkxCwuytrd8/XvpwaVu6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DSJFSftluH4KmiUDWiOewcAUukuOlg3ZaBy+fEu+ERsPmoQ7HwqsUuuYQQwtrpEfM
	 9xoYylr1alx5yEcQuEZngcKqPOqjGb4mua0CpzzQWdPjrr/v91o73OyG1ekO+hdltO
	 34WfGqdxbR910l37Q6oOCToZ/ZZc8fNok8+IO0nyb4YKQpourdOpRjC7ub6bKSOqoA
	 ixYRE2FEuj1RhDEjkuqZrLvFe+A70VijEZ1QmbBx7p3BCAScW4avRblxU+WJTL5+mU
	 Hi3HWMB8eypHeo3RIa22CYfgABMW1+TDKl1nNAAFPa0CzWJYCO2DNBHknVOyD+y090
	 ycA9304ka+mMA==
Date: Fri, 30 Jun 2023 19:48:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] riscv: KCFI support
Message-ID: <20230630-phrasing-strung-12e53988ad81@spud>
References: <20230629234244.1752366-8-samitolvanen@google.com>
MIME-Version: 1.0
In-Reply-To: <20230629234244.1752366-8-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_114829_210428_1A6141E7 
X-CRM114-Status: GOOD (  12.44  )
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
Content-Type: multipart/mixed; boundary="===============1526508021430402938=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1526508021430402938==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KeUX9Ea1q/FPEBvY"
Content-Disposition: inline


--KeUX9Ea1q/FPEBvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Sami,

On Thu, Jun 29, 2023 at 11:42:45PM +0000, Sami Tolvanen wrote:
> This series adds KCFI support for RISC-V. KCFI is a fine-grained
> forward-edge control-flow integrity scheme supported in Clang >=16,
> which ensures indirect calls in instrumented code can only branch to
> functions whose type matches the function pointer type, thus making
> code reuse attacks more difficult.

> base-commit: c6b0271053e7a5ae57511363213777f706b60489

Could you please rebase this on top of v6.5-rc1 when that comes out?
This base-commit is some random commit from Linus' tree, that because we
are currently in the merge window has is not in the RISC-V trees yet,
and means the series wasn't applied by our CI stuff.

Cheers,
Conor.

--KeUX9Ea1q/FPEBvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8jdwAKCRB4tDGHoIJi
0nEcAP0SWfLV19tIw/6zGm0BC+jgnl2WaOsvVsv9zVtGh5HT+wD/bgxhWiw2uj+3
wv6NCmZKlo3MNdMi7qK+Q07sMmgBKwg=
=3kM+
-----END PGP SIGNATURE-----

--KeUX9Ea1q/FPEBvY--


--===============1526508021430402938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1526508021430402938==--

