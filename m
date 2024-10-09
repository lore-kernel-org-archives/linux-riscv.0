Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE06CF044D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 11:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BKSLh8MXD/ghJ/LlPJgf3Sos62jMbgm5+DPMA0b4b8=; b=WQ9D3irkF1etMS1aPUjyNhV61f
	5lY1rPObdw5EX5bbITe3a2dEoeDQu55v+Jf2Tm6KRwr5JObQJRpUF/P2HN4pF9BlzRTWLhCFk3OA6
	t2e9tf1TSucDthHKzuGuUDeaIwqCKYXxFH48vWwVKKvsPKaUTBd9DB37qz8z/GDYngTXZwsKOzsSy
	CPcVt7iQa86nwdze5IN5tXEXhNdd09Df4Vki1m5RYnGyHVx2VyrOvCMmv5WtmZR+hKPPEdTNtEFJS
	B8xs80yhzYcfxfu2wLd3mo9ClGKzvJ1Ypv9brcOxr8RZ4rFjw9i1zYOxhcqq6fSZx9SNbreHEnHMl
	gkQbXkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUTk-00000008z3F-19vN;
	Wed, 09 Oct 2024 11:03:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUTh-00000008z2L-24oL
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 11:03:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9EA7A43CDF;
	Wed,  9 Oct 2024 11:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F023C4CEC5;
	Wed,  9 Oct 2024 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728471816;
	bh=f/EoNW04y2Nr6yAWUDCYj/76s4oDbPK3TY0FW8YOVV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLepzEshP/4mXQsl2XJpjT73NbBGz9G2agwEEd6tQYz9lO+eqYxMzaMcj24H4GW81
	 Le1KkXnjJBC8MW7FflTwf5k8u62yR275mQzbLM2Xnkksng7BBXCCu3I2IsilKKuh9C
	 tn5I9gMoOPl9IR/07Z7LrDEOfMozP8crg0Ejm1/cMpecXWaC7fqbOpYoml4pkqT6KZ
	 8ErbCjP7yR0hITlFP8nBM9WRgd/ZKkYKCpiRE0HjmkZfh/VszZtHEOhp3fV+YeRcul
	 Wbp42jCJn48Au8WODEcR3T6WeTkaJD6W4x+KhVfOQYXHADlrjbnU7K+GGkOQQF13Wm
	 yEtogMwRguJXA==
Date: Wed, 9 Oct 2024 12:03:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, rick.p.edgecombe@intel.com
Subject: Re: [PATCH v6 18/33] prctl: arch-agnostic prctl for indirect branch
 tracking
Message-ID: <ZwZjBO_7d2-Qq8bF@finisterre.sirena.org.uk>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-18-60d9fe073f37@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20241008-v5_user_cfi_series-v6-18-60d9fe073f37@rivosinc.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_040337_698706_7F28D675 
X-CRM114-Status: GOOD (  12.09  )
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
Content-Type: multipart/mixed; boundary="===============7960058041807064363=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7960058041807064363==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FXfO/TwhQ+C7Uak4"
Content-Disposition: inline


--FXfO/TwhQ+C7Uak4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 08, 2024 at 03:37:00PM -0700, Deepak Gupta wrote:
> Three architectures (x86, aarch64, riscv) have support for indirect branch
> tracking feature in a very similar fashion. On a very high level, indirect
> branch tracking is a CPU feature where CPU tracks branches which uses
> memory operand to perform control transfer in program. As part of this
> tracking on indirect branches, CPU goes in a state where it expects a
> landing pad instr on target and if not found then CPU raises some fault
> (architecture dependent)

Reviewed-by: Mark Brown <broonie@kernel.org>

--FXfO/TwhQ+C7Uak4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcGYwQACgkQJNaLcl1U
h9AHsQf9H04XFe+wNJxLZrv59pAwdvHe6MP+LVVOFndbjBmbHFTN6qmAISZyqktF
SRfj1/m4yG/TwuwLWuBmwzNCYhtdu6T7NxMLpAffd830l1MTkdrF7wQ9gl7ZGRAW
hwjTCOjqQG+RiCf8msgkCaHpmTaxQyaaXKijwQLlpjse8yXFagVbB7KFfLnU3SdH
EU1KXwsGKBILqKMesYtkE6OZOORH7YEXvvPcvZD2E/I/6ZVodlxghrEiw+L2z358
AVd82hg9g4z+W4RfgoHAuzE0DM7w1omjJCy8JvknSzesQFWBmnyDm/chs8uVbfBH
GWu/B4b4XqB14HIbfiwUtTrT1OMnCw==
=cHVw
-----END PGP SIGNATURE-----

--FXfO/TwhQ+C7Uak4--


--===============7960058041807064363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7960058041807064363==--

