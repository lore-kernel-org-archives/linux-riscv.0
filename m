Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA67CF044A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 10:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AC5oIMGQW98dePe19U0WIa2rdBgcYkRfuRsr2urGts=; b=yHQS7Vhpb4t+z7BF0j11g0K0r7
	ndjRr9iWPbpVtF4TGlOZ7lwZnxf8kX2Dzazsb7Wzmifeu/Vg+ct5IXnsHqkYchEX9BS0az8iiA2LH
	FSlE6FhR8J7pSfyuVY6PyOruXvv+ArcjjIhBHJE2YF/YtKQBNPAScbzOxgQKbJrUFO3u30qpfNkUs
	PlaoIC90ACYLf902c+mfI8JcN09O3Q+YS/bHtmh62ys26Kex/LuvuU+la/wHN/4pHXNNvcYWMf6DJ
	jNtj/jr9QrBGs1g8VWqO3h/pVUF569u+hOOTqcp6+pOkYdSn0zi/0PjKQS3FxRxfoqpWncBbdpj1C
	mI+5YHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syU4C-00000008uGq-0DXN;
	Wed, 09 Oct 2024 10:37:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syTsu-00000008sJA-0wXa
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 10:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75288A43CF2;
	Wed,  9 Oct 2024 10:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F86C4CEC5;
	Wed,  9 Oct 2024 10:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728469534;
	bh=E98w9taq8sn2oCFo6PyCyTLfRrjriLoSIyE58uTuJiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CU/SyyphBFW7CION5UzN5ZaM2s9B2KaWUYjQIE24jNpQiaaNBcPZ/JBx43vZR9RIm
	 dKAuev96gZiqv3cQzmnlNpHZGs9yUnbcbXXoet9w9Wkw11upiEbCgMxXNsdL4ezFdY
	 +p5Tmy9zeIo8mmLnp1544+X/5q23ssqCYC9uPdMTUlybp9F8xH4e8D5xzIK9/AHeT4
	 VM8+SYp7oWGh1v48rq/tPnXUE9W2Y0QAcFjQlkkDsy7TNbdxWPifO6On6S6nNdb6x/
	 +Q0hlFwhivhYuLDaOGJFcmJB/380AQV7gmfUOo5/8+ukhcjeDEpd9KT8HTxCDfwmeH
	 x2vMMvQe1JdeA==
Date: Wed, 9 Oct 2024 11:25:31 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "robh@kernel.org" <robh@kernel.org>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor@kernel.org" <conor@kernel.org>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"arnd@arndb.de" <arnd@arndb.de>, "bp@alien8.de" <bp@alien8.de>,
	"kees@kernel.org" <kees@kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"jim.shu@sifive.com" <jim.shu@sifive.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"cleger@rivosinc.com" <cleger@rivosinc.com>,
	"kito.cheng@sifive.com" <kito.cheng@sifive.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"evan@rivosinc.com" <evan@rivosinc.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"atishp@rivosinc.com" <atishp@rivosinc.com>,
	"andybnac@gmail.com" <andybnac@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>
Subject: Re: [PATCH v6 16/33] riscv/shstk: If needed allocate a new shadow
 stack on clone
Message-ID: <ZwZaG3NT72BwYxJO@finisterre.sirena.org.uk>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-16-60d9fe073f37@rivosinc.com>
 <aa75cbd142c51b996423f18769d8b8d7ecc39081.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <aa75cbd142c51b996423f18769d8b8d7ecc39081.camel@intel.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_032536_447624_BE1430F1 
X-CRM114-Status: GOOD (  12.31  )
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
Content-Type: multipart/mixed; boundary="===============6751162272275038203=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6751162272275038203==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pV5KnxhmLMXWkQIN"
Content-Disposition: inline


--pV5KnxhmLMXWkQIN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 08, 2024 at 10:55:29PM +0000, Edgecombe, Rick P wrote:

> A lot of this patch and the previous one is similar to x86's and arm's. It great
> that we can have consistency around this behavior.

> There might be enough consistency to refactor some of the arch code into a
> kernel/shstk.c.

> Should we try?

I think so - I think we discussed it before.  I was thinking of looking
at it once the clone3() stuff settles down, I don't want to trigger any
unneeded refectorings there and cause further delays.

--pV5KnxhmLMXWkQIN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcGWhUACgkQJNaLcl1U
h9CV8Qf+Ph9QxNDXCUSDZQA7lOMJTS+c3a+WdGbveXt6JMb2hP4Udd4ELfDvQVsP
2vwWUtByxmDax2qjADTJn56IYnJp+1yB9YBfBuwEGHGP67KgKDpcUHieu4xPemue
2pid1MtBjTUsviljsva6rAoewc+MO3Z5AAICoplF1wXYwW8JWpgKpALzehjsUnOG
xGgEXqiS5ycjWc0ikmHyeOQRK13/4EVaiJr+pklcIbhhggLbnNIB7jvKTKnBr/ds
fkXQZeW9aA6kQUAetPKjlkvwxOhyxix4xDR3tCncJjA/emX+9fze/UwLrBDs75JO
eMHp4p8ZUDqVuxPu6ZNF8wGk8VJChA==
=EDL3
-----END PGP SIGNATURE-----

--pV5KnxhmLMXWkQIN--


--===============6751162272275038203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6751162272275038203==--

