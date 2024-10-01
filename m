Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75888CEACFB
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 17:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Em56SXBnBvRwt5lVGXWv4gDjI9bt4o6Q1+dxnAj0BsI=; b=e0YyTpxYQhMGca91gqJr4InVbW
	CVchOPs3BdX+iT/M+daqh/HtSR0w5NJKICaJqfpDiuED5pVb0Dk1QxVk97oS0mDzS3GDI0qUErB23
	/A1Rg94s9I61wvNIwoUMUXpcNDqiFj1kXhxZGPDS8Fv9TQSs+DGdxNcwsbXEp1o2agPG3Ii9ipHFg
	YnL6PJUYb9zVuSaNkgpqkPPcWStZPGecrUJO5uAhUrs5qQkjS9qNiNLkX6wSnbtv2Cbf5pKxFldeB
	D9BK4Iy/th1+Hjx6qmTpLw8/KXgy79F/Jfc8WA0g0wNLs/z6TvYDqNlZ1N6BOx/dcR0UNGTQ4bVii
	EfntIoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svgis-00000003fFU-37xA;
	Tue, 01 Oct 2024 17:31:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfX1-00000003Tsb-1WGT
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 638C3A40E0A;
	Tue,  1 Oct 2024 16:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64E3C4CEC7;
	Tue,  1 Oct 2024 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727799321;
	bh=+OmrwFFvI55GhiVmjwakGzI55IFXbs0OQLhUUTgaw38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqbtuRFJU3u7JGA6mstBP8v+VnF2+BpPvJBISYpoE1myMPoeofcLOfETglwd/qqZX
	 x6xbtmUE/AaEcoWn0ZA8t0QUZQjaEsa66J35m09JoEfVzTDOIpJbSzpgGrbYGk7ROR
	 Imomv1HBZRnI/fzOcUfTyuK6zGFljqtNCMIAK2siGRxnBJbqwPASU2pU1LcPDOROtb
	 yxFRIIJPpDmySpyG1SG6qGCbTLZLpLzu+QVE7YuzjfOhmInh2W/JnLERnqF9jC+jh+
	 uPLt33Yevu1qKZxJS38du1tCjiT/+4HgU/OhVG31JhV+AgobMsR7Pk5M44bCsRITkI
	 oGQGlV/9jIzhQ==
Date: Tue, 1 Oct 2024 17:15:08 +0100
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
Subject: Re: [PATCH 17/33] prctl: arch-agnostic prctl for shadow stack
Message-ID: <e7c48ad8-5fe2-46d8-b137-e04046b7c572@sirena.org.uk>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
 <20241001-v5_user_cfi_series-v1-17-3ba65b6e550f@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20241001-v5_user_cfi_series-v1-17-3ba65b6e550f@rivosinc.com>
X-Cookie: Even a hawk is an eagle among crows.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_091523_576937_97C7DD00 
X-CRM114-Status: GOOD (  11.91  )
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
Content-Type: multipart/mixed; boundary="===============7436440849753421952=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7436440849753421952==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HnBpW/dMWd9OANPk"
Content-Disposition: inline


--HnBpW/dMWd9OANPk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2024 at 09:06:22AM -0700, Deepak Gupta wrote:
> From: Mark Brown <broonie@kernel.org>

> This is based on a patch originally written by Deepak Gupta but later
> modified by Mark Brown for arm's GCS patch series.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Co-developed-by: Deepak Gupta <debug@rivosinc.com>
> ---

You need to add your own signoff to this when reposting, see
submitting-patches.rst.

--HnBpW/dMWd9OANPk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb8IAsACgkQJNaLcl1U
h9DrwQf7BAFQooaBsGyKz4K0gmdZvizPyAYQqIuRAHGgQfFjNxxMAxr9uixHnfTg
/mZbG5XRVKtI2yxwczMB6CMGwI1HZ4s2Inp/eJbCxUbAH6vU8tYpveECIII9zKk3
I7sr3LtJGO2vNA6jL4aC9sjIBK8ArFU3U3q3xFvuNA3rweEVNh/pN2syIsK+WXuS
cdkujVFleyQUjcyYIPGZIDNctM39NDfOhgBe3mSiAwDzXnTay7MMBdpFP9DffM/Z
+VzTmLgom8P7XIJJglgDDUYqrh0D5VsztFKJ1BPcwUR7y7KJpO0EBPuvglcXPbqa
Qm1qEKcpAzSR4Y56hqjCRCmPB4fIXw==
=G7w+
-----END PGP SIGNATURE-----

--HnBpW/dMWd9OANPk--


--===============7436440849753421952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7436440849753421952==--

