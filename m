Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC95FC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9Q6Eceygj7LekSumkumwhaPViLPcgKydd6qWrD92r4=; b=3c+L2grzWoAjtd9nJ92X4JdMQl
	HCtqOp+Ujg5rhz6vmugkRCgekZf4WMk8fw3HmT8bThAxKCHd457Bz60CCJ8sJFPW+atp1+B2bE6dH
	o26hoZf+NY6HdB+YRCCCgbeY3omTAJDyATkVw4rk69Ox6to92w9hOa/5XHNqutQmdSCwQPspd97YW
	r3vGaw9gbhTFST+8wW69KJPgd9hIRB3Ek1IFG6qmbyXV65pWVW965x9afn87BCHWdOM2RJ4CzyMEE
	z8plG6ZyDHE6fahTQlzY+aADll7WJgZm4qZmA0PNWv50XfQO9tWF+n13KxuyJJrOkEt1srxcFT4rG
	ElaPSSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMGa-002EKe-05;
	Thu, 23 Mar 2023 14:50:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMGV-002EFW-29;
	Thu, 23 Mar 2023 14:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679583007; x=1711119007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h4CS8S4czEwPAj/kAQo+lfzDYMoZ/HCv2kQL4ZKmB4I=;
  b=Q4v/uXYhtnMbhlEhASizU0UlWSpd5Y/KXkeE8r/R3xat9eTqIxzeuGuR
   Y0z/uM+dTNvloQpgqLmmaGNtcwIAoyjHjp+Ri0vz3s3iXUJM2Esm0iOb+
   csjSLaDCcVjzUDkVBWRO6s7kItJ4YofeH8THUpxAPDOkPVj1EKIcBuxrt
   Gdg0MrlO9SsUHTrw3ZZsAAp91IFqGeyw4iyiiZp2kgi68kTLAmtxq4i7m
   ohIo4jlI3DtAtmjRCtu2IrKUiF/WmAKirOSU/8hcH31faa9UPKD8iYJbF
   TTJV+Z0oykaeU1hgORPnDj5RzNKxkWnykhvz0blO1i83217/Ifq9UnWQ6
   w==;
X-IronPort-AV: E=Sophos;i="5.98,285,1673938800"; 
   d="asc'?scan'208";a="143542635"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Mar 2023 07:49:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 07:49:56 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Mar 2023 07:49:53 -0700
Date: Thu, 23 Mar 2023 14:49:34 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Andrew Jones
	<ajones@ventanamicro.com>, Jisheng Zhang <jszhang@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup
 Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Heiko
 Stuebner <heiko@sntech.de>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, <regressions@leemhuis.info>,
	<regressions@lists.linux.dev>
Subject: Re: [PATCH] riscv: require alternatives framework when selecting FPU
 support
Message-ID: <af690061-f962-498e-b2df-d2e6119292cf@spud>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel>
 <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
 <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
 <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_075007_831981_9A657DA7 
X-CRM114-Status: GOOD (  26.99  )
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
Content-Type: multipart/mixed; boundary="===============7266635807653401302=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7266635807653401302==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WAnLRcLV3Ph+ynOR"
Content-Disposition: inline

--WAnLRcLV3Ph+ynOR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 09:19:50PM +0100, Jason A. Donenfeld wrote:
> On Wed, Mar 22, 2023 at 9:05=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Mar 22, 2023 at 07:44:13PM +0000, Conor Dooley wrote:
> > > On Wed, Mar 22, 2023 at 08:26:10PM +0100, Andrew Jones wrote:
> > > > On Wed, Mar 22, 2023 at 03:17:13PM +0000, Conor Dooley wrote:
> > > > > On Wed, Mar 22, 2023 at 01:46:31PM +0100, Andrew Jones wrote:
> > >
> > > > > > (It's tempting to just select RISCV_ALTERNATIVE from RISCV, but=
 maybe we
> > > > > >  can defer that wedding a bit longer.)
> > > > >
> > > > > At that point, the config option should just go away entirely, no?
> > > >
> > > > Ah, yes, and that makes the idea even more attractive, as we could =
remove
> > > > several ifdefs.
> > >
> > > I went and did the cursory check, it's not compatible with XIP_KERNEL=
 so
> > > dropping the option entirely probably isn't a possibility :/
> >
> > What I said is only now sinking in. We're now going to be disabling FPU
> > support on XIP kernels with this patch.
> > Well, technically not this patch since it wouldn't have built without
> > Jason's changes, but that doesn't seem like the right thing to do...
>=20
> I suppose you could have riscv_has_extension_*() fall back to
> something that doesn't use alternatives on XIP kernels.

Yah, something like the below I guess? Probably overlooking something
silly & it's lost the benefit of the static branch that it used to have,
but with the infra that we have at the moment this seemed like the
sanest thing to do?

This would requiring picking up your patch Jason, but with an
"if !XIP_KERNEL" added to the select.

It's only had the lightest of build tests, but I can go make it a real
patch if there's not something obviously amiss.

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e3021b2590de..6263a0de1c6a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -57,18 +57,31 @@ struct riscv_isa_ext_data {
 	unsigned int isa_ext_id;
 };
=20
+unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
+
+#define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
+
+bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int =
bit);
+#define riscv_isa_extension_available(isa_bitmap, ext)	\
+	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
+
 static __always_inline bool
 riscv_has_extension_likely(const unsigned long ext)
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
 			   "ext must be < RISCV_ISA_EXT_MAX");
=20
-	asm_volatile_goto(
-	ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
-	:
-	: [ext] "i" (ext)
-	:
-	: l_no);
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		asm_volatile_goto(
+		ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
+		:
+		: [ext] "i" (ext)
+		:
+		: l_no);
+	} else {
+		if (!__riscv_isa_extension_available(NULL, ext))
+			goto l_no;
+	}
=20
 	return true;
 l_no:
@@ -81,26 +94,23 @@ riscv_has_extension_unlikely(const unsigned long ext)
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
 			   "ext must be < RISCV_ISA_EXT_MAX");
=20
-	asm_volatile_goto(
-	ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
-	:
-	: [ext] "i" (ext)
-	:
-	: l_yes);
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		asm_volatile_goto(
+		ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
+		:
+		: [ext] "i" (ext)
+		:
+		: l_yes);
+	} else {
+		if (__riscv_isa_extension_available(NULL, ext))
+			goto l_yes;
+	}
=20
 	return false;
 l_yes:
 	return true;
 }
=20
-unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
-
-#define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
-
-bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int =
bit);
-#define riscv_isa_extension_available(isa_bitmap, ext)	\
-	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
-
 #endif
=20
 #endif /* _ASM_RISCV_HWCAP_H */

--WAnLRcLV3Ph+ynOR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBxm/gAKCRB4tDGHoIJi
0iuPAQCj0oB2PJm3sAnzQn4lJ3P3IQyfftDTZrZVctDQipZ9xwD8DCL8PQqFHGGb
iqK+RMu43c4MOpwgWxlM+qkjCjCdTQg=
=RGLC
-----END PGP SIGNATURE-----

--WAnLRcLV3Ph+ynOR--


--===============7266635807653401302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7266635807653401302==--

