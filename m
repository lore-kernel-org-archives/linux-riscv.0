Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB42C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDibDzI8XkCqWuomUc+oYQU5AAAMc2i50QCamnGeRuY=; b=BEtGNAzk/qPnoBvs+EJhyQGqcA
	TM5RhhxfbQA6lHcu1KomAGldfQcG4RAEDFEnTK8UEmvtEr+ht28EZ3zGpgD8sw7+OMdb6jUVKGUr3
	EYDdnYF1bdNbXR5HDpUbaeVhXJkdQ+meMtloG3AJlvhoXHxPBEJxICN6ZcytUPsema/ks1Z1EdWR8
	93fWmdNwSSC7CGu2GLivNtS5eHgTDM97GK3GKWsrd4zBkekCs9yAuKOevg/FZE3dEWZugX88iFq/5
	fxWlIkArENW9K9q38TA+MQ63Ks/YFEzr+TeYBgBWUp+rs4ELSYLfe7h28VtpI884+hKEe6cZMZhWp
	temb/Utg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpWc-002Sec-0M;
	Tue, 01 Aug 2023 13:34:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpWZ-002Sd6-0J;
	Tue, 01 Aug 2023 13:34:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 86B6461578;
	Tue,  1 Aug 2023 13:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F270C433C8;
	Tue,  1 Aug 2023 13:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690896893;
	bh=5RlOyzIMWLWXN4Z4Qiob7qteiDrYb0Yp3IkTAwrDLno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLX2EzmlGBtWwKnF+UGxOMh3KaiSuGkutIyGCMvPXUfWln6Xa6X7r2wFWjsFWi5QT
	 Xcldzk9bGs5/N3PqKSmS6vAaXpVWzGGFrU0O1rQiTGewJNWJp4b6o0OCL9mAOqXUIm
	 G/UGfzrZzRCiedyhNEBCRKsmVzokfPUDFEEzhveNBnHdZBEumruLrfIWMcBtZWMo7i
	 Jp9a3THEuC2gFze9Oj+nNCeqEMYkhW+VsilwUC7ALcNfd5aDKJzgdfTiaXV2bbABV4
	 VCNOhFHoddFjzxED9hacoty0omWM3t/wZSB8gTdS5kaCWcQ2VwHWjAGIj/2TkO82cv
	 1elq6qQ4YfX7Q==
Date: Tue, 1 Aug 2023 14:34:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhu Wang <wangzhu9@huawei.com>
Cc: brgl@bgdev.pl, andi.shyti@kernel.org, conor.dooley@microchip.com,
	daire.mcnamara@microchip.com, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] i2c: remove redundant dev_err_probe()
Message-ID: <20230801-faceplate-craving-e913d24b0b5a@spud>
References: <20230801124551.138541-1-wangzhu9@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20230801124551.138541-1-wangzhu9@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_063455_177081_3EBAC2E1 
X-CRM114-Status: GOOD (  12.16  )
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
Content-Type: multipart/mixed; boundary="===============8605547531186545270=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8605547531186545270==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BHH9ywCRFSmsCg/p"
Content-Disposition: inline


--BHH9ywCRFSmsCg/p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 01, 2023 at 08:45:51PM +0800, Zhu Wang wrote:
> When platform_get_irq() is called, the error message has been printed,
> so it need not to call dev_err_probe() to print error, and

> platform_get_irq() never returned zero.

Is that strictly true?

> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> ---
>  drivers/i2c/busses/i2c-davinci.c           | 2 +-

>  drivers/i2c/busses/i2c-microchip-corei2c.c | 5 ++---

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--BHH9ywCRFSmsCg/p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMkJ+QAKCRB4tDGHoIJi
0t5bAP43t8TJDs1IIKjx0D5zL3GTqbU2KL6KUqtqRuTDgkxDPAD/RJA0wbEb2+f6
7IDa2eS/bkt4nyzHj+nw2T1xmq6cOwQ=
=JSqC
-----END PGP SIGNATURE-----

--BHH9ywCRFSmsCg/p--


--===============8605547531186545270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8605547531186545270==--

