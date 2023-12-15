Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B906C35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPkuD6fNXskZTZsJEc2aG/YEfGo8hZg1lix9z63FtPE=; b=AZoR8tZhHVZz1ioKzKqZ9yRPcS
	7U2PhK7t0OoEo/rYukXhPvONxd9QKbFdIhrvRSI+SJQaB6wuFwJO1PkiPthoxWPDIjYYXrdM81WhO
	6DRJb6+dJ23GkAZjNdf5JyhwJaaU80G5egwC0UUyVUtuotzcKC9owhbCp42l18oWkQqPdg4zM70ZA
	iyemfB5dFZ9UNnZd71oQYE0WBZnHIgKy2z2H/w1Cdk+2FSbRuTWYFSpuxCaq322pPGGzfSpT/W743
	3W9oXsYHXAU8uq7KclAc9iuQW3IKM3OEIA8I90V9/lZktHhj7vOhBSBJauoQLyfboTkHgRzuvx1ID
	rpOZOjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9fg-003dms-1X;
	Fri, 15 Dec 2023 15:00:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9fc-003dm1-2H;
	Fri, 15 Dec 2023 15:00:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 16455CE2F45;
	Fri, 15 Dec 2023 15:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CD3C433C8;
	Fri, 15 Dec 2023 14:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702652405;
	bh=422PM3fDIpd8XBwXAF/Vr2Tijy2/V6yIm6WwhsorExQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThF3UUWwGr5c0gG18awOx5DrQRxAPwOOshZh7SWrhMEjGtlJQKezv414UMUQWtogg
	 HnsI2tu59s1B5g7ry0ZQTMiQwmrK95OYjW9JiQ6MubAahf8tnoIGHG4ZF1g5MM51Ho
	 Fuyd5f95QOR67Xo2K1+5IQcrm/42yldE3jy4DNl4ppdU048EmnGGuL8meF1yRhb1Vb
	 LrNl4xg5kA7VxTmTD6d5xMpK4G8SinhZgdQ+byz8MwpizJS6XNp+ezD/RlY5hnqPb5
	 M/qJhGhNwfiuAs4wEKcr3OTh/1Lt7WuUVP/7vAsp3W1EZLiIXddMPg4h2ayPqcPZD9
	 deK0um1LZe7kA==
Date: Fri, 15 Dec 2023 14:59:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
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
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 34/39] kselftest/arm64: Add a GCS test program built
 with the system libc
Message-ID: <485b6454-135c-4dd4-b38e-8fb8a02779cd@sirena.org.uk>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-34-201c483bd775@kernel.org>
 <875y1089i4.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <875y1089i4.fsf@linaro.org>
X-Cookie: PARDON me, am I speaking ENGLISH?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_070009_118036_4B6B1567 
X-CRM114-Status: GOOD (  19.19  )
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
Content-Type: multipart/mixed; boundary="===============7661144526305310630=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7661144526305310630==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M02qk/d68kwsaj1P"
Content-Disposition: inline


--M02qk/d68kwsaj1P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 11:50:11PM -0300, Thiago Jung Bauermann wrote:
> Mark Brown <broonie@kernel.org> writes:

> > +	ret =3D process_vm_writev(child, &local_iov, 1, &remote_iov, 1, 0);
> > +	if (ret =3D=3D -1)
> > +		ksft_print_msg("process_vm_readv() failed: %s (%d)\n",
> > +			       strerror(errno), errno);

> The comment and the error message say "process_vm_readv()", but the
> function actually called is process_vm_writev(). Is this intended?

No, that's a rebasing issue.

> If I swap process_vm_readv() and process_vm_writev(), then the read
> succeeds but the write fails:
>=20
> #  RUN           global.ptrace_read_write ...
> # Child: 1996
> # Child GCSPR 0xffffa7fcffd8, flags 1, locked 0
> # process_vm_writev() failed: Bad address (14)
> # libc-gcs.c:291:ptrace_read_write:Expected ret (-1) =3D=3D sizeof(rval) =
(8)
> # libc-gcs.c:293:ptrace_read_write:Expected val (281473500358268) =3D=3D =
ptrace(PTRACE_PEEKDATA, child, (void *)gcspr, NULL) (0)
> # ptrace_read_write: Test failed at step #1
> #          FAIL  global.ptrace_read_write
> not ok 4 global.ptrace_read_write

Yeah, I did notice something had happened with the writes but didn't
investigate yet.

> Also, it's strange that the tests defined after map_gcs.stack_overflow
> don't run when I execute this test program. I'm doing:

> $ ./run_kselftest.sh -t arm64:libc-gcs

> I.e., these tests aren't being run in my FVP:

> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, too_small)
> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_1)
> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_2)
> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_3)
> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_4)
> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_5)
> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_6)
> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_7)
> > +TEST_F(map_invalid_gcs, do_map)
> > +FIXTURE_VARIANT_ADD(invalid_mprotect, exec)
> > +FIXTURE_VARIANT_ADD(invalid_mprotect, bti)
> > +FIXTURE_VARIANT_ADD(invalid_mprotect, exec_bti)
> > +TEST_F(invalid_mprotect, do_map)
> > +TEST_F(invalid_mprotect, do_map_read)

I'm seeing all of those appearing.  I'm not sure what to say there -
that's all kselftest framework stuff, I'd expect the framework to say
something about what it's doing if it decides to skip and I can't think
why it would decide to skip.

--M02qk/d68kwsaj1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV8aecACgkQJNaLcl1U
h9Cx7Qf+NstvmUJDmhKZCiSXybEblR3UfKc2ERXjiJRyMZJYWGE59Aqau43rUxYz
4oELXv45Jxb9fBX19Ap6W19TxDrGHMHoCW6fuIiqeTu9L1798R0lJi1TuUxnoX2t
t/s1MqP87pbwKNs60ne9ezvagfQhFFBAYyUepAxrvfPkeUakOwLgsHRwx2bEVsXv
6SsJJ9hRz7N2FvlP487cWfC5VQkyYjefXQHi/1OrZw1hSkS9a5Hb/Y1vBzacFUbS
YDYZszJexTXkcRjAngFzHsCBCakK3xpFB1uRPMhrAOj51UDJHHwE4+nX7DUWZaxT
delEJTYjMd7cGaEpGyDdMnkhQVyM4g==
=fKsW
-----END PGP SIGNATURE-----

--M02qk/d68kwsaj1P--


--===============7661144526305310630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7661144526305310630==--

