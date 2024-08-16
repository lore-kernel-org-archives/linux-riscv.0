Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E035CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 12:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q52S5CfOw54zIsqqEnYFIZXmmUEGM3n+NrlHynLiBRY=; b=pWLqvdcqt3s4nvoQPI2uZs3IXi
	JerN5XbjyhkXzKsLYApwT/LuzYQDV4C3Mgl9R9ffDa5hGKf5M1s3iKTHEvjjlM771MZzCAJrW5OZX
	pWk8lOR/+kxuVEII2Ur4B9pT3HdAAoFlog4PlQiKJRJ9BIGs7ehTm/yzoZNCUM59Mm/H5tx26PPG2
	I1IO7wh5Dy+FDAnhJM6hE89jwYi5T1iweesI/uIHye3Qi3vjGUHe97NDM8lsWy0pBqOiargwoZ89T
	H0MD/bJh1krHuCR2p/BvRcuAcsCT0T/TeLjBHYfX2jEXvf52+hoh7PlFONjm1K1tBo75rbl/GDtMv
	0FDELSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevfu-0000000CpIJ-0oTS;
	Fri, 16 Aug 2024 12:03:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevfF-0000000CpBc-3x3z;
	Fri, 16 Aug 2024 12:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Hndb++5g10Ky2yeNlo2IhKOPctUnOkjSU49TPVxG73c=; b=KaJLbYKp7V+RK2RoKhUoqDpuz0
	MQysq1C6rzn9DHUpYqB7/91wpWYQekvLY0HG1oR0SzFtajtPkE9cZAEAXvYDUtEsEAWWvfsmhgiFs
	9GSF+pFUYDJvxgX2nOm5rU5Zy6BWsze65J9hXkZ3FAqRdms7giPNFUUitYR5iMpOFeDwFy7lXGFu6
	TKszadYAbapkSH47uaiwUVwtFWpJd/t//l/nntgjZa2Kftr83E81j/6hkfYonR0Yy7UuKPPEQ9d4u
	Bd2KBqLJ0qLOcgNjVAzEskkuiYqUAhvezsIgdnftgIog1FVMNa1B48XGwHClmr5Z+tE19QA6phcWp
	F44sPGBg==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevfA-00000008dwF-3qU0;
	Fri, 16 Aug 2024 12:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 06DFDCE1177;
	Fri, 16 Aug 2024 12:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3A6C32782;
	Fri, 16 Aug 2024 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723809752;
	bh=oPeCvIbifLel6Ow5IZxAJAB7Vu3RJACPj3rWPilHCSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lammGcz+t6OGLNs0WJ0Ion4Wo4GhurUkVu9VWiP20uUI84FAGr99BGSEVKLI3fz0A
	 fdGUkReozzGf4aWRVUznXu1+ekkxTAXKX9asXpNuaMQ1tYN4asJdK2ScKq+YtJngv9
	 eBTUzZ6sgM4PJfqhUUEouo3q1afG4J2UT9kK9sHh3i6JTPG7VScNqDMPYJjMiJ/yEb
	 aDHpqxKNlUXj5jxTAw9xe58I5LaYxqrSdwd8JLqUkMgLqODMxadE/yFK1sG8NLIRrS
	 rF0cmj1k6ZNEaPvijrCCoPuA1yH2NQ+PEC7/6R5P2m1BKIliB/yCGa8WCxE1omVOJe
	 vrEUxH6ID2hnA==
Date: Fri, 16 Aug 2024 13:02:22 +0100
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
Subject: Re: [PATCH v10 05/40] arm64/gcs: Document the ABI for Guarded
 Control Stacks
Message-ID: <7c17b28e-a5d1-4113-9580-9501692af513@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-5-699e2bd2190b@kernel.org>
 <Zr8zTTrJ6M0SCvCV@arm.com>
MIME-Version: 1.0
In-Reply-To: <Zr8zTTrJ6M0SCvCV@arm.com>
X-Cookie: A Smith & Wesson beats four aces.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_130238_785689_7504B2A6 
X-CRM114-Status: GOOD (  23.64  )
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
Content-Type: multipart/mixed; boundary="===============1430018490188852185=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1430018490188852185==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p6v+ZIr+kcIsmhYm"
Content-Disposition: inline


--p6v+ZIr+kcIsmhYm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 16, 2024 at 12:09:01PM +0100, Catalin Marinas wrote:
> On Thu, Aug 01, 2024 at 01:06:32PM +0100, Mark Brown wrote:

> > +* EL0 GCS entries with bit 63 set are reserved for use, one such use is defined

> Maybe "reserved for specific uses". The proposed sentenced feels like
> it's missing something.

Actually we removed the usage of bit 63 so I'll just drop this.

> > +* When a new thread is created by a thread which has GCS enabled then a
> > +  new Guarded Control Stack will be allocated for the new thread with
> > +  half the size of the standard stack.

> Is the half size still the case? It also seems a bit inconsistent to
> have RLIMIT_STACK when GCS is enabled and half the stack size when a new
> thread is created.

Yes, this predates the rebase onto clone3() - I'll update.

> [...]
> > +* When a thread is freed the Guarded Control Stack initially allocated for
> > +  that thread will be freed.  Note carefully that if the stack has been
> > +  switched this may not be the stack currently in use by the thread.

> Is this true for shadow stacks explicitly allocated by the user with
> map_shadow_stack()?

It is only true for the stacks allocaeted by the kernel, if we didn't
allocate a stack we don't free it.

> > +* The signal handler will use the same GCS as the interrupted context.

> I assume this is true even with sigaltstack. Not easy to have
> alternative shadow stack without additional ABI.

Yes.

--p6v+ZIr+kcIsmhYm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma/P80ACgkQJNaLcl1U
h9Dfgwf9EHMFRik1mUwmgRytVPWYPFLCBG8YZtDuO0Wxbs78KN6zc8ji2vFJ8lIJ
B1hNUxCH6BOhm+AfFVF3zkoXZn+wjlPnLRGOPJUodgh27zecCwTCrwayO8ncECyf
bIeq0XnjssL7P2A2wNVK0cFXU9W+Gw3OjVUAPUQmdC7lk6w4GwIMnpgQs1Vrueko
IO1qBTeiV0rySxm/x0E14lq3kpX7eAcrBERnR+wfA17R4CtVClV2S1lT8YyUdYl7
n81clFcHhylhTBz7napWIOchWjXqicUT7zqHLPKHMVxutUuuT1Mc+obOdDSUsdcl
8qUKqX887cAFNJNPd+6Nlq+t+MtUZA==
=6lHH
-----END PGP SIGNATURE-----

--p6v+ZIr+kcIsmhYm--


--===============1430018490188852185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1430018490188852185==--

