Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3488CEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5daPYD+ykRTGBv3BNx/uIb1lytN5iezsZX4H3e7m7qk=; b=eUQx8OPk3TTbFOe/Bbkn/l4q6L
	pQzcfxK5bmeARAFpToSlDP5/4IKnMYd7sZVrtUJ2d2U3jGW+CgiVBx2bNjR+bvl2ehgz4Smu2jOpg
	VlzPBAk1AzyL34ULnmMDLFZv58wJKswLV8c7WUIW656CfHi+3Oh7b7lSIgep87RTbllBMkyH94axH
	KrAqwY1UofgZKSfqtVvWg+k6AV41RHvXhMFb6PxD3p9prMWXCFXLD/t6LiasFXXLzOW+slDTHw0q6
	eOQjfz9wKFUSOwi5cVmIkNwuVvZsWI62fEwbDXSp+n7CHwvpw+Tk1wBgu0fZdf/aacbzRG00a5Vnj
	8ZCagQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0A3-005Sg2-2c;
	Wed, 19 Jul 2023 05:55:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0A0-005SeY-2C;
	Wed, 19 Jul 2023 05:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YYl/EUj6DCRSCQey6kEPZ2T5dVhRW3N46kZgt3rw2LU=; b=Dp1wPRnpYfUnsSzNp/slJPdNO5
	9/6wxSsYW7sTFExqwJYPPlheWEJ+B+5VwbvbcbgLdSP+UHbHV4nycBF4UlSbIcYca+QZt+AoSMyAP
	vjcq/xXcXzwTG3USodxC3XKcHBiiMS0LDMnURTxoWmv9G5T8BHhrdQEm2M1SLSv3aIh3gMlZu0jSG
	eU6QO8aPd3lo9X/5xZUjv/8y/M60JyG/njy5Kasd0ImLRozJJY2a1ClmRSDoTGieKG25Y6NTxdCP6
	cdgrSJIebRtc2UkFij8u4YL87INBDmOukdxQJeQEH/c48BliJuSiMW/9bvRQJ59ilgc7eWAk5h8Du
	CqPJqfAA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLq61-00Bvtc-0q;
	Tue, 18 Jul 2023 19:10:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 99047616A1;
	Tue, 18 Jul 2023 19:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE09C433C8;
	Tue, 18 Jul 2023 19:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689707445;
	bh=YYl/EUj6DCRSCQey6kEPZ2T5dVhRW3N46kZgt3rw2LU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPOMIHmHcysn6e7Ezp7G9Lvt5eZGNIxiZV8UrLxoyk03fhbOjyFIFDPEDxQVjGxYr
	 0IJDGgSBCcj1y3UJKnXlohYlZo2TZR55ziCWM+86tX1h476ymSNvomBxYATFGDiKD3
	 kM4DP+Uy+Rbt/rr9VbChoK4eYmVmmf/OH1LeGVL0gPDFxxcExeeUqUIKfTbdHwmWwj
	 66xboAw32/YLlqeRbYTLZJqR8hZxQYweZH3uYGuQVY/W6gV1++qmVkfgSNyFT5rPDJ
	 e0ivgfAmet3+KXZ29mn3Tuj5p6aWr2wpx7JISQCOXZJ4RmRChoWXmtAXKlBm/sdulP
	 kTlli0NniP8Eg==
Date: Tue, 18 Jul 2023 20:10:35 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "ardb@kernel.org" <ardb@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
Subject: Re: [PATCH 02/35] prctl: Add flag for shadow stack writeability and
 push/pop
Message-ID: <19911588-f74d-4a7a-858c-2994c8614463@sirena.org.uk>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
 <20230716-arm64-gcs-v1-2-bf567f93bba6@kernel.org>
 <a236d8bb1593035252f7094b6461e4d2c5b432a1.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <a236d8bb1593035252f7094b6461e4d2c5b432a1.camel@intel.com>
X-Cookie: Nothing happens.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_201054_779144_CD918F57 
X-CRM114-Status: GOOD (  14.63  )
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
Content-Type: multipart/mixed; boundary="===============9146906435201261441=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9146906435201261441==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iAfYGwbU4kDAge8S"
Content-Disposition: inline


--iAfYGwbU4kDAge8S
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 05:47:32PM +0000, Edgecombe, Rick P wrote:
> On Sun, 2023-07-16 at 22:50 +0100, Mark Brown wrote:

> > On arm64 the kernel can separately control if userspace is able to
> > pop
> > and push values directly onto the shadow stack via GCS push and pop
> > instructions, supporting many scenarios where userspace needs to
> > write
> > to the stack with less security exposure than full write access.=A0 Add
> > a
> > flag to allow this to be selected when changing the shadow stack
> > status.

> Is this correct? I thought Szabolcs was saying pop was always
> supported, but push was optional.

It's not, I wrote this right after looking at hypervisor controls which
do control push and pop.

--iAfYGwbU4kDAge8S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS246sACgkQJNaLcl1U
h9CH3Af9Gc0ROtEwiO2hraLxRf8RP7E57Zl493uWzd9vEx2utPcr5meeChS7qWAk
zNoD8IB/4WfafwXv6xjwP5d1PnERWQMij8YDHh3/HPUskRQQJoqb2i0rdSrne/n7
PEhrLVeF69IYVhVhpnSrOQqdGD0P8iSmaC9Z23grrFoUC/l0uRGqX5DaafWRwhMt
2dDXduZC/3AmH6m+s05fouTSJCmAgTgBWrSyKpIvL6/Gle5/GHZMwOBoNEIFwnxD
DhOyjAeycXa5+EfcJY4tSlXiZmvs9SEz1NdYRQnBDxs7s1WBf0XMjO+IRJIj2HlC
vE24/LaeVmr9BnVOuylmqCUJInN5Jw==
=UfKG
-----END PGP SIGNATURE-----

--iAfYGwbU4kDAge8S--


--===============9146906435201261441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9146906435201261441==--

