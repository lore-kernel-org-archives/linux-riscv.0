Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3521C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RpI3Kztz1+xvf5vP05bu8Hq5c6WcWIRiYkczJwZKKM=; b=Iy7LgYLLnNDI8nBARE7/MPeD9M
	zLHfmbX/IzUPSG9+ROmZP83L/e6m27vQCa0Zg+d3+lPC4Xm9Hxg4/sSJx3p32aiacd8RJNsRxMnSz
	k4jdrNKO2HPsND83XhJFJA7EmYHa15ANUc7LPjClkghrM0LH3yJUV+Cq4wZsOFa+ZfgbSlxifC4gr
	uR44QInhWicjf6kKCR71L8u7gTBhqI9BHY0Is8qOcKVXsG/GguYtOoqtzRAiF6ITzUaYufVFMmzvg
	xWcjd+ui0ZbkxJffg7DrmfqIeoImnCAXgtsb/gB2hX4A6bFyd0gD99n+89JNkQo55XnU/wqZ4eEJ7
	nW1KDeXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAZyQ-00000009de9-0ySe;
	Fri, 24 May 2024 18:49:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAZyM-00000009ddO-1u2f
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 18:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BB3F6CE1A44;
	Fri, 24 May 2024 18:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6895C2BBFC;
	Fri, 24 May 2024 18:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716576535;
	bh=lxlHJz99dUTH8Xnb2vIc4jSSd44hxz+bjwK14/n/B1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MiCPxA/jaqMSdF2seJjpN3APs3t+lYldU7C6Ka7n3vnknegreiHSYZ8TN9aahwg0U
	 jKUI/sLVpOKWn4qWdwy+aK1WVcyQYuP5zQPIzCaCIqtGoEYXCCRRAMlK+mIwCXqKcB
	 AbS4KTbE+qbWtjTwzJKfp+hwlf3nzlTJyB+l+hdjUUOwbYmgPO9k8SbdHieojeGJq+
	 xcRHebML5264Sl17328jBIlEoY4vw3BZXHt7y9OahDYDK2YvJXlFiNdaYBqmS36S2e
	 o6bI+h4iRL/oUBxb/jXvG0P1qsjXhW4L88AZ7AhdEdWnbfGVdkmK74Nrxga2Ieg0QK
	 F2rDaj350GIoA==
Date: Fri, 24 May 2024 19:48:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Henry Bell <dmoo_dv@protonmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2 v2] RISC-V: add Star64 board devicetree
Message-ID: <20240524-omen-smell-6c9349065883@spud>
References: <sQqtfYJc5p5nCV1CUpJC_eti56gLvmhqfMv4DY-aojB0sCARXzXRBveErmAN0spUDzvux3m5LdcmU-i4BfNDCCckVQfHLpH1QakaXdpnXuo=@protonmail.com>
MIME-Version: 1.0
In-Reply-To: <sQqtfYJc5p5nCV1CUpJC_eti56gLvmhqfMv4DY-aojB0sCARXzXRBveErmAN0spUDzvux3m5LdcmU-i4BfNDCCckVQfHLpH1QakaXdpnXuo=@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_114859_030752_20EB4A9E 
X-CRM114-Status: UNSURE (   7.98  )
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
Content-Type: multipart/mixed; boundary="===============3046720061400102860=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3046720061400102860==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hEGI675YtjtWgj45"
Content-Disposition: inline


--hEGI675YtjtWgj45
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 09:55:37PM +0000, Henry Bell wrote:
> Add star64,pine64 to JH7110 compatability
>=20
> Signed-off-by: Henry Bell <dmoo_dv@protonmail.com>

$subject here is wrong, it should match other commits to
Documentation/devicetree/bindings/riscv/starfive.yaml.
If there's nothing else to fix with the patchset, I'll fix it up on
application.

--hEGI675YtjtWgj45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlDhEgAKCRB4tDGHoIJi
0l5NAQDbIQqdzUUrUSi0rQv2qOz2BMeroa8DhKOu1+kLveovJgD+M7xaaBjO7VR8
PYjjPm1SMAZJ0Qqx11M8B1xXKdCrbAA=
=VYeb
-----END PGP SIGNATURE-----

--hEGI675YtjtWgj45--


--===============3046720061400102860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3046720061400102860==--

