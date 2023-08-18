Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14C0C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qw3HgN4wNIN9mBd7SBgPcNouKKsYdlcOgQrN8+AVPQg=; b=wiV5H1KLZrCPEowdgjmtelsBCd
	oqtNFBV2oERRtyCR2ZB+RYpWggbCPeJq/KRr7T03mjDWZ4HtSRYDQHb6uhJbhdIgZQ+nZ4GcFMz27
	wkRFZ9SVzg2NXnlsjCQMc7rB5WKgtcFDzpunywq/eC8377zm8VVdyB3f7XsVsHkEC7JuBkB+Y2nSN
	KpMkIPvW7SbsXdakR9SJZ3tNWWDj0zhzyMJmxy/Bc7c7Mbp9jROrvEvkPrLbIh2VlojVF4YmjCpJ7
	2S9sTPctB1uG32syOQ706t08D1x8xkgEuSSc3YOjHDJ7MOSHW9lGZfpMSAbl6E92bd4yUtLqI1JCL
	20vwpe+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX2y9-009lJz-19;
	Fri, 18 Aug 2023 17:09:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX2y6-009lJW-1Q;
	Fri, 18 Aug 2023 17:09:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E0AC962BD3;
	Fri, 18 Aug 2023 17:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610E8C433C7;
	Fri, 18 Aug 2023 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692378541;
	bh=1JiWSPRDzlcQkonHOTJfOlbVQmRCyzrqNmv6BEdoPCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeDGkINQMUZMOv0CaERFn8GmpN/lFFhAiO84OP7u1x7AFZUtfVsRfzTEFzC+ygpsR
	 Y9xpRo/IlegEekeP1Dut+AJzPtf3KaySn86syYV9hvhBj7tYI7hwm7WVjGwkVpEbKQ
	 ZjgkorrFmrhhByHlHzjOB7PJonhx3wFLnve5nNkSRvFS4Qnnbvl/LHsJGsoNKavGlh
	 wQaSzUFSZnBSxJIIJQqmSVEnLqSDKMGJQhsBsfKCrvRcquTSr/kacVzGcONadDoykq
	 GZMPrwKnsKvdT1EyR550F0bV2J9QMoG16RUnCOQNCw1zWjT6j+ubsWMcE8yFgXt2oD
	 mtaDQp5RlwIFg==
Date: Fri, 18 Aug 2023 18:08:52 +0100
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
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 21/36] arm64/mm: Implement map_shadow_stack()
Message-ID: <9c722954-8f30-425e-a0a4-6edad463620f@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-21-68cfa37f9069@kernel.org>
 <ZNZkADhSnodXuH5F@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZNZkADhSnodXuH5F@arm.com>
X-Cookie: Your aim is high and to the right.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_100902_545923_FC9A78AE 
X-CRM114-Status: GOOD (  13.26  )
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
Content-Type: multipart/mixed; boundary="===============1108793839144802929=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1108793839144802929==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t6HZ5j30fo2L27Lx"
Content-Disposition: inline


--t6HZ5j30fo2L27Lx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 11, 2023 at 05:38:24PM +0100, Catalin Marinas wrote:

> Given that we won't have an mmap(PROT_SHADOW_STACK), are we going to
> have restrictions on mprotect()? E.g. it would be useful to reject a
> PROT_EXEC on the shadow stack.

mprotect() uses arch_validate_flags() which we're already having cover
this so it's already covered.

--t6HZ5j30fo2L27Lx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTfpaMACgkQJNaLcl1U
h9CmuAf/Y7ANc4Kk+mnfQwnFeS/EQ5r5NF8oVlV+xJ9aNN/eMcDpeaYBvln2GA6v
ki7svYKRiiuRDNr3/h0fyHapLK3tsJpZxS76iqNbYh6EFBbZ5vX5njXBuLHneFL2
Kc18LKu7USgVA0WGmDvkClBhnSmeoOFrZjnrBJyJZFHNjTwRNM+tVnOCBeKTS/Ur
zPyUEIEB9wq1bs+NTA1CgvI82vIVrO3nLu00IP/35zQpX665RocIKw3craz+6Efl
8NH22NdfYjWPNSv9WI5pf2WG+CX2AOQ3v1IMF+S3jrN6NVdf5oOrpAYiejOjtf50
5MKlsT1RWl3PNInSnsIkRNYXCDmr7A==
=lwGM
-----END PGP SIGNATURE-----

--t6HZ5j30fo2L27Lx--


--===============1108793839144802929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1108793839144802929==--

