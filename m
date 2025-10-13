Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE94CCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 12:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IB1+/cU3n66qamYBfAmBe0tdlC1h7asY9XAL3y4rbqk=; b=MDJX7CuG2DE2gPL2UFp1euXV/E
	ImbxZcUs0Kj6Gg1YI142fkRslWpYyQzlRWLrxKmABrvNp/6RpQmaCnz1gQZGxPSvO6h5NK1ZYLv4z
	H0wNLi8I5vcSmcspJRRIvscv4SlxOkhpNDflzhE3iyiGnOF8rYiGKfuo2WnD6fnUHjZh5lXugP57j
	6AB0LZ9Vl5fYlpFZroUMAv95HIdtxk7fXTDQ4YcIHSahwoHpwYelBjqy5urW8gplw+QQU3Yyc+cH3
	ItEu2etIn5qN3uBNAhj54TSdD0T6usMY18uyz8NgBC+VL7hdk1bzdWyKEDmihM86hTysExP5+WDCb
	6JiwVN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HJY-0000000D5QG-1qos;
	Mon, 13 Oct 2025 12:06:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HJW-0000000D5PQ-26aJ
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 12:06:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D08BE44E35;
	Mon, 13 Oct 2025 12:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6962C4CEE7;
	Mon, 13 Oct 2025 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760357163;
	bh=eQCTZ+DwwjDnDCLacfwORLwSG59bihMMYVuM80C2bGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHqi/xQutfRuvsv8IaAwOdm6h7IN+PcJRmIo5zSLeBghKtzNPbHI2oJqkpU+c139+
	 c7SFp1N2yH0nzOtchE3ZSBz+yki1CL2oar5WMpC+g9Q5IvJIe03ReLM7dCxlYUVJtN
	 aTXy8yNf4+CK1Ur2YenEkrFLCDEOAu5YxSeopH1NHmsSFIZGTNGid3WuyB5eW0xZob
	 v4mREbWlg/ZeJUmRTdiScuIa19OlWQbizwly1dTV3UlXP01QnAiLBGKNGvFe4pPTRm
	 2TiimEbCwCYRh/9Z35Q+a/rdR6loCJ6UJmSgsyn38tjSULUcMPrtBNKi5J/IcaFBsp
	 Smi/ODVtShrig==
Date: Mon, 13 Oct 2025 13:05:58 +0100
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
Subject: Re: [PATCH v4 2/2] ASoC: spacemit: add i2s support for K1 SoC
Message-ID: <d1d965c4-f0f4-4b09-b5c3-5925d5f7ce1b@sirena.org.uk>
References: <20250921-k1-i2s-v4-0-4f819f50e468@linux.spacemit.com>
 <20250921-k1-i2s-v4-2-4f819f50e468@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20250921-k1-i2s-v4-2-4f819f50e468@linux.spacemit.com>
X-Cookie: Ahead warp factor one, Mr. Sulu.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_050606_579044_F8C7616F 
X-CRM114-Status: UNSURE (   8.69  )
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
Content-Type: multipart/mixed; boundary="===============0059581862240000517=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0059581862240000517==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wweVKEal3BporYO0"
Content-Disposition: inline


--wweVKEal3BporYO0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 21, 2025 at 04:52:17PM +0800, Troy Mitchell wrote:

> +	case SND_SOC_DAIFMT_DSP_A:
> +	case SND_SOC_DAIFMT_DSP_B:
> +		snd_pcm_hw_constraint_minmax(substream->runtime,
> +					     SNDRV_PCM_HW_PARAM_CHANNELS,
> +					     1, 1);
> +		snd_pcm_hw_constraint_mask64(substream->runtime,
> +					     SNDRV_PCM_HW_PARAM_FORMAT,
> +					     SNDRV_PCM_FMTBIT_S32_LE);
> +		break;

The handling for one of these is buggy, DSP A and B are distinct modes
but throughout the driver they're handled identically AFAICT.

--wweVKEal3BporYO0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjs6yUACgkQJNaLcl1U
h9Be0Qf9GD0TEOD2NY68jkxmsqkwbrzpKPPN7UJKdC4om8/KIdo80hj9EOQJqjrf
LSFy9aQ5XESBTKTvd9iDZVTTqHvQjzlDe+8TXKu8oSkOJYZ8elONRCU0yU0swo2L
aBRSVCJP2zXg7srTXVuGP2imoHNSvBDCE/1/vqv8iHE+X/O7ckhM2DPl9bx8+SwR
xyxWhHD60jw4slx4cyQCsAcTF5ge2oTcGC+Wn3eBb9UenLuon7wTE8lsph4zUT6N
oVi1xiLjEgTpz5oFF87VoGPQySQmN8ZnlYZKQ8iZyasgocfz9IM3XkOovKxTagB6
K6mb5skvKkIOkH6rcWHb7iVU7gPpRw==
=XcnN
-----END PGP SIGNATURE-----

--wweVKEal3BporYO0--


--===============0059581862240000517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0059581862240000517==--

