Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD72C00528
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 13:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2PRT40rQDZpRVvIvfuUMP6OtQTZRre0mVUu9ldg3lQ=; b=kyeofyqF3yutsH/X359NHGYwN6
	0Gmu2q5Vy4bqYahd1fJ5ggCVtmZqw4tpVq5QuFYM6cNy68yE6dW+xbrayL2fPAQ32o1o5+Nd3yEI6
	vk6lB8+RIY5TTWV9L/jndi4WHtqJqan4Tly9gWoGktkMzdnl9GeeW9MQVSgp5A4hpfp7abGl+u07a
	Ehjjo81vpx8VlhNSWzulLRUhLtTjbdARq1lNEdg2OylHBdBmVfV/6qe8x/RzhWRhd+mKIGAk4k9ft
	yLxCfwP4huw0z5qrcqOEbHPTCcMVBsuJDGWJBK3Dj1E3S6TZVbV0DwuOuxjyFZwVFLTyEZh1Fy652
	+XGI3/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRv0Z-00CWIh-1D;
	Fri, 04 Aug 2023 13:38:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRv0W-00CWHl-20;
	Fri, 04 Aug 2023 13:38:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14A6F6200C;
	Fri,  4 Aug 2023 13:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D02C433C7;
	Fri,  4 Aug 2023 13:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691156299;
	bh=wz8HX6muu9LEz/2ek8kzkra/H24iTN93xTauZhv3QGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pKWFc+S5JQzJIvia/Cee11Wc7lC17Yfs17ShI7jFKpqMYVJ6USFNAEIyrZROgkamJ
	 9eDQFB0x2XjaK/28bV2LKBLOuQ6vuy7TbjLAZtQCwqw4iCfihs9wTmszLFoO9oRbnr
	 JJmj8c3cIfcozr6pDH2j5JPmEh0V8jJXlPF9UmlVO3nrB+QoiVGpF1TO/hnkJDzpwq
	 QibstZcUH8jSdOliLu6T2qRWJjx6M450vEyW8nWXsWYJ+a/XKVP1CPX/ytlFMIvE0x
	 Zp4Xa0yF3k1t51L4SPW6Xv0UIn1kEs5u6H0y43HR4NK7dDMCNb+qVj6fL3E6RMthax
	 XYN/sfX3+6sCg==
Date: Fri, 4 Aug 2023 14:38:10 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "ardb@kernel.org" <ardb@kernel.org>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 21/36] arm64/mm: Implement map_shadow_stack()
Message-ID: <9902dd7e-1427-4c7e-b602-c1fbf6512f10@sirena.org.uk>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
 <20230731-arm64-gcs-v3-21-cddf9f980d98@kernel.org>
 <5461c56cf4896f18bddaa66c3beec7b909fc8fb9.camel@intel.com>
 <0a6c90d6-f790-4036-a364-d4761fdd0e95@sirena.org.uk>
 <e827138f9d8800e3db158831bca88d1ea8b559af.camel@intel.com>
 <21d7e814-8608-40ce-b5d3-401f2110ad91@sirena.org.uk>
 <a9ea33d31aad0c45eab41b0dcbd4913d863cc930.camel@intel.com>
 <55c629cc-0545-460b-91cb-2ebdb8ae9051@sirena.org.uk>
 <7d03be1277a5f4be23df35ca96f4d6cd77735e2b.camel@intel.com>
 <475f31e1-0f6f-44a9-b93a-540c1d43e1bb@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <475f31e1-0f6f-44a9-b93a-540c1d43e1bb@sirena.org.uk>
X-Cookie: I'm hungry, time to eat lunch.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_063820_745549_276C9722 
X-CRM114-Status: GOOD (  23.33  )
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
Content-Type: multipart/mixed; boundary="===============4252519093358486119=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4252519093358486119==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EaObfDz4CndjI5sX"
Content-Disposition: inline


--EaObfDz4CndjI5sX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 05:27:54PM +0100, Mark Brown wrote:
> On Tue, Aug 01, 2023 at 08:57:59PM +0000, Edgecombe, Rick P wrote:

> > To make sure we are on the same page: What I'm saying is say we do
> > something like add another flag SHADOW_STACK_SET_MARKER that means add
> > a marker at the end (making the token off by one frame). Then you can
> > just reject any flags !=3D (SHADOW_STACK_SET_MARKER |
> > SHADOW_STACK_SET_TOKEN) value, and leave the rest of the code as is. So
> > not really implementing anything new.=A0

> > Then x86 could use the same flag meanings if/when it implements end
> > markers. If it doesn't seem worth it, it's not a big deal on my end.
> > Just seemed that they were needlessly diverging.

> Yes, my understanding of the flags is the same.  I'll definitely
> implement omitting the cap since there's an actual use case for that
> (extending an existing stack, it's marginally safer to not have any
> opportunity to pivot into the newly allocated region).

BTW are you planning to repost the series for this release?  We're
almost at -rc5 which is pretty late and I didn't see anything yet.  It
looks like there's a branch in tip that's getting some updates but it's
not getting merged for -next.

--EaObfDz4CndjI5sX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTM/0EACgkQJNaLcl1U
h9Dhngf9HaBpp4WdjxabvyUIkHFeitGGLlR98c80xyh19bY1UWx4BOojqe0fcQqc
K1kS+mCmTH9c1RZEdUe+O5upQl099AzBqsJUu8aXBh/Pf6wDXwxinNVPL/WSO00B
9jlg3iozKyd5PQJjJIbbJwHoCTkHLe+Wun/qG9P75FL4w+7REzD+pOpSZBwoPqYR
2h00HfuO1pAX54ubVTARphHAZEIBJHYusx2fJQ8pP4JjLdYU7ot48CfVZa35VPuM
JJFU92h6YEdnqQPfc79hwp/UqvGWAowJ5QMM/3E8s6CDE7n4dTP8wXihArd0rlrk
OzsV73Hx8i3GvjV1DR1vc4vAC7DxRA==
=G9bO
-----END PGP SIGNATURE-----

--EaObfDz4CndjI5sX--


--===============4252519093358486119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4252519093358486119==--

