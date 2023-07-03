Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE57EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 12:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hdg/PDew1pi1IKOs8jcSq3dV0qcvUGxbynabCkD3ac=; b=kTfKJEiM4lXI4C10QSOxR69enE
	SnPiiTzhhKS3nUEN+Vnu8UAlFtlNZm9fFB45174wIzYFvi6EJCeOi6OX9zilvLFs/+TFxkdLedHSb
	GW6rB8FPI8kvZvW5Rjp2ghNAcq7kszQLO0g7y2lPhuwMKIBHFfCHIOJ6EUGucnusuVWjdds88usyX
	cjIkYrxjr0fYjkWsj+Aw9xtn8O85JT2q3BApuA99nnZ41zDAU3VGg8RklTxGsTgh8ETWd3Fv58vt8
	d8WWm1Rd0YswdkgJXBxAeIwsSXCm8GnZ17CeCRMTThTVL0ZWRbgZZSguJtQWQbEduq3+QzrCj/f7m
	sTRuC9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIX2-00ASty-0y;
	Mon, 03 Jul 2023 12:19:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIWx-00ASqs-25
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 12:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688386787; x=1719922787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N4gKd8fWbYJ/ABi5Z6Bl0mGhtTl4jH7aIaIsRqTpg5A=;
  b=pb/DuBbkQ/8TjkeEvGRViohO1nALHnGWsZKrfgxga0urSE8HxYFOa5Go
   UJUXV9Jv1808+kQmQ5ZGzxP6cRu8sIeH1MHaRgSB0MSr5U57uZ7yx6ccd
   RLEhC2nJDByDRRyD3gPK4TvUuM+UgGa/yIvD5IChO2x4nBpOEtw8KbEyV
   O7yzZmlSDH2e0G3PObs93d1hjFSiHEJbpzdzmVT1bYP8PvG9Au3L49zG0
   oecw1Cvknxc3fSC5/j3PBNA1dwbbuq/XSCXOeJW/uaKd6f6LlGqcQj/3r
   xByXYMR2rVZd7eMdGsLVcyHLonvP1/9BhrfbTv+BKTQXLQ9FqmS8APcR1
   g==;
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="asc'?scan'208";a="233459359"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2023 05:19:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Jul 2023 05:19:32 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Jul 2023 05:19:28 -0700
Date: Mon, 3 Jul 2023 13:18:59 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?utf-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Subject: Re: [External] Re: [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
Message-ID: <20230703-handstand-prototype-733d702c946c@wendy>
References: <20230702095735.860-1-cuiyunhui@bytedance.com>
 <20230702-headway-dreamlike-d7ba39ac4910@spud>
 <CAEEQ3wnzf=iDDHJATo2vdVz-SDNYRGBEEb7sXUyGojgP4ZAgaA@mail.gmail.com>
 <20230703-glorified-headless-16e998608eaa@wendy>
 <CAEEQ3wnjYK+Jj9Ce_yEHPL_z3eYn4OKP85YLXnVeaPd+SA3DJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEEQ3wnjYK+Jj9Ce_yEHPL_z3eYn4OKP85YLXnVeaPd+SA3DJw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_051947_845949_78BC5648 
X-CRM114-Status: GOOD (  19.52  )
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
Cc: mark.rutland@arm.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, lpieralisi@kernel.org, jdelvare@suse.com, linux-riscv@lists.infradead.org, ardb@kernel.org, geshijian@bytedance.com, tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-acpi@vger.kernel.org, lenb@kernel.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, paul.walmsley@sifive.com, angelogioacchino.delregno@collabora.com, weidong.wd@bytedance.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, rminnich@gmail.com, palmer@dabbelt.com, yc.hung@mediatek.com
Content-Type: multipart/mixed; boundary="===============7422397331079569499=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7422397331079569499==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EZbNUtLsl36cHBYP"
Content-Disposition: inline

--EZbNUtLsl36cHBYP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 06:16:07PM +0800, =E8=BF=90=E8=BE=89=E5=B4=94 wrote:
> Hi Conor,

> This needs to be confirmed with you:

> Continue to follow the current code structure, patch 1/3 is placed in
> arch/riscv/, and 2/3 is placed under driver/firmware?

You do want the SMBIOS stuff to be cross architecture, right?
If so, keeping the code as-is seems to make the most sense to me.

> How about changing the commit log to the following?
>=20
> riscv: obtain ACPI RSDP from devicetree.
>=20
> On RISC-V, when using Coreboot to start, since Coreboot only supports
> DTS but not EFI, and
> RISC-V does not have a reserved address segment.
> When the system enables ACPI, ACPI RSDP needs to be passed through DTS

I would probably write something like:
	On RISC-V, Coreboot does not support booting using EFI, only devicetree
	nor does RISC-V have a reserved address segment.
	To allow using Coreboot on platforms that require ACPI, the ACPI RSDP
	needs to be passed to supervisor mode software using devicetree.
	Add support for parsing the "configtbls" devicetree node to find the
	ACPI entry point and use wire up acpi_arch_get_root_pointer().
	This feature is known as FDT Firmware Interface (FFI).

> > > > > +extern u64 acpi_rsdp;
> > > >
> > > > /stuff/linux/drivers/acpi/osl.c:178:22: error: redefinition of 'acp=
i_rsdp' with a different type: 'unsigned long' vs 'u64' (aka 'unsigned long=
 long')
> > > >
> > > > Fails to build when Kexec is enabled.
> > >
> > > Rename my acpi_rsdp to arch_acpi_rsdp? WDYT?
> >
> > You could do s/arch/riscv/ either, that'd match what we prefix a lot of
> > stuff with.
>=20
>  Sorry, I don't quite understand what you mean. Could you tell me in deta=
il?

What I meant is that variables & functions in /arch/riscv are often
prefixed with riscv_. I was saying that you could change "arch_acpi_rsdp"
to "riscv_acpi_rsdp".

Thanks,
Conor.

--EZbNUtLsl36cHBYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKK8swAKCRB4tDGHoIJi
0iOsAP9nUhe+52G7iYGgpanW05h65F/yeBcQLU0dulmrEn1S2wD/XL9sbVYP1TMX
cVk+054gMsIjpM3cP3p/ta7JxOrCMwc=
=iWQ3
-----END PGP SIGNATURE-----

--EZbNUtLsl36cHBYP--


--===============7422397331079569499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7422397331079569499==--

