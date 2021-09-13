Return-Path: <SRS0=Pi2f=OD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5462CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 08:45:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC80460F58
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 08:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC80460F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mw/FyCCTGQmx2WFl73fayxbKAr4X1SIWkjTbKIbIbk=; b=i+Ff+rkLf5eyCJusBtkbE0/y2q
	pzCow/qiSg3xoTU5EVUnbumCIb7iUHaiDVSPgoQjd6eNIE3SCZpSRB8blGo32rBdtxqH8GQYavYgO
	jtS5iW0HJgTa/yV4ZWYP+18Zmik5MQv8YFUBVi3NsPFhjcOAIpgfVpwc3jEuRpEmidrXx+05N2PyZ
	n0VHnnTGy6UqueVbF7MPu00NKn3EHfmxdjbNzYTPS2DU/nIFUbmkKob+Sv6d6oLOfZWOT729ZOZ7h
	THUcde6kb3j88HZ+NXg8MtdotCFiVVB+BqJIcQ4LkOtHiYXYbqra5NM+/plthuHFH1Zbf+ttKzjTa
	1KmFBBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPhai-000qqn-7h; Mon, 13 Sep 2021 08:45:28 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPhaf-000qpj-Gy
 for linux-riscv@lists.infradead.org; Mon, 13 Sep 2021 08:45:27 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 563CF580C64;
 Mon, 13 Sep 2021 04:45:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 13 Sep 2021 04:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=3xA6WliwGm5jheo/QDh1OhhZHgC
 8t0qVZf0QWCOOHQY=; b=QK6e7NYjQrp3tC9TWK86Gz7Llio7+rF5/1HJVaEFRSU
 hm2686y27TjHe+yJ37qLGYnfd4xHOdMPASf1rPnSgC7lKW7sKhsr1WGlunegHLyP
 1BdtwcGB+0tYCUuW7LAYIWxQ//uEIw+SvAd83lOSzzQJuHZzTjWOL7axsfxTAsaF
 NPnxjr4s+kqB09JEzRn6eywmxALCnAw4zPqw5V9BBckKB52aufakZ9iKGufj/7aF
 QZzB4eVRb98Z3LoCV6sQ4LeHkQIwJi9qvEgFEKcLIvUoqtooFJ2lTNU+7mbw3Rj/
 C2WaOdVdxA3lKpBNTL9BcPTp6VQCHcMbeXCbcFb8cKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3xA6Wl
 iwGm5jheo/QDh1OhhZHgC8t0qVZf0QWCOOHQY=; b=k7OjXt+/juxGGdFbWdXMNy
 BZ5IJiEWYmT62dPp6ekQ/Mb9USqzKMaNXssS/U8ddVrj5J35CZg1+yXLxTbXv1Gz
 z52tz7cVTBV19ptU0HlrMfr7JRRAg5zn6vyo025iWM03Zw0KlN1dJolHW5vdewOp
 ZT+jUaYMjzm3DXWaBumhNi+HRiCdbTXeSSi1xxsi56/8/KF9Jp/nOJNW2zikUqrD
 NZjk8+btDjxFK5hlt6U9UquOWh95iACkP/SI/a98Z5abkIz77TGgxaiiDcnZv680
 W6OAjtsomwZd9BLvL4uO1GI/a1NpHcV5axUeKGHW0p1FUywy1WnNGO8WVKTYzqPg
 ==
X-ME-Sender: <xms:og8_YfeGI-H8Jzo1-4nlnDG2CzdriHN4qqJokV0kqSXQ-irHKwR49A>
 <xme:og8_YVN9DK0SBXqSgmmCShDGwpiDISkwR1hw4RxHafOylk48FpsfISNILrzsAZOHG
 3P7lIgbYJyZpXvOA64>
X-ME-Received: <xmr:og8_YYhGzmCx7aKLDWDfVwg4U0mooJAx95Yu5ICCqGSdZY2WtLYJiT7ImqTYTu_71J4DXKLjZyZMTHRvS1wrexvWgJtyYtO2DqSr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:og8_YQ-kdcXTlmRHsqOj73Kn8AkrFpXxTNmqxeRu7aqI6aP3C-jFtQ>
 <xmx:og8_YbsYlEB4kfkPeHb3sKr1Vsgmhxiut0TQ0WzfaJcfhzjCijCu3Q>
 <xmx:og8_YfElkQQNWjLF0uU1obSU68HDbbsSDil_rJUBvAiJluItFn1lgQ>
 <xmx:pA8_YXTCZWgfiG9sLalqvJ0FGekWvOy48LUP0K_qo2D3_FbiXA5-CQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 04:45:21 -0400 (EDT)
Date: Mon, 13 Sep 2021 10:45:20 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, hch@lst.de,
 liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com,
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>,
 Chen-Yu Tsai <wens@csie.org>
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
Message-ID: <20210913084520.kkbsupogkzv226x3@gilmour>
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210911092139.79607-7-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_014525_706680_F01091A7 
X-CRM114-Status: GOOD (  18.56  )
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
Content-Type: multipart/mixed; boundary="===============3379635439452926305=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3379635439452926305==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p2xnpxdfevxsmmn3"
Content-Disposition: inline


--p2xnpxdfevxsmmn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 11, 2021 at 05:21:39PM +0800, guoren@kernel.org wrote:
> From: Liu Shaohua <liush@allwinnertech.com>
>=20
> Add Allwinner kconfig option which selects SoC specific and common
> drivers that is required for this SoC.
>=20
> Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
> interconnect issues for dma synchronization, so we set the default
> value when SOC_SUNXI selected.
>=20
> Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Wei Fu <wefu@redhat.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Drew Fustini <drew@beagleboard.org>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Wei Wu <lazyparser@gmail.com>
> ---
>  arch/riscv/Kconfig.socs      | 15 +++++++++++++++
>  arch/riscv/configs/defconfig |  1 +
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 30676ebb16eb..8721c000ef23 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -70,4 +70,19 @@ config SOC_CANAAN_K210_DTB_SOURCE
> =20
>  endif
> =20
> +config SOC_SUNXI
> +	bool "Allwinner SoCs"
> +	depends on MMU
> +	select DWMAC_GENERIC
> +	select ERRATA_THEAD
> +	select RISCV_DMA_NONCOHERENT
> +	select RISCV_ERRATA_ALTERNATIVE
> +	select SERIAL_8250
> +	select SERIAL_8250_CONSOLE
> +	select SERIAL_8250_DW
> +	select SIFIVE_PLIC
> +	select STMMAC_ETH
> +	help
> +	  This enables support for Allwinner SoC platforms like the D1.
> +

I'm not sure we should select the drivers there. We could very well
imagine a board without UART, or even more so without ethernet.

These options should be in the defconfig.

Maxime

--p2xnpxdfevxsmmn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYT8PoAAKCRDj7w1vZxhR
xbVnAQCSKte+mjnWETzsLGCmouHNDj3ez50SJLr19qM4sU85pwD6AxCJ/iy45OIu
yqt3psn20BR6AvoN5uS5dcTBkr2TLgI=
=Tz1F
-----END PGP SIGNATURE-----

--p2xnpxdfevxsmmn3--


--===============3379635439452926305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3379635439452926305==--

