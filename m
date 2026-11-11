Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CD6606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 00:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TcgcJmCH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WM6outSp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XmdxMR5p1/hK9UpoeyIKpA6tUGnon4PnmKqZxcEcVyE=; b=TcgcJmCHjRQyRUBWCYtbeE+mto
	CtPhb9B+b5elwxV65Fc6w/IhH/DD5Y8JEeVJ/HeJ+lhokQ52L+krs6F9KbDH8pB8B4nU150CM8568
	6YEKLgXoetuItk/4jXMRUTbqnHaj7KUIhhj3XNPCqY92nqr722ov3Vp8Xw24patIya3vAKz3I6631
	cYcSXmHll3vmIy4gyyOIBqiFGptr4pFneRF6xRJYPCBdkHQSiI6PLd7Twi/mN8NXCdtkFUDqI+rqn
	tOeiqnBEIVuBtGuxOypoJ5iDehuFr9jAlDV1QL3NFS/EjHSuSLa5Zt2WcnNjRUkQtWnHwqMVpUANp
	VcLf8bcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwV0-00000005L25-01dG;
	Wed, 11 Nov 2026 00:47:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwUy-00000005L1x-0fbm
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 00:47:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63A7F417D0;
	Wed, 11 Nov 2026 00:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C640F1F0089F;
	Wed, 11 Nov 2026 00:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794358055;
	bh=POqYBqnjCDXSJMErzTHxYJeAhCAZrSEkM0W036mr0l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WM6outSpn9srJTdlP80y9RSw+u+bI42TfmY8rOxOBIBFkH2+zZ9al2xsJVdmy2cKl
	 MU0sSVdkBnD02MA/xy1279U/64ZTOQ4czNbbyMLWZZz6mk5iD1a00QVM2VmPwTOUbR
	 ZF1xG1Tzzcmt2RmGYjSb18XhJrWbgrPDExiDFLorRcZx6DeOW5OE7FSJP6jYufwJXw
	 IVx86JI0jYvZJZBpCqJH0hwDyURY2yqHYhIUVsQA87yxjwhfNWkXmBZK7kIu4Z5J5h
	 pQygmpBw2U6W/sPza04838xo9erGSx0ACqeDpjESbKDNSIj/Lr51MqBwjaqYz16EIn
	 Zbdp9el4fJtzw==
Date: Wed, 11 Nov 2026 00:47:32 +0000
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] riscv: dts: spacemit: k1: add PowerVR GPU device
 node
Message-ID: <20261111004732-GKB2005@kernel.org>
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
 <20261015-orangepi-gpu-v1-1-03566a615660@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261015-orangepi-gpu-v1-1-03566a615660@gmail.com>
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

Hi Iker,

You could drop "RFC" prefix next time..

This patch generally looks good, while note that it has to
wait for power domain to be kicked in

On 20:56 Thu 15 Oct     , Iker Pedrosa wrote:
> Add device tree node for the Imagination Technologies PowerVR Rogue GPU
      ~~~~~~~~~~~~~~~~~~~~ drop, it's redundant and obvious

> (BVNC 36.29.52.182 / BXE-2-32) found in the Spacemit K1 SoC.
> 
> The GPU is located at address 0xcac00000 and uses:
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        drop, too much detail and not really worth mention in commit message

> - CLK_GPU for core clock from APMU controller
> - RESET_GPU for reset control from APMU controller
> - K1_PMDOMAIN_GPU for power management from syscon_apmu provider
> - IRQ 75 for interrupt handling
> 
..
> Disabled by default; boards enable it individually.
> 
As GPU is integrated within SoC, I'd rather see it enabled by default,
so will not only one specific board befenit from this patch,
besides, I see no reason why people should disable it by default?

> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 3fabfd34114b..82cade2f76fe 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/clock/spacemit,k1-syscon.h>
>  #include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/power/spacemit,k1-power.h>
>  
>  #include "k1-pdma.h"
>  
> @@ -1119,6 +1120,17 @@ multimedia-bus {
>  			#size-cells = <2>;
>  			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
>  				     <0x0 0x80000000 0x1 0x00000000 0x3 0x80000000>;
> +
> +			gpu: gpu@cac00000 {
> +				compatible = "spacemit,k1-gpu", "img,img-bxe-2-32", "img,img-rogue";
> +				reg = <0x0 0xcac00000 0x0 0x80000>;
> +				interrupts = <75>;
> +				clocks = <&syscon_apmu CLK_GPU>;
> +				clock-names = "core";
> +				resets = <&syscon_apmu RESET_GPU>;
> +				power-domains = <&syscon_apmu K1_PMDOMAIN_GPU>;
..
> +				status = "disabled";
as if agree with above comment, drop this line and patch [2/2]

> +			};
>  		};
>  
>  		network-bus {
> 
> -- 
> 2.56.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
