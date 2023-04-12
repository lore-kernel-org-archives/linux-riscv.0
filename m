Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01440C7619A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 20:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHnlqrRMV78wlI1t8l+SOcGXSs6I2j3Nz7oiy6r09mY=; b=i38ITtjLJzb8GoU4H3x8SzvZEW
	+lErVgozwaZ7CopltVPbylk8zZXrG0LBrK1YmrX0DnEwjV49qsikU3M19KdAF//QcYM20M3V587+R
	vf4AHDv0IQuAnkozBGfftv45K2E48hf7cEuJpcpTaPbSJfjDa+n11Q9aG0c7NOdIG+ad6DwKZEiga
	0qov+TVYFMPT0i4LJD3/CqsFZsEzYQ0ZKELq4UMY8bWIuoAGmqWtZvS4MpYIxZKfWf3XtlsA7dfDP
	SbANgTYT6vdZ5G34R3iptGxE7MHQ4503vmmJjt6JJ+Dz9XuEfmGkGFgoIdOF8yzpzlHOIqP6JB90u
	aL5tdqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmh8y-004GtM-1W;
	Wed, 12 Apr 2023 20:32:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmh8v-004Gsz-2u
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 20:32:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E1066330F;
	Wed, 12 Apr 2023 20:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D97C433EF;
	Wed, 12 Apr 2023 20:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681331556;
	bh=4f85G7qmQu0cjMFlLuwC+FY9Rzyah8PJLhITq+Oo0N8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3T/1oUQsj4w/eU8173BXiV87rg7FOx+fMhXSd8zFkm53FoXzQz+c16PDffD4AHQO
	 mBDD995fCyBC/pFN0SKeSWuBjgsNg2/7BjS4ytqnS5Sh/vHjnGruOvIqBjnDTYYpoW
	 oBVixmrfZIOiAQ4b1CYEE/LKgydw1LUd18DZSl/9K3r1IXjztt+Km4+RNigSastq2t
	 5LMt53hqf29xBguA578w2mLkBlk76/roIM/CtGJ4lUv7NJq6TmIJbzI3UMGq+iKeie
	 O1kogLAgoJDQXd6fHPrCbyID0ESdxD9O+Mca7swAeTw+keHsBb9v4dHb5fmorGCxV6
	 BrPKqwPdn7UGQ==
Date: Wed, 12 Apr 2023 21:32:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v8 0/7] Add non-coherent DMA support for AX45MP
Message-ID: <20230412-populate-busybody-4c6d7cfc4667@spud>
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_133237_983892_2A917EA5 
X-CRM114-Status: GOOD (  11.14  )
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
Content-Type: multipart/mixed; boundary="===============4239124836672744197=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4239124836672744197==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wokudRuMrcrR61tg"
Content-Disposition: inline


--wokudRuMrcrR61tg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 12, 2023 at 12:08:53PM +0100, Prabhakar wrote:

> Note,
> - This series requires testing on Cores with zicbom and T-Head SoCs

As I said last time, I dunno what actual Zicbom stuff exists, other than
perhaps the Ventana lads having something. I did some tyre kicking on my
D1 and it was fine, although nothing has actually changed materially for
either of them with this series in v8..

Cheers,
Conor.

--wokudRuMrcrR61tg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDcVXgAKCRB4tDGHoIJi
0hcDAQDyjF067mLfUHvBJlvlHcRbETM+ZVvN06gg2JGFRQC2CQD+J6L/segmEeV0
Gsgp3NcVV5niFc7YF5NTmNv/R4lEqAw=
=4ZCG
-----END PGP SIGNATURE-----

--wokudRuMrcrR61tg--


--===============4239124836672744197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4239124836672744197==--

