Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E239DEE645B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 12:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0S118Z42EX22C2j4+cT8Q7pfvyeazf/sm11ZKDC9rjI=; b=o2PpaTXNHPpfCdPnUSGZceVaw0
	AbzFiE3/eVD0aHGi3mC2fjAxYjolN4CbF1aA6tM/Ym/4f2O6A9MdIpbn2BiJyWiRZwF2KiFSBcrB9
	z2ctJo2Ib6LerLEjBNPm3LeKmn+WTtR3TNZsU7Tzyb+truTG1cvm1hAAXbiRlhMw6FoEdprT8GEBD
	xSNhc/69y30AtM6BA0dzvwFjhU2jQ/sdWU9yX8vrx8BQv8BHUUpdwnscQ6NwHWjQFu/QXSlef6MPW
	z4NfTlM1AzfDjkiBETea+PFTyvnIIyArqQCK1Ef07OBGqJ9MmbeuuPdIW6jjEsrr4+RxHrV7VytYQ
	6mOJI9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh8KO-00Al3I-2W;
	Fri, 15 Sep 2023 12:53:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh8KJ-00Al2F-0z
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 12:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694782419; x=1726318419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fy5E7iactUuOk/E7Asavn2wfTbB47hTdkHiZ8f3/+lM=;
  b=OdNzbQDdXZC5J/Fr9AyY1oU2mNSHfbyjLz3BhLPiRD6c1CTP9qfi9hHv
   TpHfaCk0V46DDdFSazKkPDJnFk0afO6ZDGkwdFB0UwFlQiX7MnCt/lrvh
   Po/rZUgDImzfWBixwsgVZlHzVQHXhIf0np4N5Yhyuvt3QqV1R3vM8eZ8C
   rByFrQXLKaDFQ0WBi7tmPmHPv9D5FjU6uj/r6Z1FAgcodfgDLNlNk3DOt
   qKlbqonHRxuWUj/wTcHSntuBMVgvQzwG+hMLM50rFA1JU1l0W5xnhcIBL
   UGTnYNxwZfqeNDdNjuNf+FGy3XSKpfSlhtfFRLYhXoblu0b8kq+L7X3GM
   w==;
X-CSE-ConnectionGUID: 3TZVR8qTTNydN499RGxjdA==
X-CSE-MsgGUID: bgKT2ZCwQAaHMVFXG3kIKw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="asc'?scan'208";a="4859799"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2023 05:53:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 15 Sep 2023 05:53:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 15 Sep 2023 05:53:17 -0700
Date: Fri, 15 Sep 2023 13:53:00 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <guoren@kernel.org>, <paul.walmsley@sifive.com>, <anup@brainfault.org>,
	<peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
	<palmer@rivosinc.com>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<tglx@linutronix.de>, <paulmck@kernel.org>, <rostedt@goodmis.org>,
	<rdunlap@infradead.org>, <catalin.marinas@arm.com>,
	<xiaoguang.xing@sophgo.com>, <bjorn@rivosinc.com>, <alexghiti@rivosinc.com>,
	<keescook@chromium.org>, <greentime.hu@sifive.com>, <jszhang@kernel.org>,
	<wefu@redhat.com>, <wuwei2016@iscas.ac.cn>, <leobras@redhat.com>,
	<linux-arch@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
	<virtualization@lists.linux-foundation.org>, <linux-csky@vger.kernel.org>,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 03/17] riscv: Use Zicbop in arch_xchg when available
Message-ID: <20230915-unseated-runway-7f519a57034f@wendy>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-4-guoren@kernel.org>
 <20230914-892327a75b4b86badac5de02@orel>
 <20230914-74d0cf00633c199758ee3450@orel>
 <20230915-removing-flaky-44c66da669ae@wendy>
 <20230915-ff4bd6cd721ed9bc4c4eb101@orel>
MIME-Version: 1.0
In-Reply-To: <20230915-ff4bd6cd721ed9bc4c4eb101@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_055341_805204_01A096E8 
X-CRM114-Status: GOOD (  26.37  )
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
Content-Type: multipart/mixed; boundary="===============3574734638551649713=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3574734638551649713==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AHl5K11HRR7A6/jr"
Content-Disposition: inline

--AHl5K11HRR7A6/jr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 02:14:40PM +0200, Andrew Jones wrote:
> On Fri, Sep 15, 2023 at 12:37:50PM +0100, Conor Dooley wrote:
> > On Thu, Sep 14, 2023 at 04:47:18PM +0200, Andrew Jones wrote:
> > > On Thu, Sep 14, 2023 at 04:25:53PM +0200, Andrew Jones wrote:
> > > > On Sun, Sep 10, 2023 at 04:28:57AM -0400, guoren@kernel.org wrote:
> > > > > From: Guo Ren <guoren@linux.alibaba.com>

> > > So, we could maybe proceed with assuming we
> > > can use zicbom_block_size for prefetch, for now. If a platform comes =
along
> > > that interpreted the spec differently, requiring prefetch block size =
to
> > > be specified separately, then we'll cross that bridge when we get the=
re.
> >=20
> > That said, I think I suggested originally having the zicboz stuff defau=
lt
> > to the zicbom size too, so I'd be happy with prefetch stuff working
> > exclusively that way until someone comes along looking for different si=
zes.
> > The binding should be updated though since
> >=20
> >   riscv,cbom-block-size:
> >     $ref: /schemas/types.yaml#/definitions/uint32
> >     description:
> >       The blocksize in bytes for the Zicbom cache operations.
> >=20
> > would no longer be a complete description.
> >=20
> > While thinking about new wording though, it feels really clunky to desc=
ribe
> > it like:
> > 	The block size in bytes for the Zicbom cache operations, Zicbop
> > 	cache operations will default to this block size where not
> > 	explicitly defined.
> >=20
> > since there's then no way to actually define the block size if it is
> > different. Unless you've got some magic wording, I'd rather document
> > riscv,cbop-block-size, even if we are going to use riscv,cbom-block-size
> > as the default.
> >
>=20
> Sounds good to me, but if it's documented, then we should probably
> implement its parsing. Then, at that point, I wonder if it makes sense to
> have the fallback at all, or if it's not better just to require all the
> DTs to be explicit (even if redundant).

Sure, why not I guess.

--AHl5K11HRR7A6/jr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQRTrAAKCRB4tDGHoIJi
0jC/AP4yIa3GuPAqy1hpoYpYwpy0ZYwvAT8Pxx/ZnbMaKl8GOAEAx6w8VycBziq2
ENX9YTMH8AbfihyqNUkRC963e+VggwY=
=kCxr
-----END PGP SIGNATURE-----

--AHl5K11HRR7A6/jr--


--===============3574734638551649713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3574734638551649713==--

