Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B59C5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fw2QtUegZu+xQ/kGRPSGMaUN+3ojWb86VMZRVgLEE3Y=; b=X+pGkdmkNlRXio
	+JFrduUzxD8svZJ9iPW5snTGaIlxkcCXQ0F6/uqddCiusuzPLj1B55W85ts+HKBZBHCOhUmMy4eBE
	dhhPldKb9lxjNrYfmFtIL6ZDgAMrVCOvMrd8EqTE/PJsPxKhAOxbGSZ70Y0VLY4I3sNdDkzZLoyBP
	7syaJGMxWBm2AA9WsuW37iP6rqnher+nHqKNIX3YMbyo7angOKvwk8bfd5J0EYqsQjIgwXTOMDcsV
	xgMwU/IOiddeMxPN2/ckZU1u1u+gsEWfZDcKX4iit1T4UJFGOpzgjDHLlCN4qJNG0LdF2iGspgAPZ
	kdaJDY6qxhZA42INXWhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRal-0000000B1Oq-3dWi;
	Tue, 03 Jun 2025 13:22:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRaj-0000000B1Nj-2fUk
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:22:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BAAFCA501FD;
	Tue,  3 Jun 2025 13:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0281C4CEED;
	Tue,  3 Jun 2025 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748956928;
	bh=AeP+iL5P7qpLgfVgmLcOenednHQMm95Ci593umBxRE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NzT5xA3OmAdEgRSvkvLt9CI1a+FbVuq2tkARJG7t186qPTmQtIBAqDj3Riq4lYU3X
	 hh7augS36aqONwII4MdyqFp8Cm0MD4oq5vTNoinNv5wPB7eOOpd536RG+bbiYTK5fU
	 K66Hai7QwRu4Vd/vvPeiQ7XJul0Soe/BtUzqMzGPus5AxEvZiewHu58dhX+CGt2Ex6
	 RKOYR23e8jQSTbxbSF6/Pc9+FiFjqXXDCViGzSGgQpFpHdXF8nKtO0GZoXA+SHtT5r
	 abxL40K0qMXZ0aTcHfXbJ+gjEz+wN6rXdMoxE5XeYkzO8gooxbgalqtlwh4GoCAvzF
	 KjN/DUfmd3fRQ==
Date: Tue, 3 Jun 2025 15:22:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 6/8] riscv: dts: thead: Add GPU power sequencer node
Message-ID: <20250603-gleaming-mammoth-of-kindness-538add@kuoka>
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222408eucas1p20f62cea4c9c64bb5dda6db1fd38fb333@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-6-83d5744d997c@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250530-apr_14_for_sending-v3-6-83d5744d997c@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_062209_743232_A9F56384 
X-CRM114-Status: GOOD (  16.33  )
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

On Fri, May 30, 2025 at 12:23:53AM GMT, Michal Wilczynski wrote:
> Add the device tree node for the T-HEAD TH1520 GPU power sequencer
> (gpu_pwrseq) to the th1520.dtsi file.
> 
> This node instantiates the thead,th1520-gpu-pwrseq driver, which

Explain the hardware, not what drivers do.

> is responsible for managing the GPU's power-on/off sequence. The node
> specifies the gpu-clkgen reset, which is one of the resources
> controlled by this sequencer.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index bdbb1b985b0b76cf669a9bf40c6ec37258329056..6170eec79e919b606a2046ac8f52db07e47ef441 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -238,6 +238,12 @@ aon: aon {
>  		#power-domain-cells = <1>;
>  	};
>  
> +	gpu_pwrseq: pwrseq {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "thead,th1520-gpu-pwrseq";
> +		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
> +		reset-names = "gpu-clkgen";

What is the point of pwrseq if there is no consumer/user of it? Looks
like simple placeholder and anyway maybe the future consumer should just
use reset directly.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
