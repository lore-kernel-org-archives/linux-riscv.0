Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5590DC52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJ7fHgwjIvCO6YQYsaijaDOKft3K/qFQrGSODpTQNZM=; b=4nCjctc4B7eOv6qhd0FSZxV+6X
	X2D3U2kEErmSvavmdKHD6TZZVYgTTEFeDxJ/UyObQ8p0GbrMMWqY5AzX6PsmPvgSRidBJQRp3MlPd
	ExXH+kpcGdzBCGWPDeAO7XkCDX2hmbcBkJqTZbih0knOGCHuyYRp6vaE4cyFVxxbScPVepOzhJ/zi
	fclzWNFgQ/XVZ/UL+CtVN0IOzg9jBEILsCTZ+HEwMqRMnQfI/tzU/rADmGVk8YMItb+R2PreHV7nb
	fHQ87esZXfDCeq8OK0t7E2rbkFpvN2YnUJqa27nEz78lZolJ8UOtj5qI4NTTnZffU1wJOSe0RHOzK
	s3A2leSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgkm6-00000008yzO-3KDr;
	Wed, 21 Aug 2024 12:49:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgklM-00000008yoA-2rj9;
	Wed, 21 Aug 2024 12:48:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E024660FEF;
	Wed, 21 Aug 2024 12:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34586C4AF0C;
	Wed, 21 Aug 2024 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724244511;
	bh=j9HZBA2/5Wb2g40y9Oti29HTzjGioJbne5mKkeX2ur8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2vqtqLzx77yK+jri4pI05ZBvo2YloFCkoCVtCEjRuNnOxfTyJdeVqAID+oks/Got
	 k/MOAywNrA9LkLm2vhxFrX8HojrmEpCpPMFZ8usZAOfEXdFUi9ZJwugyMFj8wDYOpP
	 J1p1m7nAlRo1BJ53vsZ41xGztHqtr9cQpA/9TG6W3AYjgGVSZYvjFqKjCbFotL/+sN
	 WOBnbQJNg1ix3kDwZLLHWgSh5TWlK3ROmZdRmEhC1vOJVT/Udnx4TyTf9FOU8SDCdC
	 IYiUPSkNc7T8xR3pNt74QmD397GNbk0kklwH3BlYq4s8DCTEhzbg4+mFWP0qXvQSXc
	 HGPkV5gyPIOuA==
Date: Wed, 21 Aug 2024 13:48:22 +0100
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
Subject: Re: [PATCH v10 19/40] arm64/gcs: Context switch GCS state for EL0
Message-ID: <3bc63a7e-0cb7-483b-9054-b52727997b6d@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-19-699e2bd2190b@kernel.org>
 <ZsMwhdmE_Ai9BbM9@arm.com>
 <0f6fd3ec-2481-4507-af0e-3cbbb7406b54@sirena.org.uk>
 <3b316422-7f88-4f5d-a691-eb9209ec4ba9@sirena.org.uk>
 <ZsWqTtCq1mNJH1vz@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsWqTtCq1mNJH1vz@arm.com>
X-Cookie: You are false data.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_054832_885113_D3FCE698 
X-CRM114-Status: GOOD (  14.84  )
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
Content-Type: multipart/mixed; boundary="===============0156171351199974414=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0156171351199974414==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qtdMReCOgtjtAPvI"
Content-Disposition: inline


--qtdMReCOgtjtAPvI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2024 at 09:50:22AM +0100, Catalin Marinas wrote:
> On Tue, Aug 20, 2024 at 06:56:19PM +0100, Mark Brown wrote:

> > I forgot when writing the above that we always allow reads from
> > GCSPR_EL0 in order to avoid corner cases for unwinders in the case of
> > asynchronous disable.  I'd expect that to be cheap to access though.

> But then gcs_preserve_current_state() doesn't save the GCSPR_EL0 value
> if the shadow stack was disabled. At the subsequent switch to this task,
> we write some stale value.

True, we should make the disable save the current value.

--qtdMReCOgtjtAPvI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbF4hUACgkQJNaLcl1U
h9DrbQf/SQgnftiL0Tbvv1xffP9U4UoVPIul2GtdtgQHIDIzT1ukcsmQhdRliW8p
YkPVH3S3HbTM+Qtdp/kLSqVJHoK9rDDUsUJYlLAIBhC0dxhz6vEeOekbUti1UKFB
hdq/nUQDHb0LMufsGWvFir+5WNZkrUMFajAkS8FQ/0RFAA8IXmWgihu6T+Lf1wu2
TVR7gLXkxw51w03S8rD5D4xGzNLF6xXKU50cftHNVPwu8zsPbXCbu1jIpaPVPCXM
oWKLc3IOSmG0w3XNoWb7Ki07+H0OmcAbrXvIDK/8FLyyHrcehyy+teM/H/AJqJtt
gDCFIXYlvUlLXHmodMUWCk2uNYAYXA==
=msk7
-----END PGP SIGNATURE-----

--qtdMReCOgtjtAPvI--


--===============0156171351199974414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0156171351199974414==--

