Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AEEEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 21:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wo8gpxZglyhtdDLTEDo6xtVaPTM4WNS7SHXywP+TOBE=; b=T2R7CuSqtcc2udY+x6MaEg1U3d
	U5eKuOLw6lI7MpgyZUayQr8tS9+vxGYIvsaq6RGgJ10ZJ7xzTyC/Py7cE1/Zs+KmtY20RX4fAXYoQ
	+KqNEvWso79GF7vSdhPGEeEQrigmo8HXZpQkIuzcfvCvNDyW/Lys9HsW3WZ4ChAmfAfKs/wvZVhlh
	p0w31LSadhc343T7vObwkYslNOEpMFPCCOSxWuzAjw278CtHrHgCyTaSPxeXwNGOom/qz9RQXCd+i
	j7ch3PaF8ZVbv/YhdGITcSNgf39QzvkKXWbk5TWcVPV0okzlOzy8/PuzjFNVZ0PivZLxKV0YcaQng
	/ubbS6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWpV-002lbA-1C;
	Thu, 06 Jul 2023 21:48:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWpT-002lac-1k
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 21:48:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EFE966119F;
	Thu,  6 Jul 2023 21:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54FBC433C7;
	Thu,  6 Jul 2023 21:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688680077;
	bh=xPrfRcwCRWC8Llb+km158meSUnx/aUoWRQHVf7QPSD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAhL7nRvZdJjZc1TRFxME0hOxF3jF0zIKdmHya+NPBeqY+EvFCcFv846VS7ljNuke
	 MuQIumpBm39nMXf1dFSdz7HrCSm1LTT3fILV2yUTozmKohP/RDdgry9aZaK/az4Duv
	 AilGMvlXl4aSW4uveXErqrylfjBuyzty4JdUU3nInpNNEIk4wa6MSXbsgyhF8MSKiT
	 lUzdEk0k+IjcZSmG3UrJZrMWx8tbHw7mJQ4Sy/7RlZsy8uuGuL4YOb8lK/rkAcQl6s
	 9nytGtIswe7e+VSMETihiu1Vyxm+ohgN5wQ2o6q3WrrTpGptIu9KYpM4UuS2h9p2MH
	 YTDk3Db3Ot3Qw==
Date: Thu, 6 Jul 2023 22:47:50 +0100
From: Conor Dooley <conor@kernel.org>
To: ron minnich <rminnich@gmail.com>
Subject: Re: [External] Re: [PATCH v3 0/4] Obtain SMBIOS and ACPI entry from
 FFI
Message-ID: <20230706-barcode-front-5bed954740a7@spud>
References: <CAMj1kXFZren0Q19DimwQaETCLz64D4bZQC5B2N=i3SAWHygkTQ@mail.gmail.com>
 <mhng-b66b085a-eb15-4c9b-b2aa-93ddf16ec7aa@palmer-ri-x1c9a>
 <CAP6exYKwZG=_47r0jAUFYNL5-P-SS==k6vWdKiMJ9nB0upH5Zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP6exYKwZG=_47r0jAUFYNL5-P-SS==k6vWdKiMJ9nB0upH5Zw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_144759_625966_2ACEED3C 
X-CRM114-Status: UNSURE (   8.04  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, kernel@esmil.dk, rafael@kernel.org, lpieralisi@kernel.org, cuiyunhui@bytedance.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, geshijian@bytedance.com, tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-acpi@vger.kernel.org, lenb@kernel.org, jdelvare@suse.com, Paul Walmsley <paul.walmsley@sifive.com>, allen-kh.cheng@mediatek.com, jrtc27@jrtc27.com, angelogioacchino.delregno@collabora.com, weidong.wd@bytedance.com, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, yc.hung@mediatek.com
Content-Type: multipart/mixed; boundary="===============5478908539490951274=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5478908539490951274==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WZJy3m/uHxS6AiTK"
Content-Disposition: inline


--WZJy3m/uHxS6AiTK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Ron,

On Thu, Jul 06, 2023 at 02:39:13PM -0700, ron minnich wrote:

Please do not top-post or send HTML mails to LKML, they are rejected by
the list services.

Thanks,
Conor.

--WZJy3m/uHxS6AiTK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKc2hgAKCRB4tDGHoIJi
0ijoAQDzRpg7JkYw/5I203sH/zXQQ9kYceHTa7UL1EoZ+xkISgD+MQg+3shNDOQf
8p3zeQ4LDq9AuZwGqv1MRO8l5/YPHQM=
=dE3s
-----END PGP SIGNATURE-----

--WZJy3m/uHxS6AiTK--


--===============5478908539490951274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5478908539490951274==--

