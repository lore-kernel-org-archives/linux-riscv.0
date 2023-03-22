Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25780C76196
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 17:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCvUASa89t86SnZw+InIaVefdL3yQrdUIjDghQHmYeM=; b=qxBNT6jOnG8s+EgiOQTLoQ1V7z
	6z4c9vZChSEskWKgYStIheBTqto728u5ZQhqwhhbIr7aG9t8510ww+ykOrqKS4Pcrc7RW0vUc8RR2
	S22pfHVLwES0/yZ2qw0sA/F9PtZyIeNHkJNx0Ymh4yG5W1QCrOWZdA9/qduDkR0p+ZzCSBAvHvig5
	dJZQOAxC8gJCnIuHPUf7+WgYPPAfB92WXn7cdLxKiwML+2KPRpK7dUcq8D1dE4bivOv2Bsc51b7Be
	uAiPJaD+z0UljygE3GjK79Vmb90ON4dvBo1+gYFMftUeHm0sl7Egxfp3VStpmAbZh3IYtz3yWumW7
	d4gIzxcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2U2-00Gtc9-0k;
	Wed, 22 Mar 2023 17:42:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2Tx-00GtZV-0y;
	Wed, 22 Mar 2023 17:42:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B29B62220;
	Wed, 22 Mar 2023 17:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2224C433EF;
	Wed, 22 Mar 2023 17:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679506960;
	bh=OcsrKnzki4a9lwOH45aqmVNP8I1F76AaxK2/K4GQegw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fi2ZrtRz/ikyvPo0/GL2HXtR1ipANItLggD55ea/dm3Dv7tC3EbIS+4U/z4Y4KfeH
	 5o9i/VmrRAoXwCVnkmh+9xDiq9oL/masEjSb5CJ7cAIHgRHgc52K2WiqgCoRDMa8tG
	 l+Pb5jNWez+J8x/LO2xsARN/h1/+mWCODeuMANOJ3jqdu7gwSbQB2zPbVfk1Yf5vB2
	 7QyjcFZPLTNzd6CVGdq/5QH4sJJU+BbzMxlgOsSuQzvr99XDYA0ndpraliSJGiIa7T
	 BM9P3J4ItPhA8kr1f8XmMLL5TegV6oqZrtyXDunlWLeWLQZedOgiCmrHYAgpCE6Czg
	 VcHwwwBbpk0ZQ==
Date: Wed, 22 Mar 2023 17:42:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@xilinx.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: mailbox: Drop unneeded quotes
Message-ID: <1a780ce4-a34a-4d56-8e23-62c6ed383442@spud>
References: <20230322173449.3970718-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230322173449.3970718-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_104241_377068_EDE81078 
X-CRM114-Status: GOOD (  11.12  )
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
Content-Type: multipart/mixed; boundary="===============8690087130157625225=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8690087130157625225==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s7OkovLInhHlrXlo"
Content-Disposition: inline


--s7OkovLInhHlrXlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 12:34:48PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

>  .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml   | 4 ++--

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--s7OkovLInhHlrXlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBs+CQAKCRB4tDGHoIJi
0ljnAP9M6xcNRHWqsKP8m9DmhUIoAK2N9I8ntVPvgXgkDbXKNwEAmcuSgyWAzynP
jPQ9MIFEOPL9QVs0mQsmgjpm9NEXvwY=
=z625
-----END PGP SIGNATURE-----

--s7OkovLInhHlrXlo--


--===============8690087130157625225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8690087130157625225==--

