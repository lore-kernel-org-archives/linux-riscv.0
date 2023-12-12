Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C68C4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 20:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJHCpLVbT/qFEGiiICQzWw38yG91a6mQQ1U+X1CP5/o=; b=JTixyCKfKktsJh/YVWkJkgk4Vy
	LNI0BBXHe7lYiYrLl9WTeUYmFJ9bCVqkv91nKM5TKvHPIuVsuc4RTh2s/OMMgDFciNXmgPy9Osa33
	Y3JtGOInTglX0c4XiogvCTAUx0dW3aaRwUDamT4Qn5Jf1ZxeSRRPABGgWKDbJfm2E1kPaHdf2Wdqc
	P7Y28MMqiewpcmZEaxPcWzkfDfCxWABTCHIK8ooHI0qf+C+1VZxIkjs2i2sU+g/Gb3L7M35B3l3+b
	1k9i0XHdTPCzUb+lfE4IBlhme16Sqqo97Wi10GuNy/BHlLYnf2GhnbKeTHN2i4f2Gwpy45/RvTyna
	4bThVKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD9Kt-00Chgq-0C;
	Tue, 12 Dec 2023 20:26:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD9Kp-00Chey-1x;
	Tue, 12 Dec 2023 20:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 444C0CE1997;
	Tue, 12 Dec 2023 20:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C190EC433C7;
	Tue, 12 Dec 2023 20:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702412785;
	bh=ITS9iepxKmDBteakc9JcBmcwe4qkWaGAUfkgjLJxKz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QK3xwh7/RovgLawsgEE27tFvsEmWXv9zo7z8pvLyL07K+1LB60nrenIjCvuljOe6O
	 41c/d6u9DpvjRjFbkGD3P7jmXStQB53cqmZKdEcnFfWLpGUOCj6vXd8lnyrF285YBk
	 lVETctoAeX57YmnxNLRbavEXKvRsDBaDhwBiBYye6h5MN+tCnF67DNpZdysaYny5kM
	 t6INZGptEmFHhK3ZOTufikrTYp0MGbYMADqUFNtympWn8LwrjrDYUNKzFAW2JmdTUH
	 jSwlGihfJo7Y1K458B8sp76wN0x2qFUaS7cUbWtzteUthuknj5NGIFYj3sBiBRZ0Ms
	 PcHfkNUJGI2Qg==
Date: Tue, 12 Dec 2023 20:26:15 +0000
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "ardb@kernel.org" <ardb@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 02/39] prctl: arch-agnostic prctl for shadow stack
Message-ID: <28c584ff-ef25-464f-852c-c5ddf66e5906@sirena.org.uk>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-2-201c483bd775@kernel.org>
 <e1362732ba86990b7707d3f5b785358b77c5f896.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <e1362732ba86990b7707d3f5b785358b77c5f896.camel@intel.com>
X-Cookie: If rash develops, discontinue use.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_122631_998874_054038B6 
X-CRM114-Status: GOOD (  14.18  )
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
Content-Type: multipart/mixed; boundary="===============0560742774556625182=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0560742774556625182==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LPMEijolhyLOy67U"
Content-Disposition: inline


--LPMEijolhyLOy67U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 12, 2023 at 08:17:09PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2023-11-22 at 09:42 +0000, Mark Brown wrote:

> > These features are expected to be inherited by new threads and
> > cleared
> > on exec(), unknown features should be rejected for enable but
> > accepted
> > for locking (in order to allow for future proofing).

> The reason why I stuck with arch_prctl when this came up is that CRIU
> (and probably other ptracers) needs a way to unlock via ptrace. ptrace
> arch_prctl() can do this. Did you have a plan for unlocking via ptrace?

The set of locked features is read/write via ptrace in my arm64 series,
that's architecture specific unfortunately but that seems to be the way
with ptrace.

In general if things have a need to get at prctl()s via ptrace we should
just fix that, at least for arm64 there's things like the vector lengths
that are currently controlled via prctl(), but it shouldn't be a blocker
for the locking specifically.

--LPMEijolhyLOy67U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV4weYACgkQJNaLcl1U
h9BRvwf/S9so8PzoqYCQJHpoRcvkwkq4+soyG3JSVYBAX+IsKPFGhH92O4Zp5DZJ
aASTrqwmW/PsW8TX8LOC1w1a2OadrpSIa4r8kxsWZWdzkg6OHWcZ/XlhGe4a1yMF
kUw36Z5PIqQRf02YHLYdelHq6/xswjma9YcOb5iVB0TZAL5mQw/2CHXr4ahGlAFr
Pj4wVYIkXRohUP6gR04RuD61bfD4WIFneYjIjzPYYYo9yxWSiiOrpO/MD1Jb7bQe
BaUHpGEsUZysAGRWxVvg+6v85VbHn/PYX8xT5xk9AmfYP8KM8HaClCKtzVBg//10
a9fZcXajnHu4O2S5h6Jsn5IYnbwpcg==
=ln+K
-----END PGP SIGNATURE-----

--LPMEijolhyLOy67U--


--===============0560742774556625182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0560742774556625182==--

