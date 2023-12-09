Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EBCC4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Dec 2023 13:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgqfIMN2ihTDRLpE3mBytXes6Ym/bcLMxhrQq2kpgbo=; b=IoXW0AWMufgdh2gSyc3V6/K8yQ
	2PQuS0kOJ7VucO4ABBIfX3986mVcsZGrWG3wkojX4ofcQ8cdOAscYf5nlV8WgOJa/iPZ+1nXjiFdf
	yZJwCF0QCaYMJO9uPwGUHJugqVa8ocipyaVE5kGhFbqTrq8vdBu568qRxkkFkka84WqemaCQT8ImV
	b0OjBIZh9He4JBYfwKyx60ILEjuMk4A29wVe7ve4rXzPy6K8H7NPIhTi8WA4TtSvmhmZN8IWj4UEU
	MUkOlkbfipk9Ai2n/EmOvHvk2Ca2qmlKwBeqYeecdAtWpixY0eWr6wb5tSEhVUGiTixrew4pQVLrd
	pgYy91IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBx5g-0007Q7-1h;
	Sat, 09 Dec 2023 13:09:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBx5d-0007OX-0B;
	Sat, 09 Dec 2023 13:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F3C860C6E;
	Sat,  9 Dec 2023 13:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783C1C433C8;
	Sat,  9 Dec 2023 13:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702127389;
	bh=BXmvRrbuQ7Zo9bps7+7CLsTiu05XaN6dU9PEwdxs+ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6jE7XNTUdBp/jI1nNZw36YjJLxRXIwjeEtof8D9IiRzLKGfNItYmAr+VT2iAQ38c
	 38YNmmUUIYntBWbwZ9cGSSxaGQim7h9NbXYE8xNDouYR8+TMgLcesHT+cipBw2tgX/
	 4lThPROQalN7MagIZParOBO4e1O2Pg4g6V0ixyjV2R33hTQ+sgi2mNYzJWJbwJzmJw
	 rUnZe+RUTAfAHW4aOwHkof8lj7+6t1uk4lf7Y6WTHOwc+fOGo2/av3fMhf6zCZfn9v
	 KMPF5McGv4f6VX8d9RocfRsJKSW7FslB0ZP2s+OE7BGvUVe1zwkJUq28+7u8No8Z/8
	 zs4EO1JDtaj9w==
Date: Sat, 9 Dec 2023 13:09:45 +0000
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
Subject: Re: [PATCH v7 24/39] arm64/signal: Set up and restore the GCS
 context for signal handlers
Message-ID: <ZXRnGbYI+uq7m9sA@finisterre.sirena.org.uk>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-24-201c483bd775@kernel.org>
 <8734wcgj79.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <8734wcgj79.fsf@linaro.org>
X-Cookie: You might have mail.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231209_050953_179051_F1DB33E8 
X-CRM114-Status: GOOD (  15.44  )
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
Content-Type: multipart/mixed; boundary="===============0809311150253821625=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0809311150253821625==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="37w+xraunaVzWRvI"
Content-Disposition: inline


--37w+xraunaVzWRvI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 09, 2023 at 12:15:22AM -0300, Thiago Jung Bauermann wrote:
> Mark Brown <broonie@kernel.org> writes:

> > +	/* The cap must have the low bits set to a token value */
> > +	if (GCS_CAP_TOKEN(val) != 0)
> > +		return false;

> I found the comment above a little confusing, since the if condition
> actually checks that low bits aren't set at all. Perhaps reword to
> something like "The token value of a signal cap must be 0"?

Right, that's bitrot from the previous token format.

> I'm still not proficient enough in GCS to know how exactly this could be
> abused (e.g., somehow writing the desired return location right above
> one of these inactive caps and arranging for GCSPR to point to the cap
> before returning from a signal) but to be safe or paranoid, perhaps zero
> the location of the cap before returning?

Right, ideally we'd be doing a compare and exchange here to substitute
in a zero.

--37w+xraunaVzWRvI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV0ZxYACgkQJNaLcl1U
h9AoDgf/VkzebhdvDSlUlS84JXdoOeqvCdQEoqmGKLcuFu0afYS5oNsgjYoWfoXD
aoXaZBnOjvf3Wmp5hO2MtDSGOlnNYMS9btFUd+2docNaeKRynVrPd2hEwST4I/yq
ZeT2mGf5o2wyv6qxW6RsXkgz4UUscznq2pitjl0x4ca+pOIeX+qxPQjayUJhPGtL
Us1MullRxipMfAZE5H9eGQ5UrEO940lmaqa3GOexHuqAmzs/znZexqoZYXOStiBS
DTmANL89uVAgAarTtMNsXKkO8mOZ8D9pNtu+zPEO0JNSrVzQgDD363lTYbIjKz5P
QroAHMW7izjjkY7CBtP6RwOmok0Uvw==
=u7l1
-----END PGP SIGNATURE-----

--37w+xraunaVzWRvI--


--===============0809311150253821625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0809311150253821625==--

