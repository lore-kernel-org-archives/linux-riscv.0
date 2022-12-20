Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947FAC10F1E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2qAi6eiFrW5x8YDN4QGTzFxw+awcJfcJA9OvSqKUoI=; b=o0yvBlDuCX5MytLBYsvosXjhbX
	3D8KdbctvJCO4y5ZnF7tkwQm3pyVOY1efArK2Z3Js6HlOf/t+1aGEHktDMJdvYU11wkkJZmxidqbT
	5CzUDwS9feBChYIKgZGNynuNJw1UQApwhKavc8SeCv6bCF67tVfnjkj0K0wUGqG23tCSejC82wgjx
	kPs+SbkP379EAGU+qA/XTyoN9FFHNZx77Qdrez9QyUMwPiVRbH7GGQO9yQOLk/gdAIzmksaeqRngc
	qHRBClGUrkSVHRpfAgkQX1/Sjm5BHIodqhz8QamfTk7UPF2iD4DWpGtea6wsvwEr0/eW+UYLGbe62
	nkZxIMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7brt-00Ev5o-Uv; Tue, 20 Dec 2022 12:37:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7brd-00EufC-CL
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 12:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1671539817; x=1703075817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RGacDJXPeGI2ctmaR2REgUNtAprKPUqUN5p+3SM6GGc=;
  b=NQA//yROsj3QFKhnxkIO4rjawb3wzMk4qdbSQtY0OMa/NecibvCESsN8
   /bdC4Iy1gT4UYs44FbP2aNsXRL6Xn4/5eUNRDmPgNfl8RnBEWZrZFQEdP
   qle+/k/VT2D2LbX/iux5FpwGyY9q9XmyLeVheimIx1dstKrHD8lzD5OSf
   91wGjmiRubrdolCJR/1jZnTXNnaAIIcN/53fiXb8sRB82qu1RlryPCkVS
   MHHAHLaw4asYCBJmNy2TX2icIEUsGxWqVG4XZd1EbU+C4rdGT6MIW4wmp
   u5EESkCs/OsGus+zVTY77i+CeDStRDEqX0cib755mICUg1lLHatiiQaeC
   A==;
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="asc'?scan'208";a="128981610"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Dec 2022 05:36:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 20 Dec 2022 05:36:50 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 20 Dec 2022 05:36:49 -0700
Date: Tue, 20 Dec 2022 12:36:29 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Ruinland Tsai <ruinland.tsai@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <greentime.hu@sifive.com>,
	<kito.cheng@sifive.com>
Subject: Re: [RFC PATCH 0/1] About adding new Z extensions in ISA realization
Message-ID: <Y6GsTZRw3Tu6wAGZ@wendy>
References: <20221220120236.219804-1-ruinland.tsai@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20221220120236.219804-1-ruinland.tsai@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_043657_601461_C286E270 
X-CRM114-Status: GOOD (  27.53  )
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
Content-Type: multipart/mixed; boundary="===============0730818673111814920=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0730818673111814920==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/oU6CLcCSELs1DPU"
Content-Disposition: inline

--/oU6CLcCSELs1DPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Ruinland!

On Tue, Dec 20, 2022 at 12:02:35PM +0000, Ruinland Tsai wrote:
> Dear all,
> I am wondering about what is the policy on adding new multilettered
> extensions into the ISA realization mechanism ?

There's already been a few added, so it's largely a case of
rinse-and-repeat?

> Currently we have plenty ratified exntensions left un-added, and some
> of them are already being used frequently

Which in-the-wild SoCs actually have support for the unsupported
extensions, out of curiosity? It'd be nice to have one with zbb support
at the very least.

> such as the B extension
> family - - namely, the zba, zbb, zbc, and zbs.

Heiko has been working on incorporating zbb support here:
https://lore.kernel.org/linux-riscv/20221130225614.1594256-1-heiko@sntech.d=
e/#t

The first half of this patchset is likely to be applied immediately
after -rc1. That half has been split out and is here:
https://lore.kernel.org/all/20221207180821.2479987-1-heiko@sntech.de/

Clearly though that's trying to use zbb in the kernel so is not quite
the same as what you are doing here with just adding them to the various
structs.

There was another patchset in June (ignore my & Samuel's confusion about
ordering, that's been resolved since) that added some HWCAP stuff for a
superset of the extensions you've mentioned here:
https://lore.kernel.org/linux-riscv/YqY0i22SdbHjB%2FMX@Sun/
That'd need a rebase to apply on current code anyway (and I'd prefer if
my patches cleaning up the ordering in those structs got applied before
we add more extensions "out of order" to them!)

There's also been discussion about whether it is sustainable to keep
adding stuff to hwcap like this, but I have not been able to find the
particular ML posts for that. Palmer spun up a PoC for a syscall & Heiko
has said he would look into following up on that work after the inital
zbb stuff was ready.

The Higher Powers^TM will have to comment on what the policy is with
adding more extensions in the interim. I'll admit it is a bit odd to
not at least inform userspace as to what the actual ISA is.
Heiko or Palmer, perhaps you've got a better idea of what the craic is
there?

> Being unsure about whether I have done it in the right way, hence I
> wrote this RFC for adding those extensions.
>=20
> Also, just as I have inquired on the list before, what about the vendor
> extensions?

Since you didn't link the previous questions, I dunno what they were,
but...

After the discussion at the Plumbers BoF, the policy about vendor
behaviour has been changed. The new wording is:
<quote>
Additionally, the RISC-V specification allows implementers to create
their own custom extensions.  These custom extensions aren't required
to go through any review or ratification process by the RISC-V
Foundation.  To avoid the maintenance complexity and potential
performance impact of adding kernel code for implementor-specific
RISC-V extensions, we'll only consider patches for extensions that either:

- Have been officially frozen or ratified by the RISC-V Foundation, or
- Have been implemented in hardware that is widely available, per standard
  Linux practice.
<\quote>

> If a vendor wants to submit a vendor extensions without
> reavealing the detailed sepcs, what will be examined ?

I can only imagine that this would vary completely depending on what
that extension is doing? I'm not sure how you would expect anyone to be
able to review something though if you do not provide any information?

Unless the answer is "no vendor extensions without specs", this sounds
like something that could only be answered once code is available.

Not the answers you were looking for perhaps Ruinland, but hopefully I
was at least somewhat helpful.

Thanks,
Conor.


--/oU6CLcCSELs1DPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6GsSQAKCRB4tDGHoIJi
0rP8AQCrmSkyQgOZN1w2jNQKKEgtZqvXVydZMNbbzDu3XJ2LUAEAqCRpNHuELYrh
ilmu1ELB+mBqbruj1E8EKxAC6PyI1ww=
=dU+O
-----END PGP SIGNATURE-----

--/oU6CLcCSELs1DPU--


--===============0730818673111814920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0730818673111814920==--

