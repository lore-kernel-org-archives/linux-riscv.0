Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C21EE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIM5W7UzERGEd1r3kxsPM5UwZ2mNIp8HZm+LNdHvp4Q=; b=NkqRPVG3jnnpwpEyTchdzmKiqK
	dTwXHFi/L9B++bEWYuldX8K+uuvujZdQWAKkEWae2bTA+FtxxfOylG3zbN3/mUoeCjw4YuFzjy6nF
	r7OB1uI2Rpc4qmCHr8JxXG+pmIvAoQPgfNQ0sLH6OdhFbtNdDlyYu9O7AhLVOYO7HKN1ycjp0rMi3
	bRtFhO1KHixyYZFJBGtg6wbogNO5zfXToUMqfHoM+TLIeoxKhOcIVH7OQqHje3s0obI4BbcF/J9/m
	fPdxfUxjqYumo1N3grvzscJBWd55LoIKINk5JqrDlM1rrcaihJ3qb8y5t2DCmOMGAlkWrRYO4BcXU
	hKtxv4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYq7l-0011Q7-1C;
	Wed, 23 Aug 2023 15:50:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYq7h-0011Oq-1s;
	Wed, 23 Aug 2023 15:50:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C198C6655F;
	Wed, 23 Aug 2023 15:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1268FC433C7;
	Wed, 23 Aug 2023 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692805820;
	bh=LfSPyFOC3BjWg0Lc12kxGpYZXTpAJDmnKm0+E48fsYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXxYB3+fT0UVF4Njt8TKpmeByoZkbsjd3n/9P3Snic8g9RaQqf8z9/1pAOMPSfemQ
	 Y9j9vhDsu5y69cyAbfuDB83yGakcbvooWW6sYOU+Rpn6rnfgd6jhycZmd5MwPkAey9
	 R/8WjmfnlXliw9apZxQ4dXU84G0pXh4oScGsRUdqq/NLv5BvG+lDtanGz3Qii+HgqF
	 AdTJ6+Yywsuf55Jjh+2jDj/MQPRZoAJorkwc4Da/nqn+B25d4cDvqEJmH+OSk9x917
	 +rI2H7D87DCVOHmkcb8R18WVGIDXoCwWYwvwnOpIIGT5cEuC8VMxE5zVxbsUFeak9i
	 fekkLTSaiJdxg==
Date: Wed, 23 Aug 2023 16:50:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
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
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 03/36] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <b6b654d6-9f77-463e-bbe9-58e8135536ff@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZN+qki9EaZ6f9XNi@arm.com>
 <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
 <ZOTnL1SDJWZjHPUW@arm.com>
 <43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
 <ZOXa98SqwYPwxzNP@arm.com>
 <ZOYFazB1gYjzDRdA@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZOYFazB1gYjzDRdA@arm.com>
X-Cookie: Some optional equipment shown.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_085021_707943_E1C87708 
X-CRM114-Status: GOOD (  15.18  )
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
Content-Type: multipart/mixed; boundary="===============9146974524830770488=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9146974524830770488==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xcjBCIAjiMPyRAnv"
Content-Disposition: inline


--xcjBCIAjiMPyRAnv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 02:11:07PM +0100, Catalin Marinas wrote:

> Yes, this should work. Any invocation of clone() or clone3() without a
> shadow stack would disable GCS. What about the reverse, should GCS be
> enabled for a thread even if the clone3() caller has GCS disabled? I
> guess we shouldn't since GCS enabling depends on the prctl() state set
> previously.

It has a fairly obvious intended meaning so we could do it easily enough
but OTOH allowing it opens up the idea of people wanting to specify GCS
flags which starts to seem like more trouble than it's worth compared to
just having them do the prctl() in the new thread.

--xcjBCIAjiMPyRAnv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTmKrIACgkQJNaLcl1U
h9Drbgf/ZBUIo14hOU/3qkdtGyzuQHFus+mYzjU/uobIdprMeuTN+xOA0/oVAhlk
taPZwtMKHYyCkcXbZYxy6jKqDlM4zT3mz9WnCHkYtdQdCkyue/ftcKMF1SaZS4nk
Bzily68XoSg2VhZJTZQie/MqOXcwCDJcDHfBX42qmEhLXJZAblCcvtnu2KLwgSFp
nFmK1EGeH/+y6nXB/zoUYMDrWrzdpnZ4LJB8lwXMQHctPGJDyJIkZ+exBKubOR6H
ebKadj+npJxy9L4oLx2VRZ5AOjzR34+qZlQIuTPf8WokNrmtz4xQwPz7F1xBjcgN
jd3C7SSBR98L0uw+V3/L3WK8PKh2Lw==
=CE8H
-----END PGP SIGNATURE-----

--xcjBCIAjiMPyRAnv--


--===============9146974524830770488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9146974524830770488==--

