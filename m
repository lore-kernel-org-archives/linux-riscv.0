Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C737606A325
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 17:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cRl62tJ2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BaCdGxpI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nMz4xUiBsnUgb8TBI+gjm0E+Ghdqs1kewNkQ/LXPihM=; b=cRl62tJ2g2tzExdTY/0x1naQKm
	qre4ouNE+x+qeeSGBVUhT3qI74E+F+pxZO+YQZ5or1CbnOoJs0TDZRGS5NFbdmGQxvUan8hPpOgab
	J5QdtcKalhDih1dYRIn04Fk+Gk/9xVVvOvddk2R5Fax7qrBlqaqQsuS84oN/lzqnSdOKx2QUGmyur
	H5NeIxTk30kKjUMAeDj6qBc9jz/z9Oc2PmHnxW5p7sSPQhNrJnSlQjPM51bCzLaqwdbLkWUQr6llI
	DP5RoMyvzFyEcRP84/UNGZ1BBfsppA6c8NhuC+Oqc/K3V6UiIwci8i176AIRBhNq0Ac6TMIt+F6no
	rlZT1eXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMq0S-0000000CBhP-2jH6;
	Fri, 30 Oct 2026 17:03:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMq0R-0000000CBgz-1qnp
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 17:03:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46905601EE;
	Fri, 30 Oct 2026 17:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DD51F0093A;
	Fri, 30 Oct 2026 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793379786;
	bh=xsarIZJL4PEc9Bxn42jOu8TJETM+T2V8nUbleqFixHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BaCdGxpId/gMQjXhzIEWh4taJZzC1v4DRG0gg8E43qkw07Rv3yW3BvtakGav2a2dI
	 +tsT6KlAuQPRfrlQUmEDQ++wiSjh3oL/1G7V2AGQSLpfmXbknma4B6SA5f6SajBy/H
	 PMNf4PxgUFXkMhQZQ1RDxH1YtTyWnXBHa6UWepe4qm25dU4Qj56p95ALEj7/VzpZRr
	 OkFtso6ZHZbCibRn8fHfQenEeDBBY7W5GCoUZnVBhqzEL7FF8l9QXLSKFo9D1ebxTf
	 tuQh6e87oDfEhBucVEdX83CE49zlxJwG3sOJTEUm8J92VGXJIr7/aHbe8UdHc51GUT
	 czucnDKw3Ajbg==
Date: Fri, 30 Oct 2026 10:03:04 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <me@ziyao.cc>
Cc: Han Gao <gaohan@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] riscv: dts: thead: add Milk-V Meles
Message-ID: <auTNyLqjBVgt2enA@thelio>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
 <20261001-rv-meles-v2-2-c61052262f84@iscas.ac.cn>
 <asbBtj3fL0PUNGJ-@pie>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <asbBtj3fL0PUNGJ-@pie>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 07, 2026 at 10:03:34PM +0000, Yao Zi wrote:
> On Thu, Oct 01, 2026 at 03:44:11PM +0800, Han Gao wrote:
> > Add the Milk-V Meles board with UART0, eMMC, SD, Ethernet and the PWM2
> > fan. Describe the board pin assignments and the PHY on the GMAC0 MDIO
> > bus. Give GPIO banks aliases and name the exposed 40-pin header lines.
> > 
> > The eMMC I/O supply is fixed at 1.8 V. Enable DDR52 at that voltage and
> > retain the 52 MHz board limit. Describe 8 GiB as the default memory
> > size; firmware updates it to match the detected RAM capacity.
> > 
> > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/boot/dts/thead/Makefile               |   1 +
> >  arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 227 +++++++++++++++++++++++
> >  2 files changed, 228 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/Makefile b/arch/riscv/boot/dts/thead/Makefile
> > index b55a17127c2bc06cbfb06d5f7c92dc7296e98437..25f7fe068368c97df2490bedc3eae70276a2e442 100644
> > --- a/arch/riscv/boot/dts/thead/Makefile
> > +++ b/arch/riscv/boot/dts/thead/Makefile
> > @@ -1,2 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  dtb-$(CONFIG_ARCH_THEAD) += th1520-lichee-pi-4a.dtb th1520-beaglev-ahead.dtb
> > +dtb-$(CONFIG_ARCH_THEAD) += th1520-milkv-meles.dtb
> > diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3714047190789bfccd8ff6810342d7ff865e74e4
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
> > @@ -0,0 +1,227 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2021-2022 Alibaba Group Holding Limited.
> > + * Copyright (C) 2026 Han Gao <gaohan@iscas.ac.cn>
> > + */
> 
> ...
> 
> > +&emmc {
> > +	bus-width = <8>;
> > +	max-frequency = <52000000>;
> > +	cap-mmc-highspeed;
> > +	mmc-ddr-1_8v;
> > +	non-removable;
> > +	no-sdio;
> > +	no-sd;
> > +
> > +	status = "okay";
> > +};
> 
> Could you please explain the 52MHz limitation? This doesn't match what
> I saw at RevyOS' downstream kernel, which seems the only distribution
> supported by Milk-V officially.
> 
> Regards,
> Yao Zi
> 
> [1]: https://github.com/revyos/th1520-linux-kernel/blob/a092d55649279e1c9bcda2769b8f6b4370fa2c94/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts#L1012-L1023

Sorry about not following up on this sooner.

Han Gao - could you explain what the motivation was for 52MHz?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
