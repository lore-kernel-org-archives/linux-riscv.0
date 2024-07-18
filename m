Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0FCC3DA63
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 16:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKGr4gkgOvJzlnjhYZxy/7POSbbHLHAu/vO7fTw97B0=; b=ccRt2W9KQ0LlztydJCE1urLwME
	+h54VLL6GtaKYIiu3fXvRI1F9C6wj+8sky4Lho2jjh/W5SXRnDT+4A8aU2ECiXyOkoeLyhP0VpH9l
	jT1Y6lh9mztmw2uWx6LxJ08cR6M0zxMJPxpSuBCdFgrAW8BjA+k0kt0fdkN341rLzmWyhG4v5wHGf
	zBJSPg3MW1VtLYL/ogg4C/ovzXmQXdJasgoOkcrtce9qZvlwnjfLRjt9IeXd2mhLlzA59wxjKwVo8
	WuVv3875ZVuDm7uHVcuuM8ll1ACV1Q42PJUPfoV9UgXSD2T2um86NEJZ/Nh/X7IK4tsmyD7HyeVnE
	dBCRwd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUTof-0000000HYTc-2LPV;
	Thu, 18 Jul 2024 16:17:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUToI-0000000HYLP-1ek4;
	Thu, 18 Jul 2024 16:16:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2722A61B69;
	Thu, 18 Jul 2024 16:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46843C116B1;
	Thu, 18 Jul 2024 16:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721319408;
	bh=gKUCbuXhzgw1JXGUEH5JtAqhnI1xtcOjVYOUIZ4L7WU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLlYu6gWOogx7mLKzNfrMoEn5IliXebJuEhDM/YqrOAs0xiiQi6bBzH51WVhr0QJY
	 Zmz8pj28Y+tUuZFCcQ+CeaKHFWqQNypCAdrLOte91CySDjbvX/rzhyyR3se0bq2LpP
	 g6RJw1flOPNxSa3KhVH6/l82V95VuqoX1PB6yBPMkusoTfwHjtJOhkTDhpZqR17bH7
	 f6Um9jZ/myfqy9kdeb1SYQci7ZstuknJvs14kGvO4JNq1TXB+SqRUsXdc42IdtRGlO
	 15WGVzA8vf4KSb71viIsgiMbNYYY2atS0TtJSRYErrbyAqLJXfywco361yELivTB6A
	 OHz65cHYteddQ==
Date: Thu, 18 Jul 2024 17:16:39 +0100
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
Subject: Re: [PATCH v9 35/39] kselftest/arm64: Add a GCS test program built
 with the system libc
Message-ID: <a1ee93ab-2168-4228-a4e8-eab02c046bd3@sirena.org.uk>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
 <20240625-arm64-gcs-v9-35-0f634469b8f0@kernel.org>
 <87plray8we.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87plray8we.fsf@linaro.org>
X-Cookie: For off-road use only.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_091650_506315_0F08320A 
X-CRM114-Status: GOOD (  10.10  )
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
Content-Type: multipart/mixed; boundary="===============8824995957022775496=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8824995957022775496==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4iOkZ0TI53vzajDb"
Content-Disposition: inline


--4iOkZ0TI53vzajDb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 18, 2024 at 01:14:41PM -0300, Thiago Jung Bauermann wrote:

> In my FVP VM, this test gets a GCS SIGSEGV before running the first test:

Do you have THP enabled?  That still doesn't work (I'm expecting it to
be fixed with -rc1).

--4iOkZ0TI53vzajDb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaZP+YACgkQJNaLcl1U
h9BR6Qf9GiojqUKYh+SyKawuW3opLEJKR/7zCB196w+/g9gnE5g1RbTQ8JPI1tlR
c3GGKFe6YZzDvo2XPzwWRcb5+xqPig7ZFkM5EdMMUcaFklfX2xTqhSAOMjkvaMFx
bj1ELRnstQmWoibVbFHPk3iI3g4INItNqTua4YSyW1efyShyruDItI6rMORwMoAX
JYEYM5K6aNhh56OcSwX9ZKjF8KIA3UPTWCi/Dt9KcX45bEmxR/tc8qi/YIvhIPG1
swvurAIyaqJ8PLR6B7dO9nYj2WReVR1yjql8sZHw1i0lHeSB4bd7hXP0R+XgYU2T
MjO/IPnJGt/92ViI0r5HvZeqZf7KKg==
=OYr2
-----END PGP SIGNATURE-----

--4iOkZ0TI53vzajDb--


--===============8824995957022775496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8824995957022775496==--

