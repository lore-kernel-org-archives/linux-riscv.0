Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BC1C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5SfAUc6q+/Mybeg/eRiUyAfNhSw9nAQ8RCA7PSsNOg=; b=blO/xbzdZGUfwdPxfsLAHkecJX
	Z11J0b2ge/kaGOAWg3nVhJuPNSg2lrT90gfdsYrpyw9oTcY9gRaPogUb4xYCbLWtj/ZinqjX9kAn5
	c4r7cm+q7Q/ohzNAMa6Zxcy7aPiNr5nwj/39ya38P5Hvxk7VUOAQUrFC5Gv+5+OK1Jm3A1ySoGO+E
	h63HaRdbzUTd4GbFXLzJrXcg9stJ/U6i36ZYuwetAHcBC4SyryYu0K6nWFdgZtWu+hQzkhyJJsHia
	nBRWh3ooYYYxJ1Er7aLwvIDsXAeYRqu323yZBUuIF/weyCl1zNdqHhLUAO11yr5vbviK1jUvluY4V
	FK4xlq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pybWk-002qbm-1D;
	Mon, 15 May 2023 16:58:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pybWi-002qbB-0B
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 16:58:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 87B2562A3E;
	Mon, 15 May 2023 16:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A470BC433EF;
	Mon, 15 May 2023 16:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684169903;
	bh=6BQOnnLnMvzGvxFLqtdRHmW64RX2LYl5ly/0PZlbWY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFA00hLTT5BbFjhLbVztbrAoZT+hr5ViQyB6ttyIf7aUbfStvozk22/i/6bAcrdg6
	 cOXaJ8HN8AS5wkECfmYsjWqmoELp8BIhmyltHys4ngMw16sKLauCO1xeq6HGGsmKex
	 MSFSCp/eBwuFj3PmRoQhrC8YGmxw1IpVxS7uJ7f0ARLSzo7SskAoZFowQyVUderMAU
	 Dk2qPGrvwwB/IAXx9WENV3imzu5pacDz3Bm1apJ4YRz3/V3UjLuXwWPq2nduKPSx0h
	 gt2sERrWqrHBakuTYxNmDdQjBKrceNd+4Hvn+9hOLBvMPHAtXatfbl/wTGIVwPd/Qk
	 4ptkXcYrwi4eA==
Date: Mon, 15 May 2023 17:58:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3 03/10] dt-bindings: serial: add documentation for
 Bouffalolab UART Driver
Message-ID: <20230515-florist-perky-f26b996f2179@spud>
References: <20230514165651.2199-1-jszhang@kernel.org>
 <20230514165651.2199-4-jszhang@kernel.org>
 <20230514-bust-slam-10c7b9cbe455@spud>
 <ZGFuikzSsP81/d23@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZGFuikzSsP81/d23@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_095824_163691_9B0E748F 
X-CRM114-Status: GOOD (  17.17  )
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
Content-Type: multipart/mixed; boundary="===============5567076650184654442=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5567076650184654442==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YTtL81Hy5mMcU1A7"
Content-Disposition: inline


--YTtL81Hy5mMcU1A7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 07:28:10AM +0800, Jisheng Zhang wrote:
> On Sun, May 14, 2023 at 07:17:27PM +0100, Conor Dooley wrote:
> > On Mon, May 15, 2023 at 12:56:44AM +0800, Jisheng Zhang wrote:
> >=20
> > > +$id: http://devicetree.org/schemas/serial/bouffalolab,uart.yaml#
> >=20
> > $id: relative path/filename doesn't match actual path or filename
> >         expected: http://devicetree.org/schemas/serial/bouffalolab,bl80=
8-uart.yaml#
> >=20
> > Please test the bindings before submission - even dtbs_check catches
> > that one!
>=20
> Aha, I knew the reason. I did run dt_binding_check and dtbs_check,
> but then I read one of comments in v2 which suggests the renaming,
> that's to say the dtbs_check is done before the renmaing. Sorry for
> confusion

No worries.
Serial aisde, rest of the series looks grand to me, perhaps you want to
resubmit the serial bits separately & I'll grab the riscv bits once the
serial side is sorted out?

--YTtL81Hy5mMcU1A7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGJkqQAKCRB4tDGHoIJi
0jbsAQDmdx3opFq95JKgP8MHlcdz0QcdrvfeH/2ZDILcK+oWWAD/YaBNfF32rw1t
yXQ9e/DkpxyDG+ftGg6vVGK3FORScA8=
=PWZq
-----END PGP SIGNATURE-----

--YTtL81Hy5mMcU1A7--


--===============5567076650184654442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5567076650184654442==--

