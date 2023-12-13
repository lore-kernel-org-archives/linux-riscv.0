Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45B9C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaO3hgWKF0Ywb+TpY5f0bz9cUexYSZbGvgnhbBgW2Vg=; b=4zfoX88UOzlhDkXfg00ziClzxl
	k0zg+VV3Ckut1viIz9+lFNhb84/AUr6QOFGCcyldPlaJqJRgs5zoMGdCyESuAm0jUOIr0f+bcG/mV
	D3csInfnpLoT/H0QRIvFCUbjUNHlSvgW0WXAPm1ZOyF1zNtpx/b5flYM8vE8bdk6nsR5rtNkPTG2P
	YZ8ZdSff9V6OJCSJNP2IMEUFFHW5HBfIy6bgV5G1DM2A9igvJc7Es6/ijjIvBsY0va5QkbSgtVoTM
	eYXqk35xB/BO63ywcYgnTgFBv6edYej0a4SOt4i1+DIIfGoMGtmPmBft7Mbpj5irODpayAAXBTgx3
	Bt2+BWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR6K-00FCQI-1i;
	Wed, 13 Dec 2023 15:24:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR6H-00FCNQ-0L;
	Wed, 13 Dec 2023 15:24:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3DE88CE1F78;
	Wed, 13 Dec 2023 15:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C5EC433C7;
	Wed, 13 Dec 2023 15:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481076;
	bh=34+Ib4YFyZmhdk4OinGdvnrlMwYrXexKV9Hm36OaH5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lbVMXI1QdImCKCnxDnc0Lcmg1UQx/Ebc/1WfRY7aP22xJ9CQqvAU/p0vLVIK2oazI
	 +Nvx5UUNTQD/u6Zc39LWmbWeVeXI0lbNrM9gaZNiDVspkktzrpm6r7V+E1P4gxNRKA
	 QCbOKlO7o0cCJz5GJ2rR+piofMGHy/U09GjH9T+teywtW6IBF4MPfXo2k4LaDZyXLK
	 sBxeEi0kwaEDgtMLm9nIyEn8y86cV9cokmRcAilGQ4Psin99aXIKfphklULADpIHl8
	 Id2KzVq14cQH60JxHyXVIveRWNY58GVraISLyvPkVHhgDCEp9dvoygNJD8ej29I1UK
	 RO+1ozDPDjj9A==
Date: Wed, 13 Dec 2023 15:24:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v5 13/16] riscv: dts: sophgo: Add T-Head PMU extension
 for sg2042
Message-ID: <20231213-maturely-freezing-07edd52717d9@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-14-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231213070301.1684751-14-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_072441_317687_3B32C7E9 
X-CRM114-Status: UNSURE (   8.37  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============8528433275105798818=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8528433275105798818==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0Rcnxco1nl347ZKK"
Content-Disposition: inline


--0Rcnxco1nl347ZKK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:02:58PM +0800, Yu Chien Peter Lin wrote:
> xtheadpmu stands for T-Head Performance Monitor Unit extension.
> Based on the added T-Head PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


--0Rcnxco1nl347ZKK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnMqAAKCRB4tDGHoIJi
0qyQAP9X4Da6uFGwYd7MFmvCTiSfe1B6LzKyCFwLDqOUywJ6EQEAp9f/B1dFBqB1
ueKxuTYAXyXZJ6C9gMiRZQAQv5ecrwY=
=EGtr
-----END PGP SIGNATURE-----

--0Rcnxco1nl347ZKK--


--===============8528433275105798818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8528433275105798818==--

