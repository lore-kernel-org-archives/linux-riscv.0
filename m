Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD04DD2F000
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QW0gqjiTwuS+Bsd00+6iPgf30sDNJIKIZ69VXSPzhSg=; b=efz0ww+psFlgZJUqYIh5PafYiP
	O1U6G77Uqn/3IfGZHEhum4sIKWo+nVQKEQYM1DW4HEd5WaZdRoG/KSzPuJwlmLh7fkz8t6mm+roBs
	gmZoGM2ejelmMlt27eL8XhQcCLSSio3utS0Dn61uUsa9gT1MmHURindK7yCNiv6NYzC/yeMCfTOOR
	U2E9yRhV0gyMNXOnEBr2UPRh3SLoCCtjrz5RbXYdgDqnFsPHCTY1fdxBIiK138C4HiFBNs1XcqPRW
	1+E5QhRetonhSW/boFc1scEk4aTWpb6NSiCXSS7D2dyWmfRDFSO+Djip5RhrWJn3TGvt2yfZLY3YN
	Maq2LoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiW9-0000000EGgG-3MZ9;
	Tue, 27 Jan 2026 12:50:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiW8-0000000EGfr-27ug
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 12:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E352600AA;
	Tue, 27 Jan 2026 12:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E99C116C6;
	Tue, 27 Jan 2026 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769518198;
	bh=KYms8UhlZqE4igiABRj1LzqgOIs+iJRMeClJApK6cbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uaNYvjUxY0GIM4J6cCobQ23NebB7GjsM2DZfK6UILpYCSRtdQ1W8+iVvZACzt1Dhh
	 q3LFOHORgflGCdpvnxA9vWUHRxLFp3T1cmpz+iPnNnDW4EXZWjgqKVV4MY+oQP5D2T
	 vO58w5ZiPuVfGZ3MftsqHj/ud7fALXaNx3LVnMx4dHa2a3HSGZgSGDeFvrb3AmxnJX
	 gHBIFh0EFBFi1lCR/R3siM+huMpBhChoodmHn+Hpt1viDnik0ig2E4cFOckxsbSPBF
	 Rn3Y27pM6p0L1o1VHlu+FZMifmTtMX/0Owbk8X4xqVn971LrHdIjUoU7SaIoCnx0M7
	 HHX+4l1rl7CuQ==
Date: Tue, 27 Jan 2026 12:49:52 +0000
From: Mark Brown <broonie@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC codec
 driver
Message-ID: <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
X-Cookie: I brake for chezlogs!
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
Content-Type: multipart/mixed; boundary="===============7000295337246541429=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7000295337246541429==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6aHygTPjbSMl5gIi"
Content-Disposition: inline


--6aHygTPjbSMl5gIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2026 at 11:06:07PM +0400, Anton D. Stavinskii wrote:

>  	help
>  	  This driver provides an ASoC codec DAI for capture and basic
>  	  control of the RXADC registers.
> -
>  	  Say Y or M to build support for the Sophgo CV1800B
>  	  internal analog ADC codec block (RXADC).
>  	  The module will be called cv1800b-sound-adc

Extra change here.

> +static int cv1800b_dac_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
> +	int ret;
> +	unsigned int rate = params_rate(params);

> +	cv1800b_dac_mute(priv, false);
> +	/* minimal decimation for 48kHz is 64*/

Nothing ever mutes the DAC so this is a bit redundant.  The mute should
probably be a mute_stream() operation.

--6aHygTPjbSMl5gIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4tG8ACgkQJNaLcl1U
h9BHkQf+Kuc6BJjZWeAWQyoncG7fDBwM+k/TqBukcTrPjZHiGZ22yCkrEVWU06Lc
qWWOu9GIJM4QfBsRLYI9IEvy0L4b3RZK72dHfIsK0YEOUydC1oKWRYsm4qUqHnou
vXTYz6nDIuMxvIAlODl9SiLHxT4/BNRKMWdPl/RCV86jUbF7mBqyRpDx41tTTuen
lzSUWIvK8ZhTmCfkB6mdBapl4oxYANInUjMxq/28hOUOJ3xXIiPLTn/UHFLVYmdX
ORMrhBMCWuVIiagUgK8RwF0Uc9Fd1zPgfA5QjanVdstgKYDe1IhODVJNT5n+E2bE
8un1mgrWVdoXPo3r8LiZ9rth+YqXqw==
=0mgc
-----END PGP SIGNATURE-----

--6aHygTPjbSMl5gIi--


--===============7000295337246541429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7000295337246541429==--

