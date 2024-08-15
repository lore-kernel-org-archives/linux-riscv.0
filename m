Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5415FC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 16:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btJp7T0OM4HqV69gHkcrrpqCqA0ktahAfqHT+eN55/c=; b=wtIbBFSHAN1vcJY6sVhyTaPzho
	gXPCiqkgcEg+pmhALbrYFMle4/BMEioDsuxQCjRMvDXrq9j8REPvLqWP28c61qO5dsmNTAbgKU3/X
	gKD1xfnxFNs6W+8eFbHYOaTq9jECnbwY7DjlVqo1RsF9DKImzzEvGHyZNjRbmCZj/+33QyD52K+9Z
	fwNLusCrew2NUtG5yBdYuz3rdkM8a0RodDdN1AGqHJVrLNT1Puy8e+cMBuZPbQHV2MnVjNAx4O56C
	CNqZsG60gtgjOGzyiIW1outQfOnmiuxihxbxXrPlEg+PZgLQWT8IWqGcxfc776Kl7svanpsKV6qtE
	DyUTdDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sedWF-0000000AXcj-1uL1;
	Thu, 15 Aug 2024 16:40:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sedVc-0000000AXXI-0zXf;
	Thu, 15 Aug 2024 16:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JPA2PL+CeBl1p6pJOvKvH0vZaS1izS3V+ce+gU37gSI=; b=UAgbQv9i7hXvjJmtkeW+okX5RM
	/o6zFSlZo6zBUej+qmosGaLLJ+BtKveQhRrYIiPXKyK/J/PJ7kD5xKHSnBgRqPgDoxqSD17/NkZnP
	ME1FQsyio71ez3FiJqzHBa4mEHKvi8flHj07S+y2reQtCCV7BMmuKsuunjJbx0yW3t7oQjpxa5MM1
	96p0L1jsKQq6zas/qb/pqPHiltIYXWwZJcJuWdLWEHMD2viBINc0BY7wDXE22tJAovl8sAWDKB6U9
	un29LRl5vl7Wv+p+fpYTXd+mP2gOt0qGPZOzp0Mzna6AUXN1fRJcWwqLbzK5q+9y/W3yaCfdqJZmm
	BujFzxdA==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sedVX-00000008S7C-2Zvf;
	Thu, 15 Aug 2024 16:39:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BE330CE1D0D;
	Thu, 15 Aug 2024 16:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A991CC32786;
	Thu, 15 Aug 2024 16:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723739962;
	bh=nqEGxPh8pwY20u2MZKu3nNO4QLRYnQ4hjFehvCemvbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVPQBXWf4rO5tqOD7E573dr/pYnLkTbMxIobg0TVBQo8vrWdsI+BSdGVLxb3z+DuI
	 AB3CwtvHVEesic9NWEB62pNPzB0UJqdc4mZ/YzivT5ZFGoUdfWmLZh0iYBRkZNSExn
	 CGmJRmgQTCFJdl9Jw4SsQ6861ethBoLCMBjuFdUCeyp75mtiYAk9jbkXTk4v+6uMeT
	 No3dA8UXevsw+hJpGxWXFGCI0EsP6KJ4mwGaZhjhGW8rn/ZTEU4zMNmsprnEpxb62I
	 jijupNJtzAxMTcTemcyG6LtY/cD39wLSqWkRJGa6R7ozAs02XXoMJxVcOvJZnO77q8
	 Ub0FE7zYHQYCA==
Date: Thu, 15 Aug 2024 17:39:12 +0100
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
Message-ID: <68ec09da-fb4a-4d59-9c8c-6fae4c48ea68@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-12-699e2bd2190b@kernel.org>
 <34f7a5378447b1a8d5a9561594b37cfeaa6bd2b1.camel@intel.com>
 <3a7d9b69-e9df-4271-a3f0-8e8683c2654f@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <3a7d9b69-e9df-4271-a3f0-8e8683c2654f@sirena.org.uk>
X-Cookie: -- Owen Meredith
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_173928_295610_3F4D8915 
X-CRM114-Status: GOOD (  15.01  )
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
Content-Type: multipart/mixed; boundary="===============2389948257983430945=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2389948257983430945==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vKd189vsbNknapJj"
Content-Disposition: inline


--vKd189vsbNknapJj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2024 at 04:26:47PM +0100, Mark Brown wrote:
> On Thu, Aug 15, 2024 at 03:20:52PM +0000, Edgecombe, Rick P wrote:

> > FYI - If you want to have more complete guard gaps, you need to do this for arm
> > too:
> > https://lore.kernel.org/linux-mm/20240326021656.202649-14-rick.p.edgecombe@intel.com/

> > Using VM_SHADOW_STACK only gets you part of the way there.

> Oh, thanks for the heads up - I'd missed that.

Looking at this I think it makes sense to do as was done for x86 and
split this out into a separate series (part of why I'd missed it),
updating the generic implementation to do this by default.  That'll
touch a bunch of architectures and the series is already quite big,
it's not really an ABI impact.

--vKd189vsbNknapJj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma+Ly8ACgkQJNaLcl1U
h9AuIgf+OuQaTIedzXEkMKSzSn8gQPJlIY5KrokvUJ1INFNplupcL8meQbjGaCke
k6p6rULpXRg8dAR2gjIllIWy3YaYrcqKK7VUWUVHy2rdwtozDi5JICj3GVYrZ1N4
RHRL44Xq/dMXBORv5Zm06QeTaZxhgmj+wKvnVVrgiZN33cbHEULW5W3HX/qCcsDe
7qR7858W0Qkm1wZ8tyY3UkGI8AiUO3oMCaQ/pokDf9EDQagBid3Aqe0iMQmRacMZ
XaEy5ijWBddwXQb8qolzElM+ySPoxEf+jwEqHAH6WP4ke1NlJrj6+Xn7JN+/OuY8
Lv5n7BHbDEebZQo46ohDBN+Q0iR0vg==
=uwcZ
-----END PGP SIGNATURE-----

--vKd189vsbNknapJj--


--===============2389948257983430945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2389948257983430945==--

