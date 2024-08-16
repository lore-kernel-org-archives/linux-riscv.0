Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C297DC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=harOCblanb4JoU2WRITXIWOW3RLMgXkRULeptmmhhcA=; b=KWMtgS2WHiG/s62LII8Wx43E6D
	nXmSm4RZvwqF7IauMlA3vTMSEJFzNadRM892Js3KrYFyKKvFu6FVgVb54Tt10stzD5w+Ki2xEblDh
	MxNgZr7y0vu/Wnhk1tWP7BGObELgmUoxC2tvdWr4nJAv4Vjz47Y3iDBXCFiDjswEAioIV1yqcmaKM
	Ny52dyK0uFanpTsdF+8veddHbgg/4YhCwLqkoB2zEXE0qN2ayoHa/Ri2gkGlzp4+Cz6R7icE4bHLM
	sxgF0pf28y+NPo0KNIabCR6gW3WmVPeJIN5+5o41bQ6OvVJSZwwh9IzCReJ33SRZe9EEIHOD1H+tw
	COmXqkgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sey8x-0000000DF9i-1MuX;
	Fri, 16 Aug 2024 14:41:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sey8G-0000000DF2G-0ipH;
	Fri, 16 Aug 2024 14:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02F586214B;
	Fri, 16 Aug 2024 14:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19210C32782;
	Fri, 16 Aug 2024 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723819246;
	bh=UzDJBf86ETc8UZTa5b4UELQHYAFgRcESJ7jTnyf0ZwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ayq31Px++sqKgYH6KIIEfzP9t8l7YzSD7GuJ5qmVc4DKeok71ex+gt8p6GXQrin0A
	 FMv1eKs/V3igtiQsqzoKNRGY+vydPlJjsnnKO+K1utHrSAE5nJ47/kWP2P3hXvjhOw
	 8vEjWx/dU/C0TnCX962O46QCERiC7GU9AJryrZV+7/2dJDsGItKkMAj7UaHl47sl4W
	 v9sA63+/ybob+fDBXeRr2eiO0MIYZ5vbql1dY6Q5I+ccEVg2igJ9JkeO501cnqMHKH
	 GjTuEJ//TuTnk5PuY4xNxD9ZEeux/z7OctdL2wDddo21XP0TYtjEzdJy6qH/qPzfQc
	 cKnhkuzu5vfhA==
Date: Fri, 16 Aug 2024 15:40:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	linux-riscv@lists.infradead.org, joey.gouly@arm.com
Subject: Re: [PATCH v10 14/40] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <8c1e8fb6-0152-42f7-ab6d-93f6fe70b4aa@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-14-699e2bd2190b@kernel.org>
 <86h6bkzh8o.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <86h6bkzh8o.wl-maz@kernel.org>
X-Cookie: A Smith & Wesson beats four aces.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_074048_324226_D1F64C6A 
X-CRM114-Status: GOOD (  16.49  )
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
Content-Type: multipart/mixed; boundary="===============8093740734778917751=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8093740734778917751==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DUpDdNL7GPA6ROUr"
Content-Disposition: inline


--DUpDdNL7GPA6ROUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 16, 2024 at 03:15:19PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > +	{ SYS_DESC(SYS_GCSCR_EL1), NULL, reset_val, GCSCR_EL1, 0 },
> > +	{ SYS_DESC(SYS_GCSPR_EL1), NULL, reset_unknown, GCSPR_EL1 },
> > +	{ SYS_DESC(SYS_GCSCRE0_EL1), NULL, reset_val, GCSCRE0_EL1, 0 },

> Global visibility for these registers? Why should we expose them to
> userspace if the feature is neither present nor configured?

...

> > +	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, GCS, IMP))
> > +		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nGCS_EL0 |
> > +						HFGxTR_EL2_nGCS_EL1);

> How can this work if you don't handle ID_AA64PFR_EL1 being written to?
> You are exposing GCS to all guests without giving the VMM an
> opportunity to turn it off. This breaks A->B->A migration, which is
> not acceptable.

This was done based on your positive review of the POE series which
follows the same pattern:

   https://lore.kernel.org/linux-arm-kernel/20240503130147.1154804-8-joey.gouly@arm.com/
   https://lore.kernel.org/linux-arm-kernel/864jagmxn7.wl-maz@kernel.org/

in which you didn't note any concerns about the handling for the
sysregs.

If your decisions have changed then you'll need to withdraw your review
there, I'd figured that given the current incompleteness of the
writability conversions and there being a bunch of existing registers
exposed unconditionally you'd decided to defer until some more general
cleanup of the situation.

--DUpDdNL7GPA6ROUr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma/ZOAACgkQJNaLcl1U
h9AqVAf+My4ZnSnvRQhvDgit0vtodchlwobno2H2GE7edIRFmlg3k4goJ7BXcmJp
HS9AzX6BzfrFZrvDxZIfwrvfIp3wCTp95dOSfLGENuWQV7IByIKHIHZdU4DYr/Xt
3xJTwzDiJx19EK8R6usMaaQDarxQ9gozKbteWUt761o+iCKU6SGOvoN+2TkScTkA
jmS+wMgm75FpHNpFm/wUixbuKoldXbagTgo9Wgly4xIW+11Rzpz/btXniVTM07BR
XrnBaW2kdCXjr2C71bZGVBmg14aQCRh72D4xikY8k214GwuzeQbQber+iLP4io82
23ty1aim7XcdSmNPpDiJfoiXcJ1yYw==
=CjJp
-----END PGP SIGNATURE-----

--DUpDdNL7GPA6ROUr--


--===============8093740734778917751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8093740734778917751==--

