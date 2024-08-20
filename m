Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94937C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 17:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+Zql+WMlQ344phL06cdMmeYMyB9T3qjI3fgEHVEIak=; b=DOfRFgH1IhfEHKfK39SLIqt596
	/6BAT0rLrG+IjywPRLbE0WU7d7t2CXa/1vFeyOx3NH/EQDElHJQlSk7fbdwTn28ZZOx3Z/sGtgqqy
	CG2U8uoefv55IpfCjEAd1XkUi2eJTyvPxaD7mL75bDm0s3cvWLyxRDkG3NgO4YnkzAZ3+TGGIzyMG
	+rPGZzZujq4W3WAlZ7FwAbysWxqL65yU5z2wg/RQiwHkf7rqb7BUky9Acsz9bsdfPZrpngtsSaI48
	6RVj4KUA8DTMa9O1SsQAHwkYjw+cobtHfkXyt15Y3SqPJ9Fzl29+5o1Oo2JtLJnC0ZRaADrZbcoW5
	Mi5WclSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgT6Y-00000006FTg-3GUV;
	Tue, 20 Aug 2024 17:57:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgT5p-00000006FJY-3L2M;
	Tue, 20 Aug 2024 17:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C44D160E86;
	Tue, 20 Aug 2024 17:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA60CC4AF63;
	Tue, 20 Aug 2024 17:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724176588;
	bh=gZbF78Vf8hQyyvrqZwyllYGTMkZkFUc2boH3xNoj3xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kMBNHgu8QiEUNr6Dj0H9OBOYNtuyoJmzRNKbBHyDLb+AJcBwiuh2LgJrzteoMvVsx
	 5LXnhtvTMAUrTQWGO8C4/3pUWw0n2Ty4gAoWYmAT+yBC5FbQ2efuWgCCm9W086xLv1
	 Zz0YOIynNZ511iDRjmQKgI/z2W0DSwrGpMHtyIFX7gsM+jxsuh0nwza7zZ/cUCLkch
	 5kByC8ltUO3h9EBYmOklMwhN2gyHbUmRzoURFqk+UuCaO0bvG1QT+x0RnLV4jkxDZv
	 rOQIythKgjlcvs2q9paWHNJINWO8TqkFa8qlRlL1CfSG4cDj+KBmcAFn41ujrmw+M5
	 1HSxxSLa5whtA==
Date: Tue, 20 Aug 2024 18:56:19 +0100
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
Message-ID: <3b316422-7f88-4f5d-a691-eb9209ec4ba9@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-19-699e2bd2190b@kernel.org>
 <ZsMwhdmE_Ai9BbM9@arm.com>
 <0f6fd3ec-2481-4507-af0e-3cbbb7406b54@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <0f6fd3ec-2481-4507-af0e-3cbbb7406b54@sirena.org.uk>
X-Cookie: You are false data.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_105629_993680_6A6427F8 
X-CRM114-Status: GOOD (  19.27  )
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
Content-Type: multipart/mixed; boundary="===============9123897092505463495=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9123897092505463495==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3PN7G0mWO4eG7H9j"
Content-Disposition: inline


--3PN7G0mWO4eG7H9j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 19, 2024 at 04:44:52PM +0100, Mark Brown wrote:
> On Mon, Aug 19, 2024 at 12:46:13PM +0100, Catalin Marinas wrote:
> > On Thu, Aug 01, 2024 at 01:06:46PM +0100, Mark Brown wrote:

> > > +	/*
> > > +	 * Ensure that GCS changes are observable by/from other PEs in
> > > +	 * case of migration.
> > > +	 */
> > > +	if (task_gcs_el0_enabled(current) || task_gcs_el0_enabled(next))
> > > +		gcsb_dsync();

> > Could we do the sysreg writing under this 'if' block? If no app is using
> > GCS (which would be the case for a while), it looks like unnecessary
> > sysreg accesses.

> Yes, that should be fine I think.

I forgot when writing the above that we always allow reads from
GCSPR_EL0 in order to avoid corner cases for unwinders in the case of
asynchronous disable.  I'd expect that to be cheap to access though.

--3PN7G0mWO4eG7H9j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbE2MIACgkQJNaLcl1U
h9DGLQf+N5+bf9wgOIIzNX1vkURDnQUEK8nayHI+jFDZJUtCwgCR7dnbVvAybutt
pxS7u/jQBZvRrPuIk4JAvlPy/uRMzwfk9ooJ/US3OA2OmcbLQX+k4cNNxkx4uJiN
XP2g8aMT14h2hwKkusxr8dUCwyB55hTlFvHPsLZQ24dqsLp2FMZOXqIjEhjPth/I
qtq8/NVfk4nBuJ2M9HAMVMTiB9RxjE0dkqvWrD11wiWoD4oxozxMWze93JijR2LZ
2DkwdCLX0oezojVLBNXak0Qyw5JCKP+y1UDdtsLfN2kKyEljQp9lr5+hTUdEjv+N
JBdNzCm5oAI+cdBJ0+S4fqr7zDDDLg==
=Yb1u
-----END PGP SIGNATURE-----

--3PN7G0mWO4eG7H9j--


--===============9123897092505463495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9123897092505463495==--

