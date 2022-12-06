Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B073CC47090
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 19:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u63EM65aC+49ZCuRN2H5+eH0Y6aoMfxK18XbK92qjjY=; b=T/RUjOeexSZHrs2rFREK1uYqF5
	p7sosuQyLSTW3iTfF2nYvpLsCu0fyB0L86l2NLYKnXjTqO7YHdxJrUHr35djW05llCf/6hjEw66PT
	ui9PEQ3DuxqhfGdYhq9gyCmW9JPepOV+NuCHA2zE1ei8rsy4IXB7EVqTj5Sn9Gib1QeWHw89L3Wvu
	l/HoHilb9i6zlex8FiOcMrUQuurIXBtFnRyfbiTKd7hIq9cL93wmEOwsdVnkZBJsK5BfZygRA/S2L
	/Gfs2PTUZ00KVtCd0tNmw31Tr1B8T8h585+m7A5RApMz/UFoQ5CYBiTnFTepnNG5myGjnfgnhzyHW
	Q9cxjGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2e3d-001QN8-EH; Tue, 06 Dec 2022 19:56:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2e3Z-001QCH-4L
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 19:56:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72CB2617DE;
	Tue,  6 Dec 2022 19:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91E0C433D6;
	Tue,  6 Dec 2022 19:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670356603;
	bh=FK42GhXAzXR68J/FeBFskVq63u4BLlMjEflAXTkwvbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J35hYii51BgGTcwuTNAMWNNIX50lFDLeU4rldISsYxrKhieRjVxr6koe6Z+kWHYz4
	 9dR7x/W9Xt56IdLiLpikiFsKD4tQ1/38VdPILkcWw/RxXrCJNxkFtcg5wf5590b6J5
	 ZyzkdF7wmDnwTUzBGJXLiHE81PUggzGWR5L75C7piwi0UmovnrUctf05eC6J+B8U6r
	 To4ylBBPWMwJdgBOJzI1+qm1gWz37gGMwPse3gOr7MU0VwDGcDHNdd2bLV+69EXlYD
	 XI/r5dpC1cO09GnWIf4LvlU3kUQiF1DPgfL0vZG4xsHQ+RSv3c4HyxNd/ViAsVbiz6
	 k9f4IP0uePyIw==
Date: Tue, 6 Dec 2022 19:56:39 +0000
From: Conor Dooley <conor@kernel.org>
To: panqinglin2020@iscas.ac.cn, palmer@dabbelt.com
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, ajones@ventanamicro.com, alex@ghiti.fr,
	jszhang@kernel.org
Subject: Re: [PATCH v9 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <Y4+ed14keB29fM2Y@spud>
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-2-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20221204141137.691790-2-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_115645_233930_BA24C265 
X-CRM114-Status: GOOD (  13.02  )
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
Content-Type: multipart/mixed; boundary="===============1295527960340364955=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1295527960340364955==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dHL0QJ/FOwcpIuW2"
Content-Disposition: inline


--dHL0QJ/FOwcpIuW2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Palmer,

On Sun, Dec 04, 2022 at 10:11:35PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> +config RISCV_ISA_SVNAPOT
> +	bool "SVNAPOT extension support"
> +	depends on 64BIT && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	  Allow kernel to detect SVNAPOT ISA-extension dynamically in boot time
> +	  and enable its usage.
> +
> +	  SVNAPOT extension helps to mark contiguous PTEs as a range
> +	  of contiguous virtual-to-physical translations, with a naturally
> +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> +	  size.

RMK's perl script that I yoinked complains about this patch,
specifically that it expects the order:
depends
default
select

The patch I sent out for the select order the other day also switches
everything to this ordering:
https://lore.kernel.org/all/20221202131034.66674-1-conor@kernel.org/

Is that sane? Certainly for the really long lists that order works well,
but idk about the short ones. Unless you feel strongly otherwise, maybe
we should enforce that order for uniformity?

Thanks,
Conor.


--dHL0QJ/FOwcpIuW2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY4+edwAKCRB4tDGHoIJi
0hi2APsF0MybmjBAsdiQxthq07ddZXdv4JgdwXK2sSxyUHV3zgD+OCVzF+JyD3Cz
6FM1sY4mOEOEujUySsdeTq6aE3OEVAo=
=PMSY
-----END PGP SIGNATURE-----

--dHL0QJ/FOwcpIuW2--


--===============1295527960340364955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1295527960340364955==--

