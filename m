Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1299C77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 12:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfK/e04pnfGi9JJ6Dbiot6jijisOiynAFHEn//JVDzk=; b=GXzJ4z4nTXVAP8qeakuC5JWsl4
	AozDgfMLD5vyprKY19QvLCpGO4t5yOjBD9m7XmcnBiuRF1wTOivU/2zN1oW97RKhLV4KTJLGVr42f
	Nh7tyZCL3/d5AlzyOCYutNahwghPlHZELrIdjWjiyC1FpYKoch7J+7cWkIL95k8Ku2pbF4vNKwV1b
	uozINUquet1AIElXt0eMTQ28vCaeEIAxdsmV6paJZoxICxEjCST6w/txjmxom8V5aM9E6QE6Lh7E2
	gAkJgCHz96f5pglvgf63bHtK3+ScRcGQzTdIGFOgdF1qUdp3oKPFkWnKcxTE9CuxASexvZObd7K5G
	3Kl6UjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvH2P-00DOgP-1Z;
	Sat, 06 May 2023 12:29:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvH2M-00DOfm-35;
	Sat, 06 May 2023 12:29:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83DF960C20;
	Sat,  6 May 2023 12:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD99C433D2;
	Sat,  6 May 2023 12:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683376157;
	bh=j9cwmY9NtG4amTk4a1qT7ubgf5DFih5T9cNOvPsUREo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDGwKoT2T+sm25/C41iscfEklYGdMPO2/m7kBvX7NRAY2tOC7W1HxXhgTbyzUjVmx
	 7iGm9YorpstFOvxTU+wgJNziVqNJRp8QMOVJgS4FMtHtGxKKhQpMl62HrQQtMZN4Xv
	 phPG3bhMyp0UvPphAjPv+/9e9QJIwUaYqSDdlQpSVgyEHWun/mqm+mLLxafR9Rn68R
	 M5a6tszAzniyQOO5YSFdmo1eC2ecrEhJrfE67JdJ5eF12WO4CiJW3Cv5eXe8GiMR7r
	 0m49OmDn20L7GHo9ODuO7W/f+xG8YMzdZrcn3hfBAWmo/WbNkbe5BPiRdEPuoYI6Ll
	 D8muthNC0cHJA==
Date: Sat, 6 May 2023 13:29:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	vkoul@kernel.org, linux-phy@lists.infradead.org
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Message-ID: <20230506-foil-basis-31724c50b30b@spud>
References: <1ac26c1a-1726-515d-6598-849a07ed0b86@linaro.org>
 <5adda0ad-965c-fbf0-878c-9d41d28b5c39@starfivetech.com>
 <86693969-59bf-5bcc-42a3-b6e94a0d6f3e@linaro.org>
 <fcfc8ba4-40a7-da43-3375-712bd7e7f4d5@starfivetech.com>
 <20230504-worshiper-ongoing-5581e1f2c2c4@wendy>
 <2f473307-2219-61a4-fa66-5848fe566cf0@starfivetech.com>
 <20230505-magician-poet-724c96020c2f@wendy>
 <ba6a1a47-d3b1-ee16-4785-f5c61d593127@starfivetech.com>
 <20230506-dating-twiddling-b364de21ed2b@spud>
 <b1965ae2-af2d-b11c-3e34-8129c29333b8@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <b1965ae2-af2d-b11c-3e34-8129c29333b8@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_052919_031787_B762D458 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6442719099332834199=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6442719099332834199==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p9EN/m3kyGka2NQK"
Content-Disposition: inline


--p9EN/m3kyGka2NQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 06, 2023 at 08:26:01PM +0800, Changhuang Liang wrote:

> OK, will replace "starfive,jh7110-aon-pmu" with "starfive,jh100-aon-syscon" in this series.
                                                            ^^^^^
Just make sure you don't propagate my typo here in the process.


--p9EN/m3kyGka2NQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFZIGAAKCRB4tDGHoIJi
0tkdAQDGePU71+pVWUcZa08uxLkEJ5SwKW4PyDZ4uHsqXFegWQEAzoJbhsGCFcjN
83Bp4hlpjAGUO/5CJiD3fGavYjrZ+gY=
=oSlD
-----END PGP SIGNATURE-----

--p9EN/m3kyGka2NQK--


--===============6442719099332834199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6442719099332834199==--

