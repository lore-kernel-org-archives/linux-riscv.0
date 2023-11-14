Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFE8C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kxky/40BMKry3Nj4YifVFZdoU1rZwdG5D0zPNlSzoHE=; b=rxNcYVXzoijTqF
	wkpdLdZHoDNGTothVOzEeEamg/Q0tpFi4sJwdCVO/4rHkAanhVgmbbHvrogUkPHC/OYfVG6PAiC7J
	CMPa5DjApjhNonPlN7ZPcgNHNALuNc/X0PMo2jTUuJEIw/EyHsbIa3pGm0gcLhWV5aJv08dAvomo+
	/ecTZ9laDfNqtWNNMpcPu685PyZp3qoYY4pdaFSl9QwCice6pHaqVUXeyAmdJIaTqMkdZQQeLKjIO
	a/RDQV6JRzjADzBAhcoqOdxbWx3CslCO4sDO044t1ZZuRCC9e9OpyCUyo9TtBGxD11/D33kRA+JMi
	HxYMdDOEFxNMTI6UzpWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2usF-00GG64-0Y;
	Tue, 14 Nov 2023 14:58:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2usB-00GG5f-2z
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3884E61309;
	Tue, 14 Nov 2023 14:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A79EC433C8;
	Tue, 14 Nov 2023 14:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699973918;
	bh=0EG0AEP+OoGuvIOQpS68GDDBe/uBCpjeDc5+bp7MX8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0aobSsAdILu3wEY6NGHTWkUN5ZL4RJ7fB806eCXdAcEqEEuvwAom4L+HtjuSTklZ
	 ANBiJltW/qtuqTjPzMhpDpmaGH3t17M/f1gXJ9cWunSTz46oA3s3nOfWJyIalKCJy6
	 tI7wy+Uazfq/RX4ByDdVS+vpPHh2X9j/uH/eTFlnOTiMqxCvLITbY2XzHvDAGWK9+R
	 USxZNZUuyWAhUuOe7jihyWNV0ukCrK4E3zRoY/1bnPMK1mSVRlcuuNbDsyD4iExwPg
	 Xbh2gjsOcWSWa5x21UwbYS4lG9CgnDHcWErZajVjNki9liJDTkFphbQUYpv6TgY+5Y
	 iUfyb8G+YMcTA==
Date: Tue, 14 Nov 2023 22:46:11 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] riscv: dts: cv1800b: add pinctrl node for cv1800b
Message-ID: <ZVOIMy0BB1eVwWup@xhacker>
References: <20231113005702.2467-1-jszhang@kernel.org>
 <20231113005702.2467-2-jszhang@kernel.org>
 <MA0P287MB033298A1F0F1B59CDF110E52FEB2A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB033298A1F0F1B59CDF110E52FEB2A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_065840_070733_EB48FA7A 
X-CRM114-Status: GOOD (  23.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 14, 2023 at 09:38:47AM +0800, Chen Wang wrote:
> 
> On 2023/11/13 8:57, Jisheng Zhang wrote:
> > Add the reset device tree node to cv1800b SoC reusing the
> > pinctrl-single driver.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >   arch/riscv/boot/dts/sophgo/cv-pinctrl.h | 19 +++++++++++++++++++
> >   arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 10 ++++++++++
> >   2 files changed, 29 insertions(+)
> >   create mode 100644 arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> 
> 
> I'm afraid there will not be more cv* chip in coming days. So I would
> suggest you use "cv1800b-pinctrl.h" first here. If we see more cv* coming,
> and if they will reuse the definition here, we can consider optimize the
> filename, what do you think?
> 
> BTW, how about defining the file name as "cv1800b.h" and I'm not sure if you

hmm, cv1800b-pinctrl.h is fine. Only pinctrl related stuff will be put
there.

> will have more macro const definition for other modules?
> 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv-pinctrl.h b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> > new file mode 100644
> > index 000000000000..ed78b6fb3142
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * This header provides constants for pinctrl bindings for Sophgo CV* SoC.
> > + *
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + */
> > +#ifndef _DTS_RISCV_SOPHGO_CV_PINCTRL_H
> > +#define _DTS_RISCV_SOPHGO_CV_PINCTRL_H
> > +
> > +#define MUX_M0		0
> > +#define MUX_M1		1
> > +#define MUX_M2		2
> > +#define MUX_M3		3
> > +#define MUX_M4		4
> > +#define MUX_M5		5
> > +#define MUX_M6		6
> > +#define MUX_M7		7
> > +
> > +#endif
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > index e04df04a91c0..7a44d8e8672b 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > @@ -6,6 +6,8 @@
> >   #include <dt-bindings/interrupt-controller/irq.h>
> >   #include <dt-bindings/reset/sophgo,cv1800b-reset.h>
> > +#include "cv-pinctrl.h"
> > +
> >   / {
> >   	compatible = "sophgo,cv1800b";
> >   	#address-cells = <1>;
> > @@ -55,6 +57,14 @@ soc {
> >   		dma-noncoherent;
> >   		ranges;
> > +		pinctrl0: pinctrl@3001000 {
> > +			compatible = "pinctrl-single";
> > +			reg = <0x3001000 0x130>;
> > +			#pinctrl-cells = <1>;
> > +			pinctrl-single,register-width = <32>;
> > +			pinctrl-single,function-mask = <0x00000007>;
> > +		};
> > +
> >   		rst: reset-controller@3003000 {
> >   			compatible = "sophgo,cv1800b-reset";
> >   			reg = <0x03003000 0x1000>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
