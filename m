Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C729C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 18:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PB3kLlJ2NoxzHJSFmkGXnO+/jyAU2Jl6x32YV8KaXIg=; b=p46Nw/wqngKU8DbIeJMFA2GdYT
	NaqNkp5yzEb8D710Q/F+z5MSCpsz7rjScZh8gQSuRxqkGPMZDK2Eu/A1aFyBB1QT9xkLVE5NY5fkh
	OSbDLzSJY/W15aM3w/wyjDfTDt3ooPOKV83kbt8DKE6hlsoeiPWRjKW8+suG/YMjKzQKVKwtL3bwK
	qzneJFcLGoSIOYuxXzrJGy2nWOlU4ewwD8Q9nsR8VzPgSF2tndSuDdRV357qb3YpVsTgMhvOoXP9l
	bbNDNugACeK+HdVpm1ftNIamjCB03rtk7Jd0GqQOilToPHcATqs00XyGetfIHOSxSNf3VIDr8cdq1
	2BAI2Uqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sef58-0000000AkNV-0J8R;
	Thu, 15 Aug 2024 18:20:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sef4S-0000000AkEr-1J7z;
	Thu, 15 Aug 2024 18:19:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3DBB3CE1D14;
	Thu, 15 Aug 2024 18:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDE0C32786;
	Thu, 15 Aug 2024 18:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723745973;
	bh=gvOHdCK9aUdR7DPVLDdBmQ4rCqBdWg1NiIKC9n0vn/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmAPusW9RWevvrm7Hg88q9xewbIsd/N/8xTtQyDPWPc982vMFTh7r29JlLa6aHf0o
	 8io0uPtO83IiC/fkk0GKoQNNWuDUbOcvZAodgohYE/SjWTMQpUBTSbad1t64GFmGyS
	 iVChoroyACoTlO+/w+ZVPqDVFAt/hYnGedb6MWnURMr/r772xCwXH9niKnJdXYUqJX
	 ljF+fG3keMrMEmAZlQBZgeB5qVBYqMTd2O22DXiRYL9ul8f7b5FVTiy0/sBLHu0Gpw
	 9wAE4WmxHy9lFZGd0S9lYGKcP1IFTR4cDZzHAlueePqA4AxAzNcZtdqHVh8a0mF8BL
	 9fI1RwFnauAuw==
Date: Thu, 15 Aug 2024 19:19:24 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"ross.burton@arm.com" <ross.burton@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kees@kernel.org" <kees@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>, "maz@kernel.org" <maz@kernel.org>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"will@kernel.org" <will@kernel.org>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v10 12/40] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
Message-ID: <9949a344-be8e-40ed-b483-02ff95175072@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-12-699e2bd2190b@kernel.org>
 <34f7a5378447b1a8d5a9561594b37cfeaa6bd2b1.camel@intel.com>
 <3a7d9b69-e9df-4271-a3f0-8e8683c2654f@sirena.org.uk>
 <68ec09da-fb4a-4d59-9c8c-6fae4c48ea68@sirena.org.uk>
 <e6c8618a1585006dde44c17192a3bb7ae8ec5c0b.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <e6c8618a1585006dde44c17192a3bb7ae8ec5c0b.camel@intel.com>
X-Cookie: -- Owen Meredith
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_111936_720535_51F63C97 
X-CRM114-Status: GOOD (  18.78  )
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
Content-Type: multipart/mixed; boundary="===============7037996997708079318=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7037996997708079318==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U12vN05f82sjc1Kd"
Content-Disposition: inline


--U12vN05f82sjc1Kd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 05:53:19PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2024-08-15 at 17:39 +0100, Mark Brown wrote:

> > > Oh, thanks for the heads up - I'd missed that.

> > Looking at this I think it makes sense to do as was done for x86 and
> > split this out into a separate series (part of why I'd missed it),
> > updating the generic implementation to do this by default.=A0 That'll
> > touch a bunch of architectures and the series is already quite big,
> > it's not really an ABI impact.

> The series is already upstream. You just need to add an arm version of th=
at
> linked patch. But up to you.

Your series modified the existing x86 custom arch_get_unmapped_area*()
functions, arm64 uses the generic implementation of those so I'd have to
either add custom implementations (which I can't imagine would be met
with great enthusiasm) or update the generic ones.  A generic
implementation seems reasonable and it looks like RISC-V would also end
up using it so while it's a bit invasive it does seem more sensible to
do the change there.

--U12vN05f82sjc1Kd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma+RqsACgkQJNaLcl1U
h9C2ogf/ZUz9M5cZLraiijYr3jTrEMdCaa6D0jRDGoL0IP3BclPhluw29VOQVf4x
aJ10O4eGMRHl32XL0oWXQlmSmjiHfXTvVmeAnPrKkq6Sx8BDI7tOW1f4b64Iyouq
aGNPYw1YjXPdazXxXLbaQVZZOrq5BE2dbXw6ocHaombvt/oG6sAGc4F4KFXwb6+A
OR+jpoND8CbzSxh4EO89eoixTKgqvVZTLfQ3zZBdyjrrk1jyp6Q/63wMC325Bmam
FebFR/NFJlNNAGpnhBbZhme21z1oZ+1h9K6G37zJUsXqqkOnH56fbsfKJ3wGW37B
VjXIsdlILKUDIICvYmo5rxepKRyUqQ==
=DIrs
-----END PGP SIGNATURE-----

--U12vN05f82sjc1Kd--


--===============7037996997708079318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7037996997708079318==--

