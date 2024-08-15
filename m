Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7953EC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 18:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSzoWmQUmZQaaFYAr6+mm4zyNpiy98kRn4z4/V9bGbY=; b=aSGHXLadT0HVZTZcrZITm3Z7g8
	dHDzSZ+goj6R9DHjKXIsnBo6kU6UWGe2wuRj5a9qJrF1l8XQf8pmUk9PRtqjpdsJLkDUqKC8+l4fD
	b67rFu2PQ5q8LU9rP40Me9hydqPwssnm1ylhOhL1dlEPWt6CmOnt1aMH0c50Pvih4FL1+zLtT8fG+
	UQeGg6Vqmlqxjvz1UU6J44KSo5nurphv8nKvdZdjTjXgPs65rFi/NAOvrg7FRnh1iJILT1mpd6CU+
	diLHMqRuUxrlKOhCjkCujyW5ZhSd4eczexunA6lu9/eC2Gg7FMPtKfU+WJeVbto1pMgiM1LBhV97B
	V/oomINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seezx-0000000Ajgc-3ny2;
	Thu, 15 Aug 2024 18:14:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seezL-0000000AjdW-2e78;
	Thu, 15 Aug 2024 18:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8S7fVFqbqPfAafRih8q/yQy27jhQ3dfjaKH6qLF2Qpc=; b=kw7+mpVwMDkUpEHMjQzJfRzKw4
	J1ErdMdyQ6Hm3luS/dniy0Q0odIiXsCZrOD0Rl4u9pednyjunpvRhTc+LWa4VfPUH+Nc1C7yUqh8r
	qwNCF4vSZNtgm6a/tWon1Ngn+vSLmCzmfoNutFN91zQYLS6ZTOErYGqN6VCTX8r7tPSMD3HRWeYiq
	mEmsXChLIN1XSCNibBUf7+9Ut3iti1EF7Twg6TU0ILXj7DMvhhwJYSd5vuDAr5Tv97IK8zxIf+sVG
	3jSgnvd4YzJnPdkRd9eW1so+WiNePBnqEywvOZeMyO8PTY1UAFy6PW5cZ1cnxsgJ9J1WMboggWNPy
	u0cJp4oQ==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seezH-00000008TzY-43Rg;
	Thu, 15 Aug 2024 18:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E7010CE1DA0;
	Thu, 15 Aug 2024 18:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB208C32786;
	Thu, 15 Aug 2024 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723745650;
	bh=RdD04e7bCL/aVp7Qyn7v8N5dBB4gbycSkh4w1YVB2kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BdNX9evYkuNDzaq1aPNqEDzPM6DtOszJ4fplPAv3RtWa/vIKvYlrUd7AEi63DCqnj
	 2ZHmYP3Mhcaxzc3nkhhYZ1sezN/Rie/qqCA2LjgDHrNdp4aniD+lgSn90u0O5kM7ub
	 snWnOv3YaUWn+8rZfdCes1OgLfN4geXYsjJs0xIw8WKiccSuMwsIWlS78BoWm1udr5
	 UeaJIwcpXPwSXqFL0Pwut4my0L7CtbUI9cXNk0RIPALppzDzDXQ+apnvBxCP1QHcnu
	 jG4F5HHXQ7kK9LxOGpKf1DPtz/YzKtlDkJS45/ImafzJCEnmP7dkyB5UYYS1dl2xf4
	 XKP/epYAVeuMw==
Date: Thu, 15 Aug 2024 19:14:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 04/40] arm64: Document boot requirements for Guarded
 Control Stacks
Message-ID: <44ce87ea-38c3-4a84-9dac-835b963ed07d@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-4-699e2bd2190b@kernel.org>
 <Zr40H4xAb00MdMlX@arm.com>
MIME-Version: 1.0
In-Reply-To: <Zr40H4xAb00MdMlX@arm.com>
X-Cookie: -- Owen Meredith
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_191416_609205_776FA876 
X-CRM114-Status: GOOD (  24.08  )
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
Content-Type: multipart/mixed; boundary="===============7842261026808034046=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7842261026808034046==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FolSFB1sscROoe34"
Content-Disposition: inline


--FolSFB1sscROoe34
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2024 at 06:00:15PM +0100, Catalin Marinas wrote:
> On Thu, Aug 01, 2024 at 01:06:31PM +0100, Mark Brown wrote:

> > +  - If EL2 is present:

> > +    - GCSCR_EL2 must be initialised to 0.

> > + - If the kernel is entered at EL1 and EL2 is present:
> > +
> > +    - GCSCR_EL1 must be initialised to 0.
> > +
> > +    - GCSCRE0_EL1 must be initialised to 0.

> Currently booting.rst doesn't list *_EL1 registers to be initialised
> when the kernel is entered at EL1, that would usually be the
> responsibility of EL1. The exception is some bits in SCTLR_EL1 around
> not entering with the MMU and caches enabled. But here I think it makes
> sense to add these GCS registers since if some random bits are set, they
> can affect kernels (and user apps) that don't have GCS support.

Right, exactly - the trouble here is that if we enter EL1 with GCS
enabled we aren't able to do function calls until we either disable GCS
or configure the MMU and allocate a GCS.  This means that all existing
kernels which haven't heard of GCS require that GCS be disabled prior to
starting, they'll just fault within a couple of instructions whenever
they reach the EL for which GCS is enabled so it seems sensible to just
require that this is set up.  It is hard to envision a scenario in which
it would be reasonable to start in a different configuration.

Now I think about it I should move those two to not depend on EL2 being
present, that's just cut'n'paste.

> Don't we need HCRX_EL2.GCSEn to be set when entered at EL1?

Yes, if we want GCS to do anything.  I've added this.

--FolSFB1sscROoe34
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma+RWgACgkQJNaLcl1U
h9BaiQf9EC6tNrCibHFhHciYydBCLiy2LIqlYTMYVmhIGoRxyAWDvgrDDiZx9XtM
yJHys2Cn+xNukEZmz3TbAjtEfCb32S5qodYU+8KsRFp6cIsM2kUCTkFdVTz36dMZ
8IDl4I2zbMlh03uCCC1+5vjuXE+qRPgUOzg1X00q4zHYC05XoSWCm2I1183TgHKJ
4INAGk/sLjwF3oZPOtjnIta/ZUqyrxLbcBH4b1JQQD3WZ34WHJKjbCiZigQYJIMh
iy9ryfYUrf8oluuAuFO8javORaHNBURd9bOsjj004eD9WlKYjp1Ji7iuheq5iWb6
A3XUg+P7gC0bMfb12d1321Rjg8cWng==
=dtpa
-----END PGP SIGNATURE-----

--FolSFB1sscROoe34--


--===============7842261026808034046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7842261026808034046==--

