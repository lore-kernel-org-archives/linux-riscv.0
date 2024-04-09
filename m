Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F86CD1296
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 15:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmWgH02M8Ocb/Nr/F/zeZdad0w9QqE6+L3/zAvDhN68=; b=2drUalp6Op5xmw32Qc/VUdWgEi
	g4X/wid6nABVvIaoTr2PHAGoFEFVTStjKSRmYIWh/Emp06BrpiG6hTVmd0UmKH9X4hWcBZumlYTv+
	5NGSJcbYbbxjulBMmvXxWCncuh79A9Q8EWspDe5HSKt/ilgO99mPJg5tLIKRmng9ybjXRCrxHWu3r
	M0y0oQBXvraG4fiBk+2PV3wLGElpZT2Wj3DlAqESCLGY1o6nJLYmeLWdm1dDiPL9JnhIceKbWVpfT
	ZZdVuYX7a+d4aAFJiu6zMYB8NPTtw8YPIrV1gVLLqtzAzn1ZfXIRgzDsYqUEVDJLXzj9AKiXX9gYP
	4fjLbadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCyb-00000002Z6y-2NWf;
	Tue, 09 Apr 2024 15:01:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCyQ-00000002Z1Y-3Jhz;
	Tue, 09 Apr 2024 15:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A6773CE2072;
	Tue,  9 Apr 2024 15:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57233C433F1;
	Tue,  9 Apr 2024 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712674879;
	bh=b1I7UNfssCV2gFy/ibu4NFSYAMUmL75Q0HBWqKqGBj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7FrzKg+6fobNHG/EEzWpZXVTUG9QTgkpqPWOW8uPmuWAp4su5stPl4oNr8fliSAn
	 IfR7PQ5+PMPt0EhaMarEbBRsUjNvBh2mquygB2EpUeYaX7MSvSbiPYScGWBMSyy2eU
	 fY6W67IddvSCbyBbjXynPG7UF4e/mXqORUGgVNhxRTo3Zs4vD4GrivL6pMlWH9ly+I
	 K2kjHSaQTipwgC5WTRfNJlig2VwVL+swEwXxIaLgZgzaBwAQAJXGcCX19+WGE6nuJR
	 Lre9pTqcRSeB4lcpNfxEPF1Z0vblR7jV7Ll/y6IdFf0aAO9WDAf6kDlHAGk8vFBiCh
	 pmFGtmi7aqUTA==
Date: Tue, 9 Apr 2024 16:01:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Eric Lin <eric.lin@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/6] SiFive cache controller PMU drivers
Message-ID: <20240409-corral-untruth-591b29f6565d@spud>
References: <20240216000837.1868917-1-samuel.holland@sifive.com>
 <20240216-shopping-unnoticed-e73e72a0e849@wendy>
MIME-Version: 1.0
In-Reply-To: <20240216-shopping-unnoticed-e73e72a0e849@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_080123_321640_1EBC3D62 
X-CRM114-Status: GOOD (  15.68  )
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
Content-Type: multipart/mixed; boundary="===============0430697689024141312=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0430697689024141312==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zsV7n7T3orhUeCCb"
Content-Disposition: inline


--zsV7n7T3orhUeCCb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 10:05:04AM +0000, Conor Dooley wrote:
> On Thu, Feb 15, 2024 at 04:08:12PM -0800, Samuel Holland wrote:
>=20
> > All three of these cache controllers (with PMUs) have been integrated in
> > SoCs by our customers. However, as none of those SoCs have been publicly
> > announced yet, I cannot include SoC-specific compatible strings in this
> > version of the devicetree bindings.
>=20
> And I don't want to apply any of those dt-binding patches until then.
> Stuff like "sifive,perfmon-counters" seems like a property that would
> go away with a device-specific compatible, at least for the ccache.

Reading the P550 stuff today reminded me that I had not got around to
looking at this series again. You should be able to use that to satisfy
my wish for some soc-specific compatibles, right?

And w.r.r. the perfmon-counters property, looked to me like Rob was
proposing it not even having to be vendor specific.

--zsV7n7T3orhUeCCb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhVYOwAKCRB4tDGHoIJi
0jzBAP0bzyW1aj1y1ig0+xzeagwXGMmN9QO8TaiyNHylHG6STAD+Lz2fHDrW9lKK
auwxSW/MgO1tt4GAH7rwtfp8pUBIMAA=
=JS2J
-----END PGP SIGNATURE-----

--zsV7n7T3orhUeCCb--


--===============0430697689024141312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0430697689024141312==--

