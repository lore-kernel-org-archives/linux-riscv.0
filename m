Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B46C636D3
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 18:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ovHAjpG/F8dewyBIEpYE4pf035NwoCsNf41eN+TM5U=; b=Ewdgf7hmMasmTkh8CgFmjksCkC
	SiBQsCCSOe8LOajz/Kn/yCXmYdJmYTa5/X1BOwkXZSC5wjMWMpwUWdXUEfE1CSG2nOJ/ah/RWwbEa
	Tjw96Iuye+nas9p+wEYay4HJ8iKPzUsc+3gC3zRd3dTE/+DFR/rLtNI8fxkU4rP0BS5cs+IreGcC6
	ZXCxz/GP0YTl4G1NHmabcTn4GkSo0Hhp8IOC3lY6k3s6VAqYEWj+XRkwHmoH35cZKKbEtrNLmmmHe
	hChpg62SJSUpeeTEtLEHTAkB65KhkEH2oaFOeuHImxxVVeuIwzt1lk/EG9xWmr44cpDIUQ+wpxeLk
	cPeWJc0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPSVj-00D1hk-3V; Tue, 07 Feb 2023 18:16:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPSVf-00D1gP-SV
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 18:16:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3421A60F6A;
	Tue,  7 Feb 2023 18:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B253DC433EF;
	Tue,  7 Feb 2023 18:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675793759;
	bh=hyXPCMlpO7BwytLT5DV1xWv0+2q0jvjZX4T5MnllIuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNot2fP8+qrl20uC7aLd2k2WQ99VRMTB7di8BZJFBFz2A1up4MdDzlXsN9VfNUBDh
	 OvfsbMsAJJ6yhcOc44mbPRMCdoXiSAz/8AL0VxfVuRvEyYimbrt0ycjvsHm7N/z8hw
	 kEmjSAtxeGw0nwh7FL/myNOxI38jux/T8bWui7Tk5aw1ZVSNsAJJ/hiNeCVuLA7/19
	 hNQsHWC6HMh+y7COle+7qMFaS5QyYnHHv78+6DYrg7yY5Y9ASDV3oeqsVj9wq+a2n/
	 fouDliMttw82xgyyKRrc0XgEAiUHxb66LoxNwKZTSdaRGO8kUnNLKMSZll/15uucPz
	 Tuk4nfNxioQVA==
Date: Tue, 7 Feb 2023 18:15:55 +0000
From: Conor Dooley <conor@kernel.org>
To: shravan kumar <shravan.chippa@microchip.com>, vkoul@kernel.org
Cc: green.wan@sifive.com, vkoul@kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v1] dmaengine: sf-pdma: pdma_desc memory leak fix
Message-ID: <Y+KVW4o1ZXJHFSZt@spud>
References: <20230120100623.3530634-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230120100623.3530634-1-shravan.chippa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_101604_023478_CCA06AEF 
X-CRM114-Status: GOOD (  23.87  )
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
Content-Type: multipart/mixed; boundary="===============4388283313429166314=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4388283313429166314==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CFXVfqSA5rCRtNup"
Content-Disposition: inline


--CFXVfqSA5rCRtNup
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Vinod,

On Fri, Jan 20, 2023 at 03:36:23PM +0530, shravan kumar wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
>=20
> Commit b2cc5c465c2c ("dmaengine: sf-pdma: Add multithread support for a
> DMA channel") changed sf_pdma_prep_dma_memcpy() to unconditionally
> allocate a new sf_pdma_desc each time it is called.
>=20
> The driver previously recycled descs, by checking the in_use flag, only
> allocating additional descs if the existing one was in use. This logic
> was removed in commit b2cc5c465c2c ("dmaengine: sf-pdma: Add multithread
> support for a DMA channel"), but sf_pdma_free_desc() was not changed to
> handle the new behaviour.
>=20
> As a result, each time sf_pdma_prep_dma_memcpy() is called, the previous
> descriptor is leaked, over time leading to memory starvation:
>=20
>   unreferenced object 0xffffffe008447300 (size 192):
>   comm "irq/39-mchp_dsc", pid 343, jiffies 4294906910 (age 981.200s)
>   hex dump (first 32 bytes):
>     00 00 00 ff 00 00 00 00 b8 c1 00 00 00 00 00 00  ................
>     00 00 70 08 10 00 00 00 00 00 00 c0 00 00 00 00  ..p.............
>   backtrace:
>     [<00000000064a04f4>] kmemleak_alloc+0x1e/0x28
>     [<00000000018927a7>] kmem_cache_alloc+0x11e/0x178
>     [<000000002aea8d16>] sf_pdma_prep_dma_memcpy+0x40/0x112
>=20
> Add the missing kfree() to sf_pdma_free_desc(), and remove the redundant
> in_use flag.
>=20
> Fixes: b2cc5c465c2c ("dmaengine: sf-pdma: Add multithread support for a D=
MA channel")
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>

Just checking in to make sure that this patch is on your radar.
Is there something you're waiting for on it?

Cheers,
Conor.

> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 3 +--
>  drivers/dma/sf-pdma/sf-pdma.h | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index 6b524eb6bcf3..e578ad556949 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -96,7 +96,6 @@ sf_pdma_prep_dma_memcpy(struct dma_chan *dchan,	dma_add=
r_t dest, dma_addr_t src,
>  	if (!desc)
>  		return NULL;
> =20
> -	desc->in_use =3D true;
>  	desc->dirn =3D DMA_MEM_TO_MEM;
>  	desc->async_tx =3D vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);
> =20
> @@ -290,7 +289,7 @@ static void sf_pdma_free_desc(struct virt_dma_desc *v=
desc)
>  	struct sf_pdma_desc *desc;
> =20
>  	desc =3D to_sf_pdma_desc(vdesc);
> -	desc->in_use =3D false;
> +	kfree(desc);
>  }
> =20
>  static void sf_pdma_donebh_tasklet(struct tasklet_struct *t)
> diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
> index dcb3687bd5da..5c398a83b491 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.h
> +++ b/drivers/dma/sf-pdma/sf-pdma.h
> @@ -78,7 +78,6 @@ struct sf_pdma_desc {
>  	u64				src_addr;
>  	struct virt_dma_desc		vdesc;
>  	struct sf_pdma_chan		*chan;
> -	bool				in_use;
>  	enum dma_transfer_direction	dirn;
>  	struct dma_async_tx_descriptor *async_tx;
>  };
> --=20
> 2.34.1
>=20

--CFXVfqSA5rCRtNup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+KVWwAKCRB4tDGHoIJi
0pfUAQCRSYpj+UXdzwRJIDxnAY4Ex2piBHnUpqHXYSzu+uHbXQD9GzSXnoeUACmz
isahFC6JG6tJAbxK/VM7KbIzY4vlFwU=
=jO8h
-----END PGP SIGNATURE-----

--CFXVfqSA5rCRtNup--


--===============4388283313429166314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4388283313429166314==--

