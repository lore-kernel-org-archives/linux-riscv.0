Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E2EE784BA
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 19:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/b40OO7a93ysPwIJ8AtJWWOZn4FBHpwC3T707GjB6Y=; b=oJ6XlrFddjlzZAyPmlb5bbwShZ
	F6GV720q4QPMasLfe4C4IhK+/2JPxpFP46nun5OH6RTrmxLmv8YJYgbZTxUDT8yT81NdRg2NhFVAE
	CVXRKFCLDTGckACw1b5wNZEzU+/oHExeIaapZzXjqroJT3neQrVwKf8op7nkYVuPErkM14QttqQ83
	ej+TfP0MqUGyuKD0Rw1lnMUTqSOHwj3cyB+bBk21ZpA3HDlfFIVIYGfH8ARvXF+ErjZhhqUpX0VML
	6Owymb2oSCmwGgqxQ3oiP5SDeCLeQROc84EtvsOahF9yAvMN0A0uPNYmOhKhl0IAYf0NmTxAO6J7U
	bxCU5Dtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnOvJ-00DJCs-14;
	Mon, 02 Oct 2023 19:49:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnOvE-00DJB3-25;
	Mon, 02 Oct 2023 19:49:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C8A3FB81611;
	Mon,  2 Oct 2023 19:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54401C433C8;
	Mon,  2 Oct 2023 19:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696276178;
	bh=LSyryQpZ8HNgK9TYVlNlqsE7lc5WMeTA4wsbmFm3L9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kKXwOWMamRR/cwKFQzaeuZxYaQcA9pAOs++Wwik8ym5z22A7p3jNfV2rtHHzHNGC8
	 0lheJnqFSM7L6ZYmOforDPwwL/34IFYGrLkgotPsqeADaR3LXrKS8hbZ/2FUWkkJNw
	 LPB+4mw1S7AfYmbFrEOJSjjElJ1mJhnH1mh9IY7IFLod4E9pim8Rsyo+JVFASECtPU
	 7BJQzLgZfLui0jLmBNFFeGBb8GdQjLybPYSQZzcK78Be1ldmSWDG2t/IIul/GB9ivp
	 PcFV0VmXEr1/HmvuFQ9ZAmkhFvUg2DUTdbV6RN72AGy3lVH9mUOZ3mPBUhvBoTKNPk
	 Q6T67HS2ww7dA==
Date: Mon, 2 Oct 2023 20:49:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 03/36] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <38edb5c3-367e-4ab7-8cb7-aa1a5c0e330c@sirena.org.uk>
References: <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZN+qki9EaZ6f9XNi@arm.com>
 <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
 <ZOTnL1SDJWZjHPUW@arm.com>
 <43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
 <ZOXa98SqwYPwxzNP@arm.com>
 <ZOYFazB1gYjzDRdA@arm.com>
 <ZRWw7aa3C0LlMPTH@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZRWw7aa3C0LlMPTH@arm.com>
X-Cookie: Postage will be paid by addressee.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_124940_971465_FCCAD6F0 
X-CRM114-Status: GOOD (  27.47  )
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
Content-Type: multipart/mixed; boundary="===============1598349954748716079=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1598349954748716079==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gCNrmYlrm9/empAg"
Content-Disposition: inline


--gCNrmYlrm9/empAg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 28, 2023 at 05:59:25PM +0100, Szabolcs Nagy wrote:
> The 08/23/2023 14:11, Catalin Marinas wrote:

> > > and there is user code doing raw clone threads (such threads are
> > > technically not allowed to call into libc) it's not immediately
> > > clear to me if having gcs in those threads is better or worse.

> i think raw clone / clone3 users may be relevant so we need a
> solution such that they don't fail when gcs args are missing.

Are we sure about that?  Old binaries shouldn't be affected since they
won't turn GCS so we're just talking about new binaries here - are there
really so many of them that we won't be able to get them all converted
over to clone3() and GCS in the timescales we're talking about for GCS
deployment?  I obviously don't particularly mind having the default size
logic but if we allow clone() then that's keeping the existing behaviour
and layering allocation via clone3() on top of it which Catalin didn't
want.  Catalin?

> userspace allocated gcs works for me, but maybe the alternative
> with size only is more consistent (thread gcs is kernel mapped
> with fallback size logic if gcs size is missing):

If we have size only then the handling of GCS and normal stack in struct
clone_args would be inconsistent.  Given that it seems better to have
the field present, we can allow it to be NULL and do the allocation with
the specified size but it should be there.

> > An alternative would be for the clone3() to provide an address _hint_
> > and size for GCS and it would still be the kernel doing the mmap (and
> > munmap on clearing). But at least the user has some control over the
> > placement of the GCS and its size (and maybe providing the address has
> > MAP_FIXED semantics).

> the main thread gcs is still special: the size is provided
> via prctl (if at all).

Either that or we have it do a map_shadow_stack() but that's an extra
syscall during startup.

--gCNrmYlrm9/empAg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUbHsgACgkQJNaLcl1U
h9Dyngf9Hy8AfP5kC/6h6EPVo7EVDeJ1A4cbGRBtR61F+kO0Gknu6S0AxnHkfkgt
cODaJDIw85fav0lGTTx8Rlr/77kzihHWSNLwnyAaR1gPYzRgqM/XBdwf9M6mnT7I
907nXSNYnfB1pE+8Be1LmcXX8hbHhr6l3K+FT5vZQTcpEAGrxAv7xLNEZ7xMkqV0
PPa+7hjf+9MpBcZQbqjK+KpoCWdTAZkTcnqpKQApUqiAbs5aeKuDfqulxl4eQ7IF
4y3g5jbZpwsCSjlxNnQaT+K8cof3zDuHUV6Hf4rpNA4XfwybEbSPNYD8zZ8TYzbj
1IGtDcFokNQ4Y0FbRpYBRx621claGQ==
=f6SF
-----END PGP SIGNATURE-----

--gCNrmYlrm9/empAg--


--===============1598349954748716079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1598349954748716079==--

