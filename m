Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5568CC28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 12:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuNYsazjfM0nF2/QtMhi+Sxekt6TsIKl5TjSg4Pj9cY=; b=JyEetQGcd3ux1fMJqd7vlfmqp7
	Ji2DiKUCLhPavK2AwcragBzRoDo4j/bCDeAWhyvwGq58kcXE9fP2kjQXE1Ypw/L7Pu/lyn9oUybQ+
	xcf2jgl0kiKS5uwE3M4JldRA6Co/E4nueQg2wkT3llVi+8JcypovobyxZCJYx51WnMnmjqJh3DKGd
	ej1im2pe4NZuG+vjbtxAQYL0MrDDdtz9wkIGm/irWtZBiFMg7ZE4OBVjzDz+rsG3SQVcrJErGuyLn
	6jmCpSFrwIC+YAChM7AzI+K6vJbMEf2QgTj4tSLde9Bcfri3/rEY4OLcvRoF+7F5VAkbjuPNnZjPD
	jAxUDp1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvElM-0000000C4iD-1g7a;
	Thu, 20 Mar 2025 12:12:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEZu-0000000C29A-49j0
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 12:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AFB4DA45C11;
	Thu, 20 Mar 2025 11:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5709BC4CEEA;
	Thu, 20 Mar 2025 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742472049;
	bh=I2BU+qsSWA9Jxmh2vNgtN0RHEtMSdlZf/at4dwi6RJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6yGMcMtI495UC0u2NOvqjljFvh/k1FKhOq+4zKWZuefs2TuWkfvGS1rGKNpcGGb8
	 NdBcJR+93RLe3JKkQDr3YkmhKkXPdk1msjKXlERZpXvi26JR/FuR+Rl7Je2+aiwie1
	 1ixb9lkYYyEkkAuPhNBXnDvLa9RUSR0qH8t76Abd84UE5GS+HFISpVqA3Sq40kDkNr
	 sSERXHf+itD/iwo8qEy4QuxW/jtNXkjWdaDW3ixR3E4Jve7AiAz1NevNrzHgjooS4S
	 7fpHAWq916cJLvgbaDftt1JCwM2jz2njTTfDbY2jNsW6N7TA0ejjrR4eMSZX47H/I0
	 HgLIz6+G3dZkw==
Date: Thu, 20 Mar 2025 12:00:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	"rafal@milecki.pl" <rafal@milecki.pl>,
	Anup Patel <anup@brainfault.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] Basic device tree support for ESWIN EIC7700 RISC-V
 SoC
Message-ID: <20250320-uprising-couch-0af012a1fee6@spud>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311-backdrop-porthole-440ae005e8fa@spud>
 <SA3PR04MB893164FCD6C4CB8924FC8DE583D82@SA3PR04MB8931.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SA3PR04MB893164FCD6C4CB8924FC8DE583D82@SA3PR04MB8931.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_050051_160817_EF06F715 
X-CRM114-Status: GOOD (  19.10  )
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
Content-Type: multipart/mixed; boundary="===============1398501326775779988=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1398501326775779988==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dqsjL8OpJogiK+vA"
Content-Disposition: inline


--dqsjL8OpJogiK+vA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 10:39:52AM +0000, Pinkesh Vaghela wrote:
> Hi Conor,
>=20
> On Tue, Mar 11, 2025 at 11:38 PM, Conor Dooley wrote:
> > On Tue, Mar 11, 2025 at 01:04:22PM +0530, Pinkesh Vaghela wrote:
> > > Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
> > > P550 CPU cluster and the first development board that uses it, the
> > > SiFive HiFive Premier P550.
> > >
> > > This patch series adds initial device tree and also adds ESWIN
> > > architecture support.
> > >
> > > Boot-tested using intiramfs with Linux 6.14.0-rc2 on HiFive Premier
> > > P550 board using U-Boot 2024.01 and OpenSBI 1.4.
> >=20
> > There's no git tree in your MAINTAINERS entry, nor mention here of what=
 the
> > story is going to be in terms of sending patches to Arnd. Who is going =
to be
> > doing that?
>=20
> We are not currently set up for sending signed pull requests,
> so for now we plan to send changes to Arnd as separate patches.

Undesirable, but sure. You didn't answer the first part of my question
though, and there's no git tree listed in your v2 series. That part is
not negotiable, you have to have one and get it included in linux-next.

Cheers,
Conor.

--dqsjL8OpJogiK+vA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9wDagAKCRB4tDGHoIJi
0qi/AP9YKzFUiYQGiDGSwHohlkUToDB0pum+R3rZQuqFodKXXAEAk6gtT0rvQonb
1UJ5lZsOGhW0cLSxRu5z5tlnca1WJAM=
=UrIu
-----END PGP SIGNATURE-----

--dqsjL8OpJogiK+vA--


--===============1398501326775779988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1398501326775779988==--

