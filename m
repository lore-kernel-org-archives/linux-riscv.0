Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFA6C64ED6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 22:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcDA9zrXjowG7giJx3B7+c3Mmy4YYUBelMRjVdiAock=; b=nacMUHUOHEoDDOTOPHdIvJXpof
	kd7s9epQENh4bkh20qzZLRnzo9GDPBrtY/onAhmH1CNOzCt9N7t9pTafwpqxgHc2wmW7tswjx1KiM
	L39ioVEG7pfEyEIo22SXLvjJXdI7ehNuGDHA/4wQ3HRKwPYFpny1UxMcwoOpnZ6DuYSm3xwBUD4AU
	1yrifvOg9RqBmZV+0e82yXgXW6h7wZ4fsN3olcRMBNQYHWMeQmb5jF2L5w1hv+PpsF0hZvT9tlJ/D
	fqYv3qWAPZe659NbheDNbGq1VFIqmenmqz6CFyV765L9iw7mWo4lwCRjf3YgTz8pA+b8doTsXamyL
	3SR/z8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVJx8-000TT7-Hv; Thu, 23 Feb 2023 22:20:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVJx5-000TSQ-Fj
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 22:20:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E1A45B81B3E;
	Thu, 23 Feb 2023 22:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242CDC433EF;
	Thu, 23 Feb 2023 22:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677190832;
	bh=/RlH+uTaquKSn6/TiMh8xypzok73Zt8sPG8pAcmRmTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqvoO2IVOtcWr342wVoa8dpa33bpVLtuRSUYfEPcNnBl2AVduvoZmVu7l/xjE073r
	 7agFjiIId/cqkG1fHGZ/+aWjvkI57OT4L6wkVbP6cC7gt5j/fN+iTzEMjoyfIfNM19
	 wkEuxsSU5mPVRQtXCK5GY9NQnQ3NhGZU0/itVdkSlh0ZnZkIMVD8ZZgtjT0j8UCkiW
	 PN+0ECz8fyhhRN5pd7gxZxwLEawkUL7+DYpSLCVocr1fLoyk1wbkR9Ho0BRjy+xi8+
	 PRNHezUHVBpoqeJ8ZwIsVEZDEZ9D/VQlNFZafspIKpVpK/oQqLCB7NbAO+ei6lffjK
	 rPt63LArumsZg==
Date: Thu, 23 Feb 2023 22:20:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, tsbogend@alpha.franken.de,
	mpe@ellerman.id.au, paul.walmsley@sifive.com, palmer@dabbelt.com,
	robh+dt@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/5] riscv: Select ARCH_DMA_DEFAULT_COHERENT
Message-ID: <Y/fmqwboOv/JhWf/@spud>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
 <20230223113644.23356-5-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
In-Reply-To: <20230223113644.23356-5-jiaxun.yang@flygoat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_142035_689306_558387C6 
X-CRM114-Status: GOOD (  16.54  )
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
Content-Type: multipart/mixed; boundary="===============4140773935267585617=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4140773935267585617==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QTYFjkFK/Dt5/rMq"
Content-Disposition: inline


--QTYFjkFK/Dt5/rMq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2023 at 11:36:43AM +0000, Jiaxun Yang wrote:
> For riscv our assumption is unless a device states it is non-coherent,
> we take it to be DMA coherent.
>=20
> Select ARCH_DMA_DEFAULT_COHERENT to ensure dma_default_coherent
> is always initialized to true.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1d46a268ce16..b71ce992c0c0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -233,6 +233,7 @@ config LOCKDEP_SUPPORT
> =20
>  config RISCV_DMA_NONCOHERENT
>  	bool
> +	select ARCH_DMA_DEFAULT_COHERENT

Since we are always coherent by default, I feel like you should put this
in the main "config RISCV" section, where OF_DMA_DEFAULT_COHERENT
currently is, no?

Wouldn't bother respinning for that unless the dma folk have comments
for you.

>  	select ARCH_HAS_DMA_PREP_COHERENT
>  	select ARCH_HAS_SETUP_DMA_OPS
>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
> --=20
> 2.37.1 (Apple Git-137.1)
>=20

--QTYFjkFK/Dt5/rMq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/fmqwAKCRB4tDGHoIJi
0leFAP9uQuy0NP1f84CZIhkE/FTxQbCtqVp7mJK2gG8h1AzO+AD+I8qU90iT/HH9
zh/cOUlKSuqIp7B4dD2guraiIpMV2gc=
=YsJz
-----END PGP SIGNATURE-----

--QTYFjkFK/Dt5/rMq--


--===============4140773935267585617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4140773935267585617==--

