Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCB5C7EE29
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 10:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDmO9msVY1KxqdrKMezKOE6CFPPGKQ/qokT/c1eSXt0=; b=S2uLq7ZTRHFm8Xd+Qxtm3LlINB
	jbfYYgniDqqYVy+ThxJt0mJGDhjc8rB603YZMUkwGw08OUWQXDBkrQAPZy98AddxCM+VsZyaiyVvF
	MwICnu/XUNsVUznD9WxNyFPZevlfnKEvdCU7mRTvQ4B0DkfxvzArVPsU2AoF2Rel0WHM4X3OqeXZc
	V6/hdH9r25S0AHSAScKXUkx/bbdWIQMdbtLPR+tYFJpvKSsjJ6flf1uV3CQrz7AnXoVI6EtluWu+k
	QITyRxDFW4ryJcGBkhs/LgcogUtR9y20GNY22TMN9AcnAFjqRcfI3UZd7ai2+5IykoOvv3EbibGl0
	TcG50VTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3aLC-00A9r4-0E;
	Mon, 29 May 2023 10:43:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3aL8-00A9oY-1Y
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 10:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685356982; x=1716892982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ug5Jg3/4sbwIlh2QltBO6iJS1rNkCP1duwwxuNqPy5M=;
  b=Vi5kQyG6q2pd6qFEFwQ3aVLmbxgBzCpHMozmPjbxRWYtYT0dBQ+7EMBo
   VYQub8s7jVeuBwkvd4gVwpkl5MN1v22xXM25EqdWAf+ZNwpXkwweZ/J2f
   wlVcfFSdT+J74sDsfYyPeiTIXxI+xPaHwSxFZ286EFVcgOeliXeQAd/xB
   UIVsMxZSCA9LLBhmSwlATfZpvkxLj9r2+7oosmAVMe462F0CcYSZfIVKN
   HtJMGkAJb7IdnLxe6Jml3MN2fCeaofv+I9nhGo9woqRPAHSBnbrPPUQiL
   us5A9LtQMDcY0qpZKks2Vm9CblnV6bmjF+TGcIoaErsEEahSY2J6OJB4Z
   g==;
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="asc'?scan'208";a="215294251"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 May 2023 03:42:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 29 May 2023 03:42:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 29 May 2023 03:42:52 -0700
Date: Mon, 29 May 2023 11:42:29 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 1/6] riscv: errata: thead: only set cbom size &
 noncoherent during boot
Message-ID: <20230529-dispersal-jubilance-db31c377914d@wendy>
References: <20230526165958.908-1-jszhang@kernel.org>
 <20230526165958.908-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230526165958.908-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_034302_524160_04ABD066 
X-CRM114-Status: UNSURE (   7.70  )
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
Content-Type: multipart/mixed; boundary="===============5658959027164530802=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5658959027164530802==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UhbdhvEUKHbFIVls"
Content-Disposition: inline

--UhbdhvEUKHbFIVls
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 12:59:53AM +0800, Jisheng Zhang wrote:
> The CBOM size and whether the HW is noncoherent is known and
> determined during booting and won't change after that.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Makes sense to me,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--UhbdhvEUKHbFIVls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHSBlQAKCRB4tDGHoIJi
0sJKAQCghJ4X0vtB8qoMZ/+dRGa89ITMtCcdetB02d46ok7ZdgEA5T1asK3Ii/b6
i8zQoIUwFFQAYfCaO58yV4Sd3M6aGwU=
=FsUP
-----END PGP SIGNATURE-----

--UhbdhvEUKHbFIVls--


--===============5658959027164530802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5658959027164530802==--

