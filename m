Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44618C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 14:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeK794Iexsn2xEvwh4CK96OVIkXDXUVFfFP6lDmqEZ0=; b=Hv/0zBt8X+n9Tld/EX0yHrtWI/
	QTFcIWr06L4xPZF/mHpibpLnmPit3470xF4+l3aufZfzTeBkNvHz9vtLX9w1z5L7wxiaSIAYXBhcG
	q5y1U+XKYeK1BMgBs2pS36ge7qFDQMMjICFUI+fRJZn+ew/vwOfS0QNve9Wh1Qx8Mt2oEA9yI8F8z
	D3YK4wzkmk/grj6WhrZBPWgrN04rMwjtxpECDNfd4rzMLRJ+NoYyR9vdVmH3WvAvOo4tOh2w/QkBw
	wRS7/2FnDUTmnQN0Opf3bKmxnhMxvh9A8M3BnhsZDEZSqok2PcAfFmODPbrNZx1lL/+dhXuGwFtH6
	buePOZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlht-0000000H0uI-2j9U;
	Thu, 13 Jun 2024 14:45:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlhq-0000000H0tQ-3Um5
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 14:45:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 26BB661B4D;
	Thu, 13 Jun 2024 14:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA901C2BBFC;
	Thu, 13 Jun 2024 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289937;
	bh=InMkkQqrp6LohnfMJCBwnWlQ6oAWATxmLwHmBrNPrGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTLGRq+msZPdiljWIIbChj7j0CTeKCfawgg6iDL6MqP+rFNN2aVjWpy0CmJVOAgKy
	 g6Kxc2TC8WMraFODKBYKhl8xXxsYE0OPT4Tv3T6MMsHj4u1AsnXyrCTTIKsnJx/OCA
	 EO/2gCT546u3YMbHbMIl8k4emxuNzqPS9oaOX8V47ftb7y4jMt3hmwV/9mupn94ozr
	 23giyNwjsiASb5BhFIpfiyLCKc9dvUqATFYa7z1vKRiyIw2Bkee0Q8VKnOjUNQ5Dy/
	 xRgPWZrxRYHts2EkCOyjvn+Zr827udCCaeOTbY9NLNEDlKAyJv2VkbfgJ8SVerevQO
	 tSZKfByHAP+sQ==
Date: Thu, 13 Jun 2024 15:45:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] riscv: Separate vendor extensions from standard
 extensions
Message-ID: <20240613-deepness-refried-c6dea811f6f6@spud>
References: <20240609-support_vendor_extensions-v2-0-9a43f1fdcbb9@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240609-support_vendor_extensions-v2-0-9a43f1fdcbb9@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_074538_943133_86A26C7A 
X-CRM114-Status: GOOD (  17.89  )
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
Content-Type: multipart/mixed; boundary="===============8967923809952177039=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8967923809952177039==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ICFdcertGdMCTx5g"
Content-Disposition: inline


--ICFdcertGdMCTx5g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 09, 2024 at 09:34:13PM -0700, Charlie Jenkins wrote:
> All extensions, both standard and vendor, live in one struct
> "riscv_isa_ext". There is currently one vendor extension, xandespmu, but
> it is likely that more vendor extensions will be added to the kernel in
> the future. As more vendor extensions (and standard extensions) are
> added, riscv_isa_ext will become more bloated with a mix of vendor and
> standard extensions.
>=20
> This also allows each vendor to be conditionally enabled through
> Kconfig.
>=20
> ---
> This has been split out from the previous series that contained the
> addition of xtheadvector due to lack of reviews. The xtheadvector
> support will be posted again separately from this.

I think that's a good call.

> The reviewed-bys on "riscv: Extend cpufeature.c to detect vendor extensio=
ns"
> and "riscv: Introduce vendor variants of extension helpers" have been
> dropped in this series. The majority of the code is the same in these
> patches, but thead-specific code is swapped out with andes-specific
> code. The changes are minimal, but I decided to drop the reviews in case
> I inadvertently introduced issues.

Actually, you only completely did that on the first of the two patches
you mention, but I don't mind.

--ICFdcertGdMCTx5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmsGDQAKCRB4tDGHoIJi
0pYSAP9rvZJvNB06EdO0fsFWf+ZcA3sSaIFnn6FuW9XS1h/5IgEAzSlVcU4SmJ4X
iE60uHO4zub2um02J5KOxOg+yrHU8Q0=
=sR76
-----END PGP SIGNATURE-----

--ICFdcertGdMCTx5g--


--===============8967923809952177039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8967923809952177039==--

