Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED5BCAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 07:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiRVTmV2nqBYzKF5ZtYHzwReQXq5pxWW2KTQDgnXvy8=; b=DR2FOwYP+WdzfP
	sIXtAognvMoMn7Xz1vWRaaIxLYVb7l4SjzvheVbPXbsC/4aagyHziUb29GyQl832EmRvdvOM66eLK
	5+Dq2mFsW0o+Pa8ZQPkV8efwHu+Zb2uJbyvEISsgCHLI2gmFZJK19Dm9aQhux4VD6EWqgj6lE4ZDb
	yaiXmzsRO7JyTE7gUBxU+/Q1ySPQFeh09kdHhg4pubeYrsc2YOpqgr3Ie322uCTrkxwcsVQyR5da9
	NfCY469ikRgufn8KlAyi8cU+TG8ZNRSwhiJu1kLYiDRv8jAbdRWU6iF1EmeQtqRjyA42OthltVvMI
	QSI/fSF/mNYR3F0cs8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymwq-0000000AWzI-41pS;
	Wed, 17 Sep 2025 07:51:28 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymwo-0000000AWuE-1Wpi
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 07:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758095410;
	bh=9zb8bG0zqIEOxhdQgpYL8pRl5cp21PGqetg4qySjTPM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=KZvqpnXtnCI81jVvAtHoshMgai8xuWxSGyT2nTsevWC851081SOJNZ8PU+2zea/hO
	 fzERwT9+yHpo6vd8Mbw91vKwGFvyQgsnQEvvPn+6dnmbk0Jv/LLsk+Q5CYw198rRJy
	 cscoG7MEgangNCV+Jjqohb+SSsJoWXgRrgEe+zMM=
X-QQ-mid: zesmtpgz9t1758095408tac496626
X-QQ-Originating-IP: hoMmYmM+iXM9vjSWP534S9eL48TnmbgB6K21OZndabo=
Received: from = ( [14.123.253.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 17 Sep 2025 15:50:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14088576248179835359
EX-QQ-RecipientCnt: 17
Date: Wed, 17 Sep 2025 15:50:07 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH] dt-bindings: i2c: spacemit: extend and validate all
 properties
Message-ID: <F28733C699531788+aMpoLx-bCpo9-ZsX@LT-Guozexi>
References: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MSqE4cKCFYdhc0F5UsxOxyG27xNSahkIiXFj2GNiDnijP4WrqewrXhV3
	NxFAtjrtLNyIywey6b/ja+QjIwJDPOPcj4Xz9EDmPlciqNU2CyxqGAzmHcFKiUjzby3iMLS
	qSMig9FOYnvP40hV4JDRhPkI1NW8w6zpoYRRSaZ/vCIZn2ckfh1lW1EywZRm8k9IsqePotl
	DuzemJL8ZPgIKjo0GxYMl+jvyPjm9prybSCWD3U2o2VKJdVO+6SPs55R3EE6W7zX0s9L3X/
	LwSX2QqQQV7z6oDjCY1JcrGqaR2MU9JJtVjHi+FqxM+XHj+4dByVjQyq+KKPebbqMmesTph
	QnAGNp2jLzjzbd1QKtkcLUpoyxRQSGfIIA2xq5xHA3HNlV3T0grPtmIv+/ajwBwoF+0ddHF
	GLlgapeRu4u80rTU3Jndcx/nsdKszlSBki6TOhmb7bWZI5p0Ifp1/34f+1Jqfy+PHsmsiHj
	sZSGSkOhahvXF67aFT6jHtJ0mEt/uiVxskP7nu5XrVLirxwm+D4Ejhv/xBQOapG0qTSFMuM
	JvHpOuIShqQXm9MrGRbG5hYOwE3NzVIcMgEjU7jSVun+jp6YyORJYPAmNzYP9/FwdqLM7/D
	WVTX6wSXTHIfk0Jy6xT/G5IwUerKO/Vc9GEAqK6Ib3Fc9DOwNue/vPIpO5qWZxWJdtB5KO4
	5TQzl2mD3uWT6BwABvDMEc9X8RcpSOKU9MoNZ4rYQdg6m1+d+LJ+0m4femln2DfkJG18CHO
	rwMkbNPtmbTBUs9TU3efCsYr1K5xgEgbaBGjV2YCIF/lidtjgb9FTaa/A/0E36jmsmddKjm
	GFF9ic0b1/PGqJUgrCKit9v6AA4OJbGlDQvIVHbsLOMX8YJaByEvwP+IA5Mot8ex1PLEdiD
	X38D7HC8L7/LN6ho3kRgSxeux7ACMrzP2f5gb0uQwaHm1iQDrgT2++BbmuVApDezZ7nOH0+
	3F8N/rXHQXiVHKYAS9Tz3JFcmenJhT/xcGUc684vEuw+JCOdU4a2Lw+t7QOAD8njCiHHtCJ
	cL7OGaShAUYcJKUZvQRa8/2td3dVbmILzquPYCwXQckgAtuhzcUdW2KDUV6HH9AbopHANJF
	VwQXBqLkvxz
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_005126_793088_631BABF5 
X-CRM114-Status: GOOD (  15.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 17, 2025 at 11:38:13AM +0800, Yixun Lan wrote:
> Extend the K1 I2C properties by including generic i2c-controller schema.
> and this will enable it to do the DT validation check later.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: i2c@d401d800: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@41' were unexpected)
> 
> Link: https://lore.kernel.org/all/20250825172057.163883-6-elder@riscstar.com/ [1]
> ---
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> index 3d6aefb0d0f185ba64e414ac7f5b96cd18659fd3..226c600deae142413277117e25baae09f0918381 100644
> --- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -9,6 +9,9 @@ title: I2C controller embedded in SpacemiT's K1 SoC
>  maintainers:
>    - Troy Mitchell <troymitchell988@gmail.com>
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
oops, I forgot to add this..
Thanks for your fix!

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>  properties:
>    compatible:
>      const: spacemit,k1-i2c
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250917-01-k1-i2c-schema-faf6715d7b88
> 
> Best regards,
> -- 
> Yixun Lan
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
