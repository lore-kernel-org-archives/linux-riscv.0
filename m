Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FFDCF34B2
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fi8A58QXX1w7G+yX6z1T9x7xdaaCFq+RfprAy7qePIU=; b=qy9VjMXmqeqL0uDkqcBOcIrdH6
	zL0TyLcHg4SSmKd5IPwNIDXVwlnXBnUmZiYWaRSr+WhB+J2vQvZkBAVCcRdEmrribk9mpqPM3LBvi
	qFpu/8N2xHWW+DtE345amcTWP1FhjESM2bzZVe3v4GuDRCUeDasWmhuXDXuePPVi+DZc50uN9firH
	SIXIRwUNTp8e8bEuMmIkStHgHbwvXoWK3yLKs4+serWkyjd7eclnWTOuPYlMnZegNTSMQrm3gLjsk
	5Afh+Z0ncILkctNPT+Ds126BiUSelbCW9fCoFSdZYVFOPJx3PpuxZO5CxfaIVqQbKY4tZHThLTvqt
	bvHhFujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swOH6-00000009j05-1zuH;
	Thu, 03 Oct 2024 16:01:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swNAV-00000009Sjn-0y9J;
	Thu, 03 Oct 2024 14:51:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92B8DA43F2F;
	Thu,  3 Oct 2024 14:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E93DC4CEC5;
	Thu,  3 Oct 2024 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727967061;
	bh=84mxqz11Cs3IrhMMq/BoLGimGyYEOQcc4TuOpIDegpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SozEYIMNfQdA08ap8zdn8koBK0e5WTFzbIvCrwSxzNz2okoVA4Jx2ISGiwZcQMrUP
	 /TLWP6uF2cb6g0RNpjG4GheIE3lAb32d74kKnEgOKsiDOPJe0zDlVAmWLdr2dGh8lk
	 U9TRTmA/9PqNPDvOaDo7Szldk08hT7tOyKoM0RvAYRBqtvmtNRpoEhRJ1vTST8kSbp
	 8kePx2BdLGQOLdH2pvbKe5TaKxhNT1zvBzqboN5sDp6/ze1cLtrOXfBr55ZZAuxDw0
	 xK/xXsog4yA9O6+RT0K+o4ID+cG6v8tIPPKVpIDa0N4xb6B6bS3JHGF5xok5wdLF1A
	 +oqqmKo+tGMiw==
Date: Thu, 3 Oct 2024 15:50:47 +0100
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
	David Spickett <david.spickett@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 16/40] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <1ec14d13-7db6-4642-a14b-db8ae362e594@sirena.org.uk>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
 <20241001-arm64-gcs-v13-16-222b78d87eee@kernel.org>
 <86bk0373nq.wl-maz@kernel.org>
 <86a5fm7b4i.wl-maz@kernel.org>
 <37fbc082-6bda-46e3-9ee7-9240b41f26fd@sirena.org.uk>
 <868qv6717r.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <868qv6717r.wl-maz@kernel.org>
X-Cookie: I'm into SOFTWARE!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_075103_425677_6D9B6533 
X-CRM114-Status: GOOD (  24.30  )
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
Content-Type: multipart/mixed; boundary="===============6564260823931807416=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6564260823931807416==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hfl6icctJG+FIkDo"
Content-Disposition: inline


--Hfl6icctJG+FIkDo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 02, 2024 at 08:29:28PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > They are, though really they should UNDEF if GCS isn't there (which I
> > had thought was what you were referencing here).  Equally we only have
> > traps for a subset of GCS instructions and it's not like there aren't a
> > whole bunch of untrappable extensions anyway so it's not clear it's
> > worth the effort just for that.

> If the encodings UNDEF when GCS is not implemented (i.e. they are not
> in the NOP space), then all trapable instructions should absolutely
> UNDEF (and yes, it is worth the effort, even if it is only to
> demonstrate that the architecture is sub-par).

Yes, see DDI0487 K.a C5.9.  If you're concerned about being unable to
generate UNDEFs there's a rather large set of existing extensions where
that's not possible, most of the hwcaps in the hwcap selftest that don't
set sigill_reliable but do have a SIGILL generator for a start.

> So I expect the next version to handle traps for GCSPUSHX, GCSPOPX,
> GCSPUSHM, GCSSTR and GCSSTTR when GCS isn't enabled.

OK, I already had that change locally after your first message.

> I'm also pretty sure this is missing some form of sanitisation for
> PSTATE.EXLOCK, and looking at the pseudocode, you seem to be missing
> the handling of that bit on exception injection.

Ah, yes - I think I see the missing exception injection handling in
enter_exception64().  I'm not seeing what you're referencing with
sanitisation though, could you give me some more specific pointers
please?

--Hfl6icctJG+FIkDo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb+r0YACgkQJNaLcl1U
h9CPnwf/RsvoCd86wK5IpYW+I+BQekRext2o88ILr987SA+imxBsKq7L8n9hdvkg
XOQxpyooxGUM9SkA9nuEFp0h5XNzoKf9AgiI+7lypHe0Nr07zzVdh4oq/A5WuiKB
v231xK6ewa2AEAEvwwYxzafSbmn7fU0Cbjg1+ioSRCNWAa5XVA8rEFJX8ND6TVff
pzx8UKtoFPltnc8jZHY/cPDTnXHvugmZiz/FC/9KDy/hCmuTCkYJBstD1zP9g3f0
1e3X2QZ804cZ5n6MGJSpU3ReexcVxbVoXsdiZiV017zmN6qUMnjJnQJ/NknLUWdK
80HXbpm8hN30vdK0zT5J7KSqtxLkzQ==
=8W1g
-----END PGP SIGNATURE-----

--Hfl6icctJG+FIkDo--


--===============6564260823931807416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6564260823931807416==--

