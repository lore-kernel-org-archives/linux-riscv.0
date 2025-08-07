Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B086FC87FCA
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqWqtY5GeC7j50rn3/b/p5rI/VcCI2gHCx+6Jq9sVfY=; b=LxC1kWXvkDQ1yElq0bk/G5j6Zr
	kWXoz15IDLLYG6YsGJSo316TW33xTa/zLTIuJvSzByd6TgLY/rylODZUYTRwSuphAP6A3qeSNeUHL
	tpJomo5Kizy4Yz7a/nck58pZGZ/tPjXsBpzARhcWpv+aFKn8Wx9Re9WGGFL3lfuTFOKTewymjf58C
	LOi9axrNRd8PopIytEUsWgDcStqs7W04xoW9s/HPMl8PqhLHTvvVWW0qChB5cnge60pkmhuukbo0v
	DdZ0/Leaipu56Q9C5gZpm0a9v0siSTH/g7bvFhyxtaj5Mf/ctXhNy0HHaUqozXQaSUs6yBVSZE3yU
	5fX/Ks4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzx6-00000000a0D-3Jpm;
	Thu, 07 Aug 2025 12:42:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzjm-00000000XcC-1ATN
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 12:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2F4B4130B;
	Thu,  7 Aug 2025 12:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB578C4CEEB;
	Thu,  7 Aug 2025 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754569729;
	bh=kUH5cN8R6K2VxLTJzE/eGBwS7eFdgy3gZa8/khg7FMc=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=QfRz8/lokPQVbrBLQdFUg7Zb/pO83LwtQj6QWEu50ZIIRiNZFCedBiyH1vPKdZCmn
	 sd6EpNnPi3l2PXkuxCii2LHjBXBHhb8dMe7F02R3uXDPg+W0NEArdn2LzuNZWk4n4C
	 /Sx0iu7o5KWBtcGI3LpmP5Ug+gPg6/SSSMluaZMDVq7o8iEupbbo1t+inLw6H7xOEs
	 jqbuylhW2q93qMf3JwvCe+wxRi2FEEeMt64N6gLqFXR4huwOVfenuJMDp6TjvScCLC
	 7UWGcPsoYmI5swp1B3/noAXrQ9FI+wP3dI6JCb6TOGkWKhf2Oy8Cic2ZCTYFeNZEkL
	 7GwpI5SHcfNkg==
Date: Thu, 7 Aug 2025 13:28:36 +0100
From: Mark Brown <broonie@kernel.org>
To: patchwork-bot+linux-riscv@kernel.org
Cc: Deepak Gupta <debug@rivosinc.com>, linux-riscv@lists.infradead.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
	lorenzo.stoakes@oracle.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
	brauner@kernel.org, peterz@infradead.org, oleg@redhat.com,
	ebiederm@xmission.com, kees@kernel.org, corbet@lwn.net,
	shuah@kernel.org, jannh@google.com, conor+dt@kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, lossin@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	zong.li@sifive.com, david@redhat.com
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
Message-ID: <db4eb976-693c-426c-a867-66cadd3dd7d8@sirena.org.uk>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
 <175450053775.2863135.11568399057706626223.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
In-Reply-To: <175450053775.2863135.11568399057706626223.git-patchwork-notify@kernel.org>
X-Cookie: Real Users hate Real Programmers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_052850_357925_91CDFAAF 
X-CRM114-Status: UNSURE (   9.27  )
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
Content-Type: multipart/mixed; boundary="===============7750357942593679244=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7750357942593679244==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Jovl+rM+g+rY2Z6"
Content-Disposition: inline


--8Jovl+rM+g+rY2Z6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 06, 2025 at 05:15:37PM +0000, patchwork-bot+linux-riscv@kernel.org wrote:

> This series was applied to riscv/linux.git (for-next)
> by Alexandre Ghiti <alexghiti@rivosinc.com>:

>   - [v19,11/27] riscv/shstk: If needed allocate a new shadow stack on clone
>     https://git.kernel.org/riscv/c/9c72a71321a6
>   - [v19,12/27] riscv: Implements arch agnostic shadow stack prctls
>     https://git.kernel.org/riscv/c/52eff0ab5f8e

Congratulations Deepak!  Do you have an update for my clone3() shadow
stack series that I could roll in for when I repost that after the merge
window, and/or instructions for how to run this stuff for RISC-V on some
emulated platform?

--8Jovl+rM+g+rY2Z6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiUm/QACgkQJNaLcl1U
h9BDYgf/Ty4Hzzi0OZOuIjqMAO+hAw56Z5Cp+NT+3TWGYWAJtxuukMORT3mrkWI4
+lKrRIDqhecWHSZ3jeKvFjPvxTcPu/kwjG7GsseqGj7HJGoOufVlruKUj79xtdKS
4V/WwyvqakZ4h3F0zy+bCyIrkBkQNbC3TTJVey1+4t0WNSj2uK4ZXespwXt+omY7
MOsfSOj3AY1ueunPYkofK1g6VWYe4HSldfLRvwJMeUadPJ49XFhfpi41NsqdfhBB
I8rdBWPSCS47tFoalL0R2oB+Dp78k8LmZhqKIRpPwAhMHIg3sI/kBMK4neka58L2
d0MPk00RRPiLdsDKGHuaAWzwtLHXaA==
=viF/
-----END PGP SIGNATURE-----

--8Jovl+rM+g+rY2Z6--


--===============7750357942593679244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7750357942593679244==--

