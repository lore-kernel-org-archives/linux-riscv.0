Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEF7C531DF
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 15:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pn6ofwWGvT71vVx+NMr+qfGoSBKcPcqCD8OxixtPAwc=; b=PuGVc1kxq3zaC/JK99rr5A3rCi
	Z8T0as8CLx6ELHR/J52PHBeoqztC4Vi4vYQ38q5PXgKJBl1UCNHSG9deAr+SqmMVJsh8SH8KMpdhb
	7+7YDokHH/Nd/qzZsSnfffRNJl26KOcMcUPynt7qppiNvRhVkilPgymc+fbCv/td0SqPT9dVLZYMl
	Fbfij7NHvCZzak7NUYCr0sdG/yIQhpMFSDpWyAdXL8GGllS0R72hAkPZW/+05N79WIRDMWBi8SJQe
	P3VNf7dg1pycvoavXpxJK3z3BfiXmYEtIWcclNSbsMnW+3zRgOFAv2tueHvJUWne9fU1dd7ZgFW0D
	X8SgTDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQp9-00000005qIE-0FHc;
	Tue, 20 Aug 2024 15:31:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQmj-00000005pRR-03vT;
	Tue, 20 Aug 2024 15:28:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A90BCE0B61;
	Tue, 20 Aug 2024 15:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A68C4AF15;
	Tue, 20 Aug 2024 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724167711;
	bh=xOjQogCtboiaDEhhAKTxRH8bKSHT1uounx3l9TGETkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUHjXyZ2cuMRwBZU5drzIzAGHafYcOZVbd1dCQIvRqjL+mp8tIA7XyiFy2cCb1lAg
	 shLO3+WN20Pzstfw7TIY2Fm2/7O7P4rPMgRslOFF8FRrg5Tw2W6K9hg6CDeDyr8s2Z
	 dKLgO9QioVdce5HjIPnrHbA9CcZr9rhwfYiWAECOhm3Baxn+aET9P9N/7KW01x8G0S
	 /YxbQ0SJf9JMPYzBsRG29MU+0Jcbf2gF1OwWZVEZ7C4nAiUP1XjAknZZ1nqJiNVWhj
	 kyX3Qc98DJ/Vu/F5kkqrEn7yAsqfSZ1u+3FxpVBchfgoZTJgonBtBTHqFWeoKMXyEt
	 2C+GLM3zIUHtg==
Date: Tue, 20 Aug 2024 16:28:21 +0100
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
Message-ID: <ec999bf5-6273-4a3c-b1df-f8594d7bb228@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-13-699e2bd2190b@kernel.org>
 <ZsMMDNIp6Pkfbg1e@arm.com>
 <d43f8036-cc06-430c-9e9e-b938037fc64c@sirena.org.uk>
 <ZsSvSeE303LGtk4b@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsSvSeE303LGtk4b@arm.com>
X-Cookie: You are false data.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_082837_455984_04DE1704 
X-CRM114-Status: GOOD (  28.05  )
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
Content-Type: multipart/mixed; boundary="===============1833478511862531087=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1833478511862531087==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RmO2vT/CXaa26vbH"
Content-Disposition: inline


--RmO2vT/CXaa26vbH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2024 at 03:59:21PM +0100, Catalin Marinas wrote:
> On Mon, Aug 19, 2024 at 05:33:24PM +0100, Mark Brown wrote:
> > On Mon, Aug 19, 2024 at 10:10:36AM +0100, Catalin Marinas wrote:

> > > At a quick look, do_mmap() seems to always set VM_MAYEXEC but discard it
> > > for non-executable file mmap. Last time I looked (when doing MTE) there
> > > wasn't a way for the arch code to clear specific VM_* flags, only to
> > > validate them. But I think we should just clear VM_MAYEXEC and also
> > > return an error for VM_EXEC in the core do_mmap() if VM_SHADOW_STACK. It
> > > would cover the other architectures doing shadow stacks.

> > Yes, I think adding something generic would make sense here.  That feels
> > like a cleanup which could be split out?

> It can be done separately. It doesn't look like x86 has such checks.
> Adding it generically would be a slight ABI tightening but I doubt it
> matters, no sane software would use an executable shadow stack.

OK.

> > > Is there any arch restriction with setting BTI and GCS? It doesn't make
> > > sense but curious if it matters. We block the exec permission anyway
> > > (unless the BTI pages moved to PIE as well, I don't remember).

> > As you say BTI should be meaningless for a non-executable page like GCS,
> > I'm not aware of any way in which it matters.  BTI is separate to PIE.

> My thoughts were whether we can get rid of this hunk entirely by
> handling it in the core code. We'd allow BTI if one wants such useless
> combination but clear VM_MAYEXEC in the core code (and ignore VM_SHARED
> since you can't set it anyway).

I have to admit that the BTI because I was shoving _EXEC in there rather
than because it specifically needed to be blocked.  So change the check
for VM_SHARED to a VM_WARN_ON(), and leave the _EXEC check for now
pending the above core change?

--RmO2vT/CXaa26vbH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbEthQACgkQJNaLcl1U
h9C1gwf+L79Si923x11LZKfwuy0dQkE7LpTPSafOEhNGVDQZTOrYQW9x1homrSt5
28vBitZZV/TtBmLO+HSzt1fq5JM76Q0BaPH3ngunEJ0umUMkZwC3r59YzFHNXhQL
THzCh+B05luDGr58Ay6K29M/I8JVGiXNBd+Ag+/LYQTq2HXOPC7lJimbZAU0aS+Q
mV43kq/p+Ipazr6Bymd4tGQI5HjdMgMp2dhKT0bLH06aGJhif8691f8t9ZTp4lGX
1PqWpOuyg0qYDA8JAraUHsc+4FaMyygUqV1ZRC+aTjL/EVsIFwhvqeZzESS+C+/p
C9zocGnFLEdepXWg3jQHODDOF+LxiQ==
=8nDO
-----END PGP SIGNATURE-----

--RmO2vT/CXaa26vbH--


--===============1833478511862531087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1833478511862531087==--

