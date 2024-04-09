Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833F1CD128A
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 15:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1J29t/DNVU8welz23ViljmqdcJvnMB8Xka6NJzsshS4=; b=DEZNN1CaJQZayUmJqI1MYfh9/W
	VwqIgovyM7yuVah+8I+IitxqCOS07DbuVpNJ06IiVoymnXhx16b5N7Fp0JJYlBuMDB4xiPxiFiFap
	Mm/idNyycqUYJKswvi0uXqe50hwQKaUL7l9HPJbqlPpE8JDpYct+lU+kSKu7c3kpKgshUFFzh+xga
	+2+1CgKX+PFV1OsZ+AMmp1bBrPkFCcWWULb5F/rE2hEuNIyIMtNbikyh3+7OhIJLPi/JuB1uPYvEm
	xYMi7R6YeT0CQKZaZIFSpSJPaIhT/i8hxdwtS/2e7I5crARmlenc76pm/xPGRj0biqnmg/AjfA+xH
	GvohZCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDim-00000002n3i-0ZnC;
	Tue, 09 Apr 2024 15:49:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDif-00000002n0p-4BG8;
	Tue, 09 Apr 2024 15:49:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55FD8618C8;
	Tue,  9 Apr 2024 15:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05969C43390;
	Tue,  9 Apr 2024 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712677749;
	bh=ggaHHuc2VG2fdrOMhbw4XnILVWpXV0g7RGQkl6nlwv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcO6XzObc7wlgdxiDjy0f1wHeJ/xg90oJK1uvGdSoHGMh1uDr+/iRiQu11+OQMo4Q
	 sJVbfuMNUvyKdBlNhz0pFzDcPRsQRWgwCjoiC/5WC7ktrR5xGmTyH39axjMlKIWkBD
	 RoLLn6NtCxA4/EgdcW6ce1XZyV64uZgdpUFUW5KT4yIDRy/h0SnWdTjZN1/YZFglOO
	 ooFFV5hsQsFBynSxN5lYVTvFdQ1mYVB83rs42o/PTOwBdmwgjqH2N5lULzJiY8kv4y
	 PxoUnyv4L2D20qsLEHGbCn7fuFr44N1ZRwCjJc7e8WTO9o2xRMPJtm8/y77fjEyP7o
	 W4c1mQgm9bWnA==
Date: Tue, 9 Apr 2024 16:49:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Max Hsu <max.hsu@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 02/11] dt-bindings: riscv: Add Sdtrig optional CSRs
 existence on DT
Message-ID: <20240409-princess-hypnotic-7fd89aafa31d@spud>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
 <20240329-dev-maxh-lin-452-6-9-v1-2-1534f93b94a7@sifive.com>
 <20240329-affidavit-anatomist-1118a12c3e60@wendy>
 <20240405-ebdb2943657ab08d2d563c03@orel>
MIME-Version: 1.0
In-Reply-To: <20240405-ebdb2943657ab08d2d563c03@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_084910_691627_05779EA7 
X-CRM114-Status: GOOD (  24.20  )
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
Content-Type: multipart/mixed; boundary="===============9016159923132849342=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9016159923132849342==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S3RasL52JpCL7Ifu"
Content-Disposition: inline


--S3RasL52JpCL7Ifu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2024 at 05:59:41PM +0200, Andrew Jones wrote:
> On Fri, Mar 29, 2024 at 10:31:10AM +0000, Conor Dooley wrote:
> > On Fri, Mar 29, 2024 at 05:26:18PM +0800, Max Hsu wrote:
> > > The mcontext/hcontext/scontext CSRs are optional in the Sdtrig extens=
ion,
> > > to prevent RW operations to the missing CSRs, which will cause
> > > illegal instructions.
> > >=20
> > > As a solution, we have proposed the dt format for these CSRs.
> >=20
> > As I mentioned in your other patch, I amn't sure what the actual value
> > is in being told about "sdtrig" itself if so many of the CSRs are
> > optional. I think we should define pseudo extensions that represent
> > usable subsets that are allowed by riscv,isa-extensions, such as
> > those you describe here: sdtrig + mcontext, sdtrig + scontext and
> > sdtrig + hcontext. Probably also for strig + mscontext. What
> > additional value does having a debug child node give us that makes
> > it worth having over something like the above?
>=20
> Yeah, Sdtrig, which doesn't tell you what you get, isn't nice at all.
> I wonder if we can start with requiring Sdtrig to be accompanied by
> Ssstrict in order to enable the context CSRs, i.e.
>=20
>  Sdtrig          - support without optional CSRs
>  Sdtrig+Ssstrict - probe for optional CSRs, support what's found
>=20
> If there are platforms with Sdtrig and optional CSRs, but not Ssstrict,
> then maybe the optional CSRs can be detected in some vendor-specific way,
> where the decision as to whether or not that vendor-specific way is
> acceptable is handled case-by-case.

I think it's pretty reasonable to make sstrict a requirement for the
kernel's use of sdtrig. If we have some non-sstrict systems that do
implement these particular CSRs, then I guess we can add some psuedo
instructions then (and nothing would stop the sstrict systems also
specifying directly). If they're using some non-standard CSRs then
case-by-case I guess.

I'm just specifically not keen on adding extra dt properties that do
things we can already do with the ones we have!

--S3RasL52JpCL7Ifu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhVjbgAKCRB4tDGHoIJi
0uhaAQDa5o/BPeXShwDCWbzLtGoQJW9RQEEKp0v/Px0VcnBn/wEAtxi0+ePlahyg
iuqh+k0zlBfw0fgjAmUxXyvYlSonvAc=
=bIMw
-----END PGP SIGNATURE-----

--S3RasL52JpCL7Ifu--


--===============9016159923132849342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9016159923132849342==--

