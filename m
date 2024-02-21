Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5D7C5478A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKg1IHdZ61SctDDp1AmK2dJIczEhJGTjZz22pYImTQU=; b=WAnBQHCt94dS9I+3Y8uySInaJy
	0Otd6jEisOaVCeMKIZgnHFxRcRGC+/tV2ncdE81qUbLzDuSlPJzDa8PjqWnZOM0l02RNNp+Ffb0jL
	T13XjvIrkmTUVDNlkrXMlABIvF1kEJj4AxcsWwdueCbx19KquozTJxiGIXGBaISNh7ihfXvFWAEqf
	XGbvkWH2bT2C5FNujeCQjG6Xrm+TqrBk6YrXS4rUppvW5zLUBan4TLID+Yuhnuga+UL8grwe98DfO
	IJN6Sttn7oa8qAqubzp86BPDkCEaKd3bwnzttg+/FttD0OHGfDCMxcbMoMowuQv3pjYkn/D2b2OD3
	V3om7QjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcr9G-000000022bp-2nwo;
	Wed, 21 Feb 2024 18:16:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcr9D-000000022bM-3WQM;
	Wed, 21 Feb 2024 18:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2BE761599;
	Wed, 21 Feb 2024 18:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCEEC433F1;
	Wed, 21 Feb 2024 18:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708539406;
	bh=csK/DsyAOVnlfATFEXn3F2y/yVFcNC3OQEkT5JeAyec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ov6cm/hg2mleRWqUd3r9/W+rkcAFVU7c27Hx8hcFb4M7UnzZrk5N2v269pkhvIIp6
	 bYnBdTUndPV/TFw7qV/WyGz5Y5QL0nzqxYt/dpw22VmM8LawYB+liEKK4qt6TGiyDk
	 QjYeo/CJfpAl1TAZ9ES5BuQc1+oqqSXYqQ4XvqrYCwSuthuV4CUrHLGWw1uQydZLOx
	 AwoNAI6RkOBmr3gjndpgIT+LOuOI9T5Q22ViTkf+qm8p7en2UwVaM3vLN4MN3sD7yL
	 3uBtCIJ1v9SEg1kQuOc2Sf9OQiw+ZsqkoXTxilnmDq1+1x53S/cyRAhhlK17+JAJew
	 /3/DRkmjzoJ7g==
Date: Wed, 21 Feb 2024 18:16:36 +0000
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
Subject: Re: [PATCH v8 20/38] arm64/gcs: Ensure that new threads have a GCS
Message-ID: <9400cfc3-0e87-4abd-afbc-172736d77a1b@sirena.org.uk>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-20-c9fec77673ef@kernel.org>
 <874je399ld.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <874je399ld.fsf@linaro.org>
X-Cookie: The second best policy is dishonesty.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_101647_956485_80BC1752 
X-CRM114-Status: GOOD (  12.89  )
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
Content-Type: multipart/mixed; boundary="===============6816152003865258966=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6816152003865258966==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kWxKAN+nLkxhoap7"
Content-Disposition: inline


--kWxKAN+nLkxhoap7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 19, 2024 at 11:02:22PM -0300, Thiago Jung Bauermann wrote:
> Mark Brown <broonie@kernel.org> writes:

> > +		gcspr_el0 = addr + size - (2 * sizeof(u64));
> > +		if (!gcs_consume_token(tsk, gcspr_el0)) {

> Should this code validate the end of stack marker? Or doesn't it matter
> whether the marker is correct or not?

I don't think we specifically care, we're just looking for a token here.

--kWxKAN+nLkxhoap7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXWPgMACgkQJNaLcl1U
h9BotQf9GJn/XYpiDfL/lza1ZizUnGoNmGMVjrNpXn5ZUEXw+EsNed40zfVPg2As
MDBjwYmG0UWQjuOimqAPlqsQL2hNSgmuQpeOCdUJXv2+/WBRUOfix+1xhtnPUUlf
VWqNyLLSjFbbzOAmYFiN1HTJkHsSs8FHbtskrWealJQ/wV+6GLXjkz4cP7dP84lL
IZOifB9YSPxwaW7RKUtEJ3D6CfX0xZhD5eahzIbO4E74kha8flAy/1AuHvtlI/+O
0oN9+6kUfQNptazvZMa8wZib2BDF1ORpASOrzn+hmFWgoUD2j2wbkMt/E8sH9ckT
HygbfdF0QU3Xk7fxczBPUTsczeTLeA==
=2YH/
-----END PGP SIGNATURE-----

--kWxKAN+nLkxhoap7--


--===============6816152003865258966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6816152003865258966==--

