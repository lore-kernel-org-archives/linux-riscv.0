Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A83EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EUrMLwEWCDOjeUxCAATmF9QJHlaK9xTeWjU2C98ZzI=; b=zG0Svoc89C09QdNgV/GpyiOaDO
	pivfa0ANVCfDY4V5cPOyI/Dsn9FdDqY6iyy07Lz/Sqqn9qk6GlHITrgkExSf6q+VjQhfgT+lvDKOP
	8bTPs2uzFXdKSdZ6ODwFHScfNXDUgnm5onY4ftF8VY7GSYqI6VGZjenwh4yJ98OVD4TPU0qtwXKYG
	ejZZcGNLWhvcUxG1IAJFvNh7xMCBP3Sv2eOP7QZ7bWl35jUoUn/ucXDZBBoQLBeN5mdgTa1O/Qx8o
	/mwT4EZOXF+YT9EV/sII5OtqCT4oQEXeH8kS8kDEL/mEu2aq8SdZpdkNcCLKTYN56LnsNQcV9HkdL
	PsBVEl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5Kl-00000002BzO-31kH;
	Mon, 19 Aug 2024 16:34:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5K4-00000002BqS-3XN8;
	Mon, 19 Aug 2024 16:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EB5AACE09EC;
	Mon, 19 Aug 2024 16:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21E0C32782;
	Mon, 19 Aug 2024 16:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724085214;
	bh=evii6L2sZLuBZsDeVmQaiukOZYaMAFg0RqLOntPinT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p/Xaqf57XaWAVesDIXzLwFNmcsGpxCWxCiEl8e7wqsfX6gbZTVZaibIjtofHP+HQy
	 mNkfUOElC8Ed0VjXXvNq9aoGwmAtJUoqRfPxjW6pG4WzPvDPwk2E/ohMtDCdY0XuRP
	 7k9QW/RaYwIiYXeuG0zIRmMObdLvwZzA0wsODoXlGTOLMwINsKdtHKc+TgwAqr4ZO9
	 DbshXmifSQvXAnQSw7yxsDdm+PnnWXUw62cMAbR8DWLupzNOAJI8jMLgI1UYKzU84R
	 zNfPjPPoV8e0rLVIwnBnTaZ7upD0UC+dpiqjmwOqR5FFGfmA4YvEC6JEHoxtzdMqKk
	 RiCeykpYkKbQA==
Date: Mon, 19 Aug 2024 17:33:24 +0100
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
Subject: Re: [PATCH v10 13/40] arm64/mm: Map pages for guarded control stack
Message-ID: <d43f8036-cc06-430c-9e9e-b938037fc64c@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-13-699e2bd2190b@kernel.org>
 <ZsMMDNIp6Pkfbg1e@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsMMDNIp6Pkfbg1e@arm.com>
X-Cookie: Interchangeable parts won't.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_093337_255433_E32859A5 
X-CRM114-Status: GOOD (  26.11  )
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
Content-Type: multipart/mixed; boundary="===============3350928018690150350=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3350928018690150350==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eyTciqf51C2CbNXu"
Content-Disposition: inline


--eyTciqf51C2CbNXu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 19, 2024 at 10:10:36AM +0100, Catalin Marinas wrote:
> On Thu, Aug 01, 2024 at 01:06:40PM +0100, Mark Brown wrote:

> > +	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
> > +		/*
> > +		 * An executable GCS isn't a good idea, and the mm
> > +		 * core can't cope with a shared GCS.
> > +		 */
> > +		if (vm_flags & (VM_EXEC | VM_ARM64_BTI | VM_SHARED))
> > +			return false;
> > +	}

> I wonder whether we should clear VM_MAYEXEC early on during the vma
> creation. This way the mprotect() case will be handled in the core code.
> At a quick look, do_mmap() seems to always set VM_MAYEXEC but discard it
> for non-executable file mmap. Last time I looked (when doing MTE) there
> wasn't a way for the arch code to clear specific VM_* flags, only to
> validate them. But I think we should just clear VM_MAYEXEC and also
> return an error for VM_EXEC in the core do_mmap() if VM_SHADOW_STACK. It
> would cover the other architectures doing shadow stacks.

Yes, I think adding something generic would make sense here.  That feels
like a cleanup which could be split out?

> Regarding VM_SHARED, how do we even end up with this via the
> map_shadow_stack() syscall? I can't see how one can pass MAP_SHARED to
> do_mmap() on this path. I'm fine with a VM_WARN_ON() if you want the
> check (and there's no way a user can trigger it).

It's just a defenesive programming thing, I'm not aware of any way in
which it should be possible to trigger this.

> Is there any arch restriction with setting BTI and GCS? It doesn't make
> sense but curious if it matters. We block the exec permission anyway
> (unless the BTI pages moved to PIE as well, I don't remember).

As you say BTI should be meaningless for a non-executable page like GCS,
I'm not aware of any way in which it matters.  BTI is separate to PIE.

--eyTciqf51C2CbNXu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbDc9MACgkQJNaLcl1U
h9DcCAf/aZF31au2O5tCW1iS32zwyPysrbia2QSwmoMPN4cH+zZF6jGKfJP53y/G
CNgaoXcyBX2iypaZnICHU23amdDQeA311XwIhP3tEc32tH2i0LgSO39EGLdA4dqe
j9An/W7fAj/0GD9s5qxLjEUDr8DKmihD4s/yemH3g2xwf/NF2Ya/tFXJWfAcJPNr
rg55UlkNM+WG6bZ21EKnqi/ykDJhHVBdmTEYE7vfyMDjneyhO5oMG6ESXUJFBTd6
JrYRPZb0Cr7QlXE2JRP2yZQG9TzS0WMvsi3TN5T17PRy8WpwtCyfLi3Drj5popSF
K/uduuEHbCFXxkFNmqeaOTGvnX2ozA==
=Qsdz
-----END PGP SIGNATURE-----

--eyTciqf51C2CbNXu--


--===============3350928018690150350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3350928018690150350==--

