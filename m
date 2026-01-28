Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB514D46BF8
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyOLNszkhf5bvCG9OXXgrzaKdwdyd2q5f+bVoy+tfiY=; b=M15LbFB/APOz0x
	XrWDDdDUKmAYx1ay2jb7wle8UtuRAwdZpwE0BGk6nejcX5VCvVEQuTDsg7RjPJB7TGrOUoxt8m+rd
	/25zZ4gkekDS8fVxjUu2vKNnWlzPsfyRKEnXkk4XxqLRMhHubA6Z4G9ikMXoc5Pn29ULNUWDamlQ6
	nUy9ezUZYrfPGYoga6/DDdEOCiFpvKl24bQaX9nrcHSdRj8C3bJo/sjVX5eatWVHZylt4wpsys+Qh
	pkjve9g6KXnTODnFshtLuVDil1LGohh8PxcDmI/zqTNATgYCvDSFDjbXVCMIk1RWbj9xO1MgtflfP
	Fdmmc+slwFJ7JQ+R5XSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC3p-0000000GjeU-1juD;
	Wed, 28 Jan 2026 20:22:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC3n-0000000GjeL-1HrE
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:22:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 329096001A;
	Wed, 28 Jan 2026 20:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76572C4CEF7;
	Wed, 28 Jan 2026 20:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769631761;
	bh=0ZVDhWmgwKp4rlcvX2aKmM2j+CKQarrY0wx8Yr1T3gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AM+gi55FMtmu+sZWz5UCYToHW91vi1dLcVwaSCwUs+ZRHjJKk/OachpAOXJwOvwgh
	 d3fe1JkJgN+MB1D7ONNrCBUi2RMl6ZCY2ffx/zlUC/LlMB7jViNt0zupQpFT+KQ7MS
	 sNefVfy6T7pPFzmbosaD6BhIU6q/P6qweBvXxvWYa0XMKtskmTcSoCMeW4T+YD/fsh
	 cjsbnqmIcUcM13qvAFaBYWawYsOC4/fw+BPRDFICPdhA8hN6c+pLkkLSQzCu2rJBaB
	 F27XPMZ+sffeXhw39fStjF1iD02B2JDlg7/VYeXphh0eIURqnfOnVKg6dXNdpCRE/K
	 7pLmiZckSQJHA==
Date: Wed, 28 Jan 2026 12:22:40 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v6 1/9] dt-bindings: vendor-prefixes: add verisilicon
Message-ID: <aXpwED5wSZbnIjae@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-2-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123092830.4046009-2-zhengxingda@iscas.ac.cn>
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
Cc: dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 23, 2026 at 05:28:22PM +0800, Icenowy Zheng wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> VeriSilicon is a Silicon IP vendor, which is the current owner of
> Vivante series video-related IPs and Hantro series video codec IPs.
> 
> Add a vendor prefix for this company.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> No changes since v4.
> 
> Changes in v3:
> - Add Rob's ACK.
> 
> No changes in v2.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index c7591b2aec2a7..18f931f369198 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1745,6 +1745,8 @@ patternProperties:
>      description: Variscite Ltd.
>    "^vdl,.*":
>      description: Van der Laan b.v.
> +  "^verisilicon,.*":
> +    description: VeriSilicon Microelectronics (Shanghai) Co., Ltd.
>    "^vertexcom,.*":
>      description: Vertexcom Technologies, Inc.
>    "^via,.*":
> -- 
> 2.52.0
> 

I've applied the bindings patches (1, 2, 4) to thead-dt-for-next as well
so that 'make W=1 dtbs_check' won't break for the next release of
linux-next.

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-dt-for-next

I wouldn't normally pick bindings patches but it is a short timeline if
we want to get some testing done in linux-next before sending v6.20 pull
requests. I have created an immutable branch thead-dt-v6.20-dpu-hdmi in
case that helps.

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-dt-v6.20-dpu-hdmi

I can drop the yaml patches from thead-dt-for-next if people think that
was the wrong thing to do. If we think that the driver changes won't
actually be ready for the merge window, then I can drop all these
patches from thead-dt-for-next.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
