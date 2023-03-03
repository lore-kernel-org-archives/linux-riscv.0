Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C911C61DA3
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 23:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcQaOJDoy16r2yt2IQMFszOfsR9aT9izvkJBfUIH6x4=; b=V43E2BLeFz5SeX84HsXi6IuaEE
	cX1K2IdD13stSI3YtwtO9BWauOEdyDWsUpDjecEyhu6jN0xGl/9ua8XH1nfDf1TJmRkUj3EWCV97h
	BY0Ujg+7SjiwTxfkBuRNdjpYohFUtWad6k8+Kyr2OQ+IFeKIX1lCmkbu7prQSf8KOQ5DO/8juhT7h
	7QFljykqNYpJ4Djbep1dvqHGvq4lu/LxkbQ86M6tnY0oHQNTCPSQtS4OwUfD+CwBZuHL+f5tjNbV7
	AjQYyTPZ6IltFXOSdDT3yCTUUciwGwy8ddfXuyL753BJFyV8DP644rmPs7jiN4g6BmLXTuHhzxF2N
	5V04P6Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYEOd-007l8J-Aw; Fri, 03 Mar 2023 23:01:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYDJE-007aYt-7z; Fri, 03 Mar 2023 21:51:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A5090B81A34;
	Fri,  3 Mar 2023 21:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5195C433EF;
	Fri,  3 Mar 2023 21:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677880281;
	bh=Br50V+ZnNhKeUVmf1H88XflaSYA3zbjNUSaOrfbHpWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0Wgj2qDMYr7AQFFunxAnGexnwRXj41XfheavwO4sQNH9ThQWN7YWlj2Dp73Ahdw/
	 2uXKlv/22ez+DVr7ejBSi69+v/MiAkOp+L5BIU6bdV3QorAgVbad15r3DUWG3n/DEN
	 M10p5eVyq7bMRTBYHiwIAV7dwH08VMMfs8aaRdkMd/hoae6WtB50Y8/GEMWE9hfPsr
	 X7GJJ+ZO9cmyRf0HO7C4myHQ+bm9TdwZkTHEpy9iYruGmrWIunUXZc3w5CkIZpxxYi
	 kXKl6tYBhJNPTsNy5u9kGPM7Uf/kIR6xDR/XGWpONnVXpZwWkjJ02fE/UU6YbDF9O8
	 LSMB76p+PtvfA==
Date: Fri, 3 Mar 2023 21:51:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: yamllint: Require a space after a comment
 '#'
Message-ID: <cdad5aa0-bd94-4137-9063-af45e94a25b7@spud>
References: <20230303214223.49451-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_135124_647513_B1C739BB 
X-CRM114-Status: GOOD (  16.71  )
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
Content-Type: multipart/mixed; boundary="===============3307511730428329908=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3307511730428329908==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mffVr3k4EP4yfp2t"
Content-Disposition: inline


--mffVr3k4EP4yfp2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 03:42:23PM -0600, Rob Herring wrote:
> Enable yamllint to check the prefered commenting style of requiring a
> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

> Cc: Conor Dooley <conor.dooley@microchip.com>

> diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yam=
l b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> index 1051690e3753..74a817cc7d94 100644
> --- a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> @@ -22,7 +22,7 @@ properties:
>        - items:
>            - const: microchip,mpfs-qspi
>            - const: microchip,coreqspi-rtl-v2
> -      - const: microchip,coreqspi-rtl-v2 #FPGA QSPI
> +      - const: microchip,coreqspi-rtl-v2 # FPGA QSPI
>        - const: microchip,mpfs-spi

I had to think for a minute as to what that comment even meant...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--mffVr3k4EP4yfp2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAJr0AAKCRB4tDGHoIJi
0rHgAP9euC+7Ztk0BIMgxdrJzAjogpoZQH6UzawtcdI6SIq2nQD/d5Bvci5DVqMV
DWn8X2un+KM/vLbl8yUpHlGFB4QKwQY=
=v1U9
-----END PGP SIGNATURE-----

--mffVr3k4EP4yfp2t--


--===============3307511730428329908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3307511730428329908==--

