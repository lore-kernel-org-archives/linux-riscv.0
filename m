Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404D1C4828D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4a8LotG59A/Hn6EWRVAh3JvUKbz3k4Jzfp9IihFDios=; b=xyQ2KlvDits63K/GOsJs5hR19/
	sW9padublZWY2BgjaUgruolHfSOWxofMGcXY6u7qULKCav8RS872SEhWmX7bhsJdLhy7cBhwRdxEp
	CpoXigCriNJwHVyr1lkX3VBEFb7F2PUuwTuAaXBGcosEMV/nQ0exUeir5flIPmsu2UV2b2c3QBi5G
	A3PJEpLdFbTVVtx+irWnLqRqtmTIVTiyRsJZzBhOic63a6dF8E8j3f9159Au2Dz8+GXE47SF2mTcs
	8y0IIy0zSk/BN+QQTIf+/LRoP0jAAe/6v8a4UGscNxizMLyBvjmNeBvhBrqkLVRi4JabUJe863Vp2
	CL/H0QXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNt9-00000008C1k-0UYK;
	Tue, 06 Feb 2024 16:01:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNt6-00000008C0u-3jVj
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 16:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B76A615B2;
	Tue,  6 Feb 2024 16:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2BAC433F1;
	Tue,  6 Feb 2024 16:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707235291;
	bh=aRQxl0C0V0705HuiquTkhHHqPboA18NaqgotYv9rCA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PV0B3eTOaNjzcvWs65Me6RDLhFj8YGByJ83V31ytWUnS8qhWSmRMRl0l5zr6Ky/HI
	 V8VB3bU4h1IvUqAnjW+GixZAPSitutZKlnNNQsb3zhPpetctNotMxhcs+16kpERvcI
	 QJlKVt1MUAwmmTLtRKPv+7kMaAaYKnrgHOiLqelYjBoBJh2c90qyMuKpsBQaLV4ixc
	 x4u/dAvjHm8aNECN3GpgyoQDyFjLJi59680J1T/oC03fzuisXQvW2y2jFqQGwm715y
	 2X7DJSP2x6Oz8DlvjQGm4xWPmxiPaAXHidpqbvV2Qg4SWxurgjdXViSVHc8zyfhu2V
	 +S947qR7PCFqA==
Date: Tue, 6 Feb 2024 16:01:28 +0000
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
Subject: Re: [RFC PATCH v1 15/28] riscv/mm: Implement map_shadow_stack()
 syscall
Message-ID: <ZcJX2IJb0hOM5RF5@finisterre.sirena.org.uk>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-16-debug@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240125062739.1339782-16-debug@rivosinc.com>
X-Cookie: You might have mail.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_080133_038390_F3BF4E48 
X-CRM114-Status: GOOD (  16.88  )
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
Content-Type: multipart/mixed; boundary="===============4494859457045862800=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4494859457045862800==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ywwgCSX0zhXuCNZ"
Content-Disposition: inline


--3ywwgCSX0zhXuCNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 10:21:40PM -0800, debug@rivosinc.com wrote:

> As discussed extensively in the changelog for the addition of this
> syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
> existing mmap() and madvise() syscalls do not map entirely well onto the
> security requirements for guarded control stacks since they lead to
> windows where memory is allocated but not yet protected or stacks which
> are not properly and safely initialised. Instead a new syscall
> map_shadow_stack() has been defined which allocates and initialises a
> shadow stack page.

While I agree that this is very well written you probably want to update
the references to guarded control stacks to whatever the RISC-V term is :P

> --- a/include/uapi/asm-generic/mman.h
> +++ b/include/uapi/asm-generic/mman.h
> @@ -19,4 +19,5 @@
>  #define MCL_FUTURE	2		/* lock all future mappings */
>  #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
> =20
> +#define SHADOW_STACK_SET_TOKEN (1ULL << 0)     /* Set up a restore token=
 in the shadow stack */
>  #endif /* __ASM_GENERIC_MMAN_H */

For arm64 I also added a SHADOW_STACK_SET_MARKER for adding a top of
stack marker, did you have any thoughts on that for RISC-V?  I think x86
were considering adding it too, it'd be good if we could get things
consistent.

--3ywwgCSX0zhXuCNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXCV9cACgkQJNaLcl1U
h9DovAf+LgWdOKedTbffoEJgm3iDVrzzlW/jko7UF4Sjg6Gv0ngCJGWQIzvYEk/w
B/3v/8xatJ9n+VbKX606intt/LsnRYDNTB3OVDKogBCeRo6NPl26QjEqt8lQQtSa
po1FZcEIfdjmxWOCphm0MYLR97sxtDs+07Y6SOdoEFyowqDP9y7VIHR4juOy0RyJ
tpKpA1fORTVxP50RQT+V9GZ9zuV6FL2C5ULfahB+o6W6r/wmVlSWdsFkwdnayCKv
9DqlaPDQoklRZRy6bgUPTHyc1b6suEgg2G6Om/Pzd7Z3snoiyeDBoqMgMWOhAa1r
XYbr9H4oCPUEs0ONOGZmAcXzGu7kIQ==
=mDMz
-----END PGP SIGNATURE-----

--3ywwgCSX0zhXuCNZ--


--===============4494859457045862800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4494859457045862800==--

