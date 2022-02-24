Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EADC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eK9MTTDGHq5tPpZsjn3MT2L+gJgwhs5YTA4qCd38//I=; b=sgyTivQrCFlZPFUMCluIsNBYhS
	UdOB76Z2vPIG2eS2jPuWGYPhVAG7NJOvF2+n9M0Wv5ASqot+afTao2HvRsDlYBYtGbm1DR2wLorJ8
	p1G+zR0h5XDd8MTmGTsYN4KRg6YfZ2DWd/fHBXC+33x17GKXUx05Gcqnto+Nqqa+XlGqb4FF5f6Uo
	YIi5YT0ULenokY8hF4o7D/Mb04eN1WGYuVHgpmj9lypYRLP57DsbbBkOATPN0hci1p/6KwrtvEoeq
	8UGfAVkcfmJkrFrVTKX8CBq0+q7+gc4beXjSDhYZOUkVNMSppDa4DuSpdi4KKM0rvn6ChhlkOoAgD
	UqliLEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNE1r-000uSp-Kv; Thu, 24 Feb 2022 13:19:31 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNE1o-000uRQ-Us
 for linux-riscv@lists.infradead.org; Thu, 24 Feb 2022 13:19:30 +0000
Received: by mail-lj1-x236.google.com with SMTP id e2so2763205ljq.12
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 05:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tqghmzvBgkIucPk30i/1RBMKSaH511u/5cafjui8mTA=;
 b=iKFH/nCaBtENJTdm/3S9PPj+rKJPlWoG/Bdq+HV8ObixrJFQhS4z1MOzotSNJCI0nd
 ptVocWqzyJjOOYzWBHrx1rrGloth2JPJn7sKGfp69htceG3vkWOOI7ADBxyQFYlDgN2z
 NQsYce8GSPFvHIZR+DXTINmFU3dygBa1goHxH8XOUBFrPyJGVylrvRKUftxXzlFu2nmJ
 9KTSYsAcAKaN4YUQJ/qIh2d9uViSMimGushKydp4n/EadtjRn6tXME9va1S3DH1Qc89F
 q7FH1qy92/ox3nO1WFvK2bhM3H3EW+Yg6iSaY9gLDWfSa6AYQrGsS4Abm++y4xBxQ8gV
 m9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tqghmzvBgkIucPk30i/1RBMKSaH511u/5cafjui8mTA=;
 b=7JFyZWIJm/8kKPc4W0dnsenvuQ3uc9e6EpmhfrxssYf4Hi6xQq65svTiNf4F0p9a2S
 sPXgdJ0LQxq8C/crSNHw5EQgBLjtRrgKRJ252Ha6XDaHUOfhaqM6TQFAWfdIaVid+Uow
 lxFm9LH/ohdzqAtAWf7HDXEb/oHJimpMpqjCk4d0G4FWurvF+QGlrom4Iwsquf4u9TMA
 59m7qYiVBMR+hWL6btR5fbd+kGPFT73UCzx7UjNt8JDRMBhNASuDzignvEu7jq6otv/u
 J1oLom6W9EiPfQlHhBTfC2c2Bii/2vDvyO6WqpgjKpwwPN5uZUu4aElFJ4Y76g55jFIZ
 LuuA==
X-Gm-Message-State: AOAM531otMJdYUU2miG9GSLN6yituYZUkGkPFKIPEJEiKWYaiUEvdBzP
 yfGVld/Wu+G62zriLe9dSzw=
X-Google-Smtp-Source: ABdhPJxOmmfqAiXnv6BDPZ68mjeGMsSCHie4qvts2pK3mFGPljn7a3XGoQ/aUJEYXFFRyqmHmevKDQ==
X-Received: by 2002:a2e:99d6:0:b0:23a:925:6aa0 with SMTP id
 l22-20020a2e99d6000000b0023a09256aa0mr1896124ljj.110.1645708766930; 
 Thu, 24 Feb 2022 05:19:26 -0800 (PST)
Received: from orome (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id n3sm205819lfq.285.2022.02.24.05.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 05:19:25 -0800 (PST)
Date: Thu, 24 Feb 2022 14:19:23 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, u.kleine-koenig@pengutronix.de,
 lee.jones@linaro.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
 krzysztof.kozlowski@canonical.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
 atishp@rivosinc.com, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v7 05/11] dt-bindings: pwm: add microchip corepwm binding
Message-ID: <YheF2xMOEtuDwG0U@orome>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
 <20220214135840.168236-6-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220214135840.168236-6-conor.dooley@microchip.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_051929_028973_DFEFE330 
X-CRM114-Status: GOOD (  10.74  )
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
Content-Type: multipart/mixed; boundary="===============6510051393624874066=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6510051393624874066==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0UAUmyEyisF1FZUK"
Content-Disposition: inline


--0UAUmyEyisF1FZUK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 01:58:35PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Add device tree bindings for the Microchip fpga fabric based "core" PWM
> controller.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .../bindings/pwm/microchip,corepwm.yaml       | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corep=
wm.yaml

Fine with me to go through the RISC-V tree:

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--0UAUmyEyisF1FZUK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIXhdgACgkQ3SOs138+
s6G99w//bjUK/d2MUDOjWCCN+SjvFVIkEqIcEl2BOJoazBkO95myY4zU0P1kEZ6J
mhjKjqxDg/pa5ynS7Ok+UO0q3L967NngdXeYQaexGkM9CGvcFkL7LMpvQjF8kSzW
tz2dB3xz/NFcy62y883siihherqZb92tL4F//7+yG31PlUiTlTsZD+eYPbELTDHf
7WAmcfr37ROA1PHsaa+qbFGCVtOnJEUkh3YRvntQiFhLM6jP2Ng9MFMxbr0VQ8Dc
GMyS+2SbZN18FBHq+/gyV8dEVD4GEI0KzwXnyCE8Gog6Rrm0ViE0DhIC0rvfNt92
itZH1MJxItGlqukOE0rASVZScSsmwL5cBemlNKNVv2nW0ZBuXrcVARhiMP7A9mH3
RDrh9ryJFcyZQV55ENCZbIoqlcF54agHJdwRjDq++VHi6+7CeQEdgqzHR52nJ28Q
+l45smPbNP6hejF0uJq+nnQ5CrmsfnjNb6CEVU48FTOFS+6SBWJiHx15a3+xQLKO
HGGtNO7fncc3AGgbP97M8wWvGM5+cgEpKOkxLRHNu1DV676Reqo1wcagIgmjwYuQ
e4IZPadbpRH61AVEXlo8fVnnGVGehoc8nDVs68WZa5Uq0hUqkjQhs6IBgMyxTUdo
J3tjDezQfMxD0aigHvWyo8xWrSi0Xi89QHb6IKg+6OZgbnpb0EU=
=wbm0
-----END PGP SIGNATURE-----

--0UAUmyEyisF1FZUK--


--===============6510051393624874066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6510051393624874066==--

