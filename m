Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68254CAC59A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 19:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSy/Z1UqliHKdk6kLVEDVWU35dEJm1WuDD7oKFI6RL8=; b=hqN0fyaa6BTWNQgTjPPrfF4SY1
	3pIUn9Nbtj/uCRloYJOTmHBDZWU81dLQrUavKkJSAbei3i0ak0woonvn2qa83rXZ453+y0MoLqwaB
	fPzwYEYTce03iyw+4TAWKWhs9WQTPUoEoVAkId9zvlDvkOkzJ0rEPOjB4iu2Ze/O/C7/2USoH7DVq
	3E+8I8R5NTJYUfx8Xw754nE1+tlUsEkMT5UWCluy+YmWePOgC6XgQKbRxoTs+1iOy4e9RdMIB8bdw
	gVWu89Z0/YfzSGyMUmhU3hziboc64AOzLuXmqqQLxLXH9Mjy66Z1AjAzL6Kfs40juLq/DFTruakbl
	9Eh3bwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxsn-0000000EJ1v-0ZNV;
	Wed, 17 Sep 2025 19:32:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxsk-0000000EJ1U-46F2
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 19:32:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7C2941939;
	Wed, 17 Sep 2025 19:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A54C4CEE7;
	Wed, 17 Sep 2025 19:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137518;
	bh=WUFOFnUVv9N92t+5xEmPWp7XyvUW3ydifXMJo5NR5M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwLK2OboNRlZBlnQjxi6UFTeVdz6cnoT9b9CqRlF5ByMoO+s3C0MgUeZDjrETyB/m
	 jBj1wsT88+9QPF2ZZcIqPV/f6IjbfyHH+dpbDPb7puFtPo2OfrvoGudGnAkZYHdF0C
	 8Zbzo0pUnam0ehLCXmxon/cAfJfnFmiT2pIcU2T04GAo//uwiEi8rTrv5+74dyGCRd
	 dMyPeTAlOzkID8Cq8iBj05dUd/IPK/fx2gEWKU9lx+ymiAzFn/j3dHX9aczr/bwPOR
	 9tlWknf4mahBqybmQanuxSbe+hpGTtAFCuVg7M6GBx85Z46itgYicrDLfpPYRhP44E
	 cs9LVbQs0hhyQ==
Date: Wed, 17 Sep 2025 20:31:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Alex Elder <elder@riscstar.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: spacemit: extend and validate all
 properties
Message-ID: <20250917-irritant-smitten-fa1e05dd713d@spud>
References: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_123159_032095_72642374 
X-CRM114-Status: UNSURE (   5.91  )
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
Content-Type: multipart/mixed; boundary="===============0109075914695942419=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0109075914695942419==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yHs0dDgU61VAAlXJ"
Content-Disposition: inline


--yHs0dDgU61VAAlXJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--yHs0dDgU61VAAlXJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsMqQAKCRB4tDGHoIJi
0pu8AP9ltcftudLjoNZ/qKl0lqLRaZWaisXFk99pUfyogbPICgEAr/LT3xU5a2mf
ICBPeS4zVVPH57BRN9hBd8yiGFeeWgY=
=tIiq
-----END PGP SIGNATURE-----

--yHs0dDgU61VAAlXJ--


--===============0109075914695942419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0109075914695942419==--

