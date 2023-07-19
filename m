Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5B9C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 13:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vISTwfQdwLnT/CWNnPkb/s7/GsP0k8lYoJ1tuNF7Q9w=; b=z4BZMVyX5z11qsAAE3TDUiKjcm
	J9kEaW6ZNimlzNZrnsg4bFRkJrkZHkwfF1HK6aKi3nU4LPN8U9z6tpGIPBihtmw7fDJsyYgpavBlF
	8Lbz3DEfgh5BtfzugrH3bDeBEqA63IAMHZwgvbAayGcDkZZcMWxgFaOYfj9KPKOzXGw3fy+/XhTkX
	4NhTOtLkYyTwics0O1ZcFIYPx4eLP4hxI60IE6Vjz/cvHbFrzw8Zl3zrtlXCo9PBbIODa13TFVlp8
	oMtTL0h1KpDA4w22H833mxT5hQeAlP3bb13b/1j5bk07O9dDkRopYt+5m+hlYGX99v4JlED2XdJvC
	zWYX8h9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7Bf-007ZSQ-19;
	Wed, 19 Jul 2023 13:25:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7Bc-007ZR8-1e;
	Wed, 19 Jul 2023 13:25:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C762961638;
	Wed, 19 Jul 2023 13:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60714C433BA;
	Wed, 19 Jul 2023 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689773147;
	bh=EyVLtL0y3pMG2CuYY0w75B4btgW07dMcezlAZDsSdHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gb9Diglh/i64PDngyNdt/GKb2Nk1ffhlx2iCYRVwYwJFFaIWeqdykk3XHsdIjxi+U
	 ySo7EE75m9kyEmpGqZr+PUnM1neiLXdgMRuMhDCLMjYIpKB5stI7SDZFdeCnV7pSuT
	 3rxlgGugHsMh6Yu2Y2ZMz7uzUyqXc5OaAdIZuONNkooR8IAwPmhrzZzWDT1N1DwHYx
	 RlTVeZoCs4CL7meIUWNo6SyAJaBckf8cXgHWQ1TpJoo/sQRvPGvbROxf9n80ltzbXE
	 5eGxexNIybAnY53SN4bcht+Z5iuvu040wYt+t4TGE0tkG8rPpOs8sUKiihTlsC+cQY
	 ajt3gtR/VCWvQ==
Date: Wed, 19 Jul 2023 14:25:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
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
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 04/35] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <01dd7853-953d-4715-8cf0-c2f500065b55@sirena.org.uk>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
 <20230716-arm64-gcs-v1-4-bf567f93bba6@kernel.org>
 <20230719114437.GJ1901145@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230719114437.GJ1901145@kernel.org>
X-Cookie: They just buzzed and buzzed...buzzed.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_062548_653690_742CFED8 
X-CRM114-Status: GOOD (  18.39  )
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
Content-Type: multipart/mixed; boundary="===============5556525221938014825=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5556525221938014825==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I9qodeRa311/Bc25"
Content-Disposition: inline


--I9qodeRa311/Bc25
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 02:44:37PM +0300, Mike Rapoport wrote:
> On Sun, Jul 16, 2023 at 10:51:00PM +0100, Mark Brown wrote:

> > +* When set PR_SHADOW_STACK_ENABLE flag allocates a Guarded Control Sta=
ck for
>=20
>                                                  'for' here looks excessi=
ve ^

> > +  and enables GCS for the thread, enabling the functionality controlle=
d by
> > +  GCSPRE0_EL1.{nTR, RVCHKEN, PCRSEL}.

It does scan fine to me as a native speaker.

> > +7.  ptrace extensions
> > +---------------------
> > +
> > +* A new regset NT_ARM_GCS is defined for use with PTRACE_GETREGSET and
> > +  PTRACE_SETREGSET.
> > +
> > +* Due to the complexity surrounding allocation and deallocation of sta=
kcs and
> > +  lack of practical application changes to the GCS configuration via p=
trace
> > +  are not supported.

> On x86 CRIU needed to be able to temporarily unlock shadow stack features
> to recreate the shadow stack of the thread being restored. I presume CRIU
> will need something like that on arm64 as well.

It would be good to understand why and what exactly is needed here.
I'm guessing the main thing would be stores?  It's relatively easy to
add features later, I think I'll just add support for everything except
enable just now.

--I9qodeRa311/Bc25
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS35FEACgkQJNaLcl1U
h9ATlQf9HMvGT285Dxb1K98/IQO88I6xjkJKw25NyYtFdnj3sDQr/5mkdc17dstk
89MZPCDWgwC0akok+8SB6yCnT8x6dYbpiCgo7RkJXlfEhqR+xhvrJ7N+VRcoW4Uz
ZZuPeiCqQs9GwvjBL9y0oD00oCZeIh/tfYI0cti4uHuUDaIiOjy6E9x96TGWTxBu
l85odWvjI7U0wOUXQQL9qoDQCBU3bO52EN0k30ch7ILF9YAwR/NgAISqgoHreQ7d
LrmfFdQSTWQiqh9/zau9U7ZESH/kw3vLVBo/TZd+pzuMnc1g+rxyKEHVZoJi1DBh
3Tt8WxOzSOFTarknQTMyOSKwRH7q9w==
=EN0T
-----END PGP SIGNATURE-----

--I9qodeRa311/Bc25--


--===============5556525221938014825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5556525221938014825==--

