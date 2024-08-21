Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30B7C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 18:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrqC6t+Gq/5ByASNjMwMA2XnwaP/YyeiajzvrPsWdfM=; b=dPpY9YXe+S2TDbhgyPlRmPGNJS
	WGEEWzj49V6+jZabDzYM2DAtwe4Ft+ZwP1qF8yOtQfCSBRZhNTiuZS5w+glfWtG3m/ztv9qx+fu6S
	fQ1kYGceFwc2j4yZJvrv9St0fsSxV6YQtbypLdyhJ5P/VaN7Ry4KoVnn6kc+N7qmFuhE476SVZa+z
	e0383RLey7qolmGHvMlthTf2Q/BxdHsGXdTNQxY6WTbmSF1OnBqmCeO9I8HqCC3LilikZ/3jCQ0bX
	Vvdvi5lUa3biiMcJAwXN59dVOETOv437zLT/ypiToXbLVclbHVkXjXuVSLbb0LQPS6UolnJZbCaHJ
	8Q1SeeEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgq4l-0000000A4Bb-48NQ;
	Wed, 21 Aug 2024 18:28:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgq41-0000000A3xi-3Gza;
	Wed, 21 Aug 2024 18:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61D7660FFA;
	Wed, 21 Aug 2024 18:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA21CC32781;
	Wed, 21 Aug 2024 18:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724264888;
	bh=33baSij/lfUz4rEbu0DhfDZckukmuW2FH61KazHkxLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aTYagprEzcz2g3EIW4SxspQ7iO18F5DjDWUNZgvbFQBngLuxfa6dpeP9T9dw7WcuL
	 wATPmQQbugIpTAh+yu8sQl3uSAiFbniz7t3a2VnwftqkWda+6Ps2U60RXXCERSDZKk
	 2G5yackwgc9NzDJc7QB/noWi9xSl7fY6yumKqreAng88x0/HI5LN6dTxOu0JwDYf32
	 p3tyUuzRIkNq5iNeYht0PNQ+RGraYbbe95MRQSJXxDFqT1bsLDmzRKGdCcZTHGY5YK
	 AJQoS+KuBojRbSang2TOeLaRZyoOISyOl2kL2kBHWHcU8AvSgrttUrgRRyzQGIPGaq
	 KzW+H6ExR6s6Q==
Date: Wed, 21 Aug 2024 19:27:53 +0100
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
Subject: Re: [PATCH v10 25/40] arm64/ptrace: Expose GCS via ptrace and core
 files
Message-ID: <58ee01de-88a6-4d0c-845a-3d5bebc0c55c@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-25-699e2bd2190b@kernel.org>
 <ZsYqfJ3V_-ljqlwq@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsYqfJ3V_-ljqlwq@arm.com>
X-Cookie: You are false data.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_112809_976518_3293FC58 
X-CRM114-Status: GOOD (  28.15  )
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
Content-Type: multipart/mixed; boundary="===============5437994418479236745=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5437994418479236745==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XTSIK84UC9+qnNMX"
Content-Disposition: inline


--XTSIK84UC9+qnNMX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2024 at 06:57:16PM +0100, Catalin Marinas wrote:
> On Thu, Aug 01, 2024 at 01:06:52PM +0100, Mark Brown wrote:

> > +	if (user_gcs.features_enabled & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
> > +		return -EINVAL;

> > +	/* Do not allow enable via ptrace */
> > +	if ((user_gcs.features_enabled & PR_SHADOW_STACK_ENABLE) &&
> > +	    !(target->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE))
> > +		return -EBUSY;

> > +	target->thread.gcs_el0_mode = user_gcs.features_enabled;
> > +	target->thread.gcs_el0_locked = user_gcs.features_locked;
> > +	target->thread.gcspr_el0 = user_gcs.gcspr_el0;

> As in the previous thread, I thought we need to restore GCSPR_EL0
> unconditionally.

My thinking here is that if we return an error code then ideally we
shouldn't implement any changes, especially in cases like this one
where we're rejecting inputs that are just invalid.  That seems like the
least surprising outcome and what we should strive for, even if it's too
complicated for some cases.  It is possible to write GCSPR_EL0
regardless of if GCS is enabled, it's just not possible to write it as
part of an otherwise invalid write.  The validation is checking for
unknown features and enables.  With clone3() we could relax the enable
check, but I've just pulled that out of the series for the time being.

> I don't particularly like that this register becomes some scrap one that
> threads can use regardless of GCS. Not sure we have a simple solution.
> We could track three states: GCS never enabled, GCS enabled and GCS
> disabled after being enabled. It's probably not worth it.

Yeah, I did give consideration to that but as you say I think it's
probably not worth it - you end up with a state machine which for the
most part only gets two of the states exercised.

> On ptrace() access to the shadow stack, we rely on the barrier in the
> context switch code if stopping a thread. If other threads are running
> on other CPUs, it's racy anyway even for normal accesses, so I don't
> think we need to do anything more for ptrace.

Yes, I don't see any reason to try to do anything special there.

--XTSIK84UC9+qnNMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbGMagACgkQJNaLcl1U
h9Db9wf/YDOH2BjzBXwu0lqzdwn2i+txsrhK+t+d9GX2VzQ6TRQJVseEw3ZiryNO
J1DTR+iMp5FlHiA+dBqzqZs6Fm09BlHVaMuawV056J8O9fcpyhzG+xMMxoPyAika
UeVQkZEUvs2eE76O+txWVhVwfLbKWAspcwflXBcFPVd8iT3yQxAgcS4k/h40zC3M
h96mx+doBNKP+V9QlLlcLMiSsPS6VVN6PGE36A1uHbJWx03Kg133qsB+hzBPC8DU
mJUnsZprHcbNVOYMJa/HMExbUltPGbuN61YzZvRT3mXkX/eykU2RkhITaZ7p8H8m
SUu+YRFrKXGRJYWTXtUkcFtUO90vrA==
=5j94
-----END PGP SIGNATURE-----

--XTSIK84UC9+qnNMX--


--===============5437994418479236745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5437994418479236745==--

