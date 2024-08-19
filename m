Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F4AC52D6F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 15:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmRDvq85+WNfnI1Pd2Hn1CSdw8dOJ8YmxM0GZju8W5M=; b=krPqklDxPccWrZjWprdVGF1Rv8
	R58cI6B23/uOu7duB33JAkp7Jgrvd587PmNMr8tUxyxURCi2nwWIjScj3T9ekP6N8HLUQhWDs/0vQ
	HA5nOG0C8H+m5w7kQHL9okaxEXcgR9iSMizHb1Oa0g+dOIXbxjmmy/2FQmc3ntiUzcTa5txoTuEcz
	3WrFbJ1/c+q/ZM3hfEGSBeCWjmVIOLrkTKTiETJM3J2+u6/rEKSgtXl2bqBL+XpHKuEWMYiqcGVsu
	GGxcJr4jqifBHvuWT8ZkYuZqKyYcHT5AXQpPd4O06KjPYRYCl3LitcsuFF+8bno2PwMvhTYJ7g/R9
	bO3GTE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4Zd-000000020CR-1X0j;
	Mon, 19 Aug 2024 15:45:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4Yv-0000000200F-07JF;
	Mon, 19 Aug 2024 15:44:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FD0860C6E;
	Mon, 19 Aug 2024 15:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65FAC32782;
	Mon, 19 Aug 2024 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724082292;
	bh=9K0lJYsHQSHszMJjX6x7fDt2250JGt/1bnUzF/FZPSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrEBxu+g3W/W+F6pOwBR+ng5/r6bUlowypNEQ5XHXHVtCPf0wKbvU4xTgMe9Qetd9
	 CpxBjhrcQP82vY34DM/oKUpHXTPk2KEebrCDA3E0dMchzEiyt0dca2ruZpP+KvX71Q
	 NwDog8RMhIViPcZETR41MbRx0xKj/jUc44DG9evJ+m9HP5CRKyjS+M7TufOKn5ciyF
	 3LWI3TU1CsuCqWTWGOZMfOVKsxB+FXtrKuo0wgw6hyF8PRTBVcGrH8B1mD03k5dX2L
	 VBG1R7OT29miF6OIF7EC+xeskwwWxFN4tCku3j084T6J6hzY96a0cH2CTJ6UGJaAvl
	 yKUaOabpdi6/A==
Date: Mon, 19 Aug 2024 16:44:42 +0100
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
Subject: Re: [PATCH v10 19/40] arm64/gcs: Context switch GCS state for EL0
Message-ID: <0f6fd3ec-2481-4507-af0e-3cbbb7406b54@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-19-699e2bd2190b@kernel.org>
 <ZsMwhdmE_Ai9BbM9@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsMwhdmE_Ai9BbM9@arm.com>
X-Cookie: Interchangeable parts won't.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_084453_172137_C259342C 
X-CRM114-Status: GOOD (  26.33  )
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
Content-Type: multipart/mixed; boundary="===============2719925480615130457=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2719925480615130457==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RY211L+JHDJI/V3D"
Content-Disposition: inline


--RY211L+JHDJI/V3D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 19, 2024 at 12:46:13PM +0100, Catalin Marinas wrote:
> On Thu, Aug 01, 2024 at 01:06:46PM +0100, Mark Brown wrote:

> > +	/*
> > +	 * Ensure that GCS changes are observable by/from other PEs in
> > +	 * case of migration.
> > +	 */
> > +	if (task_gcs_el0_enabled(current) || task_gcs_el0_enabled(next))
> > +		gcsb_dsync();

> Could we do the sysreg writing under this 'if' block? If no app is using
> GCS (which would be the case for a while), it looks like unnecessary
> sysreg accesses.

Yes, that should be fine I think.

> What's the GCSB DSYNC supposed to do here? The Arm ARM talks about
> ordering between GCS memory effects and other memory effects. I haven't
> looked at the memory model in detail yet (D11.9.1) but AFAICT it has
> nothing to do with the system registers. We'll need this barrier when
> ordering is needed between explicit or implicit (e.g. BL) GCS accesses
> and the explicit classic memory accesses. Paging comes to mind, so maybe
> flush_dcache_page() would need this barrier. ptrace() is another case if
> the memory accessed is a GCS page. I can see you added it in other
> places, I'll have a look as I go through the rest. But I don't think one
> is needed here.

It's not particuarly for the system registers, is there's so that
anything else that looks at the task's GCS sees the current state.  I'm
pretty confident this excessive, the goal was to err on the side of
correctness and then relax later.

--RY211L+JHDJI/V3D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbDaGkACgkQJNaLcl1U
h9BvXwf/RQT11d03bUvuvD6MuYImODPR+T57Yc5/4X0OndD0EPF5k5PWbkvH//Tw
ZLgMt2oTPhRGxuAsNqSI3SJndV6cvgGv2BgT8L/c48ftU6TrvwdLiFuEXY6wzpTu
NcL4WCQ/1U9z74jPkVSAAyyLyhHkjXyzlnlweiOH2IiBaUtoJrq7TcRjAjChMRLG
noxrNAXiLahjU8QUP1bvQeMrCGWdz4TT/sCHjf8Gwo9kySFe8KOcFH56x4FHt+J4
xktf7O8cR+W41/Y+T2xSadecOHrdXU8fW2X/6o5252Ims33XJpYsyrzDV42nzv1T
gKlZCm6EGCD0AKemQ2JTc3fuppNpzw==
=ff4l
-----END PGP SIGNATURE-----

--RY211L+JHDJI/V3D--


--===============2719925480615130457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2719925480615130457==--

