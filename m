Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471C0E784A6
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 09:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wm9Be8xUxqfCnwyVfdL1pzGWX/wkwBEG3Yt9ucP1ZQ4=; b=U+ur+rwd+zmfja
	4onFa40385ZqK4Wr+OxgBNVk2ChUOUQQ98BsniG7rSDjadwEoG6N/Z5T9uRUOKoq+7IcmI4z9n0tx
	GecxyihO0fT2z8ovSJItI1RVvLfh4ebJtFipRbH58euTWqI+z2Itw2KLB/plyI/0ld4QcXkSwL74V
	LRfyS5KlqxiqO5YLVn3MTxFnMTn7AYGgKMpSKfcyYFvGLmOIK1VY8UDI/X6vQkwHD4/QXdX6o9F9d
	oytAnNUBVPbiOXydlNgY2bulI3l4jnwcQbDYnfQ0U+8qimxOVGG1H0AkOd6k8a/LjGE2k7wDQr4QG
	SQa4kbNQqmwQtGxZBq3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhvj-00000000I2D-1QkK;
	Thu, 25 Dec 2025 09:46:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhvg-00000000I1R-2cjH
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 09:46:45 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0a95200e8so59410925ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Dec 2025 01:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766656004; x=1767260804; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU0H9X7fZm1Z3gPJ02BRt6tSCJ4tBeuL3gl1Fsub/EI=;
        b=Dzk8KGNuLpTKLGqopRM7Vu91Z1w0NCUZzI0mMplFLHbP8aIUl5LRw4pl9DK7aKfNMt
         4g49PWADr3cBIuCZSZxJ56WSF7deoMFcrxz8e6W3Qiwilbm87TOYLgZF5knfa/rPGL4H
         hLtobCpC3lo30AyVi8N8+5r0AQhb1nj4d3EqjpISCXzaZf/SBsQVdJqOCb/mHcANADe4
         PCYrtldkozAW4Vm/EAxw6L8SFctBVxoPlYptMbD4mT7MtUiSYrqqwwaaXME2dQc+InzO
         NbS3ZyvWv2CQhvnu5fAH4T+3SEBswA+Uj/z7mTWEFU/Mje1UXPbDfqHNsZI9JDn5Ykr2
         FOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766656004; x=1767260804;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XU0H9X7fZm1Z3gPJ02BRt6tSCJ4tBeuL3gl1Fsub/EI=;
        b=WowjlQ80UTTfvaMbqm0cFwDFABk8yCQmhLOG0YeYkJexdUj43W5PFirAv7oKkccC4T
         dewCytoFt5JclQQaTgQ3S/dU7gQMiGUCdxBLlPlvbu1cx/oQhUG0SYu3V07ZyYKxVX6P
         /t8EsCezwf7TycjNMG+ZTIvX1Fo8jPKBpHEBLoFc3teGbVHxJJdIvWBGAyT4CCdtsEn/
         Qn7JpGfkP+dXGcAfyG78ITFbaSmZ076aOCKfR75qwIcqtqH9BAgo7ArURAN5kC9G0jOq
         g7/pANJJK1n+gCXU3IvTvWjISpltsrd2+y+0Ta68i22RWFuAiVERCH4mseexYqlhT8id
         OqpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZCM9ms53MjgTzGdUhrVMFvIXQoHpm66A74SDGjDmDgbcYPkkPFYtlUfrRDCfZLbpMdme3HGRRIxiDJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhrW3DpXEOLQTyloobCWL9Z83f7IA3azjXeDstFliKWwEu+Asi
	y0jmVn1OJ9CCzU0kDoWhbrYZw8BCiJeJuUcZdZ8LLqV7p4H2falvgpbp
X-Gm-Gg: AY/fxX4iitjPJq90TmN+m5e05Tcc5w9OmwjSOziNan6qrp57l+VRaAByYzXOsvoSdru
	3e8iK7lpLhrAO39cNiM+HT706wRFYAuRZ+LXZEsEzGdlI6T8fLQNs8QN4RHdAcJ4MlshvwMNK8q
	93Tg6SylRsrEOpmAqr2Ok/5jJ/8eaKMb8NWOsEoIAb9kXIvI0wl4kpwi41BqkGPSxSTTLjcV0j4
	atrMJkF+p9IKZrs5dnCOkXTB7eDXcCwHK7BWiepgRdGji2wI3cVsrq9rgHF0Z6BtL8TpHO41cH2
	KOs629MgmfWB6ro1chkNlRfXqKEUKiLVWbmCqNz5qfXBsDAvNycNtMII9g7a/b8sq8SPvJ5D9ON
	1kOVYngIqySNCIQ9W2IaHUdMLl+V7JnSQM22cjY+hZtNH4klaF3EXxIvYHFQLOI1qmcKpYfFDFx
	pV5/DEAW/dD/6f7zVZKj5h7VGPjhsa9V4MgUUQOfv/KH+pfr0CM11U/pIgdY/SyyPcgnIgG+fEU
	0NV7Fn7QGIZI+voZA==
X-Google-Smtp-Source: AGHT+IG8UD9LuX6bsFFbxzl3hXjRr3x95AGwXzFTFfSvdKzK3Y/lf0Ri78tyAb/BhqSaTEFBEEtJng==
X-Received: by 2002:a17:902:d2c5:b0:2a1:4c31:333 with SMTP id d9443c01a7336-2a2f2222cf4mr208327455ad.19.1766656003365;
        Thu, 25 Dec 2025 01:46:43 -0800 (PST)
Received: from smtpclient.apple (125x103x213x40.ap125.ftth.ucom.ne.jp. [125.103.213.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83961sm177814725ad.38.2025.12.25.01.46.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Dec 2025 01:46:43 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4 6/9] riscv: dts: thead: add DPU and HDMI device tree
 nodes
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20251224161205.1132149-7-zhengxingda@iscas.ac.cn>
Date: Thu, 25 Dec 2025 17:46:26 +0800
Message-Id: <8A7BC047-96F9-4067-976F-282FA2AE8393@gmail.com>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-7-zhengxingda@iscas.ac.cn>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_014644_715637_F22F41E8 
X-CRM114-Status: GOOD (  14.13  )
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
Cc: Drew Fustini <fustini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, "Han Gao \(Revy\)" <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> On Dec 25, 2025, at 00:12, Icenowy Zheng <zhengxingda@iscas.ac.cn> wrote:
> 
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> T-Head TH1520 SoC contains a Verisilicon DC8200 display controller
> (called DPU in manual) and a Synopsys DesignWare HDMI TX controller.
> 
> Add device tree nodes to them.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> No changes in v4.
> 
> Changes in v3:
> - Adapting to the changed binding.
> 
> No changes in v2.
> 
> arch/riscv/boot/dts/thead/th1520.dtsi | 70 +++++++++++++++++++++++++++
> 1 file changed, 70 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index bd5d33840884e..5c0a7072f253a 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -585,6 +585,76 @@ clk_vo: clock-controller@ffef528050 {
> #clock-cells = <1>;
> };
> 
> + hdmi: hdmi@ffef540000 {
> + compatible = "thead,th1520-dw-hdmi";
> + reg = <0xff 0xef540000 0x0 0x40000>;
> + reg-io-width = <4>;
> + interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
> + clocks = <&clk_vo CLK_HDMI_PCLK>,
> + <&clk_vo CLK_HDMI_SFR>,
> + <&clk_vo CLK_HDMI_CEC>,
> + <&clk_vo CLK_HDMI_PIXCLK>;
> + clock-names = "iahb", "isfr", "cec", "pix";
> + resets = <&rst TH1520_RESET_ID_HDMI>,
> + <&rst TH1520_RESET_ID_HDMI_APB>;
> + reset-names = "main", "apb";
> + status = "disabled";
> +
> + ports {
> + #address-cells = <1>;
> + #size-cells = <0>;
> +
> + port@0 {
> + reg = <0>;
> +
> + hdmi_in: endpoint {
> + remote-endpoint = <&dpu_out_dp1>;
> + };
> + };
> +
> + hdmi_out_port: port@1 {
> + reg = <1>;
> + };
> + };
> + };
> +
> + dpu: display@ffef600000 {
> + compatible = "thead,th1520-dc8200", "verisilicon,dc";
> + reg = <0xff 0xef600000 0x0 0x100000>;
> + interrupts = <93 IRQ_TYPE_LEVEL_HIGH>;
> + clocks = <&clk_vo CLK_DPU_CCLK>,
> + <&clk_vo CLK_DPU_ACLK>,
> + <&clk_vo CLK_DPU_HCLK>,
> + <&clk_vo CLK_DPU_PIXELCLK0>,
> + <&clk_vo CLK_DPU_PIXELCLK1>;
> + clock-names = "core", "axi", "ahb", "pix0", "pix1";
> + resets = <&rst TH1520_RESET_ID_DPU_CORE>,
> + <&rst TH1520_RESET_ID_DPU_AXI>,
> + <&rst TH1520_RESET_ID_DPU_AHB>;
> + reset-names = "core", "axi", "ahb";
> + status = "disabled";
> +
> + ports {
> + #address-cells = <1>;
> + #size-cells = <0>;
> +
> + dpu_port0: port@0 {
> + reg = <0>;
> + };
> +
> + dpu_port1: port@1 {
> + reg = <1>;
> + #address-cells = <1>;
> + #size-cells = <0>;
> +
> + dpu_out_dp1: endpoint@1 {
> + reg = <1>;
> + remote-endpoint = <&hdmi_in>;
> + };
> + };
> + };
> + };
> +
> dmac0: dma-controller@ffefc00000 {
> compatible = "snps,axi-dma-1.01a";
> reg = <0xff 0xefc00000 0x0 0x1000>;
> -- 
> 2.52.0
> 
Tested-by: Han Gao <gaohan@iscas.ac.cn>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
