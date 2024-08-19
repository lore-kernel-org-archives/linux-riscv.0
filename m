Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DD0C52D6F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 15:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLDHFatVAAwHhAWUPkUdvIopRXDMCOdnqqGtVNj1vP8=; b=YsS+49EOVUljajd8hGYG4cnOkM
	df5kD76TXOBV17szwvtuAK57FA+TW3+SKgJaff5sy8iQ9tn+YIDMbRGUfMsDXmwhNCQGDrQVrEO07
	agW7Kj8CnlmDkg4O3X1W7u+dvjudobGIe3yp8kh4RoCR4JcLHLrveGmJGVhBwDTYqmi2t84gi9TBM
	iWVOvti8V96VOvVGICdX0glr9ga8XpuAvwJn2Hry0MELbRNU47f+RNAavAAmUFdnu11qz5GZ73wUJ
	gUxc8VVVk1eyg9QAdTUV92TvyOHqwjk+a6d42OlB1UgBsIJyAodja1Zg0GxU+w9QFrEWE8gcU9HO/
	E8Nv9ang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4lh-000000022eq-1g7j;
	Mon, 19 Aug 2024 15:58:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4ky-000000022QO-1Hka;
	Mon, 19 Aug 2024 15:57:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96EF360C5E;
	Mon, 19 Aug 2024 15:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4129C4AF0E;
	Mon, 19 Aug 2024 15:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724083039;
	bh=v3qZPwIeSRlS1QcsBxR5WSu2pfKLNLQcLI/q+clxwYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZshOpuuOha2m4jngC5/MOOet1h6SG+jGlUt+nz0zAcvFxaYVevSimDv5TPH5RhGBk
	 n9vXYpX2cb21q0uvpWQv1L6nybcMoVEMup5m4axyZt05/rSJoSBjekbnGpY8sr0ywF
	 Gnp2cqrKP/n0xk9tO5th3hGes39+M3iEGePBCZbWExauae/tlRw3tpDARhLj6Oorsg
	 rIN5jPdnyNDiNGWeAYS7CxM75DLtEWLAVknNiDb3ExafscAPpWC0uwHsY0zKDE31ie
	 0Qn9rSwvoAU5BKY8j1qsz3b8iuKoZrmb6ZqECQIQZAr7Ul403nM7FWVzz2x+/GzUCl
	 B0n1sNxvYU1SQ==
Date: Mon, 19 Aug 2024 16:57:08 +0100
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
Subject: Re: [PATCH v10 20/40] arm64/gcs: Ensure that new threads have a GCS
Message-ID: <e1d40f17-2c03-4440-8d41-85368e138f03@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-20-699e2bd2190b@kernel.org>
 <ZsM0wkRRguMchecK@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsM0wkRRguMchecK@arm.com>
X-Cookie: Interchangeable parts won't.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_085720_501037_B17A5CCB 
X-CRM114-Status: GOOD (  28.29  )
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
Content-Type: multipart/mixed; boundary="===============5194864037879806388=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5194864037879806388==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RbrhEhE3nEZQH9R3"
Content-Disposition: inline


--RbrhEhE3nEZQH9R3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 19, 2024 at 01:04:18PM +0100, Catalin Marinas wrote:
> On Thu, Aug 01, 2024 at 01:06:47PM +0100, Mark Brown wrote:

> > +static int copy_thread_gcs(struct task_struct *p,
> > +			   const struct kernel_clone_args *args)
> > +{
> > +	unsigned long gcs;
> > +
> > +	gcs = gcs_alloc_thread_stack(p, args);
> > +	if (IS_ERR_VALUE(gcs))
> > +		return PTR_ERR((void *)gcs);

> Is 0 an ok value here? I can see further down that
> gcs_alloc_thread_stack() may return 0.

Yes, it's fine for a thread not to have a GCS.

> > +	p->thread.gcs_el0_mode = current->thread.gcs_el0_mode;
> > +	p->thread.gcs_el0_locked = current->thread.gcs_el0_locked;

> > +	/* Ensure the current state of the GCS is seen by CoW */
> > +	gcsb_dsync();

> I don't get this barrier. What does it have to do with CoW, which memory
> effects is it trying to order?

Yeah, I can't remember what that's supposed to be protecting.

> > +	/* Allocate RLIMIT_STACK/2 with limits of PAGE_SIZE..2G */
> > +	size = PAGE_ALIGN(min_t(unsigned long long,
> > +				rlimit(RLIMIT_STACK) / 2, SZ_2G));
> > +	return max(PAGE_SIZE, size);
> > +}

> So we still have RLIMIT_STACK/2. I thought we got rid of that and just
> went with RLIMIT_STACK (or I misremember).

I honestly can't remember either way, it's quite possible it's changed
multiple times.  I don't have super strong feelings on the particular
value here.

> > +static bool gcs_consume_token(struct mm_struct *mm, unsigned long user_addr)
> > +{

> As per the clone3() thread, I think we should try to use
> get_user_page_vma_remote() and do a cmpxchg() directly.

I've left this as is for now, mainly because it keeps the code in line
with x86 and I can't directly test the x86 code.  IIRC we can't just do
a standard userspace cmpxchg since that will access as though we were at
EL0 but EL0 doesn't have standard write permission for the page.

> How does the user write the initial token? Do we need any barriers
> before/after consuming the token?

The token is created by map_shadow_stack() or as part of a GCS pivot.  A
sync beforehand is probably safer, with the current code we'll have one
when we switch to the task.

--RbrhEhE3nEZQH9R3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbDa1MACgkQJNaLcl1U
h9DbuQf/SjnwfLskheecxP/Aw1iuvcdM5Lad9HYiZl1LzHJXMVCIt1kMcKPJ3MS6
O9iMeWyDk7d7EKrWneyrvSODTNZAFjUnExoo/+WNpnaumrwTH4vS12ZNpq7/1a8W
AsxmGCrQ8IsHpSkEuJyMKshASponZtgCQwUqQX24QyTqP527qXCrX2VmwKppiR0K
4Ve0jwxpZxGhlRUdEWD2k1yIsfxh8qa336gUFDOLxmwW1SRYdQnUpfDzrBg1Kj7m
svrFPBMCQySshntbpRCF0xNG2bxseTrXAKwuqFM1Om5CwvV5DVSRD1n7AaaJmOm0
Gki/1SM6NelVLm9JiPdHIZCf3bkbZg==
=dVcd
-----END PGP SIGNATURE-----

--RbrhEhE3nEZQH9R3--


--===============5194864037879806388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5194864037879806388==--

