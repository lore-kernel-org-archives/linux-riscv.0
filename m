Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF6606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 01:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i9HhCPWF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eswincomputing.com header.i=@eswincomputing.com header.a=rsa-sha256 header.s=dkim header.b=GcNzir3O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bQcB7BMDsXju0eDN8zYaeQ+oqG4FkHgTakNRzUXtmqE=; b=i9HhCPWFBNQ2cZoQ6Z+eewGgU1
	S3mWmK2U7sRwqmr+h7qA1WmSejC+Y/OZQdsgu8yRXRJxK8lHUK3UkS7/vEZCf5VEQBWnLYEGJHp7I
	MB4UK1N6pJOVNe+x/iWn7pqecD3kbd9LmJqd1ekMG9/kOrY21AWi44l7jSooN9M8Xhf3LN1IGBLnE
	1BTV+5dhqqyufnVyS7ljNIt40Ther3kNmLPVSfRI7OBhB9dQphTFFYtNKTcRWVPSGxvs96C2Nv//x
	XJRfby/r6JGLduYYJxEkt03QpwVrbQX/Gdha7U71A4ulLLP6MJyeevy8BK6797Os0uq5jrEUlWksJ
	kiEzZFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrKT-0000000AekZ-38S0;
	Thu, 19 Nov 2026 01:52:49 +0000
Received: from azure-sdnproxy.icoremail.net ([52.187.6.220])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrKQ-0000000Aejz-3lfu
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 01:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=eswincomputing.com; s=dkim; h=Received:Date:From:To:Cc:Subject:
	In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID; bh=AtyI6ok3Vi6DM9HN4m7xODIlo4sq1C3Mwjjp
	S7DX8MQ=; b=GcNzir3OMybN36pC9Rb1efXHqgzIRLNyT9470N0pz/pHEWGBooSC
	y/ZgE/73OWkrEMT4JiIostIx8taYEBG1IgVOSXTxjLOplYPpJL0UI+x9VQz9SA+A
	DS4EAQc/36vt9CdGFSGWA1bsCiCHjeyZYRMOVpIF0iiTl5+o0JUpv4E=
Received: from linmin$eswincomputing.com ( [10.10.96.205] ) by
 ajax-webmail-app2 (Coremail) ; Thu, 19 Nov 2026 09:52:37 +0800 (GMT+08:00)
Date: Thu, 19 Nov 2026 09:52:37 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Min Lin" <linmin@eswincomputing.com>
To: gaohan@iscas.ac.cn
Cc: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>,
	"Pritesh Patel" <pritesh.patel@einfochips.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>, "Han Gao" <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: eswin: Add Milk-V Megrez board
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20261118-eic7700-megrez-v2-2-0113ebc5b670@iscas.ac.cn>
References: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
 <20261118-eic7700-megrez-v2-2-0113ebc5b670@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <7edd04e5.a5d.1a1f1817c2c.Coremail.linmin@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TQJkCgA38xxlVv5qBywAAA--.133W
X-CM-SenderInfo: 5olqzx3q6h245lqf0zpsxwx03jof0z/1tbiAgEQCWr9068ImgAAsj
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_175247_267153_2131CF2D 
X-CRM114-Status: GOOD (  13.74  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> -----Original Messages-----
> From: "Han Gao via B4 Relay" <devnull+gaohan.iscas.ac.cn@kernel.org>
> Send time:Wednesday, 18/11/2026 04:00:06
> To: "Min Lin" <linmin@eswincomputing.com>, "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>, "Pritesh Patel" <pritesh.patel@einfochips.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
> Cc: "Han Gao" <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, "Han Gao" <gaohan@iscas.ac.cn>
> Subject: [PATCH v2 2/2] riscv: dts: eswin: Add Milk-V Megrez board
> 
> From: Han Gao <gaohan@iscas.ac.cn>
> 
> The Milk-V Megrez is a Mini-ITX board based on the ESWIN EIC7700X SoC.
> 
> Add a minimal device tree that enables UART0, which is connected to the
> USB-C debug port through a CH340 USB-to-UART bridge, and use it as the
> serial console.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/eswin/Makefile                 |  1 +
>  arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts | 25 ++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/eswin/Makefile b/arch/riscv/boot/dts/eswin/Makefile
> index 224101ae471e8d89996f7cbfc616425f704af37e..5daade822e15eda43eee111cbf89bc386bb06f32 100644
> --- a/arch/riscv/boot/dts/eswin/Makefile
> +++ b/arch/riscv/boot/dts/eswin/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_ESWIN) += eic7700-hifive-premier-p550.dtb
> +dtb-$(CONFIG_ARCH_ESWIN) += eic7700-milkv-megrez.dtb
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts b/arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..a57cb61171087b20a39eb962f9c45d9c8ded3925
> --- /dev/null
> +++ b/arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2026 Han Gao <gaohan@iscas.ac.cn>
> + */
> +
> +/dts-v1/;
> +
> +#include "eic7700.dtsi"
> +
> +/ {
> +	compatible = "milkv,megrez", "eswin,eic7700";
> +	model = "Milk-V Megrez";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> 
> -- 
> 2.47.3
> 

Acked-by: Min Lin <linmin@eswincomputing.com>


Best regards,
Min Lin
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
