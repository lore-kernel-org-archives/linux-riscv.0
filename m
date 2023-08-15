Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97945C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 23:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFZ1IrSYeuKcDIYElXoks+3WMuWQFqb1wj+jAr016zA=; b=Bso7NufYoX9XhXouYVSSkR++ML
	Yic/yhS3LFQQzRCnf47Duh59O1d5p1bxEVUHnUFPSHIhyYQXRLEi8/IhWLA+bstqKNPmf7cx825s+
	c6ZkFVYy3K9N9jH6dpVvv21VtfqAx/XVo9mdVTAEBgAFRxHr9+l0QB+uYo7paOhelP7U2ZBBsaA0G
	TGb73O49wxVYNNmJuWEBfM7RFgIP5sNPVFRYUjw0mWIg79wWs0EplRgvCjR5uz7mD3NJrBgCnQijA
	3dGkTUu2gu9A82RQDlNJXiqCw4YoOVjpyJA+ASx1lCLhZ4nIQYRSAyvlKkhxNk7uHmALTjzSeczfr
	m+LKKVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW3s5-002phw-2E;
	Tue, 15 Aug 2023 23:54:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW3s1-002ph6-2b;
	Tue, 15 Aug 2023 23:54:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F033860EDF;
	Tue, 15 Aug 2023 23:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CCBC433C8;
	Tue, 15 Aug 2023 23:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692143680;
	bh=n6eEACiqimpPB7PLvfd+oUPFPVhzIcPuBLC1dr7dvkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DxIy5vbUapbtWP3sld3mWYjZBRmjMrNODKGFDnO97nPi0kw+utGl7YhSUxRcSA55j
	 bgF8O8udbd4TU+m5lMdm4Tq8mz2Iji+2duH30c7Uih+GPjDtxMtERbEdC1HkZkRbV1
	 vhFKi5KpL9sjgdjBtwcn8MOqnv66AJbhzBkjh1oYLzW8TtTXJwoSBhyLhul3VdRwcO
	 1WhbPKDlq0Tm06lqfY+xHm0muT2Lor4Y/lV59laZCZRREuOI6SYgQstfXcPOumpgOw
	 HGCLOk+Rs8gWd4G0xWygKex2ny89KElnHHwFax3NDVcmPkRCbi5eOwwkFR7OjQVK7e
	 9jsYzSH7oiqSw==
Date: Wed, 16 Aug 2023 00:54:30 +0100
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
Subject: Re: [PATCH v4 17/36] arm64/mm: Handle GCS data aborts
Message-ID: <752f9f06-69e3-4e60-94ca-49cacb1122ff@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-17-68cfa37f9069@kernel.org>
 <ZNZPLTky6IZ47n4l@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZNZPLTky6IZ47n4l@arm.com>
X-Cookie: Darth Vader sleeps with a Teddywookie.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_165441_957421_4D20DB5B 
X-CRM114-Status: GOOD (  25.94  )
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
Content-Type: multipart/mixed; boundary="===============6250529075431241459=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6250529075431241459==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bU0eg43A83FLgDHm"
Content-Disposition: inline


--bU0eg43A83FLgDHm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 04:09:33PM +0100, Catalin Marinas wrote:
> On Mon, Aug 07, 2023 at 11:00:22PM +0100, Mark Brown wrote:

> > +		if (is_write_abort(esr) &&
> > +		    !(is_gcs_fault(esr) || is_el1_data_abort(esr)))
> > +			return VM_FAULT_BADACCESS;

> Related to my PIE permissions comment: when do we have a valid EL1 data
> write abort that's not a GCS fault? Does a faulting GCSSTTR set the
> ESR_ELx_GCS bit?

Yes, it should do.  The GCS instructions have access descriptors created
with CreateAccDescGCS() which results in the access being flagged as a
GCS access.

> > +	} else {
> > +		/*
> > +		 * GCS faults should never happen for pages that are
> > +		 * not part of a GCS and the operation being attempted
> > +		 * can never succeed.
> > +		 */
> > +		if (is_gcs_fault(esr))
> > +			return VM_FAULT_BADACCESS;

> If one does a GCS push/store to a non-GCS page, do we get a GCS fault or
> something else? I couldn't figure out from the engineering spec. If the
> hardware doesn't generate such exceptions, we might as well remove this
> 'else' branch. But maybe it does generate a GCS-specific fault as you
> added a similar check in is_invalid_el0_gcs_access().

Yes, see AddGCSRecord() and LoadCheckGCSRecord() - all GCS initiated
accesses need to be AccDescGCS so appropriate permissions enforcement
can happen and that's what causes the fault to be flagged as GCS.

> > @@ -595,6 +644,19 @@ static int __kprobes do_page_fault(unsigned long f=
ar, unsigned long esr,
> >  	if (!vma)
> >  		goto lock_mmap;
> > =20
> > +	/*
> > +	 * We get legitimate write faults for GCS pages from GCS
> > +	 * operations and from EL1 writes to EL0 pages but just plain

> What are the EL1 writes to the shadow stack? Would it not use
> copy_to_user_gcs()?

They should, yes - I'll reword the comment.

--bU0eg43A83FLgDHm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTcEDYACgkQJNaLcl1U
h9A2rAgAhd1tNqwsfCv0ZnuQlRFZyTwPwFCn76BeqIuV3TYu4Nymed/YLhOECsZ9
H6Fni+Igkf4ckDfRhk742+N6QqLOBZz4ddBTJDV74NJk7EgWWv9srbi10k/thyIT
O/Wz8nVnuUHHXN3dkJIZJQ/l6GjLrzoiskqkrh9ft7HskvTTe1DOL8gFS8Qa5DjS
ut+XhC5VI7HX7iBwhhqw1tEjsQM3ldnl0r/rSd37tFbJbDX6ujuMlgpBKReSH8qV
kfrNbgpcBoxaKvE/rytuAXTIS2oqh/1yHuWi8ujBlZgGf8Vo7OK0alzL8T+oIEaQ
92UJwq3fW51GVCMDxbeaCh1vD7hrKg==
=cuH7
-----END PGP SIGNATURE-----

--bU0eg43A83FLgDHm--


--===============6250529075431241459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6250529075431241459==--

