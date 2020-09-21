Return-Path: <SRS0=aYu6=C6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C93C43466
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2020 08:10:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1632085B
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2020 08:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hmfNs0e9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="K5wKwexm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C1632085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ToeEEINbGKhx8oKwSN85rAMJFh6m/HHBr+FgrOje1OM=; b=hmfNs0e90vnspTk9H7GYRzUIB
	MWYTj7vvX/KeR1QLzeE5kAcMKFdjkGKIJecTqxsTFKthbOBFISBMLT/qrzb1CmtdMwwh9KMmuoDzB
	MfvBrY2fWgFAt0qxfV3VMQlAajow3pOXeuu9JcSPPO0UobbO4+8afFsXSM/eJDUw1+r+NWhJn3BC/
	JY4jDX9oBURQRlalfbL5MYiOQ3AvEHOq1d7aVhYQtqcCV+n81X5TdZ03wF4JJd17GLZ99k2cORLri
	F3JmzbkNBfVBcX3ZY8BS08CWE13VtYFdc/rKCcX/l3f8Jup4lz6VSfexOWWcCc+uX6Jr5IyQ6aNpJ
	h0qqVcZJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKGu3-0005dA-Qg; Mon, 21 Sep 2020 08:10:28 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2] helo=ozlabs.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKGrg-0004H9-TW; Mon, 21 Sep 2020 08:08:08 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BvxrN6CR4z9sRf;
 Mon, 21 Sep 2020 18:07:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1600675674;
 bh=iaBdLJOvxyJXfcUEqmY+3Nksf5Jf9xHCFLBtVdF2GM8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K5wKwexmDJAci9TTwYRSQ0w9PM5CiPqAwagC2tcao/hBigyuoMxG1C8D0UmTRvwbU
 EhPScTRFe/siLj3BjXiyv9uIFmQY0S4UmOdPSVysuZGSDahrfPB83W3uawREPQpzd0
 kHld44CU++GsPbN3dC1XVd4QoBpM6Lgj+V1kNNdSetTvjN8TgT8QvRc6F00jrjsQD6
 lDVtnrJaxh5Jw5LEvG/jpEkcuTha5XPYFINClW5XVtzMcKkHT38c4BYivb3A3RLDRr
 JaS6Iuw/LnkzJSYvM742RWyWBJTrmzSqPEqXAqPcsYg8niNwEgDNwWig1CMgfOS4OB
 vkx4v/7kdkZQQ==
Date: Mon, 21 Sep 2020 18:07:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Qian Cai <cai@redhat.com>
Subject: Re: [PATCH v5 0/5] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20200921180748.4f88028d@canb.auug.org.au>
In-Reply-To: <fdd0240c187f974fccc553acea895f638d5e822a.camel@redhat.com>
References: <20200916073539.3552-1-rppt@kernel.org>
 <5d97da4d86db258fdc9b20be3c12588089e17da2.camel@redhat.com>
 <fdd0240c187f974fccc553acea895f638d5e822a.camel@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_040801_373515_2159FD4E 
X-CRM114-Status: GOOD (  22.18  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============5740374878969439228=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5740374878969439228==
Content-Type: multipart/signed; boundary="Sig_/qIGimAfxVKTvCJ+PllFC0A/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qIGimAfxVKTvCJ+PllFC0A/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 18 Sep 2020 14:25:15 -0400 Qian Cai <cai@redhat.com> wrote:
>
> On Thu, 2020-09-17 at 09:27 -0400, Qian Cai wrote:
> > On Wed, 2020-09-16 at 10:35 +0300, Mike Rapoport wrote: =20
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > >=20
> > > This is an implementation of "secret" mappings backed by a file descr=
iptor.=20
> > > I've dropped the boot time reservation patch for now as it is not str=
ictly
> > > required for the basic usage and can be easily added later either wit=
h or
> > > without CMA. =20
> >=20
> > On powerpc: https://gitlab.com/cailca/linux-mm/-/blob/master/powerpc.co=
nfig
> >=20
> > There is a compiling warning from the today's linux-next:
> >=20
> > <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp] =20
>=20
> This should silence the warning:
>=20
> diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
> index a18b47695f55..b7609958ee36 100755
> --- a/scripts/checksyscalls.sh
> +++ b/scripts/checksyscalls.sh
> @@ -40,6 +40,10 @@ cat << EOF
>  #define __IGNORE_setrlimit	/* setrlimit */
>  #endif
> =20
> +#ifndef __ARCH_WANT_MEMFD_SECRET
> +#define __IGNORE_memfd_secret
> +#endif
> +
>  /* Missing flags argument */
>  #define __IGNORE_renameat	/* renameat2 */
>=20

Added to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/qIGimAfxVKTvCJ+PllFC0A/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9oX1QACgkQAVBC80lX
0GwVfQgAho6bGSHnGAjI0IiMmFRLcHM+KMH0XiVgh9bvUjVASl1mVgeIe7v//Oef
uyH9zCWyUFof0EnaT4f5uZctC2pe/qvb7BsEdaSlLUSz4X8J1xLWfdYbdJHMvtYR
WnrFHwGCmEtpImNTTZtXcdDZeliVgq41XGd/h1Z59o6givzPYTtIK59LlOOcZj3y
KIY0ELXUPauFOINBbfRzs0xlB6upYfVrHUdh9/glsrY4wVcEfPhjgFVAk+Ua/4/E
/ksLJ+WeUZxJ/2SOPL5Vm23vZvmSE0fD4krBBiANbBiKShRgJRU21uc/ulEdHh5E
qZjQA6jjcKFGbIbi78Sb6LxIzI/mKQ==
=OfZk
-----END PGP SIGNATURE-----

--Sig_/qIGimAfxVKTvCJ+PllFC0A/--


--===============5740374878969439228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5740374878969439228==--

