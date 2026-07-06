Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B051FC43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 17:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/pHGXas9AClih8XaKTh/klCmKS8JOhDWoaXBe3D7Bg=; b=BOUMnMEaSGI4QgUw17y/lX1BG+
	CQrPBq/AF6ZERH2tVwmYly44PZq8h4e8Oej8tRmm+DJhkXh4ZPs3r5kAvHpccHMCtkvCw+8Mzoal8
	HZJ3f7v7tlHuXj5f7Wn8iW7DXLlk2ISW2CiD8oncIUYiO2L4RngkMHTXYyvk5zkwFv6h4orS3fDGR
	+cvvL6DhAR0tasUuWYrYNwOsPgbtvY3+OIAdG4Jm9fL8EClPI33nj0kZdFKRQDFuiJcdzb6xiVaSE
	YCCUVJruwuxxpMWL3v4luZufiqa59xKp/F12Sk0PpBkppkVpwnbUn7XJSPlYVMy00osNaD6L135gQ
	mCtM+G2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmqH-0000000DANa-1KcD;
	Mon, 06 Jul 2026 17:10:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmqB-0000000DAKe-3u8N
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 17:10:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493b779003fso16557355e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 10:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783357842; x=1783962642; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YwUdG1I8kJNunEWTpdhFYSiUn8LDq7cMo60LuGY0n18=;
        b=gE/Qzy7dz3pryq9pJh8RLFHDu9vIEietQIvP0CtfnycfJ7uFUmhXocCl3XwsICU+5u
         Lyy4250TWHEVRROTUKa3E5Kqtu3PD8l/8wT72wMgd9/gIMISs4RbzCkQKR+M7lRB9cSY
         mYgsY38LU28cewTpAwv1vdyh06leXvzHvA8DqpJfxsX1Hc03a/5lIbArOsnyKphtdmf+
         GbS4Gq1+rxvbF6E5EXWWOzEsbvJH9dlXZrpIAVBwn1+7sy0mNAuVMaaJofT2h0Y569Wv
         TZWSNQciAF07MggYzmQ6QRNsJzp+9Tp+ePPVxzeSe7D7cuuE5HtOtanDiE8/+/Tr0wJN
         taEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357842; x=1783962642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwUdG1I8kJNunEWTpdhFYSiUn8LDq7cMo60LuGY0n18=;
        b=WIeBGsjlZpp7UIsJ6nDMmB8ZhFAaTc73kEKm665y9HUqEow0y1K73BkIOaBpK3qAKB
         kZetoRdfZ90nepDwQahNTD98EHTdOpmYR50ab+pNZN5+b2cGqe91lRH+M4YX5HD99ylM
         tEZiXldC0p8NUOctIC9p1h/7MxHJWaCeqku5KBtKN0VdMh5JmvV1q7oVtHIMDRckG2J6
         7Z5uN9m5aw4ImDdPbL8QgHCqt1z2bZ0649i6qJg51JLSK/eLKu1p9APm+9hkTGpUQ5Qm
         psAvYE+JAMZoL5QCBuORgPxv9XGWdbISCHaHTz3ACcnVBVILVT2iH5ldoepWe3TOOn8f
         P9eA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5g3NdQU4mqSlXEldoEOLU9Qaqh/xgVlWcoiM2j/wpOx+qz7FyeD457ItSyjo+5Sk3V1abPOpgJ6YoDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5JfVRtcPUi5UFJTRurFNoIUMyxJBYfWWWNSVbmpY2VScwmMWx
	yb2+vy142crDcnF77Ol97s9/wkm+HHC5GQ0pc2wl8V5Spn3/ek7P8kp8DLrntx9S614=
X-Gm-Gg: AfdE7clgGRxsIXc+xS1rdf9Jp0Le7vR1mquT667xQzxmO9fldKIjTD28iybRGgwhUtE
	w9M27iaf9m4xMe12GG015HDIgN3sFLGSj5Wf7HIi4U6r6qIGNQcu3kDwxdeLcK1KRdDwmJVLiSA
	FDtUUOpQpewzMyF6+nzIN+4vC3+qEumwxS5+8J6UQgQR9gzSQC/PtVPSN1xqeOp9+nmSST9t0bw
	J6leaWOikJT/azcePQQf2zwtAH3e2YYtsrtwx+fTDjSCEA991iLLC1Qfh3NrzR68y7SF2UniUVI
	yV3Bku6aa5JwC43qXJhgY6bHkmI7/JnUDPYrh0dQ/XZ5Y+uEYS0qP+vn4gJd2qr5ecU1M8Jr5Qk
	Q1EuMxGqTFbyhsJPyBZqoFHdLhsEKsqgGuxlRgv8cW33duewMCiQEYfVK4NjC6VMeDmAgxfC36v
	ilTw/3ARw1qIRGkjD7e86pCDRFoRM6toStNigM2n5Oap6eokcO9VbIQltmE+upIXKI6HIYOajR4
	8w=
X-Received: by 2002:a05:600c:548d:b0:493:c478:8744 with SMTP id 5b1f17b1804b1-493df0644a7mr17176475e9.18.1783357837297;
        Mon, 06 Jul 2026 10:10:37 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493df703391sm6037585e9.0.2026.07.06.10.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:10:36 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:10:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v12 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
Message-ID: <akvhUwQ_FFSJYICA@monoceros>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-2-e3ab1ecf2901@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-2-e3ab1ecf2901@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_101043_994235_C82096E8 
X-CRM114-Status: UNSURE (   8.22  )
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
Content-Type: multipart/mixed; boundary="===============3591525966822450776=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3591525966822450776==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hya7dxqb4rmwvjro"
Content-Disposition: inline


--hya7dxqb4rmwvjro
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH net-next v12 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
MIME-Version: 1.0

On Mon, Jul 06, 2026 at 03:20:17PM +0200, Bartosz Golaszewski wrote:
> +#include <linux/mod_devicetable.h>

Please only include those <linux/device-id/*.h> that you actually need.
I'm actively working on deprecating <linux/mod_devicetable.h>.

Thanks
Uwe

--hya7dxqb4rmwvjro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL4YcACgkQj4D7WH0S
/k57CAf/UgOJNneAcYY3lQuZ+RhwSluKHlS9kU+LP6KfWURj/Pj78uMbougI/MWm
NOPHFAV0gOZPyox4TK4XImoVNCHq9wWJVtMM0UMCguoEBhrqgoeV/Esik9YncvIc
INlZjmDSd0r0OJd9oMZmIM7O1eIZxLQugbLTCT2WK9eW0OCT+20CmmtgHzGHZ7eU
krIfDqpfq0wJOa70OZmh/lowgwbJIjabcxyyCGiY0Scvf4F31ClocQmot5e6gabR
OcwHOulxqkUKBtOVZtPrt5lRsawYjY+ZslpAnnZvlrbrqmj2M9IuVyQGMqEW6kkC
CFP1TQBoEVajey5oRSMzdQ2ZlvM/wA==
=Sskc
-----END PGP SIGNATURE-----

--hya7dxqb4rmwvjro--


--===============3591525966822450776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3591525966822450776==--

