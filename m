Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A06FF885A
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 02:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLrkgRyFFxEEwZ50vLF/vLBCUCe34R9mPTH6DHO7nmg=; b=bXev3+o5OJuohcG5bK/0OcGwOe
	A5dykblGFpJqB/bmJ5qa7Nt6AS4sylFaVEaswpKMJxaftb9pH5VVlPB86JSDK5Vb9Y+IoSRorJbf0
	MKzRQp02QFKUb5/GSfZmeoYrpLd4EtfL6NoDYm0mXK4OavxM/EdVoWgzHyMUe+zxR/SIUGFFH8JK4
	mXORsFoutxaPit66ckNv91clKPsfYL7Fd551FXZda4A8TANUH7cKZ0MIcdfBAB5YDRugbYGtbqGm6
	yNgOHZi59dq/eKbTjyylf0iWKrsEG7Gei0+u72JXq9yC3ZKtzLKbN3B91J+n80qGGxxLWqPfnC6Df
	QB95kUvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHuf9-00000002mhT-0krm;
	Wed, 29 Apr 2026 02:28:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHuf8-00000002mhN-1pDo
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 02:28:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69FCF61119;
	Wed, 29 Apr 2026 02:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E251FC2BCB7;
	Wed, 29 Apr 2026 02:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777429709;
	bh=U917FEeP1a65aybvARWiLBBMfAgnhdvtyR+oFIuOO7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWyCWVT1Ar3mzr0oxmaCB36QUdEw5kMfe3jmzUVhavC8+NzT4xgbLioHp2nHM/7R9
	 pIy5cagrWv8W8878zgVZoEGMHwTxuTc8+PBhThOUC+6/V73QySfT2RHfZd6By0nZjv
	 9U8RjfUA+3r8TQ0dF0/6t+dlcmuUIjEITS5AwenOYlLsvb98rCvQvA3Pr/SJWPgqWc
	 Zt0ScKlSm/fqEIDlPKOk2k5t1M35QO4G9pXJYJxKZukLoI5JOK4RYOAS3yc85JXc7c
	 LsqnkCtiNb6FaK8CgQt49DXtXqXkW2a6ndqwGCJx7zM0Aj3dB4WHSCf3kDXe0WXlff
	 DNUmYUOlPMbRg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 55E151AC5850; Wed, 29 Apr 2026 03:28:26 +0100 (BST)
Date: Wed, 29 Apr 2026 11:28:26 +0900
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] ASoC: spacemit: fix RX DMA params not set when TX is
 running
Message-ID: <afFsyiSHrVBapQ9V@sirena.co.uk>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com>
X-Cookie: 667:
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
Content-Type: multipart/mixed; boundary="===============2700447761875971758=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2700447761875971758==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6SEXtm4k7tE0lPs/"
Content-Disposition: inline


--6SEXtm4k7tE0lPs/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2026 at 09:38:46AM +0800, Troy Mitchell wrote:

> +	val = readl(i2s->base + SSCR);
> +	if (val & SSCR_SSE)
> +		return 0;
> +
>  	val = readl(i2s->base + SSCR);
>  	val &= ~SSCR_DW_32BYTE;
>  	val |= data_width;

Very minor optimisation but those two SSCR reads could be combined.

--6SEXtm4k7tE0lPs/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxbMkACgkQJNaLcl1U
h9DP0wf9FedyLiR2jbRQe052LYOVrGdSJyZFyiLrFiI/r3FDgyi5TzL8gejQm5DI
nYSEijJQO323eNHosl4l1xC3cqIr+q3XEbWw8Z1JSnUhvQbkyHpE+U/yBwNqsRnZ
HPPelZUia70N79+ff/6QKNjDuzJ2fLeRCxkUbgq79qdOaBQEQz69VrgrH3kG4Lah
aLpE1Iw/6fl5KC4vci2S5yIrp0tYv9jt+dI7t9A2BKZ0YBZkCdgbSEgFRBbJYJg1
ELGiysUjUwII8tO+GA7D8QiCegZEFHRKhPNNbE/ujVrUduyAuQGUkxriMwS9lFIC
XUtJuRWo/V1+ZMAzyfgugi8+fFaRaQ==
=H/sj
-----END PGP SIGNATURE-----

--6SEXtm4k7tE0lPs/--


--===============2700447761875971758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2700447761875971758==--

