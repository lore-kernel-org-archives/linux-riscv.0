Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9255CC77B6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 18:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDmZ0m4QJTBNvhYSZaw3uYAwJKb9oI3HADH4ck/E3OI=; b=J9ys3Cd7gLH1SKV84eck9sPOHH
	XI0kSlX3rbdxah4dRWGyw+2rUhSh4CIP0dqriWv9g/f0y4GnAkhTjU59FUdFAN6V7SW2smNnb6ah3
	8CIn8No2iohBJC6MSI5M78yNM+XCiuBlAbptt8ig0gEZxjN05fn8uUrn3JoLmyrY2UKqfM2UwO3zl
	83IctNzRGWhCMv2Jn9YTivyPTd40nwOL1cy8RgQ3pR+MD/UuLlpOj/9KfIbxnOUIWcNQ9Mk9e5LIP
	75ZOyfnGKdlNev1fvykUjxHktzYGhGoGD4WGhMGEOJpNnc3aUJHT8QndwqHsxQyM0Pc/eHruXG7xs
	r3beHh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn1yG-006wTv-0G;
	Thu, 13 Apr 2023 18:47:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn1yD-006wSx-0A
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 18:46:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CC725640DE;
	Thu, 13 Apr 2023 18:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C38BC433EF;
	Thu, 13 Apr 2023 18:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681411614;
	bh=kpBt1oADqsJQfllY+Qo57AhJLFESQkTG4UlYkQR4en4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bfp53RmC1TwHvchqmC/oiL/Xba5CWW+WrxvxeFHGhR39zNRMtiUsXIdQy59ylyeZU
	 SkfnGxheTzNkclITWDjRgGAYdTNK2GSPd1MW9gnj6i1MVMjxULhyPKe11Z3bhgx8JK
	 fMwQ76F9Z1jkOuvLh9qyVD/1StqfmY1HTlkCJxhLf4hFidkwv3ShV7mPt9h9tGB4Rj
	 SZqkRdIbUgugqt6tcHgmMZYfLCbqCQ/nOOB90RAGxT/PHdEew0oE0FUMqV9SwzHmbh
	 rxEEO/EBs4czK+ECfSJTHKUBJVEiQ+9Fimsw/cr57ynN9BRsDkederI/k7NNq5Vtkf
	 lzAmgKi8E+EXQ==
Date: Thu, 13 Apr 2023 19:46:47 +0100
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
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
Subject: Re: [PATCH v8 5/7] cache: Add L2 cache management for Andes AX45MP
 RISC-V core
Message-ID: <20230413-staunch-superman-e71fd3303176@spud>
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230412110900.69738-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230412-cheddar-prune-5ce03ccf5581@spud>
 <20230413-aorta-unheated-c9bb35411fb2@wendy>
 <CA+V-a8uksWMihUadYc_dCoef7vaC5ncOicX0oGpSP9HRnHgScw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8uksWMihUadYc_dCoef7vaC5ncOicX0oGpSP9HRnHgScw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_114657_130929_D663E517 
X-CRM114-Status: GOOD (  14.05  )
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
Content-Type: multipart/mixed; boundary="===============5901859609300331978=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5901859609300331978==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6bszEhgICHV8EU9d"
Content-Disposition: inline


--6bszEhgICHV8EU9d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 13, 2023 at 07:26:02PM +0100, Lad, Prabhakar wrote:

> > The simplest solution may to just be making the erratum depend on 64BIT?
> >
> I dont think this will work, as pmem.c is compiled unconditionally.

That'll teach me to write things like this first thing in the morning.
I somehow got it in my head that the alternative would be removed by the
preprocessor if it was not enabled. After testing it, that's not what
happened.
My excuse is being tired from the gym and insufficiently caffeinated,
sorry!

> Is
> dma-noncoherent.c also valid for RISCV-32? If not then we can make
> pmem.c compile conditionally if DMA non-coherenet is enabled and we
> make DMA non-coherent depend on 64bit.

Could you drop the {s,l}d in exchange for {s,l}w instead, or am I
progressing even further into braino territory?

--6bszEhgICHV8EU9d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDhOFwAKCRB4tDGHoIJi
0tHLAPwMAkpigYtBeE6Huhop+HfVeqFO0LwF/DytZT0oSBXxCQEAmalXMvPCM79U
C5gBqaKtslyS+cqEkubCtYILczu9sA0=
=Ri/X
-----END PGP SIGNATURE-----

--6bszEhgICHV8EU9d--


--===============5901859609300331978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5901859609300331978==--

