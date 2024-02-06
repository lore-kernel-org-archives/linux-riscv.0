Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7215C4828D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4QXnST62HngeZSKhLkSBilpNyPC3hYWoHlYBfuIQ30=; b=VtwmDS1eKgS4/Ye9VLsJF/5A5A
	N5txRs9JWGxPRH+vqfioJzWqAl9HfJyLQbwhBBjPDD7x0cmItakmZV7mwtNV1Vr9l9FdE6rKUpPe5
	CVPKh+MzRcfHtdfmnX46SOUiOxugMkVZZKMvZdzMXsfPuWfvxVetqLmOi5SLK0Q0Anyrz+pOnhxDD
	14HS1xp47puMj7op0zThZBTzYvcEW7n8M6nZlegxohAWcejB6LdPWCRRWqvXPZ7olDoc6PnRX9tb3
	L7C69wSVlcMrnIDzyJStNDqSZ9Uz7qZ+tXmV3LB2ENgBYNLaj6hIJ7mp0xl1FuaoURy9i+r8Hef+t
	IqtFVpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXO56-00000008DgH-1qWa;
	Tue, 06 Feb 2024 16:13:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXO4v-00000008Dck-3AW8
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 16:13:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9302BCE131A;
	Tue,  6 Feb 2024 16:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040C0C433C7;
	Tue,  6 Feb 2024 16:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707236022;
	bh=c1sZ3YqjwLgIe/oUDK6sgpcyFQmmz43JxRT/kHAfLYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlUHOAEnInU30oik5DPIGz6JgFHROuPeLJgpWMoanTiX/F9nJO8S6FQIWlQdpV0Jl
	 +EDIKyTlUw2s35GBSvpYxBobPHMvDS0SlVxFSuBwIkCBsugAp3Y1sJefh6tdx+iDj+
	 tieTWeVky5DPpTbCSVwM50ryLecIJm9jwCPPqQaursXXSEY7yGrP4HcFTkWBJtU3T3
	 jW3naVUxR/lmiDVmyIxj7vLdUmdr0LLkzV0Z2/kZzNvqJ3+fm8i67rUkr8dMc9363H
	 b6yV6+Swl4GpQUrVE1WOXEv91PrYQ6HbM4uAM0BNakq8Y//7aYn93KhFdff3kU5zjE
	 vPE2F67S+zRnQ==
Date: Tue, 6 Feb 2024 16:13:39 +0000
From: Mark Brown <broonie@kernel.org>
To: debug@rivosinc.com
Cc: rick.p.edgecombe@intel.com, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 18/28] prctl: arch-agnostic prtcl for indirect
 branch tracking
Message-ID: <ZcJas4tZNzOJv6hW@finisterre.sirena.org.uk>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-19-debug@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240125062739.1339782-19-debug@rivosinc.com>
X-Cookie: You might have mail.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_081353_296200_48A71B8C 
X-CRM114-Status: UNSURE (   8.99  )
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
Content-Type: multipart/mixed; boundary="===============6790249203340755474=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6790249203340755474==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IzS+gDfE7WAJn9u1"
Content-Disposition: inline


--IzS+gDfE7WAJn9u1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 24, 2024 at 10:21:43PM -0800, debug@rivosinc.com wrote:

> To allow userspace to enable this feature for itself, following prtcls are
> defined:
>  - PR_GET_INDIR_BR_LP_STATUS: Gets current configured status for indirect branch
>    tracking.
>  - PR_SET_INDIR_BR_LP_STATUS: Sets a configuration for indirect branch tracking
>    Following status options are allowed
>            - PR_INDIR_BR_LP_ENABLE: Enables indirect branch tracking on user
>              thread.
>            - PR_INDIR_BR_LP_DISABLE; Disables indirect branch tracking on user
>              thread.
>  - PR_LOCK_INDIR_BR_LP_STATUS: Locks configured status for indirect branch
>    tracking for user thread.

FWIW the arm64 BTI feature is enabled per page of executable memory
rather than in CPU state so it'd be hard for us to adopt this interface.
I don't think that's a blocker, just noting it.

--IzS+gDfE7WAJn9u1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXCWrIACgkQJNaLcl1U
h9CqHAf/YTvIwiIOAvwQ9XqrETCEC8PE7wl9yNsGNfr06ERBrjw436apeNtLMOPF
3FujoE4HG2IAw0iXzAKOJAQhYyLVhioOqMhsFNIxGaCCaUFExzRAABZmkiZtVeQh
GrmhU/kVDYaa/3z+egy9d4BDidA778b7Opw6GFgrwId1wg3Wl0zQG89h0VMFJMKw
/8mvyHmbjdv+5ucF8fYE30+QXu6fAniENvRjHum6N8ReGyEZ9vf2pHlmGCVtzLUz
nVsbKvjwR71Zlq2RHRmjrf6WsNCBkp/xx/1SwwTof4Y6tHkfEhBAVjQGLqwhi7w5
d2s9KQp3hvWSCNUxDEapZF+m1vGRLQ==
=UNVO
-----END PGP SIGNATURE-----

--IzS+gDfE7WAJn9u1--


--===============6790249203340755474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6790249203340755474==--

