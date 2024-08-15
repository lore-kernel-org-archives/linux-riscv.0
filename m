Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E652C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mluNzmG1s5A4BDyopAZg7wdbYjwEa6ik8GyAQjhBh0=; b=lCB9X2+CbL6Mau+AlaQi4uO8EN
	4Mizs8r234OPwAMZYZOPUyM+8QVEjoJVmESFc5BR4Cgiu6lqLgy+ADebhD6L/9pDWPoHAC/NF6i+n
	nDzCnT1rXngdx+ud4EQUGSdKbH4pKk1y76wsK6G0rFy1emFAyJFvfmaxXnuLvQKVOgwGfxVHtPu5f
	59tRzUIsHxfhua4sLk54J/v5eULxANev4Kr2bdwnCXzXzBh2M+f/G+DKr2LvWuDanCjkPKxihC+05
	Fg2GY0LMwkTxfLWduHZmzH+ubKjblrXWtWeGaLL6PdPZzdtlwUXjtWn39lEohvCmDGKtatu6FyTMn
	8rtMvhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secOC-0000000AO1c-3Ft8;
	Thu, 15 Aug 2024 15:27:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secNJ-0000000ANoC-32Pc;
	Thu, 15 Aug 2024 15:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Wv1kQ8mBOvNs2q3MqL2TJnvCXLTai7JxFQflhk6OGQo=; b=Pe7Rr49iJJMzT5LXsMPdKspAMd
	mfXt2urr0/MVcutua5cjAh7ZTdMCmsAzg5I5CcNhEfEYeDTUzN3z50vfK3rT1Ow9PgsLiopQhBt0P
	fM8gkvPGMTVcIySocm1A5ivJUm1F+v24G20o9zTvNrJr0mpX5jTHnrscYnG9MUUVxwRZjyRuJXe9i
	Hb83uAa/5TQU9mI4kTRnoaD6BqVfTRMTziBU+AtYwzpQ9A9aJ1P6qzWVwkWQd+8aUmNvci+aPUY7Z
	QcSO8toD6T9Sepd3/n0hIWWlR+0KHq7Cx4OiBl8i5deLt8Y5CcfipJsMMhlX/6MTKl4q+1wB9WMcT
	bGjtHDJQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secNF-00000008Pal-3uqL;
	Thu, 15 Aug 2024 15:26:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E77661EE6;
	Thu, 15 Aug 2024 15:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714D9C4AF0D;
	Thu, 15 Aug 2024 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723735607;
	bh=Wv1kQ8mBOvNs2q3MqL2TJnvCXLTai7JxFQflhk6OGQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psefFyFwcCSMM704n/PghElOSiJNvILlJNI0F9AWzTMwXrebRp5JcacIDypratT/1
	 0v73e8fN2mho163LqjEJtpaHXOuGAR1msR4cfx917H+frORBPL41NHpr7hKJ52tLV7
	 DDOLTfoES26QUqTBCR6Mi7zHCAZM1FdO91OOgnmLXfhnmLymP+AKnXqRXuJisb/8Hn
	 CaiF+u1pKyKBUNTe8jpwL11FVRnO6ahy5qNXExYGGIF7OEKCfLzQ+wkytqH2lktzeM
	 Fx7GWcm+n0dGpb7ocTZSESpLstlhljmUetVxXd/Y7BbrABrVO2e8I9L4aakKxQ2CHg
	 1Xn27J8A2inAw==
Date: Thu, 15 Aug 2024 16:26:38 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "ardb@kernel.org" <ardb@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"kees@kernel.org" <kees@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"ross.burton@arm.com" <ross.burton@arm.com>,
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v10 12/40] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
Message-ID: <3a7d9b69-e9df-4271-a3f0-8e8683c2654f@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-12-699e2bd2190b@kernel.org>
 <34f7a5378447b1a8d5a9561594b37cfeaa6bd2b1.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <34f7a5378447b1a8d5a9561594b37cfeaa6bd2b1.camel@intel.com>
X-Cookie: -- Owen Meredith
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_162650_371135_D11A04C6 
X-CRM114-Status: GOOD (  11.72  )
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
Content-Type: multipart/mixed; boundary="===============6695053491447085099=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6695053491447085099==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MksM19X6NXlfICdi"
Content-Disposition: inline


--MksM19X6NXlfICdi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2024 at 03:20:52PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2024-08-01 at 13:06 +0100, Mark Brown wrote:
> > Use VM_HIGH_ARCH_5 for guarded control stack pages.

> FYI - If you want to have more complete guard gaps, you need to do this for arm
> too:
> https://lore.kernel.org/linux-mm/20240326021656.202649-14-rick.p.edgecombe@intel.com/

> Using VM_SHADOW_STACK only gets you part of the way there.

Oh, thanks for the heads up - I'd missed that.

--MksM19X6NXlfICdi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma+Hi4ACgkQJNaLcl1U
h9Doewf/XswNKQ3VlzKzKEKNyYD5iFma82uwYhlhHv9Nqsb6eiF4zUSOOgbna6xT
Cq8p3DS/Im1Fgx/SaMcGP6tNihKE5DGkEufWy+6GIiS5SsrxhPlnzDtY0F4cJ4a5
AELeMm6OD9wZFwcAwnuUJraMRY6olKHlI+cfrFcncvwLNwLkaVE0JlcB1dOxMNSR
OqvnO/G0VM25OdY7SV+tJKRi/U5eIa+chRhV0i+qaQOu8oRJfEo6BqkFxz+ZHF19
Dwr/HiGZa663RJVxgdp7mhrotkqK/nCoNksP+gjuEt6z2TIFNdcxPg0BK6mfgN+0
qAKWzvjayIQ9j400dGkkiwuj5/+SNw==
=TSgi
-----END PGP SIGNATURE-----

--MksM19X6NXlfICdi--


--===============6695053491447085099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6695053491447085099==--

