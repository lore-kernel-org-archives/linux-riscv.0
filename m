Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C0DCAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 19:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJEnzB73fsetGlkxw/0p2q9WYR+XX8zhktMvNiRvG0M=; b=ttCi/SzihJMCoLjNpN2jBtEh/z
	knW+LqN7xFCvIMrJxP2uGiS5FA7ersj4gMiT8Y8n9KjAtfueiCQPyzjtddPc4h4TGdFoK7K5QtZlf
	28d59uplK++l+ia8Nt0RaT/dIRlCSiLsTyNtpFv0g3tw4JiIYlmGXRIXoUh8XGliAmGFM+/p1VbIl
	7+nnzycJwJUd2rbKVDjIBKnoANZCYJCvjNaqRNUYHdbJrTRoAkI8b3z4N2AOtNnp3g+Et+97FdxQB
	Fyc0FdFgxMO37w6XDlmFWekLfq0TNqz3heZUxDBGVWjrz9I2dSr6cKfPmFdTiXbpGU6Zsi7c57E/p
	fF11liIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFFy-00000005XkQ-2suz;
	Mon, 15 Sep 2025 19:52:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFFv-00000005Xjo-3olv
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 19:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A56D43924;
	Mon, 15 Sep 2025 19:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9069FC4CEF1;
	Mon, 15 Sep 2025 19:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757965974;
	bh=uOejRi2XFO7qeixRkiyMH2Apb1CTrpBORTrA10JAROg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qU7+qyHlZrBu/gHA3AJ6ybvYlPuZ9cE2B8ivLGMmpgMb2CTlsMAcrLFG8Rqs7iR58
	 trQljAvT+THNok/lBolUatoHOkf2F+/qNp1jyopY0nehy5T39ibuQNX76ps4LtlEc2
	 Kpn/ycP5WZUGeDfHwW1TvEtCS2ulAX/fhFv/r/21w79fTB149Ruin4gcO/aZwtsJpR
	 bFt+jNr5rFpfavWiUFGSBiLgXx7Re6slKaeAhg/FZiVOfzRj0U1rckVJfQPSeSzxmC
	 fMTBpOVzuzlh4iMSuJJTk6Eg3bgXkn9On/BE6GK/18smpRaUtQROx6L8582/uzj0pg
	 adVSmS0KSukKA==
Date: Mon, 15 Sep 2025 20:52:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v3 2/2] ASoC: spacemit: add i2s support for K1 SoC
Message-ID: <50b81d55-a4d9-4e8f-831d-b98d789c125e@sirena.org.uk>
References: <20250911-k1-i2s-v3-0-57f173732f9c@linux.spacemit.com>
 <20250911-k1-i2s-v3-2-57f173732f9c@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20250911-k1-i2s-v3-2-57f173732f9c@linux.spacemit.com>
X-Cookie: Use a pun, go to jail.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_125255_965288_190F8600 
X-CRM114-Status: GOOD (  11.17  )
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
Content-Type: multipart/mixed; boundary="===============4797309385007015320=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4797309385007015320==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EGXM8N1jhlP6IDAm"
Content-Disposition: inline


--EGXM8N1jhlP6IDAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2025 at 01:47:11PM +0800, Troy Mitchell wrote:

> +
> +static int spacemit_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
> +				unsigned int fmt)
> +{
> +	struct spacemit_i2s_dev *i2s = dev_get_drvdata(cpu_dai->dev);
> +	u32 sspsp_val;

> +	case SND_SOC_DAIFMT_DSP_A:
> +		sspsp_val |= SSPSP_FSRT;
> +	case SND_SOC_DAIFMT_DSP_B:
> +		cpu_dai->driver->playback.channels_min = 1;
> +		cpu_dai->driver->playback.channels_max = 1;
> +		cpu_dai->driver->capture.channels_min = 1;
> +		cpu_dai->driver->capture.channels_max = 1;
> +		cpu_dai->driver->playback.formats = SNDRV_PCM_FMTBIT_S32_LE;
> +		cpu_dai->driver->capture.formats = SNDRV_PCM_FMTBIT_S32_LE;
> +		sspsp_val |= FIELD_PREP(SSPSP_FIELD_SFRMWDTH, 0x1);
> +		break;

You really shouldn't be modifying the driver struct at all, if two
interfaces have different configurations or if one interface changes
modes the two will fight with each other.  Use the constraints API to
enforce any constraints that are discovered at runtime.

--EGXM8N1jhlP6IDAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIbpAACgkQJNaLcl1U
h9Dx7wf+JdDIZkZd9eM9d4C+b/D0+e65EupvZa+AsItg/lCqRm5ORu57BBdcmBTA
kKSHTTfHgAT7EMcHDmRYTX+HUxqVMBFFJ1Qp7ZP23Yv2oMUQw1pmDUCHc6iirgvQ
MOiKDXTv8Y9XHI5DpzrnC9wUTxy5B9RV1THZY2P5PQCDPKSknMafWOZsJLFzjOCC
QpBWW+TYApx9c7m45lHRvWK8Xk/tdzhz9E2EyUNTSX1mUc2w4M9A0RPlI/gVAPzk
8kfsGCNjmRA1gOwgecmB69k2bBqvSH4HUJbt8d1oct2qNtuzqLP4NneaALBK340h
6oSgJkPkOKdN3shbVXBUXaVIFg2LIQ==
=DUX+
-----END PGP SIGNATURE-----

--EGXM8N1jhlP6IDAm--


--===============4797309385007015320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4797309385007015320==--

