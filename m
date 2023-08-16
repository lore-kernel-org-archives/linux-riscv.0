Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E17C04FE2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ie4arx3WwO8tPF+Q9kalPxDCUNJtTJZr+30ij5mjDR0=; b=0kHvaTleyU7Nn6E7koFxQRN59m
	qr60saWCZD78BS+AQP1odWNj8/f4roCcCniQ4fp2CWzNORSA8nSlDzX3kqdjS52WCALEPemkovuX9
	zgXYfGd84wCEBlmjKHbaBK0n8R15D2Xxy5Oi5Sg0lIR+wmx34QghxN/fE10rh7Pa/dAbvemC86fio
	F3OfxCP2fSkI5JgCg0EfRldchuPnki5xW308xQPLktPEmsmeJP2GLfyBm2Kl4IWeu5d1INolNI+h9
	/OLgUGbIOEoTfqSpyvy/JMEUNntndcW+PRnBS+iKCVIQYTew/UhQ2PJ/4E6r6zbYhKTQla8kIKU61
	/m29yVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWL3v-004m85-1S;
	Wed, 16 Aug 2023 18:16:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWL3r-004m6j-35;
	Wed, 16 Aug 2023 18:16:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B11A63981;
	Wed, 16 Aug 2023 18:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C596DC433C7;
	Wed, 16 Aug 2023 18:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692209762;
	bh=TgK016C/w5t6JQKrQP4E8mcD6V8oPi/S+UCWzSu2Rbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djQMSkkoGjtLgUNe6JiG+uUbjTG+u7ie7eym1Qc/s0ITrVmBOvMdk78mSJmK4ub/N
	 BH/UchLawIzBNwHe6rSkOxpgF+9ayCmXUe+Jm7bBi6IIIFDF2HmzCsSA8IKIPjtzYy
	 vqUXL/PRWiYVHhJKMQDXe+LpZ7bDavgxVmYjSYwsV4NqVBdnLJnwgUEnP9jySYJcMj
	 UlvkUii28ef0E+WUplhkuFmFDfhE+PqklMByDsCChsqfuljh2qr6ywU/K+qtnnWyZy
	 aaaXhGNFfTCa6SGlKE6Cz/VqFo4RwngUUKGxQ6a30H5DdMlCF9ksxaqQXcnOfoRwXX
	 NWfU0nIwFHXfw==
Date: Wed, 16 Aug 2023 19:15:53 +0100
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
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 18/36] arm64/gcs: Context switch GCS state for EL0
Message-ID: <28a61b5f-db65-427e-8e92-60dd61549da5@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-18-68cfa37f9069@kernel.org>
 <ZNZUerbrJmzqZzJw@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZNZUerbrJmzqZzJw@arm.com>
X-Cookie: Old soldiers never die.  Young ones do.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_111604_086339_CB3784EB 
X-CRM114-Status: GOOD (  24.79  )
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
Content-Type: multipart/mixed; boundary="===============6826353360510601096=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6826353360510601096==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w/BKAb+ClmJrMdeD"
Content-Disposition: inline


--w/BKAb+ClmJrMdeD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 11, 2023 at 04:32:10PM +0100, Catalin Marinas wrote:
> On Mon, Aug 07, 2023 at 11:00:23PM +0100, Mark Brown wrote:

> > +		gcs_free(current);
> > +		current->thread.gcs_el0_mode = 0;
> > +		write_sysreg_s(0, SYS_GCSCRE0_EL1);
> > +		write_sysreg_s(0, SYS_GCSPR_EL0);
> > +	}
> > +}

> Do we need and isb() or there's one on this path? If it's only EL0
> making use of this register, we should be fine with the ERET before
> returning to user. Not sure whether the kernel uses this, GCSSTTR
> doesn't need it.

They're only used by EL0, at EL1 we do read GCSPR for signal handling
but AIUI that shouldn't be any more of an issue than it is for the
TPIDRs which we don't have a barrier for.  It's possible I'm
misunderstanding though.

> > +	/*
> > +	 * Ensure that GCS changes are observable by/from other PEs in
> > +	 * case of migration.
> > +	 */
> > +	if (task_gcs_el0_enabled(current) || task_gcs_el0_enabled(next))
> > +		gcsb_dsync();

> What's this barrier for? The spec (at least the version I have) only
> talks about accesses, nothing to do with the registers that we context
> switch here.

Right, it's for the GCS memory rather than the registers.  I'm fairly
sure it's excessive but but was erring on the side of caution until I
have convinced myself that the interactions between GCS barriers and
regular barriers were doing the right thing, until we have physical
implementations to contend with I'd guess the practical impact will be
minimal.

--w/BKAb+ClmJrMdeD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTdElkACgkQJNaLcl1U
h9AWogf/YEdfvtUHD2e4VQoupNYTIQwE4lzBKY5h7rikxnt03b6khOwEnmScy/XC
1TB3W5zmAGwyJdWCumepeAk5BTRzsKZWV9cdvP0YvcmTlzMqj/1ueNfpHfEu0NQs
Udxb7QLhxyd8wdlIZn+ycumv7YnckO8stcBNRbenMRsLqKpTsXlM3zcsul9zvSPK
zWPmyj/57XvYpeEmXgL+2zyLRmGfWEQB97ImfCgO0EkoAxFA6TUugdIAa6g0DWoO
hZKEu0+mqQUN0RTXOLAqYQXJLGD2lVzT5G3L8HTPyR2GNZIruqNzD+8ZkhSSMm51
QjFuF+aVfUlZwpNuSsl7bhqHNJmB5w==
=8c8E
-----END PGP SIGNATURE-----

--w/BKAb+ClmJrMdeD--


--===============6826353360510601096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6826353360510601096==--

