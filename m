Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E67EC3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaOuTVEdXY2qcKs3Ppe1QS8SZ7mR82p0bt1y1E0LoPk=; b=cJKg052DIWLtS9/iwJrppFAsd3
	awhUlEvv7yIWEmpgNL92Yy3B6i6QURpGm3bCtEp/HDD5IFISsI/Qam6wMH1MvXnSHeHfLSiaOP9dn
	ACUaQb1BkahiQK4087t07iZn2dBRp/ztcH92sLYdmjzkRFkAbFc8jP3qpdQSkDCDyKDWRmvpl9JeQ
	f/ipVMHCI7WBqjjmHSOFQYXOSFahUHKzxxAsE561Gdhz85DYE72H3Vj1wqDII/XbsZeGKbmOADJy5
	kgZHo/kG65lRzueRnlgs5ICS9JQyFE1hrxOdmrOfAZm9SS89id1O1o81K/Pg9muBokk7nvHUbn6Yu
	YA1XLXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVpyq-00000009BYc-1t9g;
	Mon, 22 Jul 2024 10:09:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVpyS-00000009BSR-3cmf;
	Mon, 22 Jul 2024 10:08:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D67A60AD6;
	Mon, 22 Jul 2024 10:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921B0C116B1;
	Mon, 22 Jul 2024 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721642935;
	bh=7h5Kr+YpdYtQ4+7prp0Efe9cyc7VuT34aSYyd6+RWOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNcTvEENz+fFubHxaCVUTSqYq1ITDfo0ptFNNyhZiJtkY03TadBS1i+ZhqHLfVGJh
	 wejLfRGO7/MXoIRjPmgVOznu/m8as04rC7MuUcV6ZUI86ATnFB/wd9trpSHBjpMIJe
	 1zP6D6J4UnP/C2ivTwawSleVhDsGeYcY8f3s+xp8ATTVohoch6BbiYzMzCYthbAZSo
	 Ju4lBHrZm7WycGEE++o52rHSPjU2WPyxwG9PV6SYXLz5E6v92bSrMIBCRBl79m4ZZz
	 UbOhxWSEIT/Q1c55byiM2Jo3LnSq0IoSgxoIde6Xxp0OyfH8W75BVC3lhxcNX8Kqeg
	 0Slz4wCmQVXnA==
Date: Mon, 22 Jul 2024 11:08:46 +0100
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
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 38/39] kselftest/arm64: Add a GCS stress test
Message-ID: <53c98e88-b12a-40e4-8b01-d7a4394c2471@sirena.org.uk>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
 <20240625-arm64-gcs-v9-38-0f634469b8f0@kernel.org>
 <875xt2xojp.fsf@linaro.org>
 <871q3qxnx6.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <871q3qxnx6.fsf@linaro.org>
X-Cookie: Everything you know is wrong!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_030856_986758_E794CD7D 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============8880154831486438541=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8880154831486438541==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d44XRLGyLTUTZna7"
Content-Disposition: inline


--d44XRLGyLTUTZna7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 18, 2024 at 08:47:49PM -0300, Thiago Jung Bauermann wrote:
> Thiago Jung Bauermann <thiago.bauermann@linaro.org> writes:

> > # # Totals: pass:0 fail:9 xfail:0 xpass:0 skip:0 error:0
> > ok 1 selftests: arm64: gcs-stress

> Also, Shouldn't the test report "not ok" at the end considering that
> there were fails?

It doesn't really matter either way, the per test results are captured.

--d44XRLGyLTUTZna7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaeL64ACgkQJNaLcl1U
h9DdSwf+OKUfn8laXp+yxRv2lSbOzqFMeeL5M5MmJtaH4D5q5G9SwlMCVx3e+7BW
utABRB30/1ASkvtYLdYwvPw6y+Jn9P2xtdttvx7+U/aggTBaWWW0fa6cB9YTKO+a
aRyNaxotBkWFmPUl7qa4kpMWb5FDtxX3iLlCw0GicotYaWJKGHEUQ6AFxGjmQaM5
O1eXLhARUQ8l2+k8A6a0WXVZvZJdhyLouFkswNGmAKdnfd6mYvY9DIBejxtsBJlH
M7xvo9iPSz/18Y/x4HdPAjjwGHYNRkuhYT8QMhZG5TzTpNMXwEXpKbkkKETAklkz
289HaQ9+gTL4ZnRsy1VMxkkxoqQ83g==
=SALv
-----END PGP SIGNATURE-----

--d44XRLGyLTUTZna7--


--===============8880154831486438541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8880154831486438541==--

