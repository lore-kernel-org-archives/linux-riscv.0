Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E72C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 21:31:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92AA120818
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 21:31:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZYxedKTi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oXK1wy7A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92AA120818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B8OxqhmUP5mBlmK5kzbsjvhlk1eig4HcWxNjcGPzF5k=; b=ZYxedKTiOzi54PyFqGj9k1M2Q
	L3YPBAhO7DhZ1svM4uXIfTC6vMs2OsAAXyjFHv3p+zp2soVhH6Zj3ItAmtdeIKB7zMyXOFPmYIWXz
	ym2SutSBou87ub0iZ0SrSHmki4KBOCkbSCw/LeG60Ns5P0hGF/kTSni1kRmH8LQHeabWUZIT6j0ob
	jUDU3/bPegaSo9BO8ZzwwFlL0RjYy8pBQSqwtMmKFyhnB1qLLH4YBLgC7oW5q5kkeUZR0LjMuwy1i
	H3Vh1vSNNIm+wujA+uve0SAoPYFnvYwP6SLxMehsA1kTJVApkQB7LjhLNeAzRLwkJPtB58yCEu9Tr
	XBIqbq6zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLENT-0001vL-Qy; Fri, 09 Nov 2018 21:31:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLENS-0001vE-G2
 for linux-riscv@bombadil.infradead.org; Fri, 09 Nov 2018 21:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xKmAWsuOXv2rD0tniqQ8gfii9VFMAGgErQCznWSMyDw=; b=oXK1wy7Apk5EtBKJ1xeEgnm/Q
 oqiHXjyF/TDzBOgRCnG9cS9ClqkszEbOUFqTYyJ9KM2xfFcsW4sqx8oZaZHehUkX6XKMWrI7DtF0h
 cPEtD/AbkokiBf2dC4zYVUEAxtubIj9kyKd5ycM0oYOwz3CbiVMwK7eV1Yk2YSQW17O0f6sg29qQR
 1LffIdxjUve1WPQPYJ09VJURNEHgGuptsq5+HWb54RGUAmsBQ+0WSLrAE1QCpfVZN1jOgh9hUO2lK
 vyVX6rhwITYQy31UpfzKxOzUqNZ43FnFHXY8Kw1jddjdLNdnwWzYmwBvf72LNYXqOAzuV17uYOYUI
 a86OUYOsg==;
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLENP-0004cW-D1
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 21:31:41 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 7DE4F72CBF9;
 Sat, 10 Nov 2018 00:31:28 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 71F117CD1FF; Sat, 10 Nov 2018 00:31:28 +0300 (MSK)
Date: Sat, 10 Nov 2018 00:31:28 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 12/13] riscv: define syscall_get_arch()
Message-ID: <20181109213128.GA1907@altlinux.org>
Mail-Followup-To: Palmer Dabbelt <palmer@sifive.com>,
 Andy Lutomirski <luto@kernel.org>,
 Elvira Khabirova <lineprinter@altlinux.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Moore <paul@paul-moore.com>,
 Eric Paris <eparis@redhat.com>, linux-riscv@lists.infradead.org,
 linux-audit@redhat.com, linux-kernel@vger.kernel.org
References: <20181109031712.GL21511@altlinux.org>
 <mhng-2fa4cce8-2365-4f36-a07e-5f9ad61cfb88@palmer-si-x1c4>
MIME-Version: 1.0
In-Reply-To: <mhng-2fa4cce8-2365-4f36-a07e-5f9ad61cfb88@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_213139_559629_7E4B35F9 
X-CRM114-Status: GOOD (  24.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Paul Moore <paul@paul-moore.com>,
 linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 Elvira Khabirova <lineprinter@altlinux.org>, Andy Lutomirski <luto@kernel.org>,
 linux-audit@redhat.com, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============9009319570515612172=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109213128.MQi4ufF1bc80BBiuD7R1-n2JgmXZMLf82CJ6Pixu5As@z>


--===============9009319570515612172==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 09, 2018 at 10:45:54AM -0800, Palmer Dabbelt wrote:
> On Thu, 08 Nov 2018 19:17:13 PST (-0800), ldv@altlinux.org wrote:
> > syscall_get_arch() is required to be implemented on all architectures
> > that use tracehook_report_syscall_entry() in order to extend
> > the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
> >
> > Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> > ---
> >  arch/riscv/include/asm/syscall.h | 6 ++++++
> >  include/uapi/linux/audit.h       | 1 +
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/=
syscall.h
> > index 8d25f8904c00..7e1e26ca7317 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -18,6 +18,7 @@
> >  #ifndef _ASM_RISCV_SYSCALL_H
> >  #define _ASM_RISCV_SYSCALL_H
> >
> > +#include <uapi/linux/audit.h>
> >  #include <linux/sched.h>
> >  #include <linux/err.h>
> >
> > @@ -99,4 +100,9 @@ static inline void syscall_set_arguments(struct task=
_struct *task,
> >  	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
> >  }
> >
> > +static inline int syscall_get_arch(void)
> > +{
> > +	return AUDIT_ARCH_RISCV;
> > +}
> > +
> >  #endif	/* _ASM_RISCV_SYSCALL_H */
> > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > index c4c8b131af48..ad4105c602a1 100644
> > --- a/include/uapi/linux/audit.h
> > +++ b/include/uapi/linux/audit.h
> > @@ -405,6 +405,7 @@ enum {
> >  /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
> >  #define AUDIT_ARCH_PPC64	(EM_PPC64|__AUDIT_ARCH_64BIT)
> >  #define AUDIT_ARCH_PPC64LE	(EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_L=
E)
> > +#define AUDIT_ARCH_RISCV	(EM_RISCV|__AUDIT_ARCH_64BIT)
> >  #define AUDIT_ARCH_S390		(EM_S390)
> >  #define AUDIT_ARCH_S390X	(EM_S390|__AUDIT_ARCH_64BIT)
> >  #define AUDIT_ARCH_SH		(EM_SH)
>=20
> I think this is incorrect: EM_RISCV has 32-bit and 64-bit variants, and i=
f I=20
> understand what's going on here this is marking all RISC-V targets as 64-=
bit. =20
> Since this is a userspace header, I think the right thing to switch on is=
=20
> __riscv_xlen, which will be defined to either 32 or 64 depending on the b=
ase=20
> ISA.
> We're also little endian.

OK, it means we need to introduce two different AUDIT_ARCH_ constants
for RISC-V.  Do you have any preferences for their names,
e.g. AUDIT_ARCH_RISCV and AUDIT_ARCH_RISCV64, or
AUDIT_ARCH_RISCV and AUDIT_ARCH_RISCV32, or
AUDIT_ARCH_RISCV64 and AUDIT_ARCH_RISCV32,
or anything else?


--=20
ldv

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJb5fywAAoJEAVFT+BVnCUIr9oQAIvmhFu/M1spBsW47Mz/cNPM
ctjzYjvdEmyj5geJofM71utqHzvGI2mRX/Itd4wEzSXUDze6gFhMVjfS7cHr/icB
o6uMaj43skYZD5UvCvSW70bQAuStMbp5QldwGk5LhImsm+h3OJ2uwIPNtUEKBj40
oEVQ4eMtGmeawf7cPsKiW21NwgvDqkwCpcqWhyQydGVCXZ2B1jWUdKVRwAIrZXjN
TfaIT2t2GIeCyD8NGlYVpPVU5EtwxvXVPHzoe68qhUu7TrPGe18yoVjzOPXZDnqP
SGGzqDUlIxzMRL7wgsyHNnuWJHqu3/c+gHWOgGFxhzuTT7cukP7Mi4blML5p4x7b
R0HRegHeo4m7wiqnfrO19Kn4CmiX6x110O/waozrzO34CxPVIS7IhOlGEXZbCDsZ
pZLRWcjMJw+JUE1MRS3wysWP3ObG2MUCJkb6+PLQ4jTnbmHhq61gT0weNqqVsVPh
iPOKJJbgqP7fkkCnfksAtxyWXqdlqXl7OprGfa1N8allogWPs9N+sWdDKPDpX/oK
xQapRdY1Htf9E+UxBvrdOJRjHPFr66BJZBeT8lrRmEodmJ+MdIXhNdniWj4Dm5SF
in7blMkTLtuJphcZPOzzlkQ8KQBK/aoFaMjdMemaV5Sq0G0LdvVTv+r7bZxjyVlE
yQIco4ytuB+gRaGKt8aM
=5+xK
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--


--===============9009319570515612172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9009319570515612172==--

