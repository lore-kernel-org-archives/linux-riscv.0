Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45219C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 17:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DThCeIVtzLaT/1AeN0gS2ihxvj54pp/bTZlcfPYq4e0=; b=gO8SO9LYWmn1YTylSPDPfs94v/
	WpNiaoyRuZu8zRzVco/CHlicliFcDdySo4LYwnKcMCREx7w9lTV+3Yb3yxa9pvvE16Exe3djL+5nT
	922Evg1LP0NWDv3mxxt9q1ZVu/Yq3gyotzq5OK/1evfK7Pq9Za9cBsstpGqkgqSqiuM1SGoXg+8fh
	l+EKITfchKha4PkxsQrmj65O3RGRytrmsfb2NfL/QyQDPJa3rdziK2eKxk0QDI9pv26YkAmkqbTyM
	NU4t/0EsjZI3tIOqhNETMpqStQH0+dsv+cli5RQkzJSSV4H2AU1Ozq+k09VcjLqNIG1bbhEdhNxwI
	RNT0RE+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWKnB-004kN4-06;
	Wed, 16 Aug 2023 17:58:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWKn8-004kMf-2I
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 17:58:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2D83563814;
	Wed, 16 Aug 2023 17:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3ACC433C8;
	Wed, 16 Aug 2023 17:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692208725;
	bh=fDU2HXAeFWB4n482i4GZf6hhte8bflt2UwJqfgDiRXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDr/hoxyn60n1Rb/HIgQ+4XMZC8loA7CRK/5KGyOtm/wv+1XnvWCEWpEWaBTCIXGa
	 GJxp/OgdsWU5ZvzDN2AZ3ma+d927CGT2EhRWgIGQJ3zi9k4UGrCmScoeq9Rm+85gqa
	 pdrW58ONBnBgRbK1PflCj8rVJ1/oxyBW3r/c9dF3Jaz1CVJl66vux10SI+3eI5a8qO
	 VesWuulpU33K094jBs9Uk1g76Fwx6KLw0u4+TsvazU50xmHvEPUFV+Jg6+LfGjCN1y
	 9iffwpCvFBLCEdoAvJEyZQNIAvpdMKwKYYChyoigyMefCPv+KhoU2SMd05KfF/MfkF
	 ry2e4B8ZducKg==
Date: Wed, 16 Aug 2023 18:58:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Drew Fustini <dfustini@baylibre.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/2] riscv: Add BeagleV Ahead board support
Message-ID: <20230816-lubricate-grout-b5db43b94163@spud>
References: <20230811-ahead-dt-v3-v1-0-aef2294bed86@baylibre.com>
 <20230815-aroma-graveyard-f1fcc61e5030@spud>
 <ZNzvGMmKufXxdOjt@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZNzvGMmKufXxdOjt@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_105846_808132_F8867A39 
X-CRM114-Status: GOOD (  20.78  )
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
Content-Type: multipart/mixed; boundary="===============7891148398022790279=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7891148398022790279==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eZbM/ViOOX4Bfyy9"
Content-Disposition: inline


--eZbM/ViOOX4Bfyy9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 11:45:28PM +0800, Jisheng Zhang wrote:
> On Tue, Aug 15, 2023 at 02:15:46PM +0100, Conor Dooley wrote:
> > Hey Jisheng,
> >=20
> > On Fri, Aug 11, 2023 at 05:47:15PM -0700, Drew Fustini wrote:
> > > The BeagleV Ahead single board computer [1] features the T-Head TH1520
> > > SoC. Similar to the Lichee Pi 4A series from Jisheng [2], this adds a
> > > minimal device tree file to support booting to a basic shell [3].
> >=20
> > Am I supposed to take this, or will you? I still don't know where I
> > stand with any of this and will default to assuming things are for me
> > to take in the absence of clarity.
>=20
> Hi Conor,
>=20
> Since the patches in this window is small, so yes please help us to
> take this series and the one of changing the dts license. I see Guo Ren
> has acked it, I will ack too soon.

Okay, I will go grab both.
Can you please decide if you want me to take the patches going forward,
or will make a git tree, put it in linux-next & send PRs to the SoC
maintainers? One or the other, not this ad-hoc mix where neither I nor
contributors know?

Thanks,
Conor.

--eZbM/ViOOX4Bfyy9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZN0OTwAKCRB4tDGHoIJi
0jMSAP4hn/7YFk6PN0m3OewUmY2bsv72Mc41vuCdqYDleiDu2wEA80xVtTaRWClC
IXGNPUVCSg517oznOJnFXrkFdVT1uwk=
=0VY7
-----END PGP SIGNATURE-----

--eZbM/ViOOX4Bfyy9--


--===============7891148398022790279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7891148398022790279==--

