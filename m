Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039B9C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 16:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1W4Mp3Hy2YCF4JE9Wc9dXZ3C6egqjp3A2S5k3lFrZXc=; b=OMNV9oHq1qXyF4oUvIiuVn1quy
	taUePECtgGdkhPi2fvwYvF5dG7DKNtNNToEYh6m257fFg9PJp41mHjMNmJBzVTAXqFhbZZBaCP0nO
	xyOBUURtgBUDlreob1kTmB4iPei95t4yLpY7StH4bvX5ujApMkwwvEv0Qo0DdJ+m+ZSW2SpgJEMjM
	JblGm8cFtyLGCeIqg88GsDB8wP5+kJxda1op5WqrVwfYn45vGATrikXB35mshipzVreyQ4gwEC5su
	uNm60LDwlGUekgzCY7uE+wFv0lcD6+YwJF8FIsChyNZ7bPZ0eoEInJCtKeonaQ+wFzsBJpT72SGrS
	k7GAF5Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLZ4-0000000AFlr-0AK8;
	Fri, 25 Jul 2025 16:46:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLZ1-0000000AFlU-3yPk
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 16:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BB4B43681;
	Fri, 25 Jul 2025 16:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864CAC4CEE7;
	Fri, 25 Jul 2025 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753461991;
	bh=QfpCHcwHlHinm9ZtR/fViVngG0sNf7Ts+uB3ZCh5Xx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gfDBlPASXlIlyZFsABQdJ0MBZXFqFDpZ4v19uM76so5Lf3LnGvL62sFFPOXsJY1Di
	 77ENC5Y+xHf5+f7+h8pgVKM6hYCtOZNneQpJxNf742fty/OmoXMQ4n71XzKwYyDgI3
	 nrsr7Y0XSIKTOo0eBgmRAJjXWKXn5kEVs2tT1WdnMMnJn536HH8ZKXamygOC3GNXe9
	 bXdOJa3s1/K4acl8rXY57hKN4gydNVBhB2tvtjHX74R/NqoQVO1ZfHmx6PNI5P3Es8
	 Feb8oKNp76Zg7CeDnIdRFiLard1U8oTXtFyavDVraSrknpwPg1bGlDS/XXEiohzwWS
	 tPTItG4nJZMvw==
Date: Fri, 25 Jul 2025 17:46:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <aIO05OZyhjZ5JADT@finisterre.sirena.org.uk>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <20250725161327.GC1724026@google.com>
MIME-Version: 1.0
In-Reply-To: <20250725161327.GC1724026@google.com>
X-Cookie: Do not cut switchbacks.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_094632_024832_93657F69 
X-CRM114-Status: GOOD (  12.39  )
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
Content-Type: multipart/mixed; boundary="===============1923510600353920698=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1923510600353920698==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ptTNb7F4keuuu5CT"
Content-Disposition: inline


--ptTNb7F4keuuu5CT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 25, 2025 at 04:13:27PM +0000, Sami Tolvanen wrote:
> On Thu, Jul 24, 2025 at 04:37:03PM -0700, Deepak Gupta wrote:

> > If shadow stack have memory protections from underlying cpu, use those
> > protections. arches can define PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
> > stack pages. Hw assisted shadow stack pages grow downwards like regular
> > stack. Clang based software shadow call stack grows low to high address.

> Is this the case for all the current hardware shadow stack
> implementations? If not, we might want a separate config for the
> shadow stack direction instead.

It's true for arm64.

--ptTNb7F4keuuu5CT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiDtOMACgkQJNaLcl1U
h9ArZwf/YMJkuoQ2j9bLF9ONvIrnXY0fItNlrfggfCoxTcY9cRIgb8l8qOxc6uA/
S2sVyA97Le95wnFpBayjCXiFb7F5ooRUS+41Wo4PvG/kTTJsKWqydoQpAZyzQNV+
V1a4cITUFqNi6mYcrEcWzd9RndDfhxXSOaaNgIq2uGgGVMZVXM4LiDqzaP+IS8+y
apL1au6vq87T3R5llhBOzHXr3ot14xeeNfPE9ls3fjM3e0PqhEEXhiljoCKV8szV
18kXUuSAEs1Xpf/WR2dbQj2aWzdPWSm26CT3mIULr+cO93Yczz0oIJqwE8MrykTI
8XzoTTcoH0r8nWPzdxA34nliH8cp6A==
=wvEv
-----END PGP SIGNATURE-----

--ptTNb7F4keuuu5CT--


--===============1923510600353920698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1923510600353920698==--

