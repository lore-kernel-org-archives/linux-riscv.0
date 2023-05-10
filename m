Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE42CC77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZp79ct4YquBqu9sShhSmJN8sP0tlJxgiev5gp/BAfc=; b=Rb8Jos3DX7J4s8SYTOAILVy5SG
	7stw4gP9DobzMKZ8s40vM8MSt+a0/v3Ca86y5MJbf+Iqy1Xgj9gWNSZW4QqjoUWUsb6L+efNStzms
	fT4TeZQGpXLdXEOpztxKccb+Px/TryTbRT3GpRjxPaVjp0nAb/LLibnrjKD+r4q/vEDoZaeFyNJGW
	ikb0XGxpOiBPo8Dk3ncM719SU1Br/usVetOw1i/kbJxqHW6E8LUZlaGhc0QwYxswdeTOPCCvCWfGw
	uyGK5SbpSdxMrvo5cI61cY/YCsNxHK8vFH+aLv9lTfKqSCCoFne68vo5jD15MkIxOs5ceEzkhvxne
	7K3q6ALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwlxw-006Uhx-1j;
	Wed, 10 May 2023 15:42:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwlxt-006UhW-1e
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 15:42:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 11B6763D92;
	Wed, 10 May 2023 15:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D092C433EF;
	Wed, 10 May 2023 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683733372;
	bh=qnUqwiJXS3T0AYBwpfwJ/sB84/OFu8iJHOIsOMcAIHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WE0jKDR1WbbMZ27cXQLaATIX6ziNAZe2kV/z0/LgO6coaqwXFu/tsmJlnyBoLudeI
	 p15ivUkTo5Zt78mg7di+nB+ZjNQcl/i+exYZEb1McaDAe8Qomli4M431f9ZBUMad1/
	 2/q+b9mrS2q3mWwjIRlBf7qPo17EkOp9ntnrsxBa19LnRAbPcAORQQKno4XfvNg52b
	 w/Z/DF/IJ9L9PkFTL7Bzm9Ojh8a2sVP5iG2RUEhVLV/Z4SHQDz8OlrpXyjo9YJuQ9X
	 WceMZoWlIKYjB8q8/A+VqLdTRMAptvXZsA3fOmU+XaepBBZKaqETP/iDHzRck9tiM4
	 XDG9TOHg9NOSg==
Date: Wed, 10 May 2023 16:42:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: sifive,plic: Sort
 compatible values
Message-ID: <20230510-underage-shield-f9369c92c135@spud>
References: <9cbf54da1ace03d7a45f28230fd99954d8c0d141.1683725029.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <9cbf54da1ace03d7a45f28230fd99954d8c0d141.1683725029.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_084253_590692_1D0734EC 
X-CRM114-Status: GOOD (  10.57  )
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
Content-Type: multipart/mixed; boundary="===============1441296105704439143=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1441296105704439143==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ewFZSlucFhs6AvIs"
Content-Disposition: inline


--ewFZSlucFhs6AvIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 10, 2023 at 03:26:00PM +0200, Geert Uytterhoeven wrote:
> Restore alphabetical sort order of the supported SiFive-compatible
> values.

Whoops, I probably should have noticed this when the StarFive folks
added their entries.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--ewFZSlucFhs6AvIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFu7dwAKCRB4tDGHoIJi
0hoxAP4wuKboCTznTD2qanlFZ9dt8/8BBShJiS0DZim4KBDK4QD+PnQ3YWxVudS3
vyRwpzYgRLIZw8wgxBpO6DxRet77Mg0=
=aHiw
-----END PGP SIGNATURE-----

--ewFZSlucFhs6AvIs--


--===============1441296105704439143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1441296105704439143==--

