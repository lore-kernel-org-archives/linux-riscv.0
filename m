Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D0FC6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZKmnwUVf5UOZAY9iBOn0UG54Re/wSVzacG4Ab99KL8=; b=P0zISD4RJ085tYrIwLLbxRvBJI
	B7+16+ZPhqDCRxf26zSQ8jmo48N5z0kJpUw2IUwaevTAIgjewwCf0/wStb0ntMm+9lADu1tOIt542
	AIWML9HKqGZvoi9evMPCwHRedJXHgCKp8fT7cJnKn+sfFGeDnELE1a/v4m3oAunGn15xluvdN6CYE
	8h2l0biRRLXnZhV7uH06R8FD7Mh2zCdFqsfhjA3jKPNKuhrUMwTNQ8t9N0M9fRzycpw/Fn9D7FZra
	B0Ewnoh3BKs/CYxF+2vujVnE4MjvVaApYSIo/RWM5hd/RVlARYOvy92k57/NuAcCKujIl0CFcbiDd
	UxWGXKkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjfJe-001BBZ-1U;
	Tue, 04 Apr 2023 11:59:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjfJa-001B8d-0U;
	Tue, 04 Apr 2023 11:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680609546; x=1712145546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yf84yJ47fRZZVKYSzUL/KnC/GlQL2L+iPq43dwG8FL8=;
  b=fimpj79JmaUEeoP4CCqmkSp1u7m7b8DOwCKz92iKHzYVMReHdA0Fp4Xc
   bjKvDwe0bwrBw4qb+g8N8dacC8iwXbCH6Wld2Miw07U1srR10DZwzssLO
   SIVP+ZRVSTgyWl4ZfBay41uHrbPAOs1QhAER/YWjdBi9Phz1WnFrMzFNx
   3mxZgpZpBxFLKIiM3cSOlfApxJIthaPKN0hH0+f33lN2Fy+RGFX/SyIxS
   fm05b3ZHrelKJ2sUHTYm0k4YRF5d0EJBSmD2cxx7/ZseBCwfeikKfNqIe
   1duN0+mZ/QuXTHLqhPsrx+zInH/Ea+X1rrlietpfEtaokXOXS+um6OEXn
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,317,1673938800"; 
   d="asc'?scan'208";a="208769362"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Apr 2023 04:59:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 04:58:57 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 4 Apr 2023 04:58:55 -0700
Date: Tue, 4 Apr 2023 12:58:41 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>, Anup Patel <apatel@ventanamicro.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bjorn@kernel.org>
Subject: Re: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
Message-ID: <20230404-5cfffb017198773dc3e81dab@wendy>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-7-apatel@ventanamicro.com>
 <osrpjiywxtkgxb5i6mfvxzfrzrnjv75uqzvlu3fouo4mqsktgj@blcmyjt3twqg>
 <CAAhSdy1JEQBiO55iCy97arO63VjGc+NicUvvwzTpK97W97LmJg@mail.gmail.com>
 <ejt3x4p7xhxfvwiafnogfwdn5dzd4qyowlht22utnbvzefsbyh@7dch4mebwckm>
 <uogikq56rf7jytuufhsutdedb73b3rh67biwpzsz6ngg5rudco@qcwt7plumwpb>
MIME-Version: 1.0
In-Reply-To: <uogikq56rf7jytuufhsutdedb73b3rh67biwpzsz6ngg5rudco@qcwt7plumwpb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_045906_299492_2D9A8471 
X-CRM114-Status: GOOD (  15.75  )
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
Content-Type: multipart/mixed; boundary="===============2219630445949189138=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2219630445949189138==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5GJ1H1BOzV0sFIzx"
Content-Disposition: inline

--5GJ1H1BOzV0sFIzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 01:52:43PM +0200, Andrew Jones wrote:
> On Mon, Apr 03, 2023 at 02:23:01PM +0200, Andrew Jones wrote:

> > It's probably best if neither depend on each other, since they're
> > independent, but otherwise the order doesn't matter. It'd be nice to ca=
ll
> > the order out in the cover letter to give patchwork a chance at automat=
ic
> > build testing, though. To call it out, I believe adding
> >=20
> > Based-on: 20230401112730.2105240-1-apatel@ventanamicro.com
> >=20
> > to the cover letter should work.
>=20
> I also just noticed that this based on "RISC-V: KVM: Add ONE_REG
> interface to enable/disable SBI extensions"[1] and it needs to be
> in order to pick up the KVM_REG_RISCV_SUBTYPE_MASK and
> KVM_REG_RISCV_SUBTYPE_SHIFT defines. It'd be good to call that
> patch out with Based-on.
>=20
> [1]: 20230331174542.2067560-2-apatel@ventanamicro.com

I've been waiting for a review on that for a while.. It's been 3
weeks, so just gonna merge it and see what breaks!

--5GJ1H1BOzV0sFIzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCwQ8QAKCRB4tDGHoIJi
0i39APsEperqNGR68oYf4cBWUJa5Q4Lux1nXIgwKhMES4jyVVAD/V7XKtbDF5fmm
GjZMMXMQKhoi5KsqHDaTwOKJ7BrEjwg=
=kicz
-----END PGP SIGNATURE-----

--5GJ1H1BOzV0sFIzx--


--===============2219630445949189138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2219630445949189138==--

