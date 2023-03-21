Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C9AC6FD20
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1p+FTI5wtSGPGgcFVThFiTAh9y7LbSamHY5ijXUNXs=; b=ESvTyQMDMLFi/Z
	F5qzhQ7wXwawHwqCZCap41xGyuPpm7PAxXfCFICiuWPdJsJ8zjOe6ZQP1rg9GVp7B9yGud/zZc1ur
	OL0Yd3hsFVS3LcjJ+8omM9VT4FT49/ybe9iA8s7YNyDPQazUR3PK57aGEHzl0jfQ2irxknnqsECoU
	V8bX2mvk7tyMtMtJDFFU+GC1FfehgvpSnr6yvkzv3BzxOigypuCfWuNP7XszD9asVdz8b3MzS/BSI
	XrT5X8nfnsWWVXrRcTe1LS2Ivxq4iMTtCJ4TOrIROwYA6nVgoyc4+4vknImNgz9Cma3JFCcZQaCMj
	zxnldaClGKAnSt9xTV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peiYi-00Dh54-2z;
	Tue, 21 Mar 2023 20:26:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peiYf-00Dh3H-2F
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 20:26:15 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1peiYQ-000417-2m; Tue, 21 Mar 2023 21:25:58 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@rivosinc.com>, Evan Green <evan@rivosinc.com>
Cc: slewis@rivosinc.com, Conor Dooley <conor@kernel.org>,
 vineetg@rivosinc.com, Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Bresticker <abrestic@rivosinc.com>,
 Celeste Liu <coelacanthus@outlook.com>, Guo Ren <guoren@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject:  Re: [PATCH v4 3/6] RISC-V: hwprobe: Add support for
 RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Date: Tue, 21 Mar 2023 21:25:56 +0100
Message-ID: <22291092.EfDdHjke4D@diego>
In-Reply-To: <20230314183220.513101-4-evan@rivosinc.com>
References:  <20230314183220.513101-1-evan@rivosinc.com>
 <20230314183220.513101-4-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_132613_833874_91421644 
X-CRM114-Status: GOOD (  10.76  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Dienstag, 14. M=E4rz 2023, 19:32:17 CET schrieb Evan Green:
> We have an implicit set of base behaviors that userspace depends on,
> which are mostly defined in various ISA specifications.
> =

> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

This needs one fix, described blow, with that applied:
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>


> +	case RISCV_HWPROBE_KEY_IMA_EXT_0:
> +		pair->value =3D 0;
> +		if (has_fpu())
> +			pair->value |=3D RISCV_HWPROBE_IMA_FD;
> +
> +		if (elf_hwcap & RISCV_ISA_EXT_c)

This wants to be =

		if (elf_hwcap & riscv_isa_extension_mask(c))

i.e. elf_hwcap is a bitmap, RISCV_ISA_EXT_c is the number "2" and
riscv_isa_extension_mask() will get you the shifted bit.


> +			pair->value |=3D RISCV_HWPROBE_IMA_C;
> +
> +		break;
>  =

>  	/*
>  	 * For forward compatibility, unknown keys don't fail the whole
> =


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
