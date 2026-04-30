Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE93FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTxdisFEliD34g+FAOsm5DOAKENyA34cy5Mpd/9+YOs=; b=hG2Jo0aYB/yG24HeUMMS7meQNf
	qdmkuck6IooEovz0O+hH86c7elpEi6UpkeiDmwuBxJw91VX65y1474WlxOj7geT5q1Tb/LFkARlzk
	aVlWWARfGsMcjrQ3IVgBQK+5VEITRt5RGi5XqqdpNJzv6qzBdqVRC1RFXIvroCgH1XAsPrK9QBrUS
	G8RxhDEFSW0YwnKR+UXD+6aZAWramXiQE4JE0WSR7FXr15cLJM0A6IJmNYr+99pWqH0gYoJOel1ui
	ESGhtIRUW8nzSkoINAplUmxnlkaisuimut8eVODVUVuVJO4qGLnGNAFuVzDvqdY2Ur3DFMoV0OmIH
	BVL0M1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQ8m-00000005QQ7-0xqC;
	Thu, 30 Apr 2026 12:05:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQ8g-00000005QPQ-1HDG
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 12:05:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6FDF408CA;
	Thu, 30 Apr 2026 12:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C906C2BCB3;
	Thu, 30 Apr 2026 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777550705;
	bh=I0Oq0dU5jJ+UppyowHKAPu+eaXgi/MmNRyNn9m2b0no=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E2ts0IbG7QQ49QnqZq9Cp13PZISVMFeTKl5ubX4tNjMMCLlGYLRdNtk3I0XcQYTrb
	 Q8hcQnev89dkEwBLyQSpAttSfTOU7wbnbWedxpGHtAbi9Rqd4TF4btT5OHcrxx7E5o
	 AVJr4AEbZYlAvan68XZrmkp/Ap7UQlOmzQ1mLVwzf9LovCdNKbEQNl2Ul3JPvvDG9j
	 0g6COzNIMSk8ief7P0XEiy6raqcb3y6vJcesKg7bCyPIqJbgEaFj2WjrN2GNmR25xB
	 0jDbsu0ACq2P3VNDwwWd8IUQ2xuEumnXlqyn8HCBRvnUAV7NEEegnDKy6dF0kkdOUQ
	 blKSvwJ9vFtog==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2AC5F1AC585F; Thu, 30 Apr 2026 13:05:03 +0100 (BST)
Date: Thu, 30 Apr 2026 21:05:02 +0900
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	jinmei.wei@spacemit.com
Subject: Re: [PATCH 2/3] ASoC: soc-pcm: constrain hw_params when DAIs share
 the same BCLK
Message-ID: <afNFbsk3mg1KVOpF@sirena.co.uk>
References: <20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com>
 <20260430-i2s-same-blk-v1-2-3a1f04eb6159@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260430-i2s-same-blk-v1-2-3a1f04eb6159@linux.spacemit.com>
X-Cookie: 667:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_050506_359056_F6BE587B 
X-CRM114-Status: UNSURE (   9.20  )
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
Content-Type: multipart/mixed; boundary="===============4293487338397940818=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4293487338397940818==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WlK7fYYf5jmaqu86"
Content-Disposition: inline


--WlK7fYYf5jmaqu86
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2026 at 03:46:02PM +0800, Troy Mitchell wrote:

> +	/* Scan all DAIs on the card for an active peer sharing the same BCLK */
> +	for_each_card_rtds(card, rtd) {
> +		for_each_rtd_cpu_dais(rtd, i, other_dai) {

We need card->mutex here.

--WlK7fYYf5jmaqu86
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnzRW4ACgkQJNaLcl1U
h9CK5gf9Gj5JC8A8JSaCvNquVF+8OacEiVe5EC5OzF6wRRqZr4PgCv7ZnzJ6tLbn
tjvfrAGLZgckx8Jw9ymX+VZGlhU1mtQ1a1UsoOq7UjgTxrx+1LmGeuDkQgWph2WS
VycRRJbyVdenywyuyvHjXZK8Cy3QWRX4SM1ZFj7hKenPTFDxw7bw/U7ihAV8SnHq
KNRnE9fts7PcBxUjQ5VS3meIEyECxhUsxUSJyVxjr3fzuRtN3tPnJOMoAEUSWbH9
WN6TcFSL3nxYw0HP0L7MAhFDuvo9EpWRGWqmLnsgBFSKYn7UhKV52GCp77y2Ihb+
B9SHhsPaRiwHgzL9aDT2TORyBxVU/A==
=a6r/
-----END PGP SIGNATURE-----

--WlK7fYYf5jmaqu86--


--===============4293487338397940818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4293487338397940818==--

