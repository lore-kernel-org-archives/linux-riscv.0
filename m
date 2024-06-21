Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4A1C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 08:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+UgHENmLhQutnmCbfH0Fv6XJ2qO06SIpDLVRjqVqeo=; b=qjpH6VGmfH1myPCQUKZk19n0Ng
	A4a8/cjwY7x3lAbUknfndvf3Z+Puk7EQvAwicHmZfHtBK0V+inJyQGkf12i3JAshL2MaAZ2iVYAzI
	i95KsgoI2MQLU/P+C8CDEWeb/e+UApaQh9oaFqcygtsqbrEDhrj0w9iR3ReEkQGdfU23tihAYjWiy
	HqNqJZMSs94tJi+irx4psYWEEx3zzRlxGq4GTrpxP8Fypcw0O9AqxXgvYWQHQOVzIsv5iFPFjIFoc
	h+7ZAgi6PlyLzWZP9So/i72StWPGCvPFDpToa5lR3pRiTzTUwiDgfxVr3S2qLkvLk+RnA/USWwu1+
	lYiXIZHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZDR-00000008F80-25p9;
	Fri, 21 Jun 2024 08:01:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZDM-00000008F5p-2L5K;
	Fri, 21 Jun 2024 08:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718956904; x=1750492904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/8U21ieG/xam9mqjZuainYvWT0HJGgXaxs10B0hv06I=;
  b=M97Xl91P7h33sZYlJaCSAqbQn/cQ+juX8oRfWzqxWoaB7F0w08bmgxcM
   sCV+X6fWkc7MCz3SAyo8tXV1gkEdpnxDgMQtUP7VKOHb9QqRC2kEZBSDQ
   855rrIgvSpngtSHvSmr2Brb9BdKw3R9CMchMkMGLAR3rgnLNNKTbOKDxB
   fwxZzEJI0geQn6/xcM1jr/BCSRI8k1I17QQiKikBg50CtEbXvrfklut1w
   DQw7CbiQCl4MdCjx0T7hlot1IE7nFCEWucae7KI0sGkf+xT5jcP2bMeIk
   pyigFZapJiSpvprUi1u9h/uLDmx/S/IPu8nuzuYHFqx02E/htB/mGnPwa
   A==;
X-CSE-ConnectionGUID: OYcrU40nQFmm0LLNhIk6Pw==
X-CSE-MsgGUID: uI1EHhk1Q9y5tyT8v//LiQ==
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="asc'?scan'208";a="259202488"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Jun 2024 01:01:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 21 Jun 2024 01:01:29 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 21 Jun 2024 01:01:24 -0700
Date: Fri, 21 Jun 2024 09:01:05 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Yong-Xuan Wang <yongxuan.wang@sifive.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <kvm-riscv@lists.infradead.org>,
	<kvm@vger.kernel.org>, <apatel@ventanamicro.com>, <ajones@ventanamicro.com>,
	<greentime.hu@sifive.com>, <vincent.chen@sifive.com>, Jinyu Tang
	<tjytimi@163.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel
	<anup@brainfault.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, Atish
 Patra <atishp@rivosinc.com>, wchen <waylingii@gmail.com>, Samuel Ortiz
	<sameo@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>, Xiao Wang
	<xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew
 Morton <akpm@linux-foundation.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>, Samuel Holland
	<samuel.holland@sifive.com>, Jisheng Zhang <jszhang@kernel.org>, Charlie
 Jenkins <charlie@rivosinc.com>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v5 1/4] RISC-V: Add Svade and Svadu Extensions Support
Message-ID: <20240621-enchanted-unfasten-6d71b1ecd791@wendy>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-2-yongxuan.wang@sifive.com>
 <09f427cd-74ad-4aa5-81b1-995af2b6e1d1@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <09f427cd-74ad-4aa5-81b1-995af2b6e1d1@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_010144_935206_B3ED3B36 
X-CRM114-Status: GOOD (  19.74  )
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
Content-Type: multipart/mixed; boundary="===============8097962336180141316=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8097962336180141316==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5AFAaEg/n/Anupu4"
Content-Disposition: inline

--5AFAaEg/n/Anupu4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 09:52:01AM +0200, Alexandre Ghiti wrote:
> On 05/06/2024 14:15, Yong-Xuan Wang wrote:
> > Svade and Svadu extensions represent two schemes for managing the PTE A=
/D
> > +/*
> > + * Both Svade and Svadu control the hardware behavior when the PTE A/D=
 bits need to be set. By
> > + * default the M-mode firmware enables the hardware updating scheme wh=
en only Svadu is present in
> > + * DT.
> > + */
> > +#define arch_has_hw_pte_young arch_has_hw_pte_young
> > +static inline bool arch_has_hw_pte_young(void)
> > +{
> > +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU) &&
> > +	       !riscv_has_extension_likely(RISCV_ISA_EXT_SVADE);
> > +}
>=20
>=20
> AFAIK, the riscv_has_extension_*() macros will use the content of the
> riscv,isa string. So this works fine for now with the description you
> provided in the cover letter, as long as we don't have the FWFT SBI
> extension. I'm wondering if we should not make sure it works when FWFT la=
nds
> because I'm pretty sure we will forget about this.
>=20
> So I think we should check the availability of SBI FWFT and use some glob=
al
> variable that tells if svadu is enabled or not instead of this check.

No. If FWFT stuff arrives, it should be plumbed into exactly the same
interface. "Users" should not have to think about where the extension is
probed from and be able to use the same interface regardless.

The interfaces we have have already caused some confusion, we should not
make them worse.

--5AFAaEg/n/Anupu4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnUzNAAKCRB4tDGHoIJi
0uuGAP9Bm5ygy05cg4wKg5y9lqC76rVPgngZCQO1I648KyMFrwD+M1+iBKLXKdDH
xaTCLonuJOr+ErXPGNikXsfRBCcP5A8=
=HAt6
-----END PGP SIGNATURE-----

--5AFAaEg/n/Anupu4--


--===============8097962336180141316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8097962336180141316==--

