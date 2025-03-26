Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C89DC36008
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 11:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loFqWaG1KvpOmHdLMSTwFeklsvdbqxZ13yd5DbF0R98=; b=srwIrP0zL2yu+28PuHi6hZVaXR
	M9FrkJBkNiX7WWsQUvO9KTlynG5l4MOErp8BEhTj+Ri2bQ3qfgOGpNiuDlls8FTO2UWJo3vbO+EGQ
	m6uzDSqSnvXB5Cird+MEAWOHV0mOe7RZD2JJTvJnGQPosw+xGMFU7q5mzYvtrDVjko3tK7P+zbx9o
	9Ww0oQA3zUFT5iCnVZC9QwFOlrmc1CYCLt83ZrVirn/ItHrpQtN5U9vIIFhpw40F7QsP+W49wcn9H
	IsxQM4up65OzCnquB8hwk7WVQv9i0yL7jkPdblGebAzbNBeQ2by5SEHaHTodTBSb1e3yEmZ8843Jt
	1CpFp7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOVO-00000008IFw-0azJ;
	Wed, 26 Mar 2025 11:01:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOVL-00000008IFG-2owG
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 11:01:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F109142B61;
	Wed, 26 Mar 2025 11:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC91C4CEE2;
	Wed, 26 Mar 2025 11:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742986863;
	bh=i5EM31pPlZ7zaytBldZoUh4/6CAZrGXC0cCO7MtVZYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jtMwMZplUGaTHjvxtXkF+OmwLt/B2vyVDNY/Z3nr0U01+2RPN9SJte6qEgGszG6Tc
	 Av6yzEFyFnep8Zq+g5vji8Fm+Jyq7efIBIaqnSILPVpshpYx0pdDHGU0EIoVqTJHrp
	 /65cV47mgkEX8mSkaTMJKwBo1Euy/ksvUz72wbS30yBVC8mrQLlfzuDOIhvsdf50Io
	 U7D0DrqP6OVhVz9u7Gyxfns4PCxK1YZBuCPYc71N6/j85KuFt7VqozRDdPKwyIpdzg
	 Wl8nGIBKNAl9wCqTY1RWv5imTIyuoMK5LgGZi8WqwBHr8XpfavhYnhZezTqT/xwKrA
	 vg49qnev6SUdg==
Date: Wed, 26 Mar 2025 11:00:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/9] dt-bindings: soc: microchip: document the
 simple-mfd syscon on PolarFire SoC
Message-ID: <20250326-tricycle-hesitate-e58633e62545@spud>
References: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
 <20250321-ramrod-scabby-a1869f9979b6@spud>
 <20250325-quiet-waxbill-of-realization-675469@krzk-bin>
 <20250325-feline-roundworm-dc391b755673@spud>
 <58bb1186-08ee-41cf-8593-a6664bd874e6@kernel.org>
MIME-Version: 1.0
In-Reply-To: <58bb1186-08ee-41cf-8593-a6664bd874e6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_040103_729833_89795D7F 
X-CRM114-Status: GOOD (  14.64  )
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
Content-Type: multipart/mixed; boundary="===============1063834487729826344=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1063834487729826344==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nlJEEonkgyvP8Dzi"
Content-Disposition: inline


--nlJEEonkgyvP8Dzi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 07:53:55AM +0100, Krzysztof Kozlowski wrote:
> On 25/03/2025 17:03, Conor Dooley wrote:
> > On Tue, Mar 25, 2025 at 09:13:22AM +0100, Krzysztof Kozlowski wrote:
> >> On Fri, Mar 21, 2025 at 05:22:35PM +0000, Conor Dooley wrote:
> >>> +title: Microchip PolarFire SoC Microprocessor Subsystem (MSS) sysreg=
 register region
> >>> +
> >>> +maintainers:
> >>> +  - Conor Dooley <conor.dooley@microchip.com>
> >>> +
> >>> +description:
> >>> +  An wide assortment of registers that control elements of the MSS o=
n PolarFire
> >>> +  SoC, including pinmuxing, resets and clocks among others.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - const: microchip,mpfs-mss-top-sysreg
> >>> +      - const: syscon
> >>> +      - const: simple-mfd
> >>
> >> You need to list the children if you use simple-mfd. Commit msg
> >> mentioned clock controller, so where is it?
> >=20
> > I don't think a child node is required here, there's not enough
>=20
> Then this is not a simple-mfd.

The pinctrl will have one, whenever I get around to actually working on
that. I can leave the simple-mfd out until I establish exactly what
that's going to look like if that's what you want?

--nlJEEonkgyvP8Dzi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+PeaQAKCRB4tDGHoIJi
0t7jAQCCLwmHuZCd9933PeQR17AUr1HNZd3fYK3blMGPPpfn5wD/dNQnm3RNPn8P
lY3prJBqUjp9Wxq+q1mGw/BIyBKFlwY=
=i6NH
-----END PGP SIGNATURE-----

--nlJEEonkgyvP8Dzi--


--===============1063834487729826344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1063834487729826344==--

